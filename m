Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D59A3DBD2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 18:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhG3Qg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 12:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhG3Qg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 12:36:56 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E6FC0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 09:36:50 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id n16so7346549oij.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 09:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+VAdv+WeR1jvOvgcgnqcYxpRfRpHfv5qO3GWKK9dmZw=;
        b=LMBohOITePzc4wVsTkFVhKygBXZW4iqgqr2pshr0IqV5u30sIL8eN1nNetsNSxtslD
         lXY9rHs5iWFhNBa36KgiFggL/E2bEc/L8pGCNbdfg5n5ujjQBUPZcBtvrw/HipQOqqy3
         Rphy/TGaj1NfoXlRQKp8Bc4McAATWnXDGrWIVHkz+NHASH3PqVvlEk0SqeWV3NzUTqbm
         FgFfUetOtWSOCy+eEHRQRXo2tLraleRZ92zu3BDHRO2LoXBwTcu3+WEZv5NvKVYIQGrP
         QaOBRSHoD9iI3iFSoYye911ZQngN9QIpB84gvYZxoZ2R+IR7XxwyRiEjWLf+ScM01e/+
         eAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+VAdv+WeR1jvOvgcgnqcYxpRfRpHfv5qO3GWKK9dmZw=;
        b=FE0FvKgi0VFBLx0Zv71wn3omBEc+W2YLffRh5pd4z6khyaWfwCsFsmBFYdbw1YZsQf
         XOLuaVzRXinHjWdQPlNpdARai7vPYv3b9JvEoo7Y/0n7QGYF1JF2F2LMtEfgj4V1wEZe
         VkPcRMfRmD+xTddi6F/gUCNPs1tRDKPoGrAhzzoPmla9eJkVQCMbpGf/+PXFwX42Ug5h
         PxXLAmW2BVLDBsQFSHHyQ47pP/rq6QvcpYiJZhdw9kgKe/8myAvwGaTy3sss/DGjiCOX
         dkwm4ayjciL+MpHKtp/aIOIb4YPo4xYOHBJN1+OaD/JIu6mto/efvTMB2Nap4fRyvYQe
         OzxQ==
X-Gm-Message-State: AOAM5324XFQJkHIDIk85a/jGMbn0TCUzLMZOaF8+1oCBuPIXXiTK/lg+
        kdVRFkasW5B+xdCotxSnjHYOgQ==
X-Google-Smtp-Source: ABdhPJy9S4ERYG+NYbJHmT2b4l+CRSgIl/ARguLUHnMpNudWlcP48MLgOOQajgy8+J2pt07NuVzEjQ==
X-Received: by 2002:aca:f54c:: with SMTP id t73mr2367532oih.175.1627663009726;
        Fri, 30 Jul 2021 09:36:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w24sm372033otp.28.2021.07.30.09.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 09:36:49 -0700 (PDT)
Date:   Fri, 30 Jul 2021 11:36:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     mka@chromium.org, swboyd@chromium.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v4 04/13] remoteproc: qcom: q6v5: Use qmp_send to update
 co-processor load state
Message-ID: <YQQqnoOJLP9ixWn1@builder.lan>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
 <1626755807-11865-5-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626755807-11865-5-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 19 Jul 23:36 CDT 2021, Sibi Sankar wrote:

> The power domains exposed by the AOSS QMP driver control the load state
> resources linked to modem, adsp, cdsp remoteprocs. These are used to
> notify the Always on Subsystem (AOSS) that a particular co-processor is
> up/down. AOSS uses this information to wait for the co-processors to
> suspend before starting its sleep sequence.
> 
> These co-processors enter low-power modes independent to that of the
> application processor and the load state resources linked to them are
> expected to remain unaltered across system suspend/resume cycles. To
> achieve this behavior lets stop using the power-domains exposed by the
> AOSS QMP node and replace them with generic qmp_send interface instead.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v4:
>  * Drop unused pdev and kfree the load state string in q6v5_deinit
>    /probe path for patch 4. [Matthias]
> 
>  drivers/remoteproc/qcom_q6v5.c      | 57 ++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5.h      |  7 ++-
>  drivers/remoteproc/qcom_q6v5_adsp.c |  7 ++-
>  drivers/remoteproc/qcom_q6v5_mss.c  | 44 ++++---------------
>  drivers/remoteproc/qcom_q6v5_pas.c  | 85 +++++++++----------------------------
>  drivers/remoteproc/qcom_q6v5_wcss.c |  4 +-
>  6 files changed, 96 insertions(+), 108 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 7e9244c748da..997ff21271f7 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -16,8 +16,28 @@
>  #include "qcom_common.h"
>  #include "qcom_q6v5.h"
>  
> +#define Q6V5_LOAD_STATE_MSG_LEN	64
>  #define Q6V5_PANIC_DELAY_MS	200
>  
> +static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
> +{
> +	char buf[Q6V5_LOAD_STATE_MSG_LEN] = {};
> +	int ret;
> +
> +	if (IS_ERR(q6v5->qmp))

I would prefer that you keep it NULL when there's no qmp.

> +		return 0;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "{class: image, res: load_state, name: %s, val: %s}",
> +		 q6v5->load_state, enable ? "on" : "off");
> +
> +	ret = qmp_send(q6v5->qmp, buf, sizeof(buf));
> +	if (ret)
> +		dev_err(q6v5->dev, "failed to toggle load state\n");
> +
> +	return ret;
> +}
> +
>  /**
>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
>   * @q6v5:	reference to qcom_q6v5 context to be reinitialized
> @@ -26,6 +46,12 @@
>   */
>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
>  {
> +	int ret;
> +
> +	ret = q6v5_load_state_toggle(q6v5, true);
> +	if (ret)
> +		return ret;
> +
>  	reinit_completion(&q6v5->start_done);
>  	reinit_completion(&q6v5->stop_done);
>  
> @@ -47,6 +73,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
>  {
>  	disable_irq(q6v5->handover_irq);
> +	q6v5_load_state_toggle(q6v5, false);
>  
>  	return !q6v5->handover_issued;
>  }
> @@ -196,12 +223,13 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   * @pdev:	platform_device reference for acquiring resources
>   * @rproc:	associated remoteproc instance
>   * @crash_reason: SMEM id for crash reason string, or 0 if none
> + * @load_state: load state resource string
>   * @handover:	function to be called when proxy resources should be released
>   *
>   * Return: 0 on success, negative errno on failure
>   */
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
> -		   struct rproc *rproc, int crash_reason,
> +		   struct rproc *rproc, int crash_reason, const char *load_state,
>  		   void (*handover)(struct qcom_q6v5 *q6v5))
>  {
>  	int ret;
> @@ -286,9 +314,36 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  		return PTR_ERR(q6v5->state);
>  	}
>  
> +	q6v5->load_state = kstrdup_const(load_state, GFP_KERNEL);

Can't you use devm_kstrdup_const(&pdev->dev, ...) for this?

> +	q6v5->qmp = qmp_get(&pdev->dev);
> +	if (IS_ERR(q6v5->qmp)) {
> +		if (PTR_ERR(q6v5->qmp) != -ENODEV) {
> +			if (PTR_ERR(q6v5->qmp) != -EPROBE_DEFER)
> +				dev_err(&pdev->dev, "failed to acquire load state\n");
> +			kfree_const(q6v5->load_state);

Then you don't need to free it here.

> +			return PTR_ERR(q6v5->qmp);
> +		}
> +	} else {
> +		if (!q6v5->load_state) {
> +			dev_err(&pdev->dev, "load state resource string empty\n");
> +			return -EINVAL;

I see two cases here:

1) kstrdup_const() failed to allocate memory, the error print is
unnecessary and misleading and it would be more appropriate to return
-ENOMEM.

2) kstrdup_const() failed because you passed load_state == NULL, in
which case the error message could be more helpful by saying "unexpected
qcom,qmp property found" or something like that.

> +		}
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(qcom_q6v5_init);
>  
> +/**
> + * qcom_q6v5_deinit() - deinitialize the q6v5 common struct
> + * @q6v5:	reference to qcom_q6v5 context to be deinitialized
> + */
> +void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5)
> +{
> +	kfree_const(q6v5->load_state);
> +	qmp_put(q6v5->qmp);
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_deinit);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Qualcomm Peripheral Image Loader for Q6V5");
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 1c212f670cbc..f35e04471ed7 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -5,6 +5,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/completion.h>
> +#include <linux/soc/qcom/qcom_aoss.h>
>  
>  struct rproc;
>  struct qcom_smem_state;
> @@ -15,6 +16,8 @@ struct qcom_q6v5 {
>  	struct rproc *rproc;
>  
>  	struct qcom_smem_state *state;
> +	struct qmp *qmp;
> +
>  	unsigned stop_bit;
>  
>  	int wdog_irq;
> @@ -32,12 +35,14 @@ struct qcom_q6v5 {
>  
>  	bool running;
>  
> +	const char *load_state;
>  	void (*handover)(struct qcom_q6v5 *q6v5);
>  };
>  
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
> -		   struct rproc *rproc, int crash_reason,
> +		   struct rproc *rproc, int crash_reason, const char *load_state,
>  		   void (*handover)(struct qcom_q6v5 *q6v5));
> +void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
>  
>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 8b0d8bbacd2e..098362e6e233 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -185,7 +185,9 @@ static int adsp_start(struct rproc *rproc)
>  	int ret;
>  	unsigned int val;
>  
> -	qcom_q6v5_prepare(&adsp->q6v5);
> +	ret = qcom_q6v5_prepare(&adsp->q6v5);
> +	if (ret)
> +		return ret;

In the (hopefully unlikely) case that we have instances of
qcom_q6v5_prepare() failing today, the switch to the new qmp interface
would also introduce a regression in the same commit.

Could you please add the error handling in a separate commit? Just so
that we can pinpoint which of the two changes caused any issues if we
need to bisect this?

Regards,
Bjorn
