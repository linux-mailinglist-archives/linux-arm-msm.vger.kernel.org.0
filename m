Return-Path: <linux-arm-msm+bounces-79019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E52C118A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E66CC34A82A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 21:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C1732C312;
	Mon, 27 Oct 2025 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NR6lGFAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FC332ABCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 21:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761600178; cv=none; b=DeRYdQe7IrpM1vic5oMXtIAv2Lov8h4eQDkVQrsoPCOuFKztmhMi3J6dwx3hIWb4N5/R0z3mzpvHllElAHCtcmgQkMFMScuFaLYVfSQqnIaqJMxozCZMfZvI4vBDT7p+hIXPf2Gn9ImhBt9xGclfLYNiB+0qvxen1zTRfqz5JiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761600178; c=relaxed/simple;
	bh=CcpDVpY/CMTToIm66HwuHkzdfc8rOaDLuM0ugpqd34E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjF3YtY1ypg8LhaiUVcNYtJVkXDtXJR9/63d+r5Ho3+/jhMRWVrDLdFPrGYHcbfPozdZWrGsRj7ahtmWdmIZppEj0AREJ6CmjR0PXNW8qYjCEJPV1k7/6MiCPAT9M2/7T5uUuq++16FbaBfDzQgTXea7QGjio+MJ6eFDgpB4Np8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NR6lGFAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RDhKCM2962176
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 21:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5QVqH4rj9jg
	TP2tcxWJcAaq9uJE9i2zyg79NKbM0ACc=; b=NR6lGFAgUbh+lOuG51w0uhHe6ET
	NO8knWyieIhZHPlk/jqs7km9FQLqRNRr1GMxJR8uIX9G+8scsJd98N3UPcaDVkiB
	8JZC4OwBY3+SfUxDeklXrvqK+5FGXa9IjzFCxUU1HxsdGB99dczIlXR0hUtR4PLZ
	1DYFyLy/9l5VyLquFMQqDLJzjwlaVlPTl+EvSh/HiNfhydCHTEUiC829BI3S+RzB
	RAHy5xIw0WprVZTF+CJj7Hr41uW6b2ZZWFDOfHj5QIi/tf8ABdHX24+xCrvxv60w
	4lNbOUnmqVtV9ap/+jwe2t30dPmRAtqiqbLZW9JjSw7VWLIpBkiDYDNPjJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29v9sef8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 21:22:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290c9724deeso44938755ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761600175; x=1762204975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QVqH4rj9jgTP2tcxWJcAaq9uJE9i2zyg79NKbM0ACc=;
        b=lQqSHEo80rFKFxRU4Hqg5QPyYFCoRCBQbuPCe7exDrZ/gKPRFA5cNLLFY+5OurLpFm
         02UHhOkoouH5v3B5tbZRE3B0vGYHpb1A2U4JNrT4T0ruD3Z7OXGqmi/G92nasf0FURSy
         GDgsP4PHbk9BIjPYaFI5vSbC6obyWAu86yV+8TYu+JAMvLTMSwHSH9Q53yuklhPtbOev
         XZzN9iDVz7mJNVEeW0QltcJlA3gwxrNo5ovFLATFVZJ9LjwEebfU0kki+rJTq/qfCQtv
         /zh9uCyz8oOgW9U8dhdFiBrLu5mrb/4xQegsFTsQG3ACY7RlroTdoMhhUOQjeVhuk+Uu
         SCgg==
X-Gm-Message-State: AOJu0Yyb/4Wa8KZk4vMa1iJmv7pIM3Oic930IeX8PrWStsFQPe9u37Kz
	wtfCwHQ+zp6VowftgW9GvBe2YD3JI2U/gYw4iAaxVBUxWQ06pk6eqvleOQNBom4p1onHIUokBzn
	8K3Jwn7kXj9j8FZMIZW7t/aoCS03sIMy6GdaVl/pfjGwwLMcotmet8WJuXZ9fDTMoobxJ
X-Gm-Gg: ASbGncv1/IeMqXdlGBeZ1nEWRmh7tjbMyzj7Cmr3TcnJb63b1xjiH8Wf5Wf0Cy6gZA1
	2YZRJufT+UnSsuo9OMdFQ30QY1pgEvh6nJfyodLmIpm92f3NjVAn4SOOzw+PJnaExRKWHb5PwdI
	OEnGR5uodpUD/YmfLiR1RF5g1n6+l7G8VIFag1jnseUHnIg8UwM4wWMOKt+3Y3vdFR9MctgVo2N
	EgKyhsNqniLGlNDAd4s2MSE8MvUlhFfdC+cT8TAAUfu6sA4/lYr6lC+rBbKvSjcgikFZ0CNM2/I
	XhW06Q42YD/i13Qj3XjA0VLpPiBGimMDgDDxZSUFUjzgK1H3s8ilT8MhpwZo1cuZgNcLr3LdM78
	lW59E/9UuOmje/NRYZ7Q7lUmh6QTX7oe4JhzTlQPEa9uAWJFzL2H0KnQ+rs2X2g==
X-Received: by 2002:a17:903:1a70:b0:25c:8745:4a58 with SMTP id d9443c01a7336-294cb35eb5cmr16865985ad.3.1761600174751;
        Mon, 27 Oct 2025 14:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc7+BqdDpT95rzu+b5iXYfHPGKXxtw9ATrooNg2dqssQr5tcX0w86V1I2WFwTJPodpAISjOg==
X-Received: by 2002:a17:903:1a70:b0:25c:8745:4a58 with SMTP id d9443c01a7336-294cb35eb5cmr16865755ad.3.1761600174254;
        Mon, 27 Oct 2025 14:22:54 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42afdsm91073055ad.99.2025.10.27.14.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 14:22:53 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: pmic_glink: Add charger PDR service path and service name to client data
Date: Mon, 27 Oct 2025 14:22:50 -0700
Message-Id: <20251027212250.3847537-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OnJifzh0aaGYDVU3Ik_22ADqamo03vvO
X-Authority-Analysis: v=2.4 cv=D/VK6/Rj c=1 sm=1 tr=0 ts=68ffe2af cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=X7TptQfD4XCScbvf-kcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: OnJifzh0aaGYDVU3Ik_22ADqamo03vvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE5NyBTYWx0ZWRfX7jJjtk1Fs4rA
 EnoWcSgThQCYDGY/dGOE6vcc2Nhy0pe3+z/mHauKOF6y1esNqr1pp/QnVKtlBDke0CqW3AU1QtB
 IsjqnVSjM0cTJl3dm+Fv5aerIzr5j9vxFzXgwrOKtdI1Eo7HfnZF/STS2G6sX4lgoIgz2eb3Tra
 7XpTSTcTwaLiaOA2dkGsd4S1j9aUyxFQAjTXMFXdxNxwuXL6TYpJPiqD1RDOSH7H0HpaOnk4n43
 7WJL/bkdEvq5JTZGUwLtYhrEIaAU8AcRbiAo1cla96jUSlAVVeCtQNFzELHkUcEtiYkTbuX5guK
 4Swnmp5IqUfI1KrLKUBwzcpvxI5YcxnJI3VKrK4bJA9wIwm5igRRx7NDOB8BlA2IgMY13pV57Aa
 +Nlw2AOFEblqJEs8h2r7Fz93HUdW9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270197

Currently, the charger PD service path and service name are hard coded
however these paths are not guaranteed to be the same between PMICs. For
example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
which does not have any specific charger PDs defined.

Define charger PDR service path and service name as client data so that
each PMIC generation can properly define these paths.

While at it, add the qcom,kaanapali-pmic-glink and
qcom,glymur-pmic-glink compatible strings.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index c0a4be5df926..aa5ba9a0285e 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -23,13 +23,19 @@ enum {
 	PMIC_GLINK_CLIENT_UCSI,
 };
 
+struct pmic_glink_data {
+	unsigned long	client_mask;
+	char		*charger_pdr_service_name;
+	char		*charger_pdr_service_path;
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
@@ -285,7 +291,6 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
 
 static int pmic_glink_probe(struct platform_device *pdev)
 {
-	const unsigned long *match_data;
 	struct pdr_service *service;
 	struct pmic_glink *pg;
 	int ret;
@@ -302,12 +307,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
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
@@ -315,27 +318,30 @@ static int pmic_glink_probe(struct platform_device *pdev)
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
 	}
 
-	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
-	if (IS_ERR(service)) {
-		ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
-				    "failed adding pdr lookup for charger_pd\n");
-		goto out_release_aux_devices;
+	if (pg->data->charger_pdr_service_name && pg->data->charger_pdr_service_path) {
+		service = pdr_add_lookup(pg->pdr, pg->data->charger_pdr_service_name,
+					 pg->data->charger_pdr_service_path);
+		if (IS_ERR(service)) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
+					    "failed adding pdr lookup for charger_pd\n");
+			goto out_release_aux_devices;
+		}
 	}
 
 	mutex_lock(&__pmic_glink_lock);
@@ -345,13 +351,13 @@ static int pmic_glink_probe(struct platform_device *pdev)
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
@@ -365,23 +371,35 @@ static void pmic_glink_remove(struct platform_device *pdev)
 
 	pdr_handle_release(pg->pdr);
 
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
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
+	.charger_pdr_service_name = "tms/servreg",
+	.charger_pdr_service_path = "msm/adsp/charger_pd",
+};
+
+static const struct pmic_glink_data pmic_glink_kaanapali_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI),
+};
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
+	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_kaanapali_data },
+	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_kaanapali_data },
+	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
-- 
2.34.1


