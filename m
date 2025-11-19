Return-Path: <linux-arm-msm+bounces-82440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDCCC6D640
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A332D35AB9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B38328B43;
	Wed, 19 Nov 2025 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKrqNait"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B51C327219
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763540417; cv=none; b=mH3bkkYqM5ZXP6Cqb6AMid3eD2y5rAVUGcRcWb82eiFmTi0UbFdIi67CkrQk6hKJXMzRh5hNjdOcOPeyme6Y2nO/XGQbsu0V+Ut9KaF/mna/MhB7Ivt4POjB38IW7JJKFOnO1Kr4MlAnwniFLXCvYKSQGO9d70+/l8rJmDWcghI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763540417; c=relaxed/simple;
	bh=hpAsMtKCqYHCtE3mFyjxxN0N0YhIk8Iw6nCB5f3Cf2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9XQqB2P9IqsJQ6yTYI1FX0sjSKLHra1J0msXFVTrb+FkZtDQo7oeenFRCroxncwZmjSJAGbjoDR2ZJIMbtOoxSFsHBe2KmewK7rFhgrkX31NqBT/ZlU7XGLTk62cu7vJqm+vRsKH7KG2xLcXS2TOTMf7IB+y0oYlRTrWoz8/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKrqNait; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477770019e4so67104585e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763540413; x=1764145213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eW4U9FNNMk4KUMsEWXF3O9blHe3X64axleniGKFaOWA=;
        b=rKrqNaitkFGRDllfBDjJATk0ugqjA+7fgFtxbucmoC4jWKwxTTbBzd+orsK9P/3PQn
         vcPG9iNlmkxvxqnNYefmmqTXgygCbHL8wOnrRKdCAQiawIidNF4bdiQqC8CY69Lmg40C
         LpRbfxgceYr1AHqErVrZhtBWm3pWfivLpcuFlZmcv/OmQsDAVNQ4MFaXOZtmCkPCpfQP
         sn4BGTsLlMYOTYHisNnW4LgA11y+ZhmS2m0Mr2E9Tb7iR0lN1iAmEXUv1ZqtlyfOrhgZ
         PSVidTL3/Kd5p6dH3N0VCIqA4zjyKh5llqWnG6hJh4qfcY4nIUWkh3+nWdLTAa4ywgSp
         dhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763540413; x=1764145213;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eW4U9FNNMk4KUMsEWXF3O9blHe3X64axleniGKFaOWA=;
        b=lCCdrrrW1PZ08062OTjX0L2XpcE7Uvce9DmfXJMDtoUKOXdSBFZZnnDugCl3/3LtwT
         O14Jg3eDPMiqPdtveCLnvVIHud9vYduwUSGTM0vgrsNnUObLXDeNUjVBkasw6bLwwNOt
         6D0K31Udq6MagsXb9kKx22yYejdPCTNPmYd5zQBwTQ6brow7diQQrlsIRXavohZVbBSN
         Tx/oqVXRyxGuzA1SVUxxOhWyvAIME4lDbjGv584P76JajwhEaFyv5q0Dah+/LCiPmcWK
         1DHjbrapGSKPeoSZTNaPjyMYrY85toXUVqgdMaivhv5EVeBLInSqwqW6exdgdo6EOXls
         vseg==
X-Gm-Message-State: AOJu0YwkR41zfcwZiRV/jUXJPeIoDDWTwBAi+tejNSDHq0ssSRqmWglr
	Elks55KU+aHMGCnl+buI4fxTodm6jw7dbnyd73w6gXDCKwptpo+iAT695B92oQYsmA0=
X-Gm-Gg: ASbGncsyUtRmE4NL3waJ9WMTGHudPxlgVkCueN3aFWjtUWJB4DANZJg3QIimCt6P4x/
	aI/yZkL4MEQTJoLbSt21QbcL6zORg6l8zeaRssAH7KaEAuEuwkwjl89mrRZN0GpEVdhJr10pppT
	oCQpHqiBzWhjuyc0cbaEXxpVpy0CVynEh0HF7rckIcYBUCwj+DiHS1Jly8zTN/2OxcZLKFM5mHF
	3cvz/Y87/8dqmLAnrYe76g/pZxc8kL2fzo1tF4i+p99sP8nwrx2XZX8BNPn9ZYA04Fqo4Sg2XO/
	Ei1HhgdJYMyKnGGh2GGF0DpPw5mddfcBmeUmwGfVTSumrrvBUUoYhcTlQL0CCfsNfJQiBWb0GO4
	k7Mu5OKtWQTRcW2yDrartY8hbO3Xgc1Aff2+f8Td7f94LWCsvAUk7+IhXmlubg/89sGzC651uVr
	JC9xREhse12RamWi+4ClINdXr55E9wyyhH52e8lXwNIa53GEInm9DRt+uG5gMqgTQ=
X-Google-Smtp-Source: AGHT+IFxeMJPmWv1BitRWFJUjyl4b4CIXpigpNQd2QnF6Q4w4/hyzdRchu1vFapRTRhkFN0yGbhtdw==
X-Received: by 2002:a05:600c:5487:b0:477:9e8f:dae8 with SMTP id 5b1f17b1804b1-4779e8fdb3dmr130139555e9.0.1763540412636;
        Wed, 19 Nov 2025 00:20:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1025707sm33690095e9.6.2025.11.19.00.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:20:08 -0800 (PST)
Message-ID: <d9c94cfb-1752-4d97-8c2b-627553e912bc@linaro.org>
Date: Wed, 19 Nov 2025 09:20:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/5] Add PCIe support for Kaanapali
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
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
In-Reply-To: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/25 04:08, Qiang Yu wrote:
> Describe PCIe PHY. Also add required system resources like
> regulators, clocks, interrupts and registers configuration for PCIe.
> 
> Changes in v3:
> - Rebase on 20251017045919.34599-2-krzysztof.kozlowski@linaro.org
> - Add reviewed-by tag
> - Remove [PATCH v2 1/6] since it was applied
> - Link to v2: https://lore.kernel.org/all/20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com/
> 
> Changes in v2:
> - Rewrite commit msg for PATCH[3/6]
> - Keep keep pcs-pcie reigster definitions sorted.
> - Add Reviewed-by tag.
> - Keep qmp_pcie_of_match_table sorted.
> - Link to v1: https://lore.kernel.org/all/20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com/
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
> Qiang Yu (5):
>        dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Kaanapali compatible
>        phy: qcom-qmp: qserdes-txrx: Add complete QMP PCIe PHY v8 register offsets
>        phy: qcom-qmp: pcs-pcie: Add v8 register offsets
>        phy: qcom-qmp: qserdes-com: Add some more v8 register offsets
>        phy: qcom: qmp-pcie: add QMP PCIe PHY tables for Kaanapali
> 
>   .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   3 +
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 194 +++++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h    |  34 ++++
>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  11 ++
>   .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   |  71 ++++++++
>   5 files changed, 313 insertions(+)
> ---
> base-commit: 0688945f3e5f85f64c7fc9157223f92e0fc5cfad
> change-id: 20251103-kaanapali-pcie-phy-67a850bfe384
> 
> Best regards,

For the serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

