Return-Path: <linux-arm-msm+bounces-101131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gETZL6sczGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:12:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C3437068E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D632D306B7BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1408B3A5456;
	Tue, 31 Mar 2026 19:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBTw5Ka5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5aZmqZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38F3A4F49
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984355; cv=none; b=esL1RN4Z5EJNN8o3BG3IPc8vU1EfqXbQ2mez6PeRqR99F91KBOFumz0zj2ClI1IsL/HJV5X8QQyGnH20YknNpkFSVwPiZ2BiYve3Kt7msJdV61KQug/ctNi2R8Byh1g1qiSZ1XL3Ama/k6wZTe/wsU+X+snBSNOMF7vL9RBQ9yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984355; c=relaxed/simple;
	bh=KQJqSTR/6zfIqS+06NLh4hO67qHmI3N2AKhVRiFwbM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K41q4CRql8EBuSqjy8Z5f5Pb5vu9s6W+1PObGJskLM646OKb9ySQ9SsjDtFlQeYsp/8lh+izxdBzY3oR/0nsk5OWo0umJdlVLWlRxq53/vfrJck1YURcYMHvzAGyfRw4xwRhNqGGBYIfbHQX4gif9S3afp+EXUcfBx/z/5BUFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBTw5Ka5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5aZmqZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VIF6uG718546
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JogU91I7iT7
	9hZ5xYUAk8hEb43PrGjv9a2H3IOpQI4Q=; b=oBTw5Ka5Auo9X/Lros+yZe2goQW
	+g+94a6Q6IdJHVVllk4PO6WW0+nY+4NDrUD/ZXAmW1DgsuHxRDvqDnd/WddMpLeu
	TdjBcJsjvwhV3H3NHto3R41mHrME6/g+VDIn2c+2OHezR1Qmq0y3dtBMcfRg7YUt
	0b52ubrDaIdRr6GFJSt/tmpyZGIzRTt3s8pQpwFPZcr5b6+t+7+kKa/zoBkHwCsR
	oAMHs4DmVcz4Bn17b937hANFMh4hcp+Geyvb+Ixpi+Ap8Fn6oDPpf4ZLidRgmu0K
	9VerrDGNDxcBwbCpJN+DHCzsck51JQBIfmVoyBFrRXEVmfVCrMs1XoeYSew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsr71p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b23af7d7e8so137431905ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984351; x=1775589151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JogU91I7iT79hZ5xYUAk8hEb43PrGjv9a2H3IOpQI4Q=;
        b=K5aZmqZJqfthueSkTp8Y+ou+l9Eh/HAoGjoz6Kkn+PZWFuq31K1BTynaqC3P8T2wNe
         UhIbPRbAF7ISIGbSLpAUOSvDAkX0ahtjAgkopfdZORGEbhUkbcmcbp2Yalif/L43fUV7
         gVRL65we8ZOlosa8/PEqD9Gfh11Jle+rxxn4KBEeTBuojdOtcRttHYJbmAJGTN2fOo4b
         E502nJui+kT50Tp4Qzh/5q+cZ2d8Wh1wyw/ZH8i9jL0f685DWgr5sXJZa/F8cgvKBOjs
         9I8xVVic+rk9DYurMfuhYJdy6QyVDfTIY2nWCekmcrVmIyq2dZNJ1nSvhpEvb8KEmtrN
         X25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984351; x=1775589151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JogU91I7iT79hZ5xYUAk8hEb43PrGjv9a2H3IOpQI4Q=;
        b=cva8AyMauZ0HCbDh/wHrp8I6doHShNOFzrbJXciRLipU4DFzxuTHUHD+EoBvpjvZjr
         d7sHENRlPRRNw+FRN+L95PxhA6MAa/mskFnlvsKK4Ai5e2V07z8AbuVDFGnFQ8BLy6ky
         Lv3/grlOMiON/XtDs15fkbPo5N/VI6XRn0xVFMCap8CQNmwkUXGZmBiHjIUGus/zmgVW
         WmZxPOrOq9XwZSLBWnYIkMr7t6HsdGMhMfFVP1zG4qFAs0/cNb7hyhpmF4XyYNP4V813
         xd5hCpwaESwvT98A4+OjVtBoYyMew6U6K384RPQY/sJ9kh4KiNmknVQ99xc7Nr89PeP7
         z9UA==
X-Gm-Message-State: AOJu0YxBzkoMYMIneIu5t4S+YV9Y3nNszZASL/HdDu1vSzldtxmnrfzS
	VON1ajO1XyI8xjzD9Pw50Go5pHZwiw0BaI5IQlOlRp/SexOkhtxhvSDkF9eIAhPLsgbpV1QFKZV
	DvJoVq/hHu6hNz2atfYA+PY9lzn/bk+agtftXZJkbfPokRbvNbZVtj4S0jYL3GtlGSEGI
X-Gm-Gg: ATEYQzww9qTVP2WNqwStsV4UDUt7FdiHuFEic6NEh4inoRGvrBTTNCHOPQLFh01sFYB
	29OqtKMKOWHhcEJpTIFPxrvRIkl6rErXs9KE2xT8skgT1gQ1optnjionQECUsNUaeYOp/d94P+Q
	5ivQTpHS86i5APUt644KNALyPwQ+NNtr+Dx4w0i4N+xCst9VgWmi5CatTzPDPhJuEPTnMAbAFR0
	LPlYhyldlxvrlA9YQZjqpxR7yQrcL155G2QDD3U31epkh69XH9tceQAnNRMZ++8tUY6wTXK5ijN
	Elc8iP/UQ+6XLTIGlJZnUFgLOEHBpnj6yxjI/a/wqGGskiXbxk50V1FaXqTVEM586dh5XbFDAfx
	nrfmL/S5y1GWzZGlLArqzQjHIjXqkxsfEq344qd3FHkVlA8iq
X-Received: by 2002:a17:903:1a88:b0:2b2:539b:d29d with SMTP id d9443c01a7336-2b269ade174mr3550845ad.2.1774984351433;
        Tue, 31 Mar 2026 12:12:31 -0700 (PDT)
X-Received: by 2002:a17:903:1a88:b0:2b2:539b:d29d with SMTP id d9443c01a7336-2b269ade174mr3550475ad.2.1774984350758;
        Tue, 31 Mar 2026 12:12:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm152784535ad.19.2026.03.31.12.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:12:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/5] remoteproc: qcom: pas: Fix the dtb PAS context creation
Date: Wed,  1 Apr 2026 00:42:08 +0530
Message-ID: <20260331191210.2019758-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
References: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfX82x29wP0cDFI
 Lq/5yya3M+gKz86F+RpUp7Whdhrx51fPCZQsk2OJ2vyv/6k0BD8V5c31byA9iYIHc08H2xIdIU/
 S4B/zQSFzW6TVNwKrnLv2WwQQ21AahzARYRmvkb5+6mCXoR8Lr1x8Vb6pvxccgO75w5hVYurQRk
 /xVK/AReZvlQU8tzSpdPqnzGNPf7jhGg8rFidk8bAnlsDFra9Oy1qez03rAgd9bIZQg1ItUZZ3S
 IMo7vIJZmh9MgoUA56wUs5Le131FFaFvGRfYAYjbyzIDUBRx5HspopPJsXVAwvIP1pq3Af+15kS
 f0j+lZISAjgKFFLYOYW+jhHoAq/0AWtZAbJJuY7k8T1N9ZG7FbNFdDWhhnJeLEyh538tDuUiHVi
 VNxmt+CxCZRc2w5DZ82n5ame56rjeSIng12vydEeuaJjP009kyyS7iZiEBlyjVZHxarQTwW7fJ+
 RoWTkayXl1dGEVs+Yyg==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cc1ca0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FdsSGlRMCwIuTpVkA_sA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: dk1BU8W9-9DXMbn9BqClqxLUvhcqOyV3
X-Proofpoint-GUID: dk1BU8W9-9DXMbn9BqClqxLUvhcqOyV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310184
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101131-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69C3437068E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: lore.kernel.org/lkml/20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com/
- Split the changes compared to v2.

Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
 - No change.

 drivers/remoteproc/qcom_q6v5_pas.c | 32 ++++++++++++++----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b957bfc86cda..4768e5b5e350 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -624,6 +624,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
 
 static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
+	struct rproc *rproc = pas->rproc;
 	struct resource res;
 	int ret;
 
@@ -641,6 +642,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->mem_region);
 	}
 
+	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
+						       pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx))
+		return PTR_ERR(pas->pas_ctx);
+
+	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -658,6 +665,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->dtb_mem_region);
 	}
 
+	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+							   pas->dtb_mem_phys,
+							   pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx))
+		return PTR_ERR(pas->dtb_pas_ctx);
+
+	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
 	return 0;
 }
 
@@ -839,23 +854,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
 
-	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
-						       pas->mem_phys, pas->mem_size);
-	if (IS_ERR(pas->pas_ctx)) {
-		ret = PTR_ERR(pas->pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
-							   pas->dtb_mem_phys,
-							   pas->dtb_mem_size);
-	if (IS_ERR(pas->dtb_pas_ctx)) {
-		ret = PTR_ERR(pas->dtb_pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->pas_ctx->use_tzmem = rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
-- 
2.53.0


