Return-Path: <linux-arm-msm+bounces-96470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCG7Dx2Sr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:38:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD751244E45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE260302713D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114EA1ADFE4;
	Tue, 10 Mar 2026 03:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYTa55Be";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcUit5ub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77613B960F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113803; cv=none; b=c/m6pgvqIA1hTWBOZvxwezO6ofb0MZoNe+i4RHcvi8iE0TVEPu+aSZHAnR+hIDhY2EFuMrhFUqlZY4W9c+19cJ7ZCH7g0J6GddfR5z7Buq5LgeIbVf89/TWmYwkqrAaKqgn/4zOZUUv6DjcW9nvzkCyfpJlmfJIABznyVuoLUVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113803; c=relaxed/simple;
	bh=mg31LB+leIUTk+NAma1u/7Avcu+s85265QudNG2Rx6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OOf9O7k1ylplmaNpQKzKEaRxsD7FlAkWyXCLFehPdAizQyIZu0IR5yD+oAnxisUm4TCvqEhwWwOK06pZUjjy20T23SOu5beKgAg7zinIKgoYMXdB1Zzp8TZv98aQEIyHIsg2Tdpsfi+rh3yooucaJy8p+kExyP5nI8WAIg/9Yms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYTa55Be; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcUit5ub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EAdQ246492
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YUSWifLnFZE
	lfRttPzEiIk0stf+6yjPu+zvqN7hjHrU=; b=VYTa55Be1sv0sS2GRTS2HCzm8sG
	c8g3Pn3xXaX2Bk2BuaAU6hHfIyl+ucjPjHBr+EtplhbDieHfQ9dPepkkd6YTYjMr
	TtlfyXPi/T70RxxE2nVdhyYZ2ICxnyxljBRAbisRH/y+XJAUVqpIrar8JO1nXSky
	IZWkdPof5A34kE4Y1LbzoP8u3ZJkJ1vaUNFdlov/PM122IWfCi5HDKlkjjhTjFGi
	tptMNMQIIvzMRz/yHO1k02NzGLxO608vJqMPT4T6Fj09B129NDB0LzgPtjGpw7GZ
	VH8vjdWKRg21HyQDIQU0r2BFckOEHlhNdCuUDSlPx4Vwv0vL26KmLwE+RFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8800m0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so63363880a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113800; x=1773718600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUSWifLnFZElfRttPzEiIk0stf+6yjPu+zvqN7hjHrU=;
        b=VcUit5ubeJ++sRv/5OkKlxBMDyoL1UqLjeOirpLjyzB5pIulsZtvBerccgg8ryIuFp
         pdDyUscU9m7N7F6uxU6ZAcug8Jt1e6NG5d0h21xRPufJUTIBD0QS3fbc6bJJEcgJZMEo
         B468djnl5TWzSGUFEYVstA5kAU8SR6QyV2hoMM9SYzcUbBNuYVT91BXkNADuvYAdXZ1L
         oVdIACABzl4LNlOU9/JwOlZYXOX2m9wk+7DFpyzlluFbgSTRKvS1A40m9xzzNHJTZthq
         7esT6Env0+80k+12PkUPc2oof+rrCL6wpeWPgGkjk4ZP99H47+Z8OgcAI1g7Hir3w4OW
         qEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113800; x=1773718600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUSWifLnFZElfRttPzEiIk0stf+6yjPu+zvqN7hjHrU=;
        b=cV3ffVVDvTt9N6U1grvLkRXBgtD2Vuo6LdI10A73dkyEahWgsbnYYOfrXWbyp304a5
         dHTvo8dL9Ou+Q4X2aqAxi3VXBEyCIZw+YTJ4ATmT0rv2AOT+cux2FkOWA4GpnrKSBWuC
         vMREW+D7lEuf/64LWvbAzTOp7lGwqG+dLAGu0rmCryMSZSuyjsSLrhBX7eaLIp36Na54
         b4IYAwU5kcTxBeNWZGUWeDbQEgecHlxDUS6QWIZvd2P0coL/OxqGXpoHcmHM/aEBRcDN
         p13RK88nNUyGvGCkWC1mhM8ROSNGVN6YextH6YsFC2kBprfuzRCbMFc4ct00ZghaVU8/
         SB2g==
X-Forwarded-Encrypted: i=1; AJvYcCWlVOv77bHV5SyAhCyzoCIjDSz/nMcF6yVb+2T+iLT8Ps5wcDHPYZTMjjRjy9OzfQboEGfIrWxfrDN1CJQ3@vger.kernel.org
X-Gm-Message-State: AOJu0YzVpzXz28dBnh/tisHq/kibYtqNRHxbECq2oAiikSim7B2lNeXs
	92HD3SyKWEZKyTUZnDVlv1N1nRBpBSU5LZqlKGizq+kLFDyal03Y6qJLFjVPVQrbQ2C0qRldnXq
	deAYAl/ZPM6L3sPeWEDr/lG/0N8PDgR46NxAdh+FyzyYLAEBewOv1zNf/LdBqqR7WIvQY
X-Gm-Gg: ATEYQzwwXULlftV0q4WfmPBdvsG3AuElGx0bPAa2jNvNx8IkmK6nEpEXWXNEiFvgnSM
	L4vW4XnzN6Bpll18Sh2AlHZIeG86PImhS3Y677sSWs8Wr/uP4SQzsUxiYRpzOzLezTtJCKcKi8O
	DCtUgs7018FJsDSKv7w9I/SxQX3B8pxXQioPsM3D50flkZvv6zqzAAbeUNnGi0abKSKpgHGP6+O
	FB5BJ1eQ6AjQFxlcC80mwHTc5nJAGRfohiYTN3Ue4obdUz2E2tJVY7b8igubt4jQbmjxb1T5H7X
	5oVcZrTozn8GyE2Vp1QmUTfbx4vvRPmC0pIYb5s4IqXIM12YWMejAmwiX3K5sAKgsigUx56MyNc
	1s0+SLX03SAMtSZ7H7Lq8jlCUml+7/X98knh19vr7RcW9ZpkH/JfYSpl7bSLf4AX8HnT1VPV11S
	uIP3vfZSgaFygzZnlevRWUrUvWs9pUaK6hMeKi
X-Received: by 2002:a05:6a21:9d8e:b0:398:4b6c:5121 with SMTP id adf61e73a8af0-398590c6fd4mr12098030637.60.1773113800492;
        Mon, 09 Mar 2026 20:36:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d8e:b0:398:4b6c:5121 with SMTP id adf61e73a8af0-398590c6fd4mr12098001637.60.1773113800088;
        Mon, 09 Mar 2026 20:36:40 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:39 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V4 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
Date: Tue, 10 Mar 2026 09:06:14 +0530
Message-Id: <20260310033617.3108675-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX+0QxxGgUd7dK
 ftCoa9twZ/IeWb2/q1idS2NgAstbxPrPQtVoS2+odV+IVUL9mwE3X3RSjXX9xYqNmBai3oyl7vW
 C6OkMMVwSCRrye5EcXnViQGcrDBmrzZphhev3h2CHiFYCv8Dto0+//FYz4MjzmMde4GAczoc1WZ
 fRZDnkvLnjl2iHJVrJzkh4Hb/EQyqNRI9KpOfbhtqc6OSkiDl4OYF7zfk+84PMTbCUSPBAfyiaa
 QP2xgql79Fja2VqM8e+EpVRJE6aHcPyW0RMAsNsyigmLI81Z6rkda6U7ZRN2oz8QNzalTxlOJIx
 gtfWJtMCLngCORIYIc0f0QPK1HKInZJ9TpF/txj1v8b+0rjmQr+ofFzUPtg+oO+7Ty5Uf9Ay9I+
 FnfIe+oCBDkooXVLO7L2coxoI8UWdI3oHeoiMePDO37nNq7P3EeI9R9kmN1g6GULxF96qFyqHjL
 T8pLodqg+OGO8/4vFnw==
X-Proofpoint-GUID: 0Rjlt1VxjMfzA2iYdkxRlSol_R9efLLl
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69af91c9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 0Rjlt1VxjMfzA2iYdkxRlSol_R9efLLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025
X-Rspamd-Queue-Id: AD751244E45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96470-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur CDSP PAS which is fully
compatible with Qualcomm Kaanapali CDSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fb6e0b4f54e8..6a29d239ef41 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,7 @@ properties:
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1


