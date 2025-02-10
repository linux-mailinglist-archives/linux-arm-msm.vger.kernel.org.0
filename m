Return-Path: <linux-arm-msm+bounces-47381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF23A2E7A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617333A37E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C49D1C174E;
	Mon, 10 Feb 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZ8rtC4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82DA1BC077
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179644; cv=none; b=sc7PKjl3d0lIiCeH4uqwAkFC0gSP2loim6SKC0kuwlLX1tzECl6Jiovz0wdzBD0qId8F7uw3kr8YP0lardu+vet9XFSQ6sWN0E9OFTRbmr8fQ7MtViCadg+qcu5w5ZhDhqEqkfr2ncNKjZ4is+U8QzTg69fNtoS9xHrF9hd5fRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179644; c=relaxed/simple;
	bh=3MeWMlxsI0USpPCXnmmfBynj4CtpNkuyJ1X5PGVcWjo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VQdL6TV3JwU5+HH2hTPPU/sLWWRUBdMOvPIoOU9kH9lZplxPelZLLIYxLULZj4uv/gLPiaLZKoV7ihwygZle+KLXfRElfaFcSgRHxmsOJd5UewquLl6aSMECSUUPQeRxLauqBjxj7N0BqIfQDOgrm7gnwiItqoweqtxZOX2Axic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jZ8rtC4S; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436249df846so27260985e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 01:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179641; x=1739784441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Q2+Q0+PNrsCfkXgLk2DXYgaQAPJ2h1usonU//uuPZk=;
        b=jZ8rtC4SIX7nR4yQm0NbDbXYjZmVyUjGPYehDygCPsA1IonxYMz2QO8kDtZ55jcaMf
         ahVTFqDz38DrhfK/SYlH8wRYVpEGmne+HOmPYbpBqpBTXVG+V7r3ZuG2BFqHapJfu6P/
         yrMELFKQyAO07PRn3nTU23//v5wEiFyl+YqT95SXZPdUC0gb/9k7f1vQYNt5iygFEQwW
         P7RiuSOO6Qh3GA1c3nHY01FK/ZBiJ/65+EqXIvmJ6ACDdQzwsCOScaTBc7WTcWdol4NJ
         k2TvAVc3vxZkOGbtUgom8HUdAoBqcH/PRclvFEN/lXlCr1h2n/83yYMc3XRIgpFAfKRa
         3giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179641; x=1739784441;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Q2+Q0+PNrsCfkXgLk2DXYgaQAPJ2h1usonU//uuPZk=;
        b=aLEdf/bIVwDx48QGyQfSrFYIDnLxH6At+dVa7fizmJ5uS2DPcGP38+OEsecdtKHxtc
         0hKPq3p+Q+Xwx5wua/kd3fn/VyiEasOfgAd6o0SgsI8e8rUzlmltH9K5KPmBW5tYwOT5
         BLUFcW99TCoxEyqIj8FZow2T6CrQb6xvEdWb6HiR6BBoazgfGNbp5FnD0LYRtwBrJhSE
         KLLSRX+wn0uT10jc55HjhpNSgxUZXyknWdThg3JV+vdy6sVNLKRcUkMDIKn0faSZ1TF1
         VmSIdFpBUWUqY/bVxXX7Or/DtXH25kHzY1sW5PX/uKBCLFYCSHdSvZHDyQpg1FnJhGAp
         pHzw==
X-Gm-Message-State: AOJu0Yybs+m3914mRqQNC9wgHbj4ePaY0mvLjQWsRV+w4gef5nyrXeaY
	XSb2epv5rC2AvYJZD1VrQX6eP4ZE+ULb27J7Jm/wTn+L9CtLq1xjU1/qWXAKOt4=
X-Gm-Gg: ASbGncu76JovKGwkOp4Wkclf8OBm4cymdQVXO9WnxjaHwpYX6ThTEi8v3dQDaK34RxL
	ejB6rfHgIBmG7/mOj/hquop/33Iy4RtkDZIslBxGOkqJes1S8Cd2TitVJC4P08UJ7S/c3krjXqq
	HcL37KitUqsAtjisCLqPjV748RQT0dM809qCMAa3brkCUFqel8YXDZzZ9eg0m5CMMbyfb2ToRAX
	d8W6BvhBl1BZeSXaVYyUIKCUjfPREnvQDHuBIQ04Jm8ag3HTYiz8zOGfW7105UVzzxV8XMwpxw5
	6ueBwdPTMr/8bHC5TDoxUEWPUmIqjY/I3A2/ycyDvcBmzZeTCDTpppzPwtNkXTXtdODl
X-Google-Smtp-Source: AGHT+IG9gcIE0E7FoMh9ojaKHy1cLvCjSIQqq5pv5YmXQQgVQ1By6LPvbUC/eubd3iVX/ofP6aEpzA==
X-Received: by 2002:a5d:5f83:0:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38dc891fbdcmr7609963f8f.0.1739179640815;
        Mon, 10 Feb 2025 01:27:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm177079745e9.10.2025.02.10.01.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 01:27:20 -0800 (PST)
Message-ID: <5b782e14-5262-49f9-938b-b8c9b8935f6a@linaro.org>
Date: Mon, 10 Feb 2025 10:27:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: switch to interrupt-cells 4
 to add PPI partitions
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
 <efcc2cee-1d8b-45d1-aa9a-4e7afc19d857@oss.qualcomm.com>
 <57c82928-5275-4f6c-b6d0-935dd5080f9b@linaro.org>
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
In-Reply-To: <57c82928-5275-4f6c-b6d0-935dd5080f9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2025 15:45, Neil Armstrong wrote:
> On 07/02/2025 21:23, Konrad Dybcio wrote:
>> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>>> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
>>> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
>>> partition map phandle as the 4th cell value for GIC_PPI interrupts.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>> If I'm reading the core right, we can leave the fourth cell
>> uninitialized where it makes no sense
> 
> It's not what dtbs_check thinks !

And if you don't specify the 4th cell, dtc is not happy at all:

arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/timer@17420000/frame@1742d000:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/rsc@17a00000:#interrupt-cells: size is (36), expected multiple of 16
arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/mmc@8804000:#interrupt-cells: size is (24), expected multiple of 16
...
for a good reason, if you specify 4 cells and you specify multiple interrupts the
DT code will split the interrupts entry by interrupts-cells + 1.

Remember we pass the DT in the DTB format without all the verbosity of DTS,
the properly is only a bunch of u32 blobs we can extract with the help
of the -cells properties of the providers.

Neil

> 
>>
>> Konrad
> 


