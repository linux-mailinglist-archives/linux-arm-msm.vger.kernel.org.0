Return-Path: <linux-arm-msm+bounces-82447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7235C6D7C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 90F032D1B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DED30BF64;
	Wed, 19 Nov 2025 08:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+X/zQoL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47772D7DDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541750; cv=none; b=F7ivH4lTJie4WYArKM0VZilcr9tDCbbenv6TR08wi+A2ST9R3ugoxzQqQP5hV9U9urUqAMOdN/cuwUZf9OlMBUUcfjhGOnC92m05H+4293MQN9Hc75RZURq+KBvp0cpXO5RTPl04lmvqVDitNBstpo/hHFZ1RYL9zerWYvXdWyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541750; c=relaxed/simple;
	bh=3AXDuPU+lKWMAn+SrfDrV3/Gps1TspB9J0gY7ezi1as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCoS9AU7TdMHP7mOOCV6Ah6IwWLsXLWe3OLc29YlNFrqh7cAXe6eGiJaZLLGQLZQ07sownT39/ux3uJSHk5pdDE2v0IpaA/o4rx/R+cE4kIPgf4RMrnL0i8eJuSkrFci+IQNAVA+xeTuoYVlBh0RT76CmXM4jqyA3mxpE354Hhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+X/zQoL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b31c610fcso5483720f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541747; x=1764146547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yi5k6FhTRnszTU4ub2HtHQHWRa8+xtRinFDw1eNRn5c=;
        b=T+X/zQoLA3DK2qAeV4kjLdDpZO1MyUz8QnJk3uXTiIZfLMwYIuOAK/Oak8qMa0IQfu
         m/jDPfQ5oIA+S+DLUQF7fuJ4G8FOX6ob9hdHt1XrYZFeBHuRvOfRtuG7uCHEz5+dW1qG
         pf1zEPWtIM28nXrxi1mAkrHbLPn6ydH2jhIqyB+Se6U9JKJiNZpH4TtWQF04OWfGDvVF
         b/gy9tuF2iEA11IdVCYMbOr3zmmHHz1xOzwPirxIzl4Pv4tViy3u9LFH/CQJll5uoGHu
         4jfruheWDU3eGQzU61svq5Ia/fYCwaP4DRIUPn+rw1+IwiKUmcqPsFbsSSZrJXZEJOXX
         3PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541747; x=1764146547;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi5k6FhTRnszTU4ub2HtHQHWRa8+xtRinFDw1eNRn5c=;
        b=anr0nbEKWwnF8Fzn1xODcXjvLd/lQ6f6g0dmAIu7mHA5CbL/U1SmnD4CWc0mSdqqu4
         LpZZ2lClXxjw0dE2ikiPm6cJUdSKQEuR9WkmZUNUO3imUhAkG7jNOaP5PuHgPvvwGRVx
         3zkwCCNPPmhMIf6q/tAxSqsuN9xvildThogjM+6bYte0Juis9qDlCzXI766GtYfYT8D6
         WhC1THbAI/HM5+KHzBAgrEY5rQuYjicLa27mujHjhuQ9e5Jm+VbBQ6mgf5ZxPqGV7Imr
         hRu7OY2h1Aq/oVzXM0wG+NCamBRYg3o9vvMbWYdpH72zwJm+12VP7LUgb2GBZJBXIJ5n
         z9uw==
X-Gm-Message-State: AOJu0YxXl4lYb1ux3Y4fSKMp4eDcXdWG8WmFpC9Gm6Mg+ugO5sJVWc7j
	QhwjeM9ElKAhF0jj9D8mzCVgDr1vY8rKguAstTMr4EO/8weBRGQ6hu60Pq1BImt82w0=
X-Gm-Gg: ASbGncvMVZTO37QlgYJw5WNWiw5IM8IHXzQ++5L8Pt27TdaSJJszpbxSIwiPTwI4nWN
	kuhmQPveCvMUqRaphYFiz8JvnkuC2VnT7chmnVA5AHsrDiFTxignQsywRx1k939VaMtf2oq6TF/
	BdvokQtknxARaKbBj6OnjnrBj/HrGQ5pPUiweWNEY5u2YSgEkEfIFUgWM9cjbOgl8pcapg7e6Wc
	tKBQwww7nyRT697UyHbA1Ps4lJzqwR+290oUdXneFtFcRbwa6zPrgrEsN4qu764hJ8m8fQx0xvM
	Qnkcd0Cq1dctYPzE6gh3+HDodMopTXmPSIrN7jdL1O90MW7Xlw5HeFX/Btqgx9eA5emNl33ItMT
	CUKkdXRb1NlwthM+n3U4kBl5VEq1W1qhaRg7d5oN/oe8BDaS/wmg7GFiD4v9eRS0SkCawPT8Ele
	RvEeoGXAFX/hZMlpyDp0cpK+5F66S7kG+4nXEfEtN2aDC1JbSTgjqXo34he+iCe6o=
X-Google-Smtp-Source: AGHT+IFApKg1U/eP5JzH7mZkCFrpbynYjZzdOp8s89mlzmKzHMfZxlrZ3gIewT2FA4JlyOqRRgVWog==
X-Received: by 2002:a5d:5f90:0:b0:429:8a71:d57 with SMTP id ffacd0b85a97d-42b59356aadmr17938218f8f.27.1763541746951;
        Wed, 19 Nov 2025 00:42:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae88sm36000475f8f.6.2025.11.19.00.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:42:26 -0800 (PST)
Message-ID: <bbf1fc3d-228a-42ad-97ee-8a03003b08b5@linaro.org>
Date: Wed, 19 Nov 2025 09:42:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: Update init sequence to set
 PHY_ENABLE
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, kishon@kernel.org,
 vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250920032158.242725-1-wesley.cheng@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250920032158.242725-1-wesley.cheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/25 05:21, Wesley Cheng wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Certain platforms may not have the PHY_ENABLE bit set on power on reset.
> Update the current sequence to explicitly write to enable the PHY_ENABLE
> bit.  This ensures that regardless of the platform, the PHY is properly
> enabled.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index bf32572566c4..fbf5e999ca7a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -25,6 +25,7 @@
>   #define POR				BIT(1)
>   
>   #define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> +#define PHY_ENABLE			BIT(0)
>   #define SIDDQ_SEL			BIT(1)
>   #define SIDDQ				BIT(2)
>   #define FSEL				GENMASK(6, 4)
> @@ -81,6 +82,7 @@ struct m31_eusb2_priv_data {
>   static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 1),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, PHY_ENABLE, 1),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, PLL_EN, 1),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, FSEL_SEL, 1),
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

