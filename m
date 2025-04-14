Return-Path: <linux-arm-msm+bounces-54193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71AA87B77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B875B167B35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F6625DCE3;
	Mon, 14 Apr 2025 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fg5v5Bro"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494425DAE6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621641; cv=none; b=Z+QfhJdv1BgpD6lMlDzMy2yH7Ob2BlaXTHkyQ0ipCBuaRGj6OZdRos2BxjbDGeF0v7TX5BULVDkf6FIuVO3pigQwdW8rKsEToJBmhSfvG9UYCxfnOI0lLi6/iSd9hWk4Vfjqbbpn5fLYZRggAiZR73AcbFyQRTlMjQTmSmpSHMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621641; c=relaxed/simple;
	bh=dS2J48Tel/PGxALiJ+H9EoR5oWMWjKA4HJYOU2Iofi8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MXYkc72Lq6OyTbcq+b9oHWiEgAl7Vm6Y6kVR+4yfVaSi/0tpuG5mYOMoF0oQhD1fPUJlYqOwxhrzmC1G7A32BVO1kGVF1baPFm4opN2xsm68afMAr/MAga2amGIiGuAZlbguVyxGF/CFdyVSptpIAtYGACNya7fj32iziQx+V4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fg5v5Bro; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3381933f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 02:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744621637; x=1745226437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iL/haXdSm106SCcZ5Ysvk5qBhczHsIzy7mtrRHEv0Ec=;
        b=Fg5v5BroC2MOjYx7/A6JQyhournpbG7Gx1BwYCOf6i2k6638PzicEOFZPdGxxOHO5O
         n8aJvDcy6oxJpJ+dZo26mLLtFIHbQgmeQJvQjumwrNt0UAR3b7Qq+W5jN/0GtU1+CHo8
         XN3MNJZ8GlL3BhonaVEDwRfp/nTlJKq9Y13dWWxyLQET1z2/Ph5gr4OeDSXpBoEOKIc6
         630hPZgmZmfsgFzr0xMqCdOu4RDCAhGymtaVdZoYkeAk4/lp53M+54cEJQxiS8nHjdlB
         KzLXeZ8SL3YWwnbNztzr8ZYUqJ/w6MG1URSEf6IZC+4gXF0J+sV1J1XXG+V0tMEnrnPd
         zXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744621637; x=1745226437;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iL/haXdSm106SCcZ5Ysvk5qBhczHsIzy7mtrRHEv0Ec=;
        b=LnfTEpht/IrY3GwLIkdyQsLb9yYmk8mt+Wnx1Xdr+hlwn38d2RZfj9f3aAmF/nE2Wo
         inDGvjbdAXLDJY96OPfeYnqSOpZYRU55Huzuxm6Pd8/Ly2KhQ4fru/fvAbuI6Igu1xKf
         sh6SlPUye6bYF1wrlzwHfH4iJdHS6hzCgraFAlACe45fxw6ad9cl6aeMk2ZY5vMPMDCb
         PngusGqZajJYEx4FOmCfflzUOZoWZlp+pi0W3w/LgLKQUJt3J6fbe9LxpBS/IpLle5HA
         fL0tmxMpvTpCAOUYrQASiODCYoEIxt3My9VjIX23qtBD38J/OD5aFX7iy6mAfhZJHx+P
         stmw==
X-Forwarded-Encrypted: i=1; AJvYcCVEovySRApwHufnRBpdE0x4Bm8HXkLnk+Fd2A3Va6Z7w1Ktxe5zFOzKkcCza7fBtC14vFTKDUgreVNLpstk@vger.kernel.org
X-Gm-Message-State: AOJu0YzvR1beu5V0spUgYg0yZBDm0xNbVk9PtRoJJAP1msbyWYxKyy8E
	iQMh5c84OEPsQhw6XnKkBlWar4RK2sM2+S+k3UiMdPVHFY4eM9u/JXagRoPmetI=
X-Gm-Gg: ASbGncuh33YO66BfTQt4xUJC6MovOdkwZ7ve2lDDDsULzcuMaKh9FW+ZjK9lgcC02U8
	sU0aWfFO+54R90l9NlT8jE1Hr56y2m5Sz2biiMqH4Gz08YRT+K0nrTDH1XxYZrXOp6RZcikxVja
	UQkT4QvpEUafxM9rm8Q54ajob6tCXG4zHlmVAo5I+ZxbKdE5AtYjFOpeGV+nPvqWB9vlAeg9BXr
	bbTYySgKH+HS3Ybzk99yilHqaacYQJ2/SAlm4GR6Ygy7TrHanwsnGmKB74fG0pw7qbPAJiLQD7a
	ZhIpl8vlJ99TdsBCY4Ea8tBh/ka9rsnEMa8zCy/V4WwNLj17DPaqdQYs78lrsFgKbslX2JsYHK6
	OqexgnOTy8mtvXwM4XA==
X-Google-Smtp-Source: AGHT+IGugi0LSYjtu7nYw3KeGaxFf9/4/JKVTxixNTHluzsbP0RIUM/GNmnSdPADtHwyVqrVeW9+Zg==
X-Received: by 2002:a5d:5f4e:0:b0:39c:13fd:e6cd with SMTP id ffacd0b85a97d-39d8f4de009mr11848792f8f.29.1744621637529;
        Mon, 14 Apr 2025 02:07:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c074sm10156075f8f.28.2025.04.14.02.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:07:17 -0700 (PDT)
Message-ID: <d7241218-388a-4749-a4c7-fafd9b10f352@linaro.org>
Date: Mon, 14 Apr 2025 11:07:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
 <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
 <f637965b-dff5-45d4-b6be-de8c68c6c397@linaro.org>
 <gkgd7gelin2hbkm2ltsifibxs6laluc66yx5k5uupfa2p4sswc@ypkyrj25njew>
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
In-Reply-To: <gkgd7gelin2hbkm2ltsifibxs6laluc66yx5k5uupfa2p4sswc@ypkyrj25njew>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/04/2025 09:39, Dmitry Baryshkov wrote:
> On Fri, Apr 11, 2025 at 10:14:02AM +0200, Neil Armstrong wrote:
>> On 10/04/2025 21:44, Dmitry Baryshkov wrote:
>>> On Thu, Apr 10, 2025 at 06:30:00PM +0200, Neil Armstrong wrote:
>>>> Re-organize the platform support core into a gen1 catalog C file
>>>> declaring common platform structure and include platform headers
>>>> containing platform specific entries and iris_platform_data
>>>> structure.
>>>>
>>>> The goal is to share most of the structure while having
>>>> clear and separate per-SoC catalog files.
>>>>
>>>> The organization is based on the current drm/msm dpu1 catalog
>>>> entries.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/Makefile          |  2 +-
>>>>    .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
>>>>    ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------
>>>
>>> I'd suggest _not_ to follow DPU here. I like the per-generation files,
>>> but please consider keeping platform files as separate C files too.
>>
>> This would duplicate all tables, do we really want this ?
> 
> No. Keep the tables that are shared in iris_catalog_gen1.c, keep
> platform data in iris_catalog_sm8250.c and iris_catalog_sm8550.c (and
> later iris_catalog_sm8650.c)

This won't work, we need ARRAY_SIZE() for most of the tables

Neil

> 
>>
>> I want just to add SM8650 support, not to entirely rework the
>> whole iris driver.
>>
>> Neil
>>
>>>
>>>>    3 files changed, 89 insertions(+), 76 deletions(-)
>>>>
>>>
>>
> 


