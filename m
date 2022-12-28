Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C4C657208
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 03:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbiL1CQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 21:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiL1CQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 21:16:42 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34CE1B7;
        Tue, 27 Dec 2022 18:16:41 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BS2F32H004143;
        Wed, 28 Dec 2022 02:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=MErpBrBhqspvh5y6LZ64TOzF9sRK2Tglmn2Zo9OAXWk=;
 b=RT3sOeb04pc5mobHf9H1A01j3UNTUBw6SQHoooBslJJCSpp54yysdRcu2Ai+EJV0gniQ
 M2+mHoC976bNR9kA4udShZHIlCnMRluzg9kPvMxljy5P87E0On9k4BkbnLZhlX8hmG3S
 QE5z+sKxmEV+Tc/1dzjb7iheQwc6jMVfPcbwhWQfTlsYY1zCag6w4QvrP7I2gnMC4iMs
 qtZ1tj4JDjIwfpXnPcePfVRkErYWh2OTqJ7p23rIp/62WiGqL2PiQsFf6h3SabPsWLTA
 8Zq9oiAWDEPN6ACvfPaI2Hx07PpSynl6TW8Qm90BeLlYbkBQ67dVWPHCMsEyN8KkSFKa rg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mnq4qx02u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Dec 2022 02:16:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BS2GZuT023819
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Dec 2022 02:16:35 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 27 Dec 2022 18:16:34 -0800
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/2] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq is not for aux transfer
Date:   Tue, 27 Dec 2022 18:16:24 -0800
Message-ID: <1672193785-11003-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com>
References: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xl5Y8eX9Fxo0xMknTBDQ0dzvOwKbyRsm
X-Proofpoint-ORIG-GUID: Xl5Y8eX9Fxo0xMknTBDQ0dzvOwKbyRsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_18,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=770 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280015
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are 3 possible interrupt sources are handled by DP controller,
HPDstatus, Controller state changes and Aux read/write transaction.
At every irq, DP controller have to check isr status of every interrupt
sources and service the interrupt if its isr status bits shows interrupts
are pending. There is potential race condition may happen at current aux
isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
even irq is not for aux read or write transaction. This may cause aux read
transaction return premature if host aux data read is in the middle of
waiting for sink to complete transferring data to host while irq happen.
This will cause host's receiving buffer contains unexpected data. This
patch fixes this problem by checking aux isr and return immediately at
aux isr handler if there are no any isr status bits set.

Current there is a bug report regrading eDP edid corruption happen during
system booting up. After lengthy debugging to found that VIDEO_READY
interrupt was continuously firing during system booting up which cause
dp_aux_isr() to complete dp_aux_cmd_fifo_tx() prematurely to retrieve data
from aux hardware buffer which is not yet contains complete data transfer
from sink. This cause edid corruption.

Follows are the signature at kernel logs when problem happen,
EDID has corrupt header
panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID

Changes in v2:
-- do complete if (ret == IRQ_HANDLED) ay dp-aux_isr()
-- add more commit text

Changes in v3:
-- add Stephen suggested
-- dp_aux_isr() return IRQ_XXX back to caller
-- dp_ctrl_isr() return IRQ_XXX back to caller

Changes in v4:
-- split into two patches

Changes in v5:
-- delete empty line between tags

Changes in v6:
-- remove extra "that" and fixed line more than 75 char at commit text

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Tested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index d030a93..cc3efed 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -423,6 +423,10 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 
 	isr = dp_catalog_aux_get_irq(aux->catalog);
 
+	/* no interrupts pending, return immediately */
+	if (!isr)
+		return;
+
 	if (!aux->cmd_busy)
 		return;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

