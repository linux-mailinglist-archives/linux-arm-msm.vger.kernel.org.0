Return-Path: <linux-arm-msm+bounces-31607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAC976AD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 15:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF84B1C22B40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 13:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2988219FA91;
	Thu, 12 Sep 2024 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SrauZmwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7230320E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148343; cv=none; b=fCeFLnnTlZBAyikrBGdvFo/b0NL0VekdKzhdJ2kN899Zm0XH05xFDg6Z8eX2HHPjBupr6dwt4yl3G1G8ONlJgWvDUVRn0tstRe6jr+0/Z7km11MLqZK3NbanPuKgoKX5n3KdJL7NDAGfuvcJ0bIWakZ1g81z7cuKSw6kaqL11P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148343; c=relaxed/simple;
	bh=XXqWO2yT//ii9l3KRjQXPc8FLHim6ZQatV7xee+2n/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDUc94YPnpQqO7BUDnIqNQOmU73zVvmZztaThRkZhtjtkvcCPgyhlyGU7Sp3gcmEQ117aFfDj1Y5lwPzfhlD9Yi9JgsSgLNrt+RhxXrBVH/Ja9xj1wbz+5ejwYaM5mL3F2MHO3RohTSY47XAWJQsE90QQ9HgyUhDHAzBHKa1Les=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SrauZmwi; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e1d74e6c8d8so882326276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726148340; x=1726753140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ROrVvxpUOVpCOqDUYbk+Dw5AAWa4u/uZvSb0nkfTT0=;
        b=SrauZmwimIXsbi3eSM+0Htgj+O0TweNiDPgjMgOPKwS1GHvzXLmQWJWXo3m0JJq14r
         qmN57o8UraMAK5/QiotM05uYDOXNWBj9gmSQB+WTZwG4AJ5FgkZRVEMEfe0OxA5kje2Y
         mUBy9KE3JXu79DrhaKeptjd7hFNAqAPpgF0Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726148340; x=1726753140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ROrVvxpUOVpCOqDUYbk+Dw5AAWa4u/uZvSb0nkfTT0=;
        b=lul1pRovKHHsNfPB7wtvC4mb/uUzolL/KqfIwVJo4pEcehMmvRVIsSn6OBbPxga0Sn
         dqRvjPWQFjX8llAN+W8r3P54lP29PzTWia4DCUwviOjw+/u3+ERvvj2jomifIchO3dNY
         H0lKiMm4jlIuXCqZ3jpvzdY4oc8g00ssu4fKEvcIceFfHd43osUY2P4B8PmWuq/Q3Gb3
         Bz7she08OWCXK2BlDieFZ/HHVOQhN4bXxZDhm/sKgt3aY0/qTHWmJ/ripAil29Wq92ob
         itWjYi7IBRXUnw4ugPOfRWJ2QejaRINr+KWwRnMeTbMPcaNe4Hs6YDut4CwGftgDdjNN
         qsvw==
X-Forwarded-Encrypted: i=1; AJvYcCXLsex63lZhi3YRKprKkZBHdCeBeayvICODhdHfSYhtv0c7/r++bB3fODspZjv7ZlZ84onO9tw3AyQYPmzm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+EPG/KvcwY6C72fF/WaDmjb+6zR0+BJzhSIi+vRDXPFXBNfvu
	8XNKh5TwBxjoATJjKRUi2MPehG4WyyjbJ+tvY0SHNXvZNR3GR0k0zo+fMa9NjknwaqFieuTEfJk
	=
X-Google-Smtp-Source: AGHT+IHhkJp2NofPRCpDc/Hsj2aTOBDO/mslTKHaVfKh3QLk6Ri3JuqQOExQ3v18udPYhtDlbBhktQ==
X-Received: by 2002:a05:6902:2e0b:b0:e05:7c38:1085 with SMTP id 3f1490d57ef6-e1d9dc3cba4mr2010104276.41.1726148340046;
        Thu, 12 Sep 2024 06:39:00 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53474d6a2sm54115946d6.90.2024.09.12.06.38.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 06:38:59 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c54b1f52f7so5863306d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 06:38:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUA8h0+BFZZuwTqKC9QI5oHZFxBQHZfLNRiSMkGGqWnu+VmLloSUOWSfNzPi3CebW16FS1w4mfaraHZKroS@vger.kernel.org
X-Received: by 2002:a05:6214:2b97:b0:6c5:50ed:ac3d with SMTP id
 6a1803df08f44-6c57351b1ccmr42400066d6.16.1726148338348; Thu, 12 Sep 2024
 06:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909132810.1296786-1-ruanjinjie@huawei.com>
 <20240909132810.1296786-4-ruanjinjie@huawei.com> <CAD=FV=XQ7uf_Y_WTv_6-DX1Mo=+RycKSyxf=E-f3TOKiuE5RMA@mail.gmail.com>
 <c662f0b9-31dc-8b97-ef3f-ea33f9fc62af@huawei.com>
In-Reply-To: <c662f0b9-31dc-8b97-ef3f-ea33f9fc62af@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Sep 2024 06:38:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+kc1rKSDDo-Zx+CiuapoJ8izrCW0Wh-PfR7ivY_4bXw@mail.gmail.com>
Message-ID: <CAD=FV=U+kc1rKSDDo-Zx+CiuapoJ8izrCW0Wh-PfR7ivY_4bXw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] spi: geni-qcom: Use devm functions to simplify code
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: broonie@kernel.org, akashast@codeaurora.org, vkoul@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 11, 2024 at 8:53=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> >> @@ -1132,6 +1134,12 @@ static int spi_geni_probe(struct platform_devic=
e *pdev)
> >>         if (ret)
> >>                 return ret;
> >>
> >> +       ret =3D devm_add_action_or_reset(dev, spi_geni_release_dma_cha=
n, mas);
> >> +       if (ret) {
> >> +               dev_err(dev, "Unable to add action.\n");
> >> +               return ret;
> >> +       }
> >
> > Use dev_err_probe() to simplify.
> >
> > ret =3D devm_add_action_or_reset(dev, spi_geni_release_dma_chan, mas);
> > if (ret)
> >   return dev_err_probe(dev, ret, "Unable to add action.\n");
>
> It seems that if it only return -ENOMEM or 0, using dev_err_probe() has
> not not much value for many community maintainers.

While I won't insist, it still has some value to use dev_err_probe()
as I talked about in commit 7065f92255bb ("driver core: Clarify that
dev_err_probe() is OK even w/out -EPROBE_DEFER").

-Doug

