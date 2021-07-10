Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D433C327F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 06:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhGJEFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 00:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbhGJEFV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 00:05:21 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8E0C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 21:02:37 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id w15-20020a056830144fb02904af2a0d96f3so11637221otp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 21:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GEPxy6Tx2ObEcLT1QWUDNo4hUAvKLFVoXa82BmAUqLA=;
        b=VUUyDMHbIvLJJMgs+EnupoivUci7cdqurEGuKi9jzqTxpo1sQXKBDGygwjRuPcaFyK
         tLvnMzcCVcBSq25vmM4nXeiAHzEsvSktHSgKuxkmNisLvCWGllJBW1jBhtZzQkFNx2my
         e7iucaovs/4WTswBzDhyKgjJkBSYuU5uKkdvbLvSbSmz5HoKY8oDYOrsKVHg9JYVxh4A
         eGTPbx3MUpnoNvOGPUIC3ifj0F7R5hD9gElnbTAooSMA5cs8SlUiLmSnqfMJxI6Y5JWS
         6KpDkosLXsqqKaKBnIMzGU8rR5ldD8hEuk41j1dX8o+tq5xMSpeY8NtAnwmz+PBT6xLP
         Um5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GEPxy6Tx2ObEcLT1QWUDNo4hUAvKLFVoXa82BmAUqLA=;
        b=YDSmTxZmRgAtj3wV/QBG1pH2gXOU4LM/fLtTEvHPMXbyRI0/yDDs+2pb7l6Vc8f1Qj
         Dd4EiBW5PgCrsY1CDrAeRqIefqktfUjev1xGOd6MvbiwXraxT8cfOZpvxd7zxFSvgpLn
         SbKV5ypH+Et+8OjE/JRtZ+OUvzycqHJI/srntr1Qnr5+HnHS6ni3pJKEn9nxiSvQupHA
         YIxKJKfHa1bba3inyPMUcq01DQQPskz3zBKs/YD97T05fpESRaWZdQ5hHT5dX0smqW8K
         BjOWBV6IunJKdjG8LKQ+dyxHpwXIoxGlm6AQh8NTjGlONHwyz3hOOfA++2dMMz6pJJxt
         FohA==
X-Gm-Message-State: AOAM530d0+l1e3C/hHOUtqF2t3U+bU0wi/ZZoP/s39C/fU2IEerS0yht
        sI88F8m4udGri0AwNoo+N5aAvg==
X-Google-Smtp-Source: ABdhPJxkvg3l/OTDr/Qa+68ugDVBBvJK5k5EoHqTcMq4jl8s0H5hl1Sc7XZD3cX3zXlVv4AOYag6IA==
X-Received: by 2002:a05:6830:211a:: with SMTP id i26mr26146934otc.136.1625889756724;
        Fri, 09 Jul 2021 21:02:36 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 52sm1569775otu.51.2021.07.09.21.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 21:02:36 -0700 (PDT)
Date:   Fri, 9 Jul 2021 23:02:34 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
        viresh.kumar@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Patch v3 1/6] firmware: qcom_scm: Introduce SCM calls to access
 LMh
Message-ID: <YOkb2kD3wpNXIgZ9@yoga>
References: <20210708120656.663851-1-thara.gopinath@linaro.org>
 <20210708120656.663851-2-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708120656.663851-2-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Jul 07:06 CDT 2021, Thara Gopinath wrote:

> Introduce SCM calls to access/configure limits management hardware(LMH).
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> v2->v3:
> 	Added freeing of payload_buf after the scm call in qcom_scm_lmh_dcvsh as per
> 	Matthias review comments.
> 
> v1->v2:
> 	Changed the input parameters in qcom_scm_lmh_dcvsh from payload_buf and
> 	payload_size to payload_fn, payload_reg, payload_val as per Bjorn's review
> 	comments.
> 
>  drivers/firmware/qcom_scm.c | 58 +++++++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h |  4 +++
>  include/linux/qcom_scm.h    | 14 +++++++++
>  3 files changed, 76 insertions(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index ee9cb545e73b..a8d236603e90 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1147,6 +1147,64 @@ int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
>  }
>  EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
>  
> +bool qcom_scm_lmh_dcvsh_available(void)
> +{
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_LMH, QCOM_SCM_LMH_LIMIT_DCVSH);
> +}
> +EXPORT_SYMBOL(qcom_scm_lmh_dcvsh_available);
> +
> +int qcom_scm_lmh_profile_change(u32 profile_id)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_LMH,
> +		.cmd = QCOM_SCM_LMH_LIMIT_PROFILE_CHANGE,
> +		.arginfo = QCOM_SCM_ARGS(1, QCOM_SCM_VAL),
> +		.args[0] = profile_id,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +
> +	return qcom_scm_call(__scm->dev, &desc, NULL);
> +}
> +EXPORT_SYMBOL(qcom_scm_lmh_profile_change);
> +
> +int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
> +		       u64 limit_node, u32 node_id, u64 version)
> +{
> +	dma_addr_t payload_phys;
> +	u32 *payload_buf;
> +	int ret, payload_size = 5 * sizeof(u32);
> +
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_LMH,
> +		.cmd = QCOM_SCM_LMH_LIMIT_DCVSH,
> +		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_VAL,
> +					QCOM_SCM_VAL, QCOM_SCM_VAL),
> +		.args[1] = payload_size,
> +		.args[2] = limit_node,
> +		.args[3] = node_id,
> +		.args[4] = version,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +
> +	payload_buf = dma_alloc_coherent(__scm->dev, payload_size, &payload_phys, GFP_KERNEL);
> +	if (!payload_buf)
> +		return -ENOMEM;
> +
> +	payload_buf[0] = payload_fn;
> +	payload_buf[1] = 0;
> +	payload_buf[2] = payload_reg;
> +	payload_buf[3] = 1;
> +	payload_buf[4] = payload_val;
> +
> +	desc.args[0] = payload_phys;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, NULL);
> +
> +	dma_free_coherent(__scm->dev, payload_size, payload_buf, payload_phys);
> +	return ret;
> +}
> +EXPORT_SYMBOL(qcom_scm_lmh_dcvsh);
> +
>  static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
>  {
>  	struct device_node *tcsr;
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index 632fe3142462..d92156ceb3ac 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -114,6 +114,10 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>  #define QCOM_SCM_SVC_HDCP		0x11
>  #define QCOM_SCM_HDCP_INVOKE		0x01
>  
> +#define QCOM_SCM_SVC_LMH			0x13
> +#define QCOM_SCM_LMH_LIMIT_PROFILE_CHANGE	0x01
> +#define QCOM_SCM_LMH_LIMIT_DCVSH		0x10
> +
>  #define QCOM_SCM_SVC_SMMU_PROGRAM		0x15
>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index 0165824c5128..c0475d1c9885 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -109,6 +109,12 @@ extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
>  			     u32 *resp);
>  
>  extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
> +
> +extern int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
> +			      u64 limit_node, u32 node_id, u64 version);
> +extern int qcom_scm_lmh_profile_change(u32 profile_id);
> +extern bool qcom_scm_lmh_dcvsh_available(void);
> +
>  #else
>  
>  #include <linux/errno.h>
> @@ -170,5 +176,13 @@ static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
>  
>  static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
>  		{ return -ENODEV; }
> +
> +static inline int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
> +				     u64 limit_node, u32 node_id, u64 version)
> +		{ return -ENODEV; }
> +
> +static inline int qcom_scm_lmh_profile_change(u32 profile_id) { return -ENODEV; }
> +
> +static inline bool qcom_scm_lmh_dcvsh_available(void) { return -ENODEV; }
>  #endif
>  #endif
> -- 
> 2.25.1
> 
