Return-Path: <linux-arm-msm+bounces-61956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C8AE2C1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 22:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93BE4189C0FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 19:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C858270EC1;
	Sat, 21 Jun 2025 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="En2oluqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176BF271452
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535787; cv=none; b=ETpvzEN0GLYp6ktBmXBUSeqs4JprzeVFCSujX3XBKmClwbAHfzJW9dM8o9R7ymHQ+JooE/qio6Lwlkcm+drCamigO2OiNywkdr5VQ0mOroywxi13JL1sCpfUTK2td2yvm7wmcGzspZ9Vb6sO2F1MdT3rbfnqiPPdY8zlkasSIpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535787; c=relaxed/simple;
	bh=wG551jlH0C2VxSckm5aelE4czzDPVSQlL7LK/7YjW04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYWdXuhc+EZAHrbCwBkkrCM56ZzNlPMvWBCEQ5xLWdAVeqZ6OBMi46KUX3y275sfOe2JwH2YQUe9QwxYUKonhxubHjlbfU13sKIJvsmoN0hYIQZgFwXWXCVeumqmbJzFqs9yc2+N07DevFFxRbPpyK62wBiCBaMabESgYXEHam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=En2oluqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LGte2h032603
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvUFSAy9l8jMi9mogfX6vjAbGULsygLy9EYrsovMUQs=; b=En2oluqKJsfi2sBY
	GZDSccJMhBIav2jpxtLIkVUSKFjRkURyBuxzCB+Vy6oBl68MZp4uzMzVqYRz3prV
	PDgoHL7Yy5XLaw/s4Blf10RA4NcQZESWW8cF2e6kZtYA/K5H5gYgudEbAUkScmdp
	q0dhrCnv3zjEQJBrY4ZOg0wG2onRBNzT9wrL52nd1QKMLZVVqv4/UNGukAXOS3M0
	gQSIkvLqYVrXXkZXRcYVOPuHZ49V3cAo/0lvHuFpHQei1lxveAvysPZn0TPp3S+s
	5mS7alz11kowGOx3veyWQq89VD8KGtVnOV1JOySyC1k+YDI5itKR2eMNYbUYNe2A
	WOXgRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpqtrxnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3901ff832so613102985a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 12:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535783; x=1751140583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvUFSAy9l8jMi9mogfX6vjAbGULsygLy9EYrsovMUQs=;
        b=jxfcAr2rzMnPhjMev35KYFgsYlvYtG56YfkoCV0HzfqsvB6fUArdyGfpuRtLn6DcQS
         QVycF+42RFVJxCe0u84gUIUQpBHmRMOq84tj/1g1r+JWb2Sq1tySA8ef/UeNtbwPs/sB
         xBkdXvZpf16be5G1Oiu7oyhlySAx8+41Nz1ETdhTVR82HXopTF8IxEgH3gC322k9OE9v
         /MmRLJQsn0FIsRTd5FQ8mYhNFdxPAnbnJ+JHxeV4HdBflQkUWsUic/6XWmxeSauYkzqq
         1iVzGmxOLCKjTwbov3WipSmJIoYnLWM1EBr7sIyp4kr1vPY4TKIqhFXOHxOhNV0EbkQC
         BMcw==
X-Gm-Message-State: AOJu0YzYdrS2nGzRrboxCGB5yT44sNMGRXm+65VKFjykAXqqG3H+4KO9
	+Q9dcfdydB91IMUJahsLO8Et7h6mx4J5c5vYyYXX38G6OMG0XpMuvGRiPQf/4+reW6ZQt1kaCU6
	vVrfDwo9DAxVycglnHRmlWLwT/nov6DH/X1rmPgnp1dIn07rJ/wmxwxJr9HcF6VEqaOWZ
X-Gm-Gg: ASbGncsUOmb4dU03Xggcs+CyVJlYQORSwLimvZf6lY3KH9FujGqwkFDwH53/hlyr4Vo
	nun4EPO1OJmHgrlZF+gHnN6VXhNdpGk3D1eUf4DTFQKOshMGQjqD4H2oET5T7FIFQs1OQaO5XZu
	B1O0ayBAnItQJLaKtrTgz8EQddDz350tGYAQO0lWivXqWzi30SR/eEUXYwKOlYi9NnIoGiikp1O
	SKnviDTDYO9LLXKqsQ/g1NhD+tFZlfK67iGJG5MbgHNN5NZ8WOFsBh20f5KBwtGwj+cAMIlcHax
	iRGqcjRBTXdHcULDgNAG5tdpkco0KwrB5uhGGpjkISR47JEC74LpYD+PjUzeuFblUHx8lxAYLRn
	he4o7YOAGKGx1gHsIVxLZduz6r1+7adIIC7A=
X-Received: by 2002:a05:620a:838e:b0:7d3:8566:e9ad with SMTP id af79cd13be357-7d3f992984emr990755685a.34.1750535782846;
        Sat, 21 Jun 2025 12:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZsniGGE82LOZjwRAMI5j6W4GAYUxfr852uUROLbuTM1uCFwwQFLWBmWdG0dysN50HDbWWaw==
X-Received: by 2002:a05:620a:838e:b0:7d3:8566:e9ad with SMTP id af79cd13be357-7d3f992984emr990753185a.34.1750535782462;
        Sat, 21 Jun 2025 12:56:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 22:56:11 +0300
Subject: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wG551jlH0C2VxSckm5aelE4czzDPVSQlL7LK/7YjW04=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVw5hrZNIIHb3EMyqf6Z+9AjkHJP7lCsaTgcap
 Gm6t6cOvPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFcOYQAKCRCLPIo+Aiko
 1XBXB/93mfYFN6rPVvIwDX6qQhPHy1n69lh35gdzG33CjTwN7punDuUBy27NLvuPV4/Ypy25qsh
 FLfe95P+RzWveANHcWnf8oCiHq9A82d6Ix1mBnG2rSQl5b6ATcO4ynG01u5v1avnDrsDSyhgQOO
 YbUYFnSgliLIIrotj3kf3C+Jt8CXWHmo8EosHYcikSKJ4um7HtyutNQMaoJvUl0Iwla2eaydr4t
 5ztvfo+WtgKlc4odf2pmILw2b1DIIv8xiEUYXUhbHOU0axvHVuQbzJbfy0kMvhoAMAyqKqDOkx3
 ZrHVoYY7SKsDSBLyxAUti+HoQrKQ0KtSrFrOPiFjIjrv4WS/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNyBTYWx0ZWRfX1XXCh3NsBPX7
 Q6MNQhORasFFfZWQelt1LUKkYEeiPO3xQ7JuZHpUYwXWRGw5PIhQ9BhVgPhG7CZLxODL0yQNRAH
 OJGV/NWPa/HiMahf8BHf/kwLyMrgM0lfBVhqQDT7rQkw3nZmBCOCaMvpCVD0/0gJr2Zv8hVGcP5
 XqYl3ByLx/bWnSr6RIM0XE1f1xLJaOshyTdroiDIdjdWQTmCqEK3+eCj3RfkQ72wy7Bp+RVRhoc
 9N68mtv4cKb0/W3s4rPATaiCxXoku9XcYv1CZhMvzhDsW3l3j+vW5nMFVFiMa+B5OzA7507lQPD
 bi+yaC80zCwgjG9A8gGhgH6k0pIBlZ8i25RjSCgOaBpgfvWqsGo/mLXTsKiCr1j0MgM5jNxs7+B
 P5Lto5EjPR/zb4M+W5i/fQysz1hBCYO2R/60nCsFWFz5JgToLnlvWshK8JMYhKUiVLHF8XXh
X-Proofpoint-ORIG-GUID: XP8Lo_sJRubzA0ScWf1RtR2m2irp3z0V
X-Authority-Analysis: v=2.4 cv=cbPSrmDM c=1 sm=1 tr=0 ts=68570e68 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hoImanld2GFzOgiN87EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XP8Lo_sJRubzA0ScWf1RtR2m2irp3z0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210127

For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
update variables in the permanent storage. However being able to read
the vars is still useful as it allows us to get e.g. RTC offset.

Add a quirk for QSEECOM specifying that UEFI variables for this platform
should be registered in read-only mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++++++++++-
 include/linux/firmware/qcom/qcom_qseecom.h      |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 98a463e9774bf04f2deb0f7fa1318bd0d2edfa49..05f700dcb8cf3189f640237ff0e045564abb8264 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -792,6 +792,12 @@ static efi_status_t qcuefi_query_variable_info(u32 attr, u64 *storage_space, u64
 	return status;
 }
 
+static const struct efivar_operations qcom_efivars_ro_ops = {
+	.get_variable = qcuefi_get_variable,
+	.get_next_variable = qcuefi_get_next_variable,
+	.query_variable_info = qcuefi_query_variable_info,
+};
+
 static const struct efivar_operations qcom_efivar_ops = {
 	.get_variable = qcuefi_get_variable,
 	.set_variable = qcuefi_set_variable,
@@ -804,7 +810,9 @@ static const struct efivar_operations qcom_efivar_ops = {
 static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 				 const struct auxiliary_device_id *aux_dev_id)
 {
+	unsigned long *quirks = aux_dev->dev.platform_data;
 	struct qcom_tzmem_pool_config pool_config;
+	const struct efivar_operations *ops;
 	struct qcuefi_client *qcuefi;
 	int status;
 
@@ -829,7 +837,15 @@ static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 	if (status)
 		return status;
 
-	status = efivars_register(&qcuefi->efivars, &qcom_efivar_ops);
+	if (quirks &&
+	    *quirks & QCOM_QSEECOM_QUIRK_RO_UEFIVARS) {
+		dev_dbg(&aux_dev->dev, "R/O UEFI vars implementation\n");
+		ops = &qcom_efivars_ro_ops;
+	} else {
+		ops = &qcom_efivar_ops;
+	}
+
+	status = efivars_register(&qcuefi->efivars, ops);
 	if (status)
 		qcuefi_set_reference(NULL);
 
diff --git a/include/linux/firmware/qcom/qcom_qseecom.h b/include/linux/firmware/qcom/qcom_qseecom.h
index 3387897bf36843cccd0bd933dd562390bf674b14..8d6d660e854fdb0fabbef10ab5ee6ff23ad79826 100644
--- a/include/linux/firmware/qcom/qcom_qseecom.h
+++ b/include/linux/firmware/qcom/qcom_qseecom.h
@@ -51,4 +51,6 @@ static inline int qcom_qseecom_app_send(struct qseecom_client *client,
 	return qcom_scm_qseecom_app_send(client->app_id, req, req_size, rsp, rsp_size);
 }
 
+#define QCOM_QSEECOM_QUIRK_RO_UEFIVARS		BIT(0)
+
 #endif /* __QCOM_QSEECOM_H */

-- 
2.39.5


