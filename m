Return-Path: <linux-arm-msm+bounces-73336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE8B54E33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0D031706C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA5B2F60A2;
	Fri, 12 Sep 2025 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aUQFJ6FW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE10F266580;
	Fri, 12 Sep 2025 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757680591; cv=none; b=Z7Uy4E5VF7Dv5RgI0a1xPSokkYguRhCbCeSufaE895BtafDGF3MsTpsgi7WwM8Yrmo81U102OWX2Xtpx73ENHOFwEQoMS0YVTctEKAH4djBR80+JJVwj2yIPsk5y/WOnXF21zmjAyzwKiktIRZAke0Di4qEciKFe9xuTtHI74oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757680591; c=relaxed/simple;
	bh=KBSKvgzQM+uToowdLKkGQt9mlmXtmRWxyLBd+zjEUs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ATCjfpW1FUjE4jchQDIxjcApxQbkpc9sA6srdDWPJWbCxVs/jiJgX7t4tznOsTTohd1Z2/M2CjdO9T4StrDlk2V3tbtlbrK6wztKYftD0PYaX4aLntWEYm5PLNGfaeemDCBrYadUdGWuwFNcZOmZDNXrSIatJX0nYEGUDA7tvD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aUQFJ6FW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fPLa012864;
	Fri, 12 Sep 2025 12:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TM/zX5eSEzK2viF3xhcq18OHrcoIfl3jdPumArQ2nmc=; b=aUQFJ6FWT7aF0eHq
	a80GygDyh7HUd+b1JJ7z4EC0xcbxsAYJJs0x7nOTfIqj4yyn/ESTirRkEYl41VzU
	XjDsM1B3tPl8YWtiTtKmz2rbxn7jlhjzg4T0di/HXAfk214gtNYpTuZh/kIEUioW
	xZJ9zJNm46TpWCeu6J7bGfA9mS9x7inNMkiruyfwpm1PfFwLkZCCIt46MKs/I28Q
	h6F7JyyHnL698o5J6q2ei0a1wFmg+H5/Ob6nvFb/82EDCTxyTRoLELGXKgSSUWQv
	/U4QQijv3qd0Ht2YBZWVIdA2mwd7AMVpuzUOiaL1K6oQP0Vc4TjJFtkDhz8VY0B5
	MKajrw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgbbyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:36:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CCaPA1014964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:36:25 GMT
Received: from [10.249.19.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 12 Sep
 2025 05:36:23 -0700
Message-ID: <3e827dd4-7e32-4d05-b113-87bb5175431c@quicinc.com>
Date: Fri, 12 Sep 2025 18:06:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] bus: mhi: host: pci_generic: Support independent
 DMA mask for VFs
To: Manivannan Sadhasivam <mani@kernel.org>, <Vivek.Pernamitta@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
 <20250821-vdev_next-20250821_sriov-v3-6-e1b017c48d4a@quicinc.com>
 <adba44ewxcgndetgggknfgqzr7ndagmj5fk72w3rgnfn4d7xe6@ulkzzei25qed>
Content-Language: en-US
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <adba44ewxcgndetgggknfgqzr7ndagmj5fk72w3rgnfn4d7xe6@ulkzzei25qed>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jjCkRbjSA8rCKoR3mQJGL8hjPfvwiUB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXwLxgcqCfC842
 6lEOM8h2NstLh3uaT7t/m8pJL396/ZqcaMFUZcl3TCc2LiKPXQcluMFyscww1UnrTs6MxF0tb31
 rolcW/vELWyKziCPTWqdw2NZP3ucydhYXB/HPi0UKYhKvOcfhLLMTPAoyk65qlURclhDJqGjzw/
 cLqPc7zDi2ple3phIMRk1IXVRW9ieo8j6xlzh7xrP7y+vUeprRRlNQOsc9cxTNr4w6Cg1AoSjKV
 dFVvPP6jksUOxp+XsFPHX3YdBuQrJ3Z722y7bbltqcKNGGhNmCJ+613VT3KmAt3HQ8rqTy/q2en
 dyfqnXqmD534Q9uUIyVQi7vgE5rx6Ko6waqCvF7M5Ll80Ovp1J5vvBo9qEQotlkfjQovmYF7a2P
 d4s7YAd4
X-Proofpoint-GUID: jjCkRbjSA8rCKoR3mQJGL8hjPfvwiUB8
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c413ca cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=1XnyBS-o4O3ZFCXfC1MA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035



On 9/5/2025 8:33 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 21, 2025 at 06:25:38PM GMT, Vivek.Pernamitta@quicinc.com wrote:
>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>
>> Certain devices like QDU100 bootloader support only up to a 32-bit DMA
>> address range. However, Virtual Functions (VFs) are enabled only after
>> the device enters Mission Mode and can support higher DMA address ranges
>> (up to 40 bits).
>>
>> A 32-bit DMA mask limits addressable space to 4GiB, which is insufficient
>> for data transfer requirements over VFs on platforms like QDU100. These
>> devices require larger memory regions to be mapped for efficient VF
>> operation.
>>
>> To address this, configure `dma_mask` independently for Physical Functions
>> (PFs) and Virtual Functions (VFs), allowing VFs to use higher DMA mask
>> values where supported.
>>
>> As per PCIe SR-IOV specification (rev 0.9, Section 1), VFs are capable of
>> handling resources associated with the main data movement of the Function.
>>>> This change ensures compatibility with bootloaders that have limited DMA
>> capabilities while enabling full VF functionality once the device reaches
>> Mission Mode.
> 
> Compatibility is with the existing non-SR-IOV devices, isn't it? How does
> bootloader comes into picture for them?
> 
Set "vf_dma_data_width" explicitly for SR-IOV devices where VFs support
64-bit DMA but PFs do not. For non-SRIOV devices, this flag should 
remain dma_data_width unset and defaults to zero.  If both bootloader
and HLOS support the  same DMA width and for non-SRIOV device, set the
flag "dma_data_width" alone to the maximum supported bits to ensure
compatibility and performance.> - Mani
> 



