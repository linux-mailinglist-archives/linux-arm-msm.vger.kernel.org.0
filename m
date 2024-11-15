Return-Path: <linux-arm-msm+bounces-38021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 253BD9CDFC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 14:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4701B2291D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 13:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EBE1C07E5;
	Fri, 15 Nov 2024 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZRupQ3g6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5E1BD4E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731676994; cv=none; b=d0RmC6nYuRYv6gZPZH/09j04E40amCtTAKMyGqIMf/IagQq7LZbkd1B8+DDa6+oKXhNVOYa6BkVMRPEYues6BCuL5e8if6bpOKFECQowM5O/QP7cCfHotuejdlT1TxvNvYFap0e7hgNm+E/8bTjB+7SIQfNIoUfh6P9X3/yovZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731676994; c=relaxed/simple;
	bh=0Q/CxoVEhocZ6ezfGf1u7ZNO4bfBmEBX2SgfqPCZuS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCGUsm4yCQrBSGv5x1ZYqpLGL5mA+Pq4pGQuOoIvYvCI5Pp3clp/nCSXhjxhohn+BATFnulWTeYOgn/3+FPKBfz7tPvHuWQ9IXP9xvEDgTSTEnDMJgmUgvPI7xfrWNSVmnPbZEQKwUenblR6bMr8kwOqQ2M/Fl+q9vIwcUH9d9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZRupQ3g6; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e38232fc4d8so823572276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 05:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731676992; x=1732281792; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mFcf9RJcjAVItM51bFy5niFyrBA5g5XDe+IUsN6u8qg=;
        b=ZRupQ3g6D2eV4OSzfODLyDHMmITCiAymIh00vfDOJC9DjLtpmpCM7B8BrPfYGE+ksj
         0JS97fajwNmMLgouauNi+ltdAUvzEGXamLATQMm7xy7aEtNawL4rTMkR/1k/cHcKClJ8
         JsHDIj7DjrXhX+UK6o9+iSsoSYLfeo0hLbwJBxtdLyYeRtYZ+/4nLlB/aAOW6ldr3a/r
         qC314maFW8wJoCf2jhN+8fOP8FM8Q6lUkqyW1bqeeZxlPn22y921k8Y5h7UhVXxpPGK/
         hTrlZJJOTSsO2/ucnaZOA/pSNo7ZbrLAsa1RvvtzNoFNjLOXh69VWdNd4l6MgoXAThMd
         cYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731676992; x=1732281792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFcf9RJcjAVItM51bFy5niFyrBA5g5XDe+IUsN6u8qg=;
        b=gNFhRqYQbSiyohyORoD3+PXVfnJMSrifgsG9bZzPUuqS0Js9oItc398dggRKl6D0AT
         jcedadkWMM1GdLeFinIc6n4CubUeJvwsC4gKoFAVW/01555B0VxjJ9ijuyktPoTMof13
         FcHqn+g6YzKHL/yT/j4uCmKhphl9x6QzsrVNq3rfyGGfxCT9rU/WRrM+47J3LrzQrmK9
         /e39I08ur6W/Hw8reaB4495HzZGfzZq8MzmhibI4SJO+LIz/6g9xFqYON7HCX2ijx6vt
         JVGKQivmrMKCaT4fkWxrWKBIihKOLWD+hxblCHAc52f/nuQhchP6AYAxBNAqTRIuhbA8
         RlJA==
X-Forwarded-Encrypted: i=1; AJvYcCUNbiRUSQKgN2DxNDw9z5O5qLVEKKh/JYrvmiCb4k4xy69BB7fnuAWNIJUovRkg+vvqYbiFgYqrkZ3yN6bo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzut0+ZDRT9hlK6o9RdIa9uwOnzli8Nvr0qm1norGLGnPXGfte
	Lyga98OJc517rSy20B2eMEr/36n7FuGlbJtbDZ2gvkJi5I3z6aHcJ7XXKg65iJKBT0AZPNbzdsW
	4IdFjv+ZxTO6mhLmWAutAIJ8q6m7RmoCNjfWgYA==
X-Google-Smtp-Source: AGHT+IHCgG2uruTWqMGPEa/kjxndenrmy3iqrUer02q4NYfZY7sfxcicR/uF3A5MhOvjIYFRPv2PSm5gVYMIbtpw4V8=
X-Received: by 2002:a05:6902:e06:b0:e2e:49f0:fc26 with SMTP id
 3f1490d57ef6-e38263e1858mr2271366276.49.1731676991883; Fri, 15 Nov 2024
 05:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq> <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
In-Reply-To: <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 15:23:02 +0200
Message-ID: <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, 
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_narepall@quicinc.com, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Nov 2024 at 12:23, Sarthak Garg <quic_sartgarg@quicinc.com> wrote:
>
>
>
> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
> > On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
> >> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
> >> This enables runtime PM for eMMC/SD card.
> >
> > Could you please mention, which platforms were tested with this patch?
> > Note, upstream kernel supports a lot of platforms, including MSM8974, I
> > think the oldest one, which uses SDHCI.
> >
>
> This was tested with qdu1000 platform.

Are you sure that it won't break other platforms?

>
> >>
> >> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> >> ---
> >>   drivers/mmc/host/sdhci-msm.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> >> index e00208535bd1..6657f7db1b8e 100644
> >> --- a/drivers/mmc/host/sdhci-msm.c
> >> +++ b/drivers/mmc/host/sdhci-msm.c
> >> @@ -2626,6 +2626,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> >>              goto clk_disable;
> >>      }
> >>
> >> +    msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
> >>      msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
> >>
> >>      /* Set the timeout value to max possible */
> >> --
> >> 2.17.1
> >>
> >



-- 
With best wishes
Dmitry

