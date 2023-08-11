Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753FB7798FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 22:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbjHKU67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 16:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbjHKU67 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 16:58:59 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202D3E77;
        Fri, 11 Aug 2023 13:58:57 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BKgVOU002267;
        Fri, 11 Aug 2023 20:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=uuCbJWpNKECor2356hx7nho84yTtt799yig7Y2uAqkU=;
 b=Y7rlUDj6Wvfx/epuPBihpkHAhLeGYeURhxdf7lrAWyC13gHoqXxE6KwoFvroX6NP/Bp/
 1awXgScs4zAMouwx+EfNck0edyhpC8hkI4dYRthh+m3OClx6gmXxjJ/5stneATJNtqln
 T7GowNq8KcovlJpBOavvZVZgh0ftiPSq5HK7HxCcp2VBsyY9vbRqXYKqvIeUtu5He+QT
 VqcsY5P/+xVcn7W0CgWXQFr6Z9q6x5I2r2EhPIlQmtra72GE3dQzlxk3g7YkyuzOAwOm
 Z03Ed8vrUugBQ7QLb0GwUxhEDdzqGE9Kxl59ZBl+782kN2GgKzaTz80mElcWHgHZXZ2Z DA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd8yejq50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 20:58:46 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37BKwj1L005372
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 20:58:45 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 11 Aug 2023 13:58:45 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
CC:     Alex Elder <elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 1/4] soc: qcom: aoss: Move length requirements from caller
Date:   Fri, 11 Aug 2023 13:58:36 -0700
Message-ID: <20230811205839.727373-2-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811205839.727373-1-quic_bjorande@quicinc.com>
References: <20230811205839.727373-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: l5abRemxnJYScDtaVNrLmuAt8a24TZ-g
X-Proofpoint-GUID: l5abRemxnJYScDtaVNrLmuAt8a24TZ-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_12,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308110193
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The existing implementation of qmp_send() requires the caller to provide
a buffer which is of word-aligned. The underlying reason for this is
that message ram only supports word accesses, but pushing this
requirement onto the clients results in the same boiler plate code
sprinkled in every call site.

By using a temporary buffer in qmp_send() we can hide the underlying
hardware limitations from the clients and allow them to pass their
NUL-terminates C string directly.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/net/ipa/ipa_power.c        |  2 +-
 drivers/remoteproc/qcom_q6v5.c     |  2 +-
 drivers/soc/qcom/qcom_aoss.c       | 25 ++++++++++++-------------
 include/linux/soc/qcom/qcom_aoss.h |  4 ++--
 4 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 921eecf3eff6..26181eeed975 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -332,7 +332,7 @@ void ipa_power_retention(struct ipa *ipa, bool enable)
 
 	(void)snprintf(buf, sizeof(buf), fmt, enable ? '1' : '0');
 
-	ret = qmp_send(power->qmp, buf, sizeof(buf));
+	ret = qmp_send(power->qmp, buf);
 	if (ret)
 		dev_err(power->dev, "error %d sending QMP %sable request\n",
 			ret, enable ? "en" : "dis");
diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 192c7aa0e39e..8b41a73fa4d1 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -35,7 +35,7 @@ static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 
 	WARN_ON(ret >= Q6V5_LOAD_STATE_MSG_LEN);
 
-	ret = qmp_send(q6v5->qmp, buf, sizeof(buf));
+	ret = qmp_send(q6v5->qmp, buf);
 	if (ret)
 		dev_err(q6v5->dev, "failed to toggle load state\n");
 
diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index e376c32cc16e..880fe234ca0a 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -206,36 +206,35 @@ static bool qmp_message_empty(struct qmp *qmp)
  * qmp_send() - send a message to the AOSS
  * @qmp: qmp context
  * @data: message to be sent
- * @len: length of the message
  *
  * Transmit @data to AOSS and wait for the AOSS to acknowledge the message.
- * @len must be a multiple of 4 and not longer than the mailbox size. Access is
- * synchronized by this implementation.
+ * data must not be longer than the mailbox size. Access is synchronized by
+ * this implementation.
  *
  * Return: 0 on success, negative errno on failure
  */
-int qmp_send(struct qmp *qmp, const void *data, size_t len)
+int qmp_send(struct qmp *qmp, const void *data)
 {
+	char buf[QMP_MSG_LEN];
 	long time_left;
 	int ret;
 
 	if (WARN_ON(IS_ERR_OR_NULL(qmp) || !data))
 		return -EINVAL;
 
-	if (WARN_ON(len + sizeof(u32) > qmp->size))
+	if (WARN_ON(strlen(data) >= sizeof(buf)))
 		return -EINVAL;
 
-	if (WARN_ON(len % sizeof(u32)))
-		return -EINVAL;
+	strscpy_pad(buf, data, sizeof(buf));
 
 	mutex_lock(&qmp->tx_lock);
 
 	/* The message RAM only implements 32-bit accesses */
 	__iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
-			 data, len / sizeof(u32));
-	writel(len, qmp->msgram + qmp->offset);
+			 buf, sizeof(buf) / sizeof(u32));
+	writel(sizeof(buf), qmp->msgram + qmp->offset);
 
-	/* Read back len to confirm data written in message RAM */
+	/* Read back length to confirm data written in message RAM */
 	readl(qmp->msgram + qmp->offset);
 	qmp_kick(qmp);
 
@@ -262,7 +261,7 @@ static int qmp_qdss_clk_prepare(struct clk_hw *hw)
 	static const char buf[QMP_MSG_LEN] = "{class: clock, res: qdss, val: 1}";
 	struct qmp *qmp = container_of(hw, struct qmp, qdss_clk);
 
-	return qmp_send(qmp, buf, sizeof(buf));
+	return qmp_send(qmp, buf);
 }
 
 static void qmp_qdss_clk_unprepare(struct clk_hw *hw)
@@ -270,7 +269,7 @@ static void qmp_qdss_clk_unprepare(struct clk_hw *hw)
 	static const char buf[QMP_MSG_LEN] = "{class: clock, res: qdss, val: 0}";
 	struct qmp *qmp = container_of(hw, struct qmp, qdss_clk);
 
-	qmp_send(qmp, buf, sizeof(buf));
+	qmp_send(qmp, buf);
 }
 
 static const struct clk_ops qmp_qdss_clk_ops = {
@@ -344,7 +343,7 @@ static int qmp_cdev_set_cur_state(struct thermal_cooling_device *cdev,
 			qmp_cdev->name,
 			cdev_state ? "on" : "off");
 
-	ret = qmp_send(qmp_cdev->qmp, buf, sizeof(buf));
+	ret = qmp_send(qmp_cdev->qmp, buf);
 
 	if (!ret)
 		qmp_cdev->state = cdev_state;
diff --git a/include/linux/soc/qcom/qcom_aoss.h b/include/linux/soc/qcom/qcom_aoss.h
index 3c2a82e606f8..7a71406b6050 100644
--- a/include/linux/soc/qcom/qcom_aoss.h
+++ b/include/linux/soc/qcom/qcom_aoss.h
@@ -13,13 +13,13 @@ struct qmp;
 
 #if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
 
-int qmp_send(struct qmp *qmp, const void *data, size_t len);
+int qmp_send(struct qmp *qmp, const void *data);
 struct qmp *qmp_get(struct device *dev);
 void qmp_put(struct qmp *qmp);
 
 #else
 
-static inline int qmp_send(struct qmp *qmp, const void *data, size_t len)
+static inline int qmp_send(struct qmp *qmp, const void *data)
 {
 	return -ENODEV;
 }
-- 
2.25.1

