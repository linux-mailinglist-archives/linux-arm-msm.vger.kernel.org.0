Return-Path: <linux-arm-msm+bounces-117383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CcTBJXZCTWrXxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:16:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D2E71E8D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:16:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WZbuoeO6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KNpkMo6K;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117383-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117383-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2E233093B59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 18:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C553E556D;
	Tue,  7 Jul 2026 18:14:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864943C7A9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 18:14:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448049; cv=none; b=jTfhmSRbQIv4Tn3pfF9huuLSGCd/JJcskxEAHpUK1MHm+sZpbCFa8HsXthmPdjo1Ras7RAI4jsJjkftDqpgMY6CfhYT+wwoZhCiKty5QLHxugcd1HqcLGdhQ7Rrr9Lrmdl0HATBpkSby0kBMaAJpnDXNLr6PVEcqWmVldJ+E9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448049; c=relaxed/simple;
	bh=ZVo2+PYmKzH58zl1Mu0LYWtv2AZPMxLsH9FtdHkNoRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDW5GkEBD8H8Ce5OeYystAXwLcgz6vi20sYIisu2wO/mYEhJPCXAN2id+2tDB1dMjnSTARYsRb5PGI2I8zn6gb5AYl+VmCvtJ4Z6NFwtaDdDQiVOTUsTkX9/t1FIMm6nhkdH0kajtT6l2vpj819iuc5koop0k7/LzFlZPU818ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZbuoeO6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNpkMo6K; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTI3p002548
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 18:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=; b=WZbuoeO6zcCoVD4u
	Bm3sYReqpYHHkT/nrAs/CrVeCMhadZOQuRmmBlU6y9DdduDzMbBeBo4YMgpzffV4
	6BZXcK2No+4mhk9qLM2mvFrUy7ji7kX2AZFM+awFjimeYFF24aPFbh10LYtuJR04
	mrgq1UDZF6IaE1FV6Thal0pKtRMv0SE9G9/lTVRhSjLa9M19/LIjcp1MEWQjcCt0
	l1eS03gewHz5Pv44oDRAAIu0D5Ne+8Jha3tXZ4+C360kiHr3eXPNBXrxo6QE5FFE
	crPUaZou2eBP/mcOAJNs7yhToqHdCUaw8GsZ8pADNYzfYKWz3YC+7dUpD61BxQDQ
	ppbJ4A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0j40w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 18:14:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380b630c505so1180531a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448047; x=1784052847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=;
        b=KNpkMo6Kaw8wHWJTQvXr221KJ69tbW9ZKtNyTwCvmLuORsSsXG4/V+6Qldm5vDjQaQ
         XjV0oD+7jUHHSQdTfQmby2GWzM9COdgbWtuliyKYP+l4mwJgyJWDrb2O/WoEO30iw5Vu
         EAmgCQmitTDURPAF2IUbZbqZihiegWLqhOW2oGgXGk/27sp4jHdo82pNpD6uDw6DasF1
         G/emDjSrXa6lPlXdjXBr+NvqAQlLvCE8bGCFCuI3fC7BOA7IJ0vnBgf0qKeR71iNzMZo
         r9RkICAIrMj+YvhJqkMO1dS21AP001gXvVRJtOR5mVOKBAdejHSBhA5HXPLPxDVANpLv
         +PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448047; x=1784052847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=;
        b=jMoNyJOmOvH/fWsG/PdrS1D22GKAAwAxnkIOruI0fZfTwyni6uPkqCClNmjA0SDY/I
         QGLsfDl6tdtRzQidSfEqo63PCzHWwwljnv6AfoaUAB44HEU+nOwGJd6oZe4LLOaDEOF4
         lHv+XtG/bXNMKMHAR6WuWHVWgGcX1l8sOAz1Ihc7dpzr8Xzj79ZsXbZk7gP6xM6jByZV
         4cNIrPD45HQPaYnf05gXTyLkOdQeVUld5iCSZUglZb/H2lFEYO9nGvS8sBsQDvgirJ8I
         GdRsG8RLSqr6F5OBwB7/HkQ2g3CdpghunVZGeWbCbbwyvfsrvnZj8+r4jk0IYx4QxOOh
         H2KA==
X-Gm-Message-State: AOJu0YwUo1XiZHberJLHShLJOZ6c6i4THYrTZGVSk1FGhQ3kblMc0aEm
	mfMjUHCl8v6/mQ52GKmEjB5ganqiWhz3Cxseahsrimj2vSJYqHSC9MidSDgUnfphqYbb7aq39G4
	W2qtJ3TnQSv4ql/p5FL7P+Ltvg9U9FE9X0MxthipTC0AWDojnvKlrQTHpHIGXHgbDTAu+
X-Gm-Gg: AfdE7cn260R4yODtyZqBA9GoA/yZmAnThqsX6n6M3DFwcBwmSkMffwTe2/LddE1qSjL
	Jh6rIs1jBcj946QP6qq+sjCuLbEa6oqZVvh+c93IGg6kOl2P87uE/tEjPaDwgHocV0OQk73qtiZ
	u1tmvVx+qTrS0COIBloyedBM1LET5rlDJvsyai9gnGhdNJhCyrJOajpJKJbpYaJc4R/LTv0XzIS
	Z6SZlTPTZouVd7LG74ZH0RSQHg1/cSO/6rq2H8Ud2I7B/p1cxn2P6HN7d1v4rjJu3sHpwKOtp0G
	rNZZZIr/BUIuy0bOfJO8/eS1VyN1kzwf3eGqrZFFukCa32j1S5d/Icxky3dZPtv48WeM/9ZZ/SX
	x1CueqB29D8Oqy33usuDlcxURodegcpBth37J57QayA==
X-Received: by 2002:a17:90b:270b:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-387572b45fbmr5907571a91.18.1783448047050;
        Tue, 07 Jul 2026 11:14:07 -0700 (PDT)
X-Received: by 2002:a17:90b:270b:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-387572b45fbmr5907535a91.18.1783448046531;
        Tue, 07 Jul 2026 11:14:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm15731521eec.29.2026.07.07.11.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:14:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 23:43:10 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-maili_videocc-v1-1-ef0828c0bf6e@oss.qualcomm.com>
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
In-Reply-To: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: m_WujyRwCLT8ila8YD2cX1o_jQ5fXIY9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfXzFpQv30PiARJ
 2wHN1pPhMpen3pp7GuMYoukFUd7Z3H41z5vr1m3aQMlGvvB3JtWH7Kgx3oJlMycpY7fpNPTnSfZ
 ERDPtMEvP25szloLjj0zQ8j23yEhwMY=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d41ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_g2Ecp_Vah_XpkdnnNEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: m_WujyRwCLT8ila8YD2cX1o_jQ5fXIY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX08lpApFUL1Qz
 c829u1pjb+34TuvvzBCLZTbRfs96A+YnCmnZQbhtLsvHvUUchayvCyJMkuos/YddETLqNGa18wM
 L8BHUu7vmsb7K+jcsMvEviHFoffv63feI7g4cqLJY9ywcuFP3S2Aew6mta1+406nkTlT9+an2Q7
 vXM36L5FqSVtD1pSutlvpNS7UKOSL/Csqs/z1BpD305/4rjXbXaCXdqw0ho4YmFxvIuHz4NvuGI
 KfFRHDUyiZLBiAfbY9rLb21bhsXOdt6VZGd2kLgE+Xy8/WXX18BLsC0p3vQYYwlVZk92LFncoQK
 he0DpMWc0nNHYjt2bG1xWpqIP1lhJDjVUWi37GjybVjcg76jV8UPF8+CMQNMVF71GzsqjjkXdFk
 8yqzBYjBdaez3OBP3ZHS70K/1bPLFM1k1nlomQcuTNOrRekHVGhQO03TNRN0YKA+H4O2qgvAksO
 B/mNVNkbNS6/aC7cdbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117383-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9D2E71E8D1

Add device tree bindings for the video clock controller on Qualcomm
Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index a6fd1992d6d2f9c05751de2dbf2b53fb96de2958..6281e5ec8036b99ca21740c7f679f4b55edbb87c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,maili-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -29,6 +30,7 @@ properties:
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
+      - qcom,maili-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
@@ -72,6 +74,7 @@ allOf:
               - qcom,glymur-videocc
               - qcom,hawi-videocc
               - qcom,kaanapali-videocc
+              - qcom,maili-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
diff --git a/include/dt-bindings/clock/qcom,maili-videocc.h b/include/dt-bindings/clock/qcom,maili-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..ae52686639db3231b8705e28667d3a65192d4de7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-videocc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0B_CLK					8
+#define VIDEO_CC_MVS0B_CLK_SRC					9
+#define VIDEO_CC_MVS0B_FREERUN_CLK				10
+#define VIDEO_CC_MVS0C_CLK					11
+#define VIDEO_CC_MVS0C_CLK_SRC					12
+#define VIDEO_CC_MVS0C_DEBUG_CLK				13
+#define VIDEO_CC_MVS0C_FREERUN_CLK				14
+#define VIDEO_CC_MVS0C_SHIFT_CLK				15
+#define VIDEO_CC_PLL0						16
+#define VIDEO_CC_PLL1						17
+#define VIDEO_CC_PLL2						18
+#define VIDEO_CC_SLEEP_CLK					19
+#define VIDEO_CC_XO_CLK						20
+#define VIDEO_CC_XO_CLK_SRC					21
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0_VPP0_GDSC					1
+#define VIDEO_CC_MVS0C_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_CLK_ARES					2
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				3
+#define VIDEO_CC_MVS0_VPP0_BCR					4
+#define VIDEO_CC_MVS0C_BCR					5
+#define VIDEO_CC_MVS0C_CLK_ARES					6
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES                         7
+#define VIDEO_CC_XO_CLK_ARES					8
+
+#endif

-- 
2.34.1


