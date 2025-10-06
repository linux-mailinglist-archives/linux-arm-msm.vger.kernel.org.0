Return-Path: <linux-arm-msm+bounces-76026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF03BBD7F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 11:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EFDA2349B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 09:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC95B20298D;
	Mon,  6 Oct 2025 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eun9mhZr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0269E1F2BB5
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759744109; cv=none; b=JprmlcfrnXBtMWhGxtZ3M4lPKsrwVsl3jDo8IXQVAN1pToibB4v8a2BuzDg9JVS7X3V5LaFxgMWuBdEln8krjQ/00RW6ggh+xRU5PXL0DKfTMBhc9TylEGKNhxU5ObUMM/LpPtfrCNJt5FC/zpRDDnPpZT7Yn2fwG3Ku9NhNyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759744109; c=relaxed/simple;
	bh=K7+0htyuoirxpSFu/xMi/nH7Dp6XDVMsELNSRKgsD6E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iZqZD7CgNw17uxSRBY41/ITdi6tfMDc3KOqzhkJEqFSHKlWpuXXZP8g8OtIs/Fqo9mAxMuMFmgRJQc0qlDU7PAcJcs96xZ3Amf/ZFFrEG47F04TlcqakC4Lvhmy+Wj2R1N6cqrFuOExXrkhNWXkSBD97VKKN7HxGUsZiLwh43b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eun9mhZr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso37723435e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759744106; x=1760348906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9nCOIOWicslN4YZSsSssDCNnRYoc3KUcXalh/A1uR4=;
        b=eun9mhZrr9gdbQYQPeCodrWHFfrZpnvyRi80m1Yzw+2Kkp8m+G4Ynr8ARJhxym8JV9
         ryp8auXJj5a0NK+c/Ve0BBKX9e4lV66Q8Ulz9iGvC1Kigg1+jwxviAzC+jZPSRO6RtU8
         yIe4ifpACdJuHunLL1UghAYQICp/NINj7rP0IuMTY+BhTIHQP8otFej9hi6WNRjdf4J+
         oyqcaJzMDw9kWZpAexwJXMqxjoXfDHSaPAhn9rbGYtdN1OniXt1p24YV6lA9bfx2rqCP
         gPOR3BZOOrzOuc2NdXpZoN92IOHHAE4qXc7IIJ3jI9rkyQ4ezbSGpwLThUrJYdLWPozi
         7tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759744106; x=1760348906;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E9nCOIOWicslN4YZSsSssDCNnRYoc3KUcXalh/A1uR4=;
        b=mQCEyzYHltYfPMncSHZMKqSGUsr6135J/WBlXl1L9TqDC3wKWm413j3e07aClG2Gdi
         u4gTSPyL2MwDBBJfAyW0RuCzZde9dbSVcGBIZ0l+WAGLGsXZ+sxQPwKIO6UvKzI+y5JF
         jDkdBTjOSyGEXIlvDrS3dIW2JCbQH+MFjWdIJRe+mNC72I8hk90tmcTKDfG/0UF0NrkZ
         T0ZVx6qjBr1VmzgjFQAIvFhRv5NQr7f0BmLEI27A7LbxBrlxdmZtgHgVmtgkBz/I5Moi
         YdSr64/BkO3exb2zmJjCT/REU2ZYRPiqkugn2ML381+wsQiRTD0wzHGUyXOXlZ4+uo12
         PgBg==
X-Forwarded-Encrypted: i=1; AJvYcCWtrvy1kiYpkw9dGO+Aj4f8isUFswx+VQO2zqEgr+XPU77NwwVHHBbHPa2ZYpLrZQiEiBWQiwgytRRm10XZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrl6BQrBXk2BUTxhK/tDdlIU4mUUzu6KVgEbL9LYenm0pVwAiF
	yQ6qh4OCprZvLvGfIU8X594q0WrsLQrLAYpzHrcs4bSYqZJ4mPD5V2QiwPnbZNfduW7RpTNL/62
	XMEsS
X-Gm-Gg: ASbGncsIz6d99SRgMaK1PiwVQ8SBow/gr+nkB+zJgI3IOKr4vRtveTazjF7f5SICnb0
	hW9smk3+jZH4Q60uulBw+Mx5EePbmyo8efBwsIeCcSbODNZi8ZEmY7RB1P1ZeOJ3IIIzKq8xA2m
	OykntwU4kxB8UGrSD5LUlZ2pczmQhQ8mv0FY3t5XSwmYbXjbZEF9rnQPcI408KC+K7VGZGy3Zqo
	oqD4haq2JdxUdxP4RU9Z+TlpY2xhZgD9vJSVrJoN7QWC0mDmfSzhoNCT05rVa3Ja5nJBwapQ9ag
	TSdYq33mptwGBg6Vk+ujSam3cCK3bgUt5LL0sDXNvkGMhVNlA5YvS4t+h07TK1WLYqCewGBDbCE
	jNWyA24HyDOt2NHbrDjIeX+KYUKxUEs4AVWabiW7YLx/u3/lFt0jjsckvhR0pl+3/UyeDKDmV2G
	jLnGtbV7verHay17PHSHsu2NO3g2I=
X-Google-Smtp-Source: AGHT+IEtNxlbVFFWezzK/SaGtuPwKo272TEGVXiS0sDNJ1j0UC/5uBY5FceXCv8FXS6IrSRPjNnCpA==
X-Received: by 2002:a05:600c:3b1f:b0:46e:3dc3:b645 with SMTP id 5b1f17b1804b1-46e710ffc1amr73835685e9.3.1759744106291;
        Mon, 06 Oct 2025 02:48:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2dd0:9118:d7f5:51d9? ([2a01:e0a:3d9:2080:2dd0:9118:d7f5:51d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e96e0sm20168586f8f.33.2025.10.06.02.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:48:25 -0700 (PDT)
Message-ID: <64ae6d27-d89b-401c-bf9e-027967e6b859@linaro.org>
Date: Mon, 6 Oct 2025 11:48:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-1-86a14e8a34ac@linaro.org>
 <c8dca827-b089-48e0-9dc2-a5b6e3c5b88d@oss.qualcomm.com>
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
In-Reply-To: <c8dca827-b089-48e0-9dc2-a5b6e3c5b88d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/25 11:43, Konrad Dybcio wrote:
> On 9/30/25 9:39 AM, Neil Armstrong wrote:
>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>
>> The routing of the lanes can be:
>> - 2 DP + 2 USB3
>> - 4 DP
>> - 2 USB3
>>
>> The layout of the lanes was designed to be mapped and swapped
>> related to the USB-C Power Delivery negociation, so it supports
>> a finite set of mappings inherited by the USB-C Altmode layouts.
>>
>> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
>> connector, DP->HDMI bridge, USB3 A Connector, etc... without
>> an USB-C connector and no PD events.
>>
>> Document the data-lanes on numbered port@0 out endpoints,
>> allowing us to document the lanes mapping to DisplayPort
>> and/or USB3 connectors/peripherals.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> [...]
> 
>> +          endpoint@1:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            description: USB Output lanes of the PHY when used with static mapping.
>> +			 The entry index is the USB3 lane in the order TX then RX, and the
>> +			 number is the PHY signal in the order RX0, TX0, TX1, RX1.> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
> 
> Can this be described in a somewhat reasonable way to be non-compatible
> with Type-C properties for more validation?

I tried, but failed. Let me try again !

> 
> If not, let's just maybe add a comment like
> 
> # Static lane mappings are mutually exclusive with typec-mux/orientation-mux

Ack

Thanks,
Neil

> 
> Konrad


