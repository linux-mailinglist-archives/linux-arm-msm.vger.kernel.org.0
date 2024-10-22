Return-Path: <linux-arm-msm+bounces-35321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDEA9A97E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A67C0284819
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 04:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08E17E59A;
	Tue, 22 Oct 2024 04:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YNHP7pSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3485515D1;
	Tue, 22 Oct 2024 04:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729571472; cv=none; b=ct7kjY5CPPsgiSG7gJWfjWWW/GySz1AxtPbcJKLe/cpRKWeS4FC9edgAPWEg7i6FZRT9QOT+vcc2gz65Ey22voyK1T0F6IY8/iJ6gs9BYxvq28u18uVG77RkkHCo7KFirPjLKY5ENxCi9xamLu2Tr0M/4TMkQbrTwXjrwhBvBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729571472; c=relaxed/simple;
	bh=EhcizUuLOQoDcszkbqpq8bkB//6KFm8ftMiMPLl64eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nZyhE2sXYTWRv1y/LHKYaDvFhIKHJWzc9nyPRBU/q1gZAtAtyPnye9D7kj2UD0A9cwEDFBl0Qj42uqJKbRnvwgyWjLPcP2UPxmSfvONGICHL9XV7gPNGSoi2P5PHNTpMOz8YHTbONyjjJglvNfn4RZT+wsJighA1YRAzkqy85Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YNHP7pSL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LI0wVP012434;
	Tue, 22 Oct 2024 04:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4Z0dH4BEZqPcFJqsUQAT4AGWjjAEFBIJ7o8AdMmsb0=; b=YNHP7pSLOePFOmX2
	AZ7lOwnt/PtdEzM0DWuarZeHX6a1LWzbhGp2xOKVo23YLsDLEiQBbkIMG9XmsVEj
	dqY/gpEHpw6POmeByVxaihLkFKUnkReWhpNZCSy0gCRT9RNIi/KTDrh2DFk6Cs//
	QlScZNcf6kQA0I9yQ9rj/A4iPZTEDjEPvUGZemARO0kecoKMctwopn9kz2amWlst
	GxXuLCGGxWe9VfD4zSAQzB//d3OmVMbKj1J3IXhL8/KaM8Tgut4OVUv4NGGnX1gn
	QLGyVrT3XSvE9IC/wgLXrpLRNc3bz6wV1DcJBdzD7CM7mbxP733Q1EWn09QTLg3d
	/VMGyw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc6xet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:31:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M4V6Zw015546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:31:06 GMT
Received: from [10.216.44.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 21:31:02 -0700
Message-ID: <b6a9f8d7-655f-4ac5-9887-e3c186a3701b@quicinc.com>
Date: Tue, 22 Oct 2024 10:00:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: Add GPU clocks for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-1-859095e0776c@quicinc.com>
 <wbkon6izhasg2jn2fqkjbzcawn7qx444kb7dvfoncaqkcr7gry@vote5okvj4gs>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <wbkon6izhasg2jn2fqkjbzcawn7qx444kb7dvfoncaqkcr7gry@vote5okvj4gs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0TbmvQhbzSOIiP7NxF4Usk5NwceUVXSj
X-Proofpoint-ORIG-GUID: 0TbmvQhbzSOIiP7NxF4Usk5NwceUVXSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=762 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220028



On 10/21/2024 1:24 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 18, 2024 at 04:42:29PM +0530, Imran Shaik wrote:
>> Add support for qcom GPU clock controller bindings for QCS8300 platform.
> 
> Why are you adding defines to SA8775p header? Commit msg should explain
> non-obvious contents.
> 

The QCS8300 GPU clock controller is mostly identical to SA8775P, but 
QCS8300 has few additional clocks and minor differences. Hence, re-using 
the SA8775P GPUCC for QCS8300. I will update the commit text with these 
details in next series.

Thanks,
Imran

> Best regards,
> Krzysztof
> 


