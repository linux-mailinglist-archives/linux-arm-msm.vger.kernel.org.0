Return-Path: <linux-arm-msm+bounces-50797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08ECA58F23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34D3716ADB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EFF2248A8;
	Mon, 10 Mar 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IGVdSzwk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15473224888;
	Mon, 10 Mar 2025 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597979; cv=none; b=uru+ERb9TEu76KuJ/6DrGIb46rzJpU2BeUgZuXULZhfqQ4xE8wp5KHYy3lnnz3Ivn3WxtDq5isTAZr7cJDrLhIh9lJQcZb+l6fxxHtETDBXXV9J3pPLw25kBfVR4DsIEoB7s0yCZPWSWViL7hZ5IUv+VNkUxehfuyA2YqEg4dZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597979; c=relaxed/simple;
	bh=Mn6h+BMB87DiWKU6Yz9hRi+1rLg+5Nit1ed7x3nBj9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kQri2Se2NY+JceAA9f6VdomKHAPRYdPMyMrNU8guhuZ3t3xDdo6DP8uPFXUuIOKGwfhs2cl44/l+Oip+Fyhjehu02CvwOxpy8cs6JWYIx7CDjgDGEKgw5yRusv07/IyQXzM5dieO9JTq5Om8N1uUYHJciDdn7eAuZ2+1H6WELU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IGVdSzwk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529LXgnA009677;
	Mon, 10 Mar 2025 09:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ReJX62Xlf6McKbA8XnwDlwjOxpXHu63zuqxlPTrACqg=; b=IGVdSzwkbAHfppba
	IFroBkOnvrgviBLWCBXhpfHIVPE6HatcuHc3QwhfEOkCYSeX7s1SP5lCnr2E8CyB
	8HyPpivytCmraM1LL64G52ISlUJKxwwL/T7gv0h36LppXlccgp3/oKPcfUwQH1yP
	sgshf/VBulhLeMQ0NS671d005FAzL3BWvBuVUU3MSb6JnQP/TUWmvAYpo7wmpqAf
	lWEVu5R8YqL0dyAcx6WzK6inrLy8f9PC1WKfb+rhvQhPx7FJ0RG1IGNQLpcXvveW
	WrYBrlr3lDwF7/LSIn+QV0yExTH5dZDsllnDEhdpHgH8h3Ejm3f24UkP91tukYTf
	ltukkg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eypc7uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 09:12:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A9CeMp003336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 09:12:40 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Mar
 2025 02:12:35 -0700
Message-ID: <ca5e2cf0-598f-484f-a096-137baeed381d@quicinc.com>
Date: Mon, 10 Mar 2025 17:12:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sa8775p: Add interrupts to CTCU
 device
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
 <20250310090407.2069489-5-quic_jiegan@quicinc.com>
 <24d5b56f-5078-4128-be66-436b1755d4b7@kernel.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <24d5b56f-5078-4128-be66-436b1755d4b7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67cead09 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=LYRhW265CccdMHecqKcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NwpcMfXHA5abAe_BogOW2WBCoXpe-CLW
X-Proofpoint-GUID: NwpcMfXHA5abAe_BogOW2WBCoXpe-CLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=863
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100072



On 3/10/2025 5:08 PM, Krzysztof Kozlowski wrote:
> On 10/03/2025 10:04, Jie Gan wrote:
>> Add interrupts to enable byte-cntr function for TMC ETR devices.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>> Dependency:
>> prerequisite-message-id: 20250303032931.2500935-11-quic_jiegan@quicinc.com
> Which too generated such changelog? Why this cannot be lore link?
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

It was entered manually. It's my fault, will fix in next version.

Thanks,
Jie


