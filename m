Return-Path: <linux-arm-msm+bounces-8107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB77B83A4BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 09:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1591F2286F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06851803E;
	Wed, 24 Jan 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="huG7CqZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C7A1802B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 08:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706086692; cv=none; b=Ho02Ww5wwNuUcqFCtsU/k3xFcwuNyFrTcTdJCma+YgiRhi9gBxJBU/79XdxKO0VM8YIyvNAkgYeIbWMYhV/tvGtFs4Gk0wG6jyJpIGZoqLOpgrD4ItIKlcxYwMpdiOHLeDFjwWpGal1y3ksrvddyDJeeiAfdMunEY8X8hQAFY1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706086692; c=relaxed/simple;
	bh=toj0UISkiBOlqTne8wRnYSSozCtyXOg/TgCdgB0UOzs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L/tYbYkLBgvc1h9W/urm3k9ItGTQqeZS67mSUqT/JISw+B2sYM3jPGCq4ctCt+gbmr3bt4UUSAzQq/Hc1MqM2MP5IBIpHpIGyGWekYwQLitGse7rtPxw95Y+QgwtONyTyBjThRZnEoMCWwIRoIVqvP/ctuCnyFajAZO4Ng0CcGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=huG7CqZ5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3367a304091so5544037f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 00:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706086689; x=1706691489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztaP5iJjQnXrgl0zMMgX8A+csccy+mQSF5M8vkU9Z2U=;
        b=huG7CqZ5dBuCS5M2Erz93/hCkEccPDATD7I7OlzPlrUKG+mYJELMlFW9OKrg0MeqCa
         bcVtkF9N72H6oE5OpCeKY93E6nq93Dn2OTABwZhELEx60BITSDizWSwuVfrEn5M7zv8w
         wK/V2XFjZ8ect/AI91Me0pzEuPQ2tTd9bkSAn0hIEmMsCwvO8ZjS62BMTz5/JtIXXLOg
         WglDza2//TWMh2LH0Qb/GDf1oS63RuQOpSetSCm/mIUwa3zJwk3ihVJuGLkU87biZNL2
         xN8cU2K6dy0bnIHNrkmHhtktaRgQ8/9CveQwerauPYUHrcXfxtuwG2yiXJhd8BB03lBY
         xUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706086689; x=1706691489;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ztaP5iJjQnXrgl0zMMgX8A+csccy+mQSF5M8vkU9Z2U=;
        b=oKdU3fWRME531q4POkyzVWgn+6Hlnk+FvU/6TPTEXimr3whvZVstQ4sXsRZIUwKtdA
         tlmGaeXm4/C/4idysHt3rVhBKy5S6nDSav+HDphkFDPchTb6DnJ0xR4IPJV1gh+WR5dC
         7QRVT46X5lrHg+M4NzmHIpJKWyivf5rv1J2Oi6UjOKCKhqA0v1DjgGRsSG/SiQbUs7AG
         GZP8w1k50bBzPqgH0wACV2GfjAKgPSO7KZmNR+nRQRD5GPRscoQ59vex6iIcfTjySX41
         HvQV5BFaoTz7dfkauec0rIKcA/wYMn3/yNON1R4iFIh1KtxUXNeRyoje82i6/s8ZL+D9
         /BFw==
X-Gm-Message-State: AOJu0YzyeNKIIFdxceKfj90KB7C5M9DN+KeAkmak3WQhdZ5GCQfT7iml
	urEplcJI+nIDG0FvE04Jf83QN19W3JC4codsOniZBznekRT/RIyBzcKprJTffYM=
X-Google-Smtp-Source: AGHT+IF+1DNPW9ZmN2qeaSvbY7hn2ZCDh2EuftJzvf6GGLnETy6hh/0C5Quq9lTYEfAGJZSYTWh9hg==
X-Received: by 2002:a05:6000:922:b0:337:be12:5846 with SMTP id cx2-20020a056000092200b00337be125846mr192591wrb.163.1706086688975;
        Wed, 24 Jan 2024 00:58:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654? ([2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654])
        by smtp.gmail.com with ESMTPSA id j28-20020adfb31c000000b003393457afc2sm7885382wrd.95.2024.01.24.00.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 00:58:08 -0800 (PST)
Message-ID: <e6b8befb-82e8-4803-929c-32e86d1e825a@linaro.org>
Date: Wed, 24 Jan 2024 09:58:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] phy: qcom: qmp-pcie: Update PCIe PHY settings for
 SM8550
Content-Language: en-US, fr
To: Qiang Yu <quic_qianyu@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_mrana@quicinc.com
References: <1703742157-69840-1-git-send-email-quic_qianyu@quicinc.com>
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
Organization: Linaro Developer Services
In-Reply-To: <1703742157-69840-1-git-send-email-quic_qianyu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/12/2023 06:42, Qiang Yu wrote:
> Align PCIe0/PCIe1 PHY settings with SM8550 latest PCIe PHY Hardware
> Programming Guide.
> 
> Can Guo (1):
>    phy: qcom: qmp-pcie: Update PCIe1 PHY settings for SM8550
> 
> Qiang Yu (1):
>    phy: qcom: qmp-pcie: Update PCIe0 PHY settings for SM8550
> 
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c             | 20 ++++++++++++++------
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h      |  2 ++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h   |  2 ++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h        |  1 +
>   .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h   |  2 ++
>   5 files changed, 21 insertions(+), 6 deletions(-)
> 

- On SM8550-HDK:
# lspci
0000:00:00.0 PCI bridge: Qualcomm Device 0113
0000:01:00.0 Network controller: Qualcomm Device 1107 (rev 01)
0001:00:00.0 PCI bridge: Qualcomm Device 0113
0001:01:00.0 Non-Volatile memory controller: Phison Electronics Corporation E12 NVMe Controller (rev 01)


# lspci -nvv
0000:00:00.0 0604: 17cb:0113 (prog-if 00 [Normal decode])
		LnkCap:	Port #0, Speed 8GT/s, Width x2, ASPM L0s L1, Exit Latency L0s <4us, L1 <8us
		LnkSta:	Speed 5GT/s, Width x2
0001:00:00.0 0604: 17cb:0113 (prog-if 00 [Normal decode])
		LnkCap:	Port #0, Speed 16GT/s, Width x2, ASPM L0s L1, Exit Latency L0s <4us, L1 <8us
		LnkSta:	Speed 8GT/s, Width x2

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK

- On SM8550-QRD:
# lspci
00:00.0 PCI bridge: Qualcomm Device 0113
01:00.0 Network controller: Qualcomm Device 1107 (rev 01)

# lspci -nvv
		LnkCap:	Port #0, Speed 8GT/s, Width x2, ASPM L0s L1, Exit Latency L0s <4us, L1 <8us
		LnkSta:	Speed 5GT/s, Width x2

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD

Thanks,
Neil

