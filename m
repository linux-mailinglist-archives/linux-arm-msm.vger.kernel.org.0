Return-Path: <linux-arm-msm+bounces-32712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B89892A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 04:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59DE11C21FD6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 02:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4267171D2;
	Sun, 29 Sep 2024 02:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A74dzwB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C9134AB;
	Sun, 29 Sep 2024 02:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727577143; cv=none; b=KAmAdcYemvD1DxfsBXRXZ+PPtfIrzv6yJ80U/0yK7rZTlNtwFdTKR+4ptDlj8blkhgUpLk0xDZc7PA0b1XORn0/uD9saBKDsLoKkzrxRKBZtcF1Er/YWjy46q3TPjVrwaTAgW2xX0HmJfWiCTNdd2WTzyPyVvinYziZwOyvho2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727577143; c=relaxed/simple;
	bh=rVSZE1dlHW7HxAknyx/dajqWZLSb6VPV8suLVgss6WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DCml7z7FIxDrurhXD54MqPXvt8050gaR5vo+08wuxqnwPV1jBGXJgGZ2VTTh0T0d2O/MjYLY+Eo+PNHgtURgRhpkJvWtXLhdl7vhL4l7U8BjfMRknHvheuMtl6rghJmCPdnybIdBs8104o7BOb0MxmGhX16Wo9b203AK9M1HNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A74dzwB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48T00r6N010511;
	Sun, 29 Sep 2024 02:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcx3neHUR3g5MxN44Fj+TGHd8GgiIkyGQl5KK5hlD88=; b=A74dzwB847n4GcRi
	88QVClSMg32ZF6xMyD09WrJSuzJdrMrPB3jXOE9suNbbqK6y8v4izlpBCr4dthAC
	e2kZa1s7oBqIqiHZgph0JmgZzgAe/9YYVP5VMOKkP2MfLIVd5g0fTifmXgsSOCi1
	ixOGhS0BPFp1dkhhGUHlmw+gLVlWgwyeSqwmlBUFuJbGG0bSJZfiCo+irNF4UNph
	1cJVUfAU5tW5OO8qxIq8jUOObAW2khGWVrsG/dd+VBclUAGGMoTyURj5/TOD6ipE
	8LQlZUv1ETIv3RS/o6RK3H6CnjJU5os6TGIyPaURgkiUgMwcODGBw9K3FO3JqsDM
	NRoQ5Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x94h9kg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 02:32:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48T2W1RP026110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Sep 2024 02:32:01 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 28 Sep
 2024 19:31:57 -0700
Message-ID: <8a9cb60a-759c-4ee8-b5d9-39f47a0b9d97@quicinc.com>
Date: Sun, 29 Sep 2024 10:31:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: add base QCS8300 RIDE dts
To: kernel test robot <lkp@intel.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Xin Liu
	<quic_liuxin@quicinc.com>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
References: <20240925-qcs8300_initial_dtsi-v2-4-494c40fa2a42@quicinc.com>
 <202409280919.8HQTWaY2-lkp@intel.com>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <202409280919.8HQTWaY2-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PWuhC6yvlohnn0rOVl6bi95TLyTdGtQ2
X-Proofpoint-ORIG-GUID: PWuhC6yvlohnn0rOVl6bi95TLyTdGtQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409290018



On 9/28/2024 10:00 AM, kernel test robot wrote:
> Hi Jingyi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 4d0326b60bb753627437fff0f76bf1525bcda422]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/dt-bindings-arm-qcom-document-QCS8300-SoC-and-reference-board/20240925-184548
> base:   4d0326b60bb753627437fff0f76bf1525bcda422
> patch link:    https://lore.kernel.org/r/20240925-qcs8300_initial_dtsi-v2-4-494c40fa2a42%40quicinc.com
> patch subject: [PATCH v2 4/4] arm64: dts: qcom: add base QCS8300 RIDE dts
> config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280919.8HQTWaY2-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280919.8HQTWaY2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409280919.8HQTWaY2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/arm64/boot/dts/qcom/qcs8300-ride.dts:11:
>>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:6:10: fatal error: dt-bindings/clock/qcom,qcs8300-gcc.h: No such file or directory
>        6 | #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
> 
> 
> vim +6 arch/arm64/boot/dts/qcom/qcs8300.dtsi
> 
> 27f221d22e92b6 Jingyi Wang 2024-09-25  @6  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25   7  #include <dt-bindings/clock/qcom,rpmh.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25   8  #include <dt-bindings/interconnect/qcom,icc.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25   9  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25  10  #include <dt-bindings/interrupt-controller/arm-gic.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25  11  #include <dt-bindings/mailbox/qcom-ipcc.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25  12  #include <dt-bindings/power/qcom,rpmhpd.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25  13  #include <dt-bindings/power/qcom-rpmpd.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25  14  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> 27f221d22e92b6 Jingyi Wang 2024-09-25  15  
> 
compilation err caused by build dependency in the cover letter not merged yet.


Thanks,
Jingyi


