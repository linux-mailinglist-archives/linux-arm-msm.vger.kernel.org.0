Return-Path: <linux-arm-msm+bounces-37443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F4C9C36A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 03:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFF691F2144E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 02:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF443E47B;
	Mon, 11 Nov 2024 02:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TCBA2FtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEF78468;
	Mon, 11 Nov 2024 02:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731293070; cv=none; b=rcdrOND1hTJgPYoWmJfsWB4HQoZEjayR47vCFlzaKSAHtTXYuVfK1+dAD1SPK8f2AgDgmTunv6f6Xn0kK+CQuOjM09/jkwPTTrE2lzyAgsRTr6YYh1k6/UIYRH+3muekOxo429xfU4pdzmRR02iINCHg62M5SiAJLCTMnjAEUMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731293070; c=relaxed/simple;
	bh=XfAhMrU++l8uIUT8wLVyx3QQ1+LnFZOrwrpX8QGhkvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QzInAziDX6PJnwIPn4PXrZJ4xx7uHZdp/txAe1SEozQd272Q/hyzJzlmOBNilvbQc5Uq07x9kqOSiFqrTHC3bg4nJVphRhBbWWFHmI8aa8Wg8W15c0EF5uOFkPOxoUo4wOAx/yOuNPiS7yrCtugPodL63riH7KsMu6zQu8FVsbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TCBA2FtZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAMx7mp014837;
	Mon, 11 Nov 2024 02:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGVtoWk9GaJ4YGNnF2zEcF+QhET0xSdC40/x/8zsFpY=; b=TCBA2FtZW9vZdYLa
	B7iLnF3R0PPwwuMkaLGOysOtqpDFJBBqhMqY+XwdrnUC1fyp1Q+7Nwd7RiF20oSf
	4Kq2BtCzOhjyfojUZXdk94qc34/N1cYrf4VV6K8kCBlsjO1oBTq15K+/Q25Pk6UE
	HHVT/NSNa1RY8wan3ldp5WoODbOPxePihP7D/rtr8MTevaBYKN+ggO+Y8v413Zue
	cubg0HMDGu1mUZgrSGzf1b9h1/1UpGWV1Z/BkAS26HqOwpnZCnQhoi5vDQZZIRlw
	ZFpEFOWUtsvUKpk04iU9z6mNHTM5MO0h760fbN+lsce69CtZEjtkmKl1ypi6e5eK
	UenfuA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42syax3157-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 02:44:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AB2iMYd009334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 02:44:22 GMT
Received: from [10.253.12.60] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 10 Nov
 2024 18:44:18 -0800
Message-ID: <40a3b578-1b9b-46eb-b9ff-ce85ce485afd@quicinc.com>
Date: Mon, 11 Nov 2024 10:44:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add aoss_qmp nodes for qcs615
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_sudeepgo@quicinc.com>,
        <quic_taozhan@quicinc.com>
References: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
Content-Language: en-US
From: Kyle Deng <quic_chunkaid@quicinc.com>
In-Reply-To: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3O9fpLPJ9FASPFQutRx8AnoQjJOUSJGK
X-Proofpoint-GUID: 3O9fpLPJ9FASPFQutRx8AnoQjJOUSJGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110020

Hello,

On 2024/10/18 15:34, Kyle Deng wrote:
> Add dts nodes and to enable AOSS_QMP on QCS615. These nodes provide basic
> AOSS side-channel message RAM information and mailbox capacity.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> ---
> Build Dependencies:
> - Initial support for qcs615:
> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
> 
> Patch made the following verifications:
> - Successfully passed dt_binding_check
> - Successfully passed compilation and node checks
> - Successfully passed the invocation and execution of the upper module QDSS
> 
> Changes in v2:
> - Add reviewed-by tag
> - Fix typo error
> - Link to v1:https://lore.kernel.org/all/20241017025313.2028120-1-quic_chunkaid@quicinc.com/
> 
> Kyle Deng (3):
>    dt-bindings: mailbox: qcom,apcs-kpss-global: Document the qcs615 APSS
>    dt-bindings: aoss: qcom: Document the qcs615 AOSS_QMP
>    arm64: dts: qcom: qcs615: add AOSS_QMP node
> 
>   .../bindings/mailbox/qcom,apcs-kpss-global.yaml |  1 +
>   .../bindings/soc/qcom/qcom,aoss-qmp.yaml        |  1 +
>   arch/arm64/boot/dts/qcom/qcs615.dtsi            | 17 +++++++++++++++++
>   3 files changed, 19 insertions(+)
> 
> 
> base-commit: 8c6492fad8370b1181bdf18a04dde748ff0e108a

Gentle ping on these patches.

Thanks,
Kyle

