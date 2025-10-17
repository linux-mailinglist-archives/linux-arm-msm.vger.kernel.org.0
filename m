Return-Path: <linux-arm-msm+bounces-77659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F9BE5E4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 02:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFC7A5E7CDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 00:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E65722D4DE;
	Fri, 17 Oct 2025 00:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nv/6+oTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5414021FF28
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661044; cv=none; b=OStDTSM/fOSMg90Hq5RTVSnoozt1/u0IqRvHD1ElmEcAVOIFKiq0mSgGWVR4O4W+Y7idePrzbL8M2EwuRLAQ5x6gKPbCuRV9VG/LyxECaho/6yhDRZNpKZ1hRkCY99w36neTmwwNDGD7ixCO92WcmAcEaBOso5TpgwW0Ttcf/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661044; c=relaxed/simple;
	bh=RU9u5+e96IskdKy79odK/nlpmnOUEqJHM5ulM9nXXPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h0aNVT4gMnf5YwBmvmkiHWtCr0CwpOYTOWfgzCJwYeY/+gpomf55KYSN20Ped58eKELBxi91cZEnHsdZmKqPajHTLgCwX9zLIH56jkKB1q+cFtq8882RayPm/CuK3+mErVzrFrvJWQoWUdkkDVm0cTsFXlRZj0F5I+g6F4fvLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nv/6+oTR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLhJL017062
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wpu47feRnS3
	JH7+rgGPW+V0fZ+MEpc12dYMVX48Lock=; b=Nv/6+oTRgyYG17bC+QOCQgSY0Nb
	UGlxpdK+31nkQg++9X0lFLRdmwKmTMbp0neZzKPVX27agiOdlzQk/Znl32qMoays
	qAOJ4TDhcKY8nobZYY3rC+VwUjy05v2/jdAiBgkKCVwmx9fK+OHugio0KBz1nBa0
	ySn4E8Jl5YmwwN6gB4FXUN+pa0X/J9hx8aZjncAY7QmOhuVhUi6Tb8mIbbiPdY5a
	9YTKwcS9BqysRE2O1AaEw+Jy5KPG02Kmdqg1VBVc9BmpXo3VSShYohVdYyv9BfIy
	uJMb14fnJD3Gm7CszzK0hVrZZ//UoX7pwxsnNPcmfrQG1yDrhRn317qKM6A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5tep7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781269a9049so2150002b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 17:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661040; x=1761265840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpu47feRnS3JH7+rgGPW+V0fZ+MEpc12dYMVX48Lock=;
        b=tj7LYA5JjGSK6fbrWbsX0hDhiDpV0YiL31zEx6hbm/MoSo9NGEHm7HGWSlQbbHEN8L
         JifCiMUOO7Kz+VABkJuNQ/VE1R+utiijH2jA1pe8wsLBCx4whzDwL0ePImEHqXwSZ9r1
         0rPsjiQqZKEcULdFOBpmYJAmNTBKZYYmsC2jZsiFrRFNWmEKNx3Jd8sO8nbeWoh+S1kj
         tbzyK7gLVm57/goufsQDSoMwcPGd65s/7UXyz9KFFIlL/8oKpiccnxFnt6ae+ai4LenV
         Z7A+qK9XJdEeddyWOe+n1CEoMinQhvJ6DCXISmz8kpvz8g5xK47PiLediulUkkyGCBSE
         SAAw==
X-Gm-Message-State: AOJu0Yx34eOt6nProiUeDSHofD/ueG73TYkqfiI2XEcDEWkkCOh50s7z
	2a7BONVqbXCzjDmB5zTqoXWw7ueNd/WHQxXiEfNJnRb2Uqcpq2uB0j4+7+4Ge4aVYo/qqqwl143
	IrbB/dl6NE2LkZHk4B1j4dFWyv/tmUyrbigp+ovkagsYw7whkF856yUWcb1DzR0QcPjlRSStu/F
	fN
X-Gm-Gg: ASbGncugLjNl1ZYvxxPqisNnRfcl00EFKWIgAyw2luSeEygDXOcMy8LmEbNO5a920Di
	RsUpGZebJ2fpTzyr13y3gCWiAv6NY7rpy1gWCNySwulmGoLr5FRQDkzP6ZJkIrSexNEUMALz4ga
	qGHQ+RwuTF2H9TuD4G/rSeQV71SDdZ/SRyF8yfim3eJ7pNs6SRia9s4q00NKKmGp9x8nN6si0m0
	lTY2uQvJb0MIMQMjafey3RLkMZOemzq4NJmk6OGLSuGIgTd4eL2NbL+6Ybk3oGos9fRbnsFZjCO
	tY0YFYlcraRWurnekk0A4s1SXcBJrK/tXKdhjreNRCYv0yeTK8lu8yNNqUmheVjJJKay1KZv4hF
	9SqKIRzGazmSRpdQGYP/14oZDkxY2JDud9Q5Q0kdPVS3DekzOxJwd4W9qrrCK5g==
X-Received: by 2002:a05:6a00:1394:b0:781:2177:1c9b with SMTP id d2e1a72fcca58-7a220d232e6mr2450103b3a.17.1760661039526;
        Thu, 16 Oct 2025 17:30:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2YuCrZTacPd+e4WwFad3XNi1Thwu/0jwICzedcCNVrK3jC8KhvIoGcsNp34j49mGFrBpEyQ==
X-Received: by 2002:a05:6a00:1394:b0:781:2177:1c9b with SMTP id d2e1a72fcca58-7a220d232e6mr2450074b3a.17.1760661039073;
        Thu, 16 Oct 2025 17:30:39 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm23613050b3a.40.2025.10.16.17.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 17:30:38 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] soc: qcom: pmic_glink: Add PDR service path and service name to client data
Date: Thu, 16 Oct 2025 17:30:33 -0700
Message-Id: <20251017003033.268567-4-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com>
References: <20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DEapa4m8YpNwBOR5UXJ7fAMcffkPEvpm
X-Proofpoint-ORIG-GUID: DEapa4m8YpNwBOR5UXJ7fAMcffkPEvpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX0LbMld4CVaXI
 tOOPptqx8N7wperix3o+SmsPEPT7SkG9e63+qP4+0xCwN1NYzjd5JRB45uRPSaoWd9EEDM9GSpz
 xNlWBcN66J+PLo5VEEW6XdNe/HVZfhnWoohLKwDdM9MycXmewGn29+gGt7xlGDyIWGZcaHBfxzr
 bOoxAMsrb8KR/LBCHUhql5hLHzhxOsJthuZBqjiLh357KNniNXIaujRJZYpNmFk+de8gkU0C9C+
 7+nccO9GTIup4MwTtBWv9e9kIMRay8k2FtUPXx2ewqCZYMdN1VU67Gy2fFOPFov4owuscqKatHT
 VfjX3ajzuLorBdy1CWhRFL+t6OahImyyUwyUe9Yt8yMNQNErcTmQml0OF1XUKTtLWvKj212ylYS
 BTdsJWUFeany4mbM6lZep3xJQl/niw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f18e31 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=qLYHXgdTuLTpAkILo5MA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Currently, the charger PD service path and service name are hard coded
however these paths are not guaranteed to be the same between PMICs. For
example, on Kaanapali, Charger FW runs on SOCCP(another subsystem) which
does not have any specific charger PDs defined.

Define PDR service path and service name as client data so that each
PMIC generation can properly define these paths.

While at it, add the qcom,kaanapali-pmic-glink compatible string.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 65 ++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 627f96ca322e..f64449de2305 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -23,13 +23,19 @@ enum {
 	PMIC_GLINK_CLIENT_UCSI,
 };
 
+struct pmic_glink_data {
+	unsigned long	client_mask;
+	char		*pdr_service_name;
+	char		*pdr_service_path;
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
+	if (pg->data->pdr_service_name && pg->data->pdr_service_path) {
+		service = pdr_add_lookup(pg->pdr, pg->data->pdr_service_name,
+					 pg->data->pdr_service_path);
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
@@ -372,23 +378,34 @@ static void pmic_glink_remove(struct platform_device *pdev)
 
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
+	.pdr_service_name = "tms/servreg",
+	.pdr_service_path = "msm/adsp/charger_pd",
+};
+
+static const struct pmic_glink_data pmic_glink_kaanapali_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI),
+};
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
+	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_kaanapali_data },
+	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
-- 
2.34.1


