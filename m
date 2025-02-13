Return-Path: <linux-arm-msm+bounces-47856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1382A33952
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAA097A23E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 07:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB1920ADF8;
	Thu, 13 Feb 2025 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N1CkTx0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F10BA2D;
	Thu, 13 Feb 2025 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433349; cv=none; b=kTshXqV2qqUBowl7j2gdyKD94nuqfwYq64qptO9I2HgYZaDWMVek1q7VtywVJ5e7BcxGAO4f4cdmaff6Ai5D3n01f/hU+/N4j2LQk0cUJNt+b9Vp2tcnm8hQD1ePiImkGHQkJo9g+Y97XFmpSj5AdfK7OwvkOVpfeCIu1+Srb4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433349; c=relaxed/simple;
	bh=E/Bk4cpkUnp5YIaMUqiqS88U+IiwmosVusL6CK8SLdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DJmVA22AuVHcJIuQL1aT7dHbtxQ3uzcujPfbJODQC5Odz8CUvdMkyaXRDQk+XtruRLtODLXDWD3CEp4kqWUvPe4jpbrYlPpwYBDuhahtLLErrYPfek7U7nkwyU0BpmGi7gWlA5k0VzBTh51r0GtGiGJFVuJ+ZwIjSSd1MwpI1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N1CkTx0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7H9e7032656;
	Thu, 13 Feb 2025 07:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0kBEx0rwy1wJARNS+6ttU+7k06eVY3ZzUuUzrtBPE4=; b=N1CkTx0Dlf5RBQx+
	ASj+VYtptiz+xACNFxqpxBkzusg2eXbHoHL1x+Ks2OM6g4kMofJXuxpx7r57vIvv
	MrwECDuT9Xa/uRbbkzUgeq/dsLf6tHiPoDDKgh8nSkpQSyZo+zIdfBTMB6Ez/KWG
	UA61lHp7jkbpAtyHUrwpvjXVuu8J3XxTvhzT9TJg8Dil8qtkX0xctXP6xsDPFz0V
	LAG0FFhv6nk6fpiDnblIXDXf4Z2mlT44E7dVDDmGWxsY0E8afaKiUvNJvibPLHuJ
	b+IOzvPW/xznHkYMqPVdVqHsGOZKp/ha6N3MDIm8eB54JGtEcg1lKrjszO6PDAEP
	AgqnUQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc7b82wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:55:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D7tg9O013346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:55:42 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 23:55:36 -0800
Message-ID: <f4b1f9e9-87b8-44be-957c-46faa2aefc39@quicinc.com>
Date: Thu, 13 Feb 2025 15:55:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove cdsp
 compute-cb@10
To: Pratyush Brahma <quic_pbrahma@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@kernel.org>
References: <cover.1739260973.git.quic_lxu5@quicinc.com>
 <4c9de858fda7848b77ea8c528c9b9d53600ad21a.1739260973.git.quic_lxu5@quicinc.com>
 <cf78b342-6655-4cde-b877-8f498ed0e6bf@quicinc.com>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <cf78b342-6655-4cde-b877-8f498ed0e6bf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yhJ7xtvnUTknJmmoxhQ-ULiC7dbER0HX
X-Proofpoint-GUID: yhJ7xtvnUTknJmmoxhQ-ULiC7dbER0HX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130059

在 2/11/2025 4:44 PM, Pratyush Brahma 写道:
> 
> On 2/11/2025 1:44 PM, Ling Xu wrote:
>> From: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
>>
>> Remove the context bank compute-cb@10 because these SMMU ids are S2-only
>> which is not used for S1 transaction.
>>
>> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
>> Cc: stable@kernel.org
>> Signed-off-by: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 0aa27db21f3d..81b2fba94841 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -4585,14 +4585,6 @@ compute-cb@9 {
>>                           dma-coherent;
>>                       };
>>   -                    compute-cb@10 {
>> -                        compatible = "qcom,fastrpc-compute-cb";
>> -                        reg = <10>;
>> -                        iommus = <&apps_smmu 0x214a 0x04a0>,
>> -                             <&apps_smmu 0x218a 0x0400>;
> Commit description seems misleading as these are nested sids and not S2-only. You may say you don't need it for your
> usecase which is a different thing altogether.
>> -                        dma-coherent;
>> -                    };
>> -
>>                       compute-cb@11 {
>>                           compatible = "qcom,fastrpc-compute-cb";
>>                           reg = <11>;
> 

This stream ID was recently configured as S2-only for this platform.
-- 
Thx and BRs,
Ling Xu


