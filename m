Return-Path: <linux-arm-msm+bounces-96682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPTVNFEusGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:44:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3FA25253F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86D8A34E5C46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B066B325705;
	Tue, 10 Mar 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcRtDGNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AuKNSKJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5452DEA9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149844; cv=none; b=Qs2QcU7e6oehNJcZLBTY+FSIe0tzD1g+kc4/FNNhR/3vgwL0F6cO/9TAzG7uP8nnKoIBk7Ml0Y+HhdnV2ja58i3lbOuC/HFrOnGDH5meRQyPcfOtHShGFRQfFXDX+6la6FjVkLx2tFFLO6v7Cldlerz0fRxLbd3PrzK2TJm783k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149844; c=relaxed/simple;
	bh=KIze5ZrQxZz4Phfuk49pAhciBmV7OwVVldEXZctNS5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQJrKwSDBUvJSApyFC4CMUcZSlb/FGtqq0ymq0CdFZ/4Ih5ipcY7smBao4Nn6eKoqlnupIcQmVWbCAZTYD1iM0WnQvyK9cLISs5LHOKCcHPrthFHcVRQs8Z9zD+96TKLAVhl3A9agffkNfEnENN3JALY6wP37do+I/FlRS43Grc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcRtDGNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AuKNSKJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaYwd1502981
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zmv6BusZuzBbAou7SIt9IZJa+C5TK3C+6Y6
	Fy8mQT2A=; b=JcRtDGNmPr9X52DnNFB+Sf/H0LQdpNhY/Bpy6S9yJcqXenPGUNN
	iM58dPsLbG+jqPwpNzvroBkwAh/ULdvThr1+Pe6Z+T/vhRY1f4Iy5AccoML7u7V6
	TFgt6/MCKWI9WgQ+e7WpzfrlMJR2wSXpFfqWMn8OLKyvaqg7Cd0G/RfgJJmHVJdA
	gx1NpZA8i5AYfFZeKFC9/hFRRPBB8fZTPZUFFeMpwzls3p8pej25gOg93LnFhE+b
	cn4JjCloI7XNhuMxAEoBe/kLAsNBZNC2wHOOZ759xNP1HaZUSRXUpjXfN/2tSZ5q
	5FYiTYnWjnXFRPQ9fOuzk9BIWQ7TqdAd/Sw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8hq9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:37:22 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67bc30477a5so2903381eaf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149841; x=1773754641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmv6BusZuzBbAou7SIt9IZJa+C5TK3C+6Y6Fy8mQT2A=;
        b=AuKNSKJDQRe5rapGkYYhyHELnzOlg3VmI3TExcf6SOqeF73GJ//TEIfRbzgq488U7L
         i4CX5TyaNPxPEGBz3UGM2tvw2PZ3f8/SI6IRDINDg2mCAdRV+aBwDynMt0gX2BbiKH2N
         ImpHMvJPKZBZ8gisuDMMylIvgczLTYheL8ifnRsySVeMIZDk4SMDkvug/BeMM8RgvLC4
         rvn2qcN1e+HZyux97ijXznTi/C2LCryTVIZl5zrOvqLXGrsnciXbYeWen1+/OpRYBUx+
         DcGh4QFOiZR1NmnJN0PvZtY9dDwwIeHI0Iis5I45jjprxOwLW3WZXNr7OGrUWKQAulMD
         +FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149841; x=1773754641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmv6BusZuzBbAou7SIt9IZJa+C5TK3C+6Y6Fy8mQT2A=;
        b=Wb6ah79Jlfk61dKm86lCuadCx5Rku3n9/K4LRBlpJAUlH99HrTjCNEw/R8hFq3XwbT
         yfAQBaHAnx5Ogrsnxf5U8jl7XqrOrbQnWUIcVAhqew6en0elnFcgUvqYrxMywiYbLsMA
         ZB0ekL99Q+qcngRwOxpg+cVrrwjP0vc0qt+mc5c5QGdnoIbrY7j/ayKsPAFRv9/BuniM
         J/IE05NISceGqluvMVuJDJQy1knmRFi7Baa03INFVf25pglGbv4NGq9vLNztoShxUEhW
         Q9iW06fdFP6o8tgsDaqmiBPvaX6m0tLARh3+mIOgi2M5TjDHMMm3l+c75kIkp0Ir1BJG
         k/9g==
X-Gm-Message-State: AOJu0YxhoqvIpxxAw/V4KbDab9+N8mEyTULIhI6HYOCcRPt0TMn0YAXJ
	iceVLKUlinGmC3+sXf4czlgWxlXQheA+eBV69Vozb+2lTiAJRaGbOBuW7ONpuD6nk2Si3Gl7ECE
	JcwyVCVEc5edPAuhu+GaLVCJGrKhJ4vA9+uyCBN7IhsRfP9itUD/fJ2ycwMoFA9A2ubGY1viY5w
	0U
X-Gm-Gg: ATEYQzylYmK/RnPUIfWVSfFG14Hu5BmW+Xkft1m4MR2TwThqjgjDhuKceaZQ7q9/qIv
	WC6+cTWfCane3PASMExOeHQPwXbGldM5gnhlfnzULF47/xeWvVj6I7npfPhk2l5/3osfMqne3+f
	md+WHDhMn2ld7Ir91YRP2zWuPzIuD1sR4nbNdwHPYd7PEP+DjCPoy0s399qDfk2DJ6Ub/rxExs/
	75LHluRwwhx9albjKk1z0Ki8ok8AwCsPLsiTc20sgHkgDjYFY+6LEbuy4R731g5JkqNLtYwlyhJ
	38rWcg2JKdpdNfrZA5Zy/lW8AqILN8z6JLUydn9pXbgK8JaS82p4RFAbOdeGEolJOgRRsjT347t
	JMF3OyEjGIDDI85tQE/JGEQ4Gn1dSNmxRKFuQ1l2Vel2p93Sb
X-Received: by 2002:a05:6820:221e:b0:67b:aaf6:821d with SMTP id 006d021491bc7-67baaf6aaaemr6265053eaf.42.1773149841590;
        Tue, 10 Mar 2026 06:37:21 -0700 (PDT)
X-Received: by 2002:a05:6820:221e:b0:67b:aaf6:821d with SMTP id 006d021491bc7-67baaf6aaaemr6265038eaf.42.1773149840983;
        Tue, 10 Mar 2026 06:37:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bb1eb3591sm4265084eaf.14.2026.03.10.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:37:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: qcom: pas: Fix the dtb PAS context creation
Date: Tue, 10 Mar 2026 19:07:10 +0530
Message-ID: <20260310133711.2452445-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOSBTYWx0ZWRfX4CfRjF3MoFsU
 PqIlc5sYmSfJpBga0Q+fHjzMiUgLKHIPwYxMqBvr81Kaam1zFn9BYwJrDLSwhTs/br0A887JdWu
 fW2zfYnpIWLFamUUUnqgOytTqXaCeTtOoBpmhPH5B6QA3E+6QntUNLIQN21xEhbnb6h94VVdNIr
 QZTepk9Fn8b5KJ9/4Z9LSmDBwwKgRV+UhABJjM6tnkI7QsV8H/vzD3/cXkcjSYp9ysXwX0GHXVY
 lFM8byH2TXDBtE+4+vLabHS1ucLVbOwMehe2L4G4dnbjjb5ktdwk0lLkC4avOhoZGJalOEob9ym
 GKozsLo297DpdEZLy+Mwg9jY2RDqRZr+0b0GxiTTKCbr3nDOsItRU/Ghc63pr5mgKUJlaE0oBMa
 VwcqrFIZ61HioF32reKTEE1clMLtBnOREq044ZWzBULSgWDyEC0+3d7JXGCCEPp7s/NYn1AGHG9
 xCypf0AEI1tkJU/NAVg==
X-Proofpoint-ORIG-GUID: xACjrvpZDWe58VS7SOU9P6cEf9Qigvnc
X-Proofpoint-GUID: xACjrvpZDWe58VS7SOU9P6cEf9Qigvnc
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b01e92 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Zzg8c1LOEvFJJv0PgygA:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100119
X-Rspamd-Queue-Id: 7C3FA25253F
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
	TAGGED_FROM(0.00)[bounces-96682-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
 drivers/remoteproc/qcom_q6v5_pas.c | 35 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..74596b82aa74 100644
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
@@ -640,6 +642,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
 
@@ -657,6 +665,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
 
@@ -838,23 +854,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
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


