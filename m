Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D6473130E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 11:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245066AbjFOJHZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 05:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239094AbjFOJHY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 05:07:24 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7F41720;
        Thu, 15 Jun 2023 02:07:23 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F8Nwnn031685;
        Thu, 15 Jun 2023 09:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=w28sBXMcKf+o5X/JU4a1Ebp6Lc1Mr59VNKpR9jp0SOc=;
 b=AzcxLMHaEB8HoxpGijKmAixbZuzEo1NYPdZv8KmkOSvb6CnMMwXFPMp6FrwRL1uXEXmQ
 kgng3qOnLl6xJtYzzT+DTkX/id+KEtAM5pZetlGzed7t4FDf7idZY2sRh9y3ITkymUGE
 O8y0CzKtAuWS6jsabeUjRMT52Eaztts/iGkCwcBkpVcbUjfjECifBIvTofQIybQAwlc3
 P9qc2VTJZynrL0ugsq+0HUjahnVqAHlZnJW9dpEtf/B0k5u2T2RIOp2nYf+pGWWr+L94
 Zy0Rs0OmvmpO75vngMm93j9Msvcs6c6itF27l53vLKoTYVGajyARUKtMsmWgiX7s3BR5 +A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7va2gg0r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 09:07:04 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35F973mE008134
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 09:07:03 GMT
Received: from win-platform-upstream01.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 15 Jun 2023 02:06:56 -0700
From:   Sricharan Ramabadhran <quic_srichara@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robimarko@gmail.com>,
        <krzysztof.kozlowski@linaro.org>, <andy.shevchenko@gmail.com>,
        <quic_srichara@quicinc.com>
Subject: [v10 0/6] Add minimal boot support for IPQ5018
Date:   Thu, 15 Jun 2023 14:36:32 +0530
Message-ID: <20230615090638.1771245-1-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ay8YkqqCH-K2_mfhOScyiulCGxVdokYl
X-Proofpoint-ORIG-GUID: Ay8YkqqCH-K2_mfhOScyiulCGxVdokYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=804
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150077
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The IPQ5018 is Qualcomm's 802.11ax SoC for Routers,
Gateways and Access Points.

This series adds minimal board boot support for ipq5018-rdp432-c2 board.

[v10]  Dropped patches 3,4 for pinctrl (was picked by Linus)
       Fixed hex number style in patch 2 as per Konrad's comments.

[v9]   Change only in patch 2/8
	   Sorted the headers and cleaned the unwanted ones
 	   Added trailing comma for .parent_hws member
	   Removed the hunk touching ipq5332 kconfig  (unintentionally)

[v8]   Changed only in patch 4/8
                Fixed Kconfig to add COMPILE_TEST and removed header of.h.
                Instead using mod_devicetable.h. Added Linus reviewed-by

[v7]   Fixed tz reserved region size in patch 7/8

[v6]   Fixed patch [4/8] pinctrl driver for rebase issue.

[v5]
       Added Reviewed-by tags from Krzysztof Kozlowski.
       Changed patch [6/8] with [1] since its already Acked
       Rebased patch [4/8] on top of [2] and fixed other comments
       Fixed commit log for patch [7/8]
       Fixed comments for patch [2/8]

[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1678164097-13247-4-git-send-email-quic_mmanikan@quicinc.com/
[2] https://lore.kernel.org/r/1683718725-14869-1-git-send-email-quic_rohiagar@quicinc.com

[v4]
       Fixed all comments for clocks, schema, dts
       Added Reviewed-by tags.

[v3]
        Fixed all comments for clocks, schema fixes
        Picked up Reviewed-by from Bjorn for pinctrl driver

[v2]
        Fixed all comments and rebased for TOT.

Manikanta Mylavarapu (1):
  dt-bindings: scm: Add compatible for IPQ5018

Sricharan Ramabadhran (5):
  dt-bindings: arm64: Add IPQ5018 clock and reset
  clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018
  dt-bindings: qcom: Add ipq5018 bindings
  arm64: dts: Add ipq5018 SoC and rdp432-c2 board support
  arm64: defconfig: Enable IPQ5018 SoC base configs

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 .../bindings/clock/qcom,ipq5018-gcc.yaml      |   63 +
 .../bindings/firmware/qcom,scm.yaml           |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts |   72 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  250 ++
 arch/arm64/configs/defconfig                  |    3 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-ipq5018.c                | 3724 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq5018.h  |  183 +
 include/dt-bindings/reset/qcom,gcc-ipq5018.h  |  122 +
 12 files changed, 4435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq5018.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq5018.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq5018.h

-- 
2.34.1

