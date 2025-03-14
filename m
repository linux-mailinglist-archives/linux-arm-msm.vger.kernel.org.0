Return-Path: <linux-arm-msm+bounces-51367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 906DFA6094E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 768677AC85C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C72B1519A1;
	Fri, 14 Mar 2025 06:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FZxlmLdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877D81459F6;
	Fri, 14 Mar 2025 06:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741934943; cv=none; b=l1Vt24InvkyFN/kxqy+IoTGXujsljr15H0UUa8lRQG4+i81MHz1/r7Zy5N45Wchv/Pe+3J5XCasyaVsuR2vGe3eQXmGYLDaiFpjZ187WmFmKCt8jh9O48b5cNFCCmTjnD0xKg5NuVD+0SMU7/jBmckBiFQui6lHJtQ4yyiqcRRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741934943; c=relaxed/simple;
	bh=7siKfymkqxeKWqRMOBQc0N37LTnF6XkxQ3srqGFEvAI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=B6T2YPCDN3f7US1hquXqeBTC+nDVm/MNc6QZxjVxEcL7/JTamKMzoUSA1WBu/6bmA76O7/VzO9pgWRtYPSUG2BS2niQmRWj9gZNuDFzhBpwp7NYyYYmDhaYZTD0T/qjEYqyh761Rqm/+/QN0fU3k7FhS+yhnjnqkW+yfr5Dc9fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FZxlmLdu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNQFWV016250;
	Fri, 14 Mar 2025 06:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MaCpXfb3JPjPHy6NINCGjp1vFdz3O7GQV4p4DUWQ9ZU=; b=FZxlmLduVbQAKx+N
	HGVwSQsBu4a+1pkRqxHlxKkjz4vRxEz7Qh1tS0LsXpieRJQUPgBoKJlsq5m/soEd
	4Ol+R/JaS3mRxPyWlqh2k8MU4f38yJ060nj5dF8p/LCFc/BR8CeIrUrxqZB6S7AO
	clAfiDWr4aNtLIqZCb87YnX3xbbGmoB7d35wm458Fy0F+mtqHsMhEaG47X7tj48l
	TxH5KxHipn1Adw2ohUCr48fPhvYhQT+EFsIZhagevmyRIjUOFOgUAIhPUwB3bUEM
	nhbjW+NgOBybhixgFTeuPIfEGqByZ6RmHbtJa6ilKx9ViACSFUWP0krls1+FrvSA
	ZvZndQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p0aa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:48:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52E6mtOP022785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:48:55 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 23:48:51 -0700
Message-ID: <7137bf34-5b97-47ca-b4d8-375db26b433e@quicinc.com>
Date: Fri, 14 Mar 2025 14:48:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16] arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
From: Jie Gan <quic_jiegan@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250310095625.2073735-1-quic_jiegan@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250310095625.2073735-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F3tgMyC3ewozuhG1qMmXy_gTst4NIAxU
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d3d157 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=Hs2wwgZTwTzAjPb5Lc0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: F3tgMyC3ewozuhG1qMmXy_gTst4NIAxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=770 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140052



On 3/10/2025 5:56 PM, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable related functionalities.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
> Separate from the patch series: Coresight: Add Coresight TMC Control Unit driver
> 
> Changes in V16:
> 1. Add acked-by tag from Suzuki.
> 2. Rebased on next-20250307.
> Link to V15 - https://lore.kernel.org/all/20250303032931.2500935-11-quic_jiegan@quicinc.com/
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 153 ++++++++++++++++++++++++++
>   1 file changed, 153 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 23049cc58896..93ca37843990 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi


Gentle ping. Can you please help to review the patch?

Thanks,
Jie

[...]

