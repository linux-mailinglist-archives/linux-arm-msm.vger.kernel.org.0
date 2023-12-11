Return-Path: <linux-arm-msm+bounces-4210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBBA80C7CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 12:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2A31281429
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E89358B2;
	Mon, 11 Dec 2023 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hl4yLjD0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1B1B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 03:19:40 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33621d443a7so783804f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 03:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702293579; x=1702898379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pZPdZp6957k6C1NFCMTL6mm1rsB1Mx6NLsmieoSb4Q=;
        b=hl4yLjD04Vb7BahGs6dSi/TFdTjeQaWuzf/WzJfD2PzO4VpvHcJy2eREeh3I06Zcuj
         Kqwqj2Gs/73TWt4bfPF2tGujeBkI7859fYbblNeXsLpL0Jec+cmhVj2DfYAfS2dyXhps
         pDnjC5HPxLEjj6yEa5rKlZjufn6N8Gg/xo9mDwXzwBNJW21psta7Wb4z7foBGT/uojXk
         U+6wHH435LSwCh/CB4qgmr6/tuMX6q1T9SIqX4+T4zklJOHtlIxij2TDMqs9lDVmga4t
         /cFL1duJK1tgAOq1COiAOvGFmt9u4sbdL2BgZNtnpSm9+FIADpLkz5nZQ7TbH0YN9A3Z
         4CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702293579; x=1702898379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7pZPdZp6957k6C1NFCMTL6mm1rsB1Mx6NLsmieoSb4Q=;
        b=rNsWBIDq+Lz2tUes+WpSjpakCfvDmzw2eBdRkKz3AY1Q3Rc3T0AAeUwI211hPuCd4a
         ZDnSDUrMR2/hPWJu2CwKF9H2gghUa8vzfreGzhQX1G3V4zEb5f91SWjMJ8dTwlpcrPoi
         brJmZ3reNy32YhpARf03kR8q0IRyYmtSTdvtbXZuhQUA5tpfpGY3b7nLVVfTqxrGWX0+
         +T1a6omq4O47YXrPO/HQYdM56xhWhlnWBK531sz2nyPZ+wCyAdlmnz8CkBd2p6FW2Pck
         cwGQ2HZcB8hjpUz37oz/YiAXJfdpPRrY/a35OghMe6tlAz2t+ZzsT++g3kGdpP/5wvyA
         nnpQ==
X-Gm-Message-State: AOJu0YxLyL4eg74HkLaBXzxOacdQOY84c7PocNO0qFgrSJ4h2K6ydr1B
	ZifNMGRhO2VMCU93mPWuDkfpoQ==
X-Google-Smtp-Source: AGHT+IFhW7zhl+mrlfS6rhFqzVBgcXUus3YQCkHiFyDCopoJBuSiE5WNhXTl94dw0BFYn8zKpX1AGg==
X-Received: by 2002:a05:600c:3d8b:b0:40b:5e4a:406b with SMTP id bi11-20020a05600c3d8b00b0040b5e4a406bmr1938322wmb.139.1702293579015;
        Mon, 11 Dec 2023 03:19:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23? ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
        by smtp.gmail.com with ESMTPSA id z20-20020a05600c0a1400b004064e3b94afsm15042877wmp.4.2023.12.11.03.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 03:19:38 -0800 (PST)
Message-ID: <5d77a476-06ee-4319-8e20-eef1c6ad51c6@linaro.org>
Date: Mon, 11 Dec 2023 12:19:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 2/3] remoteproc: qcom: pas: make region assign more
 generic
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mukesh Ojha <quic_mojha@quicinc.com>
References: <20231208-topic-sm8650-upstream-remoteproc-v4-0-a96c3e5f0913@linaro.org>
 <20231208-topic-sm8650-upstream-remoteproc-v4-2-a96c3e5f0913@linaro.org>
 <76f18323-a59e-4724-96ec-6306e5dcd2dc@linaro.org>
 <374addd2-e336-4625-9e0c-45e5efe1eb47@linaro.org>
 <b4b0ed80-eed5-4045-8ceb-5b507c77e4e2@linaro.org>
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
In-Reply-To: <b4b0ed80-eed5-4045-8ceb-5b507c77e4e2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/12/2023 10:54, Konrad Dybcio wrote:
> On 11.12.2023 10:37, Neil Armstrong wrote:
>> On 09/12/2023 19:06, Konrad Dybcio wrote:
>>> On 8.12.2023 16:04, Neil Armstrong wrote:
>>>> The current memory region assign only supports a single
>>>> memory region.
>>>>
>>>> But new platforms introduces more regions to make the
>>>> memory requirements more flexible for various use cases.
>>>> Those new platforms also shares the memory region between the
>>>> DSP and HLOS.
>>>>
>>>> To handle this, make the region assign more generic in order
>>>> to support more than a single memory region and also permit
>>>> setting the regions permissions as shared.
>>>>
>>>> Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>> [...]
>>>
>>>> +    for (offset = 0; offset < adsp->region_assign_count; ++offset) {
>>>> +        struct reserved_mem *rmem = NULL;
>>>> +
>>>> +        node = of_parse_phandle(adsp->dev->of_node, "memory-region",
>>>> +                    adsp->region_assign_idx + offset);
>>>> +        if (node)
>>>> +            rmem = of_reserved_mem_lookup(node);
>>>> +        of_node_put(node);
>>> Shouldn't this only be called when parse_phandle succeeds? (separate
>>> patch with a fix + cc stable if so?)
>>
>> It's not a bug, it was added like that because of_node_put() already
>> checks for a NULL pointer:
>> https://elixir.bootlin.com/linux/v6.7-rc5/source/drivers/of/dynamic.c#L45
> Ack
> 
>>
>>>
>>>> +        if (!rmem) {
>>>> +            dev_err(adsp->dev, "unable to resolve shareable memory-region index %d\n",
>>>> +                offset);
>>>> +            return -EINVAL;
>>>> +        }
>>>>    -    perm.vmid = QCOM_SCM_VMID_MSS_MSA;
>>>> -    perm.perm = QCOM_SCM_PERM_RW;
>>>> +        if (adsp->region_assign_shared)  {
>>>> +            perm[0].vmid = QCOM_SCM_VMID_HLOS;
>>>> +            perm[0].perm = QCOM_SCM_PERM_RW;
>>>> +            perm[1].vmid = adsp->region_assign_vmid;
>>>> +            perm[1].perm = QCOM_SCM_PERM_RW;
>>>> +            perm_size = 2;
>>>> +        } else {
>>>> +            perm[0].vmid = adsp->region_assign_vmid;
>>>> +            perm[0].perm = QCOM_SCM_PERM_RW;
>>>> +            perm_size = 1;
>>>> +        }
>>>>    -    adsp->region_assign_phys = rmem->base;
>>>> -    adsp->region_assign_size = rmem->size;
>>>> -    adsp->region_assign_perms = BIT(QCOM_SCM_VMID_HLOS);
>>>> +        adsp->region_assign_phys[offset] = rmem->base;
>>>> +        adsp->region_assign_size[offset] = rmem->size;
>>>> +        adsp->region_assign_perms[offset] = BIT(QCOM_SCM_VMID_HLOS);
>>>>    -    ret = qcom_scm_assign_mem(adsp->region_assign_phys,
>>>> -                  adsp->region_assign_size,
>>>> -                  &adsp->region_assign_perms,
>>> I think this should be renamed to region_assign_owner(s)
>>
>> Why ? this bitfield is names "perms" everywhere qcom_scm_assign_mem is used
> And IMO that's not correct - there's the qcom_scm_vmperm.perm field which
> is oneOf r/w/x/rw/rwx and this one is filled with ORed BIT()-ed elements
> allowed in qcom_scm_vmperm.vmid (QCOM_SCM_VMID_...)

Ok right I just use the same namings as in rmtfs_mem, fastrpc & ath10k/qmi,
but indeed the qcom_scm_assign_mem() 3rd param name is srcvm but doc says "vmid for current set of owners",
so yeah it could be named owners.

I'll send a v5 with the rename.

Neil


> 
> Konrad


