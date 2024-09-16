Return-Path: <linux-arm-msm+bounces-31831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28E97A421
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08FFC2859B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E445615575B;
	Mon, 16 Sep 2024 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FH4oqa2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C550145341;
	Mon, 16 Sep 2024 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497052; cv=none; b=I/wIiNxXOOQL8PHkYtgk+yDCFjZ7xCcTJZClLk/GzU9nwEKe9+rnHEVELSjQ8h6STMZD5QZvc7z7bZkr5jB9xcQJH7eTswkHZnij5JCGR8NMc2UXb9BdW0OsEo0KUgZVGP1jeG30sxc0iNirHosvIpEHfn4etx9S+sY5sBgzNUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497052; c=relaxed/simple;
	bh=5MZ+AQjt2oLOqJ7tkf7EVMAeVcrsfLMaxvDhbib7syg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GSm3RL3en9M3lfXE/A/WpJreIvog0bUjH5pNGyGVbo2NUine1BVo44bUNN0pTyClAELGiGBjNWjIwdjW1SYUfz+GfEXF8qXsL12FBoIMOH8bcp1R5Qw4f4lk3FGSYWk1k100gFWKhow3jruBIkPMKybNIJ3VF7u+aPybckojMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FH4oqa2R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GE5A33031540;
	Mon, 16 Sep 2024 14:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wL6Xby4hXPdyB9I4vhy4xjWzbMWX4NwpmuehsOP/xxw=; b=FH4oqa2RDWeFaAvk
	V+UaO3jvI0Wl7IBbNwB6m237SFao1VwVi5urmhFmN21gXPU406olfH8T5buMYov+
	sW9+TlRdIuIARYhKme2KoOMG0XdoXQ86AQHIZbnGbDD7yjVn1JR+W7AqEMsdv6JO
	f6Lhy1PROpXlHg8RY6XvZjqFm8R7/wp28A/JhbpSfdR9QajSTpEX7HDaHt1HjXzb
	U3DTu5wR5szEDWQbR1CZhLgvSBnY+TriQ+NvcwCmsv+zn6JuoXfb1gr1564L4bf8
	jQMnjrnXVByFEbsATZXDy7AZi2KMfir4ljTTBtmKUGcc4IIrOY3M4c8Q7XwUcaSh
	s0t3WQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j6m7pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:30:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GEUikc031240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:30:44 GMT
Received: from [10.110.0.24] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 07:30:41 -0700
Message-ID: <e96204f1-b9b3-4eb1-b092-9b23aadf6bc3@quicinc.com>
Date: Mon, 16 Sep 2024 07:30:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: mailbox: qcom-ipcc: document the support
 for SA8255p
Content-Language: en-US
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20240905184736.3763361-1-quic_nkela@quicinc.com>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <20240905184736.3763361-1-quic_nkela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z4YJM4RebSg2eo3qdCq6wd30-pf5RlcO
X-Proofpoint-GUID: Z4YJM4RebSg2eo3qdCq6wd30-pf5RlcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160093

Gentle ping...


On 9/5/2024 11:47 AM, Nikunj Kela wrote:
> Add a compatible for the ipcc on SA8255p platforms.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>
> Changes in v3:
> 	- Removed the patch from original series[1]
>
> Changes in v2:
> 	- Added Reviewed-by tag
>
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 05e4e1d51713..bc108b8db9f4 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -25,6 +25,7 @@ properties:
>      items:
>        - enum:
>            - qcom,qdu1000-ipcc
> +          - qcom,sa8255p-ipcc
>            - qcom,sa8775p-ipcc
>            - qcom,sc7280-ipcc
>            - qcom,sc8280xp-ipcc

