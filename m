Return-Path: <linux-arm-msm+bounces-33046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6198F6F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2EAE1C21E9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 19:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02DD1ABEB8;
	Thu,  3 Oct 2024 19:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QlaqJiir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7838DE0;
	Thu,  3 Oct 2024 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727983238; cv=none; b=N5ZaViVQiV+fM8cSGN7Gk0/KszI4qxoISQl1ALc23XzJ7M4Rdv9d3nfbS6RPZJZsSJyX9YE/6qg+KeJrKjMI6TAFtG+aK/i4cmh6B9ba3gwumK+izjZ9+0hGKtDqShrEKXFmZAnxQEtJZ0igTKvmVjz0dGDB5MvmHz4Dv3AygCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727983238; c=relaxed/simple;
	bh=QcfpdhefRiCULY44xNpETpqBhegGJWDF9Zfep6H9ARQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bH3gQhNNaZ/8Bh1+jfsnwOLtSKyjYcf4agbERGyTQ8Yyi5jBU4QbgPReWT9gkanISh8raTnPf8X2iPskBdsG0zvy47BoM6MLBUqe67GVEvhMyXlH+nIIbIAhyKfab2JA070uih809xNUrAoHAuNogjXwvv+SKif/LxMej0VKLz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QlaqJiir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493HxbUI027450;
	Thu, 3 Oct 2024 19:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jx+Ty2cDthS2j1kWE+LI3v+F
	3BsTWfmEG1aD2+Ghh8g=; b=QlaqJiir0lOh+GrXjCea/m42d4g8GWdIcJK4doWS
	7HUWbj0H02X/MT8j9hW5fUmO7ej184A9feROq5AJkSzST4X3oD1+B2O2+BVaPTLs
	IiG6ZEAf+YisEFw84hBcgTFP8r9wiThHuwR8zBQFDlfsUrIdbVc7SEe9LMSlr2yT
	RsANc3Miyf8MfiH6Dkxf9bOAsO1k9C3PasVZ5AXifulzNPg/uQLHjQxUhuZrxbrE
	XdlQW5g2ri2b5Nrb+B6VMe3ALt+OqibkXBvOiC5RdHJcl4W0aJuNJcuJrUYT20AC
	qwittnw7DZWsQQjOfZOotTmamt4h1Wsvosw7w+iS9/RswQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205h85yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 19:20:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 493JKEIF028671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Oct 2024 19:20:14 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 3 Oct 2024 12:20:13 -0700
Date: Thu, 3 Oct 2024 12:20:12 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
CC: Andrew Lunn <andrew@lunn.ch>, <netdev@vger.kernel.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Russell King <linux@armlinux.org.uk>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vsmuthu@qti.qualcomm.com>,
        <arastogi@qti.qualcomm.com>, <linchen@qti.qualcomm.com>,
        <john@phrozen.org>, Luo Jie
	<quic_luoj@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Suruchi
 Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
        "Lei Wei (QUIC)"
	<quic_leiwei@quicinc.com>
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
Message-ID: <Zv7ubCFWz2ykztcR@hu-bjorande-lv.qualcomm.com>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PIjJt4geeiesuDk8JlZI-dtUD6i0DB5Q
X-Proofpoint-ORIG-GUID: PIjJt4geeiesuDk8JlZI-dtUD6i0DB5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=999 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410030136

On Thu, Oct 03, 2024 at 11:20:03PM +0530, Kiran Kumar C.S.K wrote:
> On 10/3/2024 2:58 AM, Andrew Lunn wrote:
> > On Thu, Oct 03, 2024 at 02:07:10AM +0530, Kiran Kumar C.S.K wrote:
[..]
> >> 2. List of patch series and dependencies
> >> ========================================
> >>
> >> Clock drivers (currently in review)
> >> ===================================
> >> 1) CMN PLL driver patch series:
> >> 	Currently in review with community.
> >> 	https://lore.kernel.org/linux-arm-msm/20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com/
> >>
> >>
> >> 2) NSS clock controller (NSSCC) driver patch series
> >> 	Currently in review with community.
> >> 	https://lore.kernel.org/linux-arm-msm/20240626143302.810632-1-quic_devipriy@quicinc.com/
> >>
> >>
> >> Networking drivers (to be posted for review next week)
> >> ======================================================
> >>
> >> The following patch series are planned to be pushed for the PPE and PCS
> >> drivers, to support ethernet function. These patch series are listed
> >> below in dependency order.
> >>
> >> 3) PCS driver patch series:
> >>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
> >>         be enabled in drivers/net/pcs/
> >> 	Dependent on NSS CC patch series (2).
> > 
> > I assume this dependency is pure at runtime? So the code will build
> > without the NSS CC patch series?
> 
> The MII Rx/Tx clocks are supplied from the NSS clock controller to the
> PCS's MII channels. To represent this in the DTS, the PCS node in the
> DTS is configured with the MII Rx/Tx clock that it consumes, using
> macros for clocks which are exported from the NSS CC driver in a header
> file. So, there will be a compile-time dependency for the dtbindings/DTS
> on the NSS CC patch series. We will clearly call out this dependency in
> the cover letter of the PCS driver. Hope that this approach is ok.
> 

So you're not going to expose these clocks through the common clock
framework and use standard DeviceTree properties for consuming the
clocks?

I expect the bindings for these things to go through respective tree
(clock and netdev) and then the DeviceTree source (dts) addition to go
through the qcom tree.

The only remaining dependency I was expecting is the qcom tree depending
on the clock and netdev trees to have picked up the bindings, and for
new bindings I do accept dts changes in the same cycle (I validate dts
against bindings in linux-next).

Regards,
Bjorn

> > 
> > This should be a good way to start, PCS drivers are typically nice and
> > simple.
> > 
> 
> Sure, thanks for the inputs.
> 
> > 	Andrew
> 
> 

