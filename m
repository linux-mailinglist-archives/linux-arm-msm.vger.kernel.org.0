Return-Path: <linux-arm-msm+bounces-27217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C373693F24C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B9B1F216C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ADD1420D0;
	Mon, 29 Jul 2024 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G1FEVc+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65191140378;
	Mon, 29 Jul 2024 10:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247915; cv=none; b=T3R2UbI/csSEdzoXVagjPDefX5k8kgGa9pyfjP5Y9uORxQQEKtrVHmNlzEWgHbYTA20oc7JoFfPwtJepsvDu4OtvGA5a0t+AbbZpJ2pwSPlgxB6stPW9bk9IpulYAzY73nP/Wgn7ysXLpnBWot9RURbu6SttEc0FTDunnYkEc20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247915; c=relaxed/simple;
	bh=fOoXbg347pxjQPWW/iUfbKfoZvmuo3uZbWUZtryRbVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T/jvv5f/aFgZSQGq6B0zyfB1a5CPtkw/MkRSqk89Hvbw2PfFE4jQv1hOyiU2S8BxkwddaYtshOQMj2+xjqwVXC+X2thQxQ0ke/3C6K3uNuzAgFLVZgzFLJuDVkE9PTcQFb/ULtCBE4JkP2TyZML8fcjAg7MyDjhqkK+jY6ZTdNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G1FEVc+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNF2AL007857;
	Mon, 29 Jul 2024 10:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Np/8kkfzjo9+Y9fYNKdvszo3GlFSFdjeFlLY2YbwT7M=; b=G1FEVc+K9Vrhjoi2
	cgCMwiUzsJ5bIgVcOOHWBMqFxDMzBwC4gFaMsfsqDDCU7ZL1dGKVmWlV728Uaptj
	RTyTYrzzhIO/coD/KgwQQLRhfrqmjvRwbW57xxw5gCA8jfHD2jfzEGdFgVZf/+BL
	2tqUnpxX9XBheD9/L8xE0zQ3ZveKa75QJxILsbrlR4wtr0zuUc3SqJ3EOGj7Rlc1
	chZYAofmu/jU4vePenJqiMdK4KOIxGTlGH7hVboEE5MSS/oZkyTikd42nP8x0zsq
	Jpk/9hGoSd2hWBTUbD6LcLq3y1fqbR0vQKaW1ZQEaNqz2QYfvnBGqWlI4r3ZTHnU
	+1jpzg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms96ktqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:11:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TABn59023098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:11:49 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:11:44 -0700
Message-ID: <46bf375d-d768-4641-9368-dbe03535dbf3@quicinc.com>
Date: Mon, 29 Jul 2024 18:11:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] clk: qcom: rpmh: Add QCS9100 rpmh compatible
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240709-add_qcs9100_rpmh_clk_compatible-v2-0-b6f516c36818@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_rpmh_clk_compatible-v2-0-b6f516c36818@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PVx6eBUySrPM2SUTvhDMWDU3nUgG1GgV
X-Proofpoint-GUID: PVx6eBUySrPM2SUTvhDMWDU3nUgG1GgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290069



On 7/9/2024 10:35 PM, Tengfei Fan wrote:
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.
> 
> The final dtsi will like:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
> 
> The detailed cover letter reference:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Changes in v2:
>    - Split huge patch series into different patch series according to
>      subsytems
>    - Update patch commit message
> 
> prevous disscussion here:
> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> ---
> Tengfei Fan (2):
>        dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS9100
>        clk: qcom: rpmh: Add support for QCS9100 rpmh clocks
> 
>   Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>   drivers/clk/qcom/clk-rpmh.c                              | 1 +
>   2 files changed, 2 insertions(+)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240709-add_qcs9100_rpmh_clk_compatible-e57368401164
> 
> Best regards,


After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

