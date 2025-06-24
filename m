Return-Path: <linux-arm-msm+bounces-62133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9EAE59AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 04:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B941B68196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 02:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B70246326;
	Tue, 24 Jun 2025 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rnr5ft7I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79D42192F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731261; cv=none; b=L0wEM5vuVUATERO3Aa17ZDG1/Jx6fQuH+OaWXCGwuHQ37JCtBn6ch/IbExE7TbbszbexbKJdJZHVqAMk5GFXZA57DTyOm6u4auXNgHC+o4eRTTVB454kBc5dECwbO30FgBQ8KyVG0YOm842Lr7Wcw9Ax0J0UdqaHrrgYg3CVatk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731261; c=relaxed/simple;
	bh=/NIXeaLJW7ceni+zMV2gP7uWevC/GndSzaHOxcNpLVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tULckPQPFsj5yY/25yOuQ25cahjWJ8Ng7aOzwOD5oonhmRVr5AUJs53Z0YQpkgQSv13qQDao2w699Ke0qfJN90xMCLMtpdfyfLQm1JSzKwK9ru0qvOdALxZBcRveyZAg+sDUYPcpxDZI0ncKPxWvjGZWgPm9kkDkU4XKGYwJV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rnr5ft7I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHf3cx026920
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSsmFRYtKsy8tt0rPP75MYEWkXOKJnB/cMl7H48cmto=; b=Rnr5ft7IFX0ovfPY
	s3511GrfBjxXoVRYpTCCC70sOz7k3eNN31iMx9MVVZVw0VdQkYmfrVY5pJ5wrLkr
	D0CRx9pBsJU8ESC6TYN8sFayB2q5+9TSPZiJZpDp0+/f2jVHU2rXvvk2m9DctmNH
	egBkxVUsK+9o5zrJnFM1oCJVDjuXUQXAlL0Ab/VYQvvWHFVfp1ES5zoxhPbdQzhf
	R6z/95Lk6MgdB/qXRUQIjd0GS+v8imIxDBwVHYD+PhkFqTMzXP+xnjLooN7TYWxU
	ajKNmDpD2hUqCj8OqC7Jy4vdi/xLn0d8IOEVdGNlIxJ75p2+U7ZRqngpjNj9x0tk
	p0OCxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqgy57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f71813so695297785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 19:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731257; x=1751336057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSsmFRYtKsy8tt0rPP75MYEWkXOKJnB/cMl7H48cmto=;
        b=wWcgSm4PHM1/c4Dt7oyavTHOD8OivqR75J1uVGmsOtGD6LgRDrDfiR5GjhUDNL6D89
         RKkTCJLOIGaPgHG0VfJ+Pj1WmQV6y0wzVRQqHqvpbTGiXSSY9hVvnccRig4DjSy9Qbz2
         fLw4PwhhVbdshyGZZFI2in8Cs/fM02qzKX4cNBXOGTxO7KThCmbTyOzlobx+6nGOMrt5
         idBsSORQF5W5B2oXBSQ+TJJfe/QlQFCNnzuNqP9FHm74B/xsM7AmiBOmA7GcWomVAuVC
         LNUh3FLwo6FDu9hkwtOWfu3Yd4DYDm09vgf/BolIMu/sBSJU2fWEVvN6K0jzCY3TAibG
         nLNA==
X-Forwarded-Encrypted: i=1; AJvYcCWV2Dzj1jKO3JtEi3J6OGExLsmnqM+k8kD9QPuAaWihBtqG65Xw4zzNkmJQv4VZl9qK5XrXZOmVGZ6xyuhy@vger.kernel.org
X-Gm-Message-State: AOJu0YxAja4GsIxUEljNiRr/8kQIgH2qC55G2eqIpnYRqZrN3LWIPChg
	PTrQ8lmD3ODx/fwJq8hSoEgg2hvrTY64RmFLOWWYQ+EWXBV0UUb3LVlPOCxrO05VkSfRiz/+0gd
	toxjfa6IhGzj3CANFPtfZsxXiW/xGVFRGjEQjGakDUp3DMOJ8N4axiSbHJirUOVESfDjx
X-Gm-Gg: ASbGncuOnyFD/cuWoOn3H0nYShK17iXqMpxTFrKTqeHpM7do4rnuOuDOqr20bLDHvs2
	OnpuhlpoLRiKg2OP5XSZViiw7Zs3mbnrv4PgtmNmUskfxmG1KQlCxEjoRSq6D9UKYUCMaWKKeN1
	m77PHh3yUt0+iQDTzYMZqFkiM0o+KKkoeykivqmSg1kl4PrjvWyJQjNMKYqCh3KLM9ukgBHuJQY
	PcMDoE26jD6Gj/dLeEh98vmZ6/MKrCDPZ8Q/sAJli7YhnzYNGrKdRU/WjMkQQJc97ORfNKLTAim
	gWEPsvV2ffLsV1pDCqsdQeWSI1B873Ss50C2kvZlYimCm0T0ZXo8o9WyqF5cAIV0KKQFfbjkD/a
	vsXbeyfHa7F4o695f8WniomRju60/58YvRnA=
X-Received: by 2002:a05:620a:3184:b0:7d3:9108:2f5e with SMTP id af79cd13be357-7d3f9955eb1mr2175622385a.58.1750731256679;
        Mon, 23 Jun 2025 19:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEvPGKzqq/ERq9Ab3y+s9Q0WOIWW1WDVFqtOrmONNECLpS3Se/wffNwM0S269x7P5cnh7UfQ==
X-Received: by 2002:a05:620a:3184:b0:7d3:9108:2f5e with SMTP id af79cd13be357-7d3f9955eb1mr2175619385a.58.1750731256204;
        Mon, 23 Jun 2025 19:14:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:14:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 05:13:58 +0300
Subject: [PATCH v3 7/8] firmware: qcom: scm: rework QSEECOM allowlist
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-more-qseecom-v3-7-95205cd88cc2@oss.qualcomm.com>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4862;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WYHsAMervqm5DoLC3yRi7Ntut5budPkixZWiTgVfZ9k=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0YU57OPQU7Lk6fcrjl0ptDxvHvjFHeeN1GHLPQz0sQ3S
 n/m/MbWyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJREqw/y8r9urNq1K89bSr
 kmv79YKERREzp3846ag1399uceyOqJNXtrJuq+xoPNuzqHPND2ON/uV5jknuvWqzY4PW6DNpF6+
 We+Te1ygSVrbgiZ/RIzne0ju7pL7wtXdr/M/ct9bBsVXS4cqH8gALJ6WJLvI6pfsc2Z0Vj6ouX3
 Bza/Deq6uL7FKMF20VemOxe7mT8estqZKvHCTVp626dt+lgU3F4IHhF9XM5+ximZ2yyc833VJUY
 N4nphLzM7gzL+lv+umIuz8nSsQUlXCWrDjPefRXu9EZpz0Xrxl2zOZbf7hpX1iefaX617JVyxW/
 Ov4tiQlkC4uPkjf9s1FwYTl3VZpaebatxN75JyNEGBQA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: H-wELO7L_vilxjhFwHtiD4CF9HUyz7Kp
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a09f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-DwM1zgTEUuOfulMvEAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: H-wELO7L_vilxjhFwHtiD4CF9HUyz7Kp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNyBTYWx0ZWRfX7PYR6xjvr6Mt
 oHW8JAtX/hQuROpB+/djVAGdsZ2CcZj/GszaniNYC3pKlGHFybl9aKnwiiDmSWonYNTUEQY0eQT
 Db0LowmQG1WyIz2g/SdE9Hb+13qktJQDxt+z+ABa4vtd7wP1SCpYdGa62057iDlCDs+Lgj/oEwg
 atHauYzJ+nqk8ab2oETXoYbCz1iQix1UUfqFX672cFOG1Ab0Z1V1pPahPJJShz4DFYB77eDvJt5
 boWrXanY65TxLBE4Bc4YCA3tYvrwQBmpebjPPYA7TGm6nWjLSjDjRs7oj6k56dFgDqUxyf0/3Sr
 H0NeUwcaAfMCkpdSyxyidZFZFsM5vsg205epINp6dNtgHdryNNl6RQGaMkZm3UeBx/Ozm9Dcijq
 E20IHBMoZWLadjYEDJV4JNn8Q/KPCjCvbWySOOwXpW9UJaL96eNqAk2FmS7pUe00HzqxN/gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240017

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Listing individual machines in qcom_scm_qseecom_allowlist doesn't scale.
Allow it to function as allow and disallow list at the same time by the
means of the match->data and list the SoC families instead of devices.

In case a particular device has buggy or incompatible firmware user
still can disable QSEECOM by specifying qcom_scm.qseecom=off kernel
param and (in the longer term) adding machine-specific entry to the
qcom_scm_qseecom_allowlist table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c           | 49 ++++++++++++++----------------
 include/linux/firmware/qcom/qcom_qseecom.h |  1 +
 2 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 5bf59eba2a863ba16e59df7fa2de1c50b0a218d0..49dcb30311f9c5eae697317ec6f32ac73d81314a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1981,6 +1981,7 @@ int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 
+static unsigned long qcom_qseecom_disable = QCOM_QSEECOM_QUIRK_DISABLE;
 static unsigned long qcom_qseecom_ro_uefi = QCOM_QSEECOM_QUIRK_RO_UEFIVARS;
 
 static char *qseecom = "auto";
@@ -1989,32 +1990,20 @@ module_param(qseecom, charp, 0);
 
 /*
  * We do not yet support re-entrant calls via the qseecom interface. To prevent
- * any potential issues with this, only allow validated machines for now. Users
+ * any potential issues with this, only allow validated platforms for now. Users
  * still can manually enable or disable it via the qcom_scm.qseecom modparam.
+ *
+ * To disable QSEECOM for a particular machine, add compatible entry and set
+ * data to (void *)false.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
-	{ .compatible = "asus,vivobook-s15" },
-	{ .compatible = "asus,zenbook-a14-ux3407qa" },
-	{ .compatible = "asus,zenbook-a14-ux3407ra" },
-	{ .compatible = "dell,xps13-9345" },
-	{ .compatible = "hp,elitebook-ultra-g1q" },
-	{ .compatible = "hp,omnibook-x14" },
-	{ .compatible = "huawei,gaokun3" },
-	{ .compatible = "lenovo,flex-5g" },
-	{ .compatible = "lenovo,thinkpad-t14s" },
-	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-c630", .data = &qcom_qseecom_ro_uefi, },
-	{ .compatible = "lenovo,yoga-slim7x" },
-	{ .compatible = "microsoft,arcata", },
-	{ .compatible = "microsoft,blackrock" },
-	{ .compatible = "microsoft,romulus13", },
-	{ .compatible = "microsoft,romulus15", },
-	{ .compatible = "qcom,sc8180x-primus" },
+	{ .compatible = "qcom,sc8180x", },
+	{ .compatible = "qcom,sc8280xp", },
 	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
-	{ .compatible = "qcom,x1e001de-devkit" },
-	{ .compatible = "qcom,x1e80100-crd" },
-	{ .compatible = "qcom,x1e80100-qcp" },
-	{ .compatible = "qcom,x1p42100-crd" },
+	{ .compatible = "qcom,sdm845", .data = &qcom_qseecom_disable, },
+	{ .compatible = "qcom,x1e80100", },
+	{ .compatible = "qcom,x1p42100", },
 	{ }
 };
 
@@ -2046,12 +2035,22 @@ static bool qcom_scm_qseecom_machine_is_allowed(struct device *scm_dev,
 	match = of_match_node(qcom_scm_qseecom_allowlist, np);
 	of_node_put(np);
 
-	if (match && match->data)
+	if (!match) {
+		dev_info(scm_dev, "qseecom: untested machine, skipping\n");
+		return false;
+	}
+
+	if (match->data)
 		*quirks = *(unsigned long *)(match->data);
 	else
 		*quirks = 0;
 
-	return match;
+	if (*quirks & QCOM_QSEECOM_QUIRK_DISABLE) {
+		dev_info(scm_dev, "qseecom: disabled by the quirk\n");
+		return false;
+	}
+
+	return true;
 }
 
 static void qcom_scm_qseecom_free(void *data)
@@ -2086,10 +2085,8 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 	dev_info(scm->dev, "qseecom: found qseecom with version 0x%x\n", version);
 
-	if (!qcom_scm_qseecom_machine_is_allowed(scm->dev, &quirks)) {
-		dev_info(scm->dev, "qseecom: untested machine, skipping\n");
+	if (!qcom_scm_qseecom_machine_is_allowed(scm->dev, &quirks))
 		return 0;
-	}
 
 	/*
 	 * Set up QSEECOM interface device. All application clients will be
diff --git a/include/linux/firmware/qcom/qcom_qseecom.h b/include/linux/firmware/qcom/qcom_qseecom.h
index 8d6d660e854fdb0fabbef10ab5ee6ff23ad79826..d48044ece20cc9ebac3357a642dc671c349d4343 100644
--- a/include/linux/firmware/qcom/qcom_qseecom.h
+++ b/include/linux/firmware/qcom/qcom_qseecom.h
@@ -52,5 +52,6 @@ static inline int qcom_qseecom_app_send(struct qseecom_client *client,
 }
 
 #define QCOM_QSEECOM_QUIRK_RO_UEFIVARS		BIT(0)
+#define QCOM_QSEECOM_QUIRK_DISABLE		BIT(1)
 
 #endif /* __QCOM_QSEECOM_H */

-- 
2.39.5


