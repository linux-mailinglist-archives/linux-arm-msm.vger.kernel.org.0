Return-Path: <linux-arm-msm+bounces-92199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ8CKpJniWm68QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:50:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA310B9F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B3F3016931
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 04:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17421285CAE;
	Mon,  9 Feb 2026 04:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppKxpgHD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSg5FlqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AAA257448
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770612584; cv=none; b=saWb8fVd+/CyVLmg7EzSsjZyg+tOM+fgeJ4xoFvCVRkf2kOPv+2zh0AcSNUAo0xeHoCMaB4qetFPY+jvqNZXwPYwAdp41mq8M2WA1v44M4IuL5x501HVNBBPm1F9B85Jnyszrt41fa+OpqJuh9S96nYb6X7cFdlorj2CeWIzj0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770612584; c=relaxed/simple;
	bh=zBcv7lxEtgPMCXIkulXgwPcKqgMN8Bqjh/iShUkQdwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AF/O3kYSvf7d1gkSY97TWo2KSltDr1KOS3jaXZXwMcEMluo+BRM4e9nPyzhKkBdIMBtsaby5hkHbEJbX5hNxKB1f1OeFAZ8RbXqTcJwOQ5xNxAoTaGqXwoekl6qZoHkar5+tW5XGtj8dsyQ4hY+NndVj2IflQdAgJCXOBDlnm2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppKxpgHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSg5FlqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Klg2Q1923176
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 04:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfFLRsIQtsMx9V+vCVdU9SijBH4NcE7bdWfh33JmtzA=; b=ppKxpgHD9zKcL7p+
	wlHmIHxD3HxJigUMsYNCxseG7Ar09qDmluSy7SGy5VxvTzkWaazHX2xUJDQnE0d2
	6MoloMtTAXtooNEnj9gEDzrQXVIqXzibf5xE6gM/Es9M7NPuGy8MCBz67fRgEW2s
	1LyeifSWPr+nvnjMKY0yNO1PbpOxWkD0KE6mzirxj4u9O1AO3rO/Royzm0VG3ndU
	qKg7XNxrGJzTVDHM7/FTshB9Wdki/XBYiF/ZUftxAb2bWf5OTn01xxTcbcZuUCeQ
	zjcITZV2I7pd7ldxcVwVoQhnMIcwMMFTPoj3Nzad7vWRJ9aZnly5T0xi4oAVP1EC
	ZL+7qg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdeun4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:49:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso3033221eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 20:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770612582; x=1771217382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfFLRsIQtsMx9V+vCVdU9SijBH4NcE7bdWfh33JmtzA=;
        b=RSg5FlqAyfoEWTPx6Pblu8F52ldQNU9VTnJZxqjwh3ejrUYepaVy/tuAbj4BwiQJhv
         wyvZkU3GgRHTxmniEEhRPGRuRgUSf7W8mW4sJiaZqq+pORXPahslWHRYnyHLD1QozaFZ
         q0d8+j9PtPTCW2btCM2cxYUgMDcQugoQep1XJCAGpPwruChJCsi8HV1ZVTkfIRg4gT0q
         DKClEDsOQn/WNPe6Jbw0cifPfbdT0SlGC732HLP6mR4iXvo34uXxQ4IGcLN1oEgHnqr5
         xVDNeUbupxsVcz4JKFOwkkYE7Z/xYR3deqfx/vDOJzDy9UMg/WIopoWZocwgKm48DsXh
         KIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770612582; x=1771217382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfFLRsIQtsMx9V+vCVdU9SijBH4NcE7bdWfh33JmtzA=;
        b=Giw8sLIF59qUpWZtQXblZGqIG4bQTM0mH90oWwsuIaWOaR8+9lrfSbGxWUq4P2/Gwy
         GJrhmiBp5SS5NMu5XlAcU2RVGOf4zRmRvbxGqnqEgW38fjIGu4SohhnRsq+eTVBtD5SU
         tWBauXDREOkcao5KHrV1EDyr6Lc59wIrck5fzKCGbHBdHYuGqnHAbU7cvd5LPYmDxhkE
         rOvvSZmrkLiwpQFoar7xXHmmG1IRlssy1fP4sWReiE6wZrb9vFppneJnoIOI38V+kxPQ
         U0C5lX6pIM3UEfOetTLuhxJrWhLqhKGvICQ8qAaAprZseMCK67neiv98TKUBOa7oIrxd
         l74A==
X-Gm-Message-State: AOJu0YwGXgBIreuSUVOK5pnoo4v60H+CZp7sLcfCJNqRZkW1fn/Sz9V5
	Ur1y28gXByuW7Gk2IEcNMye0lKklmTy4KfSw2xePYnLzbgB4/W6aU9WEt4yJ7CHI7tPtQ48PSP7
	ci64nFwSvmYNVZj/2MZWgfshqOzup94oYjHIG4MWefrOafA5I0ejeE05oSIoStNOKuP1A
X-Gm-Gg: AZuq6aLNOHK69JSpI02bQxcncfXDTSVS9pswjFsGjKYGtMp1xuNJK7Qf+marbPSs1uI
	oYBSnw2/VIIWXRnAIGsKbvfrHP7eg7FqD+qXkEU0SPOSgbNLdz0jjKB2ybLfPhHKJ8C3izJKXdm
	n/wZWtVMddYzLSuHj4oujOwSU9pWSS0uHq1KiA8PaFmUaAt1Ro5zfzLZqschDqjBXo8nrveal3S
	HdvC4QcjklZzH8hSRuYpHuBwBIYg67Qx5mhvQW0kHMQwpJjEu/9vgH9IRvqgfa4NdKKFi+f8G7o
	9Ij16J77xTnHHz9EkVF6Ya3YCY1/V6pvmF6gF0OSjtsOJ7ILcM4y5wJlxl+efLpb3CwYsQDAw1P
	aK4Q2Det+hgeb9gx7W69zaLOmskJYYB4wDjg+zBbmxGQF8OFke9CRzIfE
X-Received: by 2002:a05:7300:c618:b0:2ba:74fc:edcc with SMTP id 5a478bee46e88-2ba74fcf1ebmr606309eec.43.1770612582386;
        Sun, 08 Feb 2026 20:49:42 -0800 (PST)
X-Received: by 2002:a05:7300:c618:b0:2ba:74fc:edcc with SMTP id 5a478bee46e88-2ba74fcf1ebmr606304eec.43.1770612581838;
        Sun, 08 Feb 2026 20:49:41 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8647bd6casm5609940eec.7.2026.02.08.20.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 20:49:41 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 08 Feb 2026 20:49:39 -0800
Subject: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen supply for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260208-refgen-v1-1-87ca84fd78b3@oss.qualcomm.com>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
In-Reply-To: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770612579; l=1835;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=zBcv7lxEtgPMCXIkulXgwPcKqgMN8Bqjh/iShUkQdwI=;
 b=2TIostV9F8L8nS7KiswSSQ5DavEOGSq5o7AxzysT/+sDvhp7x1lMXkwdg6JlRpxDa2oPQBC+Q
 E4ChprQ/RtoB5sEv96N9js07uA3Pa02hEmH+3O1FcxBDIdXAnXvM9yp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Ddcaa/tW c=1 sm=1 tr=0 ts=69896767 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=frynOpE9Hcw_QGd8cjwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: OK-mFaTGio8xNO89ELiyUvXcwnmKtLiC
X-Proofpoint-GUID: OK-mFaTGio8xNO89ELiyUvXcwnmKtLiC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAzNyBTYWx0ZWRfX0QyfrOSNEnfB
 BX9/7qogoy0ld1B2at1Zp5CNP6cx+Xi3B6BgefkcEjuW1dfaT4Pmt5UMl3/VbWIEyHzyATsOO2+
 fWhsE0hxAjqzmkNI460R/9qRisSrknbArkjTqDX4yi85FmXg250ETpXHMPct49mpI6WmPPtV+Om
 LYxzIeYXH+/d1OP2PpUDNij1HwpHoSo1bNenBY8aOalMPK7UyqRYwgGfWgdgEYrKKVtETPK67M+
 QBmebtUYfIaZ/EjdYWEdZYS7abI6U50G/6Xf9eS84sEsTetPUJdO6XOlPiFyo87OFJoEh5/eEWF
 nsjQIoCWFzUNY1U40vzT0kFcxskemPZMoiQzBBMERb4Ric4z3JkLw+1F3x0Qx14wCx7UP4woKje
 mK/wfyfIzhda2fzXyanDYb0/acFXnPkKZqtk6myfpJBl6a4jXC9RHXrwGAbRQ274vj+O/0Fp9z3
 pAALmgk6ltgBPiUU/Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090037
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92199-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52DA310B9F5
X-Rspamd-Action: no action

The PCIe QMP PHYs on Glymur require stable reference voltage provided by
refgen. The refgen itself requires two separate power supplies:
vdda-refgen0p9 and vdda-refgen1p2.

Since there is no dedicated driver for REFGEN, add vdda-refgen0p9-supply
and vdda-refgen1p2-supply properties to the PCIe PHY dt-bindings. Use
conditional schema to restrict these properties to only Glymur PCIe QMP
PHYs.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 82316aa5e15f2bde9c32c112876dd820f9450e94..5f60b472264d54b714538c869a095e620b0eba2d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -90,6 +90,10 @@ properties:
 
   vdda-qref-supply: true
 
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -259,6 +263,22 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
+              - qcom,glymur-qmp-gen5x4-pcie-phy
+    then:
+      properties:
+        vdda-refgen0p9-supply: true
+        vdda-refgen1p2-supply: true
+    else:
+      properties:
+        vdda-refgen0p9-supply: false
+        vdda-refgen1p2-supply: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

-- 
2.34.1


