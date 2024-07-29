Return-Path: <linux-arm-msm+bounces-27237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AC793F32A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 262911F21D97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D40140E30;
	Mon, 29 Jul 2024 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zal9Q2EK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AF413FD86;
	Mon, 29 Jul 2024 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250275; cv=none; b=Ji8VcTwbNvrOmZKlADC0y8cRGVaHdeVujAY77a2ISIbqLfbGXJNhDsoZ1qopxnuJbTOy1KIB16dLzvmmUjAQlZ7MWKxzbLgTA8SvYhjGqBxsQE37tQk9TguyNBjvkr5QeLkYaPTA3+e/YsFT09co0RMKREQ12geLFhWgOALV6pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250275; c=relaxed/simple;
	bh=TXqbYLWNavBhio6QJtDaBL3LRySSdcZhgC+Ki8PQPps=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VrE9gtbGcrb60w+5Ht+SQo/HSAnsW7WRBadT/JYWlWOj922Kgv6U38QBXjXQOwsQdcvC9rF39R5fCUoOqQdBehiRohR3uu4JrsC7FPVZzkJTPzzybInmYiF1CxwAtbM0U5/N2U6ID/mUx4v+qxTFd3qQPrh+9UPDV6t4K1g1xzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zal9Q2EK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAKjVP000633;
	Mon, 29 Jul 2024 10:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iflcpP1kqonyTgoKqWDBjTj20vn/CqguM7cHmTJC/wQ=; b=Zal9Q2EK4BUcnLFK
	dCHTxTgjU/ie4GEGOE6F5RRY7nlUknKM0ZtpynnsKUWC+IMpiFnZUomhMaDFpREv
	zNpL7CmjE0lXOlTKkDoSr1FnCWegeSH5xBatCAY95yk0TZ+Uqo0Aaz38n/NNbzgb
	pNDaFVl9Nx04sv7p5nlcxe1NrPexsJ+BhKQQ63TGzGBfABiKziS9CUh5Dy/3N0HW
	OnkihK3X+BTaQDd6rkfnF4EuUuDgcdqBwdJp0wqp2gDIVTT7L8moybCFv8qYvRYL
	4sEXMJ4RoBr8WYwdSIk+FayfVVwGdIjs2rtan2iGgkwL6vFDuRJifeLCk05oP4yO
	dBFpZg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt2kkuh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:51:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAp8X0015980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:51:08 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:51:03 -0700
Message-ID: <a9cfb48f-7dcc-4582-a677-3abac0295630@quicinc.com>
Date: Mon, 29 Jul 2024 18:50:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Add TCSR halt register
 space
To: Mukesh Ojha <quic_mojha@quicinc.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240705153252.1571814-1-quic_mojha@quicinc.com>
 <20240705153252.1571814-2-quic_mojha@quicinc.com>
 <50d0bdd6-2262-4404-9a26-29b1f2e6fe92@kernel.org>
 <ZowPCeNFh/Mw8ev0@hu-mojha-hyd.qualcomm.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <ZowPCeNFh/Mw8ev0@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vbtk-eI_m1LVSJ-Q0GPfQWCB84N7la4s
X-Proofpoint-GUID: vbtk-eI_m1LVSJ-Q0GPfQWCB84N7la4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_09,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290073



On 7/9/2024 12:08 AM, Mukesh Ojha wrote:
> On Sun, Jul 07, 2024 at 02:46:59PM +0200, Krzysztof Kozlowski wrote:
>> On 05/07/2024 17:32, Mukesh Ojha wrote:
>>> Enable download mode for sa8775p which can help collect
>>> ramdump for this SoC.
>>>
>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 23f1b2e5e624..a46d00b1ddda 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -221,6 +221,7 @@ eud_in: endpoint {
>>>   	firmware {
>>>   		scm {
>>>   			compatible = "qcom,scm-sa8775p", "qcom,scm";
>>> +			qcom,dload-mode = <&tcsr 0x13000>;
>>>   			memory-region = <&tz_ffi_mem>;
>>>   		};
>>>   	};
>>> @@ -2824,6 +2825,11 @@ tcsr_mutex: hwlock@1f40000 {
>>>   			#hwlock-cells = <1>;
>>>   		};
>>>   
>>> +		tcsr: syscon@1fc0000 {
>>> +			compatible = "qcom,sa8775p-tcsr", "syscon";
>>
>> The file is going away. This change is very confusing.
>>
>> Please align first with your colleagues instead of sending conflicting
>> work without any explanation.
> 
> Sure, let me check with Tengfei if this can be sent along with his patches.
> 
> -Mukesh

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Therefore, this patch is still needed, please continue to review this
patch.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

