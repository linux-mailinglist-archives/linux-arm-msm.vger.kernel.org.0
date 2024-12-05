Return-Path: <linux-arm-msm+bounces-40485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463ED9E5324
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B219B1674CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0871D5AD4;
	Thu,  5 Dec 2024 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bp2UtrnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2941D9339;
	Thu,  5 Dec 2024 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733396233; cv=none; b=PhR61tV3hMCLC37DL6R0ixoUOjGo4TNFTnv13e5rzbx/L4tQUPLT5+5+5/t0Fkut8zrIXjpjSVhT3+lXIoGh5zNTapOQCERd73t3Rb9i/vvXxmYTUlY3We78E4ALQoIvw7mGYccOyfV5hXBOZBIdDFm8w7Jl5VIj2gr0f5zZt6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733396233; c=relaxed/simple;
	bh=eZmg7Arh+gScME4sGdoHyYvkstFA9GKzE5elO2gsb8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j8xbi9oaSVd2zLnNmN3SJ+EviHy8PCzZ0ympGl8VY2GrImmLkc/O2nmgPqS+R5GRqqzxeiCz0LqHyAK3bWSRNxiZePqh//twh/QHc9E5ioxxOhJRUgnLGFHO/PL6E4h8Y3Aa4HNH6tMa296ZmFv3ldCL29qhG6UEqnHuSmqSYdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bp2UtrnY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B542ECT031997;
	Thu, 5 Dec 2024 10:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBUdjdgLVwj0/hVJtgaHJOU56SLNHURQ1RyBIpwz4Os=; b=Bp2UtrnYL0yAewsA
	g2+mP0bimstgu7QQKTe2scd7rgvK2rQRC4ICw2z2RUYPahnMwPkaZd79mvYjmCdW
	3zhMK0cqvMg4JBdKZB+yQz967I+ZhQbaDJSLgh7urJ0EGfP8fwdgvxxd/9j9LxgM
	y63IbYAtCI7u46zAXIuaqAFgsxBYeLikbN+dILRFEfN4xOT9RvwqdCSl3mZtFVjX
	XNKoTQGGLOdnalExdzDsbemccqqSPl3cNV5NRViLf78rBOuIspacux4jV73OampP
	Ucxjn99H83f+4Ia+1IxizJZJ0Fjzv6A0GUBao/gldbeqDDw7GjkiDG+I6yIwFGxF
	fccPBQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fax7ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:57:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5Av1db026052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:57:01 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 02:56:57 -0800
Message-ID: <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
Date: Thu, 5 Dec 2024 16:26:55 +0530
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
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z0BC203BhGEmXcJi@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3uxBE9bRq_pqJ6zTmUEmn1JHAbjS8324
X-Proofpoint-GUID: 3uxBE9bRq_pqJ6zTmUEmn1JHAbjS8324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050078



On 11/22/24 14:07, Johan Hovold wrote:
> On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
>> On 11/8/24 20:44, Johan Hovold wrote:
> 
>>>> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
> 
>>>>> Second, after loading the protocol and client drivers manually (in that
>>>>> order, shouldn't the client driver pull in the protocol?), I got:
>>>>>
>>>>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
>>>>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
>>>>>
>>>>> which seems to suggest that the firmware on my CRD does not support this
>>>>> feature. Is that the way this should be interpreted? And does that mean
>>>>> that non of the commercial laptops supports this either?
> 
>>> Yeah, hopefully Sibi can shed some light on this. I'm using the DT
>>> patch (5/5) from this series, which according to the commit message is
>>> supposed to enable bus scaling on the x1e80100 platform. So I guess
>>> something is missing in my firmware.
>>
>> Nah, it's probably just because of the algo string used.
>> The past few series used caps MEMLAT string instead of
>> memlat to pass the tuneables, looks like all the laptops
>> havn't really switched to it yet. Will revert back to
>> using to lower case memlat so that all devices are
>> supported. Thanks for trying the series out!
> 
> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
> and the memlat driver probes successfully.
> 
> On the other hand, this series seems to have no effect on a kernel
> compilation benchmark. Is that expected?

I can have a look at your tree. But memlat in general
depends on the cpu frequency when your benchmarks max
the cpu's the ddr/llcc are scaled accordingly by it.

> 
> And does this mean that you should stick with the uppercase "MEMLAT"
> string after all? The firmware on my CRD is not the latest one, but I am
> using the latest available firmware for the T14s.

We should stick with "memlat" if we run into a device in the
wild that doesn't support "MEMLAT"

-Sibi

> 
> Johan
> 

