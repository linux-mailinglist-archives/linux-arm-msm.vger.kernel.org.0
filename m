Return-Path: <linux-arm-msm+bounces-37888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2857E9C8631
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 10:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C7FDB27E1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 09:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5655A1F755A;
	Thu, 14 Nov 2024 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ogd6Lhbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540F1F7552;
	Thu, 14 Nov 2024 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731576438; cv=none; b=ak+msonUAXUNQoKpO35XAs5j6rv9XFgX0wGddEkAUp9G6NeTx7EZgiy8GBEPYkE7GWjDfqtW3AbJED3SCm8KXagoroWUQQXlsxkkJFZ7onQfp9FiqcpxB+V9E4US9KddhUGv8MuyrYLwe5zo3YgiACaeVkET9CmTl93vX3BDyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731576438; c=relaxed/simple;
	bh=VbgFlXJlb/7oh9X0c+UjDxQAnI9IPS35E1vH1Sh+s7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZGOW+WRcxlnQHFMyj8vANXb8uuqHg+rex0M2p9nCkj+OStFfZEF9ekrBRItnaLTA7NCxs0bkP8MBOIGBhl1tBwrCQ7Nixr9owjBPQjHj1BI+gfgY04SBXopGjwvR4Ug3NGapJmwDiJiU9XO0ZIXopGK5kVlSKXXPlp4hKzjAhWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ogd6Lhbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE40Dh3022553;
	Thu, 14 Nov 2024 09:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcJ1fKi9HTrwjxEXa7zd8t8E3l3ljn0edYOqB0P7RBw=; b=ogd6Lhbh/DHgqItk
	PFsAs8dzsdpOj/tu1MkuNAavexCQ2yXeOD6JSwg4ONWAj+Sp3SQtfALj1vl1BDtI
	HreVUk3hOTc9+s85ODtoX3tqMIq/js7tC+T5Hn0gfSktBTBRax+HHJ1gWJotTSA3
	v+2M3dgwME7c2fOhHBjQHbixGrHdQwqgE1kAaAiUKiT3Vtdqgz3duqNvH/IjZe5r
	aTAZoEt5Sg9M60oOmbVs5D7R4J+9hi65Ylx5z1Puug4+yHMAZaRTE+QJRjdtZgj9
	++5+GLueBcGHvW77rjCZDLGn7KpdrAD2j4QrNcgk5aBWs88o5y/b7USaFVsFlqHp
	1IYXdg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w9sv1tey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:27:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE9R1ea002603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:27:01 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 01:26:58 -0800
Message-ID: <81eda2a0-d734-48bf-bdc4-db9f80d001e1@quicinc.com>
Date: Thu, 14 Nov 2024 17:26:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: qcom,pdc: document QCS8300 Power
 Domain Controller
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
 <20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T_ulcJ_aR9ZN0cmhtBI5zBn7PoD1HX0q
X-Proofpoint-GUID: T_ulcJ_aR9ZN0cmhtBI5zBn7PoD1HX0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=490 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140072

Hi Maintainers,

On 9/11/2024 4:03 PM, Jingyi Wang wrote:
> Document Power Domain Controller for Qualcomm QCS8300. PDC is included
> in QCS8300 SoC. This controller acts as an interrupt controller, enabling
> the detection of interrupts when the GIC is non-operational.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
<...>
> +          - qcom,qcs8300-pdc
>            - qcom,qdu1000-pdc
>            - qcom,sa8775p-pdc
>            - qcom,sc7180-pdc
> 
Gentle ping for the patch apply.

Thanks,
Jingyi


