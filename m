Return-Path: <linux-arm-msm+bounces-48061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD299A364A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 18:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A39E169B66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 17:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BE4264A80;
	Fri, 14 Feb 2025 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c90jnCD5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB53268687
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739554464; cv=none; b=Um2uzu0yEBKGh7RRbOGe76Mwb2CiSjml1zaobO/RVDiuuNty9OwmVgsw5mQB6lzrWa4OxNANq9srjPOIqjkPTtzBY8sfQpztLhDktoKFetXWhQhjJZQ87cW63+PrShHobQiZOW/k8cSakaH1QCXp80h+a4FUtoLVJKRdLP4QmT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739554464; c=relaxed/simple;
	bh=wyews8vfBUi0DfJTYdfIO2a1ZXwvPbE/cYzjPRjQrj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwxGPb/FzXA0hBb/UsTMfQXYTEkShlim7DM8I7jOxxIH6pU6P8G28KQv71M6Ovhd8YPT0o6nImjT9mVDjPCYMCiJsQO7dOT7wc2netb/dsYLiEmeuVqRGFpKKUqmWzvsMs3e5lqXnKvx2a/JT/Dd7yvIvegmtNtJlhfOYM9pwqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c90jnCD5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f2339dcfdso36749665ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739554462; x=1740159262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GSFBEwov7SYxp73AsWF2Q+VXEt3MRx5pEFKdxej0uOE=;
        b=c90jnCD5as968R64GQhVgU1QqpW4bV9Zl3GE7GtRqsO0hAr+AvuwTj9uAm/qh1ywpc
         PR9xdqGsvpt/LcOEavLtms3hOJuLX6ganAzOBpKy4TZmEf5kFj6whw/O/vXi69d/IBje
         BwCVSRiztHCSrQfw838N3/F5U5GYbNJtdSYFXXglYHerMgilS26k1sZ/7AnlGkFfMqo5
         Bfh75O8sm8pXWcnWk2biB470+Ha3DkkGIVeqjKEpRZZVgFnTsbomPL6R1M31+j1Xv9vA
         j1Xjwstfe1wmqt96vS/kP539JOZIJc3knbvzvxEE5RnQt+2EhJna02u0FG1s7zV/UvTY
         dpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554462; x=1740159262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSFBEwov7SYxp73AsWF2Q+VXEt3MRx5pEFKdxej0uOE=;
        b=lAd63zrcVg1LrxzzsWN19ewVwT2eaUeiAyf+m+HTCZvNpl2NuulztgskhFsNFwIrWg
         JJtt4ORVJVeprtiWsh09KNzfCacGmgDyCICmLVXU/tLoiFvtqiZf19rr1Od1KekBu0hG
         LrO7/qdmlPAmzTUwwOYplFYE59o1XXvgWrmAx8kBtd2C0QTTDNTNov6ApnTfZj+GUmW1
         tHnl9b1IEnyXko44S3sXRIysGVSWH+SvzWQAmsxEomWtzw48V5czCbbJpX/TT84ORz0F
         yvMF08nInmxxBpk8G8Fq/FmzqeCVdWM9pjkXQ6yth7T/VfznIOVlX64TIAfSgV1HOs4D
         moKw==
X-Forwarded-Encrypted: i=1; AJvYcCXHijgGK4a/jSLMh50FXAZIgJgsDVSSgTmRbGDvxi25vJQHyqCPRBn5lRcbGZuWGfiUvDsGp/PZPKJCCYFj@vger.kernel.org
X-Gm-Message-State: AOJu0YzqohSRli2z1VJOrFLeobIQor4qqyeKUx9stSwtZ+rCf0x5b+yp
	+EZFnoBtIZNFWFLWd3K383tFo7xyoan7VW9jXeSEqNOSV6JVDTu7c47RMaIO7A==
X-Gm-Gg: ASbGnctoh1y99/hc0Bh1ZxfNWwWjTnTC3g83yLqzbi0EsNwtkVpxuJdd/KPTxfZpPVb
	i0utXz4ztbIuIGKvN+8npRBD9KjMvSBIXp09dDFv4WPMiCPgsPA6t0kYmS/EEGF8A62uIFGThph
	Icg9nEWa8uqGjNA/NwulymMSJp7DQSMMS+3mNVQujmM8GqdO16mrxPSd5S1LLQyQG8yfQrpBore
	YZjxl2irp/+2h899tJlo0bscdefQFKEfR8p+hN35ZmI4Vc6MeKKFefFrEZGVkkZ9o03aVzVsu+z
	2IoPJjBoplQHHdVVpdamTaGpCCI=
X-Google-Smtp-Source: AGHT+IFFgRVHE1TWwpWWAfTH1Nd1d99UjW4+AL/w3P3sw93jVzRmaegWBJLBzf4sbPwtEerPHqeTSw==
X-Received: by 2002:a17:903:27c7:b0:220:fbde:5d70 with SMTP id d9443c01a7336-220fbde5df6mr18990985ad.21.1739554461992;
        Fri, 14 Feb 2025 09:34:21 -0800 (PST)
Received: from thinkpad ([120.60.134.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-221040434d9sm193265ad.196.2025.02.14.09.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:34:21 -0800 (PST)
Date: Fri, 14 Feb 2025 23:04:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	dan.carpenter@linaro.org, ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
Message-ID: <20250214173416.b6y7o6tqsnkuzkbh@thinkpad>
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214162109.3555300-1-quic_jhugo@quicinc.com>

On Fri, Feb 14, 2025 at 09:21:09AM -0700, Jeffrey Hugo wrote:
> If mhi_fw_load_handler() bails out early because the EE is not capable
> of loading firmware, we may reference fw_load_type in cleanup which is
> uninitialized at this point. The cleanup code checks fw_load_type as a
> proxy for knowing if fbc_image was allocated and needs to be freed, but
> we can directly test for that. This avoids the possible uninitialized
> access and appears to be clearer code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")

The best thing would be to squash this fix into the offending commit as the
fixes tag would become meaningless once merged upstream.

> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index c8e48f621a8c..efa3b6dddf4d 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -608,7 +608,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	return;
>  
>  error_ready_state:
> -	if (fw_load_type == MHI_FW_LOAD_FBC) {
> +	if (mhi_cntrl->fbc_image) {
>  		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  		mhi_cntrl->fbc_image = NULL;
>  	}
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

