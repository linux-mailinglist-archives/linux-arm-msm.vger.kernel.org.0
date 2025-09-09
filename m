Return-Path: <linux-arm-msm+bounces-72820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD780B50069
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C254E7AD2CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D71338F32;
	Tue,  9 Sep 2025 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyBnTsH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC4255E27;
	Tue,  9 Sep 2025 14:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429884; cv=none; b=cVcJkYK4wjRY2PFWYJ9NTGjcNOUzh24LYJ8TS3UOBs/NnJkKZoaKR6a1wtDGKX5GpkfUVlneJgOemXXJgetZXSFJ4dQPavvIle/99cEbwLvzGrPJxHout5XlrbbKO5Z2O7CxFr9HXqGllZ0tnZi3YW0G9cwWvJr+2EvH/150j3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429884; c=relaxed/simple;
	bh=AhYS1yMvT6UZY4gb3lSyTd7YEFXttTdUlw02kjzCzS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip9A31ulW3us8exbqzvhE7rx0IjNd84cgMXnEV6t+WM9DgeECGzP0eu/QLlr+QZezKZAJ4M9w2PO5taxc+K3cK4S87PleKJki2GTFs+xzp3agnbtELrwEpwL5I5E7rgiNR48DfzLDrdOAtXgiFQueeyXc2BOOh88LDfzfsqR/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyBnTsH3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76645C4CEF4;
	Tue,  9 Sep 2025 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757429883;
	bh=AhYS1yMvT6UZY4gb3lSyTd7YEFXttTdUlw02kjzCzS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyBnTsH3dRriP5kf2uS4+LiBcDagW9pxeN1obzP2gB0inxfxry/Tr2XjeGKUW34To
	 T99k4lgGErOmGZ+5GPVORAWpL1vSJxJzxC80p4snLHbce4fxgizBofDswGSn5old7D
	 gsiKG/wfauBHy+4x1ZIExll1W9M82wPu3zCrUo+lfQAd3CcPj5c6dr1Nx9ben30pVO
	 sOLnRlunffd1xDbIzaJA6scW5bDrqNTizK5Nh2kNnJnjpJwmtDzYqVpXtlsjVarJFb
	 YR8rsjMrb/2ZA1eH63dxmDTji8CxLgKB1K7qXwXE8HrAo/lfm1Lyf9HQ3Km/dHirQA
	 rOZ2YeIhs9v1w==
Date: Tue, 9 Sep 2025 09:58:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 06/11] firmware: qcom: scm: add support for object
 invocation
Message-ID: <67c676glro2asxtavghtvczdjcvtxlb5yd6rg2y5ln7ahj2gfq@yqtkle5tnal6>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
 <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-6-a2af23f132d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-6-a2af23f132d5@oss.qualcomm.com>

On Mon, Sep 01, 2025 at 09:55:53PM -0700, Amirreza Zarrabi wrote:
> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
> the secure world, accessed via objects. A QTEE client can invoke these
> objects to request services. Similarly, QTEE can request services from
> the nonsecure world using objects exported to the secure world.
> 
> Add low-level primitives to facilitate the invocation of objects hosted
> in QTEE, as well as those hosted in the nonsecure world.
> 
> If support for object invocation is available, the qcom_scm allocates
> a dedicated child platform device. The driver for this device communicates
> with QTEE using low-level primitives.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 124 +++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   7 ++
>  include/linux/firmware/qcom/qcom_scm.h |   6 ++
>  3 files changed, 137 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index edeae6cdcf31..739ee9819549 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2094,6 +2094,127 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
>  
>  #endif /* CONFIG_QCOM_QSEECOM */
>  
> +/**
> + * qcom_scm_qtee_invoke_smc() - Invoke a QTEE object.
> + * @inbuf: start address of memory area used for inbound buffer.
> + * @inbuf_size: size of the memory area used for inbound buffer.
> + * @outbuf: start address of memory area used for outbound buffer.
> + * @outbuf_size: size of the memory area used for outbound buffer.
> + * @result: result of QTEE object invocation.
> + * @response_type: response type returned by QTEE.
> + *
> + * @response_type determines how the contents of @inbuf and @outbuf
> + * should be processed.
> + *
> + * Return: On success, return 0 or <0 on failure.
> + */
> +int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
> +			     phys_addr_t outbuf, size_t outbuf_size,
> +			     u64 *result, u64 *response_type)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
> +		.cmd = QCOM_SCM_SMCINVOKE_INVOKE,
> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
> +		.args[0] = inbuf,
> +		.args[1] = inbuf_size,
> +		.args[2] = outbuf,
> +		.args[3] = outbuf_size,
> +		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW, QCOM_SCM_VAL,
> +					 QCOM_SCM_RW, QCOM_SCM_VAL),
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	if (response_type)
> +		*response_type = res.result[0];
> +
> +	if (result)
> +		*result = res.result[1];
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(qcom_scm_qtee_invoke_smc);
> +
> +/**
> + * qcom_scm_qtee_callback_response() - Submit response for callback request.
> + * @buf: start address of memory area used for outbound buffer.
> + * @buf_size: size of the memory area used for outbound buffer.
> + * @result: Result of QTEE object invocation.
> + * @response_type: Response type returned by QTEE.
> + *
> + * @response_type determines how the contents of @buf should be processed.
> + *
> + * Return: On success, return 0 or <0 on failure.
> + */
> +int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
> +				    u64 *result, u64 *response_type)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
> +		.cmd = QCOM_SCM_SMCINVOKE_CB_RSP,
> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
> +		.args[0] = buf,
> +		.args[1] = buf_size,
> +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL),
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	if (response_type)
> +		*response_type = res.result[0];
> +
> +	if (result)
> +		*result = res.result[1];
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
> +
> +static void qcom_scm_qtee_free(void *data)
> +{
> +	struct platform_device *qtee_dev = data;
> +
> +	platform_device_unregister(qtee_dev);
> +}
> +
> +static void qcom_scm_qtee_init(struct qcom_scm *scm)
> +{
> +	struct platform_device *qtee_dev;
> +	u64 result, response_type;
> +	int ret;
> +
> +	/*
> +	 * Probe for smcinvoke support. This will fail due to invalid buffers,
> +	 * but first, it checks whether the call is supported in QTEE syscall
> +	 * handler. If it is not supported, -EIO is returned.
> +	 */
> +	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
> +	if (ret == -EIO)
> +		return;
> +
> +	/* Setup QTEE interface device. */
> +	qtee_dev = platform_device_register_data(scm->dev, "qcomtee",
> +						 PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(qtee_dev)) {
> +		dev_err(scm->dev, "qcomtee: register failed: %d\n",
> +			PTR_ERR(qtee_dev));

This isn't going to fail, and all expected paths that it would fail will
be -ENOMEM which already printed a warning. So, I'd suggest that you
resolve the LKP build warning by dropping the print.

> +		return;
> +	}
> +
> +	ret = devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
> +	if (ret)
> +		dev_err(scm->dev, "qcomtee: add action failed: %d\n", ret);

The only possible error here is -ENOMEM, so you can skip the print.

Regards,
Bjorn

> +}
> +
>  /**
>   * qcom_scm_is_available() - Checks if SCM is available
>   */
> @@ -2326,6 +2447,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	ret = qcom_scm_qseecom_init(scm);
>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>  
> +	/* Initialize the QTEE object interface. */
> +	qcom_scm_qtee_init(scm);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index 0e8dd838099e..a56c8212cc0c 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -156,6 +156,13 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_SVC_GPU			0x28
>  #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
>  
> +/* ARM_SMCCC_OWNER_TRUSTED_OS calls */
> +
> +#define QCOM_SCM_SVC_SMCINVOKE			0x06
> +#define QCOM_SCM_SMCINVOKE_INVOKE_LEGACY	0x00
> +#define QCOM_SCM_SMCINVOKE_CB_RSP		0x01
> +#define QCOM_SCM_SMCINVOKE_INVOKE		0x02
> +
>  /* common error codes */
>  #define QCOM_SCM_V2_EBUSY	-12
>  #define QCOM_SCM_ENOMEM		-5
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index 0f667bf1d4d9..a55ca771286b 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -175,4 +175,10 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
>  
>  #endif /* CONFIG_QCOM_QSEECOM */
>  
> +int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
> +			     phys_addr_t outbuf, size_t outbuf_size,
> +			     u64 *result, u64 *response_type);
> +int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
> +				    u64 *result, u64 *response_type);
> +
>  #endif
> 
> -- 
> 2.34.1
> 

