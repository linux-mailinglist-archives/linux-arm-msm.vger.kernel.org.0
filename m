Return-Path: <linux-arm-msm+bounces-53088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71990A7A251
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 465933B0C3F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AFF24C084;
	Thu,  3 Apr 2025 12:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpD+pbcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5A24C060
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681798; cv=none; b=WZFksAPfkLAvFP/OovetfBNfNsR4BOxphHTtFiUg7L9M5OgCw4zG9cgmLJWwgu67vyHcfinzAC+0d9by+pQTTD2yHXkWx0HuQSkUYgOJUIq+XygWZwJ9bfEJ9x7sjGE37l4/bYMfQjW6U/0ECR44/BiPXatrdt/kFcMfhaWNSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681798; c=relaxed/simple;
	bh=5aSR/CkARF1THdVGvZaG6mXoEeoBr2YVhlX0SEWDiqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNwwS8OtRi0fV+95tp8LZ1kcQXIsmItQ/aD2YbyPxu9AA6hqpS7g/latZxHK6ocJ2S37ZexKNEOpbwSIBOsWRrBbEt/tGT8SlLnO73/udpNv2RVx9IblUQv3KHRhRqZLLUALwM2JLUuQc3PJIJhOFvhQFhfh8zaXQRdUfUjGe9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpD+pbcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339rug4021440
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 12:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U+WKP7GXR0a
	OUH6+HVcnhGI+Y7EGQYA2UqybjHwM+Ak=; b=BpD+pbcR89ogME92fnE2IKcrAfi
	4CSMO5jeEnT8hLnlPfVDwKeVTW3WArt7H3O1q0rQFVvbEpMIqp3P/B3jg823pB0M
	T0+NhKwyckFmKJLwNnz/ogose5NB56mOeMU72F2cHwJ3JGX4ba4TyqZp2/Pz83vI
	BByP+wNifMbZzS14oatxgqk/uWmcaQWg7Xzc1ip5iN12jdSx0+Cpc2f0RfLKV+RG
	aXCQWtREGBYInYqDuJqwUbc9D4gsCA/Psa872Hkbgp5Eeo+Lw/fKF+ztFl3+bVTn
	+v3owD83ElNfPjD/JZfJJ8t6HCFZ+UfBHzjBSRnowPx+NGQz8nuEIDUN1NA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sbxy20su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 12:03:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so566029a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 05:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681795; x=1744286595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+WKP7GXR0aOUH6+HVcnhGI+Y7EGQYA2UqybjHwM+Ak=;
        b=ZQJz/5Ub18ZLNe36lFRRDBSgRpPtyu+8PRqloi1jMBpsTlv9ZwGSO6hbQpnxBIsb9j
         jxnNDAqTH/Ziu9FMQ0LnCjvckl2oc/fBwSUa/AfogNqdvi4lQNkFYofRebVTTNic9Uyp
         L6JmFsVWTRBljjZTHUTaI9JMYzXPLZ9u31P/iByxRBIWr/dfNjCEm9RUZ7qiI3K0fQU/
         Xsp0WsKSib5+y0hXBHB+xmNSsbK3gt05LgNEuOfdPnKcg//KVm1rShQfB83udCvqF69l
         k69P7LB9H9CQ/41WM7bvw30noXyAdr644nNQvGFRk9Td4m0dgdAHz0G68d2DjHHwTRIa
         U3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqg3gtz57RfJfBk9PTh7zT7o5v+xuWzQj15dPRTQ1Gc0Ffi+IrRwRMBbn6Rr2DM5MIVKecD3+HHoXJY1q/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtl8IbQKamCxx8jFVlyFEZgIPRXyf3c4HGtWCsyK3cvi3+jNn9
	kVBm436VziCChYNmwncBFTesfDaa4RJJaMedcU0ocd2CvRbWfrXZRAQxnnDtTawrvxfbQ9u8wGo
	WtoH6UyNT0yCSQ8ByS+yg+NZRLzgsa1xXCdrTj67j4iHSaz5qCat3Yhs54fmk0Tke
X-Gm-Gg: ASbGncsTpZvfrybjGcbbe+6DwcmamKVW4/XzVKzdHBECKmS6BxRTA6C2eshGcC53ODK
	1WO3u0lTVLMzoXR/U5lozMEmI4r8SRbZGhwGHaL/3cgQs2oOVVxt5/rDEjWixjxguEtolyOeCfO
	l74ncNdhhi32a1UylmgG4Zfwszo3OGo93BIPG3Lw/GbpLNms4HBYmh5IZKx6AmbZ+YO6F2wt6Ou
	oXN5avTKbKYLOhjHqqB426BpSFZpj2CdqxMWK/ZBcyy1My8raYgo5am7rgebe5nodPwQ9AQ5Lh8
	6IQcJXRklMmA8uGgf3KKwFHSjqI84xHB2sMwo608QZn6VL7HphIseBhfmUoqJa6E6RRT2XJKgH3
	qIMaUZ3O7QYpsHIUs4B0qt4vFbuSDJ7YjeCrykh4=
X-Received: by 2002:a17:90b:514b:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-3057cbcf175mr3235091a91.3.1743681795023;
        Thu, 03 Apr 2025 05:03:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdjpRIr24Az8IqwRnHaYfyOlaCRKC5oMnaVnty2pYG6QVQETBLwG6G0beE9NGRt9WSPJj7rA==
X-Received: by 2002:a17:90b:514b:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-3057cbcf175mr3235045a91.3.1743681794649;
        Thu, 03 Apr 2025 05:03:14 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:14 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 1/8] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Thu,  3 Apr 2025 17:32:57 +0530
Message-Id: <20250403120304.2345677-2-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Soyey6u6vukXm1LsUfpW-qTe022cujI3
X-Proofpoint-ORIG-GUID: Soyey6u6vukXm1LsUfpW-qTe022cujI3
X-Authority-Analysis: v=2.4 cv=PNAP+eqC c=1 sm=1 tr=0 ts=67ee7903 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030049

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..456e4de538b2 100644
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
index 097369d38b84..0f40e5828a67 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -96,6 +96,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 
 #define QCOM_SCM_SVC_PIL		0x02
 #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
 #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
-- 
2.34.1


