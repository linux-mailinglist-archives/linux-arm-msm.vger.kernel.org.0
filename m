Return-Path: <linux-arm-msm+bounces-24394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33194919B33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 01:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8E69B2237F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4F419413D;
	Wed, 26 Jun 2024 23:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rkgxf0sq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC7A173338;
	Wed, 26 Jun 2024 23:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719445022; cv=none; b=DHdQsUImr3cQfErqY1ZPLONPDvtYnOR890el75KcR26tP2yJDfvkNt+QzmenN/E9jgBvumg4ZdNj2tfi8F/fm+sM50a/pj9dQjqpXIAQzxbDBgolGJbK0s5xsaHt2RrrnyOVW10n9Bv1CsujQjNh3fmT9D65GrcS972W+mWmiFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719445022; c=relaxed/simple;
	bh=8nATUfVgfnAtccAMYf5wpnCtBa+BGHrF+hLR14/pxuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eG8TtxrgSndTAlx7s3sWxTlKzzPgeo4nZqg0cT0/mM3g30gwjaKDs4YYhV2XbTEGp0b7bLbe0z+h/dIbZQVF0kuO3RlsphJur1oBZq2YH0R1h9PQm7KsoAt0ASpf/hJez4zMWs4cqTaSg0ZgCox0NIt/IVtNh926KfT9GfV8Dcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rkgxf0sq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfRoo023296;
	Wed, 26 Jun 2024 23:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DaIdwceZu4nuXnSsMGfpwT+4Ee0Fw8Smr8d9oxrxyU8=; b=Rkgxf0sqR3YuA6mM
	UDGPCp47whsjqbycreP04dMX36OD1IGD7pTe6f+jMu/c1kILp9M2tgoAnVkpKFnC
	+GyKonBL/X128PJ1pLKp1J/Yb0VUJHx+J0ZR4Iqt7ojD9PswvFtb7nxgt4FflfDG
	xitQMnOOWiKbn52wQ2hLgipP01wQft83vyyY4nK0WKB7VHIfi04fxJWm3Qx2wxoH
	sEbfvUSOtRNErI0TRoVJkpjSHpfTSJMx2/bY7pY3SF6uljsZgTPVDLasav4l8CZa
	FJWGD2vOXhfPukhogJ9XR1hiT/yaOgyAcD27eU5YNJM+toRUPVlac9vBcNxaXNA4
	FJ2urg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu1acss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 23:36:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QNaAPk025349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 23:36:10 GMT
Received: from [10.110.22.187] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 16:36:07 -0700
Message-ID: <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>
Date: Wed, 26 Jun 2024 16:36:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] net: stmmac: Add interconnect support
To: Andrew Lunn <andrew@lunn.ch>
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
        Andrew Halaney <ahalaney@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1FgnjLdabwM53gD29XBkYuQ--CMtzPEZ
X-Proofpoint-ORIG-GUID: 1FgnjLdabwM53gD29XBkYuQ--CMtzPEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_15,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=755 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260174



On 6/26/2024 6:07 AM, Andrew Lunn wrote:
>> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
>> +	if (IS_ERR(plat->axi_icc_path)) {
>> +		ret = (void *)plat->axi_icc_path;
> 
> Casting	to a void * seems odd. ERR_PTR()?
> 
> 	Andrew

The output of devm_of_icc_get is a pointer of type icc_path,
i am getting below warning when i try to ERR_PTR instead of Void*
as ERR_PTR will try to convert a long integer to a Void*.

"warning: passing argument 1 of ‘ERR_PTR’ makes integer from pointer without a cast"


