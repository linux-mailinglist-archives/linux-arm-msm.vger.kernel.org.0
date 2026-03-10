Return-Path: <linux-arm-msm+bounces-96688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK4aGR0xsGkShAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:56:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A3252AAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D69A31AF01E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855EE322B8A;
	Tue, 10 Mar 2026 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvqnY2jP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx+VHYBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D436BCE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150736; cv=none; b=GSBgtoHHr1wDMtCYomERdGZrDRWqbH41cH4m7ODA56wBfslF9Fd9LHnLq651TS4X5RQHKExDFbke4iAfqipkdQ6D/UIAYZTfigea3+X+x0SYZNEqNTc+dD3f3ba5RiXjCZ0eOK5m3sdDEGS2vrdHSA4DQk7LjrYjyW0fYmlJ7Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150736; c=relaxed/simple;
	bh=qEhVOURgjmKZcofjoKjsKX5vda8WZAM1vsEimNH/fEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3f66ZpKqZEQoD8z89ykEmyLbNVZqC5QO1dQF81MRphBnxVhJN4tGDTqHH7R39+hFcbM6sl4BNhUbtrqX+vHVdh3f2f9wsHzweXpaIkVzuXcin+bx1QGhQYT+vrDVoSGFMZzzASVo9iddMnFZQhBZPE8ji3/QyyJPZa6x12+uh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvqnY2jP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx+VHYBq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaWwV303896
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ec26YDNl2RQt9urDzAThYSRYy4h33GcE6qn
	sJgHmtXg=; b=bvqnY2jPazi/tsvLcRN+V5TDWd35xhqyThTI9i2IBOgb46XQJ2H
	VETFqvFMo5r6jI7/FzQxeWxty/h/MPWH2opLlckx5fC5Z7xKcYWplepLR28FpzEC
	KbTImlZGL8vVKnYvYt1+W/fzov83fPWHrTQc44ku2zY5TIxU6Zbw4+wH1tuV2E/q
	p9Rd0LD7WI+QgrMa1X1HPhSplUAH9DCGmwx+p8D27KNblywEckzJ+vbGxl44QxlW
	/Ov5qCJ+KLSvVcE6j/qnewd/SQIoGKfJg3zMVNqS+LIC4/NrmOt+BtCMKEyaCPWh
	8woaU2J3JJ5u+PAfc+Pb4SfOTx98qTCJnJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0r6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:52:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso61260650a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773150734; x=1773755534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec26YDNl2RQt9urDzAThYSRYy4h33GcE6qnsJgHmtXg=;
        b=Yx+VHYBq88HivBUbjrJkRlrA6n1VYBFFmpLwlcYLWJZZZF8x3KBx5iz6og0R0TDJBs
         ZzAiEQMWq6mVUJplNIYUBFYbmLt04j1IiWG0D8/n4Jn/hC7dSOpkP2Uv1ZMRyxDxbTLH
         f1BVICD8jzKtyOjMhbRofGnwa/aGR51NvIvsvqkVSTy0vLPoj1RQdmWZEEQQTd3uv/N0
         KXpbSHInVX4kPPEU8/+yQHnLGML6P/sUmUB5kcl/tgqA1jTBili51BcpGqPUfx6plkBc
         hACG4n6n4voXz8H217AqFaCYkm/Mlz10BXS5njL7eaVy2woa2RwY2GyW5RL5L6L0sGzq
         2Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150734; x=1773755534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec26YDNl2RQt9urDzAThYSRYy4h33GcE6qnsJgHmtXg=;
        b=NSz2htKLTVm6Fijj83rZg9G8mZ70yVk3Fo0l/66wEfpEUbScU4bcuB/kbvNi19cUpI
         3lOBniwziRQKxjLjiEsSY9zOK/QW0KlqBzZebb/31OGYuTdGCaRQbIDdFBYD858mJeTk
         CU+kw/UDTtaUt+eeesmM+qHOghaHYBexT/URFgbQZTcEaoQx2yzVH7Zvm0qaRMZXUjyc
         PXEuzkt/N0HB2vC2JsjePVLFtP66hdZEf+gVDaTqclcSCT3PYL4mcyF0w6tvmISl2F5d
         wt9E6jjXgBvxuiUqj0iQ5Gp95BCmibjhtkrMizjLsWr7wS+tTicCE0dWV0njwy3yjhSq
         KyXw==
X-Gm-Message-State: AOJu0YxCrnbeB1wy/qtND7/fsnTTR7AdPfYoou5v4TSqtc/Hz1A5w6pt
	FmhJkD3Fr32hCNTL1/ZW+MAhm+c7AiqSKKRbYcE1RtkGn4VotbO3BYRtlBhhd1gjwTIXMTIgbku
	REtuQ/fcxU0WBnkFkFtPvWGttGVa3YGht3MM43txuDhXOUjLC3OGx/wXdoQKXMb0ZLjZDgsSM2t
	Jt
X-Gm-Gg: ATEYQzxEWok67sPFk8TRsLD8dE4hJ/crI49nrMC817wEnHuFZC5ui6AZmjqBLVn5UyI
	1VeNk0zHiY8+/BuwwTSrxJVScfr1qUhzy2xwzOYLSvVbpnQtlBXVPgOrXvwAMoAdReDJ9GpiNMk
	S2Kq4JZDatwOGSTJIdP87MU98eTgQEeOfbhCkj3FWpzY+mhvsPzqmLtpybHw8B7jqJHqbxLxF4b
	I+NgFIUi2WyNzhmTiJRLI3omVX4YQKarQhs9MZTa05xCeIl2IjXPMrbJHgjEknon17xRWxVkSdu
	k/mi3g21r5YX1GMwzNV179rhL2ej+kz5w53ii97xN2H1+RPM9ijlru1HdOQIFMNV5a6KKEiMse8
	ooU4r5RuwQBpl2WHhXGU2rGTygR4KPCsYM4IiSEzgCsgQEJyZ
X-Received: by 2002:a17:90b:38d0:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-359be344cbamr13628222a91.20.1773150733603;
        Tue, 10 Mar 2026 06:52:13 -0700 (PDT)
X-Received: by 2002:a17:90b:38d0:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-359be344cbamr13628184a91.20.1773150732920;
        Tue, 10 Mar 2026 06:52:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f088e4bbsm3333149a91.9.2026.03.10.06.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:52:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: qcom: pas: Fix the dtb PAS context creation
Date: Tue, 10 Mar 2026 19:22:04 +0530
Message-ID: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: z2UQ4eNMve3EfivQH3o_82YpDNYzi5xJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyMCBTYWx0ZWRfX7kLtf9Qj2IQX
 hLs+uq+NHrFfQ0FAzTx+Me9LXHo1NqdVCAFviMZRd3mX4asd9rfSj+tAXe2qzDokt9fc4E4hV2n
 VHgjeAq1qT3vhdge0LzSN3hB1eAmLitrG8Nt7rtaPrj8Ju6wwal8Hn9CN2IwTRpcr90XMKuJuYC
 zS1zgEi6Gb/zcFqji8MJmQeVl8ncR8vJYOp4Ra/gLDoSaNt+rspEvNk8j+pvWqgGF4849oOSGpB
 PR8zpaTUgAT6JFK6BoO0iM2KdCvsi0Ie8iXPLyXF8DUf1IBTJlypgouDGgtalsDD5X7cupEukY4
 n0A2aGt7TqQfA+DMDx9XcWMxnyAQE8NW2s7x3SMAITjrQACd2nTPjC/ySMNO3gHUWu9GFQ1UndD
 +h+8zuaYXU6R3ZXqZ59oy9chTMtr1HTmf8dvFBv1EChN9xt/IF7SkGGV87ZKyxD+n0YnuQvDqmZ
 wnjusfqt1xmc4IBk5oA==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b0220e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Zzg8c1LOEvFJJv0PgygA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: z2UQ4eNMve3EfivQH3o_82YpDNYzi5xJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100120
X-Rspamd-Queue-Id: E66A3252AAE
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96688-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location and, while at it, fix the place
where the DTB PAS context was being released unconditionally.

Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..3bde37ac510c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->dtb_pas_id)
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
@@ -623,6 +625,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
 
 static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
+	struct rproc *rproc = pas->rproc;
 	struct resource res;
 	int ret;
 
@@ -640,6 +643,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
 
@@ -657,6 +666,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
 
@@ -838,23 +855,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
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
2.50.1


