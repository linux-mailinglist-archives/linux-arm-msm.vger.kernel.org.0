Return-Path: <linux-arm-msm+bounces-31764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B119785BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 18:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71A891C22CA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 16:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E517406F;
	Fri, 13 Sep 2024 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AGr7V/92"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74C53373
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726244888; cv=none; b=YVyHjU+qoGsDwtdMs31gbizmFyc3x3hsHVhCp5QrsTdbElGHtnGR+aXAVPuUuyy2em8PJoDhLmZHIND/upWwuzXjSOtvK24aj/SMlLXzQ9T2tebi8CxBUGuj/Sgk+bjpRD0RO+SiWA6Zao4L2iiIP1sy0opVD0E7SPJndFKFna0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726244888; c=relaxed/simple;
	bh=l6fQQfIJrCnieXnJtgF3yWwkk1JOKa/ssQuU9USSh54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCPTA8AfAi9stgnNzvuDb1SHipfMeKqub4b6wNIjH0b8lj20Vujvc7Uf7f3P7PZAF3WnSn7Lmcj8ifyoV+t+H18pz1whFNMp4iThRXHpXIGObBaHlJ3Tmdk7BktbRKbBFhi4TTp/L90pTOu/mwKeKEn1X5goW4QLlwRxJ2RY3zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AGr7V/92; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-846bcb525f7so629375241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 09:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726244884; x=1726849684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MySfAV1H+y1ji7wrdPmDhE9q7agfjXhZS+w1J3QnDfE=;
        b=AGr7V/92Ccvh2ei+H3/gjhiw71ZoSCNCUhMriUQ4BlAbHantF65uBfx7vg+eEefmXE
         Cs+qy4mjox/EiuRlPGTc6loAydW4F1JELiQ3+Ia2E4XTf5jvNP14CmOCyMcg8Zd7X+n1
         kUdYnMPHcw2XrkeK7lkMvA0aHpAemdplbGITY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726244884; x=1726849684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MySfAV1H+y1ji7wrdPmDhE9q7agfjXhZS+w1J3QnDfE=;
        b=hZ1LoAIicfPYuDM0JmLbCy549sV8SpzHClMGA9KbWBd4GbvizlQqciITJdHsX55iwt
         WPEX2LnTf7rXNfsU7DEWoT6UH3sysvSOgS2JTYrkh9ZUSx29j0DVJsXhF1UG66vXhQJC
         tG/T1n9e+7HLpEMwpB2Wv4/GqYjN3pK7JhqFiwmJhdwkmWOMZRzLolAtmaR6nE8ThQAz
         7jtuFoBfuIU+PDxT3SMaS1obN71Aa8w5xuSoIbZCy87yE1D0yoyeyMxT3EN4MtfUCFOj
         EbWThoyf2zH6TbIqah8G/218meMagTygSre/XanTsSAsbkBuiMZyMT8/OOZRpGLFoXbO
         Q2yw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Q/ES3Rbwqg4d8+ptxRiNA8wOo00Oey5g/hRahraEkHE+Cw8SyywRzN6OeSrBRhRkCpiO/Cu4H1Bry4rD@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlYKCwyJhAHRw+YvakM2S12UVu6dzmX/yRNEyRfL77I6uW7lZ
	d/9WnOto15QOkXaoiOcDhm7v/QhN4vuM03GUY26G+uKX5yLyBji2f7nMLhi70WFQd5AW562z7lY
	=
X-Google-Smtp-Source: AGHT+IFludznHx5rFRMx/9L328gNVDvNJYMoe/LH9baSBdH9qMGhy/Ff1uVxd8dl4XTxSsx5/EgS/Q==
X-Received: by 2002:a05:6102:a51:b0:498:ccd9:5b1e with SMTP id ada2fe7eead31-49d4145a617mr6027260137.4.1726244884397;
        Fri, 13 Sep 2024 09:28:04 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-49c16d93a87sm1228392137.22.2024.09.13.09.28.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 09:28:03 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4584a719ff5so17326541cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 09:28:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWbUjcsp/t5FZXaiw+cuuzn2UPVk9TXsv1+6fFnxiHarcNaWcyrm1o0jjbac6ehxEBzrWB/FSwNMworQpP@vger.kernel.org
X-Received: by 2002:a05:6214:3a86:b0:6c5:297c:da5f with SMTP id
 6a1803df08f44-6c573570b58mr118095856d6.33.1726244882965; Fri, 13 Sep 2024
 09:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909132810.1296786-1-ruanjinjie@huawei.com>
 <20240909132810.1296786-4-ruanjinjie@huawei.com> <CAD=FV=XQ7uf_Y_WTv_6-DX1Mo=+RycKSyxf=E-f3TOKiuE5RMA@mail.gmail.com>
 <c662f0b9-31dc-8b97-ef3f-ea33f9fc62af@huawei.com> <CAD=FV=U+kc1rKSDDo-Zx+CiuapoJ8izrCW0Wh-PfR7ivY_4bXw@mail.gmail.com>
 <10e77c5a-a188-698b-0c82-86c4bcdf114d@huawei.com>
In-Reply-To: <10e77c5a-a188-698b-0c82-86c4bcdf114d@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 09:27:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGKph6t9S-r9-D+LkYcGNgRbEAC-qc4OQZjZXmxrjozw@mail.gmail.com>
Message-ID: <CAD=FV=XGKph6t9S-r9-D+LkYcGNgRbEAC-qc4OQZjZXmxrjozw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] spi: geni-qcom: Use devm functions to simplify code
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: broonie@kernel.org, akashast@codeaurora.org, vkoul@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 12, 2024 at 11:44=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:
>
> On 2024/9/12 21:38, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Sep 11, 2024 at 8:53=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.=
com> wrote:
> >>
> >>>> @@ -1132,6 +1134,12 @@ static int spi_geni_probe(struct platform_dev=
ice *pdev)
> >>>>         if (ret)
> >>>>                 return ret;
> >>>>
> >>>> +       ret =3D devm_add_action_or_reset(dev, spi_geni_release_dma_c=
han, mas);
> >>>> +       if (ret) {
> >>>> +               dev_err(dev, "Unable to add action.\n");
> >>>> +               return ret;
> >>>> +       }
> >>>
> >>> Use dev_err_probe() to simplify.
> >>>
> >>> ret =3D devm_add_action_or_reset(dev, spi_geni_release_dma_chan, mas)=
;
> >>> if (ret)
> >>>   return dev_err_probe(dev, ret, "Unable to add action.\n");
> >>
> >> It seems that if it only return -ENOMEM or 0, using dev_err_probe() ha=
s
> >> not not much value for many community maintainers.
> >
> > While I won't insist, it still has some value to use dev_err_probe()
> > as I talked about in commit 7065f92255bb ("driver core: Clarify that
> > dev_err_probe() is OK even w/out -EPROBE_DEFER")
> The main difference is that when use dev_err_probe()=EF=BC=8Cthere will p=
rint
> anything on -ENOMEM now.

Oh, I see. You're saying that we should just get rid of the print
altogether because the only error case is -ENOMEM and the kernel
already splats there? Yeah, that sounds right to me. That doesn't
match what you did in v5, though...

-Doug

