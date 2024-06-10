Return-Path: <linux-arm-msm+bounces-22173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD66901E2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26696B24501
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9148757FB;
	Mon, 10 Jun 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="amGhaY9w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6F8335A7;
	Mon, 10 Jun 2024 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011692; cv=none; b=kq/A6cVNxZImGvX0MQiTWc50zzUL+HuFmA1651mO6dec962lI1pXayh+elL5po7j5/O5wYNL400oBQnQB0fmEv17YgbWGG8jlvQPVQrMyrIvP6BIN7UXvwUDRsOWmiiQ1d8Yhma1T45ovCVE6Ybw7IrInCuURFiEoZWSVTZn5KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011692; c=relaxed/simple;
	bh=j8Dq7yQHG7EBb9XuZraPYDqV3LAzKsSbr7JFxTuj48Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y4oJ4xXL8S6aJOA6VqZKED6y3hjXEvGOVBHL7ahzwYDxbwRQskQhGtzsDlZbp3Zgp7mNsGzl3yi2QJTd0J9NrHmGIbsZhAC72RvomriDrBuTmLVDMdH6Vp0qcloJCmKM7+ot5zorbXAkxlgODxUrS296q//E7nJg/y3d6mup4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=amGhaY9w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1SONi016845;
	Mon, 10 Jun 2024 09:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgN3zas65y7nxlXrGH65Rv8RMf2XbnKSGHaa5y2Kfc4=; b=amGhaY9wluucVDM3
	+3atA1oM9lv5kFalzesBEfjnLnRgw0bbT5LRJ8mT7ZK+9AtQTq5F7eFz7a1zxu0i
	TfpeuqYQisFdScCY8qxKZJQIegRJrch2QXEgXV/XEecviiAANb/S5jpNApkNiq1l
	qz474TkwKRSYECKPryCp94IxquJMw04wdKcFQc4HJBv5Du48TkFiOLBAVFOTpOHr
	WT1hY++Z6VqURhyPUaKqQbM24g6s5MXwjWqhhZQuXuWejtuPrOnLhsouW4th7JuT
	OEMCHeKElJz26d/v9j0WPu9iTsPMI37QjFdjga7vA378syw7wBXi675yqW0LIdyu
	lbiqxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemgk3ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:28:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A9S4HP018265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:28:04 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:28:00 -0700
Message-ID: <c92b6904-cf8e-4077-bb73-1a6c195b2895@quicinc.com>
Date: Mon, 10 Jun 2024 14:57:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] Add support for SA8775P Multimedia clock
 controllers
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <ivssjgpuex3ckva55tndsqsioo7ysopjrhlvtbv2ot7stjkx2p@opluyh34wy5r>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ivssjgpuex3ckva55tndsqsioo7ysopjrhlvtbv2ot7stjkx2p@opluyh34wy5r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YfLIwBVb-xV9mJegZ7ydKsxtzbwGwngu
X-Proofpoint-ORIG-GUID: YfLIwBVb-xV9mJegZ7ydKsxtzbwGwngu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=884
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100072



On 6/2/2024 9:52 AM, Bjorn Andersson wrote:
> On Fri, May 31, 2024 at 02:32:36PM GMT, Taniya Das wrote:
>> Update GCC, GPUCC clock controllers and add support for multimedia
>> clock controllers on Qualcomm SA8775P platform.
>>
> 
> Most of the patches in this series does not depend on each other and
> some of them could have been merged already, if they weren't stacked in
> the middle of the series.
> 
> Please lump patches together into series only when there is a dependency
> between them.
> 
> The one exception here is the dts change at the end that has a
> dependency on the multiple binding updates. You can choose to either
> split this into multiple updates, or send it separately once the clock
> changes has been accepted.
> 

Sure Bjorn, I will split the current series to two series.

1st to consolidate all the fixes and the New Drivers(Multimedia Clocks) 
in another series and will keep the DT in the next series.

> Thanks,
> Bjorn
> 
>> Taniya Das (13):
>>    clk: qcom: gcc-sa8775p: Remove support for UFS hw ctl clocks
>>    clk: qcom: gcc-sa8775p: Update the GDSC wait_val fields and flags
>>    clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for
>>      gcc_ufs_phy_ice_core_clk
>>    clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON
>>      flags
>>    clk: qcom: gpucc-sa8775p: Park RCG's clk source at XO during disable
>>    clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's
>>    dt-bindings: clock: qcom: Add SA8775P video clock controller
>>    clk: qcom: Add support for Video clock controller on SA8775P
>>    dt-bindings: clock: qcom: Add SA8775P camera controller
>>    clk: qcom: Add support for Camera Clock Controller on SA8775P
>>    dt-bindings: clock: qcom: Add SA8775P display controller
>>    clk: qcom: Add support for Display Controllers on SA8775P
>>    arm64: dts: qcom: Add support for multimedia clock controllers
>>
>>   .../bindings/clock/qcom,sa8775p-camcc.yaml    |   76 +
>>   .../bindings/clock/qcom,sa8775p-dispcc.yaml   |   88 +
>>   .../bindings/clock/qcom,sa8775p-videocc.yaml  |   75 +
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |    2 +-
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   59 +
>>   drivers/clk/qcom/Kconfig                      |   31 +
>>   drivers/clk/qcom/Makefile                     |    3 +
>>   drivers/clk/qcom/camcc-sa8775p.c              | 1849 +++++++++++++++++
>>   drivers/clk/qcom/dispcc0-sa8775p.c            | 1481 +++++++++++++
>>   drivers/clk/qcom/dispcc1-sa8775p.c            | 1481 +++++++++++++
>>   drivers/clk/qcom/gcc-sa8775p.c                |  154 +-
>>   drivers/clk/qcom/gpucc-sa8775p.c              |   41 +-
>>   drivers/clk/qcom/videocc-sa8775p.c            |  576 +++++
>>   .../dt-bindings/clock/qcom,sa8775p-camcc.h    |  107 +
>>   .../dt-bindings/clock/qcom,sa8775p-dispcc.h   |   87 +
>>   .../dt-bindings/clock/qcom,sa8775p-videocc.h  |   47 +
>>   16 files changed, 6027 insertions(+), 130 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>>   create mode 100644 drivers/clk/qcom/camcc-sa8775p.c
>>   create mode 100644 drivers/clk/qcom/dispcc0-sa8775p.c
>>   create mode 100644 drivers/clk/qcom/dispcc1-sa8775p.c
>>   create mode 100644 drivers/clk/qcom/videocc-sa8775p.c
>>   create mode 100644 include/dt-bindings/clock/qcom,sa8775p-camcc.h
>>   create mode 100644 include/dt-bindings/clock/qcom,sa8775p-dispcc.h
>>   create mode 100644 include/dt-bindings/clock/qcom,sa8775p-videocc.h
>>
>> --
>> 2.17.1
>>

-- 
Thanks & Regards,
Taniya Das.

