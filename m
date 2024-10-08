Return-Path: <linux-arm-msm+bounces-33605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B989957B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 21:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 201FB1C25C11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 19:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FAE213ED4;
	Tue,  8 Oct 2024 19:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VbY89BOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED31E0DCC;
	Tue,  8 Oct 2024 19:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728416040; cv=none; b=elNJjrDyMzd5j911i6bDLXHz75tkYeuExvCeJI6Ma51eF1NM39F+sGZvb+gnW869Q2YqSLf+hQTeIAvchtx6DThXYMDNBxe+Ge7hPX9cCWWwi9e+uxT8bPTqAGKGmbuXgJ71JsxgZ9utAd24uT3J5QRvLqShjlBdTArZmTwgcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728416040; c=relaxed/simple;
	bh=R7lX7hmWbtKfbTxmwsEDTQSU3M/Gzi1ykOtb8mIqx6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=szTm5b80/016gkr5nn00Yf1aEyVSvHgpFnnePhz0nXzOFwpYbqa1E+09GfSVlBpr0DE5TTAxci0Fwp9O0k41RnaDIWzQ9Xk3sD3wia2NYCnbGsgGHa569nZ0DFB9OjYHwdne/11q+QHqB0ma0Y6TMwvKsUkgUUFs9EG7WHSAScA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VbY89BOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498F8nmL029440;
	Tue, 8 Oct 2024 19:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2WSnJe8HoTfYxQjLcSXD2eQidI4p8n4po6soTTAppo=; b=VbY89BOlr3tVEk4c
	s5Hu68Q3DJR7ZxYKD4Za+Ggsa38hZVqi/J31S0DMsGbbxBQQ//9uTwVJo76HzG5Y
	ToCw6cZCAdZdQFCf14YAhXpquHrEnRuN6Z5f/cwb9bvMWBk409ViBpRapWkGFdbl
	TV6jpc+HL28M1kjPB5E69LgFLAMSXir26ZaMdkEMaewvzQTrjuOEP9jvffFqlwXQ
	/H/etzpo6y+ZTEUc0m+6+RsTpfewX5wlxmtoSeFF81+cqSYhY4mFP5dSo/173pnS
	D03MSMk7JbnPsF7MeEhafno6Q8a8822yEQbsCpRDMqknDWKm1jcHEQzNx0kut3LN
	nDQ+Ag==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj028s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 19:33:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498JXYdY019638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 19:33:34 GMT
Received: from [10.216.57.107] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 12:33:26 -0700
Message-ID: <79e60dea-8a40-48cc-aa0d-ae6e10c60355@quicinc.com>
Date: Wed, 9 Oct 2024 01:03:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
To: Bjorn Andersson <andersson@kernel.org>
CC: Bjorn Andersson <quic_bjorande@quicinc.com>, Andrew Lunn <andrew@lunn.ch>,
        <netdev@vger.kernel.org>, Andy Gross <agross@kernel.org>,
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
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv7ubCFWz2ykztcR@hu-bjorande-lv.qualcomm.com>
 <7f413748-905d-4250-ad57-fc83969aad28@quicinc.com>
 <zz7m5v5bqx76fk5pfjppnkl6toui6cz6vxavctqztcyyjb645l@67joksb6rfcz>
Content-Language: en-US
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
In-Reply-To: <zz7m5v5bqx76fk5pfjppnkl6toui6cz6vxavctqztcyyjb645l@67joksb6rfcz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m2aiipuVXMA_UfSRt18d3iSA9KjWWtWT
X-Proofpoint-ORIG-GUID: m2aiipuVXMA_UfSRt18d3iSA9KjWWtWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=908 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080126



On 10/6/2024 12:00 AM, Bjorn Andersson wrote:
> On Fri, Oct 04, 2024 at 07:47:15PM GMT, Kiran Kumar C.S.K wrote:
>>
>>
>> On 10/4/2024 12:50 AM, Bjorn Andersson wrote:
>>> On Thu, Oct 03, 2024 at 11:20:03PM +0530, Kiran Kumar C.S.K wrote:
>>>> On 10/3/2024 2:58 AM, Andrew Lunn wrote:
>>>>> On Thu, Oct 03, 2024 at 02:07:10AM +0530, Kiran Kumar C.S.K wrote:
> [..]
>>> The only remaining dependency I was expecting is the qcom tree depending
>>> on the clock and netdev trees to have picked up the bindings, and for
>>> new bindings I do accept dts changes in the same cycle (I validate dts
>>> against bindings in linux-next).
>>>
>>
>> The only compile-time dependency from PCS driver to NSS CC driver is
>> with the example section in PCS driver's dtbindings file. The PCS DTS
>> node example definitions include a header file exported by the NSS CC
>> driver, to access certain macros for referring to the MII Rx/Tx clocks.
>> So, although there is no dependency in the driver code, a successful
>> dtbindings check will require the NSS CC driver to be available. Could
>> you suggest how such dependencies can be worked around? Would it be
>> acceptable to defer enabling the example node for dtbindings compilation
>> using its 'status' property, until the NSS CC driver is merged?
>>
> 
> You can avoid this dependency by making the example...an example.
> 
> By using just descriptive phandles you can present an example of the
> client device without creating a dependency on the specific provider.
> 

Sure, will represent this as a descriptive phandle and nothing more. Thanks.

> Regards,
> Bjorn

