Return-Path: <linux-arm-msm+bounces-31045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8216396E84E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 05:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB551C23776
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 03:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296551E521;
	Fri,  6 Sep 2024 03:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mYlgHkAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988B335A5
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 03:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725593781; cv=none; b=kSD2VyuXeuP8MoxmTvREni2kb6li/cj3VoimF0/3VvITLCLMe/aMKIih2mDf0p2os7Nd7Pq/Jiq+V2FyUvuANnAmwmPdyEQ4vOojT/kZx6rMnXYm53j+h2WO1xOegZivSHKBqwgVyF3FT5QZ/8CWAc3m9zNBa/zlzG+g3OLA4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725593781; c=relaxed/simple;
	bh=AfFsP4Mp2eaCi/XREIpGg9zYseFhassllfiRxllk5+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxJScdUdPmmSaWF/u9LEbSl2vJ3zgdW7m5t1xbReNGlR7VP2zA6/4iN8JR4050arS8fEZJTS48l9CVFj/3x/MP7ZQgkiCJ6bmo9uZ+8Nr57aMouO5tHLf8sYB/Hj7Rv+fJYjXY8WZLD9p0XuNMbn/r6S73rQ8lnHwldT8kTeV3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mYlgHkAp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cf5e179b68so1134280a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 20:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725593778; x=1726198578; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=km91bPAU+XKoVzICLgWEs9EG1wamjcaCEAtz+j5/vxs=;
        b=mYlgHkApFhey0zc/BMY+SRz2yVBbLbRpf9/MbIkj/LEKwMOMpxaBvTFCplQw/AD8Pl
         CVkxVskmJuobIXs+5SWEclD++c+Rw4APHf+j1lpYEXpnJArQn9xWvcNaM4XoCKGKLet2
         D1Wfems9cCpaqNIFwceb63/XqQqw57Uuz4jug2LG8/TphViPcofH0spvc+zDDP8pVqwD
         ig9AbGlCJHovzxluzVzHCNbxfwsLa34WUJCe6GA5k/xHbOIhWMkRU9H1l1jWcp8OX9KH
         Li9ySXYhV16WM3mnKDS3RwAZZ/Q0AoJkV7Lmcz51iqy69F7BthG4hBpxTkz1/YX9q+Eb
         Y0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725593778; x=1726198578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=km91bPAU+XKoVzICLgWEs9EG1wamjcaCEAtz+j5/vxs=;
        b=VsUIip0Y0z23OAL9SFEYpifObMfCkpOc7OTLVY3jF9FW8Fw+HjqSYPHeiYx+nfi//g
         Y2ygQC0sHud6wEkKlhXv2GWctNILR5ESOQy75zNxNmgWMMW+TrT+uF54HLg5QOPHFAKK
         DvCinwIPzd/SN4IN4lvPEj6+cFxJ/ewNnl+Rw2q09/kijWo/cWQqCvGj7hyD3G2m8Mhc
         hcmCqY2Uc2oBEZNJgX4z9TgZffXR4lk0lhdWOQxeanTxHxKOtLF9zUOb4QsOdLNG5Hm3
         FYetVUryiR+rN3HwGFBk6HEP+qLKGAGXH/xxqToVwafyNmVMicvBXGVW2EgE7gsTjFB4
         d8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWFpFbAkBpxmgclIIq3dKXnKcYpAjXosSLpBQj4ZC/Thh5m7xmlmly7j7US83IZyWqaUEfBjrhRY/1aUn94@vger.kernel.org
X-Gm-Message-State: AOJu0YwEm1LvvNe/seQ/pI8KSZDIsnw8qKj1lgRWyh8ADAi13edgmAx7
	MOUUUxDDukipc86aUI6JadK7+Eba4VLEMgmSsbC/7bIZwIevgJCnCpvyAhEGw1Tmwf7D+d4BqbX
	U6DebQpvZVeQep6d34b/xfSQAzafqJEShZAveVstwcAgG8/OM
X-Google-Smtp-Source: AGHT+IGV0l6qCidKlrluKH/Ku6/aWdGdBUZdlnw49m8XQ7o6/Ks+zOib15RuCQhzvhBEJ9/JheGCWcnTp+RfgGMBStI=
X-Received: by 2002:a17:902:ec87:b0:205:4d27:616e with SMTP id
 d9443c01a7336-206eeb7a94cmr19466555ad.22.1725593777697; Thu, 05 Sep 2024
 20:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906031345.1052241-1-ruanjinjie@huawei.com>
 <20240906031345.1052241-3-ruanjinjie@huawei.com> <hnos3f34ejabyw2yxtpxifskhklunvnufgsuilghjeuzipqkxi@udw5xfeum37a>
 <050a6434-00f9-4bba-a122-52c3a23fcf70@huawei.com>
In-Reply-To: <050a6434-00f9-4bba-a122-52c3a23fcf70@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 06:36:05 +0300
Message-ID: <CAA8EJpod2OzNEoquSGuJXLUx8-r+J0_YjPzv5pFDFHum9siisQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: spi-geni-qcom: Fix missing undo runtime PM
 changes at driver exit time
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: broonie@kernel.org, vkoul@kernel.org, akashast@codeaurora.org, 
	dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Sept 2024 at 06:31, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> On 2024/9/6 11:15, Dmitry Baryshkov wrote:
> > On Fri, Sep 06, 2024 at 11:13:45AM GMT, Jinjie Ruan wrote:
> >> It's important to undo pm_runtime_use_autosuspend() with
> >> pm_runtime_dont_use_autosuspend() at driver exit time unless driver
> >> initially enabled pm_runtime with devm_pm_runtime_enable()
> >> (which handles it for you).
> >>
> >> Hence, call pm_runtime_dont_use_autosuspend() at driver exit time
> >> to fix it.
> >>
> >> Fixes: cfdab2cd85ec ("spi: spi-geni-qcom: Set an autosuspend delay of 250 ms")
> >> ---
> >> v2:
> >> - Fix it directly instead of use devm_pm_runtime_enable().
> >
> > Why?
>
> The devm* sequence will have some problem, which will not consistent
> with the former.
>
> Link:
> https://lore.kernel.org/all/CAD=FV=VyDk-e2KNiuiBcACFAdrQmihOH6X6BSpGB+T1MsgsiKw@mail.gmail.com/

That comment was for devm_request_irq(), not devm_pm_runtime_enable().

>
> >
> >> ---
> >>  drivers/spi/spi-geni-qcom.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> >> index fc2819effe2d..38857edbc785 100644
> >> --- a/drivers/spi/spi-geni-qcom.c
> >> +++ b/drivers/spi/spi-geni-qcom.c
> >> @@ -1158,6 +1158,7 @@ static int spi_geni_probe(struct platform_device *pdev)
> >>  spi_geni_release_dma:
> >>      spi_geni_release_dma_chan(mas);
> >>  spi_geni_probe_runtime_disable:
> >> +    pm_runtime_dont_use_autosuspend(dev);
> >>      pm_runtime_disable(dev);
> >>      return ret;
> >>  }
> >> @@ -1174,6 +1175,7 @@ static void spi_geni_remove(struct platform_device *pdev)
> >>
> >>      spi_geni_release_dma_chan(mas);
> >>
> >> +    pm_runtime_dont_use_autosuspend(&pdev->dev);
> >>      pm_runtime_disable(&pdev->dev);
> >>  }
> >>
> >> --
> >> 2.34.1
> >>
> >



-- 
With best wishes
Dmitry

