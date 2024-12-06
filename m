Return-Path: <linux-arm-msm+bounces-40632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155B9E6217
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 01:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6787F169670
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 00:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B298C07;
	Fri,  6 Dec 2024 00:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwkAAHyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B42E7464
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 00:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733444371; cv=none; b=SylJBk2fGihNXR+WE2B3GTVs7OKBU8wTX0ng2FTtVljkgyL/7kbwlacDvspqtkALpt1X61O5PDtPApmiDMqwaP0PinNM3q2hta99T7VwtA0CBF3djtM0xn6nSoe40KlJL55NLnZ20Sh29uYmEBDg+RhAOoliFCR4Y6dhKVd4Y2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733444371; c=relaxed/simple;
	bh=+o+uO9we61Ogto6tM+61xmVisEVe55gj1oe2gTMe3FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTih3IzxtNkiANhXE6GlxC5YMnfMVis6nRGEHsAPjLEoEF81qeR+3BhlF3lY2IuO3h21kxgnzinAAwgJqfl1LvnuQAPRoYbHtvSr5bz+c0IEx1B2y3c2AqEMbN1SsX1yENwlqbZOK4GIrjBEojQFsslki+W/ALsujPXPs2k6EvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwkAAHyX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso15117215e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733444368; x=1734049168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7GuXdIFBw0hSC/RhGqob/K/UPv4WM4UiBAEYTtPbes=;
        b=JwkAAHyXOhoAs+Qfch2GyLcCZDIfWCBf1XZ5x83PEHJFdyYuNzacMLVM3EcXFXv8Vv
         O1p/aQf4PeEYiUeionSOZGGCkxUWjqezqeNvVB6S5p8U42GdHtxmp96Dr8tGxWgF1C94
         heigV9o4rM0xIH+JmjcVvgF1tBqMtxkC6DpX5JwXlIt9+6sdmVH2WUev6B/RPmC/lb52
         vOj6ImH6GirabLJHYqaS7dQLiWfq1ChNSH38wujAU1KkvA6uFDavt96p5zABm52I+Dka
         jjCLwGanOu98TrPF/JNf8zONX9ZfdOYi16rZ+ZUs6rv+X18v88dMU4lvWIkuXZHMvHsx
         BaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733444368; x=1734049168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7GuXdIFBw0hSC/RhGqob/K/UPv4WM4UiBAEYTtPbes=;
        b=Sf0sHKW1ljpmn6FIGObQ6HzgCi/sp83uSiFAp+NTVelIe2pCLsCEMO3JMcsx2LahUM
         kQWR490ze6fWJh7e1aVcwSiZQOt6zwV4ED93WGphVUyN4RO6SrD4ZMwXINCqBNfM/SWD
         DcZZfjjh4+EZXBuvdJKQ5xGm0jOKvjhof2drRSM1OQMOCnkyZgbkIgYkD7qt/h1ZUwc8
         XQK+l7aZpt90N5SLAmRvb6thUFJ7R5FSdaEfIGoqhKAiYyfyaUxHbz+kxrnqc+9LmY8E
         lyKJsCYNHtruNQxXkhFXS42cmLFALUXKIhYm0c7235G4RYA18S3GCbZrFDAS2U+Hi6w0
         rWWw==
X-Forwarded-Encrypted: i=1; AJvYcCVHMWa4oq21OjXd8Glt/U8dvs3qQmVNSj/nOGjSZR5EY2w6Tc6L6XR1pLP8FLoizbRqIxOcts3QsVggvE1r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jq2wOG4e7BeN+lavH2fQq6KDO4dffxJsIDxtpR8yk8u8RUfd
	GFEbDJkcYOMgYG36+94kWCWO5V9We4xMlbilg1f1saCSqnHsnURQ3GwPsAWDE8c=
X-Gm-Gg: ASbGncvZZ1RQx1kSrrxbyPMPAY7ANzFy1jf0p95siriM/I3xywBBy3y/ULd39uIm3tR
	gGb67ywjj11kmaIV7+OadMRYn6muEPkvZUq1cR28Xy1hQtOH6FzXTmfJCU+OnPRURZ41bfZtABF
	WSo78afZ4UpfOWTK7BerHYZglBFeNLYhjjWZbzBAVQtpw0Xp4u+IYqJJ3Oih7LVBYhgelPim+sa
	54d4nYlLclm5X43tYLiQDe0Zg5DMimNR6WO2N8NPJQRv7s/e5y+ewnksVAJIqc=
X-Google-Smtp-Source: AGHT+IEVgR6g8ndVIAMTngaFxCk18nWwxULdTjO+OFxZxjsRo3kL/Wfx6trIPXpCNbJrzoKXXJnMng==
X-Received: by 2002:a05:600c:3ca3:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-434ddeb04bemr9813725e9.9.1733444368473;
        Thu, 05 Dec 2024 16:19:28 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862a4ae481sm865300f8f.25.2024.12.05.16.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 16:19:27 -0800 (PST)
Message-ID: <929636b0-0cee-4673-9d1f-5987b19c5958@linaro.org>
Date: Fri, 6 Dec 2024 00:19:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] media: qcom: camss: Add sm8550 compatible
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-14-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205155538.250743-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 15:55, Depeng Shao wrote:
> Add CAMSS_8550 enum, sm8550 compatible and sm8550 camss drvier private
> data, the private data just include some basic information now, later
> changes will enumerate with csiphy, csid and vfe resources.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 32 +++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e24084ff88de..2f7697540578 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1634,6 +1634,29 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_sm8550[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "hf_0_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "icp_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "sf_0_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   /*
>    * camss_add_clock_margin - Add margin to clock frequency rate
>    * @rate: Clock frequency rate
> @@ -2644,6 +2667,14 @@ static const struct camss_resources sc8280xp_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources sm8550_resources = {
> +	.version = CAMSS_8550,
> +	.pd_name = "top",
> +	.icc_res = icc_res_sm8550,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> @@ -2652,6 +2683,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
> +	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ }
>   };
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6dceff8ce319..cf6672baea1c 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -84,6 +84,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_8550,
>   };
>   
>   enum icc_count {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

