Return-Path: <linux-arm-msm+bounces-7825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D604B836C41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7D21C2676C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1614124A1C;
	Mon, 22 Jan 2024 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3FV9Bp9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D8947F5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937832; cv=none; b=RBXeoMC8CmvT4vTNQrVa0i4HaTddfBTyzt6VwMuC9qi9c6S1s0xJxLWRfseDapWZyRvdIM351otNVbNOSuICFgPtC4V1hrDKtw1oJ9eiYlRW6qaV+H4hpJB6PrOXeE1If6erwxo5a0xQFKjeN6+zse/YXViI9hKG5myc756r0Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937832; c=relaxed/simple;
	bh=M1IexsZpjIC9NupxqqOEPzt1ds4YpinCNH1anLwZUqw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fbSnD8YYd+XKtoxyGkfoElWZD2GKDMfGMY8kiPcPhxDu6o2P891Qkjk7szQ7Edzq4sKMMTyCmWTt7MHrkuwkBZfVt01hyUWtf/v9j9v/GHW6/CJ13gz2sBQTv0TVhZ4CFUHUos60/N8scp+WNMbFjkIjR1vfwteVgwpgXDBKEFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3FV9Bp9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so3311641f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705937829; x=1706542629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7/rVREoWbpjFsjzxitxG0salXyfYR/fC5ds6J+XLfA=;
        b=e3FV9Bp9i/p9EoM2Y6atekGOYqqIQxl8bW2xGp6+19ZPxPmgd4Rz3AxIQYLTUU7hSr
         eyBtLcLtUprSfafmfNFNN4yxL+3iqcIQRxRXfMoTVhg+Kkwhw3gSKrnH73bTShlZ7Sd/
         V9JAUGkRpUbcbrwstoKWY6YVNmn5ruF43dcR2JhRwHPxt/fuMVJSYDZKNUzVbWJNnW34
         II3v4v18bNILMl/MEI7yPj0gVyc4lSYhMufekd0IZY4oDqlRZM/VpPasejv3TQaMWGn3
         Cxn7bdzDMOJ5/GdMAJfrNPrXFW3qJUqn19Bm1AYY3ejANeeCxR1m0df73URzMWPGh2Iq
         1WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705937829; x=1706542629;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E7/rVREoWbpjFsjzxitxG0salXyfYR/fC5ds6J+XLfA=;
        b=lP7+W2l8M297ZnzJEhD430N+zyckmj/FZA1jj1+QVZ41rZ4IcsRA6itNBsykogpAyf
         KIKi3M6V+/RpAMtZgVHJFAuRwYQSBjIAXPzZ8Vy6PrbXdilDyyrveKyz0tT/6WRpZhqp
         8J/U8NhLCAy4w2/sHBD4O0AL8InV+qk3s2EjoOvJ6hH8vNMU5b/4/XScYOLVwaVEp6ZX
         S4rFM0oCw1VmrGQyiVhlwLYAUbUiJNzDFuEy9ZHZicYdVzPCIQpF0Q/u0poUG2rKhNzb
         lPr5Q6+rr2k8r/nUrT6dk2qOgOEkDSIUVKEoLgOQeYtQfOQVSCV0hOygFjnI74vZ7JQs
         rxow==
X-Gm-Message-State: AOJu0YxZcEhkQIMICLtKw/HNdR28KH2qvBD9KIkcME5mXj3gQ0JUHQGg
	Czx4GU+R+Vz95WW4i3PLiraWdp86Q+Ute6Luwp8et5vSf8DzkN70GzrS7SST5HY=
X-Google-Smtp-Source: AGHT+IGogGxunI3h0nfni+qTIywi+Ay2Sm785g29lG7w5Xw5Ouok8yKjNQSi0dcKXtFi/XKBXaLQ9g==
X-Received: by 2002:a05:6000:1888:b0:339:372e:7711 with SMTP id a8-20020a056000188800b00339372e7711mr1351027wri.55.1705937828664;
        Mon, 22 Jan 2024 07:37:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bc76:9408:4feb:c26b? ([2a01:e0a:982:cbb0:bc76:9408:4feb:c26b])
        by smtp.gmail.com with ESMTPSA id q4-20020adfab04000000b00337d603fd01sm11049536wrc.66.2024.01.22.07.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 07:37:08 -0800 (PST)
Message-ID: <b7b0eb97-b37f-4a72-b418-88b37a0320aa@linaro.org>
Date: Mon, 22 Jan 2024 16:37:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Use GIC-ITS for PCIe0 and PCIe1
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240122-topic-sm8550-upstream-pcie-its-v1-1-aff5d0d7d6dd@linaro.org>
 <fcb3c92e-df59-4135-83c7-2850f537e57c@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <fcb3c92e-df59-4135-83c7-2850f537e57c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/01/2024 16:34, Konrad Dybcio wrote:
> On 22.01.2024 16:28, Neil Armstrong wrote:
>> Both PCIe0 and PCIe1 controllers are capable of signalling the MSIs
>> received from endpoint devices to the CPU using GIC-ITS MSI controller.
>> Add support for it.
>>
>> Currently, BDF (0:0.0) and BDF (1:0.0) are enabled and with the
>> msi-map-mask of 0xff00, all the 32 devices under these two busses can
>> share the same Device ID.
> 
> Copypasta! you didn't actually add these :P

Oops thx for spotting, sending a v2!

Neil

> 
> Konrad
> 
> 


