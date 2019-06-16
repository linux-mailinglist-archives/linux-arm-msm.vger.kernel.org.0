Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BD54763B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 19:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfFPRwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 13:52:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40627 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfFPRwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 13:52:46 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so4358660pfp.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JSCuClmggpz8Xfy1dDZDwdk/cubpXsrLwAGotENzbKs=;
        b=CAzgrNFEKMdQpKgdGp/nqhCidH9CG88O48QbLwiUEoSO86bgyNCfkCi4c1YmJGcr3t
         9reAJ4a2fc6dhF0UHSHKxMYzlUqJrqFv3TPCvSGp3FNu5mdaA3/FrgxOyi3pt+JqQBHa
         BJWVMOtI436ml6J3QkvvtOWPX8wVlmjVT1exTobvGdN5Lcx/X4u2TRmCIs5IL77TK2AE
         eplwcT0cqZlwMZPSwtKUM0UCEF6a5mG9GNQEwMUt1rM9sy3dFvTg3VkAEIdYXhg414Mm
         zpCaoqI/KoFao5GFJn1dlLJwgzYOSbHmQsaALDZ/U0paTEoWHmjZamXoJsV11Z2BzOQP
         CgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JSCuClmggpz8Xfy1dDZDwdk/cubpXsrLwAGotENzbKs=;
        b=MX97Pk7CXKtmdd8CFGfJM50cQS+lK1/AF17Pl4f6uWTqoMnTb/B0YxntC08MSp3aA9
         HI6jM1m3pqY15m5YelY2+qLiBHgTweSEXjQ3diPG5YL2rK/1rSEdiUMQZwP4Z6pmuITi
         xyPjlh3k6lMoHgi2DzWIazbs7kuDDF9n9g0CcGxtLTLyoR6aelExTHzbCM2McGeM20Ge
         GEicjIIofsBo9o18ZeuIJeJv4R7S5THpcGx6hI6ZvldKI6GuL+IEYjszIDWgOsHBYBvf
         4ipnQPiXcX9/cJnd0EZr3ahUOiWvtug3Zac5ADVk37loj0yo5f2BBzMYbwVlvuSCZkdh
         6ciA==
X-Gm-Message-State: APjAAAW2Phru9CCjZbsBEDHJkVPaRWI7QL6EjAfGL+zFNVOpyeMQpWJA
        9GxGnMwX+mmq3Xu+unWz3V9jUg==
X-Google-Smtp-Source: APXvYqzBrAgp10q9l+iA/huCnFxShpqf46svP3+PCfO0K562mdIaJ33xStj1QgDq0AwmzgkwOWBoCA==
X-Received: by 2002:a17:90a:af8e:: with SMTP id w14mr22577232pjq.89.1560707565526;
        Sun, 16 Jun 2019 10:52:45 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u5sm8716191pgp.19.2019.06.16.10.52.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 10:52:44 -0700 (PDT)
Date:   Sun, 16 Jun 2019 10:53:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] firmware: qcom: scm: add support to restore secure
 config
Message-ID: <20190616175332.GQ22737@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-4-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-4-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 16 Jun 06:29 PDT 2019, Brian Masney wrote:

> From: Rob Clark <robdclark@gmail.com>
> 
> Add support to restore the secure configuration that is needed by the
> On Chip MEMory (OCMEM) that is present on some Snapdragon devices.
> 
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> [masneyb@onstation.org: ported to latest kernel; minor reformatting.]
> Signed-off-by: Brian Masney <masneyb@onstation.org>

This went upstream for 64-bit with config abbreviated cfg, so please
implement __qcom_scm_restore_sec_cfg() for 32-bit and add the defines
instead.

Regards,
Bjorn

> ---
> Rob's last version of this patch:
> https://patchwork.kernel.org/patch/7340701/
> 
>  drivers/firmware/qcom_scm-32.c | 21 +++++++++++++++++++++
>  drivers/firmware/qcom_scm-64.c |  6 ++++++
>  drivers/firmware/qcom_scm.c    | 23 +++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h    |  6 ++++++
>  include/linux/qcom_scm.h       | 13 +++++++++++++
>  5 files changed, 69 insertions(+)
> 
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> index 215061c581e1..089b47124933 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -442,6 +442,27 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
>  		req, req_cnt * sizeof(*req), resp, sizeof(*resp));
>  }
>  
> +int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
> +				  u32 ctx_bank_num)
> +{
> +	struct msm_scm_sec_cfg {
> +		__le32 id;
> +		__le32 ctx_bank_num;
> +	} cfg;
> +	int ret, scm_ret = 0;
> +
> +	cfg.id = cpu_to_le32(sec_id);
> +	cfg.ctx_bank_num = cpu_to_le32(sec_id);
> +
> +	ret = qcom_scm_call(dev, QCOM_SCM_MP_SVC, QCOM_SCM_MP_RESTORE_SEC_CFG,
> +			    &cfg, sizeof(cfg), &scm_ret, sizeof(scm_ret));
> +
> +	if (ret || scm_ret)
> +		return ret ? ret : -EINVAL;
> +
> +	return 0;
> +}
> +
>  void __qcom_scm_init(void)
>  {
>  }
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index 91d5ad7cf58b..b6b78da7f9c9 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -241,6 +241,12 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
>  	return ret;
>  }
>  
> +int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
> +				  u32 ctx_bank_num)
> +{
> +	return -ENOTSUPP;
> +}
> +
>  void __qcom_scm_init(void)
>  {
>  	u64 cmd;
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 2ddc118dba1b..5495ef994c5d 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -170,6 +170,29 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
>  }
>  EXPORT_SYMBOL(qcom_scm_hdcp_req);
>  
> +/**
> + * qcom_scm_restore_sec_config_available() - Check if secure environment
> + * supports restore security config interface.
> + *
> + * Return true if restore-cfg interface is supported, false if not.
> + */
> +bool qcom_scm_restore_sec_config_available(void)
> +{
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_MP_SVC,
> +					    QCOM_SCM_MP_RESTORE_SEC_CFG);
> +}
> +EXPORT_SYMBOL(qcom_scm_restore_sec_config_available);
> +
> +/**
> + * qcom_scm_restore_sec_config() - call restore-cfg interface
> + */
> +int qcom_scm_restore_sec_config(struct device *dev,
> +				enum qcom_scm_sec_dev_id sec_id)
> +{
> +	return __qcom_scm_restore_sec_config(dev, sec_id, 0);
> +}
> +EXPORT_SYMBOL(qcom_scm_restore_sec_config);
> +
>  /**
>   * qcom_scm_pas_supported() - Check if the peripheral authentication service is
>   *			      available for the given peripherial
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index 99506bd873c0..bccc7d10c5c2 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -42,6 +42,12 @@ extern int __qcom_scm_hdcp_req(struct device *dev,
>  
>  extern void __qcom_scm_init(void);
>  
> +#define QCOM_SCM_MP_SVC			0xc
> +#define QCOM_SCM_MP_RESTORE_SEC_CFG	0x2
> +
> +extern int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
> +					 u32 ctx_bank_num);
> +
>  #define QCOM_SCM_SVC_PIL		0x2
>  #define QCOM_SCM_PAS_INIT_IMAGE_CMD	0x1
>  #define QCOM_SCM_PAS_MEM_SETUP_CMD	0x2
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index 3f12cc77fb58..b5c0afaca955 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -24,6 +24,16 @@ struct qcom_scm_vmperm {
>  	int perm;
>  };
>  
> +enum qcom_scm_sec_dev_id {
> +	QCOM_SCM_MDSS_DEV_ID	= 1,
> +	QCOM_SCM_OCMEM_DEV_ID	= 5,
> +	QCOM_SCM_PCIE0_DEV_ID	= 11,
> +	QCOM_SCM_PCIE1_DEV_ID	= 12,
> +	QCOM_SCM_GFX_DEV_ID	= 18,
> +	QCOM_SCM_UFS_DEV_ID	= 19,
> +	QCOM_SCM_ICE_DEV_ID	= 20,
> +};
> +
>  #define QCOM_SCM_VMID_HLOS       0x3
>  #define QCOM_SCM_VMID_MSS_MSA    0xF
>  #define QCOM_SCM_VMID_WLAN       0x18
> @@ -41,6 +51,9 @@ extern bool qcom_scm_is_available(void);
>  extern bool qcom_scm_hdcp_available(void);
>  extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
>  			     u32 *resp);
> +extern bool qcom_scm_restore_sec_config_available(void);
> +extern int qcom_scm_restore_sec_config(struct device *dev,
> +				       enum qcom_scm_sec_dev_id sec_id);
>  extern bool qcom_scm_pas_supported(u32 peripheral);
>  extern int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
>  				   size_t size);
> -- 
> 2.20.1
> 
