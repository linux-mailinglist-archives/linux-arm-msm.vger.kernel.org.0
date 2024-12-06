Return-Path: <linux-arm-msm+bounces-40714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F1D9E67F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 08:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD90282014
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 07:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423461DD0EC;
	Fri,  6 Dec 2024 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="od++vSPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B315D3D6B;
	Fri,  6 Dec 2024 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733470160; cv=none; b=cOb7mHJuGvhmIjHqXB947f0K2C20E1GJovvw4vshEA419s5uGwJLpyO7aB80hz5pjH2vPUku1vmGMB2Tney9NFmU/qcnM3/4V0rNk9Wpi4z7ntqXZy6BvSS4iu55QGEUUf5i9uZufiNeBBhg8Y4K9wZBNXj242cDkTzuFn7ssz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733470160; c=relaxed/simple;
	bh=PB5x3EV2jv3hGlfGVIaxE5L4yPllITdIOqOtjEM32tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lx0EU9rqc1XcLe86+ZIPQJSagnbu3Qe23ODh9rxtk4wX9ciRNhG/IHTDlhgBa07x4apgn4MilZNBHXYA7pf98dtiO5/8lnhupiLDj1H0HNFTYedRaCE4bAJmUPwjvfv5an8mKThMucJmPsfpJ9tMN1IVIvw0dgvOz/mbLKIbFI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=od++vSPq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B64ae6t003357;
	Fri, 6 Dec 2024 07:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J2GrnN1Uv/4SUPePog2TkVpdINK4+qu0IfB1iBpImg8=; b=od++vSPqUO2I+pfh
	y5Z6Y4WxCjceZKtvQLV0FWLLbkyUN+gsRZdwd+x1Xa6vifXsQJoYusSCzf0FdZUl
	ZtTZzL3ggZqqjJY78DuXWUQX9FTyQDgQAYLf93YN0gV48IvhNKaSfBZzChFgfH7I
	4FAdhskiiNh+f+VZyA2NYcmPV9KEvUHid6R7qkAvdfWLub9ESGWWweum5/Te6wH+
	VVwkbAhgwK12maNMuiWnqW5GlzS3IL2lCA44VxR4fOzvqrWSO025sGESK90PrrCy
	gNdPO0pIgxUeKWGVfZWIB4gIrMA23vO9h3RAvRkT0eMLGAonGw7yT/I7OjsMsz3O
	eamg3g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43btd30e8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 07:29:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B67TFgA012625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 07:29:15 GMT
Received: from [10.50.58.122] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 23:29:11 -0800
Message-ID: <11d49831-8d20-45ee-94ae-38248340fa1f@quicinc.com>
Date: Fri, 6 Dec 2024 12:59:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable TRNG support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OuDAxTULNtSxMKLNm2Z8xTl9uO3P7QrI
X-Proofpoint-ORIG-GUID: OuDAxTULNtSxMKLNm2Z8xTl9uO3P7QrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=446 spamscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060052



On 12/6/2024 12:50 PM, Md Sadre Alam wrote:
> This patch series enables support for Truly Random Number
> Generators (TRNG) across various targets, including IPQ95xx,
> IPQ32xx, and IPQ54xx.
> 

It should be IPQ53xx, not IPQ32xx.

--Manikanta.

> Md Sadre Alam (3):
>   arm64: dts: qcom: ipq5424: Add TRNG node
>   arm64: dts: qcom: ipq9574: Enable TRNG instead PRNG
>   arm64: dts: qcom: ipq5332: Enable TRNG instead of PRNG
> 
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 7 +++++++
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 


