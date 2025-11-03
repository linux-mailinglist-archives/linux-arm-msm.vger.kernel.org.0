Return-Path: <linux-arm-msm+bounces-80149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF1C2D533
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 18:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E017C4EC59C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 17:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6610D31A7FF;
	Mon,  3 Nov 2025 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bDm+cZbP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D83031A7F4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762189212; cv=none; b=LZod6qJrD+K/ZuHz3NdK7n7ieHmtn92vh108C5LV+Gj5KG8+51Ps6ZGKLKPaJqPIAD5+VBWwop8dz8Tb7G5SzLX2igka+4itrQZA2djLlXdPMB72OO+N2/SCeLUKQWypFDUR9duoRzaviGX/otKRwD3mBHqWRr1IJxnCegiu6Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762189212; c=relaxed/simple;
	bh=bxgI7xm+IgIVGvsbKQgVxrFpU5UPoucGihmhUKxnDx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t45kL7HgUAgSufnkGrN6tVTPyowd1WN7F0S3XAtgc/c6HcvGI9ArTL4/9mHNYDfNF1/lBvH3k2FN40Z4QpCLtUEyr9ipQp/06nPH/4BhCup+YIjicvDtmOjiex97uQacaRd+SBWMlVxS785El8BatRX9UDpey1/VfyEiUsHDCHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bDm+cZbP; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378d50e1c82so44492041fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 09:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762189208; x=1762794008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoNdC5BMiRyOC0JiGM2ExKgLEDkWaHJnqqKpzjHUJnc=;
        b=bDm+cZbPjON+95RUvXZWgiUeJaFiPcmdTXLdxl+5DyQyXE52XEgoNHQABjp5amTFlq
         hVMLqcMDzfc1ZHhhDA6v9DAYS0k+gryxG/QoQqKvcRn7LSmb2rqtcOdAprM3CXdAR9VQ
         e84o5HQt2iAqcgsQbX01tOh7LBCf2Asqp2qJh8rRsRsAAcwE5KE4p+nN+OoHcYw0jmK6
         1dooCrbJ/BBYu2b89NcHiyDlGgE5YJiWeBpkL8jWgCdXLRf2cT245ss1eCCPuDfuIBvh
         VCsnFckV/nbODzADQc79UQXv3OEGw4d7+YIqB3HcYWB5BvB2DzKZP3HRLl+85i1E6zA5
         5cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762189208; x=1762794008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoNdC5BMiRyOC0JiGM2ExKgLEDkWaHJnqqKpzjHUJnc=;
        b=VkvxkcVhnx1OfJa8RH1TTQFIvuaDnS1ttZIUB5bvMW4+B338rGUYsHVxLuOywUXZtP
         rR3MHq+pD6NrEzxeXPjqg2emAOfJpTipVWEHTIfzQhHiFRByfX9cKKLFxrxmMXDT+w1Q
         jA3bewThK1vo8jcahsah5RnMv7NYDBGMFYUCAJ5S1UqtpA9hdx6/UVw/CC/ERx96y7Wy
         vY5RsQH4xAwGinoTcPHC/d2QlF9b19n2FmVrWseSNYg2ZFcrWY/LctnW9X/z3Tmc0nY4
         4sqXLaWqzrQZbSQ9/pjXxnkJibMnLO/uMsjEFtE2bTuqMJueOr0oqUexMLpMqLPEaaOr
         kv5A==
X-Forwarded-Encrypted: i=1; AJvYcCUuHJlEExVqE32TbFtnuDUJrBLz1tyWE4zdNlLXPeVAAmLq1PLySVP1+sbKyVa2HLpN7jmDZVfLB7OyPraO@vger.kernel.org
X-Gm-Message-State: AOJu0YweA2026DQKOoEXBV9+/LadG7eSwe+8bNc4vGESsNUG2MqPTv7V
	mpdoxji9XUbTeLEuE9KKp2Rn9bdzg7E6kRouUA3CO3TzLFQJYJlHhas3FMtiMl7ZdEBp+wZsGvP
	Db1ZkDDW1Ol4xvaxgYdU7pEGTn1zCfJi8iYvWropWiOk4wbeyJzZ+whcxMA==
X-Gm-Gg: ASbGncsCNicBEL0kv1FzaYsZCIDJ1966Lqo/L4ShJhLiV/iIylvUUKNlkWuXXglZe00
	NNJ9+yMqzyXpNQ5PKuMx9E8f/9fESyNKZaT5GANRfZv9PgBka8i5PPxIjv8VrlpwddnSCjvaB6O
	S+kYqcL3pth0QL2Pg5GTy7EO5fUNqVn6b74YG/brtf67Fg7enAtmDVxIbLcbCRC9Ri3GokxKgWC
	ucYOD9ad7QXvzyh3C760E80usBrroG2JWAybmGJ/f8YIwCf4mOas9lIZbrvOMv40vrIrrkBXZvY
	URvgjsYjgVAahKch+SSF+OEJXMk=
X-Google-Smtp-Source: AGHT+IFAokWDp529X/xQj865heioyoJ+JqIPsFe9otddKohP4c/QuEQTPtIBaIp16NtEOgDGZnEZx9kzQeL+ZIUR0So=
X-Received: by 2002:a05:651c:2210:b0:37a:39c1:721e with SMTP id
 38308e7fff4ca-37a39c178d0mr8876841fa.17.1762189208387; Mon, 03 Nov 2025
 09:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
 <20251102-multi_waitq_scm-v8-2-d71ee7b93b62@oss.qualcomm.com>
 <CAMRc=Mfh+WQx-vasZed6jWi5nUjg=K+ScVRBMCiFgK397=JbVg@mail.gmail.com> <da04aa57-f3dc-9bcd-5ba3-05088a6661ab@oss.qualcomm.com>
In-Reply-To: <da04aa57-f3dc-9bcd-5ba3-05088a6661ab@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 17:59:55 +0100
X-Gm-Features: AWmQ_bmXS4BEImKKjWCHGw5hmxlPJzmWjlXp6Ll6_YqBi7myoVjDaXfXIpxoD70
Message-ID: <CAMRc=Mcj_6g3ory9zqxEWCHmpxh3hf4C-iBK0XT82F8nGVcFKQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] firmware: qcom_scm: Support multiple waitq contexts
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 5:16=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/=
qcom_scm.c
> >> index 28979f95e51fbee94b84c1570a4d88a76f72db4e..0b6efa7c2bdc25a3ba152c=
25d5451d1154779ddd 100644
> >> --- a/drivers/firmware/qcom/qcom_scm.c
> >> +++ b/drivers/firmware/qcom/qcom_scm.c
> >> @@ -47,7 +47,7 @@ struct qcom_scm {
> >>         struct clk *iface_clk;
> >>         struct clk *bus_clk;
> >>         struct icc_path *path;
> >> -       struct completion waitq_comp;
> >> +       struct completion *waitq;
> >
> > Why this change? This makes the name less descriptive if not misleading=
.
>
> Want to make it dynamic array of waitq`s. Should the name be kept as
> struct completion *waitq_comp; ?
>

Yeah, can me waitq_comps if it's plural.

Bart

