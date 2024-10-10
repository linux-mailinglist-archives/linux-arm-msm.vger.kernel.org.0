Return-Path: <linux-arm-msm+bounces-33784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CAD997DFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEAC2B25498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5941B533F;
	Thu, 10 Oct 2024 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DH6K8b1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10DD197A9A
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543482; cv=none; b=j2E4Bk7vqJKBerk55qPhRu2qMOzFjCfmBO5T7Qx2UwPVnBJ5d2wGwLdyHxaDtvmMaUAKw21SSBN711++jydLXT84w6Trd0zFKWPFr/bwC7wf0YNLF8QGQ66WIiWEG0YihqndrvQ6LGefw81jLKit6KlGJjMR5XYqG3F3oP0szBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543482; c=relaxed/simple;
	bh=PA3elQSlk7BZiC6WL58fCozS0fJse0btcH66cdahyuQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sZWi+D6AJuN4QjY5F/FY+WUbIw2jmMwEX0Su/3vw7CYNo0WN6kvhqxndTC0eIP7heQIbsHXWQEhTNc9dPgfpa0UL0Ox6TLgReF+pRtABwZ+irrFF7hWTds0Q6BSwsMBa1dYxbcakyNdiL83zySbMLfVV+OdkdEHCxxiOfthwcsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DH6K8b1t; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so5038935e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728543478; x=1729148278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDana86kmJ+tmSzGzoEiMN//QimA0FRz1mHK/CksBPM=;
        b=DH6K8b1tnUsqE8pqJHXu6PiaYhDEZ0RWXDw32BXBKc6mZYkh/PbVXAPJ+XGWPTaMLz
         ZkQ/3A+YgV2Al60qQURCsRda3nHsLvwfPmYO7Kl0zOh1i6dOsJz8sqA/9xgy478L+2JZ
         b1asfehlkLkLvY0PJJVPrVZLecrWI/Drw6NAMwZP307hscF0LjhdUI3rIZtqb0ztSb7M
         J35+OmH8Muijm5czx2HRudlVNnUSgVIg+undAPGxtu7r89nAytZ++UhXxr1grBbSnLUI
         JPD2L8DIYJNk8L+RXTa7U+vdVMCbctk3cSY7/dmRGELoKiT0NuLT7zpVuUdTvz2F5b0C
         C9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728543478; x=1729148278;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DDana86kmJ+tmSzGzoEiMN//QimA0FRz1mHK/CksBPM=;
        b=Wuy8NCHT1AFH0PdWwUhiLW/j5/ybrptEUctsDyek4YjTfjj7whTcDuUle36XioxZL1
         GO1I385STMQSAEMN9SKFsyPzzDyrlkI+/GCB4XgnpoWISVJNCWKelopB98KiGqozZCrB
         VzPLbu3KbUg0Lv+mbeFzKz+x9qt6lke9qQf9szeSFhaTt0EYzFCSamlT+en8J/DUmH6o
         GRNxGQF1Blb9QujkHb/ybQZZiCfmjF2KRWsqwZ+wo0Fgtpr1uYM/YOhHhwLiK6s/aiU0
         O6xApnDiRmyG/B6khJ9cEPwFu+T1HFJlih45oHj96Bykz/uugPzYZC7RMC88pNi70Y+6
         lJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6TE6JDj4zgAZQncgm5Vraj3808ulcYvFFnXe6QHD4XF8CsOfKC0h/AQS5GR4kTFtOWfTHURODqchXnkRA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl2PCf4R0o96eOKV3mhk6fjVcaKgsbABQ19CasVk5b+ApNabtX
	xS7nTc8dfQY8QH6BI/YzftZFruXw+pJHTvbX3UTCq2h6vDy/gpwScFZEuFfHO+s=
X-Google-Smtp-Source: AGHT+IFlWI7JNx0Q9soty/nyquv4PsucmpWSKJ/xN4uty/LrtcQoVZDJSf68jeLeBuulZwx2DFoTCw==
X-Received: by 2002:a05:600c:3ac4:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-430d7487f4fmr45681415e9.32.1728543478134;
        Wed, 09 Oct 2024 23:57:58 -0700 (PDT)
Received: from [192.168.7.189] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835c4fbsm6621825e9.39.2024.10.09.23.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 23:57:57 -0700 (PDT)
Message-ID: <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org>
Date: Thu, 10 Oct 2024 08:57:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge
 support
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
 <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
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
In-Reply-To: <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 08:21, Mukesh Ojha wrote:
> On Mon, Oct 07, 2024 at 08:22:39PM +0530, Mukesh Ojha wrote:
>> On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
>>> On 04/10/2024 23:23, Mukesh Ojha wrote:
>>>> For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
>>>> translation for remote processors is managed by QHEE and if the same SoC
>>>> run under KVM, remoteproc carveout and devmem region should be IOMMU
>>>> mapped from Linux PAS driver before remoteproc is brought up and
>>>> unmapped once it is tear down and apart from this, SHM bridge also need
>>>> to set up to enable memory protection on both remoteproc meta data
>>>> memory as well as for the carveout region.
>>>>
>>>> Enable the support required to run Qualcomm remoteprocs on non-QHEE
>>>> hypervisors.
>>>>
>>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>>> ---
>>>>    drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
>>>>    1 file changed, 40 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> index ac339145e072..13bd13f1b989 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> @@ -122,6 +122,7 @@ struct qcom_adsp {
>>>>    	struct qcom_devmem_table *devmem;
>>>>    	struct qcom_tzmem_area *tzmem;
>>>> +	unsigned long sid;
>>>>    };
>>>>    static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
>>>> @@ -310,9 +311,21 @@ static int adsp_start(struct rproc *rproc)
>>>>    	if (ret)
>>>>    		return ret;
>>>> +	ret = qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, true, true, adsp->sid);
>>>> +	if (ret) {
>>>> +		dev_err(adsp->dev, "iommu mapping failed, ret: %d\n", ret);
>>>> +		goto disable_irqs;
>>>> +	}
>>>> +
>>>> +	ret = qcom_map_devmem(rproc, adsp->devmem, true, adsp->sid);
>>>> +	if (ret) {
>>>> +		dev_err(adsp->dev, "devmem iommu mapping failed, ret: %d\n", ret);
>>>> +		goto unmap_carveout;
>>>> +	}
>>>> +
>>>>    	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>>>>    	if (ret < 0)
>>>> -		goto disable_irqs;
>>>> +		goto unmap_devmem;
>>>>    	ret = clk_prepare_enable(adsp->xo);
>>>>    	if (ret)
>>>> @@ -400,6 +413,10 @@ static int adsp_start(struct rproc *rproc)
>>>>    	clk_disable_unprepare(adsp->xo);
>>>>    disable_proxy_pds:
>>>>    	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>>>> +unmap_devmem:
>>>> +	qcom_unmap_devmem(rproc, adsp->devmem, adsp->sid);
>>>> +unmap_carveout:
>>>> +	qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, false, true, adsp->sid);
>>>>    disable_irqs:
>>>>    	qcom_q6v5_unprepare(&adsp->q6v5);
>>>> @@ -445,6 +462,9 @@ static int adsp_stop(struct rproc *rproc)
>>>>    			dev_err(adsp->dev, "failed to shutdown dtb: %d\n", ret);
>>>>    	}
>>>> +	qcom_unmap_devmem(rproc, adsp->devmem, adsp->sid);
>>>> +	qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, false, true, adsp->sid);
>>>> +
>>>>    	handover = qcom_q6v5_unprepare(&adsp->q6v5);
>>>>    	if (handover)
>>>>    		qcom_pas_handover(&adsp->q6v5);
>>>> @@ -844,6 +864,25 @@ static int adsp_probe(struct platform_device *pdev)
>>>>    	}
>>>>    	platform_set_drvdata(pdev, adsp);
>>>> +	if (of_property_present(pdev->dev.of_node, "iommus")) {
>>>> +		struct of_phandle_args args;
>>>> +
>>>> +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +
>>>> +		rproc->has_iommu = true;
>>>> +		adsp->sid = args.args[0];
>>>> +		of_node_put(args.np);
>>>> +		ret = adsp_devmem_init(adsp);
>>>> +		if (ret)
>>>> +			return ret;
>>>
>>> Why don't you get this table from the firmware like presumably QHEE does ?
>>
>> Well, AFAIK, QHEE(EL2) has this information statically present and does
>> not get it from anywhere., but will confirm this twice..
> 
> Double confirmed, device memory region required by remoteproc is
> statically present with QHEE.

Right, in this case why those tables can't be embedded in the elf .resource_table
like it's done with qcom_q6v5_adsp.c by calling rproc_elf_load_rsc_table()
and let the remoteproc framework load the resource table and setup
the devmem ssmu_map ?

Neil

> 
> -Mukesh
> 
>>
>> -Mukesh
>>


