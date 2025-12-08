Return-Path: <linux-arm-msm+bounces-84640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0210CAC7EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 09:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 809973034A31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 08:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324E52DA774;
	Mon,  8 Dec 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gediukZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5421A25F78F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765182425; cv=none; b=FDPgk+fKW58+fwOD1F+6qib8ukDcdr1++gcai9KAoiPkeSCtm1cZclc0OtsuT+m2WXxKDPAU7yH2BqYVDLF1v2BGVsUqTCyYp3f90nYSdTcs5qjEDapEP08oc5w0i/442QTvwB9rU3I6menWkRji0decgKZqsvc9owghgHIpGFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765182425; c=relaxed/simple;
	bh=KUZf0NaAsjG2/xo9hroHf7r6GJtFug8vRIKYlchsuJU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ym9O0Nex5WWom60xcvafLDyMOF458lHfj7gXhTQbK78FvZuIjEcJCwf7YVL7PMLIBPV3UWJnZBhoqRGQBX2B13dErNUAHFj49VsO1vbQVHgoLWvcbwDzPrTQ2oHtZnPJf51Tiue1MPh/nApuRlrjXiey/0OEOdlU1IoPQFwFDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gediukZm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779d47be12so37885575e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 00:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765182421; x=1765787221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxiuul39//eHDPIQVU3tjrG5nvHMIqLaq1V1Ix9xst0=;
        b=gediukZm7DifoWqCNQti4xoljvYwIfpIu2E5E19+yFJ8rx032d+TkRNNqY9XtTjJYn
         65D4a8Hg/FNu+xKgB31pPewsdGtL/hu3mKQY2n10pioHw5v7w5lab6bhtTBialT3WcR4
         1zLsIvouf9UQSc4IuHLT5fkWtJnvu6Pa4TKYnKH2v+kpRhoj5nh4z2WVv4hTfJqJV4mz
         NqxRBsWn9zcMhvHUetBG/E2EGPFoXW7lzGRLVvL1i/rkabjb+6Fq2Y/NG9xca18VKFzd
         sF7Dj3fZfStXP3H0qvpo7ZQeAOaApEgutVbXg0tcpoP6Ad+UYTQ56D2u9djmusU8x2i/
         mBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765182421; x=1765787221;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxiuul39//eHDPIQVU3tjrG5nvHMIqLaq1V1Ix9xst0=;
        b=YpMF/AvnkqgNkKnaw6QgxY8uofYgmWUJEvD/2jaWp2vplKX3AsuNIjpm8sdPs9neGR
         7xhIp6KnBkrAx9xtqVThcaMmWk9rK2efe5pArc90GF8U0Y3mQyPgt0d/0yAyS/XRQ+4o
         ebbJ+PMIlUSpkjBf0xkSRwO9v9Q8DWbgdMrJczi84iJQ/cxrvC4Gnfoy2l/YV2iTuVi8
         VDGDWuf510/QgO106WZfrST/971zeojAbWjTqHHjaMWMrkSjcYr2eh9JPYgFYLRHYWrl
         WW0oZoOwTKZPWjFPLoUOnM6vIC5aX7yAJrveT7xgmO9RrpEZGSWlHG0BwsitgB+ivQiT
         Zm0Q==
X-Gm-Message-State: AOJu0YwR8s3NyOFUFaoB3HJ7ZC8bdkjRBn3mDVkj+jNf6Hz94dyu/Zeh
	5jNJsP/NrA4TZRGuoqPUWaWy+G3m38aHYzczbwTa3HyegD4X7JqiK559vooJK1oBeOM=
X-Gm-Gg: ASbGncsPhbNb6/kOb4Uw5NYpDBGj+X2E3QJFfcTvr+rBJrEfVxV3g0ufkOCDD5huF5i
	11txbWRPDI1HHGMb/Y9+OFveVGTG2sNT/3QDAPvHRmwm6VKevJKU7OojL+EZYlfC0961BO01pgU
	Ob0oSyLWPH+O57eMJFWidERo7SK9JPSH4/82i9zhtt56KrWwP0xnBsdFe3cXqxKcD6pmpFUF+mA
	5A5Yd2AkjnrlOiXkhWi+fzDxEUQTuxg8JPEq1SmfpbzRsQcUlIyJWrmF/T9Lj4LOCeGlK4M+YJ0
	0VsDsav+VgfSMiXb+CiMEZWabBaOju2oDQKzYqHNB7nrqzLyZsLFcOQwI1mUEj1V+T5glqjC+Qg
	79MIb0ScwDJZhKIykFkYBm+JWr0PQ+yDtaY2LyoQTlCuaeRKjSON1mdBAx7EMOaWWutpxKGLh0s
	xPt0LUoNxaZf5QOO50kCmGF+I5jHUaiQWarK2H4Y2Z1BhFfhETQJA8JAXxOxL+S40=
X-Google-Smtp-Source: AGHT+IG7/KxJX/PrR8byjKM6CEOBSuBgSzjipyyPIwvAVWGbPVrEHMXn/wQ6EuuvvwmxRPZFW0M6fQ==
X-Received: by 2002:a05:600c:1897:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47939e46ef3mr55606715e9.35.1765182420592;
        Mon, 08 Dec 2025 00:27:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:229c:a4f9:5a3a:cf5a? ([2a01:e0a:3d9:2080:229c:a4f9:5a3a:cf5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331aeasm24066116f8f.37.2025.12.08.00.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:27:00 -0800 (PST)
Message-ID: <481c8d6d-5ea0-46c9-97a6-f41f1a75e156@linaro.org>
Date: Mon, 8 Dec 2025 09:26:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8550: Fix compile warnings in USB
 controller node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
 <20251203144856.2711440-2-krishna.kurapati@oss.qualcomm.com>
 <56c75c6c-e6b1-4acf-855d-c5d420d001f6@kernel.org>
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
In-Reply-To: <56c75c6c-e6b1-4acf-855d-c5d420d001f6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/25 16:07, Krzysztof Kozlowski wrote:
> On 03/12/2025 15:48, Krishna Kurapati wrote:
>> With W=1, the following error comes up:
>>
>> Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>>
>> This is because the child node being removed during flattening and moving
>> to latest bindings.
>>
>> Fixes: 33450878adfc ("arm64: dts: qcom: sm8550: Flatten the USB nodes")
> 
> 
> I don't fully understand that original commit - it explicitly changed
> address/size-cells from 2 to 1 and 0, so keeping address/size-cells was
> kind of intentional. Anyway, these should not be needed, so:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

They were kept to allow adding usb submodes representing usb devices,
as the bindings allows. It's not _needed_ until we add some subnodes.

Neil

> 
> Best regards,
> Krzysztof


