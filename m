Return-Path: <linux-arm-msm+bounces-57806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA3AB6502
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 10:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAC1B1894CD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 08:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06622210F45;
	Wed, 14 May 2025 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="caEiEi3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A778BE8;
	Wed, 14 May 2025 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209622; cv=none; b=uFflc20iPuhBtZfI1d9vSTbS38AZGyYccZpPOzWXAG+L82rAWBYxWvCLmDSJlRwDnZZ9vQg3s5eWBjuUWYOOm4kJy+IUQJYmJcLg1ON1EBxvNe5SXLFxrzkOdZlP+2WISdMxAZPU2FD0rL/nq82KZtRKF/itmLHpT6lX7L2BVKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209622; c=relaxed/simple;
	bh=FNnalQEzea7G5/rGNNxlWHjVw5fKy7ofEDIPa/TTLeA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=m7a1m4Hhtn3GT4lIRDIW6/2bnUfGxoLNJrjvoOiJYR3JtPYBafywVbsu57d6ZyHl3KGsSaWWTsJsWQu+OL3igZvQ2ZDsAt3CPCIrFaviAZBwHtr3Si8F3CE98eebmg5ZEhW5l2U9Kw+i8JN2RbG0fkctN70pm5J/JMnHGacU+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=caEiEi3C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E2DTgd015761;
	Wed, 14 May 2025 08:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCKY5vGp6iytYr65b9eAol+yPV2ZnG6jSEVYa8k0SgQ=; b=caEiEi3C5Yj9xiAi
	0vScEPzsyeb1v6BS0lRKl7UMXOxoLxWskwrJ5MHjV+2tJiGb6Ld47U/JgJzTL4n6
	uX6KcYopbj6jcDRs7Y925oPAAwO5CkxTl2Is4FDSdNPIxFt1D7SAbzC1/Vcz8vHo
	gA5j5Z11FGUCUl7z4UxX2e6NWvKfgsgR7nZ0TisA9+RJCY5TWLfI5PTgQSPq1VPM
	SM/kMAwjNpfOcL2mibZxxJC5VRhwoWxXFKAzocKWp4CW6TIAaU9BHGnqS87iOPax
	mXrR2pCc2KtkwdqM8Sxmh5Id5QFYmzh9n9anFLc17ForVNto9MkA2M5FpFpkBJMJ
	S3qdLg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmhv0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 08:00:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E80Hho015168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 08:00:17 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 01:00:14 -0700
Message-ID: <d87a6bba-eaed-4ac4-a272-3bb38b1607dc@quicinc.com>
Date: Wed, 14 May 2025 16:00:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Enable CTCU device for QCS8300
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
        <linux-kernel@vger.kernel.org>
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2OCBTYWx0ZWRfX3y9eAJIyiCv/
 R/xuCuLo/RjI8KKaoiBSfbC3xyKhQNZgjYBKjtpgL9rp6U9VNBM+afUBsJUHXHxqey0QuzOMHN0
 rQYN5RnqN3nrOL8T4zfarjRZipxMLTarBP0yFAxa/zjaSkYbBKn0sszIHuR+rCA8+3w5XkBAXLh
 zYMkt4ettjjrrtTyB52OuoyQXh5IhfThskhnwVKV0RUbjNhd7nlaqsiaR46Pq2SNIyD+nk0047e
 ET5tGiJl7EoUQprU0ewRg6IxRBF6LMwi7k+st/OQRCBDnc83vKmqEVAl+wjgFWTtFRVYDXL3VO3
 afDXFzw1TCaIPXofOhxD0e4ZjXKVCauJyIX/9NApCwiA+t0ouTo84/zPJNrL8pgQZRy92BqG7Ea
 UrvcARVRS0CoMlFnt5gfEl3iTINAJWL7OnJ1/tSqn64ul9V+DmgQcA4885bdCVj32BxrdLK2
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68244d92 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=pLMpUjaxxvwfmTDcegsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: lCFnLqJMcX4kM6QxzAR3OeYaBZNQQ30e
X-Proofpoint-ORIG-GUID: lCFnLqJMcX4kM6QxzAR3OeYaBZNQQ30e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=698 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140068



On 3/27/2025 10:49 AM, Jie Gan wrote:
> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.
> 

Gentle ping for the series.

dt-binding patch has been reviewed by Krzysztof.
dts patch has been acked by Konrad.

Thanks,
Jie

> Jie Gan (2):
>    dt-bindings: arm: add CTCU device for QCS8300
>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>   2 files changed, 160 insertions(+), 2 deletions(-)
> 


