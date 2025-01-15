Return-Path: <linux-arm-msm+bounces-45173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED1A12E94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 23:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 391C67A20F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143FF1DD9AC;
	Wed, 15 Jan 2025 22:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gNj6V44A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB121DBB19;
	Wed, 15 Jan 2025 22:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981380; cv=none; b=rMBZEKLzqD/aQuEadNsI3Qo0p5bJNcsp90z+EljDdZKJ++Sg+SVo7ZfaaC5foLMRz/e4fdaR2EUC6dKyUhWgBfDM1iVI0y4MvzSUnVfyhu12I5PwBBUH2Tij9siMBE5wzrCVn3c9wiP2Z5uUgxv1kj1XF+iiY6+pp2t3IEoHaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981380; c=relaxed/simple;
	bh=awYzrvw5K7N10iDXPmgUJgSZrH8kkk/YRPs1LW6lSzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K8ARY9iGLueaZV8AzLBcTm9CZbdR0brimw7dZUgkni/bdCBrI3JLWBkFLYP73eHsep0T4s4Mi5i37YkT6EEPt02tNJt7n8eo0DMiNR+D1jPO4iX6qtjs0XlUMU9sLzGWxOgtJzwP9MutJfjpk/U8d4Faf3DOkXqZcnNLYiqRfO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gNj6V44A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGn6MQ028620;
	Wed, 15 Jan 2025 22:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNcfcOWOlHJf7XjfEO0wlw7NHN7UYQn74G1Y5pAf5zk=; b=gNj6V44Ak76iwp3L
	wNtZgCKTuqatlcGa6No88inUoGiwxhBCwe4+0wPPH5quDjps9bsPC8dNziZ5qzkY
	IEaYHWQH2kXptoRdoAjoJnz/X2MHh3dwgsPN5lDQUNylEcFxMZkU7D9FerD2tFHP
	SyloPLDGzogUC7bLm4ur0/TDsxQ6NHF1RsZ8dsca4bUaz7R1aPF7G7zBVRIKJ/MX
	ioVBSrBflUVRu4b0k3LRDJhCvDACuFTuEEu9FAFNYYbb/LcxwxA4IJP6bCPMPM5t
	NIpqlgXTFfZkc2ICXQOPJTRChgqvv9gh1iYPB32wL/bV0kZq6IRtzNa+ByYoArvb
	3DPBsA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446fgm0yrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:49:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FMnYiG019819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 22:49:34 GMT
Received: from [10.110.66.9] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 14:49:33 -0800
Message-ID: <691fef7d-fa48-46bf-b4b6-741d6b87a2d2@quicinc.com>
Date: Wed, 15 Jan 2025 14:49:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>
 <ididns3nh3zcokenxdutxgzotmegmhgmtbxokt7tsicd3ja6rw@v35fmdneranv>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <ididns3nh3zcokenxdutxgzotmegmhgmtbxokt7tsicd3ja6rw@v35fmdneranv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Av69NWTNx7ubGn2XtVNn1Zy1xwZQ-ShK
X-Proofpoint-ORIG-GUID: Av69NWTNx7ubGn2XtVNn1Zy1xwZQ-ShK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_10,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=951 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150163



On 1/14/2025 2:58 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:26:41PM -0800, Melody Olvera wrote:
>> Add support for LLCC V6. V6 adds several additional usecase IDs,
>> rearrages several registers and offsets, and supports slice IDs
>> over 31, so add a new function for programming LLCC V6.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   drivers/soc/qcom/llcc-qcom.c       | 212 ++++++++++++++++++++++++++++++++++++-
>>   include/linux/soc/qcom/llcc-qcom.h |   8 ++
>>   2 files changed, 216 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
>> index 8e5d78fb4847a232ab17a66c2775552dcb287752..7a69210a250c4646b7fd6cf400995e35d3f00493 100644
>> --- a/include/linux/soc/qcom/llcc-qcom.h
>> +++ b/include/linux/soc/qcom/llcc-qcom.h
> These are not relevant to v6 support, move them to the platform-support
> patch.

Will do.

Melody
>
> LGTM otherwise.
>
>> @@ -24,6 +24,7 @@
>>   #define LLCC_CMPTDMA     15
>>   #define LLCC_DISP        16
>>   #define LLCC_VIDFW       17
>> +#define LLCC_CAMFW       18
>>   #define LLCC_MDMHPFX     20
>>   #define LLCC_MDMPNG      21
>>   #define LLCC_AUDHW       22
>> @@ -67,6 +68,13 @@
>>   #define LLCC_EVCS_LEFT	 67
>>   #define LLCC_EVCS_RIGHT	 68
>>   #define LLCC_SPAD	 69
>> +#define LLCC_VIDDEC	 70
>> +#define LLCC_CAMOFE	 71
>> +#define LLCC_CAMRTIP	 72
>> +#define LLCC_CAMSRTIP	 73
>> +#define LLCC_CAMRTRF	 74
>> +#define LLCC_CAMSRTRF	 75
>> +#define LLCC_CPUSSMPAM	 89
>>   
>>   /**
>>    * struct llcc_slice_desc - Cache slice descriptor
>>
>> -- 
>> 2.46.1
>>


