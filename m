Return-Path: <linux-arm-msm+bounces-67162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B29EB161E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 909B618C8615
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8582D8DD1;
	Wed, 30 Jul 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mwyGYuTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A22D8DDB;
	Wed, 30 Jul 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883607; cv=none; b=K0sHtEsyrkb0sjsGl9YesRAuP/8mnisoW7BTwdHCmmER+xJfL+9EUXJjLCDewJBJHvpZhGfYBqA0Jc9Tv2FL+iiHasyv4utWMPgfaLKabZ3aYZWX/neBPjXIjaMf76JRZc3ECzVh0fTdura/w2bfvtXy+4nYM9HsZ5fCt29BLkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883607; c=relaxed/simple;
	bh=stuy2rI58Vsc0PiqRzUo/vprvXkWOhvLV54M9TdCCp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JBTSYaKM0ozSDr+ZlyYk5PJ0Qz/lyYUnpfjChzp0BMiR5HSmG4Rer9D2PrtSY4Rx4MazgI1IWbWiYUu/DgCcs3WAlgdMcop252FzBLbL6FsdLwCt9lECaehFGdqDAsafhYkqJ4Vp3omAszdrHBdxQa/VhuZXBoSKk9eK6f0qoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mwyGYuTj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbAWo006561;
	Wed, 30 Jul 2025 13:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krEHYvALcIr5L6u5+iHLkKXMi4mmcRlQVfkjxj3pvNc=; b=mwyGYuTj4PGqy940
	pI/w8l+YapTE88rnvZzY17Je1eChVB/Zdd8J3vcpyc1DGPyfwolQec+jbsoA/Hvc
	OaTlz9Z/tgSLU20JoW5mHuffzefRQDomdP4YxPntTzWDliR9w2a6InbAMFNgxEuW
	4CFN8SZGdA/dEtCo7asPg9hqCcB1Q/0voiaToNwhxU4I77ythcG8Of/DcnmQGvH3
	zEy90BvFtbdGtQTWK1kioSOgheI87J/vLhGaRJ9HOGnyG/aeLysCVw5oZLlEjDhB
	THvTHoQo49jMIwBKvViDGOFQV4BlCnoimfM9z2iyBWU3eVcc4J/iVbjOaxIZLlHH
	J421qA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xhc2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 13:53:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56UDrFb7023656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 13:53:15 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Jul
 2025 06:53:10 -0700
Message-ID: <df8b3c85-d572-4cee-863b-35fe6a5ed9ff@quicinc.com>
Date: Wed, 30 Jul 2025 19:23:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] dt-bindings: ufs: qcom: Split SC7280 and similar into
 separate file
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche
	<bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Manivannan
 Sadhasivam" <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Andy
 Gross" <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Ram Kumar
 Dwivedi" <quic_rdwivedi@quicinc.com>
References: <20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5OSBTYWx0ZWRfXydAnmnJ2pSbP
 +ehsQxfAiJLBtgMi0jfpm0+MVaIl8SshR3yPXcHxTA+jGQGa7f1kVxBt+TiupW1S+vHg9ulZ/oI
 pVZOb8nFjPBTnaDubMhvgdQAI3XVbvl+0FfozuzIcdNTeX8TX6fNrQFdkkVLJfAXJep8ZoJBQ1r
 MtV3GRRy8ftdkZmnZrf6C5ZMTCzhB1PegxVB4HSv+iafD503bYfwB4ktw+Nffi3SZK3cId4C4v9
 Pn8sJSmHgKrKoWKtCbpOUiMi5ga8TpHmQepSZuK9PddCARnYDhGbgEW70Yai2OI07A5p4naEHLb
 VH72/hsRBRduPg4oDxM/g56Q6vlUjqYwih858o0CIVLGU0qeZyvFkCNgRxz1FIJyY4GBL7zn1VB
 DubPnm1yC6czb9CeZMg8HEMxv+kSJlXzY9dtj4VQfB9w8qZzOedamIdzodDlHAF7QXmS/q8s
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=688a23cb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=HodSQJYkpgkrawyL3x8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ikEp6fss3AxCKMVGJYn3mxCMUe8sAJCY
X-Proofpoint-GUID: ikEp6fss3AxCKMVGJYn3mxCMUe8sAJCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300099



On 7/30/2025 6:05 PM, Krzysztof Kozlowski wrote:
> The binding for Qualcomm SoC UFS controllers grew and it will grow
> further.  It already includes several conditionals, partially for
> difference in handling encryption block (ICE, either as phandle or as IO
> address space) but it will further grow for MCQ.
> 
> See also: lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com
> 
> The question is whether SM8650 and SM8750 should have their own schemas,
> but based on bindings above I think all devices here have MCQ?
> 
> Best regards,
> Krzysztof
> 


Hi Krzysztof,

If I understand correctly, you're splitting the YAML files based on MCQ 
(Multi-Circular Queue) support:

-qcom,sc7280-ufshc.yaml includes targets that support MCQ
-qcom,ufs-common.yaml includes common properties
-qcom,ufs.yaml includes targets that do not support MCQ


In future, if a new property applies to both some MCQ and some
non-MCQ targets, we would need to update both YAML files. In the current 
implementation, we handle such cases using if-else conditions to include 
the new property.

For reference, only SM8650 and SM8750 currently support MCQ, though more 
targets may be added later.

Regarding the patch 
lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com, 
instead of using two separate YAML files, we could use if-else 
conditions to differentiate the reg and reg-name properties between MCQ 
targets (SM8650 and SM8750) and non-MCQ targets (all others).

Regards,
Nitin



> ---
> Krzysztof Kozlowski (2):
>        dt-bindings: ufs: qcom: Split common part to qcom,ufs-common.yaml
>        dt-bindings: ufs: qcom: Split SC7280 and similar
> 
>   .../devicetree/bindings/ufs/qcom,sc7280-ufshc.yaml | 149 +++++++++++++++++++
>   .../devicetree/bindings/ufs/qcom,ufs-common.yaml   |  67 +++++++++
>   .../devicetree/bindings/ufs/qcom,ufs.yaml          | 160 +++++----------------
>   3 files changed, 251 insertions(+), 125 deletions(-)
> ---
> base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
> change-id: 20250730-dt-bindings-ufs-qcom-980795ebd0aa
> 
> Best regards,


