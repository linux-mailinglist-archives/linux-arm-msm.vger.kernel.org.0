Return-Path: <linux-arm-msm+bounces-24908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C434892478E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 20:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FFE31F21CCC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 18:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337461CB313;
	Tue,  2 Jul 2024 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gkHwVJSR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9902E1BD00A;
	Tue,  2 Jul 2024 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719946268; cv=none; b=jw6WXAbbFnqvT3xGY5J6yd0SrEsk7W84qhDhctd6HwQrXxM7QW037oZprFg81pBmgJ6RqYqSLctMumKE17AgtyzQWcBEsFrAus7t5bX/xm+LAsS65enGpuKU7NbMAbbBfIzPq5ioV/AwuskgrlsmLLavqqcgScyW+qbIY9KY4PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719946268; c=relaxed/simple;
	bh=Wsl56kQ0sDxYM+v/9gwmollAHIJgLokdiF+Sjkgu9ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FPQ6flrAQ3iT8nmNOAmEjIPs7Z8SOnzl30brO4uSNVerW4qYyLR4g/WZzxCCmZGRY5+M/3qFSEHtm7d0DtEINmtlssQAh8z3J+ULfJSWWR4KDTt962Z4zZi2GtOhim1ijIfwfhtqDqhiYLC/eA4x9ELee5Tm87wZ0hYqZ8R1Wg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gkHwVJSR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462Gs2hM000402;
	Tue, 2 Jul 2024 18:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AlYcI/o49WIolw4v/nPXCS8dUNWb7ZRGwwrKnFWXixM=; b=gkHwVJSRdUiQb4MA
	s0cNx3e7NC3x8aiZUf2WCFSGgW0AtPb6Oi0Qf6j9dj9Qe1+6+i11R4IaFvsMIQFS
	n7oyTxX/9mpIyhAmt7wV9BQjm4sPKrlRQ7zEBZwHvCjf+kyvKNjFNYIVjrReW2Xp
	vz69m6hkyKh4yZtzvQN/Ik+jm3Xlv/YvEY2UrCqsi9dOTqQn9TPD+CLAJlmASa05
	pzZaaTuqT1RURmXidQY9DBZ7JyYWU+pkURlevN5uTDudi4a6zf+Q1aIftpbFL6yZ
	ZKUDRF9kiboaMwDHqln0B4jUSaduwuGj31wSJZsmxICxsRZkfSTt0LotOtqbOFa3
	6eTRgQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bj899wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 18:50:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462IoVKD014773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 18:50:31 GMT
Received: from [10.110.54.196] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 11:50:28 -0700
Message-ID: <4934d0cc-3a9d-4e31-a8f2-32b3cbf73915@quicinc.com>
Date: Tue, 2 Jul 2024 11:50:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom: ethernet: Add interconnect
 properties
To: Andrew Halaney <ahalaney@redhat.com>
CC: Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Russell King <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>, <kernel@quicinc.com>,
        Andrew Lunn <andrew@lunn.ch>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-1-eaa7cf9060f0@quicinc.com>
 <q2ou73goc2pgrmx7xul4z7zrqo4zylh3nd2ldxw5vnz2z4fnkf@axbse4awc6lf>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <q2ou73goc2pgrmx7xul4z7zrqo4zylh3nd2ldxw5vnz2z4fnkf@axbse4awc6lf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eISxxj9D8Oitlj92rMYg7_qkn--LieGe
X-Proofpoint-GUID: eISxxj9D8Oitlj92rMYg7_qkn--LieGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_14,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407020137



On 6/26/2024 7:53 AM, Andrew Halaney wrote:
> On Tue, Jun 25, 2024 at 04:49:28PM GMT, Sagar Cheluvegowda wrote:
>> Add documentation for the interconnect and interconnect-names
>> properties required when voting for AHB and AXI buses.
>>
>> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 6672327358bc..b7e2644bfb18 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -63,6 +63,14 @@ properties:
>>  
> 
> Does it make sense to make these changes in snps,dwmac.yaml since you're
> trying to do this generically for stmmac? I don't poke bindings super
> often so might be a silly question, the inheritance of snps,dwmac.yaml
> into the various platform specific bindings (qcom,ethqos.yaml) would
> then let you define it once in the snps,dwmac.yaml right?
> 
>>    dma-coherent: true
>>  
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: axi
>> +      - const: ahb
> 
> Sorry to bikeshed, and with Krzysztof's review on this already its
> probably unnecessary, but would names like cpu-mac and mac-mem be
> more generic / appropriate? I see that sort of convention a lot in the
> other bindings, and to me those read really well and are understandable.

I agree with changing the names to "cpu-mac" and "mac-mem" in that
way the properties are more understandable.
@Krzysztof Kozlowski let me know your opinion on the same.

