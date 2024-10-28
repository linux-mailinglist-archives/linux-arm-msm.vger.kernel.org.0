Return-Path: <linux-arm-msm+bounces-36096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500D9B22AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 03:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33CB21C20356
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 02:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988F015442D;
	Mon, 28 Oct 2024 02:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iqnzIY1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F524BA2E;
	Mon, 28 Oct 2024 02:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730082295; cv=none; b=PxGSHspZbXwUa7Qgnht6XqADmpSTWp78T4j/nMgGf8MiA4298sJ+Z9TLjsx0F0AYMAbjQ/Y5A7TA0XwYvA7EsTTwwnMBj0HpyOcocTvOy6MR7OR1JK4Bqk1T6nsSMW/bKKr+d0pGYDzxc0WvTTA/MBdFsBHhLIkf0UMiRSkmHEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730082295; c=relaxed/simple;
	bh=HppDK1KBHgwXWd97r4y7pDQyIQn+aZh+fNatrCH9F5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xy3zx1eAVcKX8QfyMUy8U3aNeWl23YlHJ8lkVHDFoqdZIzYcJHVjjfdMTVrVHaxNaDUOJXLPUVzj6ttji9SgpRKi9jF9Hd5D1rxrKOdmglftnL6u+KkFR5zDrVVNCCD1e8aLi/o0TSAgcg6mBXg5be0t1C/WIEZHlRfy3IfVrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iqnzIY1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S0oV2C017701;
	Mon, 28 Oct 2024 02:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkDjI98CtlrdRe7sP1PxE3fSr+qwlpfBpu6cO6fteoE=; b=iqnzIY1cYqa3dBwS
	xJ4caoGgF1YX+t91/gewQ8lHy81Nq4gKaGWAfPYh+Ij5W7tIR8+SUH65DtGsFvrD
	wdkkG9/L11Oc2++9azlO/IA/Ir59g3TWE1R5sxt4PLCNO5RJt6/Sg6frMX6eLzRY
	jkhkVmFkuSilwdhs+CI2uJb2c0n5UcHfevivsay3czVDVgfKq8WdBpqfmXADs+n0
	Mq4C6vg+OBb5FesRdE/g4chxQHiOskLu5w0iM7EnB/XT3myj7ts5fM9R/v1EpHlw
	xHhZJQM6pyQCWRYk9JZSegn0fvN8o11pmDhurC5GRtgvmY2nBxfm2t1ds4TExWAZ
	MjFGPA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgubd23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 02:24:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S2Omko006283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 02:24:48 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 19:24:45 -0700
Message-ID: <40418fcd-7bdd-4bfb-b0b3-60d9f4665fe3@quicinc.com>
Date: Mon, 28 Oct 2024 10:24:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: llcc: Add LLCC configuration for the
 QCS8300 platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>
References: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
 <20241010-qcs8300_llcc-v2-2-d4123a241db2@quicinc.com>
 <8e49de35-59dc-4308-b93a-19791e6b05e2@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <8e49de35-59dc-4308-b93a-19791e6b05e2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3r95bpphilHtf2_nbJkOrPm68I9eGXsV
X-Proofpoint-GUID: 3r95bpphilHtf2_nbJkOrPm68I9eGXsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410280020



On 10/26/2024 1:41 AM, Konrad Dybcio wrote:
> On 10.10.2024 12:08 PM, Jingyi Wang wrote:
>> Add LLCC configuration for the QCS8300 platform. There is an errata on
>> LB_CNT information on QCS8300 platform, override the value to get the
>> right number of banks.
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 72 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index a470285f54a8..d867b1596725 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -2225,6 +2225,56 @@ static const struct llcc_slice_config sm8650_data[] = {
>>  	},
>>  };
>>  
>> +static const struct llcc_slice_config qcs8300_data[] = {
> 
> This part looks good and in line with the data I have
> 
> [...]
> 
>>  
>> +	/* LB_CNT information is wrong on QCS8300, override the value */
>> +	if (of_device_is_compatible(dev->of_node, "qcom,qcs8300-llcc")) {
>> +		num_banks = 4;
>> +		drv_data->num_banks = 4;
>> +	}
> 
> This, please rebase on <20241025-sar2130p-llcc-v2-0-7455dc40e952@linaro.org>
> and reuse the thing added there

Well noted, thanks for review.

> 
> Konrad

Thanks,
Jingyi


