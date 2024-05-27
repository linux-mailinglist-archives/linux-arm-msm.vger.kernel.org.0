Return-Path: <linux-arm-msm+bounces-20491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186078CF6E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 02:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C874E2814C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 00:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC95C1A2C09;
	Mon, 27 May 2024 00:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiWZpHOm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912AD2107;
	Mon, 27 May 2024 00:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716768202; cv=none; b=OzEtulal0QwdH+CS/UBanpk/UEpgIns6mYRftkHLc5olL9vjb0XaoZAo3xC7/u1uou1Jzt48IZqzdaeVMNTDhdDBo2zQEh0bqx8ChQH4uFE59kqetfhcx4OsbuhZ+E+QFuTJIh3sqE4HUkE8p4rTpsuy+02ob7BGjiqndzieHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716768202; c=relaxed/simple;
	bh=Mz3OF3B15X3H0lFrcQA68DoS91Or2bDicgLrhyGKkHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFn9hTVxVZIEPoQXLP4ZlhlNmxvqUxRfyn5s1U1JKGra4aOFlCEG1+QuDYMyHdZH9QRMNbVBSLS+g/YGYsJMP2slqSkFkd0w3EyKH67MEFo6FdEgty+JDsJW4pzlA/uLOHsqpUGQTCOjMgmJMNKRt9eMDhnAAvxHDMQAZOXUM3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiWZpHOm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72ECC2BD10;
	Mon, 27 May 2024 00:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716768202;
	bh=Mz3OF3B15X3H0lFrcQA68DoS91Or2bDicgLrhyGKkHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PiWZpHOmjAl9W7sSk/AgizPxT4u6NWhZCOXL9upKTDepm+qKTvZ7eDCLfAixbOF6q
	 IbsyX0FsJ0Pgibq2XOV1KDtBTfg3MCqKg9kSX76bFTI95JIavlYfmGbVdeq9u0pc/i
	 7gTcLx3TogltDrGtDRXKAAsBe7QZYXRmAU4Wh0/95T1W6FMrz2o51i6AAWQ++KK/i+
	 mHs21opCxjoBOUPK9MuRj8cYL3L1RUHDoQNyou0uz1/jPcgliZD6v+y0aY8gIQS+1f
	 Bwd8zGM/VEkjL7sM3DUMNTvUZZ/YXv5DDzZf/54PPqHBodMIahLU4C/poid5uke4c9
	 iJMTFOBG4YPDQ==
Date: Sun, 26 May 2024 19:03:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/6] firmware: qcom_scm: Add gpu_init_regs call
Message-ID: <5uvps3a2zn2q4eokzx5ptmylid4cqt6e6gaasv4qssblczaklv@yr3nfhswn7dt>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>

On Tue, Apr 30, 2024 at 11:43:16AM GMT, Connor Abbott wrote:
> This will used by drm/msm to initialize GPU registers that Qualcomm's
> firmware doesn't make writeable to the kernel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/firmware/qcom/qcom_scm.c       | 14 ++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |  3 +++
>  include/linux/firmware/qcom/qcom_scm.h | 23 +++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 06e46267161b..f8623ad0987c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1394,6 +1394,20 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
>  
> +int qcom_scm_gpu_init_regs(u32 gpu_req)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_GPU,
> +		.cmd = QCOM_SCM_SVC_GPU_INIT_REGS,
> +		.arginfo = QCOM_SCM_ARGS(1),
> +		.args[0] = gpu_req,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +
> +	return qcom_scm_call(__scm->dev, &desc, NULL);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
> +
>  static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
>  {
>  	struct device_node *tcsr;
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index 4532907e8489..484e030bcac9 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -138,6 +138,9 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>  #define QCOM_SCM_WAITQ_RESUME			0x02
>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
>  
> +#define QCOM_SCM_SVC_GPU			0x28
> +#define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
> +
>  /* common error codes */
>  #define QCOM_SCM_V2_EBUSY	-12
>  #define QCOM_SCM_ENOMEM		-5
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index aaa19f93ac43..a221a643dc12 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -115,6 +115,29 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
>  int qcom_scm_lmh_profile_change(u32 profile_id);
>  bool qcom_scm_lmh_dcvsh_available(void);
>  
> +/*
> + * Request TZ to program set of access controlled registers necessary
> + * irrespective of any features
> + */
> +#define QCOM_SCM_GPU_ALWAYS_EN_REQ BIT(0)
> +/*
> + * Request TZ to program BCL id to access controlled register when BCL is
> + * enabled
> + */
> +#define QCOM_SCM_GPU_BCL_EN_REQ BIT(1)
> +/*
> + * Request TZ to program set of access controlled register for CLX feature
> + * when enabled
> + */
> +#define QCOM_SCM_GPU_CLX_EN_REQ BIT(2)
> +/*
> + * Request TZ to program tsense ids to access controlled registers for reading
> + * gpu temperature sensors
> + */
> +#define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
> +
> +int qcom_scm_gpu_init_regs(u32 gpu_req);
> +
>  #ifdef CONFIG_QCOM_QSEECOM
>  
>  int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
> 
> -- 
> 2.31.1
> 

