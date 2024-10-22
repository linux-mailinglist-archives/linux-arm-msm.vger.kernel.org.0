Return-Path: <linux-arm-msm+bounces-35362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6869A9C82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED0CC1F2306E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6DD16E860;
	Tue, 22 Oct 2024 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q7HyPlWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DD1494B2;
	Tue, 22 Oct 2024 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585664; cv=none; b=r6Lgx127iRR2MDcXtwb/AgC7rrGmT42CP7F9UTEgux1T+62T/uNobpyv/vM8Sqmq+IzRhYVKSJr+r9FYSbQwSGULxOi/yNyT51o7hrOohk01JPhtmAFrpXyp92oOBQRfgrV5B+iYXi0ZmKmkI2IoRLxadd8Z7gVr/N/QQc2qI6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585664; c=relaxed/simple;
	bh=9LlaZKbq8Gbr4fbbJXoT7MlujlTvAW7xkNit1XKF3nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RW7Od2ZxTeOYPGT9MgzVUN7juMssh5BSFOqcmTLRXqQE8qSxT5yqoYtiwfQTVn8QOAXqdrR5qYXxCmJ2SUmv701dvoyrQii1omLxHbd220uK+X3n7CopHye6ATN1wM4shS9xoH60NkvdSxDLe0bySTq2PVqRf3bh47eexwGs7f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q7HyPlWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJBZlS001170;
	Tue, 22 Oct 2024 08:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmwZ3GjGm25RBrHcIsHXnQkk45Q8vEfyzlxUtHPkLek=; b=Q7HyPlWf4mvJi9Pd
	zq54Fby7enfvtVBwjH4/jY39dVtG0NhXTTu57Q6ThciSMmC0JgoAkbAWvIDnonTG
	pjyFKY9QGh1A2MS9x3lkunNR3rbowUXNpVMDQfOOvOMoyv+6FKx2zME7dIgZvuII
	8/2Iy1OBKB7B4wfAtNjqg4Vb1keRE8PzOknNn7294Ry5/tLHr2LrlYWlW0umJ8Vq
	Q/MIlW0JTj5axmVji4HkI1jekVxTvP0ZNYMsidTY4QvK7dkjLr5rErmY9MHVJPsN
	WyJb4fWTxGyRwPYJ3ReJvS0W4kui8TY+Pl9fx50wHalw4WAr9JH8sJBVYc4P9prz
	w9WFTw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj13gg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:27:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M8OefI003821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:24:40 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 01:24:36 -0700
Message-ID: <b9b6d00f-2462-d9a8-2ca5-7f13ae68e941@quicinc.com>
Date: Tue, 22 Oct 2024 13:54:33 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <knykvevy7rtu4tkrbm2jxpkhzjjkypgpghgsbyzvxkhp75d3c7@5zu6jknd2xrf>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <knykvevy7rtu4tkrbm2jxpkhzjjkypgpghgsbyzvxkhp75d3c7@5zu6jknd2xrf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1Gd7gmrT-280RZdSKxqSKWYFFJKK2Bl6
X-Proofpoint-ORIG-GUID: 1Gd7gmrT-280RZdSKxqSKWYFFJKK2Bl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=714 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220053



On 10/8/24 12:22, Krzysztof Kozlowski wrote:
> On Mon, Oct 07, 2024 at 11:40:18AM +0530, Sibi Sankar wrote:
>> The QCOM SCMI vendor protocol provides a generic way of exposing a
>> number of Qualcomm SoC specific features (like memory bus scaling)
>> through a mixture of pre-determined algorithm strings and param_id
>> pairs hosted on the SCMI controller. Introduce a client driver that
>> uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
>> to detect memory latency workloads and control frequency/level of
>> the various memory buses (DDR/LLCC/DDR_QOS).
> 
> None of your patches are wrapped according to Linux coding style which
> makes reviewing more difficult than it should be. And before you answer
> with checkpatch, checkpatch is not a coding style.

I can see that you've been a reviewer of this series from the very
initial version. That would imply you had a chance to shape/guide the
series to whatever shape you prefer. Yet you choose not to do so and
make a blanket statement now that it's close to merge in v4 :/

-Sibi

> 
> Best regards,
> Krzysztof
> 

