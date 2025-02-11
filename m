Return-Path: <linux-arm-msm+bounces-47502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EFEA30112
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 02:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 188D93A4856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 01:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3FA194141;
	Tue, 11 Feb 2025 01:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c1GKcojs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DE1386C9;
	Tue, 11 Feb 2025 01:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739237875; cv=none; b=dhAcEW2xmfdT93Qaqxz+cVL4w1b5JNfiTKrIs9CccReDZf7wve0GTUbd7xkcYzBgBnnTikJWcXYaaNq9cBGs1oR3+WrvxifU0DmCo0XDfT4I8OakAk47jAJmVpTsBAwveD4qBFBvMxSMCFYsEzPlZK9BBaBMfp70WsMR4nUURX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739237875; c=relaxed/simple;
	bh=UMRoFkt8RzAbyIvY1hVEoE6cLgE/S+uQW/9TexCKjlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KzzsA64i4K2Z549r7JTOP+WB4mYZSrOOL0rC+DiHO9x4m0iuIAHdu15EfNruXgulsZJNarBZ7nDW3f/eObUVFy4cbUQ3FvbwxD5rwYMC905OOSVjqUS5BFcaI1hVFZsjHPy5LnuDNc8q0a1ottHOa/JYroBY13GZp10YNxnXacw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c1GKcojs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AKIl6I004958;
	Tue, 11 Feb 2025 01:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVMhcUcXYHDKfScVR1dcxxM2/kVsgKdvRFIWrsnnuwg=; b=c1GKcojsu7Qi6xP+
	8WjhB2v0Qqmi/e69+wTyypIu1oJrdK6NHQnvOh385QGOeyOhtUjuO5B4vwzpwA2p
	rFPdNcUu8No7c2Lssgmv4mKF6OztpwNxCHUm2YFEqSLg7gtFB58kEBe4j1BeLp3j
	iNKyK+0USshju2Qfcd2yxpWpwE5RKF4ZRrJRpku8CdJntZ5MOU02uxwYFPL98h9a
	NQlZT/jZEJGbyvDP127TrhWvGxL2225SDQM4Ic0KuwtO13Ncoo0pXxZOaSvNNz4K
	ngxfG50uFyb9A1/4iJWrUZQ09jhsvbJTcxprAZs+k9DhOZHPFJ5jkAS5TrXc+juS
	2plwYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxp65y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 01:37:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B1bmkw015764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 01:37:48 GMT
Received: from [10.133.33.12] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 17:37:45 -0800
Message-ID: <fe6c7c26-91d6-402f-80b6-018ee40e9ed7@quicinc.com>
Date: Tue, 11 Feb 2025 09:37:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5] arm64: dts: qcom: Add coresight nodes for
 x1e80100
To: Johan Hovold <johan@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Yushan Li <quic_yushli@quicinc.com>
References: <20241205054904.535465-1-quic_jiegan@quicinc.com>
 <Z6oDdq-qAJPf9-ef@hovoldconsulting.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <Z6oDdq-qAJPf9-ef@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bKcnPErKFaikX9472f4FL1Boz2luUmuT
X-Proofpoint-ORIG-GUID: bKcnPErKFaikX9472f4FL1Boz2luUmuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110008



On 2/10/2025 9:47 PM, Johan Hovold wrote:
> On Thu, Dec 05, 2024 at 01:49:03PM +0800, Jie Gan wrote:
>> Add following coresight components for x1e80100 platform.
>> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
>> TPDM, TPDA and TMC ETF.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Yushan Li <quic_yushli@quicinc.com>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> 
> This patch is now in 6.14-rc1 and results in the logs being spammed with
> 200+ messages about cyclic dependencies. I'd expect something like this
> to at least be mentioned in the commit message:
> 
> [    0.250732] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
> [    0.250854] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
> [    0.250881] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000
> [    0.251011] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
> [    0.251128] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/funnel@10045000
> [    0.251155] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
> [    0.251184] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
> [    0.251251] /soc@0/funnel@10042000: Fixed dependency cycle(s) with /soc@0/funnel@10045000
> [    0.251329] /soc@0/funnel@10042000: Fixed dependency cycle(s) with /soc@0/funnel@10c2c000
> [    0.251359] /soc@0/funnel@10042000: Fixed dependency cycle(s) with /soc@0/funnel@10ac5000
> [    0.251388] /soc@0/funnel@10042000: Fixed dependency cycle(s) with /soc@0/funnel@10cc5000
> [    0.251449] /soc@0/funnel@10045000: Fixed dependency cycle(s) with /soc@0/funnel@10b04000
> [    0.251538] /soc@0/funnel@10045000: Fixed dependency cycle(s) with /soc@0/funnel@10042000
> [    0.251571] /soc@0/funnel@10045000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
> ...
> [    0.301268] /soc@0/tpda@10d12000: Fixed dependency cycle(s) with /soc@0/tpdm@10d08000
> [    0.301462] /soc@0/tpda@10d12000: Fixed dependency cycle(s) with /soc@0/funnel@10d13000
> [    0.301520] /soc@0/funnel@10d04000: Fixed dependency cycle(s) with /soc@0/funnel@10d13000
> [    0.301582] /soc@0/funnel@10d13000: Fixed dependency cycle(s) with /soc@0/funnel@10d04000
> [    0.301639] /soc@0/funnel@10d13000: Fixed dependency cycle(s) with /soc@0/tpda@10d12000
> 
> [    0.317624] Callback from call_rcu_tasks() invoked.
> 
> Has anyone looked into what is causing this and if anything can be done
> about it?
> 
> This is taking a fair amount of time to process and print.
> 
> Johan

Hi Johan,

These lines have been printed by following API, 
fw_devlink_create_devlink, it's pr_info:

...
	device_links_write_lock();
	if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
		__fwnode_link_cycle(link);
		pr_debug("----- cycle: end -----\n");
		pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
			link->consumer, sup_handle);
	}
...

https://elixir.bootlin.com/linux/v6.14-rc1/source/drivers/base/core.c

I am not sure we can change it to pr_debug to decrease annoying messages.

Thanks,
Jie

