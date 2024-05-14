Return-Path: <linux-arm-msm+bounces-19809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F38C4AA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 02:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D991F2158E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 00:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD441EDC;
	Tue, 14 May 2024 00:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P8+JsvFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FE1EDB;
	Tue, 14 May 2024 00:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715647995; cv=none; b=rX4YAF4fxAL/cj9snjujwhakh72n4ZWVcuMgeyR7waFGIP3/gQPvg8OdhljN2SfOeDwB2KCMvOikp/piCjtSoiWZlCaj4URt/OrgFqcLQNJbic7oN11xEapEncPA0x5Idyd+8bMBGNSwR7HKa2rxHzD1rx1w7Bvx/xWQj8kfhYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715647995; c=relaxed/simple;
	bh=Xq2PX+DjyVLfvDVIvB+cYl66J5yHAtbZ2rA7GXILshw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=to+23OOuSm5Ys1OjmhSnE0N7usf/fx6UjkTFS/VQhiIphxh6OE3IXZVRtVsF015EZzgq7r7u0TJrLvyntWPjDh9lmTP8YH6hQS6ZTp/8nAqDY+ifiUQVRpUsxWD9nNPcWEA25iq+q0Kwl8Dp7GQxQYCiYo5SixTiIczenXqCpQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P8+JsvFW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DNr7Z3003327;
	Tue, 14 May 2024 00:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2J8a04BGf8A6Ka/nOnyeCwZH094HYnU/QGOxubC6yjA=; b=P8
	+JsvFW/kNbq22cTykgRDEjgpTRfGRIOnxL648z4Wks4OqBRuIO3It1j6ZvUIogPy
	qpUJK8M7J0Tyn0XNBrkY627saHDl/bCQaJC5Rk9yfnIiYATYpgZdn0HzLHWAGPUc
	UJ/ctWcg0HuQ0sd46/GwwJ63yoJ9Pdumxmh/C+0B4Oc04l0UpBnfhOUlwmnEpsTN
	Bp5uEBjrVMgXKwdxsLmOOzNYsZa8LyH7VnqvhMlCC3FMkNY4km9rw4QSLeEQDnjk
	Ez+Nb6PjOuOgYwb6ol2PTjIu0ZH3ppSp43oQLyWgQnyT155cmyTCLILRpJJTBUJt
	F9RY2ePAwKnDCuaQ4zHA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21y7vu1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 00:53:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E0r8Q5024103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 00:53:08 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 17:53:01 -0700
Message-ID: <66e5bf06-6302-47f3-9bdd-5213a1e6c570@quicinc.com>
Date: Tue, 14 May 2024 08:52:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Move some common usb node
 settings to SoC dtsi
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240513084701.1658826-1-quic_tengfan@quicinc.com>
 <829162d0-2fef-4bbc-9417-13e8ca96150c@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <829162d0-2fef-4bbc-9417-13e8ca96150c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FMliadLRU70OnW3eUV5eWWnHt4AjfGtj
X-Proofpoint-GUID: FMliadLRU70OnW3eUV5eWWnHt4AjfGtj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=874 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140004



On 5/13/2024 4:56 PM, Krzysztof Kozlowski wrote:
> On 13/05/2024 10:47, Tengfei Fan wrote:
>> All the board dts which base on SM8550 SoC dtsi refer to usb_1_dwc3_ss,
>> usb_dp_qmpphy_usb_ss_in, orientation-switch and usb-role-switch, so move
>> them to SoC dtsi from board dts.
> 
> That's not really a good argument. Argument is that it is a SoC property
> (vs being a property of a board). Provide rationale for that. You are
> moving things just because they look common, so to me it looks really
> unjustified.

In the next version of the patch series, I will modify the commit 
message to more accurately indicate why they need to be moved SoC dtsi.

> 
>> OTG is default for dr_mode, so it can be dropped from board dts.
> 
> Separate patch, see submitting patches.

In the next version of the patch series, I will separate this.

> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Tengfei Fan

