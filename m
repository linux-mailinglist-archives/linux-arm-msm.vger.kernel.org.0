Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF993757B35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 14:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbjGRMFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 08:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbjGRMFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 08:05:39 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B472610FE;
        Tue, 18 Jul 2023 05:05:36 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36IASp5H013883;
        Tue, 18 Jul 2023 12:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Sd20FWYa9WTxZ1cR3hPWl6MiQfqV7a6+5JBs1FxeZA8=;
 b=kHkAOIVECliPJUEAnJ5u8k72/V2H7chXlOs1qG5MgHl7sSK8+B24USm+dNzdgbUvqBkU
 AiFXg/z4o5DEokhVk/ohk+G8+HiJF5Vz3c2ODawESikLTaBwtoQJb6/5yr50++0wrHSr
 9so2CnqCj4VMEaNoqyzL4b0xoqG5H2FzQRItvgq2nT7/oKny0P9oAyzgTeVZx7a6tvuy
 viTZF6bxcSQjuPYVKMIBUz6tLRVNFk+SSqpImJi7xrym2asKSA607cvUjtIL35g4xrfL
 bAVh6vTWndappZE5Zg0Xj3ARSkLzN0Of5D/Eg1ytBHIDGw01rKBfOBW6FhcioOL0U/HV 4A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwnrrgqft-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Jul 2023 12:05:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36IC5VLk008983
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Jul 2023 12:05:31 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 18 Jul 2023 05:05:24 -0700
From:   Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <quic_eberman@quicinc.com>, <kvalo@kernel.org>,
        <quic_mmanikan@quicinc.com>, <loic.poulain@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_anusha@quicinc.com>
Subject: [V3,00/11] Add multipd remoteproc support
Date:   Tue, 18 Jul 2023 17:34:50 +0530
Message-ID: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m7eisAaa6f_NC7p7S2QGpmsYpw2cXxPo
X-Proofpoint-ORIG-GUID: m7eisAaa6f_NC7p7S2QGpmsYpw2cXxPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_09,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=702 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307180110
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

rproc->ops->start(userpd_rproc) {
	/* Boot root pd rproc */
	rproc_boot(upd_dev->parent);
	---
	/* user pd rproc start sequence */
	---
	---
}
With this way we ensure that root pd brought up before userpd.

rproc->ops->stop(userpd_rproc) {
	---
	---
	/* user pd rproc stop sequence */
	---
	---
	/* Shutdown root pd rproc */
	rproc_shutdown(upd_dev->parent);
}
After userpd rproc stops, root pd rproc will be stopped.
IPQ5332, IPQ9574 supports multipd remoteproc driver.

[V3]:
	- Fixed all comments and rebased for TOT.
	- IPQ5018 support is dropped because it's base port
	  patches not yet merged. Dropped below patches.
	  https://lore.kernel.org/linux-arm-msm/20230521222852.5740-4-quic_mmanikan@quicinc.com/
	  https://lore.kernel.org/linux-arm-msm/20230521222852.5740-5-quic_mmanikan@quicinc.com/
	  https://lore.kernel.org/linux-arm-msm/20230521222852.5740-7-quic_mmanikan@quicinc.com/
	  https://lore.kernel.org/linux-arm-msm/20230521222852.5740-9-quic_mmanikan@quicinc.com/
	  https://lore.kernel.org/linux-arm-msm/20230521222852.5740-12-quic_mmanikan@quicinc.com/
	  https://lore.kernel.org/linux-arm-msm/20230521222852.5740-13-quic_mmanikan@quicinc.com/
	- IPQ5332 support is added with below patches.
	  [03/11], [05/11], [06/11], [07/11], [10/11].
[V2]:
	- Fixed all comments and rebased for TOT.
	- since clocks handled by QDSP6 firmware
 	  Added [04/13], [05/13], [06/13], [07/13] patches.

Manikanta Mylavarapu (11):
  dt-bindings: remoteproc: qcom: Add support for multipd model
  dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring up clock macros
  dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring up clock macros
  clk: qcom: ipq9574: remove q6 bring up clocks
  clk: qcom: ipq5332: remove q6 bring up clocks
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  firmware: qcom_scm: ipq5332: add msa lock/unlock support
  remoteproc: qcom: q6v5: Add multipd interrupts support
  remoteproc: qcom: Add Hexagon based multipd rproc driver
  arm64: dts: qcom: ipq5332: Add nodes to bringup multipd
  arm64: dts: qcom: ipq9574: Add nodes to bring up multipd

 .../bindings/remoteproc/qcom,multipd-pil.yaml | 189 ++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts   |  21 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  60 ++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  59 ++
 drivers/clk/qcom/gcc-ipq5332.c                | 380 --------
 drivers/clk/qcom/gcc-ipq9574.c                | 326 -------
 drivers/firmware/qcom_scm.c                   |  86 ++
 drivers/firmware/qcom_scm.h                   |   3 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5.c                |  37 +-
 drivers/remoteproc/qcom_q6v5.h                |  11 +
 drivers/remoteproc/qcom_q6v5_mpd.c            | 851 ++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5332-gcc.h  |  20 -
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |  18 -
 include/linux/firmware/qcom/qcom_scm.h        |   2 +
 16 files changed, 1336 insertions(+), 747 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,multipd-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_mpd.c

-- 
2.34.1

