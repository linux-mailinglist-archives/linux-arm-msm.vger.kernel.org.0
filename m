Return-Path: <linux-arm-msm+bounces-7980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369383939D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8728A1F2A7BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C945C633F4;
	Tue, 23 Jan 2024 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yb9dHETm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97175633E7
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024547; cv=none; b=s+XIfglXp3K1Kt7hqMh2vlKyDBNuwmqBgARpigtxlkaIEn/68Mz/tVYVznzXc+u8vSLYm3ZsLVvwK1l0b5bGfU5+tSobTPOtf3yqYHItbkgil2kihL4N2NvQnKP4ARqzkPIiOObkhIbLjRFgFziV3Ee98wykDmNMuecc1oCvYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024547; c=relaxed/simple;
	bh=/wrxtW3QodKKxvwvgnRjOnPVrsHFkWXzmgR8E3G3y8c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BV5kpkMsLtd0yjQuyplbtGstjYl+DzVQO1+F1+M1OjrFWY21QsP4bGTI36uP0Aqg6Ho4YqyTiYt1VC24HC2HHLSmp1J1KLkdUWVZsBH1lsKAIWfdLHI65rkMoq+ykWdf+OyaT5umjuDTEKBvPul3+RSWibN7atF3gcJYuKWtC7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yb9dHETm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e775695c6so43933275e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 07:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024543; x=1706629343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfxXC7/OrpEdNkCL49bBgzY3iynVE9OgBoCv6eD4iws=;
        b=yb9dHETm0JG6gNxcbTi+xQmdk8WmFPKDPk3hVcDtN1REd/no8suD5+Iaj0IvDuu8mv
         XkKEFtemjjMKsCPfA6phevYCfbsRyZciM0b/89PxrQQiKSxijfxzvBNqpA98iks2vpe9
         YXQIgybdEIHFPiWlrvlZZK/B3ejgTw2mUTy+grhXOXPdJ/UkDyj7WYu9pGcSMBvJjEhF
         bH01grgpvkD38H21DNs3HWSDl1nxx0Voi3GwOycdGlYFB6YAMuJOFjt7a+CD8LufrsYq
         3pKQTRN2WrDRmFKGOs7OhXYP1e7ybSOZYGTAsE6UipfQv3GXyrg3Ll+Tqtt1Uf7UCEUJ
         2Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024543; x=1706629343;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sfxXC7/OrpEdNkCL49bBgzY3iynVE9OgBoCv6eD4iws=;
        b=JboffMk5uJWePglfHL8DpRyLbOTWd8DSFuP6qTT37DrWa/wW/pW9InZadRd2isbPfL
         GtdayqXbHU4kbJp3cbONrt8k3b+U+eZN6SlaSRgLT/f1bMRF4crNP6QDttXwi1d6AvJO
         IqsWTpYuKbLzXNZBp7IcTdTgofoJPLD4aCU0e73QhCtNjLxiKhN3d/ThMFq7YtdenB9O
         5GKL85wTNDMMVF/sTsXrjdWIOShaEwgawYo+SpVe6Ost0iCe+pJqNpB91HW5Sasbp0JR
         IaLwTjdoccwbnRqTdqrFXpo97ekSNXqf1HzPMD/fD0wFYklZ6Fo8IPVG9Is7e9QehtxT
         wwtw==
X-Gm-Message-State: AOJu0Yx9TVoHCectKRd4ewd9h5G4VpcfPFakuKhjr0x5S+649z8Xue2V
	1XywlDa3qLZM62rOGddYKNns8JcPff4nHZNKfTVnv2j7juI5F0Bl92zcuThlfz0=
X-Google-Smtp-Source: AGHT+IHo5PJmBIy8Uq1SnbtDHanADpsq4wmh3f9/s/VbtrSQYp9Ao7jFPFRT3frzeSQT18BzczAGlA==
X-Received: by 2002:a05:600c:1c92:b0:40e:a0a3:f358 with SMTP id k18-20020a05600c1c9200b0040ea0a3f358mr841094wms.22.1706024542784;
        Tue, 23 Jan 2024 07:42:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1892:c253:b69f:39e8? ([2a01:e0a:982:cbb0:1892:c253:b69f:39e8])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0040e54f15d3dsm46633073wms.31.2024.01.23.07.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 07:42:22 -0800 (PST)
Message-ID: <180aee42-dc52-49b4-b8bb-11f1af0ddf34@linaro.org>
Date: Tue, 23 Jan 2024 16:42:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8550: add support for the
 SM8550-HDK board
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240123-topic-sm8550-upstream-hdk8550-v2-0-99fba09fbfda@linaro.org>
 <20240123-topic-sm8550-upstream-hdk8550-v2-2-99fba09fbfda@linaro.org>
 <CAA8EJppi4dkB4N-YStVazfwH2quaFM6iQTv7UoOseEYQ7EEx3g@mail.gmail.com>
 <ae81dbe6-46e8-4d30-885e-f2ba49a7f89f@linaro.org>
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
In-Reply-To: <ae81dbe6-46e8-4d30-885e-f2ba49a7f89f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/01/2024 14:02, Neil Armstrong wrote:
> On 23/01/2024 10:10, Dmitry Baryshkov wrote:
>> On Tue, 23 Jan 2024 at 10:56, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>
>>> The SM8550-HDK is an embedded development platforms for the
>>> Snapdragon 8 Gen 2 SoC aka SM8550, with the following features:
>>> - Qualcomm SM8550 SoC
>>> - 16GiB On-board LPDDR5
>>> - On-board WiFi 7 + Bluetooth 5.3/BLE
>>> - On-board UFS4.0
>>> - M.2 Key B+M Gen3x2 PCIe Slot
>>> - HDMI Output
>>> - USB-C Connector with DP Almode & Audio Accessory mode
>>> - Micro-SDCard Slot
>>> - Audio Jack with Playback and Microphone
>>> - 2 On-board Analog microphones
>>> - 2 On-board Speakers
>>> - 96Boards Compatible Low-Speed and High-Speed connectors [1]
>>>    - For Camera, Sensors and external Display cards
>>>    - Compatible with the Linaro Debug board [2]
>>> - SIM Slot for Modem
>>> - Debug connectors
>>> - 6x On-Board LEDs
>>>
>>> Product Page: [3]
>>>
>>> [1] https://www.96boards.org/specifications/
>>> [2] https://git.codelinaro.org/linaro/qcomlt/debugboard
>>> [3] https://www.lantronix.com/products/snapdragon-8-gen-2-mobile-hardware-development-kit/
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile       |    1 +
>>>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 1290 +++++++++++++++++++++++++++++++
>>>   2 files changed, 1291 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 39889d5f8e12..42e50f2b2ec3 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -233,6 +233,7 @@ dtb-$(CONFIG_ARCH_QCOM)     += sm8450-hdk.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)        += sm8450-qrd.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)        += sm8450-sony-xperia-nagara-pdx223.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)        += sm8450-sony-xperia-nagara-pdx224.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)        += sm8550-hdk.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)        += sm8550-mtp.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)        += sm8550-qrd.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)        += sm8650-mtp.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>>> new file mode 100644
>>> index 000000000000..66bdd6c269ea
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>>> @@ -0,0 +1,1290 @@

<snip>

> 
>>
>>> +
>>> +&qupv3_id_0 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&qupv3_id_1 {
>>> +       status = "okay";
>>> +};
>>
>> BTW, don't we need to enable gpi_dma nodes for qup / i2c to work?
> 
> Good question, for i2c_mater_hib no, but for i2c0 it should be enabled

OK I understood, i2c0 is configured to use FIFO so not having gpi dma enabled doesn't fail. I'll still enable it.

Neil


<snip>


