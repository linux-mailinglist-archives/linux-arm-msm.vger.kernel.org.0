Return-Path: <linux-arm-msm+bounces-104768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOyxMRyR72nRCwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:38:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5247685D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6381A3046982
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5196355F57;
	Mon, 27 Apr 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywuW7fw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA2352F85
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306971; cv=none; b=rRewDtPHdO0N6SuX9KbCt89Ib2EibRDoYErgJMvtgf9bbzGFYlngYnUO6sX1hsUtuUBCXj4qzqrD3BxkYZalCcyvHJ0A5A87MTFo61zQqIgfC3WKyg+kYJmU5EHCn9+Vn0ZW6CXp6UYsCTtsYL5jkALI4Yw8tRn6qHxdYmsSs5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306971; c=relaxed/simple;
	bh=chBXs9vwdAn9lBxtRNCTRR3hSgi1+6MxF4OgcIVnnGQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BFxCduNbggdwGWj4jDkHcWUzgIbJHHF/5CCLes8D2FwVnsqabr7i3Hbdj1/mHZkot0Oy0YZ6hqZ/xscGXicT52gl5t3ntsNwDrUona+HosPSgCDO7hERfk+lNUQeaVJhvzXyiQfNQvP3EyqqDjEt9zxGTi4bBOSeBtHDQvEH2fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywuW7fw0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so62118895e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306968; x=1777911768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWtSCvyohiQQmnkjOtH7oJP0NOWHMPvZbVv+we7z5Zg=;
        b=ywuW7fw0+RIBntOH0qbpgwSlC8K2rB71v9G6AJV/c8M0ldva6YA05sKz3GDE+JXx4/
         0M9fjk/SAsNlQZZWB5n0qA0KVIYSSznNeEqUOT5xjo/IOfGrvYlXngJLCie2CBOvrqHW
         Ng3BDNsL5/tvSIMV6Db6OSoJ4EPFHAsgbnFrWDsnDICfAoCGOp3up3B30IFNvxjluBIJ
         aG5n4rB/ubk5JTkV4xXor9NRucabFqrwaoekH0acJEm+Xo8b49z6xGKY0FpD7hhT7JnI
         /rdSRK+pYHHrov0FQCE9fkCJwphzy1O6s6ovJQAptmv04RlWXJtLxZE6giLo5Yfjk+ik
         qMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306968; x=1777911768;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWtSCvyohiQQmnkjOtH7oJP0NOWHMPvZbVv+we7z5Zg=;
        b=RGXRZCs7jcabt6xQdVthqUlnR/oexPiJZXwcMYma8tRf5JJDJxhknBmiCMx1buO0XA
         6Tx6/N9N8difiXKidJDyGzWEcmkwOpBDqYX2xVVqOE2YdRsBJr/MFyRTp1sFcPJvqPc3
         Ln+D66wo4zreiR9M/d9rrsxDTYxxXwe9RDAtahFC3AVmVW5x3DXft6abUM2ofBd5h5j1
         AHoLwjfay+wI/uybqjl+ZR0qiuZJ38xOBayliHQA7jjcz1N1z+OCJCkZHACB9QdIV1uL
         5in8GdkazotcRdXKJ8iwEutU1ryyqiNV7205E1HVSBAqybBoei5XHtrm72AwLy5pB7yY
         uXvw==
X-Gm-Message-State: AOJu0YzzH/NhWbsGZ2WYtUnjaGjLW58yHmBg8oTm/DxAwNINFsZGDKGT
	uVat2oRTf1Z/3OSc+VNSMf/dHSfbzWxVM7fu/anp2PPiE6N7CHhANmF0LrA3dAwMcmo=
X-Gm-Gg: AeBDieuUMFh/DLTh2GjewuWhXgYLt8dmXh1WFlOP/lEzCdiO9/UGj3X01TeOwzd3AdO
	zxcCZyo8iX3vzZIstnpHuVHKqKvv5aUe1dhd5IetFHaQhw90p5te/g8i4w2eTd/U2THifJdHLfG
	ae1U1Kxby+pmCvLg6S2tNiVFOeRvdX2iIyd/Fk0++NInhjfvNo7P5E5VlDm+qW8lKRgc/iYBLgk
	PDQ1q3zxSC+D8w1dAFNhDxre/Q4ga9ciaD6Q3u7WGvNRBWmWan72hG3g+PJAof6FUVVvARWS1x6
	eGdAQq00jpzwGvikPT2Dmeywf/9vYUGUixwDVz1tUU+SIQmRwCirQaoQpC1++xLIefrSCe1CrgJ
	SGQd7pAWvGzWmMqQrbzPXxacQ74HSY+owgnkggsBjLyMmZPLfel9QBmKldYvEYAk2c03zNkC573
	Y3Z7y+w1ODgomR5b4+VhnSdzLiIvrhUkCub9AwviAVsudgkOGLZW7tuqbiYBrH2YQEBtL2Umf/T
	TEVRklQEsCtp5cQ7w==
X-Received: by 2002:a05:600c:49a3:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48a76f504cbmr781395e9.8.1777306967427;
        Mon, 27 Apr 2026 09:22:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:efc4:a4e2:23e4:a750? ([2a01:e0a:106d:1080:efc4:a4e2:23e4:a750])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7ac6aasm255866995e9.25.2026.04.27.09.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:22:47 -0700 (PDT)
Message-ID: <41d7da8b-7728-4ba6-bc03-af8ebe036f8a@linaro.org>
Date: Mon, 27 Apr 2026 18:22:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 1/6] arm64: dts: qcom: add PMIC5 Gen3 macros for
 channel numbers
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
 <20260427-topic-sm8x50-adc5-gen3-v1-1-8a70f7b90a75@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-1-8a70f7b90a75@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2BD5247685D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104768-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:email,linaro.org:dkim,linaro.org:replyto];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]

On 4/27/26 18:15, Neil Armstrong wrote:
> Add the PMIC5 Gen3 macros to calculate the channel numbers which
> is a combination of SPMI bus number and a constant for the sensor
> type and configuration.
> 
> The macros definitions were taken out of [1] where it was initially
> in the dt-bindings include directory but since those are not hardware
> bindings but logical numbers, they can be moved to local includes
> instead to make the DT source more readable.
> 
> [1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   | 46 ++++++++++++
>   arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  | 85 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h | 22 ++++++
>   arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  | 52 +++++++++++++
>   4 files changed, 205 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h
> new file mode 100644
> index 000000000000..2a6338812d4e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _QCOM_PM8550_ACD5_GEN3_H
> +#define _QCOM_PM8550_ACD5_GEN3_H
> +
> +#include "qcom,adc5-gen3-channels.h"
> +
> +/* ADC channels for PM8550_ADC for PMIC5 Gen3 */
> +#define PM8550_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
> +#define PM8550_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
> +#define PM8550_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
> +#define PM8550_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
> +
> +#define PM8550_ADC5_GEN3_AMUX_THM1(sid)			((sid) << 8 | ADC5_GEN3_AMUX1_THM)
> +#define PM8550_ADC5_GEN3_AMUX_THM2(sid)			((sid) << 8 | ADC5_GEN3_AMUX2_THM)
> +#define PM8550_ADC5_GEN3_AMUX_THM3(sid)			((sid) << 8 | ADC5_GEN3_AMUX3_THM)
> +#define PM8550_ADC5_GEN3_AMUX_THM4(sid)			((sid) << 8 | ADC5_GEN3_AMUX4_THM)
> +#define PM8550_ADC5_GEN3_AMUX_THM5(sid)			((sid) << 8 | ADC5_GEN3_AMUX5_THM)
> +#define PM8550_ADC5_GEN3_AMUX_THM6_GPIO2(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
> +#define PM8550_ADC5_GEN3_AMUX1_GPIO3(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
> +#define PM8550_ADC5_GEN3_AMUX2_GPIO4(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO)
> +#define PM8550_ADC5_GEN3_AMUX3_GPIO7(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO)
> +#define PM8550_ADC5_GEN3_AMUX4_GPIO12(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO)
> +
> +/* 100k pull-up */
> +#define PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX_THM2_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX_THM3_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX_THM4_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX_THM5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX_THM6_GPIO2_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX1_GPIO3_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX2_GPIO4_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX3_GPIO7_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_100K_PU)
> +#define PM8550_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)
> +
> +/* 1/3 Divider */
> +#define PM8550_ADC5_GEN3_AMUX3_GPIO7_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_DIV3)
> +#define PM8550_ADC5_GEN3_AMUX4_GPIO12_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_DIV3)
> +
> +#define PM8550_ADC5_GEN3_VPH_PWR(sid)			((sid) << 8 | ADC5_GEN3_VPH_PWR)
> +
> +#endif /* _QCOM_PM8550_ACD5_GEN3_H */
> diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h
> new file mode 100644
> index 000000000000..312daa846f79
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _QCOM_PM8550B_ACD5_GEN3_H
> +#define _QCOM_PM8550B_ACD5_GEN3_H
> +
> +#include "qcom,adc5-gen3-channels.h"
> +
> +/* ADC channels for PM8550B_ADC for PMIC5 Gen3 */
> +#define PM8550B_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
> +#define PM8550B_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
> +#define PM8550B_ADC5_GEN3_VREF_VADC(sid)		((sid) << 8 | ADC5_GEN3_VREF_VADC)
> +#define PM8550B_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
> +
> +#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM)
> +#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM)
> +#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM)
> +#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM)
> +#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM)
> +#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
> +#define PM8550B_ADC5_GEN3_AMUX1_GPIO1(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
> +#define PM8550B_ADC5_GEN3_AMUX2_GPIO5(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO)
> +#define PM8550B_ADC5_GEN3_AMUX3_GPIO6(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO)
> +#define PM8550B_ADC5_GEN3_AMUX4_GPIO12(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO)
> +
> +#define PM8550B_ADC5_GEN3_CHG_TEMP(sid)			((sid) << 8 | ADC5_GEN3_CHG_TEMP)
> +#define PM8550B_ADC5_GEN3_USB_SNS_V_16(sid)		((sid) << 8 | ADC5_GEN3_USB_SNS_V_16)
> +#define PM8550B_ADC5_GEN3_VIN_DIV16_MUX(sid)		((sid) << 8 | ADC5_GEN3_VIN_DIV16_MUX)
> +#define PM8550B_ADC5_GEN3_VREF_BAT_THERM(sid)		((sid) << 8 | ADC5_GEN3_VREF_BAT_THERM)
> +#define PM8550B_ADC5_GEN3_IIN_FB(sid)			((sid) << 8 | ADC5_GEN3_IIN_FB)
> +#define PM8550B_ADC5_GEN3_TEMP_ALARM_LITE(sid)		((sid) << 8 | ADC5_GEN3_TEMP_ALARM_LITE)
> +#define PM8550B_ADC5_GEN3_SMB_IIN(sid)			((sid) << 8 | ADC5_GEN3_IIN_SMB)
> +#define PM8550B_ADC5_GEN3_SMB_ICHG(sid)			((sid) << 8 | ADC5_GEN3_ICHG_SMB)
> +#define PM8550B_ADC5_GEN3_ICHG_FB(sid)			((sid) << 8 | ADC5_GEN3_ICHG_FB)
> +
> +/* 30k pull-up */
> +#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_30K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_30K_PU)
> +
> +/* 100k pull-up */
> +#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_100K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)
> +
> +/* 400k pull-up */
> +#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_400K_PU)
> +#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_400K_PU)
> +
> +/* 1/3 Divider */
> +#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_DIV3)
> +#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_DIV3)
> +#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_DIV3)
> +
> +#define PM8550B_ADC5_GEN3_VPH_PWR(sid)			((sid) << 8 | ADC5_GEN3_VPH_PWR)
> +#define PM8550B_ADC5_GEN3_VBAT_SNS_QBG(sid)		((sid) << 8 | ADC5_GEN3_VBAT_SNS_QBG)
> +#define PM8550B_ADC5_GEN3_VBAT_SNS_CHGR(sid)		((sid) << 8 | ADC5_GEN3_VBAT_SNS_CHGR)
> +#define PM8550B_ADC5_GEN3_VBAT_2S_MID_QBG(sid)		((sid) << 8 | ADC5_GEN3_VBAT_2S_MID_QBG)
> +#define PM8550B_ADC5_GEN3_VBAT_2S_MID_CHGR(sid)		((sid) << 8 | ADC5_GEN3_VBAT_2S_MID_CHGR)
> +
> +#endif /* _QCOM_PM8550B_ACD5_GEN3_H */
> diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h
> new file mode 100644
> index 000000000000..7a261a7a9cb0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _QCOM_PM8550VX_ACD5_GEN3_H
> +#define _QCOM_PM8550VX_ACD5_GEN3_H
> +
> +#include "qcom,adc5-gen3-channels.h"
> +
> +/* ADC channels for PM8550VX_ADC for PMIC5 Gen3 */
> +#define PM8550VS_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
> +#define PM8550VS_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
> +#define PM8550VS_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
> +#define PM8550VS_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
> +
> +#define PM8550VE_ADC5_GEN3_OFFSET_REF(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
> +#define PM8550VE_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
> +#define PM8550VE_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
> +#define PM8550VE_ADC5_GEN3_DIE_TEMP(sid)		((sid) << 8 | ADC5_GEN3_DIE_TEMP)
> +
> +#endif /* _QCOM_PM8550VX_ACD5_GEN3_H */
> diff --git a/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h
> new file mode 100644
> index 000000000000..60b3b9c60d4e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _QCOM_PMK8550_ACD5_GEN3_H
> +#define _QCOM_PMK8550_ACD5_GEN3_H
> +
> +#include "qcom,adc5-gen3-channels.h"

Oops forgot the ship this file... nevertheless I'm waiting for comments on the method.

Neil

> +
> +/* ADC channels for PMK8550_ADC for PMIC5 Gen3 */
> +#define PMK8550_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
> +#define PMK8550_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
> +#define PMK8550_ADC5_GEN3_VREF_VADC(sid)		((sid) << 8 | ADC5_GEN3_VREF_VADC)
> +#define PMK8550_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
> +
> +#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM)
> +#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM)
> +#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM)
> +#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM)
> +#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM)
> +#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
> +#define PMK8550_ADC5_GEN3_AMUX1_GPIO6(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
> +
> +/* 30k pull-up */
> +#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_30K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_30K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_30K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_30K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_30K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_30K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_30K_PU)
> +
> +/* 100k pull-up */
> +#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
> +
> +/* 400k pull-up */
> +#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_400K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_400K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_400K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_400K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_400K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_400K_PU)
> +#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_400K_PU)
> +
> +#endif /* _QCOM_PMK8550_ACD5_GEN3_H */
> 


