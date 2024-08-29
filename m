Return-Path: <linux-arm-msm+bounces-29888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D56029639DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 07:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06D401C208A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 05:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620273BBF6;
	Thu, 29 Aug 2024 05:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S4o8QgBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B9250A63
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909463; cv=none; b=gnvJTNiZQt+17WfOLs0OHGwTdtz8kCNSmKED3Fng2NdfPlDnx169NTpDpCgaUxmyvtDwvvKjxz35AgSrYM/IjWqMCiTsYGSIaHwmpNQ1VQgNJbcmPAhNyIgyoBGsfT3SS6i2E2HB8PIFGtBAB9SIfsbui4v0yoGysaAJhmJZLso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909463; c=relaxed/simple;
	bh=2dKq/UZ8Dpf/AKT/HSEI8y8wZ6iAvyUSVmaZmfPcrqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbkeaZNVj+VyzY1+Ckq8L3gizVPYJ9djxJZR50hafRnEd0nH0MhzpR8pu6PfBCnGN7gLCdmqxBjl/CICkKg668NeV0I6WY5pabaUhqfAEWcs7zNHtIebnPWLShepVM62LmCeyeLXeATduu9IoBtgkkHlrmilqe45AK4Cj16hveY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S4o8QgBD; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f40a1a2c1aso2224241fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 22:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724909459; x=1725514259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CIzMmTRkGA7fcteBm5LFX1j9BzxYG1gBQuvO81bGtg=;
        b=S4o8QgBDeCnQib0YInBMnzasrrZsE6YvpbY2RnCJZNbTSC9MrESmEKy0Uj7wFaG7Jw
         N9iUPwdz6MOffpQMO7JKDgx45IUdNgaVkk7ZcO4mMbOxcZijatIWY9vnLlLmKDWTFIHZ
         BaRvwpKbTPc1jtfhscTQzr6r52WolclzbCq8ESPetbDoyr5V7EXDu76nrdgrwc09lsCz
         4tvfT4qj8mQn0isyjmb0U2yDvqwFdm9WXTvzYuW7bY4IRsofC1pyb2yroilu2rtSgoCS
         9lEHOmtuqPlknTapt8C/yogmlHXnC/BtRUaYnIx/bTH8TNpKq7jDhFTtv2X943Mvw1vT
         Gv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724909459; x=1725514259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CIzMmTRkGA7fcteBm5LFX1j9BzxYG1gBQuvO81bGtg=;
        b=XD10ExHB6Sfwx4WNMMEnGavdet06fI0MtrYYc7NvbaMsjHHWfoIagGCzO8e5A0N3uN
         2F4/+XJ3lZiXwdTFBiA6S2UbzqbNHsgQ0l6f9hRcG62LPggYZC4o9uOiGLVEE3aCKhyF
         DSx+esuIJ2rcspqOrbxSUG+QYwj0Q2HJKovE5BFUVj5Ivk30/4AjzqUzNgk3e9frOvjk
         yNYSjXGsEgo4bDXP3jGWAK3eAzxoNSyqyZ/eh43NUP761xoFzhSsdE6Pvbuz4PknTy3k
         CtneSLpkrlfCa0mOxMObHnWFYpDApKYoY7APOQ2RdKbryMR2A/rG5fBlsGLUe0mxQOOp
         BDfA==
X-Forwarded-Encrypted: i=1; AJvYcCUoheXS+2QNzAs3pM0fSLywb2M2DunP6tOfjgz/RovWazXQIeL+rYMc0uluhLW5AgICOg1UMhyC3kVnQMdw@vger.kernel.org
X-Gm-Message-State: AOJu0YwAyNXpW+GnFdnqZICmheBQPKcLzl7LSVzL2y9ZJtr6FQ/mfYRS
	Nxu9O9IzII+pi1n6N3wmNqq+6lKhROnQV4eozOO8/JOMQQ3P0UhSaAcpl4arCKI=
X-Google-Smtp-Source: AGHT+IFcevs6v+jYCvVgCd1Rp/TOvauBVDsg9YIalcR8amVG6J/bYqbj+BYM6j5V7p1uwSEmxwjNzg==
X-Received: by 2002:a05:651c:547:b0:2ef:1b1f:4b4f with SMTP id 38308e7fff4ca-2f6104f259bmr11123421fa.34.1724909458031;
        Wed, 28 Aug 2024 22:30:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f61518266esm793391fa.105.2024.08.28.22.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 22:30:57 -0700 (PDT)
Date: Thu, 29 Aug 2024 08:30:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, quic_viswanat@quicinc.com, 
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V5 1/1] remoteproc: qcom: q6v5: Get crash reason from
 specific SMEM partition
Message-ID: <psj2e2abn7w24feyxiyir7ucirmgwze4u2ewfcscmtmrmcjto7@2gyfyeivkv4f>
References: <20240820091231.445580-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820091231.445580-1-quic_gokulsri@quicinc.com>

On Tue, Aug 20, 2024 at 02:42:31PM GMT, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> q6v5 fatal and watchdog IRQ handlers always retrieves the crash reason
> information from SMEM global partition (QCOM_SMEM_HOST_ANY).
> 
> For some targets like IPQ9574 and IPQ5332, crash reason information is
> present in target specific partition due to which the crash reason is
> not printed in the current implementation.
> 
> Add support to pass crash_reason_partition along with crash_reason_item
> number in qcom_q6v5_init call and use the same to get the crash information
> from SMEM in fatal and watchdog IRQ handlers.
> 
> While at it, rename all instances of "crash_reason_smem" with
> "crash_reason_item" as this reflects the proper meaning.

"While at it" => separate commits, plesae.

> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>

Missing your sign-off.

> ---
> 
> This change depends on WCSS secure PIL driver [1].
> 
> Changes in V5: Added changes to WCSS secure PIL driver.
> 
> Changes in V4: Rename all instances of crash_reason_smem to
> crash_reason_item
> 
> Changes in V3: Updated commit message.
> 
> Changes in V2: Addressed comments in V1.

Which comments?

> 
> [1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240820085517.435566-1-quic_gokulsri@quicinc.com/
> 
>  drivers/remoteproc/qcom_q6v5.c          | 10 ++--
>  drivers/remoteproc/qcom_q6v5.h          |  6 ++-
>  drivers/remoteproc/qcom_q6v5_adsp.c     | 17 +++---
>  drivers/remoteproc/qcom_q6v5_mss.c      |  5 +-
>  drivers/remoteproc/qcom_q6v5_pas.c      | 69 +++++++++++++------------
>  drivers/remoteproc/qcom_q6v5_wcss.c     | 12 +++--
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c |  3 +-
>  7 files changed, 66 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 4ee5e67a9f03..4d801ba3c791 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -100,7 +100,7 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>  		return IRQ_HANDLED;
>  	}
>  
> -	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
> +	msg = qcom_smem_get(q6v5->crash_reason_partition, q6v5->crash_reason_item, &len);
>  	if (!IS_ERR(msg) && len > 0 && msg[0])
>  		dev_err(q6v5->dev, "watchdog received: %s\n", msg);
>  	else
> @@ -121,7 +121,7 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>  	if (!q6v5->running)
>  		return IRQ_HANDLED;
>  
> -	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
> +	msg = qcom_smem_get(q6v5->crash_reason_partition, q6v5->crash_reason_item, &len);
>  	if (!IS_ERR(msg) && len > 0 && msg[0])
>  		dev_err(q6v5->dev, "fatal error received: %s\n", msg);
>  	else
> @@ -244,14 +244,16 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   * Return: 0 on success, negative errno on failure
>   */
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
> -		   struct rproc *rproc, int crash_reason, const char *load_state,
> +		   struct rproc *rproc, int crash_reason_partition,
> +		   int crash_reason_item, const char *load_state,
>  		   void (*handover)(struct qcom_q6v5 *q6v5))
>  {
>  	int ret;
>  
>  	q6v5->rproc = rproc;
>  	q6v5->dev = &pdev->dev;
> -	q6v5->crash_reason = crash_reason;
> +	q6v5->crash_reason_partition = crash_reason_partition;
> +	q6v5->crash_reason_item = crash_reason_item;
>  	q6v5->handover = handover;
>  
>  	init_completion(&q6v5->start_done);
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 5a859c41896e..7cdfa21fd9e4 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -34,7 +34,8 @@ struct qcom_q6v5 {
>  	struct completion start_done;
>  	struct completion stop_done;
>  
> -	int crash_reason;
> +	int crash_reason_partition;
> +	int crash_reason_item;
>  
>  	bool running;
>  
> @@ -43,7 +44,8 @@ struct qcom_q6v5 {
>  };
>  
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
> -		   struct rproc *rproc, int crash_reason, const char *load_state,
> +		   struct rproc *rproc, int crash_reason_partition,
> +		   int crash_reason_item, const char *load_state,
>  		   void (*handover)(struct qcom_q6v5 *q6v5));
>  void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 572dcb0f055b..174b0e213b12 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -60,7 +60,7 @@
>  #define LPASS_EFUSE_Q6SS_EVB_SEL 0x0
>  
>  struct adsp_pil_data {
> -	int crash_reason_smem;
> +	int crash_reason_item;
>  	const char *firmware_name;
>  
>  	const char *ssr_name;
> @@ -97,7 +97,7 @@ struct qcom_adsp {
>  	struct regmap *halt_map;
>  	unsigned int halt_lpass;
>  
> -	int crash_reason_smem;
> +	int crash_reason_item;
>  	const char *info_name;
>  
>  	struct completion start_done;
> @@ -721,8 +721,9 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_pm;
>  
> -	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
> -			     desc->load_state, qcom_adsp_pil_handover);
> +	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
> +			     desc->crash_reason_item, desc->load_state,
> +			     qcom_adsp_pil_handover);
>  	if (ret)
>  		goto disable_pm;
>  
> @@ -764,7 +765,7 @@ static void adsp_remove(struct platform_device *pdev)
>  }
>  
>  static const struct adsp_pil_data adsp_resource_init = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.ssr_name = "lpass",
>  	.sysmon_name = "adsp",
> @@ -781,7 +782,7 @@ static const struct adsp_pil_data adsp_resource_init = {
>  };
>  
>  static const struct adsp_pil_data adsp_sc7280_resource_init = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.pbn",
>  	.load_state = "adsp",
>  	.ssr_name = "lpass",
> @@ -796,7 +797,7 @@ static const struct adsp_pil_data adsp_sc7280_resource_init = {
>  };
>  
>  static const struct adsp_pil_data cdsp_resource_init = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.ssr_name = "cdsp",
>  	.sysmon_name = "cdsp",
> @@ -813,7 +814,7 @@ static const struct adsp_pil_data cdsp_resource_init = {
>  };
>  
>  static const struct adsp_pil_data wpss_resource_init = {
> -	.crash_reason_smem = 626,
> +	.crash_reason_item = 626,
>  	.firmware_name = "wpss.mdt",
>  	.ssr_name = "wpss",
>  	.sysmon_name = "wpss",
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2a42215ce8e0..bfa2a1966e83 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -26,6 +26,7 @@
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/smem.h>
>  #include <linux/iopoll.h>
>  #include <linux/slab.h>
>  
> @@ -2094,8 +2095,8 @@ static int q6v5_probe(struct platform_device *pdev)
>  	qproc->need_mem_protection = desc->need_mem_protection;
>  	qproc->has_mba_logs = desc->has_mba_logs;
>  
> -	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
> -			     qcom_msa_handover);
> +	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
> +			     MPSS_CRASH_REASON_SMEM, "modem", qcom_msa_handover);
>  	if (ret)
>  		goto detach_proxy_pds;
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 88e7b84f223c..ab34bcde7331 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -36,7 +36,7 @@
>  #define MAX_ASSIGN_COUNT 3
>  
>  struct adsp_data {
> -	int crash_reason_smem;
> +	int crash_reason_item;
>  	const char *firmware_name;
>  	const char *dtb_firmware_name;
>  	int pas_id;
> @@ -81,7 +81,7 @@ struct qcom_adsp {
>  	int dtb_pas_id;
>  	int lite_pas_id;
>  	unsigned int minidump_id;
> -	int crash_reason_smem;
> +	int crash_reason_item;
>  	unsigned int smem_host_id;
>  	bool decrypt_shutdown;
>  	const char *info_name;
> @@ -771,7 +771,8 @@ static int adsp_probe(struct platform_device *pdev)
>  		goto free_rproc;
>  	adsp->proxy_pd_count = ret;
>  
> -	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, desc->load_state,
> +	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
> +			     desc->crash_reason_item, desc->load_state,
>  			     qcom_pas_handover);
>  	if (ret)
>  		goto detach_proxy_pds;
> @@ -820,7 +821,7 @@ static void adsp_remove(struct platform_device *pdev)
>  }
>  
>  static const struct adsp_data adsp_resource_init = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
>  	.auto_boot = true,
> @@ -830,7 +831,7 @@ static const struct adsp_data adsp_resource_init = {
>  };
>  
>  static const struct adsp_data sdm845_adsp_resource_init = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
>  	.auto_boot = true,
> @@ -841,7 +842,7 @@ static const struct adsp_data sdm845_adsp_resource_init = {
>  };
>  
>  static const struct adsp_data sm6350_adsp_resource = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
>  	.auto_boot = true,
> @@ -857,7 +858,7 @@ static const struct adsp_data sm6350_adsp_resource = {
>  };
>  
>  static const struct adsp_data sm6375_mpss_resource = {
> -	.crash_reason_smem = 421,
> +	.crash_reason_item = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
>  	.minidump_id = 3,
> @@ -872,7 +873,7 @@ static const struct adsp_data sm6375_mpss_resource = {
>  };
>  
>  static const struct adsp_data sm8150_adsp_resource = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
>  	.auto_boot = true,
> @@ -887,7 +888,7 @@ static const struct adsp_data sm8150_adsp_resource = {
>  };
>  
>  static const struct adsp_data sm8250_adsp_resource = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
>  	.auto_boot = true,
> @@ -903,7 +904,7 @@ static const struct adsp_data sm8250_adsp_resource = {
>  };
>  
>  static const struct adsp_data sm8350_adsp_resource = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
>  	.auto_boot = true,
> @@ -919,7 +920,7 @@ static const struct adsp_data sm8350_adsp_resource = {
>  };
>  
>  static const struct adsp_data msm8996_adsp_resource = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
>  	.auto_boot = true,
> @@ -933,7 +934,7 @@ static const struct adsp_data msm8996_adsp_resource = {
>  };
>  
>  static const struct adsp_data cdsp_resource_init = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
>  	.auto_boot = true,
> @@ -943,7 +944,7 @@ static const struct adsp_data cdsp_resource_init = {
>  };
>  
>  static const struct adsp_data sdm845_cdsp_resource_init = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
>  	.auto_boot = true,
> @@ -954,7 +955,7 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
>  };
>  
>  static const struct adsp_data sm6350_cdsp_resource = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
>  	.auto_boot = true,
> @@ -970,7 +971,7 @@ static const struct adsp_data sm6350_cdsp_resource = {
>  };
>  
>  static const struct adsp_data sm8150_cdsp_resource = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
>  	.auto_boot = true,
> @@ -985,7 +986,7 @@ static const struct adsp_data sm8150_cdsp_resource = {
>  };
>  
>  static const struct adsp_data sm8250_cdsp_resource = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
>  	.auto_boot = true,
> @@ -1000,7 +1001,7 @@ static const struct adsp_data sm8250_cdsp_resource = {
>  };
>  
>  static const struct adsp_data sc8280xp_nsp0_resource = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
>  	.auto_boot = true,
> @@ -1014,7 +1015,7 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
>  };
>  
>  static const struct adsp_data sc8280xp_nsp1_resource = {
> -	.crash_reason_smem = 633,
> +	.crash_reason_item = 633,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 30,
>  	.auto_boot = true,
> @@ -1028,7 +1029,7 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
>  };
>  
>  static const struct adsp_data x1e80100_adsp_resource = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.dtb_firmware_name = "adsp_dtb.mdt",
>  	.pas_id = 1,
> @@ -1048,7 +1049,7 @@ static const struct adsp_data x1e80100_adsp_resource = {
>  };
>  
>  static const struct adsp_data x1e80100_cdsp_resource = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.dtb_firmware_name = "cdsp_dtb.mdt",
>  	.pas_id = 18,
> @@ -1068,7 +1069,7 @@ static const struct adsp_data x1e80100_cdsp_resource = {
>  };
>  
>  static const struct adsp_data sm8350_cdsp_resource = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
>  	.auto_boot = true,
> @@ -1084,7 +1085,7 @@ static const struct adsp_data sm8350_cdsp_resource = {
>  };
>  
>  static const struct adsp_data mpss_resource_init = {
> -	.crash_reason_smem = 421,
> +	.crash_reason_item = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
>  	.minidump_id = 3,
> @@ -1101,7 +1102,7 @@ static const struct adsp_data mpss_resource_init = {
>  };
>  
>  static const struct adsp_data sc8180x_mpss_resource = {
> -	.crash_reason_smem = 421,
> +	.crash_reason_item = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
>  	.auto_boot = false,
> @@ -1116,7 +1117,7 @@ static const struct adsp_data sc8180x_mpss_resource = {
>  };
>  
>  static const struct adsp_data msm8996_slpi_resource_init = {
> -	.crash_reason_smem = 424,
> +	.crash_reason_item = 424,
>  	.firmware_name = "slpi.mdt",
>  	.pas_id = 12,
>  	.auto_boot = true,
> @@ -1130,7 +1131,7 @@ static const struct adsp_data msm8996_slpi_resource_init = {
>  };
>  
>  static const struct adsp_data sdm845_slpi_resource_init = {
> -	.crash_reason_smem = 424,
> +	.crash_reason_item = 424,
>  	.firmware_name = "slpi.mdt",
>  	.pas_id = 12,
>  	.auto_boot = true,
> @@ -1146,7 +1147,7 @@ static const struct adsp_data sdm845_slpi_resource_init = {
>  };
>  
>  static const struct adsp_data wcss_resource_init = {
> -	.crash_reason_smem = 421,
> +	.crash_reason_item = 421,
>  	.firmware_name = "wcnss.mdt",
>  	.pas_id = 6,
>  	.auto_boot = true,
> @@ -1156,7 +1157,7 @@ static const struct adsp_data wcss_resource_init = {
>  };
>  
>  static const struct adsp_data sdx55_mpss_resource = {
> -	.crash_reason_smem = 421,
> +	.crash_reason_item = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
>  	.auto_boot = true,
> @@ -1171,7 +1172,7 @@ static const struct adsp_data sdx55_mpss_resource = {
>  };
>  
>  static const struct adsp_data sm8450_mpss_resource = {
> -	.crash_reason_smem = 421,
> +	.crash_reason_item = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
>  	.minidump_id = 3,
> @@ -1189,7 +1190,7 @@ static const struct adsp_data sm8450_mpss_resource = {
>  };
>  
>  static const struct adsp_data sm8550_adsp_resource = {
> -	.crash_reason_smem = 423,
> +	.crash_reason_item = 423,
>  	.firmware_name = "adsp.mdt",
>  	.dtb_firmware_name = "adsp_dtb.mdt",
>  	.pas_id = 1,
> @@ -1209,7 +1210,7 @@ static const struct adsp_data sm8550_adsp_resource = {
>  };
>  
>  static const struct adsp_data sm8550_cdsp_resource = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.dtb_firmware_name = "cdsp_dtb.mdt",
>  	.pas_id = 18,
> @@ -1230,7 +1231,7 @@ static const struct adsp_data sm8550_cdsp_resource = {
>  };
>  
>  static const struct adsp_data sm8550_mpss_resource = {
> -	.crash_reason_smem = 421,
> +	.crash_reason_item = 421,
>  	.firmware_name = "modem.mdt",
>  	.dtb_firmware_name = "modem_dtb.mdt",
>  	.pas_id = 4,
> @@ -1254,7 +1255,7 @@ static const struct adsp_data sm8550_mpss_resource = {
>  };
>  
>  static const struct adsp_data sc7280_wpss_resource = {
> -	.crash_reason_smem = 626,
> +	.crash_reason_item = 626,
>  	.firmware_name = "wpss.mdt",
>  	.pas_id = 6,
>  	.auto_boot = true,
> @@ -1270,7 +1271,7 @@ static const struct adsp_data sc7280_wpss_resource = {
>  };
>  
>  static const struct adsp_data sm8650_cdsp_resource = {
> -	.crash_reason_smem = 601,
> +	.crash_reason_item = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.dtb_firmware_name = "cdsp_dtb.mdt",
>  	.pas_id = 18,
> @@ -1295,7 +1296,7 @@ static const struct adsp_data sm8650_cdsp_resource = {
>  };
>  
>  static const struct adsp_data sm8650_mpss_resource = {
> -	.crash_reason_smem = 421,
> +	.crash_reason_item = 421,
>  	.firmware_name = "modem.mdt",
>  	.dtb_firmware_name = "modem_dtb.mdt",
>  	.pas_id = 4,
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index e913dabae992..fbde92714f06 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -18,6 +18,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/smem.h>
>  #include "qcom_common.h"
>  #include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
> @@ -93,7 +94,7 @@ enum {
>  
>  struct wcss_data {
>  	const char *firmware_name;
> -	unsigned int crash_reason_smem;
> +	unsigned int crash_reason_item;
>  	u32 version;
>  	bool aon_reset_required;
>  	bool wcss_q6_reset_required;
> @@ -143,7 +144,7 @@ struct q6v5_wcss {
>  	void *mem_region;
>  	size_t mem_size;
>  
> -	unsigned int crash_reason_smem;
> +	unsigned int crash_reason_item;
>  	u32 version;
>  	bool requires_force_stop;
>  
> @@ -1048,7 +1049,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
> +	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
> +			     desc->crash_reason_item, NULL, NULL);
>  	if (ret)
>  		return ret;
>  
> @@ -1082,7 +1084,7 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
>  
>  static const struct wcss_data wcss_ipq8074_res_init = {
>  	.firmware_name = "IPQ8074/q6_fw.mdt",
> -	.crash_reason_smem = WCSS_CRASH_REASON,
> +	.crash_reason_item = WCSS_CRASH_REASON,
>  	.aon_reset_required = true,
>  	.wcss_q6_reset_required = true,
>  	.ops = &q6v5_wcss_ipq8074_ops,
> @@ -1090,7 +1092,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
>  };
>  
>  static const struct wcss_data wcss_qcs404_res_init = {
> -	.crash_reason_smem = WCSS_CRASH_REASON,
> +	.crash_reason_item = WCSS_CRASH_REASON,
>  	.firmware_name = "wcnss.mdt",
>  	.version = WCSS_QCS404,
>  	.aon_reset_required = false,
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> index 8516e17521ea..b5ac3f52075f 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> @@ -26,6 +26,7 @@
>  #include "remoteproc_internal.h"
>  
>  #define WCSS_CRASH_REASON		421
> +#define WCSS_SMEM_HOST			1
>  
>  #define WCSS_PAS_ID			0x6
>  #define MPD_WCSS_PAS_ID			0xD
> @@ -268,7 +269,7 @@ static int wcss_sec_probe(struct platform_device *pdev)
>  			goto free_rproc;
>  	}
>  
> -	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc, WCSS_SMEM_HOST,
>  			     WCSS_CRASH_REASON, NULL, NULL);
>  	if (ret)
>  		goto free_rproc;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

