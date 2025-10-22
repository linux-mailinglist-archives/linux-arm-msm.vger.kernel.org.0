Return-Path: <linux-arm-msm+bounces-78246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B9EBFA0A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0038D4E3AF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B91B22F74D;
	Wed, 22 Oct 2025 05:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lz71Gmc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC52E6CCC;
	Wed, 22 Oct 2025 05:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761110388; cv=none; b=IoRRPN16nH7hZVNdP8GRzL5yLpYMwr5yHJlwZV1dJm0Zgmls6yNWbQ/FR3KbeByzAFb1njEoLwSmDJExT+6LmQDrXsD8HNMblAZ4ZfdesTJ3EQOtDELrxl3rDp5hXuYxJ/huPSh9LfKdPf7D3yEE4CRGPysCcK2q9V9bTE8EhHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761110388; c=relaxed/simple;
	bh=025aCJfqvGmjoJBXh0rJStXhckRupE6yyuitUiqUkdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IAf4Nx0/iojZqH3503lHK8I2ljJxzymeFiuuxitIZZKsKjT4B/KHUWJCAPkMZj+IkD3r5giHY+sItiod5SXuBPxqiQxNsq8RsPU68QBU+SBjHxT/fFCcDGp4uZb0mFsxkIMKr13qiIR7REgmerdcvVTDEwY9/GyvGjXlAsH8YyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lz71Gmc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M13sQB024879;
	Wed, 22 Oct 2025 05:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVouXcIF0B+9GDu1IJD1Chwg77rf6Ccv50p8A8OLia4=; b=lz71Gmc+cEFS4qFQ
	idldstFAliboagB/Jh57usCXlFAPCQqHc5/Clc5rVyU9MGDsL/0Q/yYehkTq0LnR
	2xQPvYdZel9qRK9UjYkn0oxmvk/3IpMVZOXjJPTpWdj4dNJCNJLWzbH4Gkb5y9Bp
	aGID0La/4WmDhWUDidgPryhGKnnJJ3w300a5JfwanfcY2wYQ2B7Jo2rULILYrpXi
	L+0a5JngXBOdBKTtZgTuIB0Pgi2c/VSlOkpIzaZK6+5DOnKz71QCL3btwkRYq/g6
	qvhuDUaPZ4G6/+OdALRsdSmaty3onflRQ2l0NUN+eNM3yKa1+fjOxxj/PYNAGzGi
	Z8SMkQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws5pwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 05:19:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59M5Jc81026255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 05:19:38 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 21 Oct
 2025 22:19:36 -0700
Message-ID: <abe89411-e590-29df-e9e9-b50402e08aac@quicinc.com>
Date: Wed, 22 Oct 2025 10:49:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
To: Eric Biggers <ebiggers@kernel.org>
CC: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>
References: <20251014093503.347678-1-quic_mdalam@quicinc.com>
 <20251017173835.GA161400@sol>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20251017173835.GA161400@sol>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX2Q91B6HMdjB4
 qnNF9s8i0bIAGy7W/2AP3Glbt13PBsUtUoPpgCufL9vjUPxGQ6ecYOdBs+5xa1hBZGrJml3yPyO
 s9fu3kX41e3SpB5Ac5a7g4GbsV9zWBzswext81rvMdFqH1rrn3zm6uyB4sdkPq8U80zj1n/Wt6D
 RMYjiyBf1WYjVZpNhp3oCoZEm62hLGmli4UDw6mlz44JjAD4+FF2dcIgC+ab8UtqHvj0DNHRhvR
 HgTKK69OLTarMHm+UcmjIS0G52LD2yz8LflFtBZfUp8hZl/P0De3vfsECu/XuRggm/5y7DBjwFD
 zcdRHsw9Xg/73fqJsfET65rs9OgqHc9HOoEBgdYFyAak6AZ22aAFH3VJc1d6N1/WluoxlbAqQVi
 G42MswgthkZffY1Moq8Bc6OFhNVJng==
X-Proofpoint-GUID: efPRh1bhYxCYpkDO7NSIpV_kMWw3sh76
X-Proofpoint-ORIG-GUID: efPRh1bhYxCYpkDO7NSIpV_kMWw3sh76
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f8696c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=Hu2P3Npfd98cobP0X-gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

Hi,

On 10/17/2025 11:08 PM, Eric Biggers wrote:
> On Tue, Oct 14, 2025 at 03:05:03PM +0530, Md Sadre Alam wrote:
>> Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
>> without Command Queue Engine (CQE).This allows hardware-accelerated
>> encryption and decryption for standard (non-CMDQ) requests.
>>
>> This patch:
>> - Adds ICE register definitions for non-CMDQ crypto configuration
>> - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
>> - Hooks into the request path via mmc_host_ops.request
>> - Initializes ICE hardware during CQE setup for compatible platforms
>>
>> With this, non-CMDQ eMMC devices can benefit from inline encryption,
>> improving performance for encrypted I/O while maintaining compatibility
>> with existing CQE crypto support.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> How was this tested?
I tested this using fscrypt on a Phison eMMC device. However, since that 
particular eMMC does not support CMDQ, inline encryption (ICE) was 
bypassed during testing.
> 
>>   #ifdef CONFIG_MMC_CRYPTO
>>   
>> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
>> +			     u32 slot)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct mmc_host *mmc = msm_host->mmc;
>> +	struct cqhci_host *cq_host = mmc->cqe_private;
>> +	unsigned int crypto_params = 0;
>> +	int key_index = 0;
>> +	bool bypass = true;
>> +	u64 dun = 0;
>> +
>> +	if (mrq->crypto_ctx) {
>> +		dun = mrq->crypto_ctx->bc_dun[0];
>> +		bypass = false;
>> +		key_index = mrq->crypto_key_slot;
>> +	}
>> +
>> +	crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, !bypass) |
>> +			FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
>> +
>> +	cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
>> +
>> +	if (mrq->crypto_ctx)
>> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
>> +
>> +	/* Ensure crypto configuration is written before proceeding */
>> +	wmb();
>> +
>> +	return 0;
>> +}
> 
> This would probably be easier to read with separate code paths for
> crypto_ctx != NULL and crypto_ctx == NULL.  Also 'bypass' should be
> inverted and renamed to 'crypto_enable' to match the bitfield.  Or just
> prepare the bitfield directly, without an intermediate variable.
Thanks for the suggestion. I agree that separating the logic based
on crypto_ctx presence improves readability.I’ll refactor the function
to use distinct code paths for crypto_ctx != NULL and crypto_ctx == 
NULL, and rename bypass to crypto_enable to better reflect the bitfield 
semantics.I’ll also remove the intermediate variable and prepare 
crypto_params directly as recommended.
> 
>> @@ -2131,6 +2185,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>   	struct cqhci_host *cq_host;
>>   	bool dma64;
>>   	u32 cqcfg;
>> +	u32 config;
>> +	u32 ice_cap;
>>   	int ret;
>>   
>>   	/*
>> @@ -2185,6 +2241,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>   	if (ret)
>>   		goto cleanup;
>>   
>> +	/* Initialize ICE for non-CMDQ eMMC devices */
>> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
>> +	config &= ~DISABLE_CRYPTO;
>> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
>> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
>> +	if (ice_cap & ICE_HCI_SUPPORT) {
>> +		config = cqhci_readl(cq_host, CQHCI_CFG);
>> +		config |= CRYPTO_GENERAL_ENABLE;
>> +		cqhci_writel(cq_host, config, CQHCI_CFG);
>> +	}
>> +	sdhci_msm_ice_enable(msm_host);
> 
> This is after __sdhci_add_host() was called, which is probably too late.
ok,I’ll move the ICE initialization earlier in the probe flow, ideally 
before __sdhci_add_host() is called.
> 
>> +#ifdef CONFIG_MMC_CRYPTO
>> +	host->mmc_host_ops.request = sdhci_msm_request;
>> +#endif
>>   	/* Set the timeout value to max possible */
>>   	host->max_timeout_count = 0xF;
> 
> A lot of the code in this patch also seems to actually run on
> CQE-capable hosts.  Can you explain?  Why is it needed?  Is there any
> change in behavior on them?
Thanks for raising this. You're right that some parts of the patch 
interact with CQE-related structures, such as cqhci_host, even on 
CQE-capable hosts. However, the intent is to reuse existing CQE 
infrastructure (like register access helpers and memory-mapped regions) 
to configure ICE for non-CMDQ requests.

Importantly, actual CQE functionality is only enabled if the eMMC device
advertises CMDQ support. For devices without CMDQ, the CQE engine 
remains disabled, and the request path falls back to standard non-CMDQ 
flow. In this case, we're simply leveraging the CQE register space to 
program ICE parameters.

So while the code runs on CQE-capable hosts, there's no change in 
behavior for CMDQ-enabled devices — the patch does not interfere with 
CQE operation. It only enables ICE for non-CMDQ requests when supported 
by the platform.

Thanks,
Alam.


