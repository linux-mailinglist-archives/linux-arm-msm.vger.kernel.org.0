Return-Path: <linux-arm-msm+bounces-31674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9C977839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 07:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC55B2879C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 05:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06B11448DC;
	Fri, 13 Sep 2024 05:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K5KBUARH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734917FD;
	Fri, 13 Sep 2024 05:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726204757; cv=none; b=GD5mB1ax3PPMgqONxchW2R1xSfEBfncUK54FeSNnmujYRi1ytvuFQN5eAdD1mpWxzwCf6xaiHyYdhJsa5K7naic37RRNqTCCkJp4TymmUESRvs/61P7E5tKM9eKA76Z/YdbpIWf2u2vnRoowvnp61ICA0yY/J0WdOmf4cHEhMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726204757; c=relaxed/simple;
	bh=aR9LN1buTA/IxsC4E88/Bgxaw6OweBTG4Odhn372LlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sR69ZvkL/331ktzNdHQ3tS3xRxJR1GeXPB3Mw9NkXS0F3cdTWGLyc3Jdd+6QfN/2e/lmF7ftE2iAjdMsd9APwHKVlxSrZV1r78+YTrxidqqXgfoXN2kv7B9xKRJKml6kMbmT/arar6iIlodNibgSMdy6ibJKB1Jd/JFDWn6AtZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K5KBUARH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMB6eT004962;
	Fri, 13 Sep 2024 05:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrAwKnb+B3d+413qPsr4KXDdqL2unh9P+kLire20ZLE=; b=K5KBUARHsRIc4r0d
	zGE7sWnWB8/1k+wpv5+W8Zf+nuVz4CdmZvwAmyDiUe2njUXw/WnSiZndw4fGv+ee
	vWPTQUPckS6RNv4wuJIxx1DKR0yv38/gOYqoyk7q+j7kSJLM24yqFG8DhbzB2E4V
	HFmxXnD8taTsNe+1Q1C7+1mSoI8L8Dg+JMA6/NWfwwtSTG8QTNgdVdGFP98tMsYF
	V50qkGoOcHU0T1R632VCcJWnLRDV0PKao2z4XCvmaMc4aW+Uy9SsKWGsJ9sPg8uL
	5zc0V1IJpX/JWqPhMiym/M9ccrXkAvFaM3+KGmmH3YK0xQbvDQ9g5X6Puq+z/5g6
	r3N/IA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy737phf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:19:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D5JAbg016575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:19:10 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Sep
 2024 22:18:33 -0700
Message-ID: <3e1594f5-7134-4210-a232-2fb1595d2166@quicinc.com>
Date: Fri, 13 Sep 2024 10:48:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
 <20240816-qcm6490-lpass-reset-v1-1-a11f33cad3c5@quicinc.com>
 <ac4eca9d-8a2c-49a3-86d8-0201d5078dde@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ac4eca9d-8a2c-49a3-86d8-0201d5078dde@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: unDEkUomD-nVWby814y2Fksn6DbPb2aL
X-Proofpoint-GUID: unDEkUomD-nVWby814y2Fksn6DbPb2aL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=851 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130035



On 8/17/2024 2:51 PM, Krzysztof Kozlowski wrote:
> On 16/08/2024 10:32, Taniya Das wrote:
>> Add the new QCM6490 compatible to support the reset functionality for
>> Low Power Audio subsystem.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> 
> Subject is odd - I do not see here anything related to boards.
> 
> Anyway, this is incomplete. Look at the rest of the binding - you did
> not update any part related to proper clock constraints.
> 

Not sure if I understand the concern, but I was of the opinion that I 
have added a new compatible for QCM6490 board , but no new clock 
constraint added.


I see a patch from you 
https://lore.kernel.org/all/20240817094605.27185-1-krzysztof.kozlowski@linaro.org/ 
and I guess it fixes the constraints.


Please help with your comments further.
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

