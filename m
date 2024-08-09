Return-Path: <linux-arm-msm+bounces-28244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589C94CF68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 13:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B350282B83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 11:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0305192B7E;
	Fri,  9 Aug 2024 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qo6Q/vXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B4D156C4B;
	Fri,  9 Aug 2024 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723203413; cv=none; b=byYKZiufbPTk5EHOtzirIdRFOsIHyD0xClk7kSpkzE0o6FYo1zGVC33IpjYsx08PMxtGPuFa33YEqnQ9YTK5aSKuWNaMAv9lQjQCjcvBl9wbqbskC8QBSkrWWqHL0ry+w7yPFyCjYr0o2MtZ5hg2HP0bUeWvldzL6gknJjn1ApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723203413; c=relaxed/simple;
	bh=LZ6V+O4VBtArghCZWjRD6xeXn5xm8T+FsR5jPh3tYnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TGqh0KxBVcSfIoqexhr8wfwuVlDQZRPLWfahiODqDRALXo3vN5sC4sRGXIVBEhSF4PG5k+gXn2MdFMHgalSFvGbraylH9xzfuux91MtNVK/LU5omVEQ0nxAdOBDTBKCKSN+3ylG8WZdAeaWjosVkIMJazP6YFANC4qLkdOJw0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qo6Q/vXk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4797QIIM005836;
	Fri, 9 Aug 2024 11:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6o3BwuyjtmlRMufjxvERVxCcd2fb4s3twoRgcS2jlZg=; b=Qo6Q/vXkQI9Hycel
	FT/6AnA5GgoLsKAtqW41O8yaxVywDQPv8lzHmAwjyJLLXMbje1Ca80H2aJRQpxzK
	tbLYhnhClwBSFxTYYGhH0srWXT2wKvTs0Bspfx9J9e0/bxx2H2KOKnLM9IapxRoo
	lBqkUspMyEmrnHZBOBzYJPM0TiHQbFcCpKVtZvDj04tklbbbcMo0vp9NHOWQtBug
	5o0ScynI5mbPjkUBlGj8SDSp+VeSn+J9iwuoFLz3x4aURPtAODteOvxC1cht3MTp
	0gBoXjaSMD6cJ2bpP/m9nv9i1pnZ4u/9k+bXQKd3IwYyn77FdGD/LkXUvr1GkmSv
	fnu8RA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40weqf8pb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 11:36:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 479Bagm1015230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 11:36:42 GMT
Received: from [10.253.72.235] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 04:36:37 -0700
Message-ID: <41aea3f3-d21a-4d8e-a91a-0fe06947c75f@quicinc.com>
Date: Fri, 9 Aug 2024 19:36:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: defconfig: Enable Qualcomm IPQ common PLL
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
 <20240808-qcom_ipq_cmnpll-v1-3-b0631dcbf785@quicinc.com>
 <afbf0554-56a5-4df0-9e4b-97c065d78bb3@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <afbf0554-56a5-4df0-9e4b-97c065d78bb3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fi3KHOAn5eSuCujTqnXA-1Tf3PMI8pG2
X-Proofpoint-GUID: fi3KHOAn5eSuCujTqnXA-1Tf3PMI8pG2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_08,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 mlxlogscore=751 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090085



On 8/8/2024 10:41 PM, Krzysztof Kozlowski wrote:
> On 08/08/2024 16:03, Luo Jie wrote:
>> The common PLL clock controller provides fixed rate output clocks to
>> the hardware blocks that enable ethernet function on IPQ platform.
> 
> That's defconfig for all platforms, so how anyone can guess which one
> you target here? Be specific, which company, which Soc, which board
> needs it.
> 

Sure, I will update the commit message as below to provide the details
required.

The common PLL hardware block is available in the Qualcomm IPQ SoC such
as IPQ9574 and IPQ5332. It provides fixed rate output clocks to Ethernet
related hardware blocks such as external Ethernet PHY or switch. This
driver is initially being enabled for IPQ9574. All boards based on
IPQ9574 SoC will require to include this driver in the build.

> 
> 
> Best regards,
> Krzysztof
> 


