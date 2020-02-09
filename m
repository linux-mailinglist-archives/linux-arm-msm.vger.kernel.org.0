Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F397156833
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2020 01:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgBIABF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Feb 2020 19:01:05 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35749 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbgBIABE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Feb 2020 19:01:04 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so1835923pgk.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2020 16:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KWYuYSQscJFjEOwJSH3DjqreOwAqOvNwuPxdqRtzkyQ=;
        b=tsY6c8Zp34BFWVlO3JnG99l/nv2GxJEIYPNYCJeVPEdmpzAgBvVD/d98DcL2DPJ1E8
         1owKgkk198flFbdTlEDw2yUcI6MWJKIq8ydFRJW6fBp00zwBIDtE7Pzw6nyR+Qck10VO
         lQzO5qBNnOdKWn3Y61SCHqAxkkZf1EkvLrQDHlavWfQiNi0lUjQMNpYDM7fF8Rzw+zqQ
         amqTFnRjGKcGRGHW1yi+eUbOHM3t8cu3/rcI71EwTlH05H+F2b5IYN6Lu4de+Og3NCk6
         H5J7+cEkkvyIP1pTvE+fTQTR3TsXvDNOvX61hK8eIBoSe6fLYYveggHJocO2G4bDWWZe
         y2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KWYuYSQscJFjEOwJSH3DjqreOwAqOvNwuPxdqRtzkyQ=;
        b=WMas1UnNtGbqnpsXZ1IhEH+mNdoVjRVE5PPkX9l3ma1wzBu5Ft7CCKqKLh9WGcwXeR
         /z+nFPLa2Wy+8M5x1SFvoGy1ztXBn9eOb2OnBMRQrjTPxJdTQa7TFxZNNwat0dRymLZq
         OAl6X77m0WjQMHNwXEu97ndJPa8s5hLBDmscX5lqBviJ1qjeMGvYESwZfEprxTljxlnA
         Ia8E63iioHAunUpjC8YVB5hGJpouHoGB3+c31wwHhJrV2sfZ0c7IYAvTjUDSMb26fZHf
         0LbRlhSPP98MM51glBzvw+cHecaiKgCPphV/KKx/iZgDKIhbljWvIwzYJrilWvsXSkzR
         5/iA==
X-Gm-Message-State: APjAAAVHkBn5V7uXSh66YS448UGIE0ZFP3X1umGjOD+c7gkyFXSirKct
        lcz9N8C7RzzIzZjgD26HoVu7aw==
X-Google-Smtp-Source: APXvYqzR0flCofwFqUkheDzbGPVFJIBJyNBgBn7Z4+U50I3hGaNFRhfapXdIj2fQ490UigbTwQpbDg==
X-Received: by 2002:a63:d207:: with SMTP id a7mr6908057pgg.225.1581206464258;
        Sat, 08 Feb 2020 16:01:04 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l15sm5955972pgi.31.2020.02.08.16.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2020 16:01:03 -0800 (PST)
Date:   Sat, 8 Feb 2020 16:00:17 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 1/2] iommu: arm-smmu-impl: Convert to a generic reset
 implementation
Message-ID: <20200209000017.GD955802@ripper>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <e7ba4dbd8e9c8aedd6f5db1b3453d9782b7943cd.1579692800.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7ba4dbd8e9c8aedd6f5db1b3453d9782b7943cd.1579692800.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Jan 03:48 PST 2020, Sai Prakash Ranjan wrote:

> Currently the QCOM specific smmu reset implementation is very
> specific to SDM845 SoC and has a wait-for-safe logic which
> may not be required for other SoCs. So move the SDM845 specific
> logic to its specific reset function. Also add SC7180 SMMU
> compatible for calling into QCOM specific implementation.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm-smmu-impl.c |  8 +++++---
>  drivers/iommu/arm-smmu-qcom.c | 16 +++++++++++++---
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index 74d97a886e93..c75b9d957b70 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -150,6 +150,8 @@ static const struct arm_smmu_impl arm_mmu500_impl = {
>  
>  struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  {
> +	const struct device_node *np = smmu->dev->of_node;
> +
>  	/*
>  	 * We will inevitably have to combine model-specific implementation
>  	 * quirks with platform-specific integration quirks, but everything
> @@ -166,11 +168,11 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  		break;
>  	}
>  
> -	if (of_property_read_bool(smmu->dev->of_node,
> -				  "calxeda,smmu-secure-config-access"))
> +	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
>  		smmu->impl = &calxeda_impl;
>  
> -	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500"))
> +	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
> +	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
>  		return qcom_smmu_impl_init(smmu);
>  
>  	return smmu;
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 24c071c1d8b0..64a4ab270ab7 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -15,8 +15,6 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  
> -	arm_mmu500_reset(smmu);
> -
>  	/*
>  	 * To address performance degradation in non-real time clients,
>  	 * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
> @@ -30,8 +28,20 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>  	return ret;
>  }
>  
> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +	const struct device_node *np = smmu->dev->of_node;
> +
> +	arm_mmu500_reset(smmu);
> +
> +	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
> +		return qcom_sdm845_smmu500_reset(smmu);
> +
> +	return 0;
> +}
> +
>  static const struct arm_smmu_impl qcom_smmu_impl = {
> -	.reset = qcom_sdm845_smmu500_reset,
> +	.reset = qcom_smmu500_reset,
>  };
>  
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
