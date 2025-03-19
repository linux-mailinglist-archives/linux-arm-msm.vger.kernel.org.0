Return-Path: <linux-arm-msm+bounces-51891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6FBA6842E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 05:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A5A219C33E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 04:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E8E24E4CB;
	Wed, 19 Mar 2025 04:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QOJjiWmZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6121171D;
	Wed, 19 Mar 2025 04:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742358096; cv=none; b=AgQ6Py7WnXYuK1Oj/iFro7pApPEQ5tmfa1MCBgGoVFad8Ba3pvL9ldCViXhItY54l18s0vo+aqClIEURo+A9r+trEHx4aG3jcUjx9kUokudvhxH5sldEFkZeaYHBZWSiULv+00Ugp4wTadgRR2b2wQAhqzKkMeOgrczVrve+SOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742358096; c=relaxed/simple;
	bh=u2x6v/DP21cUah7VXxUMi9AAXBCEvcnqV1Q9CsavI2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A3Rh+cPXg0KAtSRdDTqeT6fHDjCo8GfOHVtzP0KdY8qmHTaG60ZKq9X9I0avOMH0lYiOEf4AC5WPDH+PJchKmAZUx/A9VQ8P8C/2tOuPZpCmS2NvgaGHNEiepA1c+Qwbr+5UIf9gYR2xdZdcd8k8kwbVqHgW3rOMIAtREnVUbZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QOJjiWmZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IKHfUg019837;
	Wed, 19 Mar 2025 04:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+xx1UQ986lY6Wq5HXulZbAulIHQ1wIw3+F0N5/Vfyw=; b=QOJjiWmZ2onxYOFB
	4YKycnTfOFg8dtVPY/seEprwGaK/cptxQYJdapSW6bz/Hqj/z2udRY6Pd6qFQfpG
	fso8yMTD5k7VkMNcEqACOlM94pRP6aba2yvxrF8O+Bi10Vbr6U+usXE28xMLTJLN
	P1HPkqwu2+AGnbfoGxS1SmdOE8p2bLYMsvRlca31LE/zOln1TrVeIJQvq8PrdT0D
	GTZa0vKapBpvigy7ncP03urOFBFT6qLhrHpjJr0LzcqyONxDCWnyaZPBsqSg9UtD
	CAcDwXefM+R8ab8mIu1aG+V25Rh9VEHsi2OYETBPi8IdVt7TXmKvTrhwh9J2GIK1
	sOhZmg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbkyhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 04:21:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J4LVmY032151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 04:21:31 GMT
Received: from [10.231.216.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Mar
 2025 21:21:27 -0700
Message-ID: <f01f371e-730b-4845-830c-68eb2acd6809@quicinc.com>
Date: Wed, 19 Mar 2025 12:21:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_miaoqing@quicinc.com>,
        <quic_zhichen@quicinc.com>, <quic_yuzha@quicinc.com>
References: <20250318093350.2682132-1-quic_stonez@quicinc.com>
 <20250318093350.2682132-3-quic_stonez@quicinc.com>
 <64ccc09d-7e1e-4c20-90e9-43b36a9cc46b@oss.qualcomm.com>
Content-Language: en-US
From: Stone Zhang <quic_stonez@quicinc.com>
In-Reply-To: <64ccc09d-7e1e-4c20-90e9-43b36a9cc46b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67da464b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=COk6AnOGAAAA:8 a=QgKzW8hEQoSECZXTZl0A:9
 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 66vjas2RYRrbngMf_L5rH1KUHyPkZeRQ
X-Proofpoint-GUID: 66vjas2RYRrbngMf_L5rH1KUHyPkZeRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190027



On 3/18/2025 11:54 PM, Konrad Dybcio wrote:
> On 3/18/25 10:33 AM, Stone Zhang wrote:
>> Enable WLAN on qcs8300-ride by adding a node for the PMU module
>> of the WCN6855 and assigning its LDO power outputs to the existing
>> WiFi module.
>>
>> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
>> ---
> 
> This change looks good generally, but please align the various stylistic
> things, like property order in the nodes you add with x1e80100-crd.dtsi
> 
> I also see that board-2.bin doesn't contain the variant string you've
> suggested ([1] @ commit 646e008ec53a8bb9ae16ebf98a65b29eaefd6da4)
for qcs8300-ride platform, WLAN uses borad-2.bin from link:
https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/blob/main/QCA6698AQ/hw2.1/board-2.bin?ref_type=heads

> 
> Konrad
> 
> [1] https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/blob/main/WCN6855/hw2.0/board-2.bin?ref_type=heads


