Return-Path: <linux-arm-msm+bounces-28074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2FA94A411
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 11:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FC6D1C2269B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 09:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42DC1CCB3C;
	Wed,  7 Aug 2024 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EDDcIwfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ACF1CB33B;
	Wed,  7 Aug 2024 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022280; cv=none; b=Lc706bWk4RjM5bETlOaZh4xWLeFIZoeEMX6Zp4KeLwfI4q2CO2GrKbIk1mchOCkR/ILxcPKdfszjqKTlz0CzvstEavpCkePvaXYre2fe07+q32juv7gA8S9uhKOAxTpsZBeSsFCVWnOtJqtMLDwKW5mWKjmseQy2kNE6Uio9MHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022280; c=relaxed/simple;
	bh=39rohXLzeBEAAVexRO/WFbUOWZHEOX9q/m+xnCgiJCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mjlC4l/1SOz716nD7Q4OFSJtN/tcI+OJa2ZO53ZoK2dQrZsXegSLSj0G+C7PG/fhGvrvRPgF6zgMh+Xc8Glz474nbAH3mw+tiy8LpPOxEzAUvKVS39UhMHRdix2hG7tW8Kud181mEc5FMcPXJV8W2FQDn0nFbEGKCHfiNpDR7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EDDcIwfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4778HZoN012996;
	Wed, 7 Aug 2024 09:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmD5tpeiRe2KpqXR7PcrvWkwyuhQCJPv0WV/gdOctx0=; b=EDDcIwfjMHOPNxAm
	W8ymKiLep1wAV6ckBDR65mIhyXBcpn0sH+cp7+UuPgLGoO9raLnb0mAwZUisciY+
	fpcvDFvP5tVUiESwuKxqVNivdFHEQ6ngPeniNyoxixAvKVuTB21d+3GEXzbtT9QM
	NgfVcLoq3lgEZwC8iuQ4wirz/JANi8HCKaoJZaftsGkIzCyBW/VeC/sUAgNEb37O
	CEJaniGvTITwLwKmEju8pAUAX3EJoN7Nzte7K7Na1PlXYnoB7aH0/VE7vNl150Pr
	FgY6Iw8N33Mc6V9yQZtqr5zbKnpjfN0ehgTxOGV4oyTqB4wLva47lA2u5Nab9J1q
	4uRx5A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbj6t7wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 09:17:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4779Hqkd006638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 09:17:52 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 02:17:47 -0700
Message-ID: <4a350e94-3c95-48e1-9ea8-ced483c1aa45@quicinc.com>
Date: Wed, 7 Aug 2024 17:17:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sa8775p-ride: Add QCS9100
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
 <20240806-add_qcs9100_soc_id-v1-4-04d14081f304@quicinc.com>
 <90eae361-7d5d-440f-a85d-dfd81b384fe7@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <90eae361-7d5d-440f-a85d-dfd81b384fe7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ViJuM3OtyWxYv42I7O4gRJP9jnOAfWkd
X-Proofpoint-GUID: ViJuM3OtyWxYv42I7O4gRJP9jnOAfWkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_06,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=673 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408070064



On 8/7/2024 3:28 PM, Krzysztof Kozlowski wrote:
> On 06/08/2024 06:19, Tengfei Fan wrote:
>> Add QCS9100 compatible in sa8775p ride and sa8775p ride r3 board DTS.
>> QCS9100 references SA8775p, they share the same SoC DTSI and board DTS.
>>
> 
> I don't understand this. You claim here that QCS9100 references SA8775p
> but your diff says other way: SA8775p references QCS9100.
> 
> Sorry, that's confusing.
> 
> Best regards,
> Krzysztof
> 

I will update the compatible as follows to indicate that QCS9100 
references SA8775p.

compatible = "qcom,sa8775p-ride", "qcom,qcs9100", "qcom,sa8775p";

-- 
Thx and BRs,
Tengfei Fan

