Return-Path: <linux-arm-msm+bounces-4184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353780C4D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A32091C209A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0AD2136C;
	Mon, 11 Dec 2023 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYlWGZuo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD7E10E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:37:30 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33334480eb4so4852538f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702287448; x=1702892248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnWVMTaxObdqPPJp07rc5My1DxGVKVXEVldSTKNFuGo=;
        b=BYlWGZuooFwejauZQHbmzAZpQLg/oKpeOiakUGdNp3MyL99Ge3lyRvrt2aE3pyPB85
         8w37jL5adri8ZwNE7+fic3iVS/M25KGSYJCIbEPOpe7cXE2cliCp33K6q0a8oqo5zrtN
         chF0r5Tn0ycbLq9jG4SsRxsSRkuiupGZqBHEY/a8AkFju8oqZfyTaosMVcOCW9zWtjBi
         2yfHlzl5l0DgRpi4XJidOmvHlBN6j3ixnTkjEfqPdFCc1TZZi9mOzlJZM0M4gWvLZcKG
         hGV7+Xwngc9SyYdPHZBwR2sZobxA+Fa46JlGvMPAtImKyYpowGTxM03atGGOB+kofKky
         2Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287448; x=1702892248;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UnWVMTaxObdqPPJp07rc5My1DxGVKVXEVldSTKNFuGo=;
        b=oVK74I8t/Boo7Sj7jGa/FEghmYjW97a+7MS6MeYjCJalPARYwFRMyOKmKZBYuYS2lE
         R32VWmeeK2YrMuZPHJVz5xUEqpwIyUtZIkgDVt7WgtQTfUhKvgJzwOXynBR8gKJuvGl3
         fMq2s7x69PbEUD+CdXpfI0stJ0AGtFUpsIRfupBQ/p1wPYizhrvEF/pnlX7njt48HltQ
         EhURttlpWwtrY5oTQtlE/eFBEPm5Z5lQWsRlWjsLzPDOqkvxWkNWZAjNQPNxAFvGKgD5
         BIkDYlcycsHFYEXCSXI4GWoCrRSwi4s8qC2sDVTiKfaddc+NnSg68dDioiWoBLr6vhMN
         SZwg==
X-Gm-Message-State: AOJu0Yy3YUh8AvW8L+uMSy6IxbTLpfRiGZ0jn+fMCfh7zzV39ums55Yl
	rbbMv7UvQMKcyUn2OYyDrnDIC/5IqK22YYrgYCTcCNI2
X-Google-Smtp-Source: AGHT+IG/SHas0hGJoH1UfYwxWyP5z9Xo8SDwlQx8FKpKMCl519QBDIny0MArDFboRe+HKL4HuE7V4Q==
X-Received: by 2002:a5d:594b:0:b0:333:53c5:7003 with SMTP id e11-20020a5d594b000000b0033353c57003mr1748218wri.60.1702287448503;
        Mon, 11 Dec 2023 01:37:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23? ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
        by smtp.gmail.com with ESMTPSA id f8-20020adff448000000b0033344666878sm8099688wrp.91.2023.12.11.01.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:37:28 -0800 (PST)
Message-ID: <374addd2-e336-4625-9e0c-45e5efe1eb47@linaro.org>
Date: Mon, 11 Dec 2023 10:37:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <76f18323-a59e-4724-96ec-6306e5dcd2dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2023 19:06, Konrad Dybcio wrote:
> On 8.12.2023 16:04, Neil Armstrong wrote:
>> The current memory region assign only supports a single
>> memory region.
>>
>> But new platforms introduces more regions to make the
>> memory requirements more flexible for various use cases.
>> Those new platforms also shares the memory region between the
>> DSP and HLOS.
>>
>> To handle this, make the region assign more generic in order
>> to support more than a single memory region and also permit
>> setting the regions permissions as shared.
>>
>> Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> [...]
> 
>> +	for (offset = 0; offset < adsp->region_assign_count; ++offset) {
>> +		struct reserved_mem *rmem = NULL;
>> +
>> +		node = of_parse_phandle(adsp->dev->of_node, "memory-region",
>> +					adsp->region_assign_idx + offset);
>> +		if (node)
>> +			rmem = of_reserved_mem_lookup(node);
>> +		of_node_put(node);
> Shouldn't this only be called when parse_phandle succeeds? (separate
> patch with a fix + cc stable if so?)

It's not a bug, it was added like that because of_node_put() already
checks for a NULL pointer:
https://elixir.bootlin.com/linux/v6.7-rc5/source/drivers/of/dynamic.c#L45

> 
>> +		if (!rmem) {
>> +			dev_err(adsp->dev, "unable to resolve shareable memory-region index %d\n",
>> +				offset);
>> +			return -EINVAL;
>> +		}
>>   
>> -	perm.vmid = QCOM_SCM_VMID_MSS_MSA;
>> -	perm.perm = QCOM_SCM_PERM_RW;
>> +		if (adsp->region_assign_shared)  {
>> +			perm[0].vmid = QCOM_SCM_VMID_HLOS;
>> +			perm[0].perm = QCOM_SCM_PERM_RW;
>> +			perm[1].vmid = adsp->region_assign_vmid;
>> +			perm[1].perm = QCOM_SCM_PERM_RW;
>> +			perm_size = 2;
>> +		} else {
>> +			perm[0].vmid = adsp->region_assign_vmid;
>> +			perm[0].perm = QCOM_SCM_PERM_RW;
>> +			perm_size = 1;
>> +		}
>>   
>> -	adsp->region_assign_phys = rmem->base;
>> -	adsp->region_assign_size = rmem->size;
>> -	adsp->region_assign_perms = BIT(QCOM_SCM_VMID_HLOS);
>> +		adsp->region_assign_phys[offset] = rmem->base;
>> +		adsp->region_assign_size[offset] = rmem->size;
>> +		adsp->region_assign_perms[offset] = BIT(QCOM_SCM_VMID_HLOS);
>>   
>> -	ret = qcom_scm_assign_mem(adsp->region_assign_phys,
>> -				  adsp->region_assign_size,
>> -				  &adsp->region_assign_perms,
> I think this should be renamed to region_assign_owner(s)

Why ? this bitfield is names "perms" everywhere qcom_scm_assign_mem is used

> 
>> -				  &perm, 1);
>> -	if (ret < 0) {
>> -		dev_err(adsp->dev, "assign memory failed\n");
>> -		return ret;
>> +		ret = qcom_scm_assign_mem(adsp->region_assign_phys[offset],
>> +					  adsp->region_assign_size[offset],
>> +					  &adsp->region_assign_perms[offset],
>> +					  perm, perm_size);
>> +		if (ret < 0) {
>> +			dev_err(adsp->dev, "assign memory %d failed\n", offset);
>> +			return ret;
>> +		}
>>   	}
>>   
>>   	return 0;
>> @@ -629,20 +653,23 @@ static int adsp_assign_memory_region(struct qcom_adsp *adsp)
>>   static void adsp_unassign_memory_region(struct qcom_adsp *adsp)
>>   {
>>   	struct qcom_scm_vmperm perm;
>> +	int offset;
>>   	int ret;
>>   
>> -	if (!adsp->region_assign_idx)
>> +	if (!adsp->region_assign_idx || adsp->region_assign_shared)
> So when it's *shared*, we don't want to un-assign it?

Exact, when shared the region stays shared, as downstream does, un-assigning will fail
in this case.

> 
> Konrad

Thanks,
Neil

