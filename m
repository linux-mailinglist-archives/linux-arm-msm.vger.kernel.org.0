Return-Path: <linux-arm-msm+bounces-86942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F1CE94BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FFDD300F8B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8132C0293;
	Tue, 30 Dec 2025 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OaXrpU58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52BC258EDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089065; cv=none; b=Y4tL+LjYQJXN68Q1x6h4wqjsymBa1WsIKJx7DSU00EgD/yl7KnMgM7xN5qx0ZCSb2j3CePEnV22jq5MkvRYxgWUZnlPivpzlKVSHSYm2+TvAq8+uTvcTO47m3Ews+3GUynS0ZlmJgi01j8Mt9Qz0tfgZCUUNk+42eEApqmkVUKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089065; c=relaxed/simple;
	bh=qbKKeWEq2vLhYTSjLQDA7S+unGm9/4ACooblaGiFMyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K38qeNArLQw4rHyp6yZD5foZaqVIODF1pS5ScCxaC4oMzVKtXXGFMXGuZTVnhBKwiAM3yAX/iK5j8Ol8Rrx1x+nSNcD24vSwbXwK9bWcga+Az/YWaKawPjrjpzT/4KFELjKjm3gVutCRsiklxfdOvSaAHgmmjBPe1JADQCgy5V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OaXrpU58; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7636c96b9aso1783232166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767089062; x=1767693862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WNEswd8Mtkhh2MzhBhmvy7nphPTXS6cL7fDcvlIy2k=;
        b=OaXrpU58V7HXCIl/Dk2C17d09kSW6aG7f6rXstHTMUuaQlEgkN1bcKxo8AjsLjjazf
         9g1ktDWXnZ3aPQvEOGH3DPIhdECfeyPtl2i5rfVnXqKVV7CO8QPhmu7Adicxp7MeoQbZ
         vyYjoOvUzBRYPDwge3TjAn3j3UFRbxrQAQXAav2/eShl5L/TMcQwtR2cWpj8PdygBshH
         40HwfMZrCmVjHp/g6qBksRStDzsl7Zo8Q+Tfkoci4sOQkdN/aqIFJoP6STN1/Cu5QGkL
         f/23PkmOlDRcpUthr2oOObAmfxqBvACJg+brbttN+aSdopiMSL5RCP9QPGAaUsvrAvBb
         X7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089062; x=1767693862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WNEswd8Mtkhh2MzhBhmvy7nphPTXS6cL7fDcvlIy2k=;
        b=ZbpU5EKTN+9oX1K5XkJ1TCArTVIj9DNUNqydel/OvdrLWACfPmpi2cOan4Bm4mVdQy
         koDNaCSDKoeMdfhQp2LCA3vcFQhOOG+heu3VwK/TwBZ5xUH8UVW7y0nEvtjINOkD1ueu
         yiNf+cKGO3sZ+W5T1hfnzoPZzeKxz73ZO9zDjrbPtIbo8k4VfuAONU737Au57NvxZ6PF
         lKSBpR1HQLvcSSb6kf/HLnLC+GvdVDDo/owX5enIlZkDR5769G4v8fDPe21c5qbMm0wk
         bOcNZvZf9Ami2QHqA/fm8wXEs/O38UWfpQW+GMGc55ZKwG9GEr4R0fQ3F3Y7MzI6DdIS
         wj6w==
X-Forwarded-Encrypted: i=1; AJvYcCV7k4Otvjkfl+ABHR0TkYxV4CmRqDgn7snn0OYr1/YfXXoTC1SzUfvrf1ZvjmAegokNlFH/6P02setUCAzq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq9N8yB9FCYrrtmYhgyS0tx5kuh4Z0DEaXpDZ+vte1ReUsC4eX
	eFDoWrZTgwXvogKnOIcQPi/dxjnzC1U8QRGu6ETW434CQOpQGHRHYQbqKBy3K/5lNgOxobxLcma
	voSM9B+fsIw==
X-Gm-Gg: AY/fxX5vP6OmCXpZOFZ7qCf6UE6IB3APw/Rho5rqZnAbE2TgXNYR3TsyQAbXjHfupOV
	6fPkO2jZkjO6Vtcnc5R4pI4QCCUQXLa8nSIeaoCjfK8cIQu9lsWWTpdI235Xm8hFURH2z+69k/v
	LvrrlR/Bl4TmxwB4D7Qf0soO035BA8Bq2oJQxvvfvFHkJ9dKvx8kD9DB6KsQGk+j3KTmGLDiOwx
	MQD26npaUDbOyuV9seBcI64A4zP0feJmt/oqrQgVJpPnAh0mjRMUTvbYbLcUwb3yLyfr5VVwvU7
	UpLr4nPnrlcIDiQ2wuwXOKamMmtfWoDdFqZp8GqJry6Z6i+OcrGX05PJHHlWMyk72mpbP/Kkv/0
	SPw/wHPXaGeNFojJ75eOpBaHGEmHZp5jkxv6cJssv/C3VbkIap+whD24qcL8IdD/KTnVVgSSgMM
	hJOjP3ci7ykYKX7aMsOB0m8p8Od+mD35yTThmRV/5z/fS8STklHMBhaLXzNGL2gwPfB7OgTFTI1
	8dPs4PWJQtbD9pc1iybyoClb04NR3FNhUC73ElJ7u3sSL7LEm8nqPMXTjRGtyOQHchrta+BECKS
	nw==
X-Google-Smtp-Source: AGHT+IHdtwQVLXyaFzsVuA4txA2fjcLIAy3ihr4xpyI7VbWbj8PKWM46C39EwrEHTvV50cTVPP7KTQ==
X-Received: by 2002:a17:907:7fa8:b0:b73:572d:3b07 with SMTP id a640c23a62f3a-b8036fac50amr3658273666b.28.1767089062179;
        Tue, 30 Dec 2025 02:04:22 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdf3sm3616464466b.12.2025.12.30.02.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 02:04:21 -0800 (PST)
Message-ID: <fb14d227-ff92-4e7f-bad0-d326c729c759@linaro.org>
Date: Tue, 30 Dec 2025 10:04:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: vfe: Fix out-of-bounds access in
 vfe_isr_reg_update()
To: Alper Ak <alperyasinak1@gmail.com>
Cc: hverkuil@kernel.org, jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 vladimir.zapolskiy@linaro.org
References: <8d260d93-38cc-459d-b8f5-40bec5497277@linaro.org>
 <20251229075217.24679-1-alperyasinak1@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20251229075217.24679-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/12/2025 07:52, Alper Ak wrote:
> vfe_isr() iterates using MSM_VFE_IMAGE_MASTERS_NUM(7) as the loop
> bound and passes the index to vfe_isr_reg_update(). However,
> vfe->line[] array is defined with VFE_LINE_NUM_MAX(4):
> 
>      struct vfe_line line[VFE_LINE_NUM_MAX];
> 
> When index is 4, 5, 6, the access to vfe->line[line_id] exceeds
> the array bounds and resulting in out-of-bounds memory access.
> 
> Fix this by using separate loops for output lines and write masters.
> 
> Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe-480.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> index 4feea590a47b..d73f733fde04 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> @@ -202,11 +202,13 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>   		writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
>   		writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
>   
> -		/* Loop through all WMs IRQs */
> -		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
> +		for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
>   			if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, i))
>   				vfe_isr_reg_update(vfe, i);
> +		}
>   
> +		/* Loop through all WMs IRQs */
> +		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
>   			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
>   				vfe_buf_done(vfe, i);
>   		}

LGTM - assuming hardware tests pass.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

