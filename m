Return-Path: <linux-arm-msm+bounces-33248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1F991FFC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E64CA1C20A19
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F09E188721;
	Sun,  6 Oct 2024 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kWLS+PfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5908A184F
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728236164; cv=none; b=baPk0Jz4b4Knfw1dNa3OOr07sjwuQb0iNWbMmjs3W8z9BoGttyudP/U7gzGfEqOgmI75WQ/GcNXqtn/49TwAS8GAS9c1hrtUknFsm9F5Wk5Tfy1V3LGBYb2VBxVPE0i56h2Q8a1LHtlcgMHzYUW2pJ8f1z42iaXvATI/QS8jRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728236164; c=relaxed/simple;
	bh=Hm4a5C5S8cU8SRZ6MrRN6r38b8e4yHNIwRLzRHIYPg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuJk6WGfzKrINmJSHtuxVlUNrjSJ8Ohfnfn5FdNjVkf3co33SKRTUMDltGa1Bsux3mp+R9Vsi0RpT48hhCS9NLHlQAfOPIo9aw0g1luhmrO/jQg9vOsn+pHiTGZjr208gh7l62cGR5X6QvDA2ktChg141Er9zE6XqoYFS7SaI4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kWLS+PfG; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539885dd4bcso4476133e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 10:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728236160; x=1728840960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jqjA3t+uJH5C3u6T2WtPr91xISIEaMidxKBcqx9++M=;
        b=kWLS+PfGwuMsM1o6t8nIcquDNveUAqRVLVyH/pAn8/W+aK1U3FKOaMLFYr3+9NmkZb
         SMzuK6X0C19l+6n7/vR4PE4JePA9X/82jKq2GZmKvO/J/d0ULX2G8B573zDS3wavo0aS
         98XqNgg9E4fMkskpPGIIwu+VE5uoCW+qr4JqYMhM/sOWSeOpcCTSPZ0/Z0B5xQmUh20U
         swFXLAX3q6pW24nbC1RXaxK2Lq8nDAfiCtNHEU7Ku0Ak8APq3cm3Kd4NYOyfW2qOrLeE
         9rkhjyXgDRX+p5sH/58V3DWLesi6hALGdasje4r71KzwXFxEn4WRCzVd+3oVwpJNvwHf
         8PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728236160; x=1728840960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jqjA3t+uJH5C3u6T2WtPr91xISIEaMidxKBcqx9++M=;
        b=D5TGJLLSU5jtm+q4fbx61wjr3knYBFEZJi0vEti9aoGzlp0wfS91sRGRRhxKAqDoC0
         wOPYZ2eldK5EQZmhW4La5o9+gi4f38SOvprVXdNQLmRjev3WChlj8cbjJHOz2zWOGahf
         Bl0QXRhjsC2sGx+2m8pfggOenterxE2XPawCuvb9DQfIiBnolHqujRZUUomjou0lp/vL
         cQMG9ZuKJQgn1ZJfFwAdVt/vcOOHxL0zQ3OeCNyKzlOTX7aiaZgS6xGHjfVkmAkoQaKg
         XXlxn8vqusyG9Z9GZBaxc6YGPWAHY3Dt23n726KJtTadoev4isFYQqQc67hSNuo06rXn
         TZfA==
X-Forwarded-Encrypted: i=1; AJvYcCVpcEdWlLu/jYKlXo1fAgx9dOYlIH/HnGV5o9Bfbv7EZE45hpJRazPURou8FOagzSEvxt0m0S4u9xS6ToaG@vger.kernel.org
X-Gm-Message-State: AOJu0YzghQySJOGZxj1gOyDAjEX/Xuq1+DDkH/2xrtvRc64cjatHSLST
	9vvCP52desTNjah1fcYYawvbJ05KBQDZf1/lAubNSq5375IJrQP5XJORBESQRXY=
X-Google-Smtp-Source: AGHT+IHWh4w88xN+QzKpi0f2iKqrojofn8hslRswLVLKHnZEdTKJTweHLoAMSSAGDcgRdxs/9LEn2g==
X-Received: by 2002:a05:6512:1387:b0:530:daeb:c1d4 with SMTP id 2adb3069b0e04-539ab85c0fcmr4556394e87.12.1728236160467;
        Sun, 06 Oct 2024 10:36:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff233a0sm564542e87.199.2024.10.06.10.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:35:59 -0700 (PDT)
Date: Sun, 6 Oct 2024 20:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
Message-ID: <2fi7pyhpetqyhipjiihuafddggwdrh7abuvfkks5hu5qid2rfm@ibuiecrhijey>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-2-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005140150.4109700-2-quic_kuldsing@quicinc.com>

On Sat, Oct 05, 2024 at 07:31:49PM GMT, Kuldeep Singh wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Currently for enabling shm bridge, QTEE will return 0 and put error 4 into
> result[0] to qcom_scm for unsupported platform, tzmem will consider this
> as an unknown error not the unsupported case on the platform.
> 
> Error log:
> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
> 
> Change the function call qcom_scm_shm_bridge_enable() to remap this
> result[0] into the unsupported error and then tzmem can consider this as
> unsupported case instead of reporting an error.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..620313359042 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -111,6 +111,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
>  	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
>  };
>  
> +enum qcom_scm_shm_bridge_result {
> +	SHMBRIDGE_RESULT_NOTSUPP	= 4,
> +};
> +
>  #define QSEECOM_MAX_APP_NAME_SIZE		64
>  
>  /* Each bit configures cold/warm boot address for one of the 4 CPUs */
> @@ -1361,6 +1365,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
>  
>  int qcom_scm_shm_bridge_enable(void)
>  {
> +	int ret;
> +
>  	struct qcom_scm_desc desc = {
>  		.svc = QCOM_SCM_SVC_MP,
>  		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
> @@ -1373,7 +1379,11 @@ int qcom_scm_shm_bridge_enable(void)
>  					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
>  		return -EOPNOTSUPP;
>  
> -	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (!ret && res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> +		return -EOPNOTSUPP;
> +
> +	return ret ?: res.result[0];

Could you please make it less cryptic?

if (ret)
	return ret;

if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
	return -EOPNOTSUPP;

return res.result[0];

>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

