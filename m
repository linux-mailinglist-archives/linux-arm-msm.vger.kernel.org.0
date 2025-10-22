Return-Path: <linux-arm-msm+bounces-78264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16033BFA3D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244025841B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A87258CD7;
	Wed, 22 Oct 2025 06:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fj7u6riz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E18257824;
	Wed, 22 Oct 2025 06:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114771; cv=none; b=XKecX4GH/LUNwJhe+PrnUAqhnhBVNXWUPM37v4YT7bOVaaypmUa0ulzkArnirq7mONaANfBt3UIjnKzT9xWw58BsQ4FYySY4LstNT1RiW5/9bmCz2KqL0PALJsDoDH7yPzwKP0a+eHEOT1Dn8EKRKEKExCcjkKuxcqt6e0idxMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114771; c=relaxed/simple;
	bh=1JnHfOV4IvevfzpMfmgMYqooT7fC1cCkYt1qDcXQgOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a/KybNbZ92LzAWNF5VpiF9APbVHnWXcgGAIVf4bOMAujcStrRvXRatASxPTg6tlIArY0U34QG/fWINJ3yYw8z7nr2IWKFcTQVoQtQ0YJNn4n8k9j7RlHl98BI/Xo5tU8uF7px3nE+92P8KhUb4iZ5pP2wlUZbn+E6XgpZ851p04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fj7u6riz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LKgDM9013721;
	Wed, 22 Oct 2025 06:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dct3COhVkJFr6yTQnEDNUn/FsivVgtFabRy7y3fVd0Y=; b=fj7u6rizNZQeaAFF
	Cv2FMOfVQbUXznnYcZlDFQ2mZ9dPCZpnL33xFFHiav+ggfRYZN1w7asAIf5D0T6u
	3CCkWwf/nwIOGmm4PBmwS7k5sScVEJ1vPuNyB1vWZXzPicJOTutkHATKcXy7bbv4
	1eeK4bFgE3KMAKh2YsvgYS45VVI+DW+LYFjyFSJg1cfCBqQCB4wkclNdH0NDuSiO
	KkS00H0eWf6kNKjEMZwGolDPfgyKPqF0qyMmZOh7FZrkfU7mxU2X4niYfkVa255b
	b+B9AfmxKMH6YCtFRH1VgDcAycPzDeTDIKMLaAsdphTYrzmT3TrO7NMp/80Orrv2
	Np/DmA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0hbww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 06:32:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59M6WfGg022742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 06:32:41 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 21 Oct
 2025 23:32:38 -0700
Message-ID: <2efdad85-ba50-1246-e60b-eadbb82c88e6@quicinc.com>
Date: Wed, 22 Oct 2025 12:02:35 +0530
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
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
CC: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>
References: <20251014093503.347678-1-quic_mdalam@quicinc.com>
 <20251017173835.GA161400@sol>
 <abe89411-e590-29df-e9e9-b50402e08aac@quicinc.com>
 <20251022054423.GB35717@sol>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20251022054423.GB35717@sol>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX35U7UAj9ocVk
 bnJB/Dh+xICWVk6HViNXov4bjuV8l0jIVWZ182CGU0Ec4mRe/nYFk0Ik26WZRgje81wdAuWx/oI
 n+Pv7oo+gJgFl1z9woBMvQQA6LrVrDpYPkb04dSTGwXg2b+fjdpPAXLtbtXM57ooCMSEgMZLIzT
 D7GtbPbvE4+CbLxBJqKbUD+jO4+WWn0Ck4OMHTQctre+5/ol1LeO4dDpXrNR/7SBwPUwBTqN/p7
 hXoK5KnG6FivcSwQzLmhK7ROmXhLp1fGhCz1jNqhGDRrQhbAsEtAy2cXoZTM+H1YvTfuMTTFNJ/
 OM/cMnOrhNXbkAdYEwQGhXBrTPjB1SZB88CMRYnnCRXHDJftQKpBeRMcUax0NICVmo6AMzuBDxh
 gl3sCWIb/IzJ9UsrmWJbdHovqIc42w==
X-Proofpoint-ORIG-GUID: BBrXJ7h-aOUJO-chHG_3Izb3MvrWu8lp
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f87a8a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EJYGbfWKLoEB_OVLp_sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: BBrXJ7h-aOUJO-chHG_3Izb3MvrWu8lp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

Hi,

On 10/22/2025 11:14 AM, Eric Biggers wrote:
> On Wed, Oct 22, 2025 at 10:49:23AM +0530, Md Sadre Alam wrote:
>> Hi,
>>
>> On 10/17/2025 11:08 PM, Eric Biggers wrote:
>>> On Tue, Oct 14, 2025 at 03:05:03PM +0530, Md Sadre Alam wrote:
>>>> Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
>>>> without Command Queue Engine (CQE).This allows hardware-accelerated
>>>> encryption and decryption for standard (non-CMDQ) requests.
>>>>
>>>> This patch:
>>>> - Adds ICE register definitions for non-CMDQ crypto configuration
>>>> - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
>>>> - Hooks into the request path via mmc_host_ops.request
>>>> - Initializes ICE hardware during CQE setup for compatible platforms
>>>>
>>>> With this, non-CMDQ eMMC devices can benefit from inline encryption,
>>>> improving performance for encrypted I/O while maintaining compatibility
>>>> with existing CQE crypto support.
>>>>
>>>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>>>
>>> How was this tested?
>> I tested this using fscrypt on a Phison eMMC device. However, since that
>> particular eMMC does not support CMDQ, inline encryption (ICE) was bypassed
>> during testing.
> 
> What do you mean by "inline encryption (ICE) was bypassed during
> testing"?
By "inline encryption (ICE) was bypassed during testing," I meant that 
encryption was not working because ICE was only being enabled in the CQE 
request path (cqhci_request). For eMMC devices that do not support CMDQ, 
the mmc core sends requests via the legacy path (sdhci_request), where 
ICE was not being configured.
> 
>> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
>> +			     u32 slot)
> 
> Could you also remove the unused 'slot' parameter from this function?
Ok
> 
>>>> @@ -2185,6 +2241,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>>>    	if (ret)
>>>>    		goto cleanup;
>>>> +	/* Initialize ICE for non-CMDQ eMMC devices */
>>>> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
>>>> +	config &= ~DISABLE_CRYPTO;
>>>> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
>>>> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
>>>> +	if (ice_cap & ICE_HCI_SUPPORT) {
>>>> +		config = cqhci_readl(cq_host, CQHCI_CFG);
>>>> +		config |= CRYPTO_GENERAL_ENABLE;
>>>> +		cqhci_writel(cq_host, config, CQHCI_CFG);
>>>> +	}
>>>> +	sdhci_msm_ice_enable(msm_host);
>>>
>>> This is after __sdhci_add_host() was called, which is probably too late.
>> ok,I’ll move the ICE initialization earlier in the probe flow, ideally
>> before __sdhci_add_host() is called.
>>>
>>>> +#ifdef CONFIG_MMC_CRYPTO
>>>> +	host->mmc_host_ops.request = sdhci_msm_request;
>>>> +#endif
>>>>    	/* Set the timeout value to max possible */
>>>>    	host->max_timeout_count = 0xF;
>>>
>>> A lot of the code in this patch also seems to actually run on
>>> CQE-capable hosts.  Can you explain?  Why is it needed?  Is there any
>>> change in behavior on them?
>> Thanks for raising this. You're right that some parts of the patch interact
>> with CQE-related structures, such as cqhci_host, even on CQE-capable hosts.
>> However, the intent is to reuse existing CQE infrastructure (like register
>> access helpers and memory-mapped regions) to configure ICE for non-CMDQ
>> requests.
>>
>> Importantly, actual CQE functionality is only enabled if the eMMC device
>> advertises CMDQ support. For devices without CMDQ, the CQE engine remains
>> disabled, and the request path falls back to standard non-CMDQ flow. In this
>> case, we're simply leveraging the CQE register space to program ICE
>> parameters.
>>
>> So while the code runs on CQE-capable hosts, there's no change in behavior
>> for CMDQ-enabled devices — the patch does not interfere with CQE operation.
>> It only enables ICE for non-CMDQ requests when supported by the platform.
> 
> So, we're dealing only with hosts that do support a command queue, but
> support eMMC devices either with or without using it?
There are two cases where ICE support is needed without CMDQ:

1) The eMMC device does not support CMDQ, but we still want to use ICE 
    for encryption/decryption.

2) The host intentionally disables CMDQ, even if the eMMC device 
supports it, and wants to use ICE in the legacy (non-CMDQ) path.

This patch addresses the first case — enabling ICE for devices that lack 
CMDQ support. I'm currently working on the host-side logic to support 
the second case, and will submit that separately.

> 
> Could you explain why sdhci_msm_ice_enable() is called twice: once from
> sdhci_msm_cqe_add_host() and once from sdhci_msm_cqe_enable()?
Thanks for pointing this out. sdhci_msm_ice_enable() is called twice 
only when the eMMC device supports CMDQ — once during 
sdhci_msm_cqe_add_host() and again in sdhci_msm_cqe_enable(). For 
non-CMDQ devices, it is called only once.

Since the function primarily performs register configuration, the second 
call effectively reprograms the same values and has no functional side 
effects. That said, I’ll look into adding a condition to avoid redundant 
configuration when ICE is already enabled, to make the flow cleaner.

Thanks,
Alam.

