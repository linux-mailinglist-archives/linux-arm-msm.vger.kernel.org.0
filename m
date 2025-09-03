Return-Path: <linux-arm-msm+bounces-71766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC7B4196B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EEC518984A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9742D839B;
	Wed,  3 Sep 2025 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MveOr1EK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F1481749
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889850; cv=none; b=pO+KmBgVg9XH6o5CKFKcIiDnj+B+a/cZGjknqDWnTKeTJpbwGeUtwAVClswZFWmaNZb+KU8Z3bryew+a6f0ZcBNK0jbXm+kqnWnMVpoWHlKQRAciIwuCEG3wEYFAkUmCjRqn/+10p4MnBUSSC0LkEDflgoESY8530LKg65VlDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889850; c=relaxed/simple;
	bh=GLWbVZsCvv8vncq22iwaF1jZGEskxbZI97+7rz86n7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVJgHys4f+Qqg+bdMPjX/ZvosMiNlrGqUdkcq+aKOGeRpy5g7jRKQ915+yDoWC4Tn1ZCfBkMhd9Y6MWgTxKP10KkTJQgXXRentT2wx/mPauwb019qeXhRWUCAgJfT7M+cPcY0dAodIQQN3uVbE0g8JjXQGANsMxduJTewCeTjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MveOr1EK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45cb5492350so3805035e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 01:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756889846; x=1757494646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZXnBg/mkHQOpJsBzXAst/yraqBTJNw0ejzOcm9xd1g=;
        b=MveOr1EKUPtN0656SFus7PFC/9IHUowbJrjsKdTCoMTYgXNGvholySIhl/P6gPjFJ9
         Cs4edynHRHPkZeo4RBv3VYDY8SlhHFKAp28Bjv/ZgIF2P8Cm1PJl1fFTiqxIHbbbZ6sJ
         dG2PfCitUXKgRJOPnyol/DWa6MR8HeNLQH+7CkftzUszzFdEdgWOc/sLGpGtq9eAPfgq
         i5VEJ04qCMCnzy/lZNeHhcSBNHtGswKruO3E0X/IfTmNxQzIF+8ULGhQKlGrwMLKNlH9
         NcxwEYiwf5c2qX6IwjDMu52QDWYvbRvicjbsv2d0DNwpCW8rFtXvZn+sIBzlqyeC2dA6
         LwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756889846; x=1757494646;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZXnBg/mkHQOpJsBzXAst/yraqBTJNw0ejzOcm9xd1g=;
        b=NPG8ZypzCHyIteC2yOrK09wKUUa8ISS46NuTaKlWhYsh0Poi4ItyzIINIVDWDsHr0j
         lz3FxUUzLNDIhEothww/OrnSRDRtpS4WsbNjWq07XMX9NvAX1C1Znj8JW0PLxtsEiLXN
         USc3Bu4A7yqUze3ouXOmhrf/zoTUUC7Cu6vwoyTPSaWxMfwgtPX79XricJm5uxjL+gWW
         bj6og2Az3fOot88+iQ+Ii5FsgaTGTYONzRiRLWUgnAo77FL5IcN37ICAKuKWvpStzrVz
         geHnbsUBsXjI01hi3YfpctzgrfWdec8ZgTrL4ofK+/rxB6Yng2FT8tp50NutorgS1h9c
         29Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXNFu5jQTPUZWwu/KpWJPQVTtkGDFD6VBJYpqO54vpJ9R5ob6aKZ9lb9gsGd0oSlzVr958EHxlRySpo0ED7@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3AdVu66ood0ejGtFK9OMk2RlL4T3oastxIlSVq7v785XASb2
	jmvPDTQIuWu3YkbtbbV8LnTyfbfPH0aqwOyebuBLZi+p7rUtIFqpbyS4L0QwO1yYpAs=
X-Gm-Gg: ASbGncvvoPLX26HAbozXuQzdDsAQ/PVgoIEUe3lLbHAUbL77WU0zp2Irj9jE2l/8coB
	JySFjVFwv6JIIt8x8XU8ow4bj/km4LYda/UG42ID08T3YA4/SwtKRT85XgacX788W2ThPFIq8jB
	YJRTv/0ABtqbf2LCP/ANtfHFExZfhDViHfFTk8QkHvHFR7yCcG5E5KGo50/ca9c7HNYIu84a7wx
	U2xqIQAdU3wv1o2R1emLLjJU214G5auew0tiBKomB2x5iU8RN/oaavm/MJ1a9aMUIDyknR8/e2Y
	Jjokle9+ygDSfkTHMcbbNk5uHyOF5UmWR81Y/hNLGdy2Y6Fxg1jt3pdvoKMVlTnymD04nCM1iiF
	2yeebFU67ONec0O6MhB38VnUauxeDOoE0qZEwC4WyAkuow15sYWb3ylaHTvIb0wSyO49BlIJLKz
	0GEe4CV+Q=
X-Google-Smtp-Source: AGHT+IGJsXe7hI4qIXZIQeEagPDzvSXyS8iIUXps68CwO0+m0YToGuFjxtslM86YEyC6Gj/p441gZA==
X-Received: by 2002:a05:600c:1c10:b0:45c:a955:4578 with SMTP id 5b1f17b1804b1-45ca955460emr17517005e9.21.1756889846249;
        Wed, 03 Sep 2025 01:57:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:431c:dad5:266c:f97? ([2a01:e0a:3d9:2080:431c:dad5:266c:f97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3db72983560sm4253257f8f.1.2025.09.03.01.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 01:57:25 -0700 (PDT)
Message-ID: <437b6676-0669-410b-ae77-ec22aa0f66db@linaro.org>
Date: Wed, 3 Sep 2025 10:57:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/8] power: supply: Add several features support in
 qcom-battmgr driver
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>,
 =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250826-qcom_battmgr_update-v3-0-74ea410ef146@oss.qualcomm.com>
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
In-Reply-To: <20250826-qcom_battmgr_update-v3-0-74ea410ef146@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/08/2025 09:18, Fenglin Wu via B4 Relay wrote:
> Add following features in qcom-battmgr drivers as the battery management
> firmware has provided such capabilities:
>   - Add resistance power supply property in core driver and qcom-battmgr
>     driver to get battery resistance
>   - Add state_of_health power supply property in core driver and
>     qcom-battmgr driver to get battery health percentage
>   - Add charge control start/end threshold control by using
>     charge_control_start_threshold and charge_control_end_threshold power
>     supply properties
> 
> The changes have been tested on QRD8650 and X1E80100-CRD devices based on
> qcom/linux.git for-next commit a679f3f6931cdb0c2ef5dc0c26f895ae3f6c1ddc.

Gnome sets the properties and they are correctly loaded back at reboot.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED

Thanks,
Neil

> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Change power supply property "RESISTANCE" to "INTERNAL_RESISTANCE" and
>    update the ABI document accordingly.
> - Update the ABI document for "STATE_OF_HEALTH" property to explain it
>    better.
> - Drop following patches, as they were made due to my misunderstanding of
>    the compats fallback behavior. Thank you to Krzysztof for the correction
>    with patience.
>      [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100 out of fallbacks
>      [PATCH v2 7/8] usb: typec: ucsi_glink: Add UCSI quirk for X1E80100 platform
>      [PATCH v2 8/8] arm64: dts: qcom: x1*: Remove qcom,sm8550-pmic-glink fallback
> - Addressed several comments in [PATCH v2 5/8]:
>     - Separated the compat string addition change
>     - Fixed the coding style issues in several places to address this
>       checkpatch error:
>         "CHECK: Alignment should match open parenthesis"
>     - Add logic to read charge control thresholds from SDAM registers in driver
>       probe. It addresses the issue on X1E80100, where there is no interface
>       to retrieve the thresholds from the battery management firmware after
>       boot-up.
> - Add a DT binding change for charge_limit_xx "nvmem" DT properties.
> - Add a DT change to specifiy charge_limit_xx "nvmem" properties for X1E80100
>    devices.
> - Link to v2: https://lore.kernel.org/r/20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com
> 
> Changes in v2:
> - Corrected "qcom-battmgr" to "qcom_battmgr" in the commit subject of
>    patch 4/5.
> - Added charge control support for X1E80100 platform in patch 5.
> - X1E80100 is no longer a fallback of SM8550 in pmic-glink battmgr support,
>    hence added patch 6 in the pmic-glink binding to move X1E80100 out of the
>    fallbacks.
> - Added patch 7 in glink-ucsi driver to include UCSI quirk for X1E80100
>    platform
> - Added patch 8 to remove "qcom,sm8550-pmic-glink" compatible string in
>    x1* board files.
> - Rebased the changes on qcom/linux.git for-next commit 44ef9ab4baaf496d227ab98d368016700f0b9300.
> - Link to v1: https://lore.kernel.org/r/20250523-qcom_battmgr_update-v1-0-2bb6d4e0a56e@oss.qualcomm.com
> 
> ---
> Fenglin Wu (8):
>        power: supply: core: Add resistance power supply property
>        power: supply: core: Add state_of_health power supply property
>        power: supply: qcom_battmgr: Add resistance power supply property
>        power: supply: qcom_battmgr: Add state_of_health property
>        power: supply: qcom_battmgr: update compats for SM8550 and X1E80100
>        dt-bindings: soc: qcom,pmic-glink: Add charge limit nvmem properties
>        power: supply: qcom_battmgr: Add charge control support
>        arm64: dts: qcom: x1e80100-crd: Add charge limit nvmem
> 
>   Documentation/ABI/testing/sysfs-class-power        |  31 ++
>   .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  14 +
>   arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   2 +
>   arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |  20 ++
>   drivers/power/supply/power_supply_sysfs.c          |   2 +
>   drivers/power/supply/qcom_battmgr.c                | 316 ++++++++++++++++++++-
>   include/linux/power_supply.h                       |   2 +
>   7 files changed, 378 insertions(+), 9 deletions(-)
> ---
> base-commit: abbf1025002e4966bfcbf8a069234e485d49edf1
> change-id: 20250520-qcom_battmgr_update-3561dc526c05
> 
> Best regards,


