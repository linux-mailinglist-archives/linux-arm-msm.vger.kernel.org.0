Return-Path: <linux-arm-msm+bounces-424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB137E7A97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 10:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9D42B20FA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 09:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA82B1119F;
	Fri, 10 Nov 2023 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Eqsft7z2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114310A22;
	Fri, 10 Nov 2023 09:20:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C928D2BE11;
	Fri, 10 Nov 2023 01:20:10 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA7gKUU022729;
	Fri, 10 Nov 2023 09:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=oSNnDU6xlPnzZURmfi26Tj3BiUebfuDYWVDpH+fPwyw=;
 b=Eqsft7z2+rm0XWqAMQvQ1zLHzxuII/+mW1eCqpG3zHAry0WH9dtS0T7WxLT5g+bFvE1B
 h7JQC1ZXolA4v6hG83z7Kl3irrVoduTnVWxG9oVAUIGHVzd1ZgePii/+V8Inuy6ekgGA
 yCliYkdT05ZVu6NHrBeWySuuRsx0NeiS73aekPWVX0crzUOfKQ16wJeY9OfF4fb+Qh+K
 P90X8QFpfV/rHzOdOY7EhvcEh0WrgONGfmnXR+o6nKWjxZsYOEBEbD84Eyotd2IDcBae
 w0nV157/vxgRdO8K9eN1+u3BLgI/1zNEipb4fDNPGTBWclR27U4SVdPlX/tS1LiH1JHp sQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u8u2tu9tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 09:20:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA9K3jO023716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 09:20:03 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 10 Nov 2023 01:19:56 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <quic_eberman@quicinc.com>, <quic_gurus@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <quic_mmanikan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_anusha@quicinc.com>,
        <quic_varada@quicinc.com>
Subject: [PATCH v6 00/11] Add multipd remoteproc support
Date: Fri, 10 Nov 2023 14:49:28 +0530
Message-ID: <20231110091939.3025413-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h-7j5tJZ8C7sT4Q0Kx3hxzoSgjSP3-ch
X-Proofpoint-GUID: h-7j5tJZ8C7sT4Q0Kx3hxzoSgjSP3-ch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_05,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=708 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311100075

APSS brings Q6 out of reset and then Q6 brings
WCSS block (wifi radio's) out of reset.

				   ---------------
			      -->  |WiFi 2G radio|
			      |	   --------------
			      |
--------	-------	      |
| APSS | --->   |QDSP6|  -----|
---------	-------       |
                              |
      			      |
			      |   --------------
			      --> |WiFi 5G radio|
				  --------------

Problem here is if any radio crashes, subsequently other
radio also should crash because Q6 crashed. Let's say
2G radio crashed, Q6 should pass this info to APSS. Only
Q6 processor interrupts registered with APSS. Obviously
Q6 should crash and raise fatal interrupt to APSS. Due
to this 5G radio also crashed. But no issue in 5G radio,
because of 2G radio crash 5G radio also impacted.

In multi pd model, this problem is resolved. Here WCSS
functionality (WiFi radio's) moved out from Q6 root pd
to a separate user pd. Due to this, radio's independently
pass their status info to APPS with out crashing Q6. So
other radio's won't be impacted.

Pd means protection domain. It's similar to process in Linux.
Here QDSP6 processor runs each wifi radio functionality on a
separate process. One process can't access other process
resources, so this is termed as PD i.e protection domain.

 APPS				QDSP6
-------                      -------------
|     |	 Crash notification  |		|	----------
|     |<---------------------|----------|-------|WiFi    |
|     |			     |		|    |->|2G radio|
|     |			     |	-------	|    | 	----------
|     |	     		     |	|     |	|    |
|Root |	 Start/stop  Q6	     |	|  R  | |    |
|PD   |<---------------------|->|     | |    |
|rproc|  Crash notification  |	|  O  | |    |
|     |			     |	|     |	|    |
|User |Start/stop UserPD1(2G)|  |  O  | |    |
|PD1  |----------------------|->|     |-|----|
|rproc|			     |	|  T  |	|    |
|     |			     |	|     | |    |
|User |Start/stop UserPD2(5G)|	|  P  | |    |
|PD2  |----------------------|->|     |-|----|
|rproc|			     |	|  D  |	|    |
|     |			     |	-------	|    |	-----------
|     |	Crash notification   |		|    |->|WiFi	  |
|     |<---------------------|----------|-------|5G radio |
-------			     |		|	-----------
                             ------------

According to linux terminology, here consider Q6 as root
i.e it provide all services, WCSS (wifi radio's) as user
i.e it uses services provided by root.

Since Q6 root & WCSS user pd's able to communicate with
APSS individually, multipd remoteproc driver registers
each PD with rproc framework. Here clients (Wifi host drivers)
intrested on WCSS PD rproc, so multipd driver start's root
pd in the context of WCSS user pd rproc start. Similarly
on down path, root pd will be stopped after wcss user pd
stopped.

Here WCSS(user) PD is dependent on Q6(root) PD, so first
q6 pd should be up before wcss pd. After wcss pd goes down,
q6 pd should be turned off.

IPQ5332, IPQ9574 supports multipd remoteproc driver.

[V6]:
	- Added user pd remoteproc nodes in RDP442 dts
	- Removed extern keyword from msa lock/unlock
	  function prototype

[V5]:
	- Fixed all comments and rebased on linux-next.
	- Exported symbols to resolve errors reported here
https://lore.kernel.org/oe-kbuild-all/202307301307.LGjSxmY8-lkp@intel.com/

[V4]:
	- Fixed all comments and rebased on linux-next.
	- All userpd's rproc handles stored in linked list.
	- Removed data members from compatible specific data structure.
	- In probe itself, traverse for each userpd and call
	  'q6_register_userpd()'.

[V3]:
	- Fixed all comments and rebased on linux-next.
	- IPQ5018 support is dropped because it's base port
	  patches not yet merged.
	- IPQ5332 support is added with below patches.
	  [03/11], [05/11], [06/11], [07/11], [10/11].

[V2]:
	- Fixed all comments and rebased on linux-next.
	- since clocks handled by QDSP6 firmware
 	  Added [04/13], [05/13], [06/13], [07/13] patches.

Manikanta Mylavarapu (11):
  dt-bindings: remoteproc: qcom: Add support for multipd model
  clk: qcom: ipq5332: remove q6 bring up clocks
  clk: qcom: ipq9574: remove q6 bring up clocks
  dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring up clock macros
  dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring up clock macros
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  firmware: qcom_scm: ipq5332: add msa lock/unlock support
  remoteproc: qcom: q6v5: Add multipd interrupts support
  remoteproc: qcom: Add Hexagon based multipd rproc driver
  arm64: dts: qcom: ipq5332: Add nodes to bringup multipd
  arm64: dts: qcom: ipq9574: Add nodes to bring up multipd

 .../bindings/remoteproc/qcom,multipd-pil.yaml | 189 +++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts   |  21 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts   |  59 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  59 ++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  59 ++
 drivers/clk/qcom/gcc-ipq5332.c                | 380 ---------
 drivers/clk/qcom/gcc-ipq9574.c                | 326 -------
 drivers/firmware/qcom/qcom_scm.c              |  86 ++
 drivers/firmware/qcom/qcom_scm.h              |   3 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5.c                |  41 +-
 drivers/remoteproc/qcom_q6v5.h                |  11 +
 drivers/remoteproc/qcom_q6v5_mpd.c            | 802 ++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5332-gcc.h  |  20 -
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |  18 -
 include/linux/firmware/qcom/qcom_scm.h        |   2 +
 17 files changed, 1349 insertions(+), 747 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_mpd.c


base-commit: 8728c14129df7a6e29188a2e737b4774fb200953
-- 
2.34.1


