Return-Path: <linux-arm-msm+bounces-39387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BFB9DB3B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13AC6B21755
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 08:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E41514A609;
	Thu, 28 Nov 2024 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ReInDfA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3213313FD86;
	Thu, 28 Nov 2024 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782299; cv=none; b=V4C+FINtcGGHdbC2+2GBZiSZ7AbvnMaJsZd/ETWMhaMthw6LHvMzenmT1AhJIE21m98FXGuFdjn9YvgvXwclEFCMEa9oEk8La5HHbYrajdZuitafY7qV2xo0zVp3/OUlyOzIe6doVcixJMPjpeNK8DNh8wag6PJiFlkLB+9UdRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782299; c=relaxed/simple;
	bh=1fnaIG1nYe4uoedCIRf1VMkQy9HxCwnYmURxMbX/Dhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DN0GZA5Tl7kXQoVLydTgrlgTqfhqG1XuRElW5ipMnkBHJt8X4PFoJG8QSDgq4l0CPCMN6R97EotT/HCnLJdZRBmf0K1VpeHRn31WgoPJkRhri8VIBQCWuBFvR31MHSkBd6m14rDy1yXn6Jy1kmHTia6sOef9xCc1zoILgIJ+q2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ReInDfA8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARMH9D6016748;
	Thu, 28 Nov 2024 08:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4U7H+fB6+lpXcyRIf7le/5WCYXvwpYmkA9IOsE9Mig=; b=ReInDfA8pnpF+hWx
	Bamu+dyScIf5tZCflJJX2fdPXXXh+qr/KhnF8GCdviW7FvSCSJYBEq6DT8I8aNqJ
	aykSjrURMkhIgnGOBqWfMja3xDLqMA+Iy6fK5YKfL7Kg9Xh5zs28rEKtDRWMBzVD
	vYqnVsdYNDOFSwtbZyjC7BkvKQgp/qWM1k/Jia9HlOFbTx+BywkwNFu9xHRvxI4/
	AXwDXJxICl0FHv21jn/TSZEYcGPC5QqskEb57U1y/yQXKFhhtH4XpdR9LMNSCCZt
	LlC0FvqotWdtQH7NngBYSt8pH6fSTaEKGk8qOHtH4SIBvI6nLzDAsGKLb4Xd+g6O
	aG3WLQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671e9ted-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:24:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS8OmWu007444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:24:48 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 00:24:43 -0800
Message-ID: <c6497c90-f323-42e4-97ea-a0b5d91e3585@quicinc.com>
Date: Thu, 28 Nov 2024 16:24:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: add initial support for QCS8300
 DTSI
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>,
        Xin Liu
	<quic_liuxin@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>,
        "Tingguo
 Cheng" <quic_tingguoc@quicinc.com>,
        Raviteja Laggyshetty
	<quic_rlaggysh@quicinc.com>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
 <20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com>
 <mjth25v54mioefjet2udacqqwvw7tfbhemmvjps4utjm545hyn@3f7zwohi4qee>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <mjth25v54mioefjet2udacqqwvw7tfbhemmvjps4utjm545hyn@3f7zwohi4qee>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8C_cxGrAsdLSQVq6o9tcxHAyKnFrTUwe
X-Proofpoint-GUID: 8C_cxGrAsdLSQVq6o9tcxHAyKnFrTUwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280066



On 11/27/2024 2:13 AM, Bjorn Andersson wrote:
> On Wed, Sep 25, 2024 at 06:43:34PM +0800, Jingyi Wang wrote:
>> Add initial DTSI for QCS8300 SoC.
>>
>> Features added in this revision:
>> - CPUs with PSCI idle states
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - GCC and RPMHCC
>> - TLMM
>> - Interconnect
>> - QuP with uart
>> - SMMU
>> - QFPROM
>> - Rpmhpd power controller
>> - UFS
>> - Inter-Processor Communication Controller
>> - SRAM
>> - Remoteprocs including ADSP,CDSP and GPDSP
>> - BWMONs
>>
>> [Zhenhua: added the smmu node]
>> Co-developed-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>> [Xin: added ufs/adsp/gpdsp nodes]
>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> [Kyle: added the aoss_qmp node]
>> Co-developed-by: Kyle Deng <quic_chunkaid@quicinc.com>
>> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
>> [Tingguo: added the rpmhpd nodes]
>> Co-developed-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> [Raviteja: added interconnect nodes]
>> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> 
> Sorry, thought I had replied to this already, but I must have confused
> it with QCS615.
> 
> Please see my feedback regarding signed-off-by and subject line:
> https://lore.kernel.org/all/4bhsuysjm2uwkk52g4pkspiadsf5y4m2afotj7ggo2lnj24ip2@yqkijcdkiloj/
> https://lore.kernel.org/all/2qvv3zrop2i5hurrn7bfggfkjb7rqlbfa7bxiekdisi6c57gxd@d2fptisjhy3j/
> 
> 
> 
> For reference, here's the qcs615 v5.
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> 
> Regards,
> Bjorn

Thanks, Will update in the next version.

Thanks,
Jingyi

