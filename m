Return-Path: <linux-arm-msm+bounces-3911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4080A0DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 785AF1C208EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7D818E13;
	Fri,  8 Dec 2023 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQRHtWg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70252701
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 02:28:42 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso1567567a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702031322; x=1702636122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SUV+KrS/M1PX7b2cWkbcJDPyrMmWw0crWFGMGpiuR+Q=;
        b=RQRHtWg/2ACiwRcoKfXTM57yi+/U22p2yk8gM3UGCdkD2xLP7dMfax23W4FJKCwtnR
         z8BNgRo9O8a+hEV6eKzw6geclLDgyNy9TVDk+K9b6KcXaAzQl2pVl/cO/CV3Ep6ubdYZ
         SNZmPfOOm7REoVGiNmeNPXGTJ1db1r599Z9zZBREhi3W1MSEkZ1mVoDPjSQ391QdSRWW
         6Vq9Mgit7INzHOtLRhAYkK+E6Geml8ZLwDtoaixWc9MYFNadivhyTw3wn6UlOQG+CHL9
         P9+0DfuBFr07y633OJ5rwIB1jD8qVNTm9x0PPJ3WvCew+3SXwI+zjZPK8x9dZwsUoQ5p
         KYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031322; x=1702636122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUV+KrS/M1PX7b2cWkbcJDPyrMmWw0crWFGMGpiuR+Q=;
        b=Q54r2IoHcBK4VlhjyOGxXp1FDXp/oL47Av1IBKxmgrEuTHRNw1ABNRXSqaIJDMYWb/
         5uurwPDUbbxFdseKHXgYuoJOD9tZPlcmmjjJEqdnsUjJctlcKXcuZl02hUoXv/54xE0j
         e3f4HZAMzMjM6SeH4/BFz/gKZLvVnBRtGzwHp1m7WY6QT7LFR+uC3+2ubbY9Pe6ZTEx1
         RqbSNMw5cq6UVohwFc8EJ8HZ91Rg0Y0xCnflEm1yzDlA6j7nHqdlDkHcE7/ATV/CVdIG
         xjVHtMynAHm7t1R3pjT/UsHowPfHh29K+HiCU3amGiGow/35XYSPfmQhmJ3vC6ZTfEao
         82mQ==
X-Gm-Message-State: AOJu0YwnjYoXBVESAtfi4Q6ENvoRKZ+WU76DpTHa50ZCobBX/nevIQp4
	d9Dru+tMpxB+h4dvXpcStoMB
X-Google-Smtp-Source: AGHT+IF2FRydo8njGp04OKtgX72qcMhY6Q36zNhjSrP9AlmGihq0Ok6RbEQ7vZs61mh+BlsQIlwCcg==
X-Received: by 2002:a05:6a20:9410:b0:18b:c96b:a433 with SMTP id hl16-20020a056a20941000b0018bc96ba433mr3565998pzb.56.1702031321911;
        Fri, 08 Dec 2023 02:28:41 -0800 (PST)
Received: from thinkpad ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id p25-20020aa78619000000b006ce71af841bsm1241285pfn.4.2023.12.08.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:28:41 -0800 (PST)
Date: Fri, 8 Dec 2023 15:58:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, ahalaney@redhat.com
Subject: Re: [PATCH v2 05/17] scsi: ufs: qcom: Remove the warning message
 when core_reset is not available
Message-ID: <20231208102832.GA3008@thinkpad>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
 <20231208065902.11006-6-manivannan.sadhasivam@linaro.org>
 <7472fe73-e7a0-5c8c-6e85-655db028a5c3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7472fe73-e7a0-5c8c-6e85-655db028a5c3@quicinc.com>

On Fri, Dec 08, 2023 at 02:55:21PM +0530, Nitin Rawat wrote:
> 
> 
> On 12/8/2023 12:28 PM, Manivannan Sadhasivam wrote:
> > core_reset is optional, so there is no need to warn the user if it is not
> > available.
> > 
> > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/ufs/host/ufs-qcom.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > index dc93b1c5ca74..d474de0739e4 100644
> > --- a/drivers/ufs/host/ufs-qcom.c
> > +++ b/drivers/ufs/host/ufs-qcom.c
> > @@ -296,10 +296,8 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
> >   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> >   	bool reenable_intr;
> > -	if (!host->core_reset) {
> > -		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
> > +	if (!host->core_reset)
> >   		return 0;
> > -	}
> >   	reenable_intr = hba->is_irq_enabled;
> >   	disable_irq(hba->irq);
> 
> 
> Hi Mani,
> 
> I think core reset is not frequent. It happen during only probe ,error
> handler.
> 
> core reset is needed in kernel to cleanup UFS phy and controller
> configuration before UFS HLOS operation starts as per HPG.
> 

This sounds like core reset is not an optional property but a required one. I
just checked the upstream DT files for all SoCs, and looks like pretty much all
of them support core reset.

Only MSM8996 doesn't have the reset property, but the reset is available in GCC.
So we should be able to use it in dtsi.

I also skimmed through the HPG and looks like core reset is not optional. Please
confirm.

- Mani

> Having existing warn print can be used to to debug or atleast know
> core_reset is missed in device tree to give indication complete reset hasn't
> been done and we could still be operating in bootloader configuration.
> 
> 
> Regards,
> Nitin
> 

-- 
மணிவண்ணன் சதாசிவம்

