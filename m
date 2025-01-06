Return-Path: <linux-arm-msm+bounces-44041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1123A030FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 389233A15E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 19:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9561DE898;
	Mon,  6 Jan 2025 19:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EFjSanqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45778F4F;
	Mon,  6 Jan 2025 19:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736193431; cv=none; b=M/GVLmveBMc8vZN8/n2I+bptIT38+4UwfoG85M/jzlxXCh55PARHP9cLAdXRuYKEhrYzgjFQWYqW/s7LS3ojiXHuLBW1VS2osyJaBZvK5Y4Vrziy45C40Q3DFm+2Qrb6gowdLRicQJhzAAehU5gY1xspj9C5vpVq4XSKFc4YYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736193431; c=relaxed/simple;
	bh=cuTAaaIJl04Nwj/BHPUUvpgSukF/+Fu8MFH0SCI9sS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fSh2un9P/iXys7dTqx8HDCbqCwy9qBug+6OiaGpiSWkFUmtTi6eGNcAgs4+hvmSlNpYnWDtRTrF6Z6M03qb/gaFNCtHUxzBNgissHHPkKFxoWfWEB1aspJWDqS+mDp8zkpxuRdvxQ9maeY6ypZZpHmwLTKRL/iaTg7cV35pPWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EFjSanqZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Hs7bi012374;
	Mon, 6 Jan 2025 19:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lPdilwo+QhMMfvpXyfNHKRsssqAoV761VQVuxuRaY6k=; b=EFjSanqZ9FwGeuy3
	QsuB/7ttIllVuJ4VxZO+ycGPZwrU3E7az9z6ItAFhyBcdpF3pbMx7erDcSMgwDZw
	AOULf6Mr/7+Fz/sdCdZ1LCtqmX2HrgPY6iPZlTiOBnpFAjQPtHTgOsRHXwEwVHCT
	JQU6A1AFHyRpH10RYl7K3yOw1fql3z1uLm+oAzdZ3iBvwJ/3K8ewTNTkY7rSxI9H
	4GGe9dNFMcs5cjE8RAx8RSRjVcNTFKfQNe1SNSeIQhk5+4i002BomJsfl05ya0F8
	Eyr6KWTtbpPIBM/zFr9J9PcqayOaLQFWcrNL+zG9HlO4+Kj+RRKmZNugqwuXKHYS
	197ofQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440kyqg7w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 19:57:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506Jv415022603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 19:57:04 GMT
Received: from [10.216.24.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 11:57:01 -0800
Message-ID: <f20bfb0d-9369-45b0-9577-835739e7b30a@quicinc.com>
Date: Tue, 7 Jan 2025 01:26:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] nvmem: qfprom: Ensure access to qfprom is word
 aligned
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Naman Jain
	<quic_namajain@quicinc.com>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
 <20241027-sar2130p-nvmem-v2-1-743c1271bf2d@linaro.org>
 <60068361-ddb7-4906-84ca-195e5eb13a0f@linaro.org>
 <plemc4swba7ybrncyxt3axxpb3qjbdktfkt7kqt3dqymlusfpq@sfgwakjp7z3g>
 <7924984d-57e9-40f8-8998-b37d6e1bc78c@quicinc.com>
 <4ajn23p7tbc2csspcfodl3keavl57luuvnnux3dbdhyn7d57ji@ypptsltflwtn>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <4ajn23p7tbc2csspcfodl3keavl57luuvnnux3dbdhyn7d57ji@ypptsltflwtn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8H_wEd9-SveHuWMAD_Sf8mY7femrji-p
X-Proofpoint-GUID: 8H_wEd9-SveHuWMAD_Sf8mY7femrji-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060173

On 1/4/2025 1:10 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 30, 2024 at 01:13:08PM +0530, Akhil P Oommen wrote:
>> On 12/9/2024 4:23 PM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 09, 2024 at 09:55:14AM +0000, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 26/10/2024 23:42, Dmitry Baryshkov wrote:
>>>>> From: Naman Jain <quic_namajain@quicinc.com>
>>>>>
>>>>> Add logic for alignment of address for reading in qfprom driver to avoid
>>>>> NOC error issues due to unaligned access. The problem manifests on the
>>>>> SAR2130P platform, but in msm-5.x kernels the fix is applied
>>>>
>>>> Is this only issue with SAR2130P?
>>
>> This is applicable to all chipsets with sys arch newer than Snapdragon 8
>> Gen 1.
>>
>>>
>>> I don't know. I know that it manifests on SAR2130P, but in the vendor
>>> kernels the fix is applied to all the platforms.
>>>
>>>>
>>>>> uncoditionally. Follow this approach and uncoditionally perform aligned
>>>>> reads.
>>>>
>>>> If there is a need of having proper register alignment this should go as
>>>> part of the nvmem_config->stride and word_size configuration and not in
>>>> reg_read callbacks.
>>>
>>> Thanks, I'll explore that option. Indeed, it might be easier to handle.
>>
>> Dmitry, any update here? I need similar change for X1E GPU speedbin support.
> 
> Excuse me for the delay, I've sent v3, reworking the series as
> requested:
> 
> https://lore.kernel.org/linux-arm-msm/20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org/
> 

No issues. Thanks a lot for getting this done.

-Akhil.

