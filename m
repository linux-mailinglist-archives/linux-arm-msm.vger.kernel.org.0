Return-Path: <linux-arm-msm+bounces-54273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F3CA88FE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 900617AA4C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 23:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67ECA1F4180;
	Mon, 14 Apr 2025 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a86v1JiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0FE1F3BAB;
	Mon, 14 Apr 2025 23:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672076; cv=none; b=kuxjIz49eSbH0h5EdLdepRgu+uVrdLX6n6FercXC9ayUv9d1izNt9zb53kCWkAkEXq/LKCifv8YsSSMTfC+ftSV/+0hcWGWUlEnaRscudDqfsUSawsrVlFnJbNSaHRMpB5rV5QoiGDq22O6/Cgbjha7pRU43fn3jFvR+zngWn4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672076; c=relaxed/simple;
	bh=pdohs8XjjtXgKPx35fyVy8Lq8yyCfOTR2OR3dtGJgGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NiAmKdao+5R2LJSJf0JoRjkxIPtrJCRd73P54Us3CSSXKMD00qbKGpKjwiw0h+bZkuV9XPww9fzXKYJjjgejidBsjc1ek9bYZdDiI2WMT0IMhud81256zGOMG++Iltr1TO6rAzQJRY//6LAZB+0/ps81n6yQsjUTSD0cNisaiEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a86v1JiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKe2qL026322;
	Mon, 14 Apr 2025 23:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smbDjsn4I0f5lxymO+nMDRzDQGKePRBCFUmhofM/1wA=; b=a86v1JiFIhf1wzZP
	i+5ApOADexfGBtQoeDJr/9nZJ7GO0iv9VBLpWlW73BUEpPRxgBarTLR7S6caPXJ8
	Owr+mnwkRkiVX7FuiSfdw7VlRMB8F9sGRQ3hRnHD76FosbkfCIx/VBPgMk/i5mwD
	5tYXgDJIbjxf+W37m4CaMnetBBdURR7jk1dUy21md6ALT4GO0meX8pomJ4jlMpye
	1NZ61KEx2kef/gHtODCTTq6HAXtHtm5zytCf+4tFJ3ONivwK9giUvSo6Lr+7thzC
	R/ncsm0Bp84EVgKwxHHzPuUGPC1R01yXGT61NWTA4hXPFUyMnigLENTQJHUm9fFs
	+5RBvA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjww5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 23:07:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EN7pvE029393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 23:07:51 GMT
Received: from [10.71.109.146] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 16:07:50 -0700
Message-ID: <cb36624d-a990-468a-b16b-32b2488af845@quicinc.com>
Date: Mon, 14 Apr 2025 16:07:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] soc: qcom: llcc-qcom: Add support for SM8750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
 <20250324-sm8750_llcc_master-v3-3-2afd5c0fdbde@quicinc.com>
 <1b783592-e59a-4e85-b727-d38b11411a9c@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <1b783592-e59a-4e85-b727-d38b11411a9c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fd9547 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=zUQA3q2U9849VbpNnzkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Or3OE_B8DJj8we5BP8I6AR9fH8hx_MEj
X-Proofpoint-ORIG-GUID: Or3OE_B8DJj8we5BP8I6AR9fH8hx_MEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=794 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140167



On 4/14/2025 6:24 AM, Konrad Dybcio wrote:
> On 3/24/25 9:29 PM, Melody Olvera wrote:
>> Add system cache table and configs for SM8750 SoCs.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> [...]
>
>> +		.usecase_id = LLCC_WRCACHE,
>> +		.slice_id = 31,
>> +		.max_cap = 512,
>> +		.priority = 1,
>> +		.fixed_size = true,
>> +		.bonus_ways = 0xffffffff,
> This should still be .activate_on_init = true
>

Apologies; must have missed this when redoing the table. Will fix.

Thanks,
Melody

