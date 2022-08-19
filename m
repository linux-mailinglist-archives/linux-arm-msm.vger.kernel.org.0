Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36AF59A77C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 23:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351600AbiHSVCq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 17:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbiHSVCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 17:02:45 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684D2D8B2E
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 14:02:44 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JFPWlo021605;
        Fri, 19 Aug 2022 21:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=iK0TaXs+Jf9GND/RNtVX+GVJKivY8ZjmldvobPCaM/k=;
 b=FM0QbNDT5Kp7QrQ0olidLa0IGOF5qOW59BcoLOM6nOSE5aRSeCG1+fNi733WZZvqq/u7
 ybXSIL0Gax/Ed4JMrb4KW2YebDs57pp/dbRjKZT/oB1fsUPumfzkyCublr+cdD95vSOM
 rfXkAGQLgi3kBbmF1BD0ypPMcrWBXM/XJYDs0vyvHoRXyZ4ZtdS0GAjFGCcDaNkpDW8G
 doNkpDTJ9dzPykZnF7iyI3rUo+eML4Cvf6ZLNI3oCuMswbdbkW27HjO5js48A4TobW/j
 a1uVz33ydoTUno/TCRHpRKItjRtKAu+9YOvtn8fHgX8gv+n6La0fuGQZ3IetxtSiJcvB 8Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j29w99jay-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Aug 2022 21:02:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27JL2evS002669
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Aug 2022 21:02:40 GMT
Received: from quicinc.com (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 19 Aug
 2022 14:02:40 -0700
From:   Jeff Johnson <quic_jjohnson@quicinc.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>
CC:     <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3] bus: mhi: make mhi_controller_config::event_cfg const
Date:   Fri, 19 Aug 2022 14:02:30 -0700
Message-ID: <20220819210230.17773-1-quic_jjohnson@quicinc.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3i4bYZzEseQedSu3KVbClGYwaBiy_oEn
X-Proofpoint-ORIG-GUID: 3i4bYZzEseQedSu3KVbClGYwaBiy_oEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190079
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the event_cfg pointer in struct mhi_controller_config is not
defined as a const pointer. This prevents clients from registering a
read-only configuration unless they use a typecast. Since the
event_cfg should not be modified once registered, add the const
qualifier to event_cfg. This is aligned with the definition of ch_cfg.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 14 +++++++-------
 include/linux/mhi.h                |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 841626727f6b..2470e9f82aeb 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -238,7 +238,7 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
 };
 
-static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
+static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 	/* first ring is control+data ring */
 	MHI_EVENT_CONFIG_CTRL(0, 64),
 	/* DIAG dedicated event ring */
@@ -305,7 +305,7 @@ static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
 
-static struct mhi_event_config mhi_quectel_em1xx_events[] = {
+static const struct mhi_event_config mhi_quectel_em1xx_events[] = {
 	MHI_EVENT_CONFIG_CTRL(0, 128),
 	MHI_EVENT_CONFIG_DATA(1, 128),
 	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
@@ -344,7 +344,7 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
 
-static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
+static struct const mhi_event_config mhi_foxconn_sdx55_events[] = {
 	MHI_EVENT_CONFIG_CTRL(0, 128),
 	MHI_EVENT_CONFIG_DATA(1, 128),
 	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
@@ -391,7 +391,7 @@ static const struct mhi_channel_config mhi_mv3x_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
 };
 
-static struct mhi_event_config mhi_mv3x_events[] = {
+static const struct mhi_event_config mhi_mv3x_events[] = {
 	MHI_EVENT_CONFIG_CTRL(0, 256),
 	MHI_EVENT_CONFIG_DATA(1, 256),
 	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
@@ -438,7 +438,7 @@ static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 512, 2),
 };
 
-static struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
+static const struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
 	/* first ring is control+data and DIAG ring */
 	MHI_EVENT_CONFIG_CTRL(0, 2048),
 	/* Hardware channels request dedicated hardware event rings */
@@ -472,7 +472,7 @@ static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
 };
 
-static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
+static const struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
 	MHI_EVENT_CONFIG_CTRL(0, 128),
 	MHI_EVENT_CONFIG_HW_DATA(1, 1024, 100),
 	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
@@ -511,7 +511,7 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
 
-static struct mhi_event_config mhi_telit_fn990_events[] = {
+static const struct mhi_event_config mhi_telit_fn990_events[] = {
 	MHI_EVENT_CONFIG_CTRL(0, 128),
 	MHI_EVENT_CONFIG_DATA(1, 128),
 	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index a5441ad33c74..ada2f18af4d6 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -281,7 +281,7 @@ struct mhi_controller_config {
 	u32 num_channels;
 	const struct mhi_channel_config *ch_cfg;
 	u32 num_events;
-	struct mhi_event_config *event_cfg;
+	const struct mhi_event_config *event_cfg;
 	bool use_bounce_buf;
 	bool m2_no_db;
 };
-- 
2.37.0

