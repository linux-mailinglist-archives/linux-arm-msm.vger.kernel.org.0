Return-Path: <linux-arm-msm+bounces-28308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C5694EE15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 15:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E5D282EDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 13:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09BA17C9F6;
	Mon, 12 Aug 2024 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SdrCveZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E817C23D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469148; cv=none; b=DBxPAVqigsDuzasOzcA5QI2hR5o+nG/uteUzMOA2MInx4qy1WTvYepavkMeRxHOVfokgIhA6PQ3mLDcPCoBZlKNZypordJ8hZ71mfdxN8dZ0bRos/BhrkF77M639fmGLtbrLXvAalPv9OP2x1k4FsSSQIezvMwp6/lag4WvBF+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469148; c=relaxed/simple;
	bh=V9W1mHBG7nCjOakKrNvlHdCSu7XhfjXNoktXt/lNYZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdr5aX4QAZaKDsqXlhVtNjpsYymn6qBttraxlXT2yCcQvJZRJtB5ByD4+ogouePlZUFa2Ahrd65IsmPHZWFsXEaOesEU3Fin5nE4/dD4IfBLl//6cqVO4LGNcNW+Lu73rPx2UDwiUvwbi8s2O0UiIfpUHFSaOlVLuGzkvTC5BQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SdrCveZz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fd657c9199so255605ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 06:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723469145; x=1724073945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lmYajX4gMaVGigJxbQG+9M3259675dZnYWJeb/SxvFA=;
        b=SdrCveZz8kcTv7g6nPUZzG9HVj0VCgqPC2B/1JWwOMIXIw+yGIn2Ua3JybTDt5ZO0d
         Gq6f18I9Jc/9D/C83jhFBXpv6G+Ot0FQga/LcyDy7ofFv6vvJw55hkPijgGk7vpM/8NB
         fwk/QOsXrmnM+pyHoVFQd6OBY97L4MvDtEapss+MVA7HQuzPfJP7p5xh40fthn3nN1/n
         4UeGQb7ozk9be29jsRv/E99xO170axB3SJvZsRauWqUmM6xHjWoyiHK34/BKpTCH7ZqS
         3oyX/zz81eyxRHDnZjubV4vjblTQo43qN92zDnM6o1vgqTJ8JHd31Ne/8JVrGWWi7yMV
         YnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469145; x=1724073945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmYajX4gMaVGigJxbQG+9M3259675dZnYWJeb/SxvFA=;
        b=aM7O5z9kYawmO+2sTmFkC13ZSF87mG1iX6lcLBsKrtOXxolmjjsRM2zMGQbUMXFt2/
         D8di/Koxma2j5hldMGBOB0KpbJrYCEljPr597UlVpycAOJ2KyHawPNdgcrlX9WGXAN1v
         rIT0iZto2II9CxmzkGyTdJOibv/WttXHkVbORdncwoZlJ1xY7cRi3DOQ1GEdIRiwI2MR
         3zk1D7U8WXBWZSu7TRVOQ7pis/77+/tgsiZicyfu+iTdMPP4u7H7bsBf559izFYNikDY
         iqdTRZlpUfjG/UiKBjwPqPWfYTdbArMfjwvmgg5AD6cDb9/eNa4py+jwgH8dx4RKr9mu
         1kTw==
X-Forwarded-Encrypted: i=1; AJvYcCUy7dC9ELb66nEnU8fT4uJKZ3jcQOjC6F/OLTi6s8UtO9zk0dpBdEGt0QnSKO1Ie7GmZo820Y/xD0in3LnhwSFfHvC8XNGcFwNjfaSfnw==
X-Gm-Message-State: AOJu0Yx3h0fvW5iXtT+B0xBgiNKoju6yLstre3QKJxRFzh1pO0ZsMYnz
	p8JwNFTNqKzAxqp/aE/JXiOjWhy+/npfasjvqy7t/Ae/njPS6kiu7afB9faU1Q==
X-Google-Smtp-Source: AGHT+IHb6qeSJStNs0pVR+CmYkttDl20c4Sd0X9v5RgYO5YZwdbSZX0vov7dB1RIgvFULpIown2sxA==
X-Received: by 2002:a17:902:db04:b0:1fb:3e93:79cf with SMTP id d9443c01a7336-200bd27550bmr4027905ad.13.1723469145000;
        Mon, 12 Aug 2024 06:25:45 -0700 (PDT)
Received: from google.com (202.141.197.35.bc.googleusercontent.com. [35.197.141.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a89e22sm4085935b3a.170.2024.08.12.06.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:25:44 -0700 (PDT)
Date: Mon, 12 Aug 2024 13:25:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 1/1] iommu/arm-smmu-qcom: remove runtime pm enabling for
 TBU driver
Message-ID: <ZroNUGkKuC1L7Qfr@google.com>
References: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>

On Tue, Jul 30, 2024 at 06:30:43PM +0800, Zhenhua Huang wrote:
> TBU driver has no runtime pm support now, adding pm_runtime_enable()
> seems to be useless. Remove it.
> 
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 36c6b36ad4ff..aff2fe1fda13 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -566,7 +566,6 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
>  
>  static int qcom_smmu_tbu_probe(struct platform_device *pdev)
>  {
> -	struct device *dev = &pdev->dev;
>  	int ret;
>  
>  	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM_DEBUG)) {
> @@ -575,11 +574,6 @@ static int qcom_smmu_tbu_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> -	if (dev->pm_domain) {
> -		pm_runtime_set_active(dev);
> -		pm_runtime_enable(dev);

I assumed that this was required to avoid the TBU from being powered
down? If so, then I think we shall move it under the
previous if condition, i.e. CONFIG_ARM_SMMU_QCOM_DEBUG?

If not, we can remove it give that the TBU would be powered ON as needed

> -	}
> -
>  	return 0;
>  }
>  
> -- 
> 2.7.4
> 
> 

Thanks,
Pranjal

