Return-Path: <linux-arm-msm+bounces-23628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD28912B2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 18:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E991C25D76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E6D15FA8C;
	Fri, 21 Jun 2024 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KTFdl7io"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460510A39;
	Fri, 21 Jun 2024 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718986698; cv=none; b=PxMCFXZudi5xrdIwJch/od2fWQBj/KIT+3xusjFKZy5sv0pFcG1/6wvnxC+MSbg5pN37CTITKD5asAp9OpR6fEf1UFgcjy7jfse9a4aOomf750EXLMJf6qIHYj97cAA5XkY+WW1LeTHlXG5rgKFtVR2qjgAPc09Wwvl5LMWy5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718986698; c=relaxed/simple;
	bh=Swz2ynPBlGiRmTbCTIAX4xIYuoFo/w+tIjFVczbG9AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g1e2/Ap5AKmNOiDvk4bFLV/Pw4dgwDPxulwneIkdd76N3RhwM5apozsCazUne++GeWolraUId9h5da1+UtZPIsn2PC686pOYZvvdvsbJxGFZ5wj5dYzt8NgGGawwvMWvjOx8wunCjTey/1wJl9qNX69As1SC5yu0+j7RgpkEs9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KTFdl7io; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LAr71O028340;
	Fri, 21 Jun 2024 16:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asLkkzKqiTTs+tTSBhJTgWkSi++DIrk834+Q6RphKdw=; b=KTFdl7ioPIcEYIye
	vEGAHBlaCyJ3XwZ6zqqBlCKa1V+rv+yAfDwqK6DKfX/h2OCd7asuThycpe9EL8OJ
	z6qZ3Q8RRKYc4InIaDgnjTlpQc7fxlruQJScoWZJs65XMZy3UXpD93C1d6ObkEKN
	QBTv8HcP6T5A5XzD0odbKt5rhmDj5K0cmKICt24LmNHObSNP/dC2x7H3oAGIxfCF
	RiEsA92Fqc1Y+HogKudrl1qXsGd/4HDkGv3L4f5Mw1rwJbYR155K4wqKQtsQXjO1
	EVcy03Z9XuQRd0sg0tbf93q561E5NywrxVK0djb362rak6cGoXynnExXVnI52K8k
	8OTQNA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw85e0pjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:17:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LGHdx1013647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:17:39 GMT
Received: from [10.216.56.78] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 09:17:32 -0700
Message-ID: <74c5cb1d-93dd-4145-b176-7da4e91b3fac@quicinc.com>
Date: Fri, 21 Jun 2024 21:47:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] dt-bindings: clock: qcom: Add reset for WCSSAON
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, <sboyd@kernel.org>,
        <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-7-quic_gokulsri@quicinc.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20240621114659.2958170-7-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5mh8PJm9cLbBQuDA-VuW7fsteZ8To6wW
X-Proofpoint-ORIG-GUID: 5mh8PJm9cLbBQuDA-VuW7fsteZ8To6wW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_08,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210117



On 6/21/2024 5:16 PM, Gokul Sriram Palanisamy wrote:
> Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.

Can we include ipq8074 in the title? "dt-bindings: clock: qcom: ipq8074: 
Add reset for WCSSAON"


> 
> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>   include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> index f9ea55811104..e47cbf7394aa 100644
> --- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> @@ -381,6 +381,7 @@
>   #define GCC_NSSPORT4_RESET			143
>   #define GCC_NSSPORT5_RESET			144
>   #define GCC_NSSPORT6_RESET			145
> +#define GCC_WCSSAON_RESET			146
>   
>   #define USB0_GDSC				0
>   #define USB1_GDSC				1

