Return-Path: <linux-arm-msm+bounces-89528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8375D3912A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E348B3017F1C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F297F2EB86C;
	Sat, 17 Jan 2026 21:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anMYnoCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327542D47E1
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685960; cv=none; b=Z8W6T1tZjYOT91eyhBGJWyPtEXATf0kRmcZAJK9SnHyUaSJRi68aV1I0QIiwxQwrKyi1F4xlJNrwznU7QFW0g3iYS8yUpIH5oSEfeCWvzR+VuWEBpxuLGT8gdVvbdn2jb+QaMkAUL2vPEYZHhWc65s16q7ePwpdGujug9/2yNjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685960; c=relaxed/simple;
	bh=bQQpwrCGrpO5QyLkGXEZAd9BSGvrhb7OYadOB8Pl6dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTMAB640x+l3aT7UBxzRuLDOEYEHVyVgHQaNb+AVK9yJMf8TpZcKcLgKXAPeimPYw79kRtgvEiexBxf02Ecbw9IaC765XUKKypeerVr9xn8BM5xj0AM4NSWMdiHUZfPQ/JJ5UFe39XkLJ/sGM474+X6srxLubEAwNTQic1I34Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anMYnoCD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43246af170aso1735727f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 13:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768685957; x=1769290757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bD2NimiMGHu9BwaTt8RzFFLJsSh/fccLMhaDQFOrDmk=;
        b=anMYnoCDyVylagM7GI5k8NsI7/jGscbHon/60P3i7udwmcKFfDMDVEPA+HnRibA8NV
         aKytr/eIX9V9QxwfuJXFyG2SJ8iULMJHDy5WJMSY7vFlYAFQTNrkc1wZ+/lnWsCDYiSw
         m7qwYl9XnGH6LCyqTPXgcFxUA4BARr//fdCIFSN3w/xsPFKwJsME4c+9X21fBBM9xDvy
         TK0dE1nwraOCCnoDvw19QAQsZ8coMs/ANswegx0HC+hgMeVAcaH1PG+TMqpPXDxAwK9F
         aaLm9+bbBrx820+ANFW0ue65uyLLNqB99fFVxzeFri/RSchAF3GvOPn+KeIWjLzQ8B7g
         3QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768685957; x=1769290757;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bD2NimiMGHu9BwaTt8RzFFLJsSh/fccLMhaDQFOrDmk=;
        b=va84hECaWkp6O0q05Fjeor8NSAJ4LL3N+d/fV//VJmM4OXE+5w9y714zWlqQsNTchw
         XLSX0FEz3R4autKCvK2TM8rb96fRDAwouAwLgmAnPlilfsaBQ5m1d4fHkKA+E0lrLvue
         2jYlXDbuHCRx5Hw03qxa17lK3z2NziTSOPb5pozWO5F0JqJRmovtwivm0IxgiRIKHBdW
         yEtHCqx6tOLXsoc87X6zacGbrdvIetCZeFCIhefM7Cag2EbXImeOAa/MS/iQCrW9VCy9
         mqU+u/B/sEWfj1y7MT5NyMqp/q1FN4QlEPj+Ok+h0XT0uJrr7U/S30sWtSHhiuWSggGf
         aWhA==
X-Forwarded-Encrypted: i=1; AJvYcCU4F+DVgcQNEux3JFa80OPr/XnRwzuu6ickI8bkvAw2bC92TtLuyaM/jsurxoPLReWVSvJU6gJX7BUYrVdP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8zsrpDc1eguFL4RcFBkEWXCW95egdFLY3RLbuWWyAVFWZQ6C
	H1Oa9A2xDHDD7YC2tusiDVaU/VX1aVBLywNP3HlLuMNp9i3WYfcrH9M0/GECaCkQTmo=
X-Gm-Gg: AY/fxX70dMvd11YUpT+QX0FTZUUeSe4+jznNkiNCNfgP/3NX5/PV0n82060+9m8k2H7
	xYAWKsDKcrda7P5qK+C+/N20iUUU9xpBAj0nF+R5H8ERjtiJnbpD1PibBVFqHY+/LHI5hOsn0Zh
	f4Du1VciKDt12pacAsq9GeloclpRs+ioUkGgLFT2vTGWCx7/O1Tvqpu0OvWxe4WHZYMgo20RBe6
	A5FzWGHIXF+T1Rm7Pppm8qo4yUKsULzhG7x8raMaa/ITlJ4fecKUGGDuvao3NPAG40zczHeBCoG
	21Fb81DWB3RUrFLvIPnO1LZc4imAR5lqCEyPdyaLs+/M2iI/SZmdPlqFD0BiSBf3CgKLLdX2LaE
	1BVaSE1cVFaPsYKvjDdG52LcAeyn9rp2dpHzQu6n4nZ/dD8GIWwgBeVCRtS7uS6gAeP5ZYoKCmL
	K7VfPEOBLlJCazFbpJeJErbfEnm8ywg7f416/ueT9Lb8rVxVtEIX2G
X-Received: by 2002:a05:6000:18a8:b0:431:cf0:2e8b with SMTP id ffacd0b85a97d-4356957840cmr9582526f8f.29.1768685957500;
        Sat, 17 Jan 2026 13:39:17 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435696fbea8sm13316568f8f.0.2026.01.17.13.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:39:16 -0800 (PST)
Message-ID: <7c561993-ab7b-4ddb-a36a-47a000d5d435@linaro.org>
Date: Sat, 17 Jan 2026 21:39:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] media: qcom: camss: Prepare CSID for C-PHY support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-3-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-3-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Inherit C-PHY information from CSIPHY, so we can configure CSID
> properly.
> 
> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>   drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>   drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2a1746dcc1c5b..033036ae28a4f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
>   	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>   	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
>   
>   	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index ed1820488c987..b50b0cfe280c1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1275,6 +1275,7 @@ static int csid_link_setup(struct media_entity *entity,
>   		csid->phy.csiphy_id = csiphy->id;
>   
>   		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> +		csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
>   		csid->phy.lane_cnt = lane_cfg->num_data;
>   		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index aedc96ed84b2f..a82db31bd2335 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -70,6 +70,7 @@ struct csid_phy_config {
>   	u32 lane_assign;
>   	u32 en_vc;
>   	u8 need_vc_update;
> +	bool cphy;
>   };
>   
>   struct csid_device;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

