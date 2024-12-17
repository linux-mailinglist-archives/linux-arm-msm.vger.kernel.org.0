Return-Path: <linux-arm-msm+bounces-42526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 505279F4A4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8843A16502D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCCD1EE003;
	Tue, 17 Dec 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lnQfbVr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298C1DA309;
	Tue, 17 Dec 2024 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436184; cv=none; b=aJnswrqbCRolkrOD+rEdyosqc8d771h8vVbbdBhHZeXC4yjzddOtLtkoDK9Jf75tVvesE14puIqGLSU7MG7HcKX/38PF9dli9rfk+02Yvgga+YuL3QOcjQTnJn3u11Mqbah1lwtaR1Bg7gUKQ6E0cReBpKhmBwWElHLjSXbZ3N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436184; c=relaxed/simple;
	bh=9tVE04Aq7Fp46/wzMlSNN11Cg9p4GqW0pDy75ROiNB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k/l9iWqThXhnt0+fB6FLrLx0tE+EJwVh5oSZmZvIHAFT8iP2zrQ5uvzlRXRVKKjnnQ2MqxqCYx95KHMRTAzetNN7lWI5Ob4ttqY/+2bcBHxB7D44FFFYjwRIB7vdvWCIZO83+bK9stPqMq7OvD24CBbkQDPZ/LmgVor7XRQljqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lnQfbVr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHAo2CF032295;
	Tue, 17 Dec 2024 11:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w33SI2/Ck8iDrn3EQdJPf61Xq4M1rlHUILAdfjh2xvo=; b=lnQfbVr3EHfNg6VQ
	WFWIQRH9+cxvgtBU8GOFttKKXQBrbD2u1x6IBcC1YgaIuGsvixZsNEdyHGErSySI
	gycznI6LcqH1/9NW3Jdzz4NlG0TgCc5l9XfiBxFpnwv46cUwNQPG0r53qraZg4O8
	oCnU+DstOyssfykSgRSsUCRMSUib2yKBLIaibRFzrs7ORQZzX2Wrxx041IiSdf3K
	UhhdyXA4knqgu6rOcHkcAXv2IHfFE1QoxBtqw0yBk7giN1mmKYyqAr6JjMh4dfEt
	FZFEpj+i/xhvym3YB5JW1XZpJtJrfFoqbTLhe1ZRQscksWxwZklLV2qBE2yjKEJl
	50iIvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k7w504vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:49:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHBnW7Y018266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:49:32 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 03:49:28 -0800
Message-ID: <132d1404-9009-9fb5-1fb9-63eca03ce9fc@quicinc.com>
Date: Tue, 17 Dec 2024 17:19:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Cristian Marussi <cristian.marussi@arm.com>, <sudeep.holla@arm.com>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com> <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
 <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
 <Z1HMWUa_QCsNA1-Q@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z1HMWUa_QCsNA1-Q@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -1IvqGh3plY--CLc2H0_xmbGxyWqzV9B
X-Proofpoint-ORIG-GUID: -1IvqGh3plY--CLc2H0_xmbGxyWqzV9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170097



On 12/5/24 21:22, Johan Hovold wrote:
> On Thu, Dec 05, 2024 at 04:26:55PM +0530, Sibi Sankar wrote:
>> On 11/22/24 14:07, Johan Hovold wrote:
> 
>>> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
>>> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
>>> and the memlat driver probes successfully.
>>>
>>> On the other hand, this series seems to have no effect on a kernel
>>> compilation benchmark. Is that expected?
>>
>> I can have a look at your tree. But memlat in general
>> depends on the cpu frequency when your benchmarks max
>> the cpu's the ddr/llcc are scaled accordingly by it.
> 
> A kernel compilation should max out the CPU frequency on all cores.
> 
>>> And does this mean that you should stick with the uppercase "MEMLAT"
>>> string after all? The firmware on my CRD is not the latest one, but I am
>>> using the latest available firmware for the T14s.
>>
>> We should stick with "memlat" if we run into a device in the
>> wild that doesn't support "MEMLAT"
> 
> Ok. So the updated firmware supports both strings?


Sry for the delay, was out sick. Yes the updated firmware supports both
strings.

-Sibi

> 
> Johan

