Return-Path: <linux-arm-msm+bounces-84825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD8CB173D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FB9F3008549
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A781D416C;
	Tue,  9 Dec 2025 23:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkSqskGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5018DB37
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765324358; cv=none; b=ccHsf1DsrJmFONSMadWbhVycHA8uis2h2DwtNWLlGZCK5ID8jRyRMbDrl3z8zZrZ3OMKDtfIn6QNYSO7nX+nleBKG8v2r0Lb/hk192atNNNG2wDaioHjmrqUObkEmVrBuo2VuE1qHcfd6c0qP9NNDqCi+pXA26Wtp/K9UgRJzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765324358; c=relaxed/simple;
	bh=FB2vQks+igHiNI9Y+kOnKP5A7htEPkxUtaa7VDeWOAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXAtVMbf9v4ClNw13FuzQcOOl86cTqoU5ZcFsKM3pL0jZjeG5shKTMg9hpG3iCtLJWLvBDfx8n1ebUkS5K7hFrnx4vj80Kvd2UdB0QI9fFxFYrgZzSvqyiRV6uSIB0dHXFoB7UuMHJxejJVTmrhPOvMFR5qMHTB8ZyA/VlX3O2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkSqskGI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957a623c7fso1177480e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765324355; x=1765929155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRGeMzTEuwWQLcxMfP6PvfviIxT8PkGX80rLUdW1OWg=;
        b=lkSqskGIB+1pMTs5KLl4TKcgrCyr3Ns0E2N+qKuyRZxh5qySd36wVOkuqLvXXm5WtW
         U5IJ4TB06DHZA/ZhaJ89zS8xc6qGC55Yal32DBchqkVNX4Q7zCgks2rDe2iA9XdJoOvC
         mS1SzvZWRKnrakkhmfWpPswp6Q9xGL06tyMsGHS52YIim0+jFRhF9GRQBZq0PQ8xQ55S
         CcXQ0a2tOffValP6oTztdgzFATlCQ9tVjraRmSdBEnFqKq+q27Mknq9BfacWkVDEcC6B
         1Lv8dM+BpC9OE1g2W+nCtfI8qBMSsYU90jI/Z8nMWcJOOpetIj5EhddVWpUbVXsF+xVf
         6h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765324355; x=1765929155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRGeMzTEuwWQLcxMfP6PvfviIxT8PkGX80rLUdW1OWg=;
        b=kGSt1L/I0iNymS1koOaB6AieVMhB5yhVLXXTBwxB65LcRzLxJh5JxEFJgVmO/MTdo9
         +Dmu7LqYwMH8K0wgMTgPsQj1xOWLRYgDwZ4zj/BQo680IpuVrrHDe8IM/qkLcDFbQQEs
         /wQwHdGolhsP2vZ+ezaJQ3b6/rrgUO5z749WDGj5hKoM8XKYH7HtNzA11GR+BqQCEuTy
         02ZQxf7Nbih6YvJS+lsHNzU4bOYxpQiiVaax75MzVeAiRUMaGbVNpi6hbuiJlSrJxIoi
         Mgc+S7aVdehB/QJcjW6yGplyl6lzwZ9LNPXEIuh+wPEQIJzy/fMLjC5pv799HJN5Pcvd
         flmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvjcRKVYXYH2TOOayfdSvdskNPWZbej4XyjGrTWS0teWCzrE0f1bKuqSPUZ1BcCxnSDsyGcIpBchWvZ+BT@vger.kernel.org
X-Gm-Message-State: AOJu0YzWpjS7P3nMs9qUBIFgr5/xE/gTROmjVsKTbTjsQsgDISTfjixl
	v5hW4+JvFXjJTBtdp115VneByfo/EAi7LKjTw1fKxxCSFBcZKG2RckV3rSYZRfdRPO0=
X-Gm-Gg: ASbGnctbjc95hKp+R6hFkBDESHL7UyY54a558C68rABe9O+hLR1jRfse+L9hBeHgMF4
	4aPUGQKWmRKDapCnkNxp+ysqTzCR6s8bFmIc/CLkq/MO59PqxI5k3pHFtwueRmjXItg67JWmKoB
	QbM6x0L6tK9F8PB0nr4KYfJwbI4x0/XvS9e6qsCiNQwaRooL1b70L53Yf8jVv1am/iM8iPv1n9C
	7PzUhdXTlwJQQ2piq6pvv/uVeJx9DiIp9pOLYLljQPPRArGEFevGBmjbwN1UzCV0maCzAKx/gf4
	ZKc2S/kKt2qIC0Hif72U5No2ovpmrKnO4Ck4xSsO0w/JvDh2pT3VhLPyofFjUoXj3OcjkZo34xw
	MvSbo+RGdZPY+PRDtdWLSYJAcxMNSrcstlAGLzSh8l48imFbzp+wfRH13qWZlhsG1fBortwNctc
	R0Rey87exdqv1WEzMDmvMxj2LsKHH8COJ9LoiMrFHAGX1WYOEMc2IhTgquutWazZUw9A==
X-Google-Smtp-Source: AGHT+IHmcbfcXnyvTArAMUdIsNMmjB8Vj9LV1IMYb6SP55nzn6yRzaVgluPgLeZF6A3fBkVa8UI4Rg==
X-Received: by 2002:a05:6512:3f03:b0:594:4c87:a8f9 with SMTP id 2adb3069b0e04-598ee595bd8mr138830e87.4.1765324354773;
        Tue, 09 Dec 2025 15:52:34 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2acsm5719262e87.61.2025.12.09.15.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 15:52:34 -0800 (PST)
Message-ID: <5b521bb2-00e7-4a43-868a-025e786de88c@linaro.org>
Date: Wed, 10 Dec 2025 01:52:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: csid-340: Fix unused variables
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Loic.

On 12/4/25 11:03, Loic Poulain wrote:
> The CSID driver has some unused variables and function parameters
> that are no longer needed (due to refactoring). This patch cleans
> up those unused elements:
> 
> - Removing the `vc` parameter from `__csid_configure_rx()`.
> - Dropping the unused `lane_cnt` variable.
> - Adjusting calls to `__csid_configure_rx()` accordingly.
> 
> Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")

This change is not a fix, please remove the Fixes tag.

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   v2: Correct the commit ID in the Fixes: tag
> 
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

Otherwise looks good.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

