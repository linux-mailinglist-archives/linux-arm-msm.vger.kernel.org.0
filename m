Return-Path: <linux-arm-msm+bounces-33353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB8992980
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA2C11F22254
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02F71D0F78;
	Mon,  7 Oct 2024 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ot3Oyera"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504CB1C0DED;
	Mon,  7 Oct 2024 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728298129; cv=none; b=DR96841MhE1UQM/t7nFa4d8jt11LYPx+AKRPJWg9SLee4WPyUCubrjqkhOwXQErFHdb/7d4uKP24PmokL9+RP8Mjo5z+DfzgSim7TE4mafibz1HoyDZVwoMSWJkrpRdegTNUqOnNbNXpXQyh1jvmSULLlc45AXui8fgYS5Sd4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728298129; c=relaxed/simple;
	bh=vwM0zjvaCCFJLUAY4zeVRqAIuO8bEQ2ZCRcsH0zR27U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VuyUMQ7QOoVmRzeyPo+LQo1+r+58a1wj1/SlPhLv1wpIyPFqnhH2j3H7wnhkrJ0vMFExxSehPOQS0ZGufD45oGAbf1EzNW4ii7yebkL4ib4ZETlXYNHSn45NzxSldKIxSBBrZYMB22zp2wAOL1bW8Oe5A2cToGT2VvpUZRtK5WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ot3Oyera; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974TGCv027186;
	Mon, 7 Oct 2024 10:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPb2h5C/LN8iIyIZ9iZimV/GnBTz0QmsKdLYLIXB3N8=; b=ot3Oyera8B7FRwGe
	/xtu8UNIXbvbT4s8P9x0WPCmdiofELHHEtTgg39EWU78osSU/m59i/9MrHJdHpjW
	78PNFwLkRzSWXpXJg6mOwVCVjTTlmmMynw+TdeBoqXK+ScYUz+BdrYAK8kvdslPq
	TJ010Eqvl4NjpWIPOpfn7ScoNul+rSsmQOkiWjMc18MD7ERkgq4ydcnfQBJAwpGW
	p9GtscFMNdmLB4MuQXVnUzqEKmGrvxw/cTg/y91CRaz8lZPcJd6vyk8MZXdMwEDG
	coiSmTeh2XHvj0Q4xlW8GwtYFvrFIyHuNDVkH8NPrSnY/t6F2nmxV20/myHFygnL
	JV/ynQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9us38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 10:48:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497Ami0x026541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 10:48:44 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 03:48:40 -0700
Message-ID: <1eefc48d-2bb2-4ab4-84bd-6778a8833d1d@quicinc.com>
Date: Mon, 7 Oct 2024 16:18:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: add DisplayPort device node
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_riteshk@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_abhinavk@quicinc.com>
References: <20240916091344.27607-1-quic_mukhopad@quicinc.com>
 <ivbohyezb57mcqgfnjot3j2olgj4kvyoq2fjstgugscagsmlg7@vav3cbokzg7q>
 <f2d3d18f-f671-4616-a722-2e41c8e50939@kernel.org>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <f2d3d18f-f671-4616-a722-2e41c8e50939@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fQ0PufC1o-FNZNgZgf4bvLXM29rPCdJf
X-Proofpoint-GUID: fQ0PufC1o-FNZNgZgf4bvLXM29rPCdJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=717
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070076


On 9/17/2024 5:05 AM, Konrad Dybcio wrote:
> On 16.09.2024 4:01 PM, Dmitry Baryshkov wrote:
>> On Mon, Sep 16, 2024 at 02:43:44PM GMT, Soutrik Mukhopadhyay wrote:
>>> Add device tree node for the DisplayPort controller
>>> and eDP PHY found on the Qualcomm SA8775P SoC.
>> Not quite. You are also enabling it for the RIDE platforms, not just the
>> SA8775p SoC.
> (the patches should be split into soc and board parts)
>
> [...]


Sure, we will be splitting the board and the soc parts into different 
patches

in the next version.


>
>>> +				ports {
>>> +					#address-cells = <1>;
>>> +					#size-cells = <0>;
>>> +
>>> +					port@0 {
>>> +						reg = <0>;
>>> +						dpu_intf0_out: endpoint {
> Please add a newline between the last property and the subnode
>
> Konrad


Sure, we will update this in the next version.



