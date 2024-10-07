Return-Path: <linux-arm-msm+bounces-33335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3459926AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 607A21C223F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359E8188708;
	Mon,  7 Oct 2024 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNlPFNBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D018787D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288502; cv=none; b=nNfF655JHCXTq5yEcgMUAN52cvuwXZD8hWJvEIoDDUCVvd9UD5x9YzW0hfKTCxNkp9d7G/ByBS9psUeaL1RkfOHkd/9YOHBXzbECJZdXUTe73gsyvB8HKmlOy7cmIMhgrowWDX7Jvijf0F/AfoCL3Us3LkOAAWEJneRmmnBf8Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288502; c=relaxed/simple;
	bh=IxYWj9Xorz1AZbfO/tpFcZsn5IGSnomV6GTPPSeCQFM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=drYbf+8fB9fLjB/LP09gszyi5vwoniZ2uBU2mxXjf/LaoZ6EtMd5KxlDvSfADj2FN3pSVo9N2M0pOXl1b9iIhFLwp+7kmF8vYpOhXNcIbdvl4T5nG2H3aX+/cr0II/NvIZoITqqlHS6ZUZWsA7FNO5dSG4p1czcCNUZUWrg0VbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNlPFNBp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso54881245e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728288498; x=1728893298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNnagbUk9E0Ml9V+Nduq7EQawbw5vOZA0KfAKQ2AxhM=;
        b=oNlPFNBpU7wcHyjxOMVgi3HVLtLFfibcFDCJbZEbJH4pJXdlTEBcpfORbLKUun9Wbp
         fIqQFW4gbAPc5N86DiAHrPc0Mj8Ium/0yZVBalfsz2aOCtpCT1uZ3d0B2NlOuOhK2OsB
         KeefxvXxzacWgFrnoxqMFUqesGsB1LLhgyYyd7gOp9D7P21+EVWZ4lRTBC+fGkuatgfF
         uJqNMB2rnBr8lap79xHe5ejav7tPzajM+mLdMHne+mEdBOBj633qUwLBJP9j4DhOCEVu
         c1umLY8u7N1DOv9hwQFntOpe/DICe+ywgZHK/LoVht720tDVzxdbFn6R1Zr3RCvql8Rs
         3DxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728288498; x=1728893298;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GNnagbUk9E0Ml9V+Nduq7EQawbw5vOZA0KfAKQ2AxhM=;
        b=Z85ZlDnigA3EXXiPUIploEp3ronRFydLIL9Zt2bdgKe71/7d33+4q+j+dZ+59RbHM8
         yG8ycfgSlT+1AI47UH4L+owdU4AA6T1xCkK1//qwk55OttHI6/OJmzNtfoTBstiTdNED
         IJPXGtu29UwDIHvvqdOwXkL/1lNjo9mRi630tXCR7Xc6kblQ5kyKw3IQ7Ax3UYE0mBgm
         T3drV/06KaQvfEpz4Msf6xCGkuFrnGR6UANQOdmu8SR0lzPwpOGiCTQ0YFYyqNkJS9Zy
         K/sF2amkURglBLKxebGjx8YfbTLk0iwfkyy6pJecbXw6YBSdSw6JnF5rVwOG4rPnVh8T
         Rv3w==
X-Gm-Message-State: AOJu0Yw/nJZI/IdsBt49hy+jcfwcLa27bfwnG6MlLLuk66fKsYKLQuGW
	C8J6VnqWzkLmwhDIASGHnEy1BjAEpLmoOE58mcDUfvSTMPvB1lLIPUfCzX/5VNk=
X-Google-Smtp-Source: AGHT+IFPwZCQpnEAqjX6GbBQ235vE41Kh0cdPVs7FsU1Ni6P07LOC9oc6/ORmYHV6fNNeUFYp6SLvg==
X-Received: by 2002:a05:600c:35cf:b0:42c:b62c:9f0d with SMTP id 5b1f17b1804b1-42f85ab87cdmr124709045e9.17.1728288498096;
        Mon, 07 Oct 2024 01:08:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7? ([2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695e8b6sm5143596f8f.71.2024.10.07.01.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 01:08:17 -0700 (PDT)
Message-ID: <83e23090-0390-4c2e-91e3-e222baaa889a@linaro.org>
Date: Mon, 7 Oct 2024 10:08:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] remoteproc: qcom: Add helper function to support
 IOMMU devmem translation
To: Mukesh Ojha <quic_mojha@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shiraz Hashim <quic_shashim@quicinc.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-4-quic_mojha@quicinc.com>
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
In-Reply-To: <20241004212359.2263502-4-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2024 23:23, Mukesh Ojha wrote:
> From: Shiraz Hashim <quic_shashim@quicinc.com>
> 
> Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> translation set up for remote processors is managed by QHEE itself
> however, for a case when these remote processors has to run under KVM

This is not true, KVM is a Linux hypervisor, remote processors have
nothing to do with KVM, please rephrase.

> hypervisor, IOMMU translation need to setup from Linux remoteproc driver
> before it is brought up.
> 
> Add qcom_devmem_info and qcom_devmem_table data structure and make a
> common helper functions which caller can call if these translation need
> to be taken care by the driver to enable iommu devmem access for
> remoteproc processors.
> 
> Signed-off-by: Shiraz Hashim <quic_shashim@quicinc.com>
> Co-developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>   drivers/remoteproc/qcom_common.c | 96 ++++++++++++++++++++++++++++++++
>   drivers/remoteproc/qcom_common.h | 35 ++++++++++++
>   2 files changed, 131 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 1c7887dc65b4..644920972b58 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -658,5 +658,101 @@ int qcom_map_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t me
>   }
>   EXPORT_SYMBOL_GPL(qcom_map_unmap_carveout);
>   
> +/**
> + * qcom_map_devmem() - Map the device memories needed by Remoteproc using IOMMU
> + *
> + * When Qualcomm EL2 hypervisor(QHEE) present, device memories needed for remoteproc
> + * processors is managed by it and Linux remoteproc drivers should not call
> + * this and its respective unmap function in such scenario. This function
> + * should only be called if remoteproc IOMMU translation need to be managed
> + * from Linux side.
> + *
> + * @rproc: rproc handle
> + * @devmem_table: list of devmem regions to map
> + * @use_sid: decision to append sid to iova
> + * @sid: SID value
> + */
> +int qcom_map_devmem(struct rproc *rproc, struct qcom_devmem_table *devmem_table,
> +		    bool use_sid, unsigned long sid)
> +{
> +	struct qcom_devmem_info *info;
> +	unsigned long sid_def_val;
> +	int ret;
> +	int i;
> +
> +	if (!rproc->has_iommu)
> +		return 0;
> +
> +	if (!rproc->domain)
> +		return -EINVAL;
> +
> +	/* remoteproc may not have devmem data */
> +	if (!devmem_table)
> +		return 0;
> +
> +	if (use_sid && sid)
> +		sid_def_val = sid & SID_MASK_DEFAULT;
> +
> +	info = &devmem_table->entries[0];
> +	for (i = 0; i < devmem_table->num_entries; i++, info++) {
> +		/*
> +		 * Remote processor like ADSP supports upto 36 bit device
> +		 * address space and some of its clients like fastrpc uses
> +		 * upper 32-35 bits to keep lower 4 bits of its SID to use
> +		 * larger address space. To keep this consistent across other
> +		 * use cases add remoteproc SID configuration for firmware
> +		 * to IOMMU for carveouts.
> +		 */
> +		if (use_sid)
> +			info->da |= (sid_def_val << 32);
> +
> +		ret = iommu_map(rproc->domain, info->da, info->pa, info->len, info->flags, GFP_KERNEL);
> +		if (ret) {
> +			dev_err(&rproc->dev, "Unable to map devmem, ret: %d\n", ret);
> +			if (use_sid)
> +				info->da &= ~(SID_MASK_DEFAULT << 32);
> +			goto undo_mapping;
> +		}
> +	}
> +
> +	return 0;
> +
> +undo_mapping:
> +	for (i = i - 1; i >= 0; i--, info--) {
> +		iommu_unmap(rproc->domain, info->da, info->len);
> +		if (use_sid)
> +			info->da &= ~(SID_MASK_DEFAULT << 32);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_map_devmem);
> +
> +/**
> + * qcom_unmap_devmem() -  unmap the device memories needed by Remoteproc using IOMMU
> + *
> + * @rproc:		rproc handle
> + * @devmem_table:	list of devmem regions to unmap
> + * @use_sid:		decision to append sid to iova
> + */
> +void qcom_unmap_devmem(struct rproc *rproc, struct qcom_devmem_table *devmem_table, bool use_sid)
> +{
> +	struct qcom_devmem_info *info;
> +	int i;
> +
> +	if (!rproc->has_iommu || !rproc->domain || !devmem_table)
> +		return;
> +
> +	info = &devmem_table->entries[0];
> +	for (i = 0; i < devmem_table->num_entries; i++, info++) {
> +		iommu_unmap(rproc->domain, info->da, info->len);
> +		if (use_sid)
> +			info->da &= ~(SID_MASK_DEFAULT << 32);
> +	}
> +
> +	return;
> +}
> +EXPORT_SYMBOL_GPL(qcom_unmap_devmem);
> +
>   MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index bbc41054e1ea..bbc684e1df01 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -41,6 +41,36 @@ struct qcom_rproc_pdm {
>   	struct auxiliary_device *adev;
>   };
>   
> +/**
> + * struct qcom_devmem_info - iommu devmem region
> + * @da: device address
> + * @pa: physical address
> + * @len: length (in bytes)
> + * @flags: iommu protection flags
> + *
> + * The resource entry carries the device address to which a physical address is
> + * to be mapped with required permissions in flag. The pa, len is expected to
> + * be a physically contiguous memory region.
> + */
> +struct qcom_devmem_info {
> +	u64 da;
> +	u64 pa;
> +	u32 len;
> +	u32 flags;
> +};
> +
> +/**
> + * struct qcom_devmem_table - iommu devmem entries
> + * @num_entries: number of devmem entries
> + * @entries: devmem entries
> + *
> + * The table that carries each devmem resource entry.
> + */
> +struct qcom_devmem_table {
> +	int num_entries;
> +	struct qcom_devmem_info entries[0];
> +};
> +
>   void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
>   			void (*rproc_dumpfn_t)(struct rproc *rproc,
>   				struct rproc_dump_segment *segment, void *dest, size_t offset,
> @@ -65,6 +95,11 @@ int qcom_map_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t me
>   void qcom_add_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm);
>   void qcom_remove_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm);
>   
> +int qcom_map_devmem(struct rproc *rproc, struct qcom_devmem_table *table,
> +		    bool use_sid, unsigned long sid);
> +void qcom_unmap_devmem(struct rproc *rproc, struct qcom_devmem_table *table,
> +		       bool use_sid);
> +
>   #if IS_ENABLED(CONFIG_QCOM_SYSMON)
>   struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>   					   const char *name,


