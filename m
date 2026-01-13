Return-Path: <linux-arm-msm+bounces-88720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C14D1797F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C528F3068BC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71178308F07;
	Tue, 13 Jan 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNPd4v69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyLSD3tM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA038756D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296046; cv=none; b=UvtkuAbq6194MkCsrnIpni3kExI667mmuMelO+PXIVpBp0Fiw4EZv2KcT6r1oIm9Epp7qkl+/wNkpV+imYM68Irv+LhTBokhOmMUzb3D2HbjiylXPSnZvFyi1Yos8VlcukCa55fz2TPw+Ga5zhxL3VYhbInN54Bk+qSAN4VmgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296046; c=relaxed/simple;
	bh=cN7BDHfjPmZXLVddZ+TKRBf+/XOJmbxfkY4V1X7n8bw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j7ZXEueOtMvBX6NNFktNsywB46rkD8eORSQ138HWjr3MNf1fNpP8xziUuITX94h65YWKuCD/JtGnp45TjyCyFg//xYg89mDiTk1gYiHZICBQ38A3ht5XmCopHYohFtCOrjJDGbM8DQUlB97qgwD39gOIRO68FTfo91O2jg0dpns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNPd4v69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyLSD3tM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5naQu3735206
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ql+pl8KOPe7
	yPuMFFW/Jv1V/1/No2AKB0sEtQ8Virkk=; b=RNPd4v69VFvo9x9olYpXXvcRHjB
	POI6HpO9d0HgHblmpZzjQsfW7gmR+7fw6X7Tq9tXiX0gcNQPyYq9SW6ujhFXVdJ/
	QC7Q3AbI4+JkDt3y2tpDSh29F7RFFV+rzRqHGgMfPGLxe/OhPaBvcaMqAWJwlE0T
	qIZUUb50eCGnhqc24TXjzI6vzhWKGKKHuGIa0KGE7ou7WUUBXOmBTqcr9WDz8XDG
	ZpwVr9GX0TP21oWg5KpDZ97K8mH/ysIl9y1awTNulsmFJli4SfadNtkmSg+xQJwP
	e6NPTXPRNsUUlSxr+cCE20zrh2x8YxnzJukYI6IHOdAGYIvmPq5nSi6F9WQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng878kx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f47c0e60so37520165ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296032; x=1768900832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ql+pl8KOPe7yPuMFFW/Jv1V/1/No2AKB0sEtQ8Virkk=;
        b=PyLSD3tM2+slhWOfvh/sou1cvu8KTbVZllFCZt1uzjxnu1uMDB6ZlcG3Hhxun7GCCA
         N4Vn+EUFUAhSkO0p9+j8Hk36IiNf0dphv7OcbURrQQtN0mbhMHiHWY7tl6Z7kK4y14Dj
         7WrIVy91LEMJYUuauIV42iHD6SpemhujU4N/KA/oyrrSkB7RMcpZtNKCMWqXrF5K9QvQ
         dR7IndP43cCXkjH/997mZrmkeAyRVHqDnoFjEmY/t5QC1WEcWGtn9ZqMVwHL2FvNwZcj
         vHl6QGa/GbNvMGtGA2+Xj5s9DdxRy3OBepZpyYBC37RyFOCcoI6WXXN9JwVpYhfGwD4L
         TRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296032; x=1768900832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ql+pl8KOPe7yPuMFFW/Jv1V/1/No2AKB0sEtQ8Virkk=;
        b=A8VJPCBdTmEOOtqVRVwfm6wwd1FQR4BLWkO82TOcYibYF4k55temTWikAYIqd+b4fT
         8TlFhSDsg9FXUHXI7W0LV+QltOlQM9WcHTIA23Oq4UlR9EjXO6og+bDLdMcntIYoEZMb
         7n8mYRPW3T4KDVLul0GZgz2BwlF+I787y/vNr6fPdRTjb54+2GlpJzHEunFNOKOwv4oT
         DgU3+OAyf2mLxcOMx583I7yQ/XZe3q9Djm53m0BuUTWd/4jTCFy3K/LU8AgW6935ysQk
         Oh18chfujzfJhesDjfeTex77BIwffwokpvxTCTFtZ/eNZ95dRot9QtYJeDJ9kCurs8GC
         Rvog==
X-Forwarded-Encrypted: i=1; AJvYcCVrfcfAKVPWa/2CTzeZYbeUWEWjT5ybvie5kN/36+hhUDGO7ny59w5z2keflTLJQfjS1zR0hPuwPgqq0I5r@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLh4y6tWUFgZe+kcNsqltZ3sGNC3NCGs1I/9wSmlPYnvDzaE5
	znzzc6G3loVJMoNFJtqgfBuRwRBJrjG0fG8lK+rMh8t71HqpKtTEZgpayHDOWVjJ2jWbBZ1VczR
	+Xf1RNIrIkcvzndUrNqpiVrd6Vt6HGs5kaeLStKeV8rQDF7krzLiT/OCj37Wd5q7C9alx
X-Gm-Gg: AY/fxX6LoQPmsu+M0xgCcQRO+2ZcuUtZlXFimx6A2Zz1dfqpBa366uFe3RkLPeYzJh8
	Bwrmy3fOLksGZOCXqcgn1wgs4mroSkYaRRGab1y5w5np4QiDRjaRlHtsp0XQAcqQ/gyY+XmDd1A
	6UFnwD5ruaeqpvcEDYdPOAnxXJGE4jSTVA4TeuBOYDH0DSC+OqaoL9nO2Jxl6+soJfT8GmBiSIE
	7dzKk5ouTJbdQQK30miKb7TCs/ON/KnoQB+ioJ4nQZsdcelHQfqyL1yteZ/WsGBmkdvjxKTX8LG
	mQJkcbjrE1HE7LOQjHGTb92h5MKSq4Rnltve7Fvv/eWvhDWc7GEL76KIxHPsPxzpGkIKN0Mgj5A
	yUQ5nBNbhLQIIDQ0DcklXCDmTTM+P56SGc8h6AnLsgij3jDp70lsGqEeIw8YXNhOiYe9rPUf5xQ
	1DdA6x7lllJgGL5QQK9eFPo+HpDKXlXuLTGEUyj6Y=
X-Received: by 2002:a17:903:1b43:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a3ee49c701mr226369815ad.44.1768296032293;
        Tue, 13 Jan 2026 01:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDcc+uF1WMgTDehKIFxDTK4sH15EoiABMl0DNiGHXTm/Ary3ynF0++tW19QbaX4WtGuYiiPQ==
X-Received: by 2002:a17:903:1b43:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a3ee49c701mr226369625ad.44.1768296031846;
        Tue, 13 Jan 2026 01:20:31 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:31 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v10 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Tue, 13 Jan 2026 14:50:16 +0530
Message-Id: <20260113092021.1887980-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX0UGhmHvwi5IW
 jpkF7Q7tXmpDJIqIwZy+n0jFk0m4pD5bDhsWhjCHdWo7KEGeBzVq2kC8mf7qiJCGyi0Aoh6SXjV
 LbWU+uI0j29P1685KGx2BQ3jUoP0glvijAPyZvha3FR+mzYJrQiD7+TjHya8Jm6hIVido4B9/uG
 hOGHfux4uNSXF/HhSnms7MVtw8M9R97f+A4QkorGqmdf0ghpFVEAVwHPVplf4jA1yNHVFMuqZg+
 rVEUylF6VIElNh0RQrjb5WXxqhbMyj3WgwxYacS4GTA9oWreDBQan5QiKhES59I/e6fzXXVMjaY
 U1PSdj5ZCLsKXRCwZ07CHBH5fvE8bLSn4BSHgByjLAG/eGAcKEtGT87hxKsyLztYsAFDmh/bRzV
 +Jfmp7fYNZgvBIeN0ko7M57lcg+g8VH5QrUW05OLbZWAt8IkEzFRZl1WHSozJmdVBoHSnhi8XnF
 5rJjRnI+oJQxH2DVFvA==
X-Proofpoint-ORIG-GUID: qqL0K-Y-QXpCGIexrTLBQx6V4qiWxs7O
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69660e61 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qqL0K-Y-QXpCGIexrTLBQx6V4qiWxs7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130078

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v10: Added r-b Dmitry tag
v9: Added signed-off-by tag
---
 drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e0..c970157f75b5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	if (ret)
 		goto disable_clk;
 
-	desc.args[1] = mdata_phys;
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+		desc.args[2] = size;
+	} else {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
+		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+	}
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c..57d63e932f62 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 
 #define QCOM_SCM_SVC_IO			0x05
 #define QCOM_SCM_IO_READ		0x01
-- 
2.34.1


