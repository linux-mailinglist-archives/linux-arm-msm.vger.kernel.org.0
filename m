Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB85A9974C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 16:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731650AbfHVOsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 10:48:30 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35859 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731559AbfHVOs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 10:48:29 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so3809366pgm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2019 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E31Jc5nNGW6JtDz/k02T3W8n/cBkPDZl66UgVwKgjhA=;
        b=s3o84YpM+R4a2pGAeRamIRqxiWEaXcN/hCMtMu/sVfFVNqSkZqmXblJvpMlIJ7yE0b
         QlyRCjyn3csSkl0L7S2dpdqsbUBYMHzi7vou9+8AsenLq9UTQ+nbmu3MlK3T43G5xQZ6
         WtCJw+RtVutoBfB/f2CyARt3ednz3VpQySULPFEkOManrAEDkbcQmj7JoHT9Fz4Jr6K9
         ppM4PLJz1YrDotOJmd27uw0BN4wjnoWWtGRl3wQLrLJSb8loOsVhvQcNO39JtHaHpXTz
         D0Te68kdNXZUpgzwpX1Vx5guYi8UlA1/5RY4P19IIb+qGIfsuHqd+l/ZxMvkkyeTLp8X
         TWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E31Jc5nNGW6JtDz/k02T3W8n/cBkPDZl66UgVwKgjhA=;
        b=TB14piwcbi8Xj5owVDf1gmnpvBhgylTKBBRuHXIOLogRb9FQDXnPM44n42HyAgO5oT
         jmijCjAqgbp6bvAjotteEHnkqG8hwmTwqSjQOfmJgRJE2F79mp8rbkXxGPPVQVqqlq7t
         mwLhuNL1xumdSKDa8T/x7xhIvfVUFYGQFc0ej0nAB1B0LC4dWkprDe8nDW61G5UQV72p
         FQAwvpqebwaJ1UlrS5iS8WHlqiF2bvGmhBT0P/Or4DbXuSzqUnDrA/aZ/e4yci0dTnD3
         TbQCxHlBmlqnADSveztiep1TepMYfV6ZN42S13bWUuoPuXHZSEj/HOs2tjPIW0ubuP39
         9s7Q==
X-Gm-Message-State: APjAAAV2eDWk/OXSwA4r2yHBtKAEHSMPdX5okwuHzcKSxC9sTi1guMzF
        dHLXX3DDE8+5zvQwgFmFzV++qQ==
X-Google-Smtp-Source: APXvYqx8q3sv18VRmRxDYCuD2RRBmlTna3o11Hv5adGkG1Vu96QwL0EgtBrOHs4SaofLyEO90Hl/6w==
X-Received: by 2002:a17:90a:1d0:: with SMTP id 16mr38515pjd.98.1566485308373;
        Thu, 22 Aug 2019 07:48:28 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c199sm34370650pfb.28.2019.08.22.07.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 07:48:27 -0700 (PDT)
Date:   Thu, 22 Aug 2019 07:50:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, jcrouse@codeaurora.org
Subject: Re: [PATCH v6 4/7] firmware: qcom: scm: add support to restore
 secure config to qcm_scm-32
Message-ID: <20190822145014.GO26807@tuxbook-pro>
References: <20190822143703.13030-1-masneyb@onstation.org>
 <20190822143703.13030-5-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822143703.13030-5-masneyb@onstation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 22 Aug 07:37 PDT 2019, Brian Masney wrote:

> From: Rob Clark <robdclark@gmail.com>
> 
> Add support to restore the secure configuration for qcm_scm-32.c. This
> is needed by the On Chip MEMory (OCMEM) that is present on some
> Snapdragon devices.
> 
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> [masneyb@onstation.org: ported to latest kernel; set ctx_bank_num to
>  spare parameter.]
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes since v5:
> - None
> 
> Changes since v4:
> - None
> 
> Changes since v3:
> - None
> 
> Changes since v2:
> - None
> 
> Changes since v1:
> - Use existing __qcom_scm_restore_sec_cfg() function stub in
>   qcom_scm-32.c that was unimplemented
> - Set the cfg.ctx_bank_num to the spare function parameter. It was
>   previously set to the device_id.
> 
>  drivers/firmware/qcom_scm-32.c | 17 ++++++++++++++++-
>  drivers/firmware/qcom_scm.c    | 13 +++++++++++++
>  include/linux/qcom_scm.h       | 11 +++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> index 4c2514e5e249..5d90b7f5ab5a 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -617,7 +617,22 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
>  int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
>  			       u32 spare)
>  {
> -	return -ENODEV;
> +	struct msm_scm_sec_cfg {
> +		__le32 id;
> +		__le32 ctx_bank_num;
> +	} cfg;
> +	int ret, scm_ret = 0;
> +
> +	cfg.id = cpu_to_le32(device_id);
> +	cfg.ctx_bank_num = cpu_to_le32(spare);
> +
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_RESTORE_SEC_CFG,
> +			    &cfg, sizeof(cfg), &scm_ret, sizeof(scm_ret));
> +
> +	if (ret || scm_ret)
> +		return ret ? ret : -EINVAL;
> +
> +	return 0;
>  }
>  
>  int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 7e285ff3961d..27c1d98a34e6 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -367,6 +367,19 @@ static const struct reset_control_ops qcom_scm_pas_reset_ops = {
>  	.deassert = qcom_scm_pas_reset_deassert,
>  };
>  
> +/**
> + * qcom_scm_restore_sec_cfg_available() - Check if secure environment
> + * supports restore security config interface.
> + *
> + * Return true if restore-cfg interface is supported, false if not.
> + */
> +bool qcom_scm_restore_sec_cfg_available(void)
> +{
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
> +					    QCOM_SCM_RESTORE_SEC_CFG);
> +}
> +EXPORT_SYMBOL(qcom_scm_restore_sec_cfg_available);
> +
>  int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
>  {
>  	return __qcom_scm_restore_sec_cfg(__scm->dev, device_id, spare);
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index b49b734d662c..04382e1798e4 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -34,6 +34,16 @@ enum qcom_scm_ocmem_client {
>  	QCOM_SCM_OCMEM_DEBUG_ID,
>  };
>  
> +enum qcom_scm_sec_dev_id {
> +	QCOM_SCM_MDSS_DEV_ID    = 1,
> +	QCOM_SCM_OCMEM_DEV_ID   = 5,
> +	QCOM_SCM_PCIE0_DEV_ID   = 11,
> +	QCOM_SCM_PCIE1_DEV_ID   = 12,
> +	QCOM_SCM_GFX_DEV_ID     = 18,
> +	QCOM_SCM_UFS_DEV_ID     = 19,
> +	QCOM_SCM_ICE_DEV_ID     = 20,
> +};
> +
>  #define QCOM_SCM_VMID_HLOS       0x3
>  #define QCOM_SCM_VMID_MSS_MSA    0xF
>  #define QCOM_SCM_VMID_WLAN       0x18
> @@ -70,6 +80,7 @@ extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  extern void qcom_scm_cpu_power_down(u32 flags);
>  extern u32 qcom_scm_get_version(void);
>  extern int qcom_scm_set_remote_state(u32 state, u32 id);
> +extern bool qcom_scm_restore_sec_cfg_available(void);
>  extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
>  extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
>  extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
> -- 
> 2.21.0
> 
