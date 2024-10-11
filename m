Return-Path: <linux-arm-msm+bounces-34167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C60999ACF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 21:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2987288893
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 19:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F561D1745;
	Fri, 11 Oct 2024 19:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jZ7DJ46P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C33C1D1519;
	Fri, 11 Oct 2024 19:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675798; cv=none; b=WTJmUY5+oUlQFtIVZpLSjOQwxo0sQ4q8WeX71blI9O25Pxi0c+Tzv9sCttF6CxFdAhYhZ5nEnGw5/0wJQk35zNRkaV3SV0qt3MTDxPfc3Qn659xkwMs28iw/dH4jrAb0s5y5hwF6KS7c0KX85Rd5jPxrAO9+QkZgFxTHHbiblZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675798; c=relaxed/simple;
	bh=19dcVNGjClN7dc6fgBSZBGsjrxIzdsSE0BFNT1BBkfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nt7DQFc5OiZ/HRPTXv5n/dmp2+ROQryFUC37JjM+qWIAXWbrgwbdPXzGKbSXsnM6rAnbdYzsEAjymhpV/C+H5tji3GAWWzNQUB8hkfPMWmLc+Vvj/Na7BGilyzznws4NdG0nxek8XiyYnVKRFS/xRGkyivQl5f3nBBpQpn75BrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jZ7DJ46P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B9Kack020018;
	Fri, 11 Oct 2024 19:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pF0zjAyQUiqbVHpPNRTuGzaKQoOSQt9mZXU5eHyqL8=; b=jZ7DJ46POuhN0SRJ
	7Cre3yUvEC5Qcgo3cPiqkV9WXj+19JKmKdNxI15HBD4xjvw0lmzQkJLS+iTDCf8V
	C+udm+JvS2WbHOAIrt2zD8K9ywCQSJ8mArLayHniksKUX+zvuOciPaI7wxd4oODK
	UbQlOf4SvoRWiLUJc+ehxQVwpCtTx6cDxnQ5pPwwDqidZIhoeAS14ZfzYx0hFZ9v
	FLbtk1Cs7BtEF1iSRAPcQMYDlZVJwWeyCXUE85sMpa8kmlYt/49ETcI7oBVvVIe1
	XQXYvmPDF4u9aCHsyEIGzotCub4HBdTDUdMmezEOMismzQhGcMOeZXX7YkmA37ce
	9lZAlw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426db7mu0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 19:43:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BJhDca029830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 19:43:13 GMT
Received: from [10.48.240.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 12:43:12 -0700
Message-ID: <31cdb71d-8545-4d36-b2b3-480e75606fb3@quicinc.com>
Date: Fri, 11 Oct 2024 12:43:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
 <20240829134021.1452711-5-quic_gokulsri@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240829134021.1452711-5-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7RdJwOByCK5hrb-3BuzkKCwh05pVTrtq
X-Proofpoint-GUID: 7RdJwOByCK5hrb-3BuzkKCwh05pVTrtq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=732 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110137

On 8/29/2024 6:40 AM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
> changes since v1: Addressed comments by Krzysztof
> 	- updated the order of items to 'qcom,smem-states' keeping
> 	  'stop' first based on changes to binding documentation.
> 
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 58 +++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 08a82a5cf667..2d55f0697225 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi

My ath vetting tool flagged this file as having a Qualcomm Innovation Center
copyright that was not updated to contain the year 2024.


