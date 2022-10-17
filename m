Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34058600F91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 14:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJQMy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 08:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiJQMyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 08:54:25 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DAC5595;
        Mon, 17 Oct 2022 05:54:24 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H8U0RZ018431;
        Mon, 17 Oct 2022 12:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=5dge2FmJuSbt5xrC1gt2OdSj60f2BgLhPz7YkrDZ//4=;
 b=NeeOslZRoMa29N5invaBV7UQyRB47oyHhU9W9wdwiAuJcVaYKM4Ed8cyzzU947T7H/vv
 FPveNi/V0OUoT5oQRTvYcxGo2LXGh/4tzW8nwuuwocAo22uW8pAX4vpISCWKhxwCQZDE
 Vutn0/0H/tgVtUib2HH3TbEejP2NmppScK1eW+YTNgBDbOdgH91TsflwwDsnzfx1ojh1
 4VcX8nUjWt6fE+0hsrBS3h1E9YEHoFm7kRtihc+Znpv5rO3OrOR5QReGyQK13tinUK0s
 N8gmeCdAzb77m414qKeIdPDC051HsKCllwvj2z/Rj9rOoyC0tlXiki7VweMGToiyU4Yk xg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7nmqvxx2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 12:54:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29HCs5it031055
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 12:54:05 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 17 Oct 2022 05:54:02 -0700
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: sc7280: Add nodes to support WoW on WCN6750
Date:   Mon, 17 Oct 2022 18:23:44 +0530
Message-ID: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b6PEurxxIsjdztOaSxnCM24lLSz9XKiW
X-Proofpoint-ORIG-GUID: b6PEurxxIsjdztOaSxnCM24lLSz9XKiW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_10,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=385 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170075
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
WiFi hardware on SC7280 SoC.

Manikanta Pubbisetty (2):
  dt-bindings: qcom: smp2p: Add WPSS node names to pattern property
  arm64: dts: qcom: sc7280: Add nodes to support WoW on WCN6750
---
Changes from V2:
- Added a pre-requisite binding patch to support WPSS sub nodes in the SMP2P node
- Rebased on ToT

Changes from V1:
- Rebased on ToT

 .../devicetree/bindings/soc/qcom/qcom,smp2p.yaml    |  2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi                | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.38.0

