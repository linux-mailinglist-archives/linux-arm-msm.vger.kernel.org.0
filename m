Return-Path: <linux-arm-msm+bounces-41873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815109F012E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 01:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 893DD188E110
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02669747F;
	Fri, 13 Dec 2024 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajKfVmdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733266FC3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734050116; cv=none; b=E/LN73mX9S7E/CPB2CuvolEIDqBqfblInrR0t4HoDbUkHRCK+P8B8q325dchO19JZxngffk4D9GWMgP4IUnjIO06/QHNI9oku3bkVSvuQnwd+df6qGPNWog4EqlYoun93+ggSgDnONMvNagcWx5m+QMVo6+828c9WJYcSdrvGjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734050116; c=relaxed/simple;
	bh=C1OmHTKMqj6ZyG3Qgh1f216yP5FMglwHPg8jL/N65MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m/g6xGVLzKvrNmeDIPI3g2g4Ex1AP0JVtdwGZPDIKsgnAFzLmpR8HVUIO0JQcyoU6tjQXN0bAdUpv4lGzZhT5Uqpf29GQO4uk4CdaDT/meCJgpB1sX89x95ZRrVUlhgy4ne+gmHVffxBFU5ZYW0ep71pcRr2ZBgZifDJFKN4qLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajKfVmdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCIDpOI024961
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4/hjPmcafZUlY4Ld9J6krmjotFTLTKt0ZqTJYFEDnU=; b=ajKfVmdkeLq3ub1r
	v7ZQam+QRotUWzVt8CZuByHdERmyd4Fkw8vGJ6XdQAme7ctLCHsS4yoK9YgnH4WI
	WSEW75Jbtsegv/ZMnjnKwwHUt+1th8kTmCzwoWqos2MqnNsAR4O1aYFnx6grPtQ+
	mJSGg5+RIt/rN7eiyp+hlAuTkJfJZXZHTBDGfePebyzYT3nyakv5Xpy6GaNsgwdO
	led1iDuMviBAQvGQSYSxYd8/DOsEA+tZg8yuqthDw9ND/8M0A3N53ozCDlQoSLtf
	Nu8Djo+mKylzFNYrPoXW3TCJt6Q5qGuNzZXLrwaFo8bhahKE0K0dHWsJCmBwRUnA
	ZeN1JA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wn8qmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:35:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679ef4565aso2056181cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734050113; x=1734654913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4/hjPmcafZUlY4Ld9J6krmjotFTLTKt0ZqTJYFEDnU=;
        b=AT0QayaP/kjIisjXrqXN0/9yGpR6BOznXKb/Vc3QhtfB7cP3eMg99MK64eV3QBv69y
         zsbUGC5EpOC4LcsBo+AyyQdQU9IVPbxXb3FJb3eqSnZ7m3QeHvvYsStoJaHfct4ok5sl
         wWt/0oYKa0GqAfhkmVMiZhAAXU40UOntsCVSrhl2egXzC2k0xPI07IUVVsRlKNQOVTyZ
         FIAJgs3mLxWQU590yo489tTRNNVrQlHey1nSRcQadlkDs3XipeW2jHWHJb1SQEEk+2uv
         /V0rJetOu3Qgm/l5GLQ2hu47JIbynzg6X8xrjgzgroiOG9cp+MbY7AKw93cqeA1L02EU
         rzXw==
X-Gm-Message-State: AOJu0YwdpXv7sudVLuN+5a16aIu4zR01wOwLwKffPfa6vAIuWd8PCVwu
	L493tqfaR2VcbtLZ2NC9px4JLlnkO2rkoeFaCsmeEMrKh+AdWGITC/hy96SMQPyTNePMd4Ubfnj
	1jW5IIRCOJ1MWd6JyI4nk0jYUC+tMQ5fGq5TIR4PwE/wprgPMfRm0Ya4LyVugxtNB
X-Gm-Gg: ASbGnctB54Z/9SUaWPLkBSC814xkncUNIzf+oSKbDPSjIKJbhTyOGEkZ0mdVr3iiucV
	BO+bCPP1L2dKB+QjJiVIRxLwx+f6pdvlz7e7o4U4t9m/CwXemDBip4++HnBOcMaOcR+jKkbrjZG
	5Yar+Ypj96DKLx5vq9hT9VGHZ+XtNSHuhlDGYeMkHC3EqHtunsh0qZaBgw9HQLw9jHpIrZxnGFI
	r3uN6fgwTQ38hPMYPYisSyams4gFlLwLUS/uzHZq1lDzBW9wIbttqTfgBFcdt1A9jf/WyEm2db9
	mImb34rfau+ZI3An7P8Wc26sZLnQ79NClaIW
X-Received: by 2002:a05:622a:1306:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-467a5720eebmr4326321cf.2.1734050113171;
        Thu, 12 Dec 2024 16:35:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCRcA24YH+lngVm2gGOGtnM1SuWe0DhJ4BCmyW8qiqcvMK8GKw87YjeMZ0iDDOKqF/YGtJ3A==
X-Received: by 2002:a05:622a:1306:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-467a5720eebmr4326141cf.2.1734050112821;
        Thu, 12 Dec 2024 16:35:12 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3db53b828sm8362477a12.74.2024.12.12.16.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 16:35:11 -0800 (PST)
Message-ID: <04d23c55-9167-4e8a-9e5b-6dcf66b02b8f@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 01:35:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight nodes for QCS8300
To: Jie Gan <quic_jiegan@quicinc.com>,
        "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241205084418.671631-1-quic_jiegan@quicinc.com>
 <16efb6a8-ecaf-4097-ac5f-368ebab177a8@quicinc.com>
 <25a410a7-2418-45bd-be06-3672a9fb1928@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25a410a7-2418-45bd-be06-3672a9fb1928@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N1YcCUmoIVfLdhuApaa-SdERFrUMZmcU
X-Proofpoint-GUID: N1YcCUmoIVfLdhuApaa-SdERFrUMZmcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130003

On 9.12.2024 3:01 AM, Jie Gan wrote:
> 
> 
> On 12/8/2024 12:28 AM, Aiqun Yu (Maria) wrote:
>>
>>
>> On 12/5/2024 4:44 PM, Jie Gan wrote:
>>> Add following coresight components for QCS8300 platform.
>>> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
>>> TPDM, TPDA and TMC ETF.
>>>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>> ---
>>> Changes in V2:
>>> 1. Rebased on tag next-20241204.
>>> 2. Padding the register address to 8 bits.
>>> Link to V1 - https://lore.kernel.org/linux-arm-msm/20240929-add_coresight_devices_for_qcs8300-v1-1-4f14e8cb8955@quicinc.com/
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2150 +++++++++++++++++++++++++
>>>   1 file changed, 2150 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> index 73abf2ef9c9f..eaec674950d8 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> @@ -293,6 +293,18 @@ system_sleep: domain-sleep {
>>>           };
>>>       };
>>>   +    dummy_eud: dummy-sink {
>>> +        compatible = "arm,coresight-dummy-sink";
>>> +
>>> +        in-ports {
>>> +            port {
>>> +                eud_in: endpoint {
>>> +                    remote-endpoint = <&swao_rep_out1>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>> +
> 
> [...]
> 
>>> +
>>> +        tpdm@482c000 {
>>> +            compatible = "qcom,coresight-tpdm", "arm,primecell";
>>> +            reg = <0x0 0x0482c000 0x0 0x1000>;
>>> +
>>> +            clocks = <&aoss_qmp>;
>>> +            clock-names = "apb_pclk";
>>> +
>>> +            qcom,dsb-element-bits = <32>;
>>> +            qcom,dsb-msrs-num = <32>;
>>> +            status = "disabled";
>>
>> Could you please provide more detailed information on why some TPDM
>> nodes are disabled by default while others are not?
> Some of TPDM nodes are disabled by default because the one of the following reasons:
> 1. TPDM device are designed to generate HW events, it needs a clock source to read&write its registers. Coresight driver cannot control the clock source ouside AP core, so those TPDM devices without enabled clock source will crash device in probe.
> 2. Some of TPDM devices can't bootup with fused devices.
> 3. Some of TPDM devices have known hardware issues that not resolved.
> 
> I put those disabled TPDM devices in DT in case some of them may be "fixed" in future.

Please mark them as

/* Hardware issues */
status = "fail";

Konrad

