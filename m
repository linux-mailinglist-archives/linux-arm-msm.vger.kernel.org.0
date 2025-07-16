Return-Path: <linux-arm-msm+bounces-65116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FC8B06AA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 02:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9F917679B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 00:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BF2189513;
	Wed, 16 Jul 2025 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6qm2g+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCA17ADF8
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752626416; cv=none; b=JToJzYus7X3+N1BYfs1sGVy5j69z4OVlDU2ERrD9Robv71dxLsBZDtgevKBqX4JZhrLqX92nSSzId/b/KWr/cKNUT7tQPv/+HgbgrpJeNQdOBLpIX7uvaS9t5Bjmh0+XSRud/s/8/IGGW+Z6PU9jLoF6MVfIHYNpQ7S0zm/XZUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752626416; c=relaxed/simple;
	bh=vAkRRqvHAD0WaeAOx8Ggk3PJMx5Sf2fmjMSTFKThMws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aw6kLdE7Ey6ifkRLw2KDNU2DOiJAqTQd14mrwcJYdMYtTl+deOujFO0bEB/Zj3+bhUGhyzODhJPLOWgU/J13Lm/g5V0Q1pB48hF3cuAn/GJF0kgvK+/SWRESdCd7F4U4u0kISjnFPwQarNTDgYwZSLkuPzbyLw0U60DKrgPW0SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6qm2g+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDEf5024488
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7L8zccQI2zwT5CreIwsIK7gSdw94EDsqONxo3PExBg=; b=M6qm2g+hjilifSpj
	LU6jMthBBQeNEvkFqQgnRcqSafeGXM/BzGLLAnbMysvvimSAmhpkVACfOJyQupoa
	XNTg4qhEMuGCmJ8ZwYiSa3kjK9oFMkz+lGByueEz56uv1pROjRXBTH4X570TPdtD
	WY0ZHbnrTjCE17/zS5AoAvhmESY4qqU0L7pumB43hBsqHH6gqlnsRwdJQG6L1wYi
	CZqdWyqCjzVrZWISUk6lwZNB4UGRKwSy3Uez0UsF09bXD+5fFUgEQMW3k990h02m
	EyQ/LlhKTTD+Qv7WNT+3TcP9LWRjJ+cyAJyohzKHlvkQ70v/HBm5hmAbhYivdqgd
	g5mwWQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpcwqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234a102faa3so46684475ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752626409; x=1753231209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7L8zccQI2zwT5CreIwsIK7gSdw94EDsqONxo3PExBg=;
        b=BAo+baARL7sy4Ibl7Nkr6LcGQvls0hVuKH+fMPgxxWO3tBE3qozJXLCX2AV0P09GYS
         0UmjFeHlA/1LAyxf6bKmYdri1yNpuimzheSp18ebZrBLj82rRNdQ3qc7sm+Z+izq7xFG
         QXL7bKNwlcPp9c0hOdaxfsXF/H5G0CkY0GtE2LRCfiAuwNDbnSsLUoMPaGFyr6Gcs+g3
         I17o3ogVOxmEMQh7N+akEwMFCyWetEZo4WS6pglN70nRZJRLh41jXv/TlvnWJlVOlGLs
         R0pD7Ym6p4XD8sqKfw2o0TUGLfFRh23BvbaDKwo6SD0L379zGmyFP6x8JtZuBHziXQxk
         NWYg==
X-Forwarded-Encrypted: i=1; AJvYcCX38cpoWBDh6/gDzmQH3cMKHS7AX3RkR9slwHIYsHLnX27AIrprj76t2ELJ16ILMx1x3AeNOX4Ey1EU0uDy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzani0/hukN1mITtSGa7YQ6We0ZxFtz93VUFpwSoKZb9rHj+LTz
	2IZBbwcrw8bX634ZkTAz8mTlZmc96ML2gLw8DqD/gtTUKosmYMEBf+wnl+GHpon3cwPY18Gj1IJ
	kDfAC8TPOZNuLivJ27WodpbwJV92Pwwiox+o7ebdjCCvM32j9UY8FBxFx6EvZplbwgHf1
X-Gm-Gg: ASbGncuNmMMcB/ZXpZnHHN0stRqbeLL5NIqLfRDpvmixsQNsQ51c1YeqzPiPzsPMm7s
	hkKARad6vrmegyuurkbiFvjOSFkPm4iZcxkM37waoiDMa1KlIT1iiITIEVZgScDVpnS9KK1ZlhA
	luqfyIvfRkGI+CrJFmBQWWnq0QYfNza3CWPofVJ99dP7mN9hc59yw4ivCm9+OpDIocgdD8BjVhX
	ZZegh4x+c0UmIkK3wJZA/MBxOtCr37YBXUySW124RuExBpwSLTUhIbFlDvs0kFPCqb4hmOT68sn
	kwBaSvf50+ckSyzcOuSmYty5IjxR6Yy1PCPmkgtWzagTOfJ3JYfXaZTmdmugYoBvx7ZaVq2ldNJ
	nh4w2DIZPm1nDCpgV3xaQOj3mHGA=
X-Received: by 2002:a17:903:b8d:b0:234:986c:66bf with SMTP id d9443c01a7336-23e24ec7396mr12457625ad.11.1752626409146;
        Tue, 15 Jul 2025 17:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9o0Hvpy3s68n5xE0Y4Mg1IadK+24wI9tDSth3vuKcZbaJK+CEqipJ1BjrfbqAn5fo3uBvQ==
X-Received: by 2002:a17:903:b8d:b0:234:986c:66bf with SMTP id d9443c01a7336-23e24ec7396mr12457305ad.11.1752626408661;
        Tue, 15 Jul 2025 17:40:08 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aeadcsm117015525ad.78.2025.07.15.17.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:40:08 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: pmic_glink: Add support for subsystem restart (SSR)
Date: Tue, 15 Jul 2025 17:40:04 -0700
Message-Id: <20250716004004.311001-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
References: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAwNCBTYWx0ZWRfX4F9RLNpXAGu7
 +FUrU5ScNZfwHM88UWeqgerZYvBN2mtLqVL2lFxq5LgZcykB3UJCqGYo77JOPakJ2LDJaWvXykS
 P1mead8gEHpAFgzrc6n+kENk7qphCUNr2CBPfrtqWVKt7J1ObELAYRxHAjsln4z4wxIMgJl55+X
 9+dfFQby0ynQdjdFRHq+7GCl4opCx/y329AoQwBV2BvZ1ST05vgB/1pFqxZEd8WQloMS932+uz1
 jyQMyyfT1fW79x+9d7P6hT87/n2e/1ArSf+1aHk6QwWMfbZIpBZv6zu2ghvZw/WML6ItEIqHVgE
 Y3TwbIUNFQkV9EKFmTCN8KjRA/BaBrSBU3BlQQD695PNU+URFNx7aX9mejRQRV20xAUfHUxkUMX
 u1BA+q/WIg1cCbtS/iLwfvLnWgsD2r+7cqkqUVw7NPv6vtqcHR4hpqfdN2LXKd+ivi0Em9MA
X-Proofpoint-GUID: tDcn482VWt8nqNbith9XvDRpr2Gs7gxg
X-Proofpoint-ORIG-GUID: tDcn482VWt8nqNbith9XvDRpr2Gs7gxg
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6876f4ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=qf4gfuq51q0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_yRAvpyYgic1g3OvRboA:9
 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160004

Add support for PMIC Glink clients to receive notificiation when
the subsystem goes down and comes up again.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 80 ++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 0a6d325b195c..3e755073db60 100644
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
@@ -23,13 +25,18 @@ enum {
 	PMIC_GLINK_CLIENT_UCSI,
 };
 
+struct pmic_glink_data {
+	unsigned long	client_mask;
+	char		*ssr_name;
+};
+
 struct pmic_glink {
 	struct device *dev;
 	struct pdr_handle *pdr;
 
 	struct rpmsg_endpoint *ept;
 
-	unsigned long client_mask;
+	const struct pmic_glink_data *data;
 
 	struct auxiliary_device altmode_aux;
 	struct auxiliary_device ps_aux;
@@ -39,10 +46,14 @@ struct pmic_glink {
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
@@ -205,10 +216,13 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
 	unsigned long flags;
 
 	if (pg->client_state != SERVREG_SERVICE_STATE_UP) {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
+		if ((pg->pdr_state == SERVREG_SERVICE_STATE_UP ||
+		     pg->ssr_state == QCOM_SSR_AFTER_POWERUP) && pg->ept)
 			new_state = SERVREG_SERVICE_STATE_UP;
 	} else {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
+		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN ||
+		    pg->ssr_state == QCOM_SSR_BEFORE_SHUTDOWN ||
+		    !pg->ept)
 			new_state = SERVREG_SERVICE_STATE_DOWN;
 	}
 
@@ -231,6 +245,18 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
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
@@ -280,7 +306,6 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
 
 static int pmic_glink_probe(struct platform_device *pdev)
 {
-	const unsigned long *match_data;
 	struct pdr_service *service;
 	struct pmic_glink *pg;
 	int ret;
@@ -297,12 +322,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
 	spin_lock_init(&pg->client_lock);
 	mutex_init(&pg->state_lock);
 
-	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
-	if (!match_data)
+	pg->data = of_device_get_match_data(&pdev->dev);
+	if (!pg->data)
 		return -EINVAL;
 
-	pg->client_mask = *match_data;
-
 	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
 	if (IS_ERR(pg->pdr)) {
 		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr),
@@ -310,17 +333,17 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
 		if (ret)
 			goto out_release_pdr_handle;
 	}
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
 		if (ret)
 			goto out_release_ucsi_aux;
 	}
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->ps_aux, "power-supply");
 		if (ret)
 			goto out_release_altmode_aux;
@@ -333,6 +356,16 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		goto out_release_aux_devices;
 	}
 
+	if (device_property_present(&pdev->dev, "qcom,subsys-restart")) {
+		pg->ssr_nb.notifier_call = pmic_glink_ssr_callback;
+		pg->ssr_handle = qcom_register_ssr_notifier(pg->data->ssr_name, &pg->ssr_nb);
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
@@ -340,13 +373,13 @@ static int pmic_glink_probe(struct platform_device *pdev)
 	return 0;
 
 out_release_aux_devices:
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
 out_release_altmode_aux:
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
 		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
 out_release_ucsi_aux:
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
 out_release_pdr_handle:
 	pdr_handle_release(pg->pdr);
@@ -360,23 +393,28 @@ static void pmic_glink_remove(struct platform_device *pdev)
 
 	pdr_handle_release(pg->pdr);
 
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
+	if (pg->ssr_handle)
+		qcom_unregister_ssr_notifier(pg->ssr_handle, &pg->ssr_nb);
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
 		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
 
 	guard(mutex)(&__pmic_glink_lock);
 	__pmic_glink = NULL;
 }
 
-static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
-							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
-							   BIT(PMIC_GLINK_CLIENT_UCSI);
+static const struct pmic_glink_data pmic_glink_sm8450_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI),
+	.ssr_name = "lpass",
+};
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
+	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
-- 
2.34.1


