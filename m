Return-Path: <linux-arm-msm+bounces-47322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFAA2DE9D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0712D1643BF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E32B1537C6;
	Sun,  9 Feb 2025 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ay5dXKxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8128377
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739112322; cv=none; b=HRq31ny80ADuHTLHci8sy+EzS3HU8+ZgFJtdKWE5/e/STU5uL05cq6NxbfPke+oYQvbYtTf54R9yBCZE6kRjMo10NCba1zzBxN1yoJ+lr8fxfCdGI+TSqut4yeABJcZBHOoxLxvCZ/Jno276bIJzC3ZXS7JrG4AfxcTw9s/Xwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739112322; c=relaxed/simple;
	bh=TlMBsmWKp3CA7Dc+pUVw95TeXzxNX4SBFC5UdngQvsk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CjkWcAcO+1/20NA0gF7TCjfNJtXDGIe55boQQ2cCOYdAbFRvrj7OhaySAHwrv+hKdvS5ma0R1WbMJQGB3XV58M5tjuQBZ9GXqaaEmjhdHLO0Oq4xDdwXFERnboqomyihsYknw51BkS73MetO0/fwm/xjmzkrbsb14Pt72vRSKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ay5dXKxW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso10386655e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 06:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739112319; x=1739717119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMo+ekaUYRL/t6kJlaYa2hsVpBTTet/QHkQUAI2CvGI=;
        b=Ay5dXKxWV26AI6q7WodGBFNyEHbAG5Bsqt/2lOpJxOw0KLSNpgtSZe+BrFcYtfTCBZ
         5V0gExwFrDXVp9T10VVvMFEBtbhIkibiDAlc85LHoiqkHDCzf798tB9uUF3+9y2SVoun
         FDQ7ONvKLbw0WvBqqyjoWLP8t9ZuY/zk9mj0QzxyWy/p6T2Sp46a4tsSdmgfX4rRAgnf
         VcominbUROdaJoXCUVu8WB71/AZVlfW8Ghhkf0vdB5OcEknzp7k+fYyjACIqJ8KFN7RB
         UHuEPkJhd97m7+m56Ejk5g5UKJeFdQE/o+dyS4GGCxubcbx8sOKHrE0bMxnW3ACCsiXI
         6pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739112319; x=1739717119;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PMo+ekaUYRL/t6kJlaYa2hsVpBTTet/QHkQUAI2CvGI=;
        b=ZhKtB0m/gMMA16IrwEBbIOE7pnsAlhoQbkCUKLF8Gi5MsuSUm4nnw6YB0OmI4uLO6K
         PjriFZ7XywoLMkiAAEQELRi09ONeC/lr+rfYLVd6DdPrGMMgNYPEEiuVSAqkw+zxp+Zo
         Y+pGaqyaYff07SUjAank95hb9U5wEHLkFJNFQ4Dv6ysixom+VdPk8D+MnlAaqzEXLTXE
         wqxkgW3IzwjWF/YQWkf3FmANevzSSvETwXxxj3Ddimq5qBvsJhedIt6m9c1Brz/iR0Fk
         bYl5VQwD6mErVrHbHlw5z5tWfpjRwKqP2cL6SBcNnlIFYtgKXcBHLxedsNiuMccpMXvi
         uhww==
X-Gm-Message-State: AOJu0YweY4NJ0xsRImJj9f2i3MqpTCXPui9kUFuKF6iWs5Raj4mH3vxc
	zNokXDpeScPvzY3jkc59RBB5Kk2c+P4DNW1cqjec8tY9ESfjVYDgvsBepeiV3dE=
X-Gm-Gg: ASbGncvTmQL8B7Z6C+X9EK263YfjaS+Xo6W9tauwHZ5CsIRMqKNoU50Vfr7cOjqJptm
	8lIyGQEUhd9lXvczwtqb8t5/a1uQG1/0TVmtf45Jls7MPzOTiBV6yKp3obSG5Gz1Gx2sRbLKbah
	WC4+zFikog0LetoQ+H9u07CAG5C5NfPHRFCgsQOKxARKOSxANg2zg5dJAs08I0pNhwW+sQx8hH3
	Z19FglGPz8BUKy5C7mJhdXTZL6nuLVK0FzjEdk/SnHFtLQV5ZP3D3JDe1Gq2gx/dDVvNguKoMoE
	fFl60uwmDkzm2tq+p6Ek7yOrv3KaNVeY4ZfxyL2OV8fFb+L0O2DpD61WrnOjublH7xj1
X-Google-Smtp-Source: AGHT+IFdun0ojlsz+5J9K8TGW6y2AxCq9J4M7GqPbPSFPwqb9BzClbMpMM3fNK7gSRtGNfU4esw4Ew==
X-Received: by 2002:a05:600c:458e:b0:430:57e8:3c7e with SMTP id 5b1f17b1804b1-439249bd34fmr82014475e9.28.1739112318925;
        Sun, 09 Feb 2025 06:45:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e2e:988e:3133:72bd? ([2a01:e0a:982:cbb0:6e2e:988e:3133:72bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca0041sm115434175e9.14.2025.02.09.06.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 06:45:18 -0800 (PST)
Message-ID: <57c82928-5275-4f6c-b6d0-935dd5080f9b@linaro.org>
Date: Sun, 9 Feb 2025 15:45:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: switch to interrupt-cells 4
 to add PPI partitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
 <efcc2cee-1d8b-45d1-aa9a-4e7afc19d857@oss.qualcomm.com>
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
In-Reply-To: <efcc2cee-1d8b-45d1-aa9a-4e7afc19d857@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2025 21:23, Konrad Dybcio wrote:
> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
>> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
>> partition map phandle as the 4th cell value for GIC_PPI interrupts.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> If I'm reading the core right, we can leave the fourth cell
> uninitialized where it makes no sense

It's not what dtbs_check thinks !

> 
> Konrad


