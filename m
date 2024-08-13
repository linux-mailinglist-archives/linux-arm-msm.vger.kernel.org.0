Return-Path: <linux-arm-msm+bounces-28359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8191D94FE98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 09:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A55D91C224A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 07:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A998E13541B;
	Tue, 13 Aug 2024 07:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ecwCe+17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4161FE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533627; cv=none; b=cZVuHY4cN4Kwp0gw9zOcJmOm+ihSXgKEnQW0Fp4+MmmJI4DGV3zxq/FVFKvpTs/1kl0BgSQTBerOXq1mPn9mMqADpUcX9M+t4gLi+vZZT7+ikm/mA19oMcn2WGJd974HUqfwwfuTY0UFhS9vMRvqjt+aRZV72FCk/+BwzhKAIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533627; c=relaxed/simple;
	bh=UN0ZpGxw47ixND5peqiv9fX6/ccnQ6AxWsy9hjTfGfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiOn2tOWQePnGi6S/FN8I+Bsx/wXB9Gx8/1Y7gCIcywfMGFNsAD/dAcKzqFHlZ7w3aM1yHe5at3PB/MSfWkH+1oFTD6pamqjZkSznl5bNmVYcvFhlHevrHigZ8BQ4supIFxvnxDz6B1X0CHw94qrE0+ZDIHOE7DKR1Mgt/o3H6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ecwCe+17; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fed726aefcso43725ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 00:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723533625; x=1724138425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRqfFafHF5XewBUoy5tZuHbvr8oDZuevEuG5wBULNKA=;
        b=ecwCe+17ES+VVEjbD+vxXrZ4DsbGhO7cL+zhi4/Iz/pAxk/GBh8wRac6ATbbXCSmTz
         yrmAFus2bf5jSufmhx/zxauVmKfgDT1BuRw0DKIBPPVOznl86utlF+4TWtz8NOTeh8rT
         1f9MoxNibpUHDH5afrsPdtvMAan1pNXqSgacPoSCo7+6L8qL+fR3QtvYgC6wzNFP1UVe
         rILgBagd1ysjc7ayCfkP5/hWJNjJULVX9vMD52BxLDOL39EhA87Owe8adkPOCDXP3fKJ
         ei3SMPJUaIgqkFlDtE1N7eZc0SZQy9fa0bcoHEvXsgORiquErld9Oe6U5QXm8K8YfWk4
         kjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723533625; x=1724138425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRqfFafHF5XewBUoy5tZuHbvr8oDZuevEuG5wBULNKA=;
        b=PlUMBIWaWjZMtLphnXPjEGpZvfO2y+DqetUhALMCZuBwU81jwavXvVCgPeZOsycRGB
         AyTHhipgvOadwGf6L4RCkWyKUXZWTBqROqMvfs5FtEJvDM9xkz39OWUo5yYrgYgvodu/
         qR53oC87Iw96nFQ0qDX1DoJEdhr6TzGCfuT59/IbArXXr7NaVFFmJFP0bURSeiEFdCd6
         qiQays0rk8iPCWd8aDLQGIQH7xlrybbqpUhxhqtF83eZ3jRSqqJBFY88IpmmIA0ZDW4y
         EkxO3eNY8iNjej87FR9ITpkLqP7h7/2JyxJIG2n1rgxcF6fVXWOfCLBZINsgOg+J4Apv
         hjIw==
X-Forwarded-Encrypted: i=1; AJvYcCWIevzr4WfkcMhvAdfM2UzkOV5r4BnAfZ6UCtW3sxubkNdBS5ogZ7ybJHaUNpiqYvITZZzO7d+Ulu0e76QCHQpvhhPfMuhcGpcrIGLVgw==
X-Gm-Message-State: AOJu0YwsRXw6kDnNJRkmzHMHt0EhAWpiuYaP7zwX5N9MZomldo/92Z1N
	7li/14lzggr13vWwml9Row99kzh0hCLrUJZm2V1T6wRdaI6SxnIFiISYQdLrvQ==
X-Google-Smtp-Source: AGHT+IH3c19ieOFuxpG9Od28VUkUNWd5p7w4JT1Tcj/IJODP0Cw03Yuz3owloBqLlS4SpQoR2wasig==
X-Received: by 2002:a17:903:646:b0:1f9:d111:8a1e with SMTP id d9443c01a7336-201ccbc957emr1049735ad.26.1723533624423;
        Tue, 13 Aug 2024 00:20:24 -0700 (PDT)
Received: from google.com (202.141.197.35.bc.googleusercontent.com. [35.197.141.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd12f5d5sm7442055ad.19.2024.08.13.00.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 00:20:23 -0700 (PDT)
Date: Tue, 13 Aug 2024 07:20:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 1/1] iommu/arm-smmu-qcom: remove runtime pm enabling for
 TBU driver
Message-ID: <ZrsJLqTnq6tG2xp4@google.com>
References: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
 <ZroNUGkKuC1L7Qfr@google.com>
 <cca690c3-916e-43b6-b2a5-eca4f2eb838e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cca690c3-916e-43b6-b2a5-eca4f2eb838e@quicinc.com>

On Tue, Aug 13, 2024 at 10:37:33AM +0800, Zhenhua Huang wrote:
> 
> 
> On 2024/8/12 21:25, Pranjal Shrivastava wrote:
> > On Tue, Jul 30, 2024 at 06:30:43PM +0800, Zhenhua Huang wrote:
> > > TBU driver has no runtime pm support now, adding pm_runtime_enable()
> > > seems to be useless. Remove it.
> > > 
> > > Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > index 36c6b36ad4ff..aff2fe1fda13 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -566,7 +566,6 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
> > >   static int qcom_smmu_tbu_probe(struct platform_device *pdev)
> > >   {
> > > -	struct device *dev = &pdev->dev;
> > >   	int ret;
> > >   	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM_DEBUG)) {
> > > @@ -575,11 +574,6 @@ static int qcom_smmu_tbu_probe(struct platform_device *pdev)
> > >   			return ret;
> > >   	}
> > > -	if (dev->pm_domain) {
> > > -		pm_runtime_set_active(dev);
> > > -		pm_runtime_enable(dev);
> > 
> > I assumed that this was required to avoid the TBU from being powered
> > down? If so, then I think we shall move it under the
> 
> Hi Pranjal,
> 
> In my sense, this was giving the TBU ability to power down when
> necessary(through pm callbacks)? While I haven't seen any RPM impl for TBU
> device.. hence having the doubt..
> 
> Thanks,
> Zhenhua

Apologies for being unclear. I just meant to ask if there was a reason
to add pm_runtime_set_active & enable in the tbu probe previously? And I
*assumed* that it was to set the device state as RPM_ACTIVE to avoid it
being RPM_SUSPENDED after enabling pm_runtime. 

I agree that there are no pm_runtime_suspend/resume calls within the TBU
driver. I'm just trying to understand why was pm_runtime enabled here
earlier (since it's not implemented) in order to ensure that removing it
doesn't cause further troubles?

I see Georgi added it as a part of
https://lore.kernel.org/all/20240704010759.507798-1-quic_c_gdjako@quicinc.com/

But I'm unsure why was it required to fix that bug?

> 
> > previous if condition, i.e. CONFIG_ARM_SMMU_QCOM_DEBUG?
> > 
> > If not, we can remove it give that the TBU would be powered ON as needed
> > 
> > > -	}
> > > -
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.7.4
> > > 
> > > 
> > 
> > Thanks,
> > Pranjal

Thanks,
Pranjal

