Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B3375EE01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 10:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjGXIma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 04:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbjGXImW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 04:42:22 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5C0E6D;
        Mon, 24 Jul 2023 01:42:21 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36O5l0OO013997;
        Mon, 24 Jul 2023 08:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=8vawdLiolgYCRKGbK8o9xqjohPdK/o3L5hrBhvJ48+s=;
 b=deR9EViu3QXrNBe3+lgH9l82elphv5rnRXnOQTNc8wfQ8X3/mok/pnE+lj4CNc9MMz/H
 180cWnYRIzgvi5ISJenAqrRc4H3oMk81rQjxfNmnZZRMBR17YA9vGPtQ2D1pix7HGD8G
 zdUmnDEJcjZhvmZM9jH+9Q7X/bkvUvU05vLCJOoj35Bk/evjSJwD7gXZOC55Qk1CZPGK
 Kl+nkPzQrOP4CzBz7ajFLXkmbOFByyKUf+IZGrIZONvHXAVmkFudOfNvmTtAnh6CMdJH
 mTLdqt09z7Si2r8s4vFxomCnRTE62myQY+ilxxy2IumwITtBIJu8YpBzzCHPRDCoEGT+ Mw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s064djuvv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Jul 2023 08:42:17 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36O8gGke005855
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Jul 2023 08:42:16 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 01:42:12 -0700
From:   Komal Bajaj <quic_kbajaj@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v5 0/6] soc: qcom: llcc: Add support for QDU1000/QRU1000
Date:   Mon, 24 Jul 2023 14:11:49 +0530
Message-ID: <20230724084155.8682-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wTekBe_jgcj-5vFx-7W72rjO3ZHT1MKq
X-Proofpoint-ORIG-GUID: wTekBe_jgcj-5vFx-7W72rjO3ZHT1MKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_06,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240077
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series does the following -
 * Refactor LLCC driver to support multiple configuration
 * Add stub function for nvmem_cell_read_u8
 * Add support for multi channel DDR configuration in LLCC
 * Add LLCC support for the Qualcomm QDU1000 and QRU1000 SoCs

Changes in v5 -
 - Seperated out the secure qfprom driver changes to a separate series [1].
 - Created a wrapper struct with a pointer to qcom_llcc_config and
   length of array qcom_llcc_config.
 - Added stub function for nvmem_cell_read_u8.
 - Split commit 6/6 in the previous series into two commits.

Changes in v4 -
 - Created a separate driver for reading from secure fuse region as suggested.
 - Added patch for dt-bindings of secure qfprom driver accordingly.
 - Added new properties in the dt-bindings for LLCC. 
 - Implemented new logic to read the nvmem cell as suggested by Bjorn.
 - Separating the DT patches from this series as per suggestion.

Changes in v3-
 - Addressed comments from Krzysztof and Mani.
 - Using qfprom to read DDR configuration from feature register.

Changes in v2:
  - Addressing comments from Konrad.

[1] https://lore.kernel.org/linux-arm-msm/20230724082946.7441-1-quic_kbajaj@quicinc.com/

Komal Bajaj (6):
  dt-bindings: cache: qcom,llcc: Add LLCC compatible for QDU1000/QRU1000
  soc: qcom: llcc: Refactor llcc driver to support multiple
    configuration
  nvmem: core: Add stub for nvmem_cell_read_u8
  soc: qcom: Add LLCC support for multi channel DDR
  soc: qcom: llcc: Updating the macro name
  soc: qcom: llcc: Add QDU1000 and QRU1000 LLCC support

 .../devicetree/bindings/cache/qcom,llcc.yaml  |  10 +
 drivers/soc/qcom/llcc-qcom.c                  | 357 +++++++++++++-----
 include/linux/nvmem-consumer.h                |   6 +
 include/linux/soc/qcom/llcc-qcom.h            |   2 +-
 4 files changed, 287 insertions(+), 88 deletions(-)

-- 
2.40.1

