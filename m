Return-Path: <linux-arm-msm+bounces-82505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A13C6F2D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DEE01362039
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451C235E52C;
	Wed, 19 Nov 2025 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXOp3Jpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S407Oyr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDDF3093A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561178; cv=none; b=iDpAJxPRVZk2nGSUUNKJ0o2URU24DEDtiJ29E00n0VshqhmuhcDENj0v8NMIpDNE3Z9auMULjcYrVCU2f4ZzyizS9g9/mHcjTCRIAqByFj+EgKROX8F5ddtYs2wSRtC76RZ8D0mqb33h13tlf3+VQOG2fjtOKF5lkuQThcirMmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561178; c=relaxed/simple;
	bh=dpjWMKZAxDPDzdh5nmSMsAsebFf1j7wkXJlaXSuX6fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9hinQscooA5RxNaK3q8BGJE/LYD/Q8q9e61ACsJYBMxwCbctsT96Lga0aIKOqmz9DHOLgzXnw0A6uJ2niM9hFczclDnyYLsYS8plMf198pcJLaWbAMFd3rQ4zyxQshnNUSC1WEgEveWX51IH/G0Ya7II3bs3hO+v06xOm14f7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXOp3Jpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S407Oyr9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJA3C7L1791851
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 14:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Qes0uTFZFHa9NsIpsziOa1xLGXFiHkyg/VBp5V2ZmU=; b=aXOp3JpqoNHqyPaJ
	u94HqWlAbGcLpISp6vR89uCUErrMYEsh6QF0haF29CoDJIwFLoUJSr1MS8tLiCsc
	6awRHBEAUdkWgNS67ygthLMlaSvJzuAsUrClsfbhQgMKtqGTe0eZf/4p236SebZ9
	Bn6NfZPgphqX9ACp4+rri6buICluumYUppD0TubzqqjmDeVx91vqcEmaGchmu13Q
	ZTZ+h8mCmmCycqKpmgZauQU7ci5uHREeCpjjzEBmc+iUgWzknoAIcb8oSnPyJ/+S
	FwkxTWKAsrc2wV5inmG3GyVAmomuXlB7RLiqq+8iJYrLQWST7PFqVxD4M3rPYpXx
	ErOjeg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahbt6rmc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 14:06:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee24e1559aso7659781cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 06:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763561174; x=1764165974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Qes0uTFZFHa9NsIpsziOa1xLGXFiHkyg/VBp5V2ZmU=;
        b=S407Oyr9b/GBhYKkkgjSSSuJG0AZ21eQdQQr6wpVDdRcwErou2VqfaRdli++AvCNFo
         16tVnSZTfiLwRkuNhlzMsb6l2vTeWFXObPGv4LBEDcW+spZX/oeYYSsweWHRs1gjLM22
         +D4p+kdS4jmkNlA18Kb0PUMrTXObvTl7RiZ+jO8oHgStAGOrM/C+0LAtfVBBBdI3sl8e
         8l/Pa7EYB0bYgYU16HAf4J0RJSY6NuvPEqsoXTArgMfWhyQjruJIXZ0xw8QlQZoh/iyA
         tKUEpDU+3DhNL/ni4/eJY4RKlj8rHaFSY6eqaW8+tP8dCUc45cirWmRheDf7X0zJoTvg
         BBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561174; x=1764165974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Qes0uTFZFHa9NsIpsziOa1xLGXFiHkyg/VBp5V2ZmU=;
        b=cqPA7GVAQpE4y5iJ5zs1NtnA+xAAaRfkwRXkjOaxa5LeKFYQSdPluJ+f/7vkSPLJzE
         nW67nrpztIRCj60oqhheMa9AS47sk9lSkNC1rZ1xiPgHBxnxIrXux+yCIWTpXbRMbe/k
         f2aKFp6jtcyBbUmV673OIgIB0/1Ny934bz/Nm9b5KFwulfnSTCRUrEGFE3FQ4q7XDkmB
         c/FMsrD2nKZ9jgEQlR1hPh/EMYTrENO9JFmOjgRWEfT41iMH+HpwITXz7/ZAWDMhstTD
         K/0pL5Bv1M3rAMgy9Yn9yyXT1pBMTIqSac4cXrgycZddI8fmGXVDp9ZwY7znr2XP18wS
         7+ew==
X-Gm-Message-State: AOJu0YxN6rtKPdoSYYPfC+vcC1t7p8MqZqr7p4dBMdION6T8aPE/PjTJ
	U5R5ZWFaKLLXAxOslkz/Wj0C2DVxgBkHndIGPNDF6B1Ycn6LYJ2gRPVxN7dFSQGr0pVUqGOb/OI
	482Ekyizz3YV48I6fRLd/icqUWXlxvEPp93fO40gIVEmWl6kUReWyLzJY0soDx0rkznzw
X-Gm-Gg: ASbGnctg1W5wkAnxcDClvMKwRrco7AB4dN0feV3Ynuv0x04DEDrFceT86Ge2Pa7kiYf
	XpNBpe6Ie0/MbCZw/gcwbPeMA7ZvaXXsFMhtIcW29tjXtDwqQZj1We/6ELyFoGshn/xIWNjHPSD
	DRDA8H/+tEDvRyygMK+7LFoKhPIYXU4ARO6PefID6ksgOxT7GtHF2PpjcqZkU0NWUcoyNp1Ffll
	CiqFg3+ICfYFUboiWsJIeepIY5YWyJsGHsQ+uELAsJxSwQKJswNVerrfQwwbQjcEjdSB/JyLtDV
	c/rQpDqX7rEZiRIM2yOIohIFM4bKnSJD20rw0JsARAI6zJQ6wpw69jtaIrkxwx3GynPd1BBhpfb
	MIRLeboGmhmGjajWcnIjWVWVb5rKjtm6slhfmNcGwuf/Zf9UTrhF84XPSGPWG+wAuub8=
X-Received: by 2002:a05:622a:118c:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee317b615emr68794961cf.9.1763561174139;
        Wed, 19 Nov 2025 06:06:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC/GxW90CSjD9X99yXw14hwGdaunyaI7OzNy4Ri4K1ArJh12VHpQw536wUemF3pk/tElXELQ==
X-Received: by 2002:a05:622a:118c:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee317b615emr68794381cf.9.1763561173574;
        Wed, 19 Nov 2025 06:06:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d6f5bsm15139107a12.6.2025.11.19.06.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:06:13 -0800 (PST)
Message-ID: <5b93af24-d05c-48a5-b552-d0374ed3f00a@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:06:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: qcom: dts: sm8750: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251117-add-coresight-nodes-for-pakala-v1-1-d26bfaa44fe7@oss.qualcomm.com>
 <350ddcc0-cbab-4b58-8b50-5004f27688db@oss.qualcomm.com>
 <cfd9867a-5fa5-43f1-a1a7-81f05bacc47f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cfd9867a-5fa5-43f1-a1a7-81f05bacc47f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6QwalyPPJQU9YZMH5C5C3POiQnP36FZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExMyBTYWx0ZWRfX/bKu2VkT6EQ/
 33jwRAkzEw+gFzKOs/shKLhRThzy8UR2nNezBPO7/jzcMF40tkCPvW6whvsKZ0xYO7DKo2XTxik
 IDV13cFyRVLik9V5ZVi6zfnYDmbktyDe8taK1zPPb0EWds3t59ZAg+wehwBKv8RnOIphq1M6S7Z
 yktDxi+psuL5sLGNKHSWT59vPCLWUUwmGpNqDquIG25HeqqZv89tUXKcYRjsxgOfSwIz71qKQXa
 4Gyo3t0twlF08s0gylob/Ykaqp+jSUr8x5NvkZbCgnDmI10JB+OnYl03NelJqjiYtIUy0c2diZw
 x3sfZP+8DS7/T8ppJ3FFx01kKFSv/+2Vdc0C6FPw4nN76BwMagUXCBaAvt1yCna/RtyMUriw+NE
 GB9BTWk5N+kmF9qxgSIP4E7Y12STsQ==
X-Proofpoint-ORIG-GUID: 6QwalyPPJQU9YZMH5C5C3POiQnP36FZz
X-Authority-Analysis: v=2.4 cv=PJICOPqC c=1 sm=1 tr=0 ts=691dced6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lhKjhfexzfBmDlcAgNcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190113

On 11/19/25 3:01 AM, Jie Gan wrote:
> 
> 
> On 11/18/2025 6:03 PM, Konrad Dybcio wrote:
>> On 11/17/25 10:31 AM, Jie Gan wrote:
>>> Add CoreSight DT nodes for AOSS, QDSS, Turing, and Modem blocks to enable
>>> the STM and TPDM sources to route trace data to the ETF for debugging.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 981 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 981 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> index 3f0b57f428bb..56c2605f3e0d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> @@ -3313,6 +3313,948 @@ tcsrcc: clock-controller@f204008 {
>>>               #reset-cells = <1>;
>>>           };
>>>   +        stm@10002000 {
>>> +            compatible = "arm,coresight-stm", "arm,primecell";
>>> +            reg = <0x0 0x10002000 0x0 0x1000>,
>>> +                  <0x0 0x37280000 0x0 0x180000>;
>>
>> This region is a little bigger but it's not described clearly. Is there
>> a reason to use this slice of it and not the whole thing?
> 
> This region is about the STM channels which are allocated for APSS/HLOS. The channel 10240-20479 is allocated for APSS/HLOS, each occupied 256. So the start address is 10240 * 256 = 2,621,440 (0x28000). The length is 0x180000 because we only use part of these channels so far.

This is useful information. Could we better document it internally in the
usual place one would go to check on registers?

Konrad

