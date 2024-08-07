Return-Path: <linux-arm-msm+bounces-28090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF594A818
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 14:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A1E1C22E2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 12:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E1F1E4EED;
	Wed,  7 Aug 2024 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kfMG+rQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8FC1E3CBE;
	Wed,  7 Aug 2024 12:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035202; cv=none; b=hQrp+hz/ltOOGQ0pBwiSv2UW6A5TWG1E9Nd9wPv0v6d+ApBdJd4wwo406Kc9rXBvtsJedwxaGTk8lqpnaRO+8foIK86narDVNKihnzNUbxiut/JL+nLjPS2z1Vg4qhcGtCZH8vse/Ufaw+4q95FbWi8ktEIJdfgZdcW/WLiJxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035202; c=relaxed/simple;
	bh=+RAv1xK1O//80d7+SmE4UhJKsNlh/o0paO2Kl5z3daM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lDj48aiG2EemOsuKU3lGb0H+O7RJ8uMIIRgy1qmqb5K0fKVXM9JsccQhdS9lYFagy+r/OfFnL0GRvBXxNkoHQbtzeG8uXEROYA8NNB4+icWiIZ3mlNc2oeWKEQ0aDv2G1uXPi+As7kg4CQxP0hpgRanP/8TVjWBWKxednUe1kCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kfMG+rQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4777p44c007142;
	Wed, 7 Aug 2024 12:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arEhPJHE9JoYwqT4CBPAFaPEevOFK+BW+jRxwcoZZnA=; b=kfMG+rQw1TDoz2op
	x7mdewBK/22bi3/OLBICTC0Z54eyc0ybx7rhx4G0tI4bDQsf2QNBwF11n0yHqmLs
	pFUq+RNxlUavparOjOzOMl8afvr6M/Ifh7ltGIetFHfhyYeI7R2DId+1vsQt/+Vl
	Y26365+OXCZnTCpVqKSBtGz/OsFMg9px6srbkHDZgyapLbPnN6BWZlQRF5eS5Hbu
	xxGhadRjz1RSGe958Is9TpfhTxLe86KUEDcrx6zGc0Dh62ILs732gLOQOZEfhoZK
	UlvtCfGHUSPlEDR9UPwriafMZBl2nnDQGQLu7gz/V6BDFgV9c/32YzvR/xw2mQLg
	IoCo6w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx6tvme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 12:53:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477CrGLT032154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 12:53:16 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 05:53:11 -0700
Message-ID: <85cc52aa-4593-49f5-9438-1ee3f09d2d71@quicinc.com>
Date: Wed, 7 Aug 2024 20:53:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: camss: Add CAMSS block
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bryan.odonoghue@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240807123333.2056518-1-quic_depengs@quicinc.com>
 <1c0ff0fa-73d3-400f-a58d-15fb9b0574d1@kernel.org>
 <c2a3e578-b098-450f-96f6-a3ae321f2b4c@kernel.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <c2a3e578-b098-450f-96f6-a3ae321f2b4c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bS02NkMoLW7ngBpBjA08ZU9qvxQw9r4X
X-Proofpoint-GUID: bS02NkMoLW7ngBpBjA08ZU9qvxQw9r4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_09,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070089

Hi Krzysztof,

On 8/7/2024 8:43 PM, Krzysztof Kozlowski wrote:
> On 07/08/2024 14:39, Krzysztof Kozlowski wrote:
>> On 07/08/2024 14:33, Depeng Shao wrote:
>>> Add CAMSS block definition for sm8550.
>>>
>>> This drop contains definitions for the following components on sm8550:
>>
>> 1. Subject: there is no prefix camss. There is no such file, directory
>> or module.
>>

Thanks for the comment, will remove this.

>> 2. You already sent this, so this should be v2 or v3 or vX. Provide
>> changelog under ---.
>>
>> If there is going to be resend, please fix above.
>>

Sure, I thought it might be a new series, so I didn't add v*, will add 
v1, and v2 change log in new version series.

>> 3. If this was tested on aim300, I am surprised this being not enabled
>> on aim300.
> 

It was tested long times ago, but the patches wasn't sent out for 
reviewing early due to the team's internal schedule.

> One more thing, bindings were not accepted, thus this patch should not
> go in. There were no new bindings, so I assume patchset is using
> rejected ones.
> 
> It's fine to send it to get some comments, although would be nice to
> mention to maintainer that this cannot be picked up as is. :(
> 

Sure, I will resend the dtsi patch until the bindings are accepted, send 
this patches because you posted the comments in other series.

https://lore.kernel.org/all/0324e8e8-2ad4-4ce6-9616-3038b8e02ff9@quicinc.com/

Thanks,
Depeng


