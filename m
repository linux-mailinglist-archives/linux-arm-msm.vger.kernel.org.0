Return-Path: <linux-arm-msm+bounces-54606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A6A9139C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 08:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17B3944521A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 06:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64861F55FA;
	Thu, 17 Apr 2025 06:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJM3GWka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407831F12F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870377; cv=none; b=WDb46oIqfbTyhurNihUCvbW8YwCKWZDGTpB3Tdlv4b5/362pdI3wlZ9k1xWp/Y3FY0Rmb6tgwH5wD9f0czp4ZD0DI3PfVPpSVrpD8rMXEVk/W3Vqo6sBjbxh47VtYNlqrzSPjN96K17p4yPfGlvKte1I26peRZxBL+ht2Ohvwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870377; c=relaxed/simple;
	bh=K6JlKN4Lehfeo7/IgjBbBJZ4i/sDc76rVOVUFC0wEk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QgPzMWx4rEB6sNRGjI1lAOeTE/4OZzvbrSUgHz+c8UiImSxzLPAYkhsEdnYJBdQREl2axPK9wtOilclwvZs/NvzN3Wb2lWmnWOSAVoni7UNO7RwWQun6lg9ddftNyWhzlgV1plcgU14Rw14ekClCR9az9qvQfjVct8s8DuzLlk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJM3GWka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lcWZ022725
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cVdY2Xlz5w/
	QgZdOw7KOmCcBvgh9bp3qa2yY8aPT/pI=; b=UJM3GWkaYEARHv0xaoxXXbWUvTD
	wQZ6uuKwzPUtznjna4oqc3tZoTaW6EW4KpfAgTZ2DT9/mAhXwixM5UATVP+pjutd
	REZny30L5JKd/ot3DO1+2y5d+bw7ercoQ/P7k1Wv6d4Jt0ShcQHSseIum6mg9ZXX
	vTy35Q6dIdEj9QfCw50gkpQAcLI/Jksw8daXPKMuwt9Ow9GmozcURjyMDS7oXp5E
	5Z++59xG7DzED+0V+ylCWZDAHNu5MAuhxcwJwKFFQUEe9dEkm1MfQ0VFB9eLD8gQ
	cr7hap9QMdvhyfHUgFGSUQWnLY1E359u6vIn4xEJGKCJKQJ6KPoM0t0Zp/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpwnc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:12:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-224191d9228so6664045ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870374; x=1745475174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVdY2Xlz5w/QgZdOw7KOmCcBvgh9bp3qa2yY8aPT/pI=;
        b=wR7MeD1h/gmXwWNiIltTjY5l2aGmL7znRUsIbOQNTaipUPlq4iE95A2oaY6VSoSzKq
         j/6rUyQSuzGrL7LUB34uARhkYI1eX8w3hIyHm/vmOV/ekwM+gGOSgkbdneqPDHv/IhIU
         bLY+8+vbfmORI6d0+/t0WR7XUKP3/tu+U0wk4yWkPdpOdVFtv5BHJiI/dUfJ5FM8pTcU
         HsL2YUl4M+eMaP9QASHKKqtE1WwPLwZBJOX7NjXyvSpo4i/2b05FcGbB+9qC1ZALzxj5
         TdeGAA/zEer2YDLcc+wJFqUdRIypwvvw7lCGvHl1rqM4ubA/yhcBrnI78Qg8ZGDvY1cu
         oxpg==
X-Forwarded-Encrypted: i=1; AJvYcCUDnB1F/mQp6um5sy5UqnKEID87cH85MHlg84KIApQqmC9pFiQZY8wIfcHrxkOe0ZvjArcMHb6PeJveomhi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+u1ZJ2Oju1midPPBfocXElKAUqMFSkHD/RRiuQVYBmMrqc7/
	BEK57H+FCnGWU5d59VC8I+XUcM4p/q9cKI/JbK3Y6IOh76PmoUOPq6TPnOtGdmzDSvRYPpzx4/P
	+urp348fJKkBArHyBJvSZ7q5KyhSAxuGyiQfKXyAAxmvn8+tR6JutjzMZbo9SBiz+
X-Gm-Gg: ASbGncvs1z/CjMBL+kgF8nAdgjxwiVjCQ6z41zw9R063nX09G7cfbM4Bp2DNqlpHqZf
	dcE9tRquAeKIqVfDiiQb14amOt7A1+wENSeoSL9jEBT0WgT6t+bXwVeakQV1PaNH/LRabs/BiOO
	Uc2qnWWnNwrT8LkBJTGjuD5oh3I6n0wkx46zrWgtX9If326eiMpWZqgqglQ6jSfwnT5ZmBFkY/0
	/peU61GUit6Z8NccgJtMUIgdHZBVPatW4eZHdJztmc1c7Me5Fhbxud7wWssVYWr0Vlpabu9hWT+
	W5FlvZGfmsUDuD6bms/t5SywCzcDc/NrcwiqBwIkg5icE0BrqTzDC0eVq8olcbvjHHxDhbQ7K8x
	PTFip2VAgA0ZSVnBioKUaf5tt1x7zmbqa6/Q=
X-Received: by 2002:a17:903:1ca:b0:224:584:6f05 with SMTP id d9443c01a7336-22c359742d1mr71015435ad.41.1744870374436;
        Wed, 16 Apr 2025 23:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPhQFbsgVqQATdvECdaf4CnkQYmYXwZ5Oi7KEqji3xtIABf4UA/Dkum/8ctsbZxFsAROasGQ==
X-Received: by 2002:a17:903:1ca:b0:224:584:6f05 with SMTP id d9443c01a7336-22c359742d1mr71015165ad.41.1744870374115;
        Wed, 16 Apr 2025 23:12:54 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm25159725ad.191.2025.04.16.23.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:12:53 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V5 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Thu, 17 Apr 2025 11:42:40 +0530
Message-Id: <20250417061245.497803-2-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 75vC1ggIF0v8VgvxoaoiE_RvrE8a9CJk
X-Proofpoint-GUID: 75vC1ggIF0v8VgvxoaoiE_RvrE8a9CJk
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68009be7 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
changes since v3:
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c

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


