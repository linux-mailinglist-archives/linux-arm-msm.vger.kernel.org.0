Return-Path: <linux-arm-msm+bounces-104583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL+WBx667mnqxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:21:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8218F46BE00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AB1F300C91F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47C7255F28;
	Mon, 27 Apr 2026 01:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkNpINnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U///3+EM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAE2264C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252889; cv=none; b=m+JuZJGS/kzaV+SrxZftjTfvbPGw4LEm/uLdm/o1HfLwBQtQcVdk8zGBp9u40NOTdWYDhaVCRPBVzE4BVH2gtvmsN2t5vxRq6JSLZcezENmU+iMXdx7C2jjp1zvwAzUH/PKMFBXVwP36/7VE3mLpconlMhofWFVKgPSRl93pNaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252889; c=relaxed/simple;
	bh=1VwINIObqsJW6y72KdClnlgbBXOSKzTZ+QUwyFNg+zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MEvY1oNATBVY6dG2S9bGMtMqNmnU8lNK5i4ABUxK5jqtPS+Dxt8z3I0tert2BmHbpuqcqZKs5/4QT3dkCfIL3j4UXz3YqFElj7HNk3uIckzi7DWymaYRX3W7k4zqVZgwkNxAB5KJZVNTd2S3X+vIzx/8FNWHCXJX7omA+JvVsEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkNpINnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U///3+EM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKdAbg4181360
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aMu7/aa9cp1aGEonzU1YSLOsOVRBXWAqtvA
	8WgjD/E0=; b=MkNpINnF3FxY1vUYC36o/IH4CamDEE+zauzsw6cRJ2be4X7YVJE
	CC+5RZy34kgvfmQMbJoHlFr7aHCahj4bw62e6W5Sy/dOcgDj1GA/iM9Df0eIWQch
	/EBFbRSu+Gtz/W/u9tQmYcrKsbqiICin+kVhp1AAhRHdi7yYjWDvyokJ0ayYa4m+
	t6zrCYJBI6WPsT9+goyWFsvepKJT18kl/ZJ1pqsnucveDjUmvyqgk+/FNGxfoE6Q
	NAdlTpBZEgcnt37QpRdjFBQWK/kpsfc2n8ixJlbyN4ylvAb65OE5Q2FRu8+pQVpM
	vWLyscain0/C7VzlP3zDtmoG/9eP0PbkhhQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrkupg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:21:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2e60238adb1so23918137eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252886; x=1777857686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMu7/aa9cp1aGEonzU1YSLOsOVRBXWAqtvA8WgjD/E0=;
        b=U///3+EMxTgIER5xJ6MvvG9q4VndaN0h48nTNvYpnBSlozyOOy1XorXsqw28KNeZvJ
         WKy1Fgs1KfXtbYAOilkVvvbWN1Afu+qKP3Xs5QXy7kj/1itwiYRpkOPZpJLncM/1bHI7
         0CVckQ8AQkZofkOdrBA8hk+FOwAR0Fw8CCgOPr/h1EREy7a+R0QN9dcLrCOsPove4kIA
         +SO9AMR1ex8Z3PQ14lxfjXUi3pFOMWMyBjosFoZvAV7Zf1P79Hd8lTG+hMSHHUdl76SQ
         cMRfKPniQYS9bNW+aqKDjskOM/9PSz7czE9YdFRbU6ic1JnVuTEagdLAbBzVcmno1zny
         3mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252886; x=1777857686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMu7/aa9cp1aGEonzU1YSLOsOVRBXWAqtvA8WgjD/E0=;
        b=pt+F3Ztpu4mcqKaAgdSUQMQG+U5ARDyKxvsO768CrsXgz63Zg7DTV+ImrY6nFEzVWl
         ILovvNHncKmbR3tH4z6ZPcY9/jkVcdm8JxV3QS5QHYrUdySe1WNES8255s3/gFiE6yys
         mvLBJRuTGP/Nhnwq4Gq+pEQUzFegeHK8XeK8yCdHXEOUCFrgMpz+Bc4R3db695H50Zre
         GRm9qaIust1icQYNVPzT+OXShIHNOzsZjO7Vw7UITwwu9Gt0RsWFRcwgz4AnpcYy8//Z
         1rirCuZrJufOiDkXHwgM1VUm21LI271xqWph6VFzoxBqj8S+UmH7OrhWjohy226XHqMv
         +2RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OZwGksv7YB4as3lMfzbQn+N+oEuTe/9re8vVC/ikWG28pfLMxcKAGzbaJhHkfscbYfonZFIpLArekJL43@vger.kernel.org
X-Gm-Message-State: AOJu0YyTH9Qq9U3Qm8/90GASBAQz2T0djZZBfzVp6vV1/s95ARvxqIMk
	0VBVGLRvpV6BTIg6vYu6Y9aUD8rFyEG6+tnecQrkV1vTFeP1/VIQNPTWP5+pdn4N4ZIth9BCMiL
	iuWqlTwX4D3Bo+MjYNV5dhDUIPhgR9ojEdZhPaUmtIEbnZbDko1MjsJWRHRvYK+/Bh0mm
X-Gm-Gg: AeBDietgc8CMb5js4cL1y1U1IUpB0HU9ryKC4TrERv8NwAy3uffSajPdF+zSaio0XVw
	v8cokQSyITYNv4zQrbGPHozmwzc2QpFfOSF13kKiq9JDaHAMcaDFyWUiEO7ae6sbczFl1QiA9fa
	zXeOiYD/5ro5tV/JXeU+BKQLHNMDaRmGTlHYWKht/QZ3fJty0v3iUVC9VeVaUiR6+iFWyFczoOt
	efdIufjrwe+TNxK4I4cvuY1LPzYsZ7ZkHZtHiGYySaqzDrwt/Zq930ZOtPYLvNX/eL85uLK+rNK
	9QK/IjBd50NXa4YmySoMlRTN9wBv0zxiO0S5yuT/L4iR9QfSNo0/OiudGeLRC5J390SjFM/PuKi
	8nxwNu/DMkUSo8Pm4576tC6Nekq07mSMlgNS9xelZcFx/RRGBKxEBh7no2csY1VpSIeKET6nVLl
	xQVuvo9ltj5PysBlBQ
X-Received: by 2002:a05:7300:6da1:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-2e46538fb7bmr21490724eec.7.1777252886351;
        Sun, 26 Apr 2026 18:21:26 -0700 (PDT)
X-Received: by 2002:a05:7300:6da1:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-2e46538fb7bmr21490699eec.7.1777252885843;
        Sun, 26 Apr 2026 18:21:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8aed43sm41138397eec.26.2026.04.26.18.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:21:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Date: Mon, 27 Apr 2026 09:21:16 +0800
Message-ID: <20260427012116.231226-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMiBTYWx0ZWRfXxrgizD73ROUi
 lyt2wosSjV1/MDaoGjc9Xeq+bAJRGij7yMhpDt2SIHjnnDGCsc1bEyaHzUBeNjozR0jdOrKRx2t
 8/qf6d8mQOb2ntp+ZlPj7T317Pd3Nlg8GAXvbgyocTBhQzNP3RCpimwnfYgjexV/xHXUJvykTuJ
 UUs4kO5fzZI0W9qrVD1oDD7f3VIn8fKHnHLv8MCzMmzcf565Rqj/74IXzOJJZ5fW+EDIfq8OQwr
 8mzPSGkclRqbI4f78QgmoSvX0ndQn15yC+TAQyx1geMXcsiYP9SBXF90XmBOi8w6ySiAFHRuY19
 NwXHomACzLBRXRANiqyBRmL2miP9qAXVNLDPUiVJeMy7Duis0z0hZL2yvsueTOkoPq+gkQ1cBka
 xeDTaYA1hCGDupHcssc2izoZyFC5f9b2ny2YtPNvqYq+tgtLq5ax3Sry752jFbLOU06UHrVzInh
 k3TX2AopSkOrZKPBuKQ==
X-Proofpoint-ORIG-GUID: jmKDCepu5gy-Acbb2VFUP1R2CQnOMgo7
X-Proofpoint-GUID: jmKDCepu5gy-Acbb2VFUP1R2CQnOMgo7
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69eeba17 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JghOyed9f2jXz3oJZW0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270012
X-Rspamd-Queue-Id: 8218F46BE00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104583-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Top Control and Status Register controller on Qualcomm Nord SoC
which is compatible with 'syscon'.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420042124.1247995-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..23317d1b381c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,nord-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,qcs615-tcsr
-- 
2.43.0


