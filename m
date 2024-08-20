Return-Path: <linux-arm-msm+bounces-29148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6E958F59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 22:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A138285999
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 20:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB0C1C688E;
	Tue, 20 Aug 2024 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eNUdkeRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CB11C578D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187012; cv=none; b=dw4M68xXxl/XrR2+YIopkCphB+g54IivRmugLtwJgyV290FFtMPzjgCvO4znhBA/BLXNRyFs965xJt/sr4TZH48fj9yuHgaJGVAPYIZpPOHLZ+0tFq3t9HoL1lyjNOHCGEMxeFGGUGuUP5G/7dxWmyo2aOWBLxosVvz7bZrNAUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187012; c=relaxed/simple;
	bh=zLJVLWEl9jLFbUpUWn5uTGyQEAeOhjs8QrlUuSQSqlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To; b=W4qq9KekrFRh18GDBe1VxmuBkEZPZOsqywOc2ENCnUnJytFcytqfEjH9c7aart54xXj2VFzo9OdvByYcBNqdDO0vDVlhckRHs7d/bNOrSb/3CH/MRmMOHa/FdFqhu6PWLlC01l2YJua0qx6qzr96d9ubrJhNyucf1KBLyeGDOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eNUdkeRv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KEhS13023865
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZZ3eMLnN8Hj5nB2lng1pT+FusLu8cxwa3n2pMT4h20=; b=eNUdkeRvnL7d+ZYq
	9ybHvwbawP6YRWGtbsOm5WhsDjxx2jtA49kX5OjIS3mmZuu09dlU5HCL1579RiEx
	9kwA5mN/DOe+rtsVYZ4LrVwr7a/aFU3OloZjQHih2VWfE7KO5TzxLMyQUWioFRd5
	YGbbxyXhIPoxtH++UcZ//124XU0U5XmpzrI4yAIC8h16iSFeMHtqS1IzILTNA6F9
	yvSUOWddVwNHo5IH6EWoevtK3QUlJnjKC/GL5Kmb49SWzTUgbNpHpTf/jqy364YJ
	E5giJLeOo/btQkjtBKj+eTWrGp/+bcnoFOjH+HTGFbabuhojxal3AUf4NJ8WAx6A
	B5paqQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdmt6gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KKo7nT004005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:08 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 13:50:07 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Tue, 20 Aug 2024 13:29:30 -0700
Subject: [PATCH v3 1/3] soc: qcom: pmic_glink: Fix race during
 initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240820-pmic-glink-v6-11-races-v3-1-eec53c750a04@quicinc.com>
References: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
In-Reply-To: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724187007; l=8777;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=zLJVLWEl9jLFbUpUWn5uTGyQEAeOhjs8QrlUuSQSqlc=;
 b=RdwiqETDtgZf7rTQlmLrQ29co/2WueD/wTrF9TZ6Y8aVIswidtXheR/uj+YBGGWEMxdqcCydF
 0jWrVICXZcJDfAjA2F3Pzp5e4CwGP2s5HlmaRLz0rVpYil837nwgBnl
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iaBzkhATKUFZ6M3tfzpYr9YV_z3hYZiM
X-Proofpoint-GUID: iaBzkhATKUFZ6M3tfzpYr9YV_z3hYZiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200152

As pointed out by Stephen Boyd it is possible that during initialization
of the pmic_glink child drivers, the protection-domain notifiers fires,
and the associated work is scheduled, before the client registration
returns and as a result the local "client" pointer has been initialized.

The outcome of this is a NULL pointer dereference as the "client"
pointer is blindly dereferenced.

Timeline provided by Stephen:
 CPU0                               CPU1
 ----                               ----
 ucsi->client = NULL;
 devm_pmic_glink_register_client()
  client->pdr_notify(client->priv, pg->client_state)
   pmic_glink_ucsi_pdr_notify()
    schedule_work(&ucsi->register_work)
    <schedule away>
                                    pmic_glink_ucsi_register()
                                     ucsi_register()
                                      pmic_glink_ucsi_read_version()
                                       pmic_glink_ucsi_read()
                                        pmic_glink_ucsi_read()
                                         pmic_glink_send(ucsi->client)
                                         <client is NULL BAD>
 ucsi->client = client // Too late!

This code is identical across the altmode, battery manager and usci
child drivers.

Resolve this by splitting the allocation of the "client" object and the
registration thereof into two operations.

This only happens if the protection domain registry is populated at the
time of registration, which by the introduction of commit '1ebcde047c54
("soc: qcom: add pd-mapper implementation")' became much more likely.

Reported-by: Amit Pundir <amit.pundir@linaro.org>
Closes: https://lore.kernel.org/all/CAMi1Hd2_a7TjA7J9ShrAbNOd_CoZ3D87twmO5t+nZxC9sX18tA@mail.gmail.com/
Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/all/ZqiyLvP0gkBnuekL@hovoldconsulting.com/
Reported-by: Stephen Boyd <swboyd@chromium.org>
Closes: https://lore.kernel.org/all/CAE-0n52JgfCBWiFQyQWPji8cq_rCsviBpW-m72YitgNfdaEhQg@mail.gmail.com/
Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Cc: stable@vger.kernel.org
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Amit Pundir <amit.pundir@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/power/supply/qcom_battmgr.c   | 16 ++++++++++------
 drivers/soc/qcom/pmic_glink.c         | 28 ++++++++++++++++++----------
 drivers/soc/qcom/pmic_glink_altmode.c | 17 +++++++++++------
 drivers/usb/typec/ucsi/ucsi_glink.c   | 16 ++++++++++------
 include/linux/soc/qcom/pmic_glink.h   | 11 ++++++-----
 5 files changed, 55 insertions(+), 33 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 49bef4a5ac3f..07758ab6ac1c 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -1387,12 +1387,16 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 					     "failed to register wireless charing power supply\n");
 	}
 
-	battmgr->client = devm_pmic_glink_register_client(dev,
-							  PMIC_GLINK_OWNER_BATTMGR,
-							  qcom_battmgr_callback,
-							  qcom_battmgr_pdr_notify,
-							  battmgr);
-	return PTR_ERR_OR_ZERO(battmgr->client);
+	battmgr->client = devm_pmic_glink_client_alloc(dev, PMIC_GLINK_OWNER_BATTMGR,
+						     qcom_battmgr_callback,
+						     qcom_battmgr_pdr_notify,
+						     battmgr);
+	if (IS_ERR(battmgr->client))
+		return PTR_ERR(battmgr->client);
+
+	pmic_glink_client_register(battmgr->client);
+
+	return 0;
 }
 
 static const struct auxiliary_device_id qcom_battmgr_id_table[] = {
diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 9ebc0ba35947..53b176d04fbd 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -66,15 +66,14 @@ static void _devm_pmic_glink_release_client(struct device *dev, void *res)
 	spin_unlock_irqrestore(&pg->client_lock, flags);
 }
 
-struct pmic_glink_client *devm_pmic_glink_register_client(struct device *dev,
-							  unsigned int id,
-							  void (*cb)(const void *, size_t, void *),
-							  void (*pdr)(void *, int),
-							  void *priv)
+struct pmic_glink_client *devm_pmic_glink_client_alloc(struct device *dev,
+						       unsigned int id,
+						       void (*cb)(const void *, size_t, void *),
+						       void (*pdr)(void *, int),
+						       void *priv)
 {
 	struct pmic_glink_client *client;
 	struct pmic_glink *pg = dev_get_drvdata(dev->parent);
-	unsigned long flags;
 
 	client = devres_alloc(_devm_pmic_glink_release_client, sizeof(*client), GFP_KERNEL);
 	if (!client)
@@ -85,6 +84,18 @@ struct pmic_glink_client *devm_pmic_glink_register_client(struct device *dev,
 	client->cb = cb;
 	client->pdr_notify = pdr;
 	client->priv = priv;
+	INIT_LIST_HEAD(&client->node);
+
+	devres_add(dev, client);
+
+	return client;
+}
+EXPORT_SYMBOL_GPL(devm_pmic_glink_client_alloc);
+
+void pmic_glink_client_register(struct pmic_glink_client *client)
+{
+	struct pmic_glink *pg = client->pg;
+	unsigned long flags;
 
 	mutex_lock(&pg->state_lock);
 	spin_lock_irqsave(&pg->client_lock, flags);
@@ -95,11 +106,8 @@ struct pmic_glink_client *devm_pmic_glink_register_client(struct device *dev,
 	spin_unlock_irqrestore(&pg->client_lock, flags);
 	mutex_unlock(&pg->state_lock);
 
-	devres_add(dev, client);
-
-	return client;
 }
-EXPORT_SYMBOL_GPL(devm_pmic_glink_register_client);
+EXPORT_SYMBOL_GPL(pmic_glink_client_register);
 
 int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
 {
diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 1e0808b3cb93..c6f3d5188fc6 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -520,12 +520,17 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 			return ret;
 	}
 
-	altmode->client = devm_pmic_glink_register_client(dev,
-							  altmode->owner_id,
-							  pmic_glink_altmode_callback,
-							  pmic_glink_altmode_pdr_notify,
-							  altmode);
-	return PTR_ERR_OR_ZERO(altmode->client);
+	altmode->client = devm_pmic_glink_client_alloc(dev,
+						     altmode->owner_id,
+						     pmic_glink_altmode_callback,
+						     pmic_glink_altmode_pdr_notify,
+						     altmode);
+	if (IS_ERR(altmode->client))
+		return PTR_ERR(altmode->client);
+
+	pmic_glink_client_register(altmode->client);
+
+	return 0;
 }
 
 static const struct auxiliary_device_id pmic_glink_altmode_id_table[] = {
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 16c328497e0b..6425904f2bfc 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -367,12 +367,16 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 		ucsi->port_orientation[port] = desc;
 	}
 
-	ucsi->client = devm_pmic_glink_register_client(dev,
-						       PMIC_GLINK_OWNER_USBC,
-						       pmic_glink_ucsi_callback,
-						       pmic_glink_ucsi_pdr_notify,
-						       ucsi);
-	return PTR_ERR_OR_ZERO(ucsi->client);
+	ucsi->client = devm_pmic_glink_client_alloc(dev, PMIC_GLINK_OWNER_USBC,
+						  pmic_glink_ucsi_callback,
+						  pmic_glink_ucsi_pdr_notify,
+						  ucsi);
+	if (IS_ERR(ucsi->client))
+		return PTR_ERR(ucsi->client);
+
+	pmic_glink_client_register(ucsi->client);
+
+	return 0;
 }
 
 static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
diff --git a/include/linux/soc/qcom/pmic_glink.h b/include/linux/soc/qcom/pmic_glink.h
index fd124aa18c81..4c68385b2765 100644
--- a/include/linux/soc/qcom/pmic_glink.h
+++ b/include/linux/soc/qcom/pmic_glink.h
@@ -23,10 +23,11 @@ struct pmic_glink_hdr {
 
 int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len);
 
-struct pmic_glink_client *devm_pmic_glink_register_client(struct device *dev,
-							  unsigned int id,
-							  void (*cb)(const void *, size_t, void *),
-							  void (*pdr)(void *, int),
-							  void *priv);
+struct pmic_glink_client *devm_pmic_glink_client_alloc(struct device *dev,
+						     unsigned int id,
+						     void (*cb)(const void *, size_t, void *),
+						     void (*pdr)(void *, int),
+						     void *priv);
+void pmic_glink_client_register(struct pmic_glink_client *client);
 
 #endif

-- 
2.34.1


