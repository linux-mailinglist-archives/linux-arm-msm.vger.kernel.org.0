Return-Path: <linux-arm-msm+bounces-62256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D5AE72AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 397C6171B8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7667625C717;
	Tue, 24 Jun 2025 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1xqbv+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8325BF06
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805743; cv=none; b=cisvLi2SnkqGTWXCMh1GJZxaFj8cMP/OzERfo39oCRPtwzAkjRMoy42VGjSdV+TfUboA3JWBETMJkNTDxin2B06kQ8OyM0jBKCVitCJCtkffGveBD4E+iU51yemGHuxpSxHTkFWlNcjnKSn3ok81RatrCNfYe/E+F7RFceBttqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805743; c=relaxed/simple;
	bh=Qvs3OSKRQqOM9ZIlTxVsxePe5U87cmKzQZn7+r8tgeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDC7tbICkD8w8iwMc7c47+S6QOzszAJgcTgxgBVRkDmP8mT00MYlpQY3DPBQn5B+saibe2iR2KiAQH1IGNfXV/goWfxDgxDDpWeJivL8B7Krn/kc8SYzRZm9/gpzpSenw5ne3gmDYZYrZht9P4fL9plyAasWRcoQEsOeWlOi4wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1xqbv+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGFmTk013999
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uiAkGgQteo6o/z1D6/oqPRuT2A6kwChd2t935QW2WY=; b=V1xqbv+oZEv4f7uJ
	RtifVIEkM2+zgmYp++sunzbAXITzrjud5fsVYOO/F4VBD2yvXwa4lFW6xx7EZUhk
	CJJlQUywwXgdf0i5xrXG9QtaEeWjEU4i0222KBYQvHjM9N10r0Ne2cq4h0ZquHOn
	racW4MNit/xXUZqEJ+/5Myrofv+ttLuu7IWz7Cu5OYq5Ec6PVnY6uD2xOn50hjc2
	5Lw55vtalo5CjULbeRBq4FtMuXpkC5O+vLug7Bn30TFGQrdUKSksSDiBOoLW7iSD
	C9m+nKwjBXlHCXryJLVFBkbIZnuWdc+Fhz555moXd4awb4dAgxwoUHwLh0fuiELU
	nMhuLA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5px4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31c38d4063so3861284a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 15:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805740; x=1751410540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uiAkGgQteo6o/z1D6/oqPRuT2A6kwChd2t935QW2WY=;
        b=Y568SH4ApOhKgNe1q3F/76gxC8hk7V+EXxxRVNlBPEyIXc5A51QImjfeEoQeN7dO0s
         DwwC7x9UcdUd3L0Y5rKnwCqs+vzKloZ+JPKLoozl/eRRs6su4aYrrFPAeRm5k6Z73a4s
         IpGqOM6bp0rIuFJXFSmLmpS0YjCZKE/aGFvpGcr8WX3LKSMYIIaRVY2ScPaOKBk7zgYt
         VXDB7zwllY2jR0zlsY/kVfZblI6zMadp0Krr8SKGn4b0uq3xoZKvdpvF7obndU924n3W
         5ay/kM9AMg/2WZJFp+syS9pXJ/w4TwNO5IZcjk/CK8d0gmTvnCk9nIS1ZTZ6ZEYZHWVJ
         YW+g==
X-Forwarded-Encrypted: i=1; AJvYcCXI8J+vexTTBEv7cUKqsBP0/ISOdxktpiNBJ6+AUzBTT0Fo1xMMCMe0n1tilYmTZSihvveFGaWlSWR+KFfc@vger.kernel.org
X-Gm-Message-State: AOJu0YzyEIawoSaAtqGOKrZT31g2MDXf+30HQrjZpu+LrXl8xUUmts26
	qTHowjn0H67gRunDTDSdDN0zoi40mAXQBryPdeaKRVEISD2rzQklBSC/WxdOLXXIiQheiCY5KMT
	bE+SwotiwT62JIMh61pwsvOttF3ohXU4+cMWhz3lbt6wQzkYp47X6eo4LbVhouLGUouwb
X-Gm-Gg: ASbGncsqFKJPv+Y8uI4bhn83jD7nv0vQGvunia18iG/GRAe8k6ug8fJiSWrswOSzBzZ
	tv2UuhD9+Io8LDLGPQYdH1PRLfQOA1KDMxdA1TaMMRySD9VZDCjOVApqEfrrZj+qnHFT5AxNU7i
	pWcFX/UytF9X3Qkrz9ge70IErtzsMLKSTokfPYsnWn88DtjT8X0jjF5AcSo/kBD9GvsiL55ltt1
	fMxQqCmcwfnDvdOxHgthE0X0BCxt7QD8llMa3pgMxZGENzrKGHSwwmYnwq9XKwmzPjRKYcmRHx+
	jIlWlknPBQyvRPWjXE1NWeEFLq3sg/MrmvhQbyZzae1Oa2O2zv5K1Tkt2VGKUgh/i5RFv5VXNDU
	HLQMu9YMeiA==
X-Received: by 2002:a17:90a:c887:b0:313:1e9d:404b with SMTP id 98e67ed59e1d1-315f25c8e7amr848492a91.2.1750805739993;
        Tue, 24 Jun 2025 15:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGii1z/HTJYbndXIl3QbVV7r9Sayc+qnaz/nFenH/a1CYIACL/DiGEBzq6rne4rPDDuISg8Lw==
X-Received: by 2002:a17:90a:c887:b0:313:1e9d:404b with SMTP id 98e67ed59e1d1-315f25c8e7amr848464a91.2.1750805739553;
        Tue, 24 Jun 2025 15:55:39 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a65adsm154949a91.11.2025.06.24.15.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:55:38 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: pmic_glink: Add support for subsystem restart (SSR)
Date: Tue, 24 Jun 2025 15:55:35 -0700
Message-Id: <20250624225535.2013141-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
References: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZIBns124ob8buzvoP0t9CojxzAqDVJwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MiBTYWx0ZWRfXz0DrK8NFZU1B
 UQ9N9AS3KHZ4CL9+6l8TXaw0g55pU+9jdRVylG19n+ODwJyxyq7SGzWINLn2Xs5uNqaOyhGLvmV
 PPwtg75WY+DI0+SznxrTSLudHYy8oPVksE8aoFRTHrv36fLR+ssDyqoye7ltXoiuSZefLUsp4O6
 tgkPM/YxSqUr6KWzreJOy/aAd80LMJYSJDxe7F+DeEMPfuCzkA7BrtJBUkVyqvSP8zaqOmpwzXb
 28BQn+meM0qGO1R0PLrj1HvJgHhY78e0GhxwJqFMwNh/38T1ZUixPvE1k7ZRExHvwQTWaOWotDJ
 rXsU0bQQ996kWfpwxu1TklAda3EpHIENRUBoxioMyWM+2wlmSQOe07h/DUCUSqQ7TswHpH8HyQ2
 xAzgtp/JkoM0TLj3NKPhW0s1eLIJYtBV+V26k21I43t6yS5Nx16HIKbZqAJPpsGnATloKw6G
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685b2ced cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=tIxvoA3mxl7b6XSbyz0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ZIBns124ob8buzvoP0t9CojxzAqDVJwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240182

Add support for PMIC Glink clients to receive notificiation when
the subsystem goes down and comes up again.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 0a6d325b195c..5121f19d63e5 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022, Linaro Ltd
+ * ​​​​Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
@@ -9,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/remoteproc/qcom_rproc.h>
 #include <linux/rpmsg.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/pdr.h>
@@ -39,10 +41,14 @@ struct pmic_glink {
 	struct mutex state_lock;
 	unsigned int client_state;
 	unsigned int pdr_state;
+	unsigned int ssr_state;
 
 	/* serializing clients list updates */
 	spinlock_t client_lock;
 	struct list_head clients;
+
+	struct notifier_block ssr_nb;
+	void *ssr_handle;
 };
 
 static struct pmic_glink *__pmic_glink;
@@ -205,10 +211,12 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
 	unsigned long flags;
 
 	if (pg->client_state != SERVREG_SERVICE_STATE_UP) {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
+		if ((pg->pdr_state == SERVREG_SERVICE_STATE_UP ||
+		     pg->ssr_state == QCOM_SSR_AFTER_POWERUP) && pg->ept)
 			new_state = SERVREG_SERVICE_STATE_UP;
 	} else {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
+		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN ||
+		    pg->ssr_state == QCOM_SSR_BEFORE_SHUTDOWN || !pg->ept)
 			new_state = SERVREG_SERVICE_STATE_DOWN;
 	}
 
@@ -231,6 +239,18 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
 	pmic_glink_state_notify_clients(pg);
 }
 
+static int pmic_glink_ssr_callback(struct notifier_block *nb, unsigned long code, void *data)
+{
+	struct pmic_glink *pg = container_of(nb, struct pmic_glink, ssr_nb);
+
+	mutex_lock(&pg->state_lock);
+	pg->ssr_state = code;
+
+	pmic_glink_state_notify_clients(pg);
+	mutex_unlock(&pg->state_lock);
+	return 0;
+}
+
 static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct pmic_glink *pg;
@@ -281,6 +301,7 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
 static int pmic_glink_probe(struct platform_device *pdev)
 {
 	const unsigned long *match_data;
+	const char *subsys_name = NULL;
 	struct pdr_service *service;
 	struct pmic_glink *pg;
 	int ret;
@@ -333,6 +354,22 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		goto out_release_aux_devices;
 	}
 
+	if (device_property_present(&pdev->dev, "qcom,subsys-name")) {
+		device_property_read_string(&pdev->dev, "qcom,subsys-name", &subsys_name);
+		if (!subsys_name) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
+					"failed to read subsys_name string from dt\n");
+			goto out_release_aux_devices;
+		}
+		pg->ssr_nb.notifier_call = pmic_glink_ssr_callback;
+		pg->ssr_handle = qcom_register_ssr_notifier(subsys_name, &pg->ssr_nb);
+		if (IS_ERR(pg->ssr_handle)) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
+					"failed adding ssr notifier\n");
+			goto out_release_aux_devices;
+		}
+	}
+
 	mutex_lock(&__pmic_glink_lock);
 	__pmic_glink = pg;
 	mutex_unlock(&__pmic_glink_lock);
@@ -360,6 +397,8 @@ static void pmic_glink_remove(struct platform_device *pdev)
 
 	pdr_handle_release(pg->pdr);
 
+	if (pg->ssr_handle)
+		qcom_unregister_ssr_notifier(pg->ssr_handle, &pg->ssr_nb);
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
-- 
2.34.1


