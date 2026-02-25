Return-Path: <linux-arm-msm+bounces-94179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGdlFakyn2mtZQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 18:34:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B08219B9D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 18:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA21C301BA70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F173D3481;
	Wed, 25 Feb 2026 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJgqvo0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abOuHzkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C133B8BA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772040868; cv=none; b=tdl2y4/w2oFadIzZyUqmsykKv6khxbmoX38AWX/zFG6e3oMHRvWt09SHBFj4YBlR61OyPdRM0MD1f6L4+eDPmMD51Vy3ifMRoz+wjdCezhZYYqwbsA906+csT+SYcVoj0V1a5/M7iINT8RfmqS6BwSfzAqoDHI6IJtsMGg9qoHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772040868; c=relaxed/simple;
	bh=htoFfnb+Q5MDi5Nm9SghpLmCXyC/5Gu37ciBqln2dA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KBQu5R5z6BFbs9vXWpijkK7NrRwpIgen2u15ZOsb0LtMyD64uQY6PJtiLnApRXhefD415ciDLJ07BswGX86L+koNDc8/3ho7ZOKyy9Faq4I7vzKj/RvPLPfKP0udbe4Kk/U8vfoFEUDMSAzFvfPKpS8Hqhs0EFBzNynZpU1YB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJgqvo0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abOuHzkK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHFnvL3057123
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WFH4qf6p9+Eos++j2RKIHD9SrjwpwAU3m49
	79uhTn+c=; b=KJgqvo0YdZaRcE8XpwcMf31ts5feh7S+bEVEiovEa25WNVq9MAg
	d0vNCMLpN1TpkOd4QTrC9pmIkXpCQkzh8oNeWnahaqC+RmeXAWaQ4bnXjkmEvtNo
	Ykf2eiEgDCm0xim1VOwvRVAtZtFtxyi0z1s9/AVCBTqevyqTh8Y0nYo6nrcgVCq4
	H/S9zoeYOXs2NRo9GHD9DmG5Uei8btHAi0iq78KGYNmyWpzJTH+cYq2ppHmGYOsZ
	1gzepG91ieqLigewPfl774CT7DqhtEEZcsbTzUuEGlvdZ8WJ98O7EkfNSeGW7y5c
	RimuL8w4NT5RfjpMRW6fLDRg2pppF2+Fo7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39hn2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:34:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so8464949185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772040866; x=1772645666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFH4qf6p9+Eos++j2RKIHD9SrjwpwAU3m4979uhTn+c=;
        b=abOuHzkKL+x9465GOkYk5nGFRJY3uxDprBKtZXt9rCwDljmsaCGQvguFdP08UTvn4a
         6iWkexUCGYGke97PH7fHBeA/Noh9p3t5rDp5h57nR99sL5zq58yGnYjV78dADNIYXOmA
         Hj50ASKrhIr/kY5bYVuTadR2xXf9nGblFwBDLp5Yu5eHUVkrq4kimvP67kVhYr9/fXjy
         m1i0UBCHRt2QJo+BL1fD0z7p0El+TmOuvn86+Miza5D+QpFiWyliLRYK+zxZB+eNU5KW
         ep9r7s0tnFzyvgXVSr7tVshQOfFcBn0hj16Hjcw72L1MMc+WyhFVUuOCEAEhTRMpdyn1
         wxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772040866; x=1772645666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFH4qf6p9+Eos++j2RKIHD9SrjwpwAU3m4979uhTn+c=;
        b=J40ChQVIR6M/ic1ufJX1DdrIlpIiAcfPG4wHQTOeePd1IHr10CzsC08cJ/NU8pfTHc
         XucH24Swzrx2eQR7/4UOB2v+GEWiEbm8sdSc82wmGuOVSLIThnT6xy+e0XJmgo5wtSLH
         G6DgT58VYAkDnPENNkYnR5bxfyn0Jm1hWpy/+GaY30uLs3iBZoxFvDGV/E9Dsxj2Ki9F
         HV4Tbdry9+zR8lCzuwLuPKyYy6l0UXj3Ytt/EGie31PYxBzjqkYFsOvGxhHjm5EXrD89
         TyPM3FGLUb6WmkrO3rIiyWgmBKLX77szE8wFL3O782dNJ/iI0oeiwtx1vlwFcbADzrpT
         0wig==
X-Forwarded-Encrypted: i=1; AJvYcCWNa+AKgI3jrUx/2jpMcl4redulKYBWQqHrLW0DWsyvwMYrRuCC9yzoUdt6JdCPDTzP4JyqcQ3I9tebb1Yv@vger.kernel.org
X-Gm-Message-State: AOJu0YxZWe5aPmoWFPCuAzseJasu2I4qZ4Z9afna+IaEDT/CjklHUjil
	g54wTKssQjH2K3QbjFN6waeRcBrkNUonLyEpWhzAWFl1zedKhzTZc/i2zCzlg+IU+ltDKaH4aq3
	MrdMCzoi88Kq7gJ0qW9545e2FfnpwcFkuPa6JnSvkAhN8fALN6xWBlZlFN4aBZtGTIpqw
X-Gm-Gg: ATEYQzzf33iwdRas0wcD5a4G/xjJ8BboGJotz7cDo1ODkO7LT/IKbzDQQK1ODONd4HM
	WskRUB07SrMOdAqepMyVbUbvXwkTcB04OroBgfJcWkwsAIi9iy1iBoWJUnh7C6EXWfkLySZE3yW
	UjfmW6ZMP//RQdtvsAyD4Ndhhl6DdosQBbp3U8WCCrTIPbd3pmSh5ewr/J+99dICGl/02surk+j
	YzOJlXDQV+OXFTSGtLZbpCA8mvnMrTp7zJCEWRqH3gT7PceVkw/x7gW+jN9iwHLhVRHSNMCtNs0
	A29njgED6nRcki3wQlwRh3dY/DDKbBoZ8DqNKZWvpectlHFUF0aQQ1V4teJD5r0JUTbEOfGkpyE
	fssRiTCEyXCGJ36UXi3stRFK/d60LH3If/Rk74g==
X-Received: by 2002:a05:620a:480c:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cb8caa17b6mr2108791285a.75.1772040865759;
        Wed, 25 Feb 2026 09:34:25 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cb8caa17b6mr2108786585a.75.1772040865213;
        Wed, 25 Feb 2026 09:34:25 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7141e4sm88628945e9.7.2026.02.25.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:34:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo
Date: Wed, 25 Feb 2026 18:34:20 +0100
Message-ID: <20260225173419.125565-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=985; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=htoFfnb+Q5MDi5Nm9SghpLmCXyC/5Gu37ciBqln2dA0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnzKbzbaWb8TaPhMshhVrWiY4izNSheH7DMLi7
 EeV+Zj50cCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ8ymwAKCRDBN2bmhouD
 1zmuD/4wXP77oUUIpFSiATWSdb6f/J4vZxdsQrSbYremuG1BVNr0P1zIkNpHbK1GGekX4tP4Pjp
 nMEiWC1MkLOFekRs3gIwPJW+gfutLlHKy1XICcM0I0+7MLZnmzOKY7jBU7Zz7sb5Qf6oJ6bZLhs
 iL+yvc0j6St3lebPoFXbxhix8420rLhcKk9B0Yo8mRNTRWKMaHacV1jzW1Ylwc/4Kr9zfq5s450
 K5UOd0Z76Cs53fUcsORaj3M0wONYMiF1C5wx/yWZdq8j3jmHGSijG/gnE+WxhbHMs/ZxjIXaoui
 0QoGQL6eCiD8JI7eEMVj068GmEcpUp88XGXg/YyieuBOtnU78j1cIiTEDf+0aRO9uOpO8mGBQSJ
 YrP0WjUSQKBsRVAlAGJWNLnqh+t4KbP8wFc0ykl0l5yB2YI4jcr1SU/wR0/4FOVcpmOGPnU6VYk
 +oaJijLTJCXunvvFkfQs6DJ4sTN6RxAX8I1PUDzhzAZQj5OMg5tIDUAHSCj7Rz/vx+CFCdb5NOb
 O7tDb+gplE7nw3vfFylp4FE1hjexXlEmRwJzUxocw7GYoBiysPkajk0wt7WUv2QM89HY9uDAA7/
 EF2WAoHLPwdG1X0WnZYPP2CqBeYku4ZskPteZ7ObPWALqzYabLsE5rf7e+3vQuZAiWTe8G9FEBL OwAnM+NCMd4k45A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2OCBTYWx0ZWRfX9W1LXMewYgfx
 nS7uNdWqnq5UqsR65wFzvtWkJEv09lIIMZrKqEPKHSFWiI9C0K2/XcRmc7hMGwwftRGr0Kd3NFT
 ZfcY6mmjaRqVXoX2GSm+rh2ocjPzy+AF6Q8nkScOmA9WhSBqlnliTt07dAtjnW5yNg9UV7dsOyt
 515T3urUnXrUGbfbt0rtAWRNDWRcx78c8pOY4DCDXbbg6JLhC3eD0/mos/d5oqX5SOOf8Ezv5Ds
 83EiEAYU3ww+jNE04+84unDA++rBLXM2InyCwsEiLU22YABzx2upU0e9PR1yqHPdTEHYELh5JOH
 VsztVULn7jhJHpC5kuN4ZKB/rOOxpFdA/O3s0CeRiX+/6RuRz3LKX2L/uSpo+G25d259Bbsjnvo
 gB6nCN3g3E0bybaJWXHvx6hK/sYRsppq87vY6Go6E/j6gIbd5OeYxMkk7LaOj8uXeN1OBLHV0RQ
 LkT01AB21n3MUtAOIyw==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699f32a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=-U9ul3v_K11_8AXDuf4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ejY_la63mNCSJc8SFEPNWRcxXnKdmxLr
X-Proofpoint-ORIG-GUID: ejY_la63mNCSJc8SFEPNWRcxXnKdmxLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-94179-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B08219B9D4
X-Rspamd-Action: no action

Fix obvious model typo (SM8650->SM8750) in the description.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index d55fda9a523e..a38c2261ef1a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
-  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  SM8750 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
   DPU display controller, DSI and DP interfaces etc.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
-- 
2.51.0


