Return-Path: <linux-arm-msm+bounces-33604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F59957A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 21:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B93E1C2574A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 19:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4F6212D3E;
	Tue,  8 Oct 2024 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hcw3sg8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC291E517;
	Tue,  8 Oct 2024 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728415931; cv=none; b=UeFx5RVNngdVvW/4apLcFWFZfgzYAemhaWBQX+sSiRjRe7MY36YK0IBuuIKs2MOjcWC/NAuF0py6IDA0VyOG/1ZTztqTSeXUalSzEhlyN2aQyAXhUqZSkWp6KEH5ODWAAAb3XaxP/t13QrZayJcK1gFRFw7hsxc44KPnpQqfwes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728415931; c=relaxed/simple;
	bh=faytTXk+uqTHy4zXaIDPNs9YeqQDluL+Hk+nqWOjePc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NCnPICsgb6KKg89yayy83mxVvsoB/pZXCir78WWr0vwBHAQHFYOkl6wJMfqtgkwFXyFGPezLcty1jfrZMhs8CNtI22oqYb2Q510RPlHt7lGO4/nMAsg//YbxwmbHmzTJeXitdlVCkMeM1G8+4oC99ykae/C0B5AfJeYe6EpbxE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hcw3sg8p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498HND7K001584;
	Tue, 8 Oct 2024 19:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dK3Uj3Os+q7X+jZMmv23Lrl/nUfarJP2UorvyQJ2m7Y=; b=hcw3sg8pSlsB+IsQ
	8xrZv+YQPYCIatCDoX46htsZPsKXcDGwkx7LssImHVTAyNsm+haT4xux5rpjKUQP
	mTJHLKZpsQl7Leb/L9STTDb/uVZBSPIHF06wkNg4/Yt6YfJrC/Q6RPMsCsYLene8
	exgCelI8ZBKJC3jllL8Kz3C/dvqtf/tZ11PpRXaZo8Bp2HMCEFbEwfOS4OwHlkdY
	3pu8f/UzassXoHkZLPMnpnO1cb0Q2SN6UtpfLAvFBGl46JoWsQL40xWkl6IL+C/a
	5cy33UlJnY55x4t05TrA/AzW+qORGkMTxjOA5iIx0EiBWOATlVa1KbYdxXujPwib
	hiawWA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42513u1xte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 19:31:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498JVfeH022873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 19:31:41 GMT
Received: from [10.216.57.107] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 12:31:33 -0700
Message-ID: <8178704d-b389-4521-a07b-707737aff234@quicinc.com>
Date: Wed, 9 Oct 2024 01:01:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <quic_bjorande@quicinc.com>, <netdev@vger.kernel.org>,
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
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv7ubCFWz2ykztcR@hu-bjorande-lv.qualcomm.com>
 <7f413748-905d-4250-ad57-fc83969aad28@quicinc.com>
 <ac4b5546-366b-437a-a05b-52a53c3bd8a8@lunn.ch>
Content-Language: en-US
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
In-Reply-To: <ac4b5546-366b-437a-a05b-52a53c3bd8a8@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4ziwulbnVqfjMOjQJEs80UV7mZmWMTbT
X-Proofpoint-GUID: 4ziwulbnVqfjMOjQJEs80UV7mZmWMTbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=709 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080126



On 10/4/2024 8:20 PM, Andrew Lunn wrote:
>> The only compile-time dependency from PCS driver to NSS CC driver is
>> with the example section in PCS driver's dtbindings file. The PCS DTS
>> node example definitions include a header file exported by the NSS CC
>> driver, to access certain macros for referring to the MII Rx/Tx clocks.
> 
>> So, although there is no dependency in the driver code, a successful
>> dtbindings check will require the NSS CC driver to be available.
> 
> You are doing something wrong. A clock is just a phandle. The
> dtbindings check does not care where the phandle points to, just that
> it looks like a phandle. You can hard code the instance to 42 and all
> is good.
> 

Understand, we will specify it as a phandle and get rid of this dependency.

> And this is all just basic getting SoC stuff merged, nothing
> special. So why do you not know this? Have you not been subscribed to
> arm-soc for the last six months and watched other drivers get merged?
> I also really hope you have been on the netdev list for the last few
> months and have watched other pcs and ethernet drivers get merged.
>

We will pay closer attention to ongoing reviews going forward to avoid
these gaps. Thank you for all the inputs in this thread.

> 	Andrew

