Return-Path: <linux-arm-msm+bounces-89076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB1BD214C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C37A6301265F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EA935EDC6;
	Wed, 14 Jan 2026 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK8k78L7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NE9agfyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6A361DA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425493; cv=none; b=OIImPxA+wppMJC8SDD/M+FgeJ1oY9nKsUk2RZicsLLoD7HAD3da4a1zo7zFA3AB0K+kPNLXpPR3BOx+QkvobqfArP/PM2TVzYVRZ5zvVkbpL/8JBJxc0JQzbvFOK4aBbOlaAcVdXmMcSLJHjEtug9gH24291K7oEDhZ39okRSS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425493; c=relaxed/simple;
	bh=ecY11OcBKXMq1MGLCiWZ0y7+hdHphUxMDqj2qDFYseQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzTtR+0hwTHOAvn/dDPUh7K0uRZBiZGs4Vf9x0Brz9TzjqfP2WmfAA6qm71lF5DPiUiTwcuvhkYUsXsJCLPR8J6PmL02BPwq/ziAIFCFsmZi9pMx4q7vBlDZlQgZ6QAIV/wWNsvKuIOLo+7hOEQG5MPvIEWF/PyIPqh1cwShOOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK8k78L7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NE9agfyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EF45qb1943025
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WdRL0KAbzlU
	oIRwhSbOkMecyH3ewE7SUBGAdWwEOO/k=; b=aK8k78L7yu6GCJ7osxivzv9EbSQ
	9o4pTHhgDpYUfxyWv7VXF60wwJER+xJeQfDZbFQkUANDj0/pQ2h3hJHOVaN05qJ1
	CRuP5Iq70+r8p9hfkvGMCq7eR15MzG1egwjOrc+ZnwKJ3JzBt6G/mkBtq2qLrP+e
	gycBonO0jlwOkg1zYpXbC0polAFk8Xvd/EKKe7Szxzhk2kNfP3Hq0Bs9uQcov1Fk
	qgdsU3inE/bTsX3Q31eu7VrRe7EG/XNjsN/L4hIJISxlL6/3wBqoRaijRCQwfkco
	h3NeHJaRoqK2DoSmy1EUQZJrIr8yrWtubiRhmTNS6szhcDnVqKlMqxAoESg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6tq6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1232dd9a256so1175228c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425486; x=1769030286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdRL0KAbzlUoIRwhSbOkMecyH3ewE7SUBGAdWwEOO/k=;
        b=NE9agfyQQMOWSBWFKOp630wsO4//GsWtKFZGCjC+LX3tICR2Bh+C04ZsIJS8MMZoQ7
         EV+YlhXyXDAlprRLz7l6/BaLXeqgG5BXGdNRk9uU8Jh87uhu4ryvu5uWERZ21EgDh12A
         IXA5uq1wqM4/mA++6wG23R8A0VGVUBtj4UPpKSu7kO81Joc/YKrc6SL1ieP4ZixVoyeH
         y4hNuNBaIIDNER/XPIi1OgEKgIu9THBVk9EHT1ALR8iWXzaEYBTOhO5JRIdiU+uSpD9T
         OsxHBGY/v6EQXYHyCs83KCOv3icRvZhWY2xAshlUoeYGQOobmm35gtcUPJXoDaVI9Hxb
         mDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425486; x=1769030286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WdRL0KAbzlUoIRwhSbOkMecyH3ewE7SUBGAdWwEOO/k=;
        b=nCu6xk7YCX8kEDU2bXuSq/nk7Kt+hAXqHGeH4Bh8HVff5V0YwCkqvbiwlvJhRkTzXo
         9Q2lDDXu1Qc2ZiAWJJ1z40r7bYoDIlw13GlpQlsq/AYdMDbxgYBRDoUM0aiG3gFXLhsq
         0rB0vvwFXs0BI/QOKxi5wD7MQujFvyu6PlqhoAV6OlP0OX/G+S4rZEiMwBixzLJ07ezi
         TTdCKkMh2lTh51JaLHSH8BFnp18/IFvuvIABoqgUQS2H8110fDuKo7RTI2mzE99QKKG1
         f5DumaSVwMNm13ME2xOjaw+XKxB0Y9Fb3TXLCummBuCB24YRdM26o6HEf+0zN4joc24F
         ycUg==
X-Gm-Message-State: AOJu0Yz/wN+pQOsG3y+T6ktxTcLrp79ndNzImePuxb/P54JCAFhGgFLL
	FLBnu6CjguEBt6PmCG5dhlx2d0Ab3XRJjYtrhvCVcfaXTB4uhwmA47o1KSya/ZTGKVZgguEoV0P
	FfEsRKBYVBkPThS5W0yJzZ51vjH5Gf6FbOQytEKFm0ELxjr/yyv88v4bK39Y1RwT5ZFaM
X-Gm-Gg: AY/fxX75I1sXrV86MV6NZ+DRvWXjqO64Ym8eYHXtCCWDEj4NH2Fb3t+JYoWesva0I1i
	ZFRuxOhib+/6SV4FyqKnhCIOQ97JZvF9YmP0KjlcAaS4/4QVVas+MFReI/jgOt8mICrPQzgNJ3I
	S06p0kifRd0/uzP6BfNygbqsIDgfTK9KcAlXZZDOln5OAqu6uz3ZcWz3RdffLgTQLAl8QAdNEbh
	IFjkKTuw14DefumaJXU47iZi5PmKZx+zY9SDdDoumQuYZsw8iIiMBreEph6tDkbBiVo5vyope2e
	Q4Q8GYwDAO80kjsPPD+O7JLsYnvOIrE+Kw2euvtsEolrisPW7Jl7KBU500TcdNS4SGO2D0Rb0uU
	Yt/ZHeZ2Ba33ExfxxLLzX+f0Vczklhp5zzWmd0tZc+ENO1FqLzA+q2t1cIL3zlgA1RBs58QtE
X-Received: by 2002:a05:7022:910:b0:11e:4fc:9b33 with SMTP id a92af1059eb24-1233cfac8c6mr816288c88.1.1768425485889;
        Wed, 14 Jan 2026 13:18:05 -0800 (PST)
X-Received: by 2002:a05:7022:910:b0:11e:4fc:9b33 with SMTP id a92af1059eb24-1233cfac8c6mr816258c88.1.1768425485241;
        Wed, 14 Jan 2026 13:18:05 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:04 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 4/4] soc: qcom: pmic_glink: Add charger PDR service path and service name to client data
Date: Wed, 14 Jan 2026 13:17:59 -0800
Message-Id: <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HEgVlvfLcJDR7fm6rQ0AesDAYm9zDXB7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfX6pwkq/VMkOC5
 S0QHryKhkQFxotaqAqO+ORVXI4qyoaVmTZjQcJDTmNpsrPFUqLiFd6nmZ64/GbpG5OwIWeirhEJ
 d+omRkTofudfYH/QnNqAZn2KQSs6iekK0kGwO4GDI2vP6qK01VCPVNlZMlOUARE+5DDm22HemiU
 pkB/+izRlCIdqo5gI8UEuENInRGZ3uNeMpl/mKn75y6nswPwVXoFu6T3CNVtZLFe7vJUeRV6DZ1
 cJ7Lde6S21w/juSmLh5M12BKNXeFkFd1tx55IZsd/8rkpjHdh04OVAkSK9x47o1rhQzuADRhdaI
 JirQSFrYzZRUuU8O3Y9tszb0Wn4hN4T5FwaLMx6E0S0on3oIqBnonop0eHh6UPAD/pGt/WBTToH
 GbFslzHjti9w0loGztnaphEmpqHRQXTjajZlnF0Z5zlBRZxJIU+CcpfpsbPk0LI67PUrJwDATgU
 kb5cpb6a5TTn5yTeUFg==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6968080f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X7TptQfD4XCScbvf-kcA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: HEgVlvfLcJDR7fm6rQ0AesDAYm9zDXB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140174

Currently, the charger PD service path and service name are hard coded
however these paths are not guaranteed to be the same between SOCs. For
example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
which does not have any specific charger PDs defined.

Define charger PDR service path and service name as client data so that
each PMIC generation can properly define these paths.

While at it, add qcom,kaanapali-pmic-glink and qcom,glymur-pmic-glink
compatible strings.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 627f96ca322e..3042261578aa 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -23,13 +23,19 @@ enum {
 	PMIC_GLINK_CLIENT_UCSI,
 };
 
+struct pmic_glink_data {
+	unsigned long	client_mask;
+	const char	*charger_pdr_service_name;
+	const char	*charger_pdr_service_path;
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
@@ -292,7 +298,6 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
 
 static int pmic_glink_probe(struct platform_device *pdev)
 {
-	const unsigned long *match_data;
 	struct pdr_service *service;
 	struct pmic_glink *pg;
 	int ret;
@@ -309,12 +314,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
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
@@ -322,27 +325,30 @@ static int pmic_glink_probe(struct platform_device *pdev)
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
@@ -352,13 +358,13 @@ static int pmic_glink_probe(struct platform_device *pdev)
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
@@ -372,23 +378,35 @@ static void pmic_glink_remove(struct platform_device *pdev)
 
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
+static const struct pmic_glink_data pmic_glink_adsp_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI),
+	.charger_pdr_service_name = "tms/servreg",
+	.charger_pdr_service_path = "msm/adsp/charger_pd",
+};
+
+static const struct pmic_glink_data pmic_glink_soccp_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI),
+};
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
+	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
+	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },
+	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
-- 
2.34.1


