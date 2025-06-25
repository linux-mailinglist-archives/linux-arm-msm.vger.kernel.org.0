Return-Path: <linux-arm-msm+bounces-62261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D67AE7402
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 03:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E68AB1922E7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 01:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1F413A86C;
	Wed, 25 Jun 2025 01:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dT4n9tkx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1AE86338;
	Wed, 25 Jun 2025 01:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750813203; cv=none; b=qKPN4ebWD97fXXmdLM7gD7KXrUvuxTRW7hV8q5PGwq5N+4/w6BmugaiQ92eS4P6MjdUvf1rX3KM3my5yAHH/bcaqaQydgaSU3AerdgJ063SsDHyEZjI6xAOKYNsyUNbOVm5y19uQZL2T2Nmi1Shle7Ykula1aDSSGdY9s8aoZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750813203; c=relaxed/simple;
	bh=P5ePxMETrSWxyFbIxcwXqzB+VQ+kl5p4AKmmmJ3Xb7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q2aaHbO65I/osNaifRbgmDX4e2oaDvhD2rEhl1ZwNAH7XmLFWghBXc9Zjm+GlXzneJFGID1OVDrYhsCykk7xCWFxff2d6JIC4em+sdUQfagZG3rrSymI1fcz+754qGCtlsWNEHRooORsdcKXRmP4zp7EBE6QW4COHnhTsjTwwME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dT4n9tkx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ODw3iT021706;
	Wed, 25 Jun 2025 00:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIgm1QtUCU2wyvXa8zdT8WVlkmrM9+pCBwzR8JWrCFk=; b=dT4n9tkxtIrW8EeJ
	CInA2yfCEx1eYt6dALiyrRP4Jqhx4hOxPzBKTqe52A4wyIx+RmT9Lv6IQVZ87kdo
	ER6R3IKnYDubDF8PyCNejDBHP67v/E3UK8tEUtww7nP70OhJZCtMCdySwnl5C4NZ
	YaP1ElaRIGLLLg3dR7TaqFyR9vz8voZ0tUcw7lB5WbjHiwc8mMJVLEt6EhRxUMBv
	2D23iVP+hhf72x+JrDxYbxahzkpwurdn70iH1ROgTwSSLTwhQvnwDGi29I1tbg9R
	WboTjbfSsGD5W8o+19jusPliW2ZCDuOosW4hb278ZqiqaGHtlhj6DaWKq/dmAN80
	7cZltA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpx9wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 00:59:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P0xnI3024939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 00:59:49 GMT
Received: from [10.133.33.49] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 17:59:46 -0700
Message-ID: <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
Date: Wed, 25 Jun 2025 08:59:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b4a07 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ETpKHP0l2JGKE01atXsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAwNiBTYWx0ZWRfX3pX0M/DIpz3O
 BrslRjXHs3RbuJ2M6+q3Aqr72gNqVz5SEE51pGGEqW+FwZuchAUvJjzRmHQM4xy+Kv+rdCGCfYh
 jLwXHirFa0WRCPySaKq8LaLIfAR24S+7wGvX2gFTTd1Q14vN8CSx/H1CsaNbfMTte39fdiZqlVE
 UWPWxGaHXtQrc1B9fAKjauRDZLtZgXCndey4n0k46+GR/zCRztviHX5yp5sriK5+k+cM+wP9U8V
 QGmXhYdOJXQcNx7CeYDKCqMlGJwY1ka3q1xkORU9qLzqBQtjnXDHy61Prab8eJKPPTkyTG00TjJ
 t4YKO2skiPL96se5OgYfkIU8DrKXAyzmzkcHCjFwj/Gb/ZdGsZn/7uBMVWKmFzkf4yRogx/VTiD
 EsBCQul4GpHCiHBOZmmMWzX5OjGMMf7iRm85uhvqiPjBdCYHx1xWoi2NhfZkQA3F8xNXjNPA
X-Proofpoint-ORIG-GUID: pmLDGFZaYvRs2Hu_YyCu8FnXxentW5R5
X-Proofpoint-GUID: pmLDGFZaYvRs2Hu_YyCu8FnXxentW5R5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250006



On 6/24/2025 5:59 PM, Jie Gan wrote:
> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.

Hi dear maintainers,

I just realized it would be more efficient to introduce a common 
compatible string for SoCs that include two TMC ETR devices.

Most of these SoCs share the same CTCU data configuration, such as the 
offsets for the ATID and IRQ registers, because they integrate the same 
version of the CTCU hardware.

So I propose introducing a common compatible string, 
"coresight-ctcu-v2", to simplify the device tree configuration for these 
platforms.

Here is the new dt-binding format:

properties:
   compatible:
     oneOf:
       - items:
           - enum:
               - qcom,sa8775p-ctcu
               - qcom,qcs8300-ctcu
           - const: qcom,coresight-ctcu-v2
       - enum:
           - qcom,coresight-ctcu-v2

Thanks,
Jie

> 
> Changes in V2:
> 1. Add Krzysztof's R-B tag for dt-binding patch.
> 2. Add Konrad's Acked-by tag for dt patch.
> 3. Rebased on tag next-20250623.
> 4. Missed email addresses for coresight's maintainers in V1, loop them.
> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/
> 
> Jie Gan (2):
>    dt-bindings: arm: add CTCU device for QCS8300
>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>   2 files changed, 160 insertions(+), 2 deletions(-)
> 


