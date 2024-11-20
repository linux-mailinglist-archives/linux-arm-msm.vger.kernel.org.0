Return-Path: <linux-arm-msm+bounces-38539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9499D3FE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 17:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 049101F225D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 16:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F50A1552E4;
	Wed, 20 Nov 2024 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3G0+6pw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380C1547C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732119623; cv=none; b=Vpa/NNeRv+jSwBlHJ0c/Q+GmkimSEEuTb7Fx8F8TwVLfZ7xEsdbFJnoVnLsgB325NNL/ZTRI0U3cHD62yTLgNSUs6+uzlULKjbRS4Brb2LLKGLoWIKZNimak0RiNE0M6tvJEqEjrG4yuo1Il0Dai/A07VllOraF7LRvcM/yvZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732119623; c=relaxed/simple;
	bh=ySs++z4n1Fi/1AdNo5v3rz91meDM6WppVpPGxczPJjI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FtDvFdgIfzFdQ1DzUUiMIbD6X1EXWW9GH0loFAh2v877OtBbVIGi+CwdVDk2Fqa7LL7KWL7TbqB2F61ZT1uVGJQuoYhytb/tIAeAO+DjMKpff8iQm9Jkb35tkArp4jEibOt7DhRc7YNI2W2u3xmuzZCjivcBJy+r3WcL3BEmUc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3G0+6pw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-432d9bb168cso6357035e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 08:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732119620; x=1732724420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VbDXySIpVH71kNIIiHD5xXarApVi2DKm9eek/oULpY=;
        b=k3G0+6pwtG+QHWeevc6XfXTen9Pf8ZOFSPONSFa0W7m2l91O9lXRAGSELS8c5wfMAZ
         R8CWw6N5xzCXPQ2z31+XtH9d9zR5TYcUie5wiVlCMua7qF4PqULJnERV+LLjhLpW0Rg7
         XHzT1jh3bjIw6M+jT2T2QW4qmEvbjVMV3bgpyxvFFFbH8Fehhk2PntL83Xw3+ZUT5UkG
         nG9UG9TSbobRAUtGluxRH4RADHnrWaU6sp2tBUmzCRplbQI9fx2nUqx4cB0Kl2/DYzuv
         PEQBGgV/kEslxWSUfR9lTEVyjBm3ZNKuIhN6qflCC/KAf7DyiK0w8xG5lN11pEsQdWou
         fjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732119620; x=1732724420;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8VbDXySIpVH71kNIIiHD5xXarApVi2DKm9eek/oULpY=;
        b=aolz48E7DqoEtLpCWTvLQV0tFCp8kWnhdVQvsyOnnU5UfefikKRmwK9d+nskEhPp79
         JabdxDBT8Hof0nD0Hr9TgQnZDQ4x9Q6XtpWJIbP0b8j6emXcdpGvsowPxsrT+ka186Ti
         i7E2UnpckUWKCezmlOlP8LmXt8tTSCaZhCRW0dIzQ9pm5/zFO69V3JX9As5ObDaBVg5/
         Owilq2ulPj0LoBzo7TjLn+69fDTij4k91Gg1fngvmk1jq8Aj5sQbz9Wbtkjbfb3aoO4e
         lOy8WeVjhijDMmmLShsvAUTwIhjD4TeGuBqlrRx7DTrmJgJlu1bp/c4rExKyvD2JE0+F
         GskA==
X-Forwarded-Encrypted: i=1; AJvYcCXwXwEcz4ofwm3LVNH7xQ8OkE03F7cqOeDinOeH2RYyaUQwXoXL/4qtCAAkxxQmUqJRLFyVH4snIiBi4Zc+@vger.kernel.org
X-Gm-Message-State: AOJu0YytHQZq5w278ezTxXCgVz76fxXb7VY8t7N4a9QpOBpc3+nFU0aS
	QljUJDXlqgLtso58GUXdZPt29wmfrtttB+h9loiPuhRNcBmReBWt2X+xrR+CKUA=
X-Google-Smtp-Source: AGHT+IHrpX4baJR0AnkhRg24fQu6/3DnHGns5UJl0EWQkfsbVCm2wg4Owt4oTV9GbOK5eIA4XDS66Q==
X-Received: by 2002:a05:600c:19d0:b0:431:405a:f93b with SMTP id 5b1f17b1804b1-432f57e17fdmr62681445e9.10.1732119620484;
        Wed, 20 Nov 2024 08:20:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:927b:2848:1f7d:3776? ([2a01:e0a:982:cbb0:927b:2848:1f7d:3776])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432f643e65bsm46606955e9.0.2024.11.20.08.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 08:20:20 -0800 (PST)
Message-ID: <d7071991-db0a-49cc-a345-71457d68617c@linaro.org>
Date: Wed, 20 Nov 2024 17:20:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/6] firmware: qcom: scm: Fixes for concurrency
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Mukesh Ojha
 <quic_mojha@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>,
 Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
 <vr64bidkdzoebqmkq3f5jnpqf2hqcf2nvqc27vhu53ave3bced@3ffd2wqtxrvd>
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
In-Reply-To: <vr64bidkdzoebqmkq3f5jnpqf2hqcf2nvqc27vhu53ave3bced@3ffd2wqtxrvd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2024 12:13, Dmitry Baryshkov wrote:
> On Tue, Nov 19, 2024 at 07:33:16PM +0100, Krzysztof Kozlowski wrote:
>> SCM driver looks messy in terms of handling concurrency of probe.  The
>> driver exports interface which is guarded by global '__scm' variable
>> but:
>> 1. Lacks proper read barrier (commit adding write barriers mixed up
>>     READ_ONCE with a read barrier).
>> 2. Lacks barriers or checks for '__scm' in multiple places.
>> 3. Lacks probe error cleanup.
>>
>> I fixed here few visible things, but this was not tested extensively.  I
>> tried only SM8450.
>>
>> ARM32 and SC8280xp/X1E platforms would be useful for testing as well.
> 
> ARM32 devices are present in the lab.

I passed the patchset on our devices, and no regressions observed:

arm32: https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/116195
arm64(including x1e): https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/116201

Neil

> 
>>
>> All the issues here are non-urgent, IOW, they were here for some time
>> (v6.10-rc1 and earlier).
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (6):
>>        firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
>>        firmware: qcom: scm: Fix missing read barrier in qcom_scm_get_tzmem_pool()
>>        firmware: qcom: scm: Handle various probe ordering for qcom_scm_assign_mem()
>>        [RFC/RFT] firmware: qcom: scm: Cleanup global '__scm' on probe failures
>>        firmware: qcom: scm: smc: Handle missing SCM device
>>        firmware: qcom: scm: smc: Narrow 'mempool' variable scope
>>
>>   drivers/firmware/qcom/qcom_scm-smc.c |  6 +++-
>>   drivers/firmware/qcom/qcom_scm.c     | 55 +++++++++++++++++++++++++-----------
>>   2 files changed, 44 insertions(+), 17 deletions(-)
>> ---
>> base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
>> change-id: 20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-a25d59074882
>>
>> Best regards,
>> -- 
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
> 


