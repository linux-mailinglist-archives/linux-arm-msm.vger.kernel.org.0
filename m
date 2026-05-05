Return-Path: <linux-arm-msm+bounces-105929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA31NJDK+WmFEAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:46:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 966AE4CBC16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F35D321B133
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381483F7A9C;
	Tue,  5 May 2026 10:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMmq/b5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOcUfmhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A783F7AAA
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976608; cv=none; b=tacSaFNa+J6RIgAjfEsw/IJ4vFgiO3O4527DTIGT6L52O7FCzUIRdgtc/DmEKs9mQkapKoZ375RkVAyXopBhu3pVpO8K9XiC6D32uLVDyMQABuc0SfuZxJXekXwfC4PCTM0rYHOa4dPJj8QRrAR7N3NCGruyvSPJnD6oeouZe04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976608; c=relaxed/simple;
	bh=4IyXheiZuhNFeKFJAfKgz8H68wJnYYhag/On5nwkq54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HtO3j5I4WGVwI+PO8AUgZWN2MnawhjV882s9yMVLFPb4jGN5Un13TzWKFesrz1EduodkS/MACoH4GvZEk6bQaBLpdwDL03jHzXP7cXC8v/fr/JKkkP4FZpgg/5X3JCI5kGGnjNMkiBPF9y8hvqbOUQGeE3+MLM/aDX5/KZYEXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMmq/b5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOcUfmhP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459Va2K2859438
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dE17V8Wkjb9
	0NEl6WtnlLDYqjnI2trV2O4KGboY1n1U=; b=VMmq/b5gU41ECQxFtW3TwEB8cEf
	EJaqIYAmZtt/PmE3Lg3NRQwZMi8fNnUHm1ed7TvH1NE/ocy3m3saHJ6NtLSiViST
	aYrIXz1BhWhYKvpXMOPF2MzX89h2DRLWielpuVIhW48km5x1nhxW1lt+RCrBAcvK
	vd/9c8m77mxqZS+azW9TEPgfvPI2mdyherfDLNa2JaqXbNpM5urrjhmRS/G6lgaA
	btUICvXI0xROWv8UiEp9g+nlrIU5mEVsvv5/DZY53SddokxMGU2hsVHiv4dBsp2s
	oM9VE/DqpGDANh37Uu8uohLgC4mTSoddvbZvl9PNZtZTSUxR+vUChcLbk1A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ag7a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:23:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso6791758a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976605; x=1778581405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE17V8Wkjb90NEl6WtnlLDYqjnI2trV2O4KGboY1n1U=;
        b=fOcUfmhPJyYiv+DVyZZjNxapMEFoYN22oyWcjKkWPMrw81yITgNSLHLXz1Jce6EFey
         JT4MiPenhJvNJGfNwdKDF+/Rao6Y6nkAVt4y3mWiQ8YKN+5wYOmkj4MJz9qW/8GhJBAh
         60smwzFDp9GEEgcCgR/0lJiO1q1dvo19rXNkuHcWGc+7jrVtbxpvnKKeefB1MC0SuREa
         1hbbQ7WO003g9Qg3nK7DmxVcweRY8qIisXE4sX+0WSHdmMDDt+Xg0cDsNi6RC0L1p9WL
         2dwRMjyDIx+mQvzoUBSMAg398dh5Ib1mCrtYgzqFFOqaIyC3eKfzDKxQl9DJixULjACw
         5EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976605; x=1778581405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dE17V8Wkjb90NEl6WtnlLDYqjnI2trV2O4KGboY1n1U=;
        b=MRYng+elz5+eSncI6uUgS5T1JhA/l9JKJIWozhCLFW5WEa395Ab2GANn38kvWCOM4b
         BeF5kINAOA/ioYfpJOd8qsZafdpJJ5GfByiogjSntYXwNqpCKVHlJaLQGlJg3ft9XdZ+
         fTvii8eqJMYCiLMgPV88IrmNjhLm5reseNTrIDZFIGPsV+Bmvz3c8lMQRnRsJCYlwXz5
         XrJ1LMQn1XOPvKMCtZ0aQNiHDt1oVzK5djaV9WuSX9axzOZzokMkSmGbpagegRYgkDe/
         KZMHG40qUOetGQKiudXTAZlabJwFI8V5gvREHsUAUDLZz4UTMNfx66Z2oZZINkDXcY32
         a+Iw==
X-Forwarded-Encrypted: i=1; AFNElJ/RejSCIzuVPk1uMRgAjxf2ot0RprTJu/o2QmPcZw/M5MOOQObts/X6sUJPonuvlTaUy/ydiMAaz9Tc8wr9@vger.kernel.org
X-Gm-Message-State: AOJu0YxNEqiaz+bi1+e3+UDwvIupeRQYBOUTYJM4rGIiqde9x7p/9lmn
	jLNrmwiFIl7l3loPnsOToKJGK8+CWMYax1WFptJKImkSu39RJ47hNYfLDlbniHbbBOKXg4owbPc
	lru78e4e+TtH+p+Pcr4aLbfT7ByDDgZ7N1NyY6IFZ5rGxgfPdu7UaBzxxZwuXDL7Rwoxo
X-Gm-Gg: AeBDiesJYbcRIq1pbRzeSN0wzJS1vFPmErgvyOJw4X0I9uo4OCluBdJ7+/R/KtTk+rT
	8lo1fXGirbp3Vk4lhO7C19mIslAY3uNxesmI3zZVYco7TRLJ6sS+C1uhJWPJSvpRuOzYlB5XT2D
	VVTuvrIdBHT3cS39TTS1F4nMiFrm5WOFKoKqIU71J3HpBLhK4KbgznhBQgu4uUDlqUqSEbPLPUH
	lSlSxDZ8zRPnRvwes1jhqwt1ze7aDT5DAIgdHIwpUGpxs1i1n+csUIUElh+bW+ZOcFCiefGlVa2
	1RxRFutBv90cZtjN3BdI+tPq1B3a7KJj0qIIo4FSkK5vrGtgoPnzXyp1LYHCW6Z5dlTiFwt0blI
	4OBZGnTsTTO4/35T878ZCwZv1oVo+a4VAaFQMtJdbiL2Q+XUoxupVn/LYC1PegmV8p/AqX7RCAc
	rB8PS4H1haJH3PTIeunsOhn6aOCJLCe3IArrOxuQiyEC9Gxwdv70+U+xLa+kKQyg==
X-Received: by 2002:a17:90b:3a91:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-365724c1eccmr2380415a91.7.1777976604493;
        Tue, 05 May 2026 03:23:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3a91:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-365724c1eccmr2380395a91.7.1777976603990;
        Tue, 05 May 2026 03:23:23 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:23 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Tue,  5 May 2026 15:53:05 +0530
Message-Id: <20260505102310.2925956-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX8CN6UHBq9tmS
 ZoBqYdNy380LhIN6Twb2dGRC4mwgnzkfrgIUDuzvnszHOCEAoyTpYLwqfkzuUyoBBNluaSoapw9
 4SFbQ2vdNTI4YCcxta309m6XIGBq+2s4jk4j3B0CIxO0eSNX3fideJx0smNPd4weXQW7voBqp8s
 AqcHggkhlZXEaVGnqxGVecWctWCfxjVzqsO50yE24q5NRZI6k45ReiPnN4Q1vTHkMeciw2IBU+h
 0omlayZlXGNK0X0lne3+YkWy7zCRPQyxnVJBIjYKZwFyyEFe95tZQ/DqOJe5QDH28f5GTduoafy
 HHXSHIJBr4E8tFKOKYn5y4z9grs0KE5Ftc9kNbBB9BK1lYZrgz3foP0t3jtq4IVtSiAbjcy6BqP
 l23KHln+XR7L2ecG63FbEkOjkDYepu03dYddKVJ0NQi0vVbrhxXgYN+5I70kFz8jpNIiz/K8nDe
 hd0922xuYtasNaAK9dg==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69f9c51d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Hho1wTqgLjreKoR7ChkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: uv4vsYQIikZzdUlnSiDQGPfaArP47yn_
X-Proofpoint-ORIG-GUID: uv4vsYQIikZzdUlnSiDQGPfaArP47yn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050097
X-Rspamd-Queue-Id: 966AE4CBC16
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-105929-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,qualcomm.com:url];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v12: Change Manikanta's mail id to oss.qualcomm.com in S-o-b and Author
v11: Rebase to top of tree
v10: Added r-b Dmitry tag
v9: Added signed-off-by tag
---
 drivers/firmware/qcom/qcom_scm.c | 14 +++++++++++---
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..0edf276ca300 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -605,7 +605,7 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -626,6 +626,14 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(__scm->dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -650,7 +658,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -706,7 +714,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cb80e22a3d90 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
-- 
2.34.1


