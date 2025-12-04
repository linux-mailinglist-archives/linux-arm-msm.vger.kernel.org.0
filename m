Return-Path: <linux-arm-msm+bounces-84269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0ECA208A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 01:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24D9730033AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 00:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468B11991B6;
	Thu,  4 Dec 2025 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpfmM7kz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B51D17BEBF
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764807792; cv=none; b=E2ksue0Xfxao+AEgunke1dLs/nLH1PxWFlIiL0Up5zhp9W6jYJaD8kzGxBUuNi9K8PqMQlE5PHk4mbZAO6gq5PVE85J9pmQpAPsPBhfqiJAIW+IOSCcAMDqd2lxhTinGGlPk92LbrDSjrfNgTAkRSAdpuMhNikCx6niAipwsnNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764807792; c=relaxed/simple;
	bh=MNTkF/8d5j3LaPV58pIl8PN8GUdjUcXP0AuTDgV34EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gt0+rTeG5XGneSa5hrN7pGT/IdpAjYsBMtCRK36Id/rL+xNjjJCbiBNzrxrXQANL6O7CKaX85kh8H3dvRfJtOVGDAoH4MubnQQW57gUxoYagHMCgSPJVwW/T9QU21SnIEE8Pe3OwMLDvmtU2sGQeOyKcy/HugrxjOQLJCEL/G3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CpfmM7kz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so2458265e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 16:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764807788; x=1765412588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSsgnZDgwxeWHOfQ1yvr20ZB+yAVv0WNlnSyxa9advM=;
        b=CpfmM7kzAsW3nh3QsPkp6vQN5gPdGGpGTcQvny32UcfSCp7W3o1A6gGrYqMteOExcq
         nuckhBWTOZobZCbQ7pZpN7OvRyMZS8yPcnSESCKenrVij0J7TInvp+Nik2pgM4eIhj6r
         +g8MXPVZXmSBaF4WRqJEE33Q/fYRQOsTA3jUcj1IRAQpzk9BKABhOroOna2gThVPdFdd
         IkDZbsuCl/gXlm+LuqiRjYvHzL/OMfVYvKzL8025UIFQ9r8/Yzt4k5qt2DMXlNKLvClL
         8oByr5WfhcCLSwnXQlXwZmnxExYhuqp8r9QtI4S5TC4yo6U7D/dsUXygWGd7f+q1jnN6
         jKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764807788; x=1765412588;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSsgnZDgwxeWHOfQ1yvr20ZB+yAVv0WNlnSyxa9advM=;
        b=V1ciVK0t2P4mu06b+ysTSfDqhPrlCZOULQVAhJVElEijEBG+PGhdGpGAymjiDePP9P
         oaRg48Y8LozFQVx2cSDR0Hrz95hmhYl+vOK6WRtMHkevud+Jd5eGiEWB20d9LRb+dZMC
         VgmIsHlGPlfESPB5o0MZpjHd3VET8rykWbdoUkWxCwAq0n++t742sNDBkzzvtZrYCC03
         c0H0pAsUyuDH4MDULJ0mXOpJzM0YfHVvSLCi5sA9sjoMTesS7rrEyd0fj3sOS0yT5+HX
         BvxgSc1NettM8UcGsnHUIExLs11nWvwGgz9yxNeviIIEctRXsMA85s2X5Wm9QoOpeC24
         QaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyoJbLLSWj42KHjj9mzSWkszChFBlXUxHJKiSonzCL2mKXbOdXFGTOD9nGrW9GRpHGizy6Yt5PJEgN2hXb@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPgr/2jZybzOqSSfPzMb/RMSq9rLe42AA3QGRBDsG64xWyjFJ
	Eo3tIF3Vbq4Bcqc2t3aI5UAR8RErLZx3C/sBDXdqDKmtMDY4O3sKZJliiUWFo5NqMJI=
X-Gm-Gg: ASbGnctUiH6GHE0HGztQiGU5TvO3LsnOpVVyUJTiwBM/KrFORAKv6NzSpIKXnf85ISt
	BCd6xJ1/Fi8FC383EtpLeQLsvatCHHcS7WSsmLfosle5eZy34NNh0aR/liT7SNCGdiMtI1gf+Ow
	hHjgFtzuCbMiCNqQWbLpioyvX7iU+OQy8hNPofNCF/IM4zDj/H5IxBUbDkIKQ+NcDmm7Df9BBez
	vhejjhe0PVSFwdHjmQ3MBvYdPGN4npcolL1HVzEud5YddvroOtZuznkR29obTYxOBOFmgTLMkX4
	2YLfnksnSVRiIVZoGDE+j4kPuLx7RDq7Sho+n+4hqNgDagJBaVsWmc3pEZhoQnErS3ifvohnVol
	L9hWm/KuNHQ8CjmPR2PtL9MHGPTdu6AR4/HLuGUVGpS8HyCrlFv1HJ3SKNFE0G9osqzsdOK5BmN
	z9bNs5Ky6C5FytahTvNzOb4EK5taHLjZcjA/p+V3Mtdbuhd3Aw66Em
X-Google-Smtp-Source: AGHT+IE9sjcZj2k+bMrjv8MGJnuHtdInw7ZKP6kmKbxl2Ij1shm86IyV9zTHLG27mOITzxtiEgI5YQ==
X-Received: by 2002:a05:600c:35ce:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-4792f268a6bmr9277855e9.14.1764807788588;
        Wed, 03 Dec 2025 16:23:08 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm40362472f8f.33.2025.12.03.16.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:23:07 -0800 (PST)
Message-ID: <42ce8a95-8f83-46db-91ee-73a1a942eabf@linaro.org>
Date: Thu, 4 Dec 2025 00:23:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csid-340: Fix unused variables
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251203164330.1552-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251203164330.1552-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2025 16:43, Loic Poulain wrote:
> The CSID driver has some unused variables and function parameters
> that are no longer needed (due to refactoring). This patch cleans
> up those unused elements:
> 
> - Removing the `vc` parameter from `__csid_configure_rx()`.
> - Dropping the unused `lane_cnt` variable.
> - Adjusting calls to `__csid_configure_rx()` accordingly.
> 
> Fixes: fb1c6b86d8ff ("media: qcom: camss: Add CSID 340 support")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-340.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 22a30510fb79..2b50f9b96a34 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -55,8 +55,7 @@
>   #define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
>   #define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
>   
> -static void __csid_configure_rx(struct csid_device *csid,
> -				struct csid_phy_config *phy, int vc)
> +static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
>   {
>   	u32 val;
>   
> @@ -81,13 +80,9 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>   								   csid->res->formats->nformats,
>   								   input_format->code);
> -	u8 lane_cnt = csid->phy.lane_cnt;
>   	u8 dt_id;
>   	u32 val;
>   
> -	if (!lane_cnt)
> -		lane_cnt = 4;
> -
>   	/*
>   	 * DT_ID is a two bit bitfield that is concatenated with
>   	 * the four least significant bits of the five bit VC
> @@ -120,10 +115,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   {
>   	int i;
>   
> +	__csid_configure_rx(csid, &csid->phy);
> +
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
>   		if (csid->phy.en_vc & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i);
> -			__csid_configure_rx(csid, &csid->phy, i);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   	}
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

