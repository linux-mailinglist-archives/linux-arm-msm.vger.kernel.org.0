Return-Path: <linux-arm-msm+bounces-20901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB158D2EF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 09:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04B1AB20EC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 07:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBCF167DAD;
	Wed, 29 May 2024 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i8F4w2fM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E9167D80
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716969360; cv=none; b=g0Ff57qoUCdbkOAdmyPSS0+zrx/1kg1E2BGTLsH1+7TKR702m5vuHBaDvwSrVOi9a2yNisd91I0Kl9wdPmzDAlgk20M5poY9HFVQDrJYvvscECf6wWvCMmwOTI18btCBMWj4khetFh/RLbZ4VbNXRGK/XquezBaykSlBFk2D1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716969360; c=relaxed/simple;
	bh=1Zgln9Iz7US5XfYMlFGp36q+IyAZn0xeKBkErmoNBl0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aMi9TYsIwwJRZNGgSR82ZAro0derQx/qXxfX0q1ws5x0yz9/nhylqLiP8oLxpspRpEC77VwZUZ/f1Q5kG9aOlY9LXrX4CWBlD7zxVh888M4KKIPKtCt4P07dTKbPUQGh3Ta3MS2qu5RLVlFKskLivR9FXtYzNAGwe1lmmCsCAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i8F4w2fM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-354de3c5c61so1444629f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716969357; x=1717574157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQtYelb2zwqgADzWbfATSB8Y/SNXDqCycD8uNCYpBZ4=;
        b=i8F4w2fMQEXHUGNH+dCH9CMdncUAGYlOXY4nGTSrqLJLZJ0h/MmouUSuoiL0NzdtCh
         FWyNKMSgfJtczZKyhoceSKa5bH4Karb3U+jXO/3xu4IdZdoTwn523snaFWz08KBhAO36
         XF717fxQLVHFWM3UVODc1fFk+9wOdb+MS5LyVZKjrGMhZ5pLzgTzVJIpO/rzD4NJOgfc
         rA5ODhiNCMigRGHezR5t1RmOxf0sQtr664AM1fsbzp3EYfAfLudgPVFPZWUsYKDxviTl
         B03d8rGWXBjSkCki0FIQwhbL7SPgU4pllLdfe74ZsKU6iNUmchQs8J2sPqsWcM/vsD7q
         +tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969357; x=1717574157;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQtYelb2zwqgADzWbfATSB8Y/SNXDqCycD8uNCYpBZ4=;
        b=Nk697Waz9W4Wl1APAJFoF+ejRX1cFYI0BV0gcYtZyCMiRJ07IyAv/sI0dSFntOpryu
         QgHy4SKWnHGHbdOTK9tfwIAXJ9tnw+m3YnX0014Z9hJSXPnWzyw66s4he7zugwaS5VES
         IFw4Q6rVNmeU6/H2XKSKrtl5wND0V6mrIC84VfCU8XfANxt3oXOm6rVE8mYnZDCDenLF
         h9kgaXiBJUVv5PLSY7FVuGqpk9kG/ifhkNd/0E4+uvdNnfakG7vawkmm0mixHa0gVdpC
         GiIYNC1r93o8Z69VoKjAv6BW+FMHueEjuIgKnUowyqBe3wUCIbI+VnmTEIYpBLJPfuWh
         8b/g==
X-Forwarded-Encrypted: i=1; AJvYcCW4u9P16LcoW9wIjYi6A/hnSlgmxnaPaJkvu3uO/cbzVkeQ+b4dz3NHlGIXr0usNE6uGMtPMCK8eQQvQp6yQpD0eMxHKx+L8IWXlrxHyw==
X-Gm-Message-State: AOJu0Yze3a17BUty7zbVII2nM1KJTYOfCQkF0Iiwer2fFcHoEuO/cBN5
	OS02tRdwA4+foxQMSX4iyptdQRExnS7aPKhqeoIzeMLIMkTMMoA1WuSNilUgjyg=
X-Google-Smtp-Source: AGHT+IHXJ5DB2P3l4g9u4tulV9h4irckLqN3BFo5luDpJhEcunehw5dHxuogjqEI+yRmLXNyYHkgdA==
X-Received: by 2002:adf:e70b:0:b0:355:39d:f82 with SMTP id ffacd0b85a97d-3552fde184emr10910982f8f.53.1716969357068;
        Wed, 29 May 2024 00:55:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8894:9a1b:5e81:c70? ([2a01:e0a:982:cbb0:8894:9a1b:5e81:c70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-357ad6c2fabsm10413366f8f.83.2024.05.29.00.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 00:55:56 -0700 (PDT)
Message-ID: <b738eece-2169-44d8-a9dc-9031c6d9a175@linaro.org>
Date: Wed, 29 May 2024 09:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/7] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
 <wipu6tdqjbjlrv2sbljgzvoxvpjvkoaz6ic3keq24n3v4tap4j@entxhnd42rml>
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
In-Reply-To: <wipu6tdqjbjlrv2sbljgzvoxvpjvkoaz6ic3keq24n3v4tap4j@entxhnd42rml>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2024 15:48, Bjorn Andersson wrote:
> On Mon, May 27, 2024 at 10:42:32AM GMT, Neil Armstrong wrote:
>> Register a typec mux in order to change the PHY mode on the Type-C
>> mux events depending on the mode and the svid when in Altmode setup.
>>
>> The DisplayPort phy should be left enabled if is still powered on
>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>> PHY is not powered off.
>>
>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>> will be set in between of USB-Only, Combo and DisplayPort Only so
>> this will leave enough time to the DRM DisplayPort controller to
>> turn of the DisplayPort PHY.
>>
>> The patchset also includes bindings changes and DT changes.
>>
>> This has been successfully tested on an SM8550 board, but the
>> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
>> PD USB Hubs and PD Altmode Dongles to make sure the switch works
>> as expected.
>>
>> The DisplayPort 4 lanes setup can be check with:
>> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
>> 	name = msm_dp
>> 	drm_dp_link
>> 		rate = 540000
>> 		num_lanes = 4
> 
> Has the issue with the USB controller dying on us been resolved?

No, this would require some changes in dwc3 & ucsi to support the USB_ROLE_NONE

I haven't looked into this yet.

Neil

> 
> Regards,
> Bjorn


