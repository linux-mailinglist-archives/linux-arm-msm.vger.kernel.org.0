Return-Path: <linux-arm-msm+bounces-7922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB6838B81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 11:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCD691F22EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 10:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E02E5A10C;
	Tue, 23 Jan 2024 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CqYWa+jQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D65C5E1;
	Tue, 23 Jan 2024 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706004984; cv=none; b=Jo1oefYK9JZG84b62MDDNtx9lf1HweOE2i3BEqZ8jbAOF+/yJuwl+E9G00Ya0a200f8og2uydh58R26uPdtBEGiw8FSTB1kxga6iCEWZyRPbArv1HgOhL+hzJiKLH7uL+dBuupoCPXn8S+X7RrC1Tk3HWtKF5v6Sg082N87QYgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706004984; c=relaxed/simple;
	bh=AsYEjziJ16kBjUrlHJgd6Envs6CQNggqaxWKHphq50I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ubGP4n/l5QiDTXILXn//BdAbe4+fainSP0I25mFO9hRv4Enpszc7P2b0tk11M1I25rQTHSxmJCM1T++hclGFagfGwujUGPCisoLvwYIYXF32KFSfODE6JS1REpkVrQpT9vqyMqL4JnC2zpyeJpssLaBsp5V67x2U3XTOMNXDfac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CqYWa+jQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40N7VFM5004626;
	Tue, 23 Jan 2024 10:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ioo+a2pGrb9O2hEPBBo85NvghApet2P7c/0QhXq8HIM=; b=Cq
	YWa+jQQSyDsKc+XT9iUsijqYYNdVocFbs6AWBmAyox6ig5EsGgOzMpFY3KGd2cTV
	cuBnmCiiNlU9LhIle01vq+Bdf/LJk8uSFAGc3sDCKzTK8JR8qcDF+rwi5Dvid1TG
	pGgJGK0l/GHRWjYAI3HI0RrQe4eCGOZE6MQsf+Idf6fONMdKzB4bPO6Mac4umGvs
	jKINxoWMMLyDCVKizXTc+F4Vc9bfC4PvWm98SbzWa3zkeqEYkBaFzLuREoXAfppL
	1BRuaVUR2AIjIUuO/amkAfiRrZsdWpXxG/w5djKlbAWTt3Q24ixWTY1YdanZM96q
	VoEnFRgT7WlI4PBfrc7g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vt38892cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 10:16:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NAG7G9031285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 10:16:07 GMT
Received: from [10.216.0.152] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 02:16:00 -0800
Message-ID: <791d80e5-af43-482a-a20c-a888a556869a@quicinc.com>
Date: Tue, 23 Jan 2024 15:45:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_psodagud@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_ymg@quicinc.com>, <kernel@quicinc.com>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <e4fe77d6-2762-4fe1-a68b-e7d152d22efd@linaro.org>
From: Ninad Naik <quic_ninanaik@quicinc.com>
In-Reply-To: <e4fe77d6-2762-4fe1-a68b-e7d152d22efd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xDJ8a2wdrZE7KP8xx6Xz9fTF5i7Gwbje
X-Proofpoint-ORIG-GUID: xDJ8a2wdrZE7KP8xx6Xz9fTF5i7Gwbje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_05,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=831
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230074



On 1/23/2024 1:56 PM, Krzysztof Kozlowski wrote:
> On 18/01/2024 16:57, Ninad Naik wrote:
>> New memory map layout changes (by Qualcomm firmware) have brought
>> in updates to base addresses and/or size for different memory regions
>> like cpcucp_fw, tz-stat, and also introduces new memory regions for
>> resource manager firmware. This change brings in these corresponding
>> memory map updates to the SA8775P SoC device tree.
>>
>> Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 103 +++++++++++++++++++++++---
>>   1 file changed, 94 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index a7eaca33d326..20b16fb5f537 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -356,13 +356,18 @@ uefi_log: uefi-log@908b0000 {
>>   			no-map;
>>   		};
>>   
>> +		ddr_training_checksum: ddr_training_checksum@908c0000 {
> 
> Underscores are not allowed. Please rewrite downstream patches to match
> upstream code.
> 
> Also, useful is to run basic tests/tools on your patches, like W=1
> builds, before posting.
Ack. I will make the corresponding fixes.

Regards,
Ninad

