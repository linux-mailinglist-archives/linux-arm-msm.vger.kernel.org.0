Return-Path: <linux-arm-msm+bounces-37865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D5B9C81EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 05:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B57F6B22579
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 04:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C9613D53E;
	Thu, 14 Nov 2024 04:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KknA3UGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C502C20E3;
	Thu, 14 Nov 2024 04:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731557843; cv=none; b=oXZGuxeX2RbPRl9WCxKRqY1jjAF5EKjJgpLve42+YhcJQ14ZbZFCpCseRFxTcvNXE2pwEuAsps0vt1YiisBQlnkRSDbjEPQmW/BmDANZBW/4xpJi7jKpizaSTosxwHIpReQbjkdLeawd2oqf5BiZBGrTcaz+f83EyLMdGLrWVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731557843; c=relaxed/simple;
	bh=B31agc7d/Ok0lJtdRd9XqfcsCXO//+xKLtENY+JRcCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EO/EOCWuyI3v0zcUI/Ai3aNvOp+TZm/l08QXzlyVjmf69GYhn5Piayf+KemfJE+2Wct9kx1H08n2JhVV92HP2Sg4veZlY6nG3/x5ihPKlnBxTB89GTY9ZIa2uG7pvq1PrtJbLjnhWaV2ItTYX1E4hzd3sB5gdvKNcPodZRAY+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KknA3UGQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADI08lg028186;
	Thu, 14 Nov 2024 04:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BcfKFb85QUyDdn8VrM3S/rbTM9JaBHQIgeIkoC/Kz5o=; b=KknA3UGQNVpqjGR1
	DHyM3kZjE7fmAQnZJbuH4973blgEjxZqXC5EpvOuMojvRBHLj2kDAMaYhsarnbPf
	Ccxc1DmeytKB/m1m1xmPRshYuWJh3XYRBRwpgta7MEXnqn5AnWKC6sY5Hp6sgP22
	5EtUJ29pSj4GAMhD7I5x0In1Dr98/SE7PIHPq4cmQjpkF/gT8eHGJhWSmd9jtGL/
	of31z5VTkX/zaLORCKQr3UdlRYsr2GneR4s/5vddO03mmkHGj/HEbRVpcTPpSAAA
	lQbUQYeqDvCYJvGauW/5kThq/ghnhAVsmUxoKnGPnyf3+ckty3EuzHyZjWb5tUjW
	gDQvog==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10jsajp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:17:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE4H73n010073
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:17:07 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 20:17:03 -0800
Message-ID: <8607e5a5-cec6-d228-cc4c-aa38ae14318f@quicinc.com>
Date: Thu, 14 Nov 2024 09:47:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <e77acdfe-43b9-a28b-11e4-2ffb481c4078@quicinc.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <e77acdfe-43b9-a28b-11e4-2ffb481c4078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MafgbSD4ywRxQufJDt9VHEIbvXzx1FI2
X-Proofpoint-GUID: MafgbSD4ywRxQufJDt9VHEIbvXzx1FI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140030



On 11/7/24 03:48, Jeffrey Hugo wrote:
> On 10/7/2024 12:10 AM, Sibi Sankar wrote:
>> diff --git a/include/dt-bindings/firmware/qcom,scmi-memlat.h 
>> b/include/dt-bindings/firmware/qcom,scmi-memlat.h
>> new file mode 100644
>> index 000000000000..7ae8d8d5623b
>> --- /dev/null
>> +++ b/include/dt-bindings/firmware/qcom,scmi-memlat.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +#ifndef __DT_BINDINGS_QCOM_SCMI_VENDOR_H
>> +#define __DT_BINDINGS_QCOM_SCMI_VENDOR
> 
> The #define does not match the #ifndef (missing "_H")

Thanks for catching this. Will fix it in the next re-spin.

-Sibi

> 
>> +
>> +/* Memory IDs */
>> +#define QCOM_MEM_TYPE_DDR    0x0
>> +#define QCOM_MEM_TYPE_LLCC    0x1
>> +#define QCOM_MEM_TYPE_DDR_QOS    0x2
>> +
>> +/*
>> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
>> + *
>> + * %QCOM_DDR_LEVEL_AUTO:    DDR operates with LPM enabled
>> + * %QCOM_DDR_LEVEL_PERF:    DDR operates with LPM disabled
>> + */
>> +#define QCOM_DDR_LEVEL_AUTO    0x0
>> +#define QCOM_DDR_LEVEL_PERF    0x1
>> +
>> +#endif /* __DT_BINDINGS_QCOM_SCMI_VENDOR_H */
> 

