Return-Path: <linux-arm-msm+bounces-68666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD13B2205C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 718432A2D38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42E22E093F;
	Tue, 12 Aug 2025 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ux+jFxnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A3B2E093E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986005; cv=none; b=ecC4ujodrCEY8dnW8Vjcct37repe4mBl8qT8V3SoBXzCkIfLb3OlCRhnZImRBa7MKaiDZKczQc+tnEpGUjJvJpIWdQPg3J3FPqxTuBZvzuLGHeBhlPrxRzcCjATqVGUgJS5zXX5nC9WSILtXowshmMeKVOJY36++eE6rRBW+2b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986005; c=relaxed/simple;
	bh=bik/ZxUCbsiXR2/hrDV2nu377/7N0cOxs2aUthTSLgw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i+LBYTOCrnidLTl8ZJtfmNcSfOH38/sDMeUq0OpoaXHRNVZnL3LnXRyVBtnWmmjGx1XdPK82pDtkr0k6vNxcW9lSn29U2sQ4OfEWWSZ156UtrLuzD3rGXU38uPa/T9Mwtdhhm77CYTelXc9oMySuVPp8xDCyXp1XSqMkDIE3/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ux+jFxnT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so3291169f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754986001; x=1755590801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KB/9AiQUNaaeoTiNfFmXrTqb4RmKBU2EHYLBB9k4Yeg=;
        b=ux+jFxnTmNFmE2PgEOW3qdafEsdddQxyPTpkj46m02roJvgnRrFv3KXfoQr1q41NBR
         /PhKeruEqUPAQCzN/GK9TvVsBVeSCKKFyRnF4r2lKJRX2605h7QaJoOA2eo6ObYc7viK
         Wz9EDnLjs0r0b89QR6/u0tVWBYjkunZ5nAMkqwYSQV+e2LE8fCvognLE8aYKyevT9p+0
         ODXS/FUDeZePbGtHmZ9sFtJSO69/+m30slIO+Ajdj3apXQmCT12gIdS2N/1ra6C0s7/8
         xp8ryiv29fsmtJMV1GdSxMps2BneEROjjdgXR9K9LPkGh0YjOkbKu+fxh6D3F5odNUBc
         AQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986001; x=1755590801;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KB/9AiQUNaaeoTiNfFmXrTqb4RmKBU2EHYLBB9k4Yeg=;
        b=ch3RluEMKbkcw9iysddSNHaW2cSEkOSmzqcYbDa35Ld5iJnq3/U40DNXN/Wr4cICD0
         K5hBNX9icAd8nYDLzL21JG0LEY9souGIeNKLZfdZR9oN3fpeNZdbOES2KvJL0PsrgyUP
         KFUSIfCM7K9FnvGTR9A6MQtXgg6vJb06xZxIcl3wmY0jYgUjKWTMhDexfP6D8525c0kU
         mRWQQhIrU5X6FV5jZX+LUiGlRIEXGa7/dY9J/Aeon0SY6fUv+MNfl1miu3pKs33Sd4/H
         ILhK1ibhAeAyEcNTgRGL1nyCiBczFnk1kowswa6GfQ9D4hd4UXENqSqC2yULoQpV5yBv
         3ZJw==
X-Forwarded-Encrypted: i=1; AJvYcCXd9cv1U8k74e79fitqe7VnjcMnx+vQDYtt81FBZctV2AxZe8zs7F2KOc4vCdy8nbBjTkTWcnoC8z3odq2E@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8etm1njpDWI4HoCpBr3UORzdGX1xsrieFJK9Mv8IwpO7ss5xF
	qDX1rEZf7WyprrbfuJrTRWxkkfbwk6Z6jmprsUB61Cx6ybdcxczNFm38otiKElw0bZw=
X-Gm-Gg: ASbGnct2pAIsotk+humemarwF5zzp99tu6ip6NO12tjYX8TLK/SeJwR8owk5yLiIImz
	A5nG3YvXvPTqK2m9XGG+IHIGMdOf8iHmFY6FG3gsQIY2ShAQlzxzR1rSAzDRneAwrDtu1w6l22i
	9XmM/nw9FulsU8hLjR2wC8OVMRiA9CIo4sCN1dDv8mVZy7wjS/hKKq9UokvG9T/2In6o3FzyOb7
	TSiwsvX8cAuWcGC1D02+mfcqqaA9pSfs5w+6HAf094+NRdUmcRSGQF32jg5lIyuWRmwby/GDlv3
	1hhIZRQbaxEnzDh8MX6AP1Tshqp934q+iu0E9JmyQblixj+YXmw1EqqKsIjejXd1OdOrXe5AidV
	HIovmqODQJEP7l/IlsjF4C9rMDqyGVRonTBm41gB5GCbe9TTuzvXzviD+UHkFeOqsO3xCosmAC1
	A=
X-Google-Smtp-Source: AGHT+IETI+UV2HZkfItiK02d7e6yOOmac7nlYx0JTMj896CyxMKBI5HQuVCk7U+zzLBdJUldXLTRuA==
X-Received: by 2002:a5d:5849:0:b0:3b7:8ddc:87a1 with SMTP id ffacd0b85a97d-3b90092cafemr13572895f8f.4.1754986001129;
        Tue, 12 Aug 2025 01:06:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b? ([2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm43290824f8f.39.2025.08.12.01.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:06:40 -0700 (PDT)
Message-ID: <acdff7a4-bd9f-45c1-b620-25e667d1f628@linaro.org>
Date: Tue, 12 Aug 2025 10:06:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
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
In-Reply-To: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2025 09:48, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..c2e6af575cbe4b3e3f2a019b24eecf3a5d469566 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -110,6 +110,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>   static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   {
>   	u32 reg_val = 0, value, i;
> +	u32 count = 0;
>   	int ret;
>   
>   	if (iris_vpu3x_hw_power_collapsed(core))
> @@ -128,13 +129,31 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   			goto disable_power;
>   	}
>   
> +	/* set MNoC to low power */
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +	while (!(value & BIT(0)) && (value & BIT(2) || value & BIT(1))) {
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		usleep_range(10, 20);
> +
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +		if (++count >= 1000) {
> +			dev_err(core->dev, "LPI handshake timeout\n");
> +			break;
> +		}
> +	}
> +
>   	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>   				 reg_val, reg_val & BIT(0), 200, 2000);
>   	if (ret)
>   		goto disable_power;
>   
> -	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> -	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>   
>   	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
>   	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> 
> ---
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> change-id: 20250812-sm8650-power-sequence-fix-ba9a92098233
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks,
Neil

