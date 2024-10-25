Return-Path: <linux-arm-msm+bounces-35875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A19B0353
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89843281BAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 13:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C26E70818;
	Fri, 25 Oct 2024 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CPhkT2Bf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A120206500;
	Fri, 25 Oct 2024 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861458; cv=none; b=Gy7MngGq8YzBrMPBc4Nr169U95xbPVS3G7IvaXh9fNWV81vTkorYOO0qWBtl2Wb9VIw0Y8m3onHSrQJe2722Cu+8ZiYQ21M+G6P/rOY3vfrDrnvQFarDXpjg62ScCxUWfFEelF3Zd9IhZDi2yI44dszCv9EWH3fWBMG6p+elk8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861458; c=relaxed/simple;
	bh=iYshkXVaZGa2CynAN1Q5OYZln1XMSwkpwWeQNPOXpkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SZezdo4vMoX4TJIjuEkncs4wtZ4BiYMx9Xh3LfPHY7EZTvZTOUNH1jJbHhT3B5QicSM68otDrOOX1qBwHCNy9AHTDqf04BrtT5Did1FFWmuHQ0U1ndx0emvjhsLXXaz6Dh9kIpbvZokqcjTl1XD/bOj+nMyJWHvOwV1bU8KmgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CPhkT2Bf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAo6oT006746;
	Fri, 25 Oct 2024 13:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPJOf0hH0aX6g4YEr+Wt//LZyubFLFor9QOprTwTcrE=; b=CPhkT2BfP2rInL2W
	zEBNzqn561JPJygjvXy7mP0xg225SdbZCb2dO2gGvHh5FHtiqwJYK3kTnLZHZE3o
	+5z6u1P++G9MYOGQESELuzvObAZwPbxtrsqFVj9OXkgAFZdFP88JyfRpzAnJutiQ
	RDRWicgH3/PbPVQOuMFAfY783hwF2l9BsxOjjqU4a/Dmjdr5ZvsMOVmAtifovts8
	qUePd42OcrGbO45B8R7bhEHuCiz0ddgmw3Ec4RZA7QUsJ1qA6BKWL1zLM61t1JUP
	L2WSxE6h8cI/sodjBIzCRgdLY67pPOqWGjwFaRoJQULIoppSYIbFdiKSHMWNd9ha
	eb/Z4g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g9x6gcpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 13:03:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PD3qQe015081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 13:03:52 GMT
Received: from [10.50.63.35] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 06:03:44 -0700
Message-ID: <6e764e04-acbd-4973-af59-f58203a556dd@quicinc.com>
Date: Fri, 25 Oct 2024 18:33:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
To: Andrew Lunn <andrew@lunn.ch>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacob Keller
	<jacob.e.keller@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vsmuthu@qti.qualcomm.com>,
        <arastogi@qti.qualcomm.com>, <linchen@qti.qualcomm.com>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
        "Lei Wei (QUIC)"
	<quic_leiwei@quicinc.com>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv_6mf3uYcqtHC2j@shell.armlinux.org.uk>
 <ba1bf2a6-76b7-4e82-b192-86de9a8b8012@quicinc.com>
 <7b5227fc-0114-40be-ba5d-7616cebb4bf9@lunn.ch>
 <641f830e-8d21-4bc0-abe2-59e2c4d29b92@quicinc.com>
 <28409cbc-09c8-4c88-b11e-2c46457c9e8e@lunn.ch>
Content-Language: en-US
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
In-Reply-To: <28409cbc-09c8-4c88-b11e-2c46457c9e8e@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m577pJaq61SzaSRNdszhVEql3s5P4HeD
X-Proofpoint-ORIG-GUID: m577pJaq61SzaSRNdszhVEql3s5P4HeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250100



On 10/24/2024 7:57 PM, Andrew Lunn wrote:
>>> I'm just wondering if you have circular dependencies at runtime?
>>>
>>> Where you will need to be careful is probe time vs runtime. Since you
>>> have circular phandles you need to first create all the clock
>>> providers, and only then start the clock consumers. Otherwise you
>>> might get into an endless EPROBE_DEFER loop.
>>>
>>
>> The Rx/Tx clocks sourced from the SERDES are registered as provider
>> clocks by the UNIPHY/PCS driver during probe time. There is no runtime
>> operation needed for these clocks after this.
> 
> So they are always ticking. You cannot turn them on/off? It is nice to
> model them a fixed-clocks, since it describes the architecture, but i
> have to question if it is worth the effort.
> 

Yes, we cannot turn them off. However the rates of these clocks from
SERDES to NSSCC, is not fixed. It will be either 312.5Mhz or 125Mhz,
depending on the whether the SERDES mode is USXGMII or SGMII respectively.

> 	Andrew

