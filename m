Return-Path: <linux-arm-msm+bounces-36393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680399B5FD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B0A283EEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 10:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78381E260C;
	Wed, 30 Oct 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E4MuPY2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823891E231C;
	Wed, 30 Oct 2024 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730283260; cv=none; b=sUZUZGGGja6qRKZdWtgRXKIp7HalY6mvenOhqQdpybNT4ew6BYEIjC8tl/tbU+1heZFVUDzHtuWsAhB6xvnZFUPHabLgDrivCZN5ScnzoCp1CHAPKcr/8S/DfSlPNWWpVMuY2tE/7U9tVYRql/XSFU3hoBuCFy/KDDDrPe21IsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730283260; c=relaxed/simple;
	bh=vUiC0IK4J11U6Av+sC4UOawI6qQXDFgEEBK1HiGWIMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tXF7ZrUkxrjnWsFUilrAMtXTKiBj4g2kI/6OyJpY7694fRhINCVMbynvhaBZkIRZTaU8tYzeIv/7gY0hsg1Vd3P082STDfOvCSveWcrI1O+QuLxD5L+J64TponU+rlNitO4aCfn5BtYtVTgsAS8V9NWC0opdoGolwr1LmhbWcJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E4MuPY2C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U983e8025601;
	Wed, 30 Oct 2024 10:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wBI2i78TLcU3sw3xl7ZRhaL6HAsbYi0e+CCrlE4eIRs=; b=E4MuPY2CT2t6h+p+
	Y6yaP/zZ8mkl+TD8Ccj4ao5yowlDJwK9Jk5oCCDmF+PnuwTF34J+H2o6py1fVKUV
	zGTgeu1+YCuaa3YD9Jm+jwp/xOoi1afwBtw9WkHi0pP2BPu8dFU9g69njiT9ZSfd
	hj08idO19EDVg2T0EXIMRifFWx1KjlFO/mpTk0QN1jO/rAxkSvFFSwxQG3XwulRV
	2+RT2pMsQJmD/+Ssjx/MBoysOzKFZ7JaPYtmuOfz7AGU2Z1b99ffWqjCn37V7e0H
	WBCXH/lL1AXfGHR65uPp6/H0sE1PAt1TKLtROAkGKVKj9dFDIcG0jE9mENdTE5bE
	Bvv3vQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgukmns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:14:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UAECkk004865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:14:13 GMT
Received: from [10.216.12.123] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 03:14:08 -0700
Message-ID: <918defe6-f92e-4273-b7a1-c8018b419ff0@quicinc.com>
Date: Wed, 30 Oct 2024 15:44:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
 <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
 <0487791a-f31b-4427-b13b-b7ab6a80378b@quicinc.com>
 <ae61b485-d3af-4226-b2f8-e89ef5b4ed71@kernel.org>
 <fff416f9-4ea7-4117-87b0-986087f8e142@quicinc.com>
 <9bd4c63b-7c68-4e40-9995-9d569eed15b5@kernel.org>
 <f7551a7a-885c-4f74-8f74-10f1c0ebe6ad@quicinc.com>
 <46c19729-b31e-42e3-a6dd-6b43b27348d8@kernel.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <46c19729-b31e-42e3-a6dd-6b43b27348d8@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BoPFX2vtAZYnW5OARO92LA9YEA86hlOx
X-Proofpoint-GUID: BoPFX2vtAZYnW5OARO92LA9YEA86hlOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=603 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300079



On 10/30/2024 1:00 PM, Krzysztof Kozlowski wrote:
> On 30/10/2024 07:59, Imran Shaik wrote:
>>
>>
>> On 10/29/2024 3:06 PM, Krzysztof Kozlowski wrote:
>>> On 29/10/2024 10:23, Imran Shaik wrote:
>>>>
>>>>
>>>> On 10/28/2024 12:35 PM, Krzysztof Kozlowski wrote:
>>>>> On 28/10/2024 06:15, Imran Shaik wrote:
>>>>>>
>>>>>>
>>>>>> On 10/26/2024 5:50 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Thu, Oct 24, 2024 at 07:01:14PM +0530, Imran Shaik wrote:
>>>>>>>> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
>>>>>>>> QCS8300 has few additional clocks and minor differences. Hence, reuse
>>>>>>>> SA8775P gpucc bindings and add additional clocks required for QCS8300.
>>>>>>>
>>>>>>> IIUC, these clocks are not valid for SA8775p. How do we deal with such
>>>>>>> cases for other Qualcomm SoCs?
>>>>>>>
>>>>>>
>>>>>> These newly added clocks are not applicable to SA8755P. In the
>>>>>> gpucc-sa8775p driver, these clocks are marked to NULL for the SA8755P,
>>>>>> ensuring they are not registered to the CCF.
>>>>>
>>>>> I meant bindings. And existing practice.
>>>>>
>>>>
>>>> In the bindings, the same approach is followed in other Qualcomm SoCs as
>>>> well, where additional clocks are added to the existing identical SoC’s
>>>> bindings.
>>>>
>>>> https://lore.kernel.org/r/20240818204348.197788-2-danila@jiaxyga.com
>>>
>>> Exactly, defines are very different, so no, it is not the same approach.
>>>
>>
>> I believe the QCS8300 approach is same as that of SM8475. In the SM8475
>> SoC, GPLL2 and GPLL3 are the additional clock bindings compared to the
>> SM8450. Similarly, in the QCS8300, the GPU_CC_*_ACCU_SHIFT_CLK clock
>> bindings are additional to the SA8775P.
>>
>> We are also following this approach across all SoCs in the downstream
>> msm-kernel as well.
>>
>> Please let me know if I am missing anything here.
> 
> Not sure, please take the same approach as SM8475, not a different one.
> 

Yes, it is the same approach as SM8475.

Thanks,
Imran

> Best regards,
> Krzysztof
> 


