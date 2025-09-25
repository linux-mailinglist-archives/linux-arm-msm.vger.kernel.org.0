Return-Path: <linux-arm-msm+bounces-75107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206FB9F618
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F4C71663D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F9F1E1A3D;
	Thu, 25 Sep 2025 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Djm51YJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BA1DFDA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805046; cv=none; b=PqwgCBO8LmpBGXLAbO7kmyohPma1YXRykOruu27CJ2HvK9pQXpIR0xLEvnP9lfOoT2vy6m7RVBc5pnyP6zT/Uf5/ZXlCeqmqaLykjZ5Kwo7t6Rkh0j+yqvkc03Q6GqV64ustg6qO+UKklGyoL0GLSj/pIq+D4Ebocvu/EYhjRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805046; c=relaxed/simple;
	bh=1N45L8OsqIJxDZrwgNPdfxaBJriuJmN6OB93Rvw1LVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqMcC1Z1g3wxZ+IFn0yA1jAQ2jntOGh56ymAVVe2ctKFpKpzJoZRMek0Cd/g0ScIMxKlCvLFv20bF/BwRFZfPyI2LfvUO9Hwn87O3b1xHfoX1nFzoFyLnGO9cIoOVVo0TVjjjG8dNjiJW2BofqL1pKV9j+V0c3YjaL2p5QAAh7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Djm51YJ8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so4832155e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758805043; x=1759409843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDskyePj8JknsprgoQHR2EqrcwWaThe97NOcTCiowFQ=;
        b=Djm51YJ8gvk7gdmIZ5PJZNYYSNUThoMGA7DJIXX+3IFhoyJVcuMxPjbX+nRlZjYFK5
         V/898YB/AFpOHF1qYVVaPHz/XBbzXArXV40W9B20MOYg7cJMDdFwkJnB/gMgtv1ht5FM
         OYhTaOzeWkLpUc5ih/B/tS5Sr3YlYnlSJpDefLRB6mfbIJwDPlJpxrdaro1ARt3a/34a
         e553ir5BogLmw0ziSHB9XbGWZITt02CIXlV5OjDJEyiwnSv3HoBDrkHYloGeChMGZZdq
         gQCpd6Kc7miAdnqZ9UhBz+pNmclTh+aHf+rrc9mI59EIQln7e8aUdqSIcTh2VBdUOas6
         3/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758805043; x=1759409843;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDskyePj8JknsprgoQHR2EqrcwWaThe97NOcTCiowFQ=;
        b=Li0BbtYxepA2yqodqbq7HauThVg8eWjk57UffBDyhEGG+8HagEk/KDTi/doQr/WMyd
         4qAEyZdTxmkF5DsoqmnpM2mY6FtSkux7Lr6mgHZwZRJ0zl2uAIMHu1vUiVN/CL4RTl3n
         S93nkL0vQSnFJ35FOVecPedhkFqlTM5jBqLCg13tBuNmjPZ9WKGrdV/JYBCjnF+XJb4/
         AYsyaW/aC8Mf2HxU80UlWuD1rhfj4KBQTgbJRJG7xXjHUmOOx6BUWvg8bFzLQk0W47sj
         yt6iXozcT/Eh79BswdaDBC3SGVCtoPVgdA4J4feZnNLmwfuQNR7vSisQk+swp0n9MOoO
         ebOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0xWSd89bnuohRM3aQLaP+6HyS3tB2cj7EONE9OKMFL/VC73jlUOnukmVcFLT8m+f8p/KtMsFmlzoEpW5Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4edebi4sa7iBK6j6rhgpH7d2zSvW1rq+NzSmWVeXhYbCV12e0
	TraZDMjcBDKWSqbp3+TB72TNMcG5OC6KHEpCp8XSIsdNcJvS5eJ+gQg52eGlKBB4yHU=
X-Gm-Gg: ASbGncupo6Yg6sX8e/VvR3ZEVnq3RoA+t7QyQx0QC4Ibj2Ymqw7rfw2xCCi7vpoSJxX
	MKvtOStSIAVg3XL28ohl6jQqQ/U0Oo0dKBtZ+QT5jcVxTuZotM1FWCM4ebyFmPXB/5jzN3f7Yme
	roaWkjNbFbReUxn1ckqpchbeozDe6K6HRiwpOpDRryBbhDjsM0fhrtK8SwgCU0cSbEN6VXK8VHE
	CUq7sZvAZlrZuBQiQU/qxbaXVmX590hPhQ/fVRj+nHhiBigItzGrQF0pxB7EsKVj4pKjuSFmxE8
	RJSNY8rq7vd2ncw46gzI+bAfTHVSDqI59gDIkUdk1hRl8HMqY+d5tIsZWuVMIDwC0FWf5ZT7HMN
	PtrllGi9zTUpeqJ7G/Ts/ZGIAZMSzOyqb4hbtbFrHgS9sOApBwkOKlRv5PMKLMz2hdWhPAmslku
	Emcf3NO025rUIfmmFmi963
X-Google-Smtp-Source: AGHT+IHL+PNtji7kvM390rp33kpuqAZCzgws1M/fVPeNz18vwSg7KvAzI8ybtQyvrh1f8dSFikQCIA==
X-Received: by 2002:a05:600c:1914:b0:45c:b6d3:a11d with SMTP id 5b1f17b1804b1-46e33c382ccmr27469725e9.1.1758805042699;
        Thu, 25 Sep 2025 05:57:22 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-410f2007372sm2087422f8f.16.2025.09.25.05.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:57:22 -0700 (PDT)
Message-ID: <f7ec862a-d3c5-480b-91bb-e9ff1bb87d4a@linaro.org>
Date: Thu, 25 Sep 2025 13:57:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <9cVxYzExtV_uysqXmZcP03jBKVwb9fRH7EuJPSeLUS-Juqq3JdoISB_wwBeiJUTBFr0ZuGTg2sSXn8NjSi11Pg==@protonmail.internalid>
 <20250924-knp-cam-v1-4-b72d6deea054@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-cam-v1-4-b72d6deea054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 01:02, Jingyi Wang wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> This change adds 'cmn_status_offset' variable in 'csidphy_device_regs'
> structure. It helps adapt the offset to the common status registers that
> is different in v2.4.0 from others.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 138 ++++++++++++++++++++-
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
>   drivers/media/platform/qcom/camss/camss.c          | 107 ++++++++++++++++
>   3 files changed, 240 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index a229ba04b158..ecb91d3688ca 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -46,7 +46,7 @@
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, bias, n)	((offset) + (bias) + 0x4 * (n))

You need to explain this bias parameter in the commit log.

> 
>   #define CSIPHY_DEFAULT_PARAMS		0
>   #define CSIPHY_LANE_ENABLE		1
> @@ -587,6 +587,123 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>   	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
> 
> +/* GEN2 2.4.0 2PH DPHY mode */

You need to call out the process node in this comment, per the other 
recent additions.

> +static const struct
> +csiphy_lane_regs lane_regs_kaanapali[] = {
> +	/* LN 0 */
> +	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0090, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x005C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0060, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 2 */
> +	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0490, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x045C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0460, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 4 */
> +	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0890, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0808, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x085C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0860, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 6 */
> +	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C00, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C5C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C60, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN CLK */
> +	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
>   static const struct
>   csiphy_lane_regs lane_regs_x1e80100[] = {
> @@ -714,13 +831,13 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>   	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
> 
>   	hw_version = readl_relaxed(csiphy->base +
> -				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
> +		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, regs->cmn_status_offset, 12));
>   	hw_version |= readl_relaxed(csiphy->base +
> -				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
> +		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, regs->cmn_status_offset, 13)) << 8;
>   	hw_version |= readl_relaxed(csiphy->base +
> -				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
> +		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, regs->cmn_status_offset, 14)) << 16;
>   	hw_version |= readl_relaxed(csiphy->base +
> -				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
> +		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, regs->cmn_status_offset, 15)) << 24;
> 
>   	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
>   }
> @@ -749,7 +866,8 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
>   	for (i = 0; i < 11; i++) {
>   		int c = i + 22;
>   		u8 val = readl_relaxed(csiphy->base +
> -				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
> +			CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
> +							  regs->cmn_status_offset, i));
> 
>   		writel_relaxed(val, csiphy->base +
>   			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
> @@ -915,6 +1033,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> +	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
>   		ret = true;
>   		break;
> @@ -989,6 +1108,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
> 
>   	csiphy->regs = regs;
>   	regs->offset = 0x800;
> +	regs->cmn_status_offset = 0xb0;
> 
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
> @@ -1023,6 +1143,12 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_regs = &lane_regs_sa8775p[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
>   		break;
> +	case CAMSS_KAANAPALI:
> +		regs->lane_regs = &lane_regs_kaanapali[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_kaanapali);
> +		regs->offset = 0x1000;
> +		regs->cmn_status_offset = 0x138;

I don't think a second offset is warranted

You could acheive the required offset with offset = 0x1138; and a comment.

Perhaps I'm not seeing it but seems like an additional - fixed - fluff 
variable.

> +		break;
>   	default:
>   		break;
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 895f80003c44..f5bf02cd32d5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -90,6 +90,7 @@ struct csiphy_device_regs {
>   	const struct csiphy_lane_regs *lane_regs;
>   	int lane_array_size;
>   	u32 offset;
> +	u32 cmn_status_offset;
>   };
> 
>   struct csiphy_device {
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 4a5caf54c116..542122fba825 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,111 @@
> 
>   static const struct parent_dev_ops vfe_parent_dev_ops;
> 
> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdda-phy0", "vdda-pll" },
> +		.clock = { "csiphy0", "csiphy0_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdda-phy1", "vdda-pll" },
> +		.clock = { "csiphy1", "csiphy1_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdda-phy2", "vdda-pll" },
> +		.clock = { "csiphy2", "csiphy2_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = { "vdda-phy3", "vdda-pll" },
> +		.clock = { "csiphy3", "csiphy3_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = { "vdda-phy4", "vdda-pll" },
> +		.clock = { "csiphy4", "csiphy4_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.id = 4,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY5 */
> +	{
> +		.regulators = { "vdda-phy5", "vdda-pll" },
> +		.clock = { "csiphy5", "csiphy5_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy5" },
> +		.interrupt = { "csiphy5" },
> +		.csiphy = {
> +			.id = 5,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_kaanapali[] = {
>   	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>   	{
> @@ -4308,8 +4413,10 @@ static void camss_remove(struct platform_device *pdev)
>   static const struct camss_resources kaanapali_resources = {
>   	.version = CAMSS_KAANAPALI,
>   	.pd_name = "top",
> +	.csiphy_res = csiphy_res_kaanapali,
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>   };
> 
>   static const struct camss_resources msm8916_resources = {
> 
> --
> 2.25.1
> 


