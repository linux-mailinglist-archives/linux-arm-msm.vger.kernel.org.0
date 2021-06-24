Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925643B34FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 19:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbhFXRu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 13:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhFXRu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 13:50:58 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFE4C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:48:38 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id h1so3356143plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J4PJUucpibDnG3QpPqzDVfqLhw0sdHSMYuZQn4I2GAw=;
        b=WcJUtvqFiotpP7LSYJMlPARdJr+vmPdZmJ3Cp/Vlgpu+MbvlDBEScPrY1fBz5rPVlP
         1+1xwug16fD5GxLSoUgeWG3S2qMKjf7ZEWdHxad7R9iN7dynCxnVkDbxl0cXfqjnq+yw
         RFOCK8qMu3zCam96waIjGa/FuusCTKO7/umt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J4PJUucpibDnG3QpPqzDVfqLhw0sdHSMYuZQn4I2GAw=;
        b=mi4GYd2/uXtOzRGplyFXEWWRxOrEbs4Md+OtwZ/VQPTiMk3DldkbHaIZlFYe8JRZfV
         vMF4b7jvmJ0Ho9xRo+aEygrcUZekcyn88lKxjmTbjxMF37N0DYy+rf5OV1oQOWj53amw
         yyOXNODFETWbk0bsTRgZH1MoN9yqgMjD2maJusT4aaYWL9OGPCFaWuF7GeVnDDlwcBD0
         60iZ+Fm4pIcUZ32D28o6vR6VftpH548hwpB/bmkSt8Fb9Gz350p9ub3ge2iyIlrqVcpo
         HpYtGIKEc68qxTUkaWtIc2XWHo6NNg6dUaRgLjMIJQnSkOmwoGv5FavRMRyEmCiHFrBb
         bXEA==
X-Gm-Message-State: AOAM533KKvMR7LFt4UoNO7hX3OckUEtjbLOtosabAxJcA0NK7fJBz2Bd
        pAvEUAl/tuefO1rAhYapbMSwXA==
X-Google-Smtp-Source: ABdhPJwbCIN0ZvlG+tQkq/dvIkKiYPYS0aOC9zWeDxW8HFtqFmKMWbBv9bJobmoKq/Z/fJz4UQQy2w==
X-Received: by 2002:a17:902:e850:b029:127:a2ed:9924 with SMTP id t16-20020a170902e850b0290127a2ed9924mr1868196plg.57.1624556918156;
        Thu, 24 Jun 2021 10:48:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:dda9:4015:5d1f:23fe])
        by smtp.gmail.com with UTF8SMTPSA id g13sm3591017pfv.65.2021.06.24.10.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 10:48:37 -0700 (PDT)
Date:   Thu, 24 Jun 2021 10:48:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Patch v2 1/5] firmware: qcom_scm: Introduce SCM calls to access
 LMh
Message-ID: <YNTFdCPU2saMCT/y@google.com>
References: <20210624115813.3613290-1-thara.gopinath@linaro.org>
 <20210624115813.3613290-2-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210624115813.3613290-2-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 07:58:09AM -0400, Thara Gopinath wrote:
> Introduce SCM calls to access/configure limits management hardware(LMH).
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
> 
> v1->v2:
> 	Changed the input parameters in qcom_scm_lmh_dcvsh from payload_buf and
> 	payload_size to payload_fn, payload_reg, payload_val as per Bjorn's review
> 	comments.
> 
>  drivers/firmware/qcom_scm.c | 54 +++++++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h |  4 +++
>  include/linux/qcom_scm.h    | 14 ++++++++++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index ee9cb545e73b..19e9fb91d084 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1147,6 +1147,60 @@ int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
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
> +	int payload_size = 5 * sizeof(u32);
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
> +	return qcom_scm_call(__scm->dev, &desc, NULL);

dma_free_coherent()?
