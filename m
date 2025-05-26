Return-Path: <linux-arm-msm+bounces-59392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD9AC3B85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 10:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3395118957E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 08:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BB81E47A8;
	Mon, 26 May 2025 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mL/Mozhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6561DFE12
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247626; cv=none; b=jHL1rM7gG+uRVQw3LnNsxpcLZ4VMsMMwS/g0OQ0T4FCnPzAKCGLwgzdxCkauQ3iV3izq3DhtfEahE/FWc2iKozUKfiNIzoQbNXe7c1Flsc9hnH7cQ6Vz1Jv3dG3lzeiCd869b60iMgqHVZU7yOdCoPTfH3Mv/lkLV2eYPjvohb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247626; c=relaxed/simple;
	bh=kiIkXPF0mzMsp0+vmMLj34FpGFqIHfWevMok9dqiXjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1sSPH7AZNVzb/w+X7ZyoQH17wU6U6DPGpZaANypoUaCmC1/bYjqkPRBukiHPshUoIyJ4J/Uv0VndR1kkCTYZuS+5j+qgsxlCMk5if3lcuPsMDyqCVvALu+38EnrkjEBPjX/MpJ0ILkEpA4/MtFdunKHfzqEFPvVyZPx5+YTxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mL/Mozhh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so26502615e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748247622; x=1748852422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYw0GGZr4tuoIVzPkfyLk2cYyXtNoRutkozNOrmk44g=;
        b=mL/MozhhkVuofUlbor+IFY+2NwW0ZELSrO8K+CBs/PwGDlRlzoB+q6m8IwEVyCNUVO
         W3Sn2BV9YGJHWkqNRPUxL5I2Lwda7/z38Td17Q6OT7BPRFW6nHk+TUashFQTiNFuUJ8w
         Mef3p7U/WyofrZEnMdnOF222b87UNcwidNq6z7P0GkrU9x5ZgKEGvccXAJup0DveNEYq
         Izi62BwCIXfGfmk1SL3mKUeFcIqi1ddOnSXHg66Im28lYvJqLUeicfZggYB+pBiyWJuk
         NbXgOPrfwRrZHDqsTU2x9jI5z/BR2uwA+vrUeE/9ajCxX9aEQeFBKUFTHral7BpaP2X9
         bboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748247622; x=1748852422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYw0GGZr4tuoIVzPkfyLk2cYyXtNoRutkozNOrmk44g=;
        b=cDjS7TEPs2BEngpBTGk+jn+GvJAxHl/ONxwLgRZeFiVCXD0Go2kO9VpQXQX0k/CRTg
         oLq/OfIGPlYTQr6upKI/DUrV7p4zCttt722MJfcwHDX2O423k8H2pUWMj9m3gHyVkuZb
         y3L2qwklkuYYgUKeLRBCZrP/KG5nMnoq/KxGpx+s23L1v1FYkjffjacTaFNA+ZSr0wqC
         erQ5Of2lCUoLFRwZ63dpkYB7q0usO428l/3k0vDQ9ca2wva/3kzYUOUfXvxcQ7qev55G
         bN4WovmyK3YXzmSIHAhBT3mOuTzWwzWiqE+Si+YjeMCw8f/nELm3IgAFwunkpdXLCgrQ
         GM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0ci0xDb3ET4J7cWuAWIiIoIw1wXT3phEHUKGz3E4kEqNa4rlZbt45bCtida+776yEpAptl0rDG3VgNeEf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9a2Kh+y4s4PC/k7BYRjLExN5JMbYZwycZ3bS3dTQUkGLe8bLJ
	XZi7ElMV4KwqBCAhLbkTD6mkAzPg+IyAGnQPdk34ALx+48NxktbedZuF5pNiC1nzlTc=
X-Gm-Gg: ASbGncuuxDIxgLGFJ0HQjrsjy8JeWCaGWDUwZmIlisBy+O/zdqpZCg1hkEWkfURWmLj
	XhaBEftWL06jHU+qLqEcqBckxm35gvi72NQcx/lHO73xO9ty/JMoyEqTCPn8edPVygHhRHs/7ld
	g2oxnJvm0irFWdW4hshhf0Q9XuEMnItqyjy+T5OYtP1Pk19AQfhHNQwn1LuZIHFteDPZHlljrtr
	ODFYVusEkecSGPrDt3kMFLCq3Z8tmn/1HOuX+PcQ+3n5Snshd4NygeBkw7sco4ux3nMomL87j7o
	1AFINmOxEH8YxyB0to333G+4aiOI/DG3jAd0gBzlutUMcNUmEGmvS+c3QZgrZrHOBzphgW9kWxN
	/ydDXdfkmvw0g4gMs
X-Google-Smtp-Source: AGHT+IFp4oweCau504HUSsYtRlu63mwxtFVBOtfguUvjdqDFiDjl115gPPjk6xM6N13cuUqyj7SIPA==
X-Received: by 2002:a05:600c:5249:b0:442:f990:3ce7 with SMTP id 5b1f17b1804b1-44c9465cecfmr71103325e9.16.1748247622533;
        Mon, 26 May 2025 01:20:22 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1fasm16458356f8f.1.2025.05.26.01.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:20:22 -0700 (PDT)
Message-ID: <cc43d9b7-13ba-44ea-9b37-fc54c0d1f2e0@linaro.org>
Date: Mon, 26 May 2025 09:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: qcom: camss: Add support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-2-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250525-camss-8x39-vbif-v2-2-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
>   drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.c |   7 +
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
>   drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   6 files changed, 173 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index c622efcc92ff3781d7fc3ace0253c2d64c91e847..6311fc2975aa1345e430a477c8a6476f1d7e5663 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -605,6 +605,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   		return PTR_ERR(csiphy->base);
>   
>   	if (camss->res->version == CAMSS_8x16 ||
> +	    camss->res->version == CAMSS_8x39 ||
>   	    camss->res->version == CAMSS_8x53 ||
>   	    camss->res->version == CAMSS_8x96) {
>   		csiphy->base_clk_mux =
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index 2dc585c6123dd248a5bacd9c7a88cb5375644311..aaf3caa42d33dcb641651e7f5bc0c2a564d85bfa 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -1112,6 +1112,8 @@ int msm_ispif_subdev_init(struct camss *camss,
>   	/* Number of ISPIF lines - same as number of CSID hardware modules */
>   	if (camss->res->version == CAMSS_8x16)
>   		ispif->line_num = 2;
> +	else if (camss->res->version == CAMSS_8x39)
> +		ispif->line_num = 3;

> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,

Hmm should we really be setting line_num inline in the code ?

I don't believe we should.

These parameters should be passed from the resources structures.

---
bod

