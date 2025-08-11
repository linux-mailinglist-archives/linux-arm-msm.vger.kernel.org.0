Return-Path: <linux-arm-msm+bounces-68566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3056B21511
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 21:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712EF3A82C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 19:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE68A27AC3D;
	Mon, 11 Aug 2025 19:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vzTAN3/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD39426CE2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754939092; cv=none; b=pvmIOuIloRfAr7LTcN97DCbmeMucYaMldjBQBmdOFmOR3SKizlFYsWCv6yaNaQUW+VWJ5tTbLnryfYIDHCWpq9sEdoT8ZoFRALYrQnxZqg3nFTfIR87rFojjhMVMio0f3tPnLL4IAAmYzAsOW00SIGGNEPVJ6XHQAOC+JVaP4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754939092; c=relaxed/simple;
	bh=Jk1VP2qa7l0ygQ3fKCoTy74O9E70rUSr95ymu+ekJxA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c4eSJuoVTUPRF8QI4Ky+ja9QkP5124FWN5iRBqI/DtBnVH+D2jZCq6eF27nNkWKD/9ylXn+KDIFqiGY/prAvi9yiSq2XUYBNhJQjA3SKKPpdxqGjt2iIgXqaWcGOIcGfbqDE/Sfi9wqdmcK1KdL/I2PRav0EKpuni1J2uYd5fNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vzTAN3/h; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7886bee77so3544486f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754939088; x=1755543888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZZ4dukWfnrzGm5DUtUwAHWHllsDgcftC3XLB9SWVHU=;
        b=vzTAN3/hdFBHr5Tyc0/D9zd6GuGUjhStJlhRNZ5A6AtsYU9+OXjCA8bN+p08hxDJ79
         /AkL/MPyzg9dqKhoV90p8n04ZWlX24JBAFrUCZ3tfi4lciGC5CogLgST0+FjTLUXjyw8
         lnzzkkwBv20v++NtuiM1ZfW8bU4VKFCgrayI7i2KKiS7p6s/+DVowlGO4P/E2OY1a+IF
         cmUKbQ7NwbqnvOYngYzlNP+E+9ir+RoafelRNiNvEv8p+XUsQS90T9Tu9gaJ0lQjrf21
         Ug61bkbOnLnIgCFKT0YiQMQEnA33Zr2G3rpYKOc0376PFxLwrld8B2ERqx0SjJJH+p4v
         sjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754939088; x=1755543888;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZZ4dukWfnrzGm5DUtUwAHWHllsDgcftC3XLB9SWVHU=;
        b=IbbY9iV8NQOsEB8gqXglcwG4Zjsdi0doqCSHdRrW7Lp4zzHO8rj2EUpIaWLMUfJOsI
         PVHQ/aRcFF5gqrhIGVeurJb6ID4SquMbzpDc0ZHQPL4CqdsFzaGWgHDXu7YQbGLUkqpK
         iAVJq5mBfASZklwRNOdIXo+3/nF/cpxGcv1MJ6bvNQFtXPTExZYGEU8faAvAB5OpEYLR
         /y5fjFxIfuE3pIAapAFTbOKQGLzUN3GCOcKZnbwA14rLXp4yNr74lw1xLRdMuXsqx3+x
         N7XRH2nwfbNFXGfhT32G9gLtIrR8gcXCxsvidpKgYRg5L9OGTxLy5tP6BgA6ekLEYxuu
         J1BA==
X-Forwarded-Encrypted: i=1; AJvYcCWFIInZK6V/404bCtaVsIh09GXQ8juysDwUHWm9NOUDHjRcIZKyg4Uq6m7GsWQMgrG6oKAl9M9rKC+PDKT3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhw3EwToSgt1xmNr685zscz9C2CaSmXunZ+LznEFTYt1brEDF7
	uzXSqI4HTDgfuSG3uizjFxqgSMjlXa14zzTfU6bo1kNjFDUSSE/EhJc8LZnny63BNXE=
X-Gm-Gg: ASbGncvTfzj31ej8Hjmn868tHkeugJNimPs8DRvRsYpDES1lOPzhR4A+79aGhJ1hQsn
	l7x+zfusl0XkF2q8cSixf4tPUyV+VV1JNJvQ8p5idemlbElHIRqgJWwGr3PphZsZXGwQBkLu42M
	Y7+t0u/G98sQF2bK4lvOO83vQX/5TZOG0UwnFPbt3FCe7yRrR4cbc0Mxllfn7fpgeTX864RjXO+
	2o1KAY/FOzZu9mPbJeEHH9sTvtu05LEXHzW8Ey/dJXcv/43OIdtDwQWRJDD3rzyRCuDf5q0aOCb
	3XqCr7BWCqJKezCDeKARFdZqAygClxCxJYqD8Ei7c12FZtiMVRhVmyiMBmd8FtTob9+yJ5EGD4n
	0LipvBk7MO69OGdHK6mAFb3kjXThX+CX4X6o8FdZSNodQ6MvJJcD1q5bOOQi4TyM7Vsb2KqFvqR
	VLtaeCQNkqmw==
X-Google-Smtp-Source: AGHT+IGNyTELrMm8IxX2rL2JOAtkoqeNSDKaW9RX/7J+QSJpvnGTggjn4BTNIs5nO2xxLGv7gxVaQA==
X-Received: by 2002:a05:6000:4282:b0:3b7:9c79:3293 with SMTP id ffacd0b85a97d-3b911015717mr614457f8f.58.1754939087798;
        Mon, 11 Aug 2025 12:04:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b0fa:b045:4b82:de09? ([2a01:e0a:3d9:2080:b0fa:b045:4b82:de09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bb04c612sm384638515e9.0.2025.08.11.12.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 12:04:47 -0700 (PDT)
Message-ID: <1ab2f4f0-94e5-413b-a87b-190b288b5f32@linaro.org>
Date: Mon, 11 Aug 2025 21:04:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
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
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2025 18:33, Konrad Dybcio wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
> 
> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> will be set in between of USB-Only, Combo and DisplayPort Only so
> this will leave enough time to the DRM DisplayPort controller to
> turn of the DisplayPort PHY.
> 
> The patchset also includes bindings changes and DT changes.
> 
> This has been successfully tested on an SM8550 board, but the
> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
> PD USB Hubs and PD Altmode Dongles to make sure the switch works
> as expected.
> 
> The DisplayPort 4 lanes setup can be check with:
> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
> 	name = msm_dp
> 	drm_dp_link
> 		rate = 540000
> 		num_lanes = 4
> ...
> 
> This patchset depends on [1] to allow broadcasting the type-c mode
> to the PHY, otherwise the PHY will keep the combo state while the
> retimer would setup the 4 lanes in DP mode.
> 
> [1] https://lore.kernel.org/all/20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org/
> 
> Changes in v4:
> - Default to USB3_ONLY if there's no DP SVID (Dmitry)
> - Pick up tags, dropped T-bys due to the above change
> - Add missing submitter's sign-off on some patches
> - The odd 4-lane-DP + USB2 case remains unhandled for now, but it's
>    not a huge deal, see:
>    <c2f2ba36-1a25-450e-99b9-79aa4fd4913d@linaro.org>
> - Link to v3: https://lore.kernel.org/r/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com
> Changes in v3:
> - Take the series from Neil
> - Rebase
> - Rename many variables
> - Test on X1E & X13s
> - Apply a number of small cosmetic/codestyle changes
> - Remove some unused variables
> - Some smaller bugfixes
> - Link to v2: https://lore.kernel.org/lkml/20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org/
> Changes in v2:
> - Reference usb-switch.yaml in bindings patch
> - Fix switch/case indenting
> - Check svid for USB_TYPEC_DP_SID
> - Fix X13s patch subject
> - Update SM8650 patch to enable 4 lanes on HDK aswell
> - Link to v1: https://lore.kernel.org/r/20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (1):
>        phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
> 
> Neil Armstrong (5):
>        dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
>        phy: qcom: qmp-combo: store DP phy power state
>        phy: qcom: qmp-combo: introduce QMPPHY_MODE
>        phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE
>        arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set up 4-lane DP
> 
>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   7 +-
>   .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +-
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 179 +++++++++++++++++++--
>   3 files changed, 170 insertions(+), 22 deletions(-)
> ---
> base-commit: 442d93313caebc8ccd6d53f4572c50732a95bc48
> change-id: 20250527-topic-4ln_dp_respin-c6924a8825ce
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Lenovo Thinkpad T14S

Successfully got 4 lanes working with an USB-C to DP adapter with either orientation:
	dp_link:
		test_requested = 512
		num_lanes = 4
		bw_code = 20
		lclk = 540000000
		v_level = 2
		p_level = 0

And 2 lanes is still working.

I'll test on SM8550/SM8650 later this week.

Thanks,
Neil

