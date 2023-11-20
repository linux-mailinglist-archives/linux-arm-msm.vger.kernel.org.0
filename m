Return-Path: <linux-arm-msm+bounces-1102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262427F0D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 09:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAE92281963
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 08:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A6DDDB1;
	Mon, 20 Nov 2023 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jrgTFYWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5262C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:11:39 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-408425c7c10so13798495e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700467898; x=1701072698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcUuuNi+u/xKZe4/lMw1EaVmTDsSwUBnZFGw/iTPhBg=;
        b=jrgTFYWHZ3g5BZ98zz9W8lEUY41u9N5QUwsx2MfOQLzVJVTrWFnnfPSn808O2Vmjvb
         kyjAoUuPWk9PiRMGtlz3GFXek51ZQ9SttIdg7fnqhrQaHGKsea9H3zuWt5ipp2U90CBl
         Xwwd1E14bhuh3kEMg7iykHBEOdSG4O0rSiMqHeM4vGxfiVOw45dr9PCV+z/Ngbx9M0Fd
         WTXXIC3Wk2IxJwd3XYtrOXMQyLz+lI9wPMSTHvyZvMTTxVCGoPOaeLGDTAXq09Xp2Pn2
         eUVyvyLW2nbcFQaDbKYaVOHhs0tqsO637jaVDS5qSOlsUXkCkQyzHbfnyDjSX2HscFVx
         LKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700467898; x=1701072698;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fcUuuNi+u/xKZe4/lMw1EaVmTDsSwUBnZFGw/iTPhBg=;
        b=rJJPMM+IoEmrLjoKZzwtb6ybFd39Zxi0xgx4nzffNPn0t/1jEdVqoKyKsXB8sdhRdO
         hRvFI04/AtwRr20RiPEcsQQtV0c4z8cOuBGz0h7fFX34VOf19YVDIFqPlJir5mSveXEv
         snbZgH3nzhbCWT2PKPtm5BJ0wxkvuvR00Udscf3HXvBvTAZsOkzYAMG5WzH097faER/T
         Ltcv2fE0yO6KQ4iHx5DbYVZOkYQG+88lDjZeEcmludK1irf23bBfUmAUENz7JE88KyuA
         CuRywBc/3sZy3WBiZBojCMRh4X6aP3ypSmwAAcjyQDdShKz0QfDgvOa5AGmcPs24OutP
         21mA==
X-Gm-Message-State: AOJu0YzBpZ91lteGkvOpAax8RuClbjRRGPy5B7I8ToDFv4rgCynPm/dP
	ZRqqhCol0SZztQf0oLE1Tykirg==
X-Google-Smtp-Source: AGHT+IFw7EeRhj7JxE3HkKK1fMaQo4ZJRm9ZMXgx89CxzuXxbSCE0/pSwxmZk/2IWdTiXV1kPh584Q==
X-Received: by 2002:a05:600c:1f94:b0:401:b6f6:d8fd with SMTP id je20-20020a05600c1f9400b00401b6f6d8fdmr4575322wmb.6.1700467898303;
        Mon, 20 Nov 2023 00:11:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06? ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b0040841e79715sm12714341wmq.27.2023.11.20.00.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 00:11:37 -0800 (PST)
Message-ID: <5f18ab4a-e4b0-48ef-946e-524e8dadf7ce@linaro.org>
Date: Mon, 20 Nov 2023 09:11:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm8650-mtp: add interconnect
 dependent device nodes
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231106-topic-sm8650-upstream-dt-v2-0-44d6f9710fa7@linaro.org>
 <20231106-topic-sm8650-upstream-dt-v2-7-44d6f9710fa7@linaro.org>
 <3f3f7c21-0d03-4b59-b12c-a72e1d2b82af@linaro.org>
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
In-Reply-To: <3f3f7c21-0d03-4b59-b12c-a72e1d2b82af@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2023 01:25, Konrad Dybcio wrote:
> On 6.11.2023 09:39, Neil Armstrong wrote:
>> Now interconnect dependent devices are added in sm8650 DTSI,
>> now enable more devices for the Qualcomm SM8650 MTP board:
>> - PCIe
>> - Display
>> - DSPs
>> - SDCard
>> - UFS
>> - USB role switch with PMIC Glink
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> Little nits:
> 
> [...]
> 
>>   &tlmm {
>>   	gpio-reserved-ranges = <32 8>;
>> +
>> +	sde_dsi_active: sde-dsi-active-state {
> Dmitry voiced concerns about having the "SDE_" part here lately
> is it part of the actual pin name (in the schematic)?

Indeed, names and DISP0_RESET_N and MDP_VSYNC, will rename.

> 
> [...]
> 
>>   
>>   &usb_1_dwc3 {
>> -	dr_mode = "peripheral";
>> +	dr_mode = "otg";
> Isn't that the default?

Without PMIC GLINK/UCSI, there's no mode switch source, so otg is not possible,
and bootloader leaves the PMIC power state in peripheral mode.

On the other side with the next patch, we add pmic-glink and we add
"usb-role-switch" making it switchable.

Neil

> 
> Konrad


