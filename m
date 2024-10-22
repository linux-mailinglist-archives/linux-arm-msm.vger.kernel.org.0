Return-Path: <linux-arm-msm+bounces-35365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2868F9A9CED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 876B8B2112A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8E7172767;
	Tue, 22 Oct 2024 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q7HyPlWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967C15B102;
	Tue, 22 Oct 2024 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586256; cv=none; b=cv1JiWqCnhOSg8R8bAa1j6HvSqj8SYMWbRZ9hTXsJMF4p5FIbIhhkSe8QAy2Xt3qXoCXAOuW4RACI1GeTR0Zr3oiMLKHNwGKxRtRFbC5J3Do2TamaFO9a7OsLYy2eGwfPYttufppLm95kyZLpNtbyZ8dR3eSgZtdwcY+M+x0YuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586256; c=relaxed/simple;
	bh=9LlaZKbq8Gbr4fbbJXoT7MlujlTvAW7xkNit1XKF3nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vz9qnbjMsCFZFR/8UDAnjthxb7ZafW+lGkfUNHRpvyc/CT81zjde2KNKG2tG76VE3oqwT6+1tUv8ncS+YBPkHCOWNUIm/rGX05sy8oI3nElHWv2yve6C6A1cBzjVSZMYYgOG+U1/RZ6cR046yMzhNk8tZR5f1Olnxntn6s0UShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q7HyPlWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LN3udi031865;
	Tue, 22 Oct 2024 08:37:25 GMT
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
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj7h7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:37:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M8bOgk007154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:37:24 GMT
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
X-Proofpoint-GUID: 4RSGPyU9kP1evCId_m02MHL-bS72bLwJ
X-Proofpoint-ORIG-GUID: 4RSGPyU9kP1evCId_m02MHL-bS72bLwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=714 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220055



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

