Return-Path: <linux-arm-msm+bounces-27207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3061693F212
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBF941F20C17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC13013DB90;
	Mon, 29 Jul 2024 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HNd+T7Zk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8678C63;
	Mon, 29 Jul 2024 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247374; cv=none; b=sDolZdpN3j0ToI4EZXokTW4QoHX0+HuPZ5e8LcTrSIEzIJn9oy0grkZ8vI2Aaa2atvDX1sZZaKQakW9kunkuylqM8CdaOuSTXQLXAJyRe6EI6i/peM+Y3oZ9z2GOLuvvamHOIfbIwYKMURKH31mmvz4Wv6K2mmh3PxPrddy86N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247374; c=relaxed/simple;
	bh=gvf6ip9Kue63s8nUMIoTRjpaQQYGvvTsMYy34PU+MCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZNpSpm5zyEHR+L3jD5dLxpvy/3z3lfwahdI1En9lGAvo1AY+NbozXGKoCsAyAxVyv/WfwjgwRK5YR7w/6hsmxLT8fjog6CPWr0zUruxX97q1blHQAIKTpEf2OX4mZuWrYaOHEa3JcW1H9ET59bEn8qt8rDMcxFcQf06IKg2g9B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HNd+T7Zk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNc8e9013120;
	Mon, 29 Jul 2024 10:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6bTuKJdgRP0bfLUKHlv2h2usm4nwS54OincRd95mHY=; b=HNd+T7ZkpK6nB+t/
	xCQsn3LL82V9+oFsNeaPbT/9grMYGD5YLf8gwa/9ue6eaH90Ktw8zWGY2Toz9U31
	H5F2a/L7/n8sASVJ6L9jQ+FlxuQx9GC1QehhhqZA0yLqBJJh5/Migx2vcR7XmeoL
	CRRwqJZWiW+5FI8R5xS201aj3N8TrHHDog46QeQZsVUugxvgPkRPLxLi7rbPGrSD
	qblFp3469aMZ9shZEtP5kdLOZA5P1lGiE55eRewluWLxvO14GueHZYjOHKEXAQwM
	gvgO/J3B30viR4f3uwnbOBlxkRVKNEXhR9f1tUHz2Pj3MuiDG93p2e7dyY7gvoHk
	28z5hw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mpkeuwf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:02:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TA2g3e014961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:02:42 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:02:38 -0700
Message-ID: <86dfde74-e126-425e-8f16-a850b5c2ef60@quicinc.com>
Date: Mon, 29 Jul 2024 18:02:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] soc: qcom: llcc: Add QCS9100 LLCC compatible
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WhcKul5n0p_vYwWmHsv2T8sOjdwMJJRo
X-Proofpoint-GUID: WhcKul5n0p_vYwWmHsv2T8sOjdwMJJRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290068



On 7/9/2024 11:04 PM, Tengfei Fan wrote:
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.
> 
> The final dtsi will like:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
> 
> The detailed cover letter reference:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Changes in v2:
>    - Split huge patch series into different patch series according to
>      subsytems
>    - Update patch commit message
> 
> prevous disscussion here:
> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> ---
> Tengfei Fan (2):
>        dt-bindings: cache: qcom,llcc: Add QCS9100 description
>        soc: qcom: llcc: Add llcc configuration support for the QCS9100 platform
> 
>   Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
>   drivers/soc/qcom/llcc-qcom.c                           | 1 +
>   2 files changed, 3 insertions(+)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240709-add_qcs9100_llcc_compatible-3477559ba2e2
> 
> Best regards,

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

