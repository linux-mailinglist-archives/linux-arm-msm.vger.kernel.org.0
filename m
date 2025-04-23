Return-Path: <linux-arm-msm+bounces-55108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9701A986E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 12:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6995A0337
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 10:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C5226FA6A;
	Wed, 23 Apr 2025 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VamE+QHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F5269D06;
	Wed, 23 Apr 2025 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745403103; cv=none; b=LthzKIwyT2xdWm3WYAzMtZxQa1O1H7rZ+PAbQGj1LQr1usUcVSEEUCuh+GNbij+Sa57FW0bB5u8zsdPsbcPl1cGs8VpUjLW2+laqlMhx467nUEKQZFPjR3AK83zDoxjjPeUDSNZFg5AbsacrB0VzOOUeeN2bkYsTbHnHBE0OYSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745403103; c=relaxed/simple;
	bh=/XxLLFSugfMgrwzqTaNj0EoZNyfXyDci1H2d1C+4JBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hy8eeVTalhiNTAk4K0neKQQugQW4x+8Zi1MLLEmuag1V2Vh4lp/D/1tPoDi+UXiHKj5fFBJam3AsbYCGK6bXojgB1c1TXUaH7VZPXypu8UAUoD8a0+mOZX1TS9s2qqBSmKfahTdyMp9rFOeOcrAR8QS0XrgERI9FWo8i6jBtwEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VamE+QHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9XA022005;
	Wed, 23 Apr 2025 10:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h1+xIdh8PwSf8XcE/S5ee6
	JWcRfyRXRqsc1xbywA534=; b=VamE+QHQIaedYjFZjq4i72IHG3TjuhEReBI+LH
	1YtDNBx1IsKykbiRnqP8fPAQCM6tTwSlfh0mrtMhMzg4cwB5KuDkIIFgKP9/JfY5
	OAlK/jbMYhCB2d3xPbJsAm/J8p/6/9UMC7yzJ5/im86NsglYybnqByFhGOM4s0EN
	2kizQvZ4m8HYrUDfaRfvAysG3GV/tjdoJ7Ieh8EdaoBaxFWZhW57C8z4OEuqfEwH
	meMH4ica4gqjWP/ht5WQeabMQgXUMt9m2SqKy4SZCofZjJUJ5ALaTjhg+vb5OMLO
	yJyM45IVK1n8HsEFCaXCFTBoiqWvRBtSD3xQ6SM+HtRe/puQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh11r43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 10:11:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NABDZN032108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 10:11:13 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 03:11:10 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 0/7] Provides support for Trigger Generation Unit
Date: Wed, 23 Apr 2025 18:10:47 +0800
Message-ID: <20250423101054.954066-1-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SDMHaC_dwX9_pyinL1afRLsVzdBEGv_6
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808bcc2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NA5x112JJD7sSJXOgcYA:9
 a=5qa3DnQsBkHZl6hj:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SDMHaC_dwX9_pyinL1afRLsVzdBEGv_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3MCBTYWx0ZWRfX4BO7cTGSQ4R4 qswALAm3gWeV98hn3Dl3zOMdMw/KTrd8IY36f+S6gOPVBwgOSDb3IRReD+XskY5Ryr7EtlxibTN qol8uH0hJ/D8szWx5BcSjyGZyn0WrQJRPwuKb0BoNzO+iqkYreG6bb/osA03CJW6E4FDjelVj1Q
 uYhsnOyEvLWrhaw4XwFtMo5cul84f05PhcnX2ZdMJig4R/LA8cECxFIpsvbGFZauIsmjbLgCI3d EMX9HE0EF0ret6I6fIhK3q3KejFabdir4ohdZ4EGeGQ7u9kW9Lug32Sn7IfrpDdChNsQ3nADwDw f3dPdF6a7eSJ1gzVmSdrsHgIpozdAPTTfG6xtitZvXo6Mw7jLxb2Ld2/1F8uZOMez8CCl/3R8eo
 73Q+pwbQ1krG5ZpNOh90Tha5izV3vOJBPSEj6dI5DwtIEswziORVy9nRNxVlyeAbf7kAefo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230070

Provide support for the TGU (Trigger Generation Unit), which can be
utilized to sense a plurality of signals and create a trigger into
the CTI or generate interrupts to processors once the input signal
meets the conditions. We can treat the TGU’s workflow as a flowsheet,
it has some “steps” regions for customization. In each step region,
we can set the signals that we want with priority in priority_group, set
the conditions in each step via condition_decode, and set the resultant
action by condition_select. Meanwhile, some TGUs (not all) also provide
timer/counter functionality. Based on the characteristics described
above, we consider the TGU as a helper in the CoreSight subsystem.
Its master device is the TPDM, which can transmit signals from other
subsystems, and we reuse the existing ports mechanism to link the TPDM to
the connected TGU.

Here is a detailed example to explain how to use the TGU:

In this example, the TGU is configured to use 2 conditions, 2 steps, and
the timer. The goal is to look for one of two patterns which are generated
from TPDM, giving priority to one, and then generate a trigger once the
timer reaches a certain value. In other words, two conditions are used
for the first step to look for the two patterns, where the one with the
highest priority is used in the first condition. Then, in the second step,
the timer is enabled and set to be compared to the given value at each
clock cycle. These steps are better shown below.

            |-----------------|
            |                 |
            |       TPDM      |
            |                 |
            |-----------------|
                     |
                     |
  --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
  |                  |                                                 |
  |                  |                          |--------------------| |
  |    |---- --->    |                          |  Go to next steps  | |
  |    |             |                |--- ---> |  Enable timer      | |
  |    |             v                |         |                    | |
  |    |    |-----------------|       |         |--------------------| |
  |    |    |                 |  Yes  |                    |           |
  |    |    |   inputs==0xB   | ----->|                    | <-------- |
  |    |    |                 |       |                    |      No | |
  | No |    |-----------------|       |                    v         | |
  |    |             |                |          |-----------------| | |
  |    |             |                |          |                 | | |
  |    |             |                |          |      timer>=3   |-- |
  |    |             v                |          |                 |   |
  |    |    |-----------------|       |          |-----------------|   |
  |    |    |                 |  Yes  |                    |           |
  |    |--- |   inputs==0xA   | ----->|                    | Yes       |
  |         |                 |                            |           |
  |         |-----------------|                            v           |
  |                                              |-----------------|   |
  |                                              |                 |   |
  |                                              |      Trigger    |   |
  |                                              |                 |   |
  |                                              |-----------------|   |
  |  TGU                                                   |           |
  |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
                                                           |
                                                           v
                                                  |-----------------|
                                                  |The controllers  |
                                                  |which will use   |
                                                  |triggers further |
                                                  |-----------------|

steps:
       1. Reset TGU /*it will disable tgu and reset dataset*/
       - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu

       2. Set the pattern match for priority0 to 0xA = 0b1010 and for
          priority 1 to 0xB = 0b1011.
       - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/step0_priority0/reg0
       - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/step0_priority1/reg0

       Note:
            Bit distribution diagram for each priority register
    |-------------------------------------------------------------------|
    |   Bits          |       Field Nam   |    Description              |
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
        These bits are used to identify the signals we want to sense, with
        a maximum signal number of 140. For example, to sense the signal
        0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
        represents 1010. The remaining bits are set to 1, as we want to use
        AND gate to summarize all the signals we want to sense here. For
        rising or falling edge detection of any input to the priority, set
        the remaining bits to 0 to use an OR gate.

       3. look for the pattern for priority_i i=0,1.
       - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg0
       - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg1

    |-------------------------------------------------------------------------------|
    |   Bits          |    Field Nam        |            Description                |
    |-------------------------------------------------------------------------------|
    |                 |                     |For each decoded condition, this       |
    |      24         |       NOT           |inverts the output. If the condition   |
    |                 |                     |decodes to true, and the NOT field     |
    |                 |                     |is '1', then the output is NOT true.   |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
    |                 |                     |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
    |                 |                     |Conversely, a '0' here requires a '0'  |
    |                 |                     |from the comparator                    |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      17         |                     |comparator will be actively included in|
    |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
    |                 |                     |condition.Conversely, a 0 here         |
    |                 |                     |requires a '0' from the comparator     |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |OR logic will be actively              |
    |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
    |                 |    (n=0,1,2,3)      |this particular condition.             |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |will need to be '1' to affect the      |
    |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
    |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
    |                 |                     |requires a '0' from Priority_n OR logic|
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will be actively             |
    |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
    |                 |  (n=0,1,2,3)        |particular condition.                  |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will need to be '1' to       |
    |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
    |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
    |                 |                     |a '0' here requires a '0' from         |
    |                 |                     |Priority_n AND logic.                  |
    |-------------------------------------------------------------------------------|
        Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
        and `0x30` here to activate them.

       4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
          are met then the next step will be step 1 and the timer will be enabled.
       - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg0
       - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg1

        |-----------------------------------------------------------------------------|
        |   Bits          |       Field Nam   |            Description                |
        |-----------------------------------------------------------------------------|
        |                 |                   |This field defines the next step the   |
        |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
        |                 |                   |Condition and Step.                    |
        |-----------------------------------------------------------------------------|
        |                 |                   |For each possible output trigger       |
        |    13           |     TRIGGER       |available, set a '1' if you want       |
        |                 |                   |the trigger to go active for the       |
        |                 |                   |associated condition and Step.         |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will cause BC0 to increment if the|
        |    9            |     BC0_INC       |associated Condition is decoded for    |
        |                 |                   |this step.                             |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will cause BC0 to decrement if the|
        |    8            |     BC0_DEC       |associated Condition is decoded for    |
        |                 |                   |this step.                             |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will clear BC0 count value to 0 if|
        |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
        |                 |                   |for this step.                         |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will cause TC0 to increment until |
        |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
        |                 |                   |Condition is decoded for this step.    |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will cause TC0 to pause until     |
        |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
        |                 |                   |is decoded for this step.              |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will clear TC0 count value to 0   |
        |    1            |     TC0_CLEAR     |if the associated Condition is         |
        |                 |                   |decoded for this step.                 |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will set the done signal to the   |
        |    0            |     DONE          |TGU FSM if the associated Condition    |
        |                 |                   |is decoded for this step.              |
        |-----------------------------------------------------------------------------|
        Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
        achieve "jump to step 1 and enable TC0" once the signal is sensed.

       5. activate the timer comparison for this step.
       -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/step1_condition_decode/reg0

        |-------------------------------------------------------------------------------|
        |                 |                     |When '1' the output from the associated|
        |      17         |                     |comparator will be actively included in|
        |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
        |                 |                     |condition.                             |
        |-------------------------------------------------------------------------------|
        |                 |                     |When '1' the output from the associated|
        |                 |                     |comparator will need to be 1 to affect |
        |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
        |                 |                     |condition.Conversely, a 0 here         |
        |                 |                     |requires a '0' from the comparator     |
        |-------------------------------------------------------------------------------|
        Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
        to enable timer comparison.

       6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
          has reached the given value.
       - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/reg0

       7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
          i.e. when the timer reaches 3.
       - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/default

        Note:
            1. 'default' register allows for establishing the resultant action for
            the default condition

            2. Trigger:For each possible output trigger available from
            the Design document, there are three triggers: interrupts, CTI,
            and Cross-TGU mapping.All three triggers can occur, but
            the choice of which trigger to use depends on the user's
            needs.

       8. Compare the timer to 3 in step 1.
       - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/reg0

       9. enale tgu
       - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu

---
Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/

Changes in V4:
- Add changlog in coverletter.
- Correct 'year' in Copyright in patch1.
- Correct port mechansim description in patch1.
- Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' from dt-binding
and set them through reading DEVID register as per Mike's suggestion.
- Modify tgu_disable func to make it have single return point in patch2 as per
Mike's suggestion.
- Use sysfs_emit in enable_tgu_show func in ptach2.
- Remove redundant judgement in enable_tgu_store in patch2.
- Correct typo in description in patch3.
- Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth3 as
per Mike's suggestion.
- Remove tgu_dataset_ro definition in patch3
- Use #define constants with explanations of what they are rather than
arbitrary magic numbers in patch3 and patch4.
- Check -EINVAL before using 'calculate_array_location()' in array in patch4.
- Add 'default' in 'tgu_dataset_show''s switch part in patch4.
- Document the value needed to initiate the reset in pacth7.
- Check "value" in 'reset_tgu_store' and bail out with an error code if 0 in patch7.
- Remove dev_dbg in 'reset_tgu_store' in patch7.
---
Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/

Changes in V3:
- Correct typo and format in dt-binding in patch1
- Rebase to the latest kernel version
---
Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/

Changes in V2:
 - Use real name instead of login name,
 - Correct typo and format in dt-binding and code.
 - Bring order in tgu_prob(declarations with and without assignments) as per
Krzysztof's suggestion.
 - Add module device table in patch2.
 - Set const for tgu_common_grp and tgu_ids in patch2.
 - Initialize 'data' in tgu_ids to fix the warning in pacth2.
---

Songwei Chai (7):
  dt-bindings: arm: Add support for Coresight TGU trace
  coresight: Add coresight TGU driver
  coresight-tgu: Add signal priority support
  coresight-tgu: Add TGU decode support
  coresight-tgu: add support to configure next action
  coresight-tgu: add timer/counter functionality for TGU
  coresight-tgu: add reset node to initialize

 .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
 .../bindings/arm/qcom,coresight-tgu.yaml      |  92 +++
 drivers/hwtracing/coresight/Kconfig           |  11 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-tgu.c   | 780 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tgu.h   | 255 ++++++
 6 files changed, 1190 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-tgu.c
 create mode 100644 drivers/hwtracing/coresight/coresight-tgu.h


