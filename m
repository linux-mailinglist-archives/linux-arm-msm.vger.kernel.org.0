Return-Path: <linux-arm-msm+bounces-33345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB909927E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 11:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B9CC1C224B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 09:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F7818D652;
	Mon,  7 Oct 2024 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kirljLBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E6C18CC0A;
	Mon,  7 Oct 2024 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728292496; cv=none; b=W+7abUObp3FI1colrF4/IKFiqinDw2R0jUh9+7TTgYG64jwuNqZ7ucNo2UDoQqNhzfOTLrDMgHin+aSlkmDfBlLMLaJ7+ELHEVZUcqPCpJsEc+JO2b5KETC7PA/Zzthgq2oHF1YAzsnLlEaQSXvPCrG0lSAFUp6DnCAHTDyHnVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728292496; c=relaxed/simple;
	bh=orHHvBCFGutCM41vFPHAljUU7OO3BD272KMLX4hir6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oJLpvroxWeCWvEEXxuuggj+FRR51nsoyY18EeOb70f7wTz5riDGXfouMpXKwh0F6QJKc7ExljJRjqSkLWhBufEncpTORsa9fa1joVyPgnN1oGzElxLc6zOFUwpsP58Z3+6Jcw6rDdDyE9oJl/jw0qRMj4DSu3vqEpMDRZcLPh60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kirljLBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974SrKR021306;
	Mon, 7 Oct 2024 09:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tq7aRWIkV3GEwCHN8H9VtzFR3yhqTAAhfgZQXGGZXDg=; b=kirljLBcD/WhYrAk
	hUACXAj87D6pt5QkYgcK5lHxzwWneF+5lXsMk36Q4a1rt6VlzK5nXipAKFTI/hBN
	lc2uAO0SF17xq1t5cOg6R2g2cIV9rfI5f7FDiaHmYJkAq3T8bV2v14j8g448J1oi
	lPONG/BTHOzfOqJd3TgozyVKcxAO1VqTC3Gud2aqT0t3hugfyTRj/ivjcL0+E5TB
	r8COJAUXK1Xz3+Ipy1YUDDx+uMkEv03lKyaEfWEmLRACbq4RhMEj13UQjk339e+Y
	AJeaXFI4ZQqwRumjww7I05h1Nne7Nd4m0uYiUYAnUz6dYhf67WiJHWcZufNCsFaG
	eKCW2Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5kjym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 09:14:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4979EpWD020836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 09:14:51 GMT
Received: from [10.216.15.15] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 02:14:47 -0700
Message-ID: <38e3730f-7fb2-4ea6-b55a-f6501e43d799@quicinc.com>
Date: Mon, 7 Oct 2024 14:44:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2] arm64: dts: qcom: sa8775p: Populate additional
 UART DT nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_msavaliy@quicinc.com>,
        <quic_anupkulk@quicinc.com>
References: <20240930085533.17119-1-quic_vdadhani@quicinc.com>
 <uk3zgyee62vrkcwtujkuw754wacvullmsjnimlqhmmbjit24rm@sqcrmbn7ngsg>
 <1fd4b0db-f9c1-44db-9aec-45f3aa269e19@quicinc.com>
 <B12D1E5C-76DC-4B71-B1E4-39F83B1FFFC5@linaro.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <B12D1E5C-76DC-4B71-B1E4-39F83B1FFFC5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CbreTk-CW7pcV-7JH3TJ-a-v8fCFPLCF
X-Proofpoint-ORIG-GUID: CbreTk-CW7pcV-7JH3TJ-a-v8fCFPLCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=885 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070064



On 10/7/2024 1:03 PM, Dmitry Baryshkov wrote:
> On October 7, 2024 9:06:52 AM GMT+03:00, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>>
>>
>> On 10/7/2024 2:26 AM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 30, 2024 at 02:25:33PM GMT, Viken Dadhaniya wrote:
>>>> Currently, UART configuration is populated for few
>>>> SEs(Serial engine) only in sa8775p DTSI file.
>>>>
>>>> Populate UART configurations of remaining SEs for sa8775p soc.
>>>
>>> I think this is a long standing tradition of adding UART configuration
>>> only to those nodes that actually will be used for UART on one or
>>> another device. Is this the case for all these UART nodes?
>>
>> Recently, we have begun adding all possible UART configurations, similar to what we’ve done with I2C and SPI.
>> We will continue this approach for future targets.
> 
> 
> Please describe why it is done, not what is being done by the patch. In other words, why do you need all uarts in this case.

Sure, Updated commit log in v3.

> 
> 
>>
>>>
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>> v1 -> v2:
>>>>
>>>> - Modifed commit log as requested by Krzysztof.
>>>> - Added co-developed-by tag.
>>>>
>>>> v1 Link: https://lore.kernel.org/linux-arm-msm/98e7dc28-4413-4247-bad1-98b529f6d62d@kernel.org/T/
>>>> ---
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sa8775p.dtsi | 231 ++++++++++++++++++++++++++
>>>>    1 file changed, 231 insertions(+)
>>>>
>>>
> 
> 

