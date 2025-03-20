Return-Path: <linux-arm-msm+bounces-52072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9EEA6A360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4352C7AB747
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C14223707;
	Thu, 20 Mar 2025 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fv71Bc/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CDE223326
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742465698; cv=none; b=FCNQ1nw9bNM2TZ4bltojB55AJ3xgL79xKXF9k3Pb9A+ikLLG0oLbb4Tvc4X8kXEeaSwQ3cLfhdR0RMF0g2J6SRz5Zr1HID86W846iHLmtdbD/lTFsYy1linq4Uzd1FNfMwZF0spmVjVz5kAK2isrXgjeF6SQxzuQCNf0BQfJg/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742465698; c=relaxed/simple;
	bh=mad9TF6HWlzgsDYW0Xw2B9cirt0EV2aKRdW2jLlXXxQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lbP4yDNceNeM1epaX02f/5InaZ4H3t7s98ER5aY9JsXvXeXG3xnAsP8v8CWtS3kqOKOBFQJEh/WuD3UqNI3FGESnV4PHWbhs77H15+A883zI10vKDTHwkMbLdSeAQsb9JDZ4c+WV+AuuGEZycyEYb3oVovFykKADKDO7sIIJUDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fv71Bc/F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so6038135e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742465694; x=1743070494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsTKzQd+0EkTWpAX3OmSlSj7NCNCv0EtzNWUjH+/fWo=;
        b=Fv71Bc/FD3d6wsQD+D34W5hZ+qkWPMI92bhpQx4fOqmzLWzQBv75oEX1O/XOWhLOiv
         QNKA1uHtgThbFPCNI+6XbpiwgFh7ZGY6xnkGjBBP2tApKYaugGJCLK2pMob6GwxkdPT9
         3LvdMJPKS9YSAroLlyqNnlPaGySd3HRVy0DMyjahz012dyGPD2zsd9rH4I9qeU5vdg0C
         yrLtINAhO7VZicm9UtY4dfZW3+dC7LsS9oUJqBRwlG8e3EEjMIuRfekOeaT8DiqEEVdT
         95Y3epCUDLz+Sf5s2xFppVlgSZlQpOXtM7RbflYw4L7h80J5dnZ9OTvVs2H8vHpTlAce
         x+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742465694; x=1743070494;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KsTKzQd+0EkTWpAX3OmSlSj7NCNCv0EtzNWUjH+/fWo=;
        b=xOgt6vhqYb6leF0HzY/aH4zPOjwhN8hXrJzRRo7FRepQi6YfmAlBbsyYC5W4O3AyyY
         Fb2PrS5KDFm7RnK35b8KW4m7LqtjJlwzmMvkwHI+t8wpQEMZO8E92NSPpeptThEus9d+
         9y+hzAaFtqrcAazXdp05HOhqcO9dKD8K4vchVyOBNRYFlcyEKPJMUWo5qZBVk+rAcEQR
         GXDTOsK1jxGMGcplssRnuNO6lpbB2At9kKy/IfwcK9D9JgwlzJoKdBmIF18QZDhgHqNE
         wftCBoxNbOJwThzKbGoUEsofHUUQ6DQtm/AyHeeDl6/Kreq2RESmjKDuJvfhUGMy+F9u
         sVEg==
X-Forwarded-Encrypted: i=1; AJvYcCUHrZbOgOf3InDIfg5leqEh98V2L6F7TGdqlFyo1kQZ29nVkJvVmI+wcBAe6XF3eOx5YlqtoBD9YHOtfcao@vger.kernel.org
X-Gm-Message-State: AOJu0YypF+CabbwORx+NMSbI+EMD8abwJTwqlIPIisDqj1vOU77c8sUS
	jFCnJKEQ00oc8u54PdNJSzT5UGbB8hNHnc/IUG1j4POv7Ee5L+JXQRYVzEy6TlU=
X-Gm-Gg: ASbGncsQ9pgMCdkWOBr9680+8f7jHycTtveXliLip9M6IcIB3sQk2EB+KmWcr+tJt0+
	6rTKy9ZowE6gUUBlf0p/fGZeU/VqVe3TnQFQomWR2bjXaJhJDKss6u0Gcmht54Zj31STGbQW5MZ
	8tZjHPvu37kX50vI/L/TEYunEvmEsSVRmciRNAx5YZFlsdB/tPFMvQB/hPXEUBi/UpWtsDuJiRl
	VRFJCaUCy/mgQRxQXjm0ZjIU35nRLlYuYdfonmo7UazigiWFmRvRo7DRKqpmv+53LcHLkLQUYwI
	TYOlD6ZuNQUxC4fr4K1236ELbtf8DZvlvnW2HrAeezblUcWdiRQVFADydH0c0fLKZy/uSWLVQ6Y
	XZxOXkBaEdUg1ijDb
X-Google-Smtp-Source: AGHT+IFim8WXF4Bw641hmtsIGi/r9529B0IxX/j4bUMRvtVtznNxhRUIgBVI1Lkw4lHn3sf2W9z0JA==
X-Received: by 2002:a5d:59ae:0:b0:398:9e96:e798 with SMTP id ffacd0b85a97d-399795a8cb5mr3197534f8f.13.1742465694455;
        Thu, 20 Mar 2025 03:14:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3bd:568:f697:d1a2? ([2a01:e0a:3d9:2080:3bd:568:f697:d1a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b7656sm22861868f8f.40.2025.03.20.03.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:14:54 -0700 (PDT)
Message-ID: <2fafed58-4959-41ca-b0e1-c10a8da60aa1@linaro.org>
Date: Thu, 20 Mar 2025 11:14:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
 <770daf27-ae9c-4ed5-87d0-aadcc3b74bbd@oss.qualcomm.com>
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
In-Reply-To: <770daf27-ae9c-4ed5-87d0-aadcc3b74bbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeff,

On 19/03/2025 19:32, Jeff Johnson wrote:
> On 3/19/2025 3:27 AM, Krzysztof Kozlowski wrote:
>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>>>> ---
>>>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>>>
>>>>>> Best regards,
>>>>>
>>>>> NAK since this will break QCN
>>>>> There is a series under internal review to address MLO issues for WCN chipsets
>>>>
>>>> ???
>>>>
>>>> The original commit is wrong, this fixes the conversion, nothing else.
>>>
>>> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
>>> Setting the mlo capability flag without having required driver changes
>>> for WCN chipset will likely result in firmware crash. So the recommendation
>>> is to enable MLO (in WCN) only when all the necessary driver changes
>>> (in development, public posting in near future) are in place.
>> Really, these are your answers? There is regression and first reply is
>> upstream should wait for whatever you do internally. Second answer is
>> the same - public posting in near future?
>>
>> Can you start working with the upstream instead?
> 
> There is a lot going on in this thread. I want to address the big picture. It
> is no secret that Qualcomm has historically focused on downstream drivers, and
> upstream was mostly an afterthought. But that mindset has changed. Qualcomm is
> fully embracing upstream kernel development, and has actively recruited (and
> is still recruiting!) experienced upstream Linux Kernel engineers. And in
> places where there are shortcoming, Qualcomm has partnered with companies like
> Linaro to bring in needed support. So Qualcomm is very much "working with the
> upstream." We may not be working well sometimes, but many of us are still
> inexperienced with working with the upstream. We are coming up to speed.
> Specifically for Wi-Fi, we have a large number of engineers who have primarily
> worked on downstream code who are now working on upstream (including me!). And
> we still have the issue that many of the products we are shipping now still
> have a lot of downstream DNA, especially when it comes to firmware interfaces.
> So please bear with us as we learn and evolve.
> 
> Please keep the constructive feedback coming. And remember, the more detailed
> the feedback, the easier it is to incorporate the feedback.

Thanks for all the feedback, all this escalated mainly because the 46d16f7e1d14
commit doesn't do what is written in the commit message, and there were no clear
sign MLO support with WCN firmares would be removed shortly and redeveloped later.

As final note for this patch, do you have any timeline for when MLO would be enabled
again on WCN chips ?

I'm happy Qualcomm is embracing mainline development, but Qualcomm still ships
hundreds of different incompatible firmware and downstream drivers variant in the
field, and this makes system integration very hard.

And as you mention the partnership with Linaro, we are very happy to help
and support your mainline development over time by reviewing, testing and
reporting.

Thanks,
Neil

> 
> Thanks!
> /jeff
> 


