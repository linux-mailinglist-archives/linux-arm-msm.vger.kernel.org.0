Return-Path: <linux-arm-msm+bounces-29146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDFD958F57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 22:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6B62857D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 20:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340D91C6880;
	Tue, 20 Aug 2024 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IUV0K0so"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392511C4635
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187012; cv=none; b=kHJQFBKvoJzuRemIsnGTL9j9mUgvaXmPcF6wjF9NXHVAHPetQ3uO2bvu6R50d9usGQnjLGUUt2XwwTwOhYO2Ifdk/jtbp9gPlNf/tiGErMuRGrPqgGANNYCM+jvTaxj8OgMJ7i4vLAGu3PDnTkcNfZ+irl1RFMtvmotf1KvSonI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187012; c=relaxed/simple;
	bh=8ZnntggynUfcTpvzbLLS3cPahVXCc4McD2LWNojoosg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To; b=IIRXgUfIAIxjWG0MINZa6n/8BDjSWiS2sG0WlUwuvfNRlWhcAD3XKCRqwuX0wKars9GjtCxQ/mfRZiLJBbn5GhexTXnTfPg0yrziQhTVqJOn1/I0LuTxN2ZHbdvg3F6MCWyCdKHf2kTi4LGmF4DtAR0B62nDp4MUCXmIe6II8ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IUV0K0so; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KG3vMj026135
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKmWypsIXagKbelQTiXGjddH6JVih37n1BkLcLDMid8=; b=IUV0K0soF375WZAJ
	1Yxn1M6r8dWgWj5NEk/iqfikW4L8P44NUAGazZREa+D99hliZvsSSs0ymegrwnqE
	RPe1+Xrih0meGcC2/mRJPFHtA3wfsG0SOoGvcK0mAgzRAQ7b9GJwzjD10iDIOq2D
	krd7PAJssrBP8K4kTo3c9D+IbjteR3pPWYcNXN0RZQeKuF5JEBDogP+VXEIGlyx6
	d2L7gsgqctxucRXVPyKLCAMSw2edaEYTqpKxM9XtPb3lHE4HfyqJy+YorZyzJgEL
	/Nf53wqRHKlZf8LSiD775QUGw4wkdZn/gI9hO99gU+HFDcHLyU7VIkigkaqe842t
	xEpdpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414xb9gkfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KKo8iv002995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:08 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 13:50:07 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Tue, 20 Aug 2024 13:29:31 -0700
Subject: [PATCH v3 2/3] usb: typec: ucsi: Move unregister out of atomic
 section
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240820-pmic-glink-v6-11-races-v3-2-eec53c750a04@quicinc.com>
References: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
In-Reply-To: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724187007; l=4533;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=8ZnntggynUfcTpvzbLLS3cPahVXCc4McD2LWNojoosg=;
 b=/3DYVyq94KEEq0R8IhUmUgEIKB4rMOESsVyMu/oITe6q9Q95xTFEAGNZomcimWEYQ3KPUn9lY
 N651kkQInJHC8gfr9c8N9kdPnb7/2cFFx/v3sCP+LdAuJd3EbQ+DoOS
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0TAdmtLpt9X7R91kxnYCcPGRpwhnoi5O
X-Proofpoint-ORIG-GUID: 0TAdmtLpt9X7R91kxnYCcPGRpwhnoi5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200152

Commit '9329933699b3 ("soc: qcom: pmic_glink: Make client-lock
non-sleeping")' moved the pmic_glink client list under a spinlock, as it
is accessed by the rpmsg/glink callback, which in turn is invoked from
IRQ context.

This means that ucsi_unregister() is now called from atomic context,
which isn't feasible as it's expecting a sleepable context. An effort is
under way to get GLINK to invoke its callbacks in a sleepable context,
but until then lets schedule the unregistration.

A side effect of this is that ucsi_unregister() can now happen
after the remote processor, and thereby the communication link with it, is
gone. pmic_glink_send() is amended with a check to avoid the resulting NULL
pointer dereference.
This does however result in the user being informed about this error by
the following entry in the kernel log:

  ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI write request: -5

Fixes: 9329933699b3 ("soc: qcom: pmic_glink: Make client-lock non-sleeping")
Cc: stable@vger.kernel.org
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Amit Pundir <amit.pundir@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/soc/qcom/pmic_glink.c       | 10 +++++++++-
 drivers/usb/typec/ucsi/ucsi_glink.c | 27 ++++++++++++++++++++++-----
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 53b176d04fbd..b218460219b7 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -112,8 +112,16 @@ EXPORT_SYMBOL_GPL(pmic_glink_client_register);
 int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
 {
 	struct pmic_glink *pg = client->pg;
+	int ret;
 
-	return rpmsg_send(pg->ept, data, len);
+	mutex_lock(&pg->state_lock);
+	if (!pg->ept)
+		ret = -ECONNRESET;
+	else
+		ret = rpmsg_send(pg->ept, data, len);
+	mutex_unlock(&pg->state_lock);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pmic_glink_send);
 
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 6425904f2bfc..ca89f9037f08 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -68,6 +68,9 @@ struct pmic_glink_ucsi {
 
 	struct work_struct notify_work;
 	struct work_struct register_work;
+	spinlock_t state_lock;
+	bool ucsi_registered;
+	bool pd_running;
 
 	u8 read_buf[UCSI_BUF_SIZE];
 };
@@ -244,8 +247,20 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 static void pmic_glink_ucsi_register(struct work_struct *work)
 {
 	struct pmic_glink_ucsi *ucsi = container_of(work, struct pmic_glink_ucsi, register_work);
+	unsigned long flags;
+	bool pd_running;
 
-	ucsi_register(ucsi->ucsi);
+	spin_lock_irqsave(&ucsi->state_lock, flags);
+	pd_running = ucsi->pd_running;
+	spin_unlock_irqrestore(&ucsi->state_lock, flags);
+
+	if (!ucsi->ucsi_registered && pd_running) {
+		ucsi_register(ucsi->ucsi);
+		ucsi->ucsi_registered = true;
+	} else if (ucsi->ucsi_registered && !pd_running) {
+		ucsi_unregister(ucsi->ucsi);
+		ucsi->ucsi_registered = false;
+	}
 }
 
 static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
@@ -269,11 +284,12 @@ static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
 static void pmic_glink_ucsi_pdr_notify(void *priv, int state)
 {
 	struct pmic_glink_ucsi *ucsi = priv;
+	unsigned long flags;
 
-	if (state == SERVREG_SERVICE_STATE_UP)
-		schedule_work(&ucsi->register_work);
-	else if (state == SERVREG_SERVICE_STATE_DOWN)
-		ucsi_unregister(ucsi->ucsi);
+	spin_lock_irqsave(&ucsi->state_lock, flags);
+	ucsi->pd_running = (state == SERVREG_SERVICE_STATE_UP);
+	spin_unlock_irqrestore(&ucsi->state_lock, flags);
+	schedule_work(&ucsi->register_work);
 }
 
 static void pmic_glink_ucsi_destroy(void *data)
@@ -320,6 +336,7 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	INIT_WORK(&ucsi->register_work, pmic_glink_ucsi_register);
 	init_completion(&ucsi->read_ack);
 	init_completion(&ucsi->write_ack);
+	spin_lock_init(&ucsi->state_lock);
 	mutex_init(&ucsi->lock);
 
 	ucsi->ucsi = ucsi_create(dev, &pmic_glink_ucsi_ops);

-- 
2.34.1


