Return-Path: <linux-arm-msm+bounces-33118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A26CD99038E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 15:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7E31F226ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 13:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507C4212F0B;
	Fri,  4 Oct 2024 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YLRrfz6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA94212EF7;
	Fri,  4 Oct 2024 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728047265; cv=none; b=dwNFog7mjTExiS0RlrqE8o5p3/6lY8g3gF49RW7GqavSEOxNOP26XkR5f02YQLbASURF8Hev3WchnVRYbAF9Oke+QU+XxLt2CdfTsCfo88LebsKHI8SIF2D7AKGrDgbuLB3itCNzfp7UnP3nvVo5UBAXtO8DBoIzWtHowvBWIk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728047265; c=relaxed/simple;
	bh=bPu5SGvS9XtlUq9rH2JjvJOk4vEDv0CFKtmqfKKByTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BH895/7WAADGW1NG7Xizu4zqbq5QXEywvf+B54YTJAbJvr1PT+t3nx4HqqUuljJV3clj8KtQoq6kNviD98b1P8QpYaOnxXaTgzMmemIpK7GOGd0tOfN4Ur2JyfcbOX+TlXLsPmJpDYLTeNvMYZpDTrhpF2wjBPKk+EFdviKYc40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YLRrfz6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494ACDAn021335;
	Fri, 4 Oct 2024 13:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mb3Asfdk0E60FJXI/xdUUy1rmt1HGeVOOZpP7vUIcb0=; b=YLRrfz6qTpubOMyL
	pjug6nKYmQC4Sy46gBE2Jz4oJ6z9ePRn7COw8/skXljwPjUSywbtHwTXgW4H2knb
	H/6aljcIPXLnaQhwgOeQmSB4VHhGKUqs/i4tfotmS6POYevv/D6pbteyWPk5EogC
	Z2qpUpDKUl4Hr6+HCX5cINrzTVhb+nWsirlWsMp3M1ggcOLt3TBDbjZa/fPuYi3I
	lkW3hx3KJxVHHfHPAKTMmkAeYJJKiwgGV9xK23uctbsdLJWdtHANcarNCMZ2ifkJ
	lkc1oMjPNL1MggaHRq9ZF6KAdxewhsnsvW6oiPh5A59bQ34+mgYjDhSzqkqFawQP
	gjPzJw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205pa6bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 13:07:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494D7HX5021541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 13:07:17 GMT
Received: from [10.216.10.52] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 06:07:08 -0700
Message-ID: <6c0118b9-f883-4fb5-9e69-a9095869d37f@quicinc.com>
Date: Fri, 4 Oct 2024 18:36:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
To: Andrew Lunn <andrew@lunn.ch>
CC: <netdev@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
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
 <febe6776-53dc-454d-83b0-601540e45f78@lunn.ch>
Content-Language: en-US
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
In-Reply-To: <febe6776-53dc-454d-83b0-601540e45f78@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XFWGmAu-Zw8ktg_9Gr-qHbmlV4FKyvV7
X-Proofpoint-ORIG-GUID: XFWGmAu-Zw8ktg_9Gr-qHbmlV4FKyvV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040094



On 10/4/2024 12:12 AM, Andrew Lunn wrote:
>> Agree that switchdev is the right model for this device. We were
>> planning to enable base Ethernet functionality using regular
>> (non-switchdev) netdevice representation for the ports initially,
>> without offload support. As the next step, L2/VLAN offload support using
>> switchdev will be enabled on top. Hope this phased approach is fine.
> 
> Since it is not a DSA switch, yes, a phased approach should be O.K.
> 

Ok.

>>>> 3) PCS driver patch series:
>>>>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
>>>>         be enabled in drivers/net/pcs/
>>>> 	Dependent on NSS CC patch series (2).
>>>
>>> I assume this dependency is pure at runtime? So the code will build
>>> without the NSS CC patch series?
>>
>> The MII Rx/Tx clocks are supplied from the NSS clock controller to the
>> PCS's MII channels. To represent this in the DTS, the PCS node in the
>> DTS is configured with the MII Rx/Tx clock that it consumes, using
>> macros for clocks which are exported from the NSS CC driver in a header
>> file. So, there will be a compile-time dependency for the dtbindings/DTS
>> on the NSS CC patch series. We will clearly call out this dependency in
>> the cover letter of the PCS driver. Hope that this approach is ok.
> 
> Since there is a compile time dependency, you might want to ask for
> the clock patches to be put into a stable branch which can be merged
> into netdev.
> 

Sure. We will request for such a stable branch merge once the NSS CC
patches are accepted by the reviewers. Could the 'net' tree be one such
stable branch option to merge the NSS CC driver?


> Or you need to wait a kernel cycle.>
Understand.

>    Andrew

