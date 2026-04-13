Return-Path: <linux-arm-msm+bounces-102874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJHxA5WM3GkhSwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:26:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD63E7BDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B96F230055A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DBB3921D6;
	Mon, 13 Apr 2026 06:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKTbSHwo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewhgPXPY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2476A38947E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061582; cv=none; b=otV/6NXqpRe/ewK7AS/7XZnUrBhUeIr/oR9VzB7Zc4zq8Rku+y1iqmoS1dEkuyop0Qzhdhj5XRzca5KL0ffP/bO2/lIdxA9SqmIrcICterYDh6HAqnA5K7mtc+fnRwFSFdCD42iC2/ti1/5k4EyEEd4r09gLyqVQ00KUbcSKMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061582; c=relaxed/simple;
	bh=37ntqnYxbt/tnoGEfVBaNuji1qCkMWieDHTWp7+jFXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ajqr2/pGXtZ1NDw8UG/jmGGP4HLInjZ/ZAHbbjLhdlDBUlGJJ29N1QjZIrb8Ka7lld6SnzY0yV7kI2OuGOrC0eYRNWjeW/JD+gAUHt0gs4r5oFV9rnVwCc2F0qWm/gzkwkZ3mRacHCKFzneFUAX76FWx/eKI+8VrC+zh7moqjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKTbSHwo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewhgPXPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4if302785889
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9AXyPY/o/ozfLjxbr26E/dTeHhi5BgDJRfDxIqtSHo=; b=bKTbSHwolqdvs+QB
	A1cE4zZOkumIOmhOUXJM8kZaGHsKgY68iu65CqxzoeKZ9eDizAi8hyFexSj0QFmd
	a6/KO8W7E25TXRq7UOMKTPXddTS2twp0CyVLR+JZAEOV+F8vn1x7OvJjIZab50yD
	6sSdPYhH4clowS5NRTdTrNTQhobvzhkXpkjn8oyZv7RLxYK+VcozvCTKapk6l+Ry
	mTIwdZHj9guDC7wfZfXK4Qa7mcWXXKqgTqFgmYmVrYwB7NVewv37vhHOw2FqPgJr
	wnS6GSssisgjGkwwNiCGd2azN/4NtFFrb3XHenfLswdeYyTUjIHe1UIPkBIT0mrc
	eq+UIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpbr94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so5479280eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776061580; x=1776666380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9AXyPY/o/ozfLjxbr26E/dTeHhi5BgDJRfDxIqtSHo=;
        b=ewhgPXPYtgDQyfgJh8hA3ddedjC86ex6K2u6wXUFA5cPzKtdcDgFe9uG4w/SesjZNN
         /W2RrtWnFiA/2cWuLC5fo2vb2gwpgsnkPT5gnobrClub6+3zkLYjt9k/gSPbjHNoCqNo
         tZGH8c/AIem5j7rjvlRW90qdjnQWPUXH0fNjgV601r3DM+VGaOg1BqMOQw559waQx1cM
         YDkXQoUBxMujT4K586v7AMBxghKghprp4R6AsHcXW0onKajTtXm7BcQUV/SPWjDS7BRM
         ROuMoKw0Ah+MI8Gajh+K/UDQSTw1nkcQz6PgMjmaQOLREeiJYtcGtfAs3T665IrK3/gA
         kDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061580; x=1776666380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9AXyPY/o/ozfLjxbr26E/dTeHhi5BgDJRfDxIqtSHo=;
        b=eaBh20HV4P48+oYQlYRRXvQEtNciiS+TdHk9fwwqt6jxlx/xHjB1n+bynkVNLhUpP3
         Rahn9OVfMkgL3t8KbBn8wDUAL3M438gzNDhVnKBb0rEWpgMZ1Mz6S/G95Xk+uiNtC6E3
         IBVqnTWOx2NEizGB5etvcd20HEcWG6FabeRjTCh8vPPo3cIMtQo7bla5jJON8FiEW1Hu
         IX0zwKn7ea6qoMib1Mugb9Yt5/JBJcFZtOzmxEOsKUhwRT+aFIneoZEa0KFFHRB3QN5s
         QybOhI8grY+h603/16b6jYLi1NGFNgsMpNak1zZwHsnpVj+xiESiTWVm2gD8/BMyrvZD
         kcfg==
X-Gm-Message-State: AOJu0YySLFzIIUsZIif/Bom5eJNMP2Esy44FYF4mL5iHcIkbFiE0rOVJ
	ugzfHMWN2Zs41wmwGrZ4VJ/CrjAmAHJsC8JHvSEWcvDdeYbG8UPCzCcXK5SNEY0dMapnrwQsdIJ
	e1NnXe3kcp0FyDbhzt1Sm3ktSk6VpZ7uFlN8THUbr2wPuTHJuYUIFgJxkYsSIt5x5eyT7
X-Gm-Gg: AeBDieuhoy2VantsSrtkQLCRPtY+QeAh0uHmmjBvPOyb9/58v0BhiXxoL8wPddroq/N
	vWJXGiBs9X0pt8R7454h8fI2sQGyEmpn1p8Igq2ozRkGLRWY7VKVVfVokPbV2DRSqvenPaTdRmW
	8llVb85LMp/T1gyuR3SdXdUQyDxA/t6qOir89X/KO8hyODKrw5hKKCX8rlKhBqaoMQSvO8K03sx
	09deT6ITOo07KpIQvlvUcxMwTckRQVwbnp1XPoWxmGNL9X7DWGD0dzcvMenF3yhP1u6Gwq7VieN
	gTQVJCKQbPfAe+psSWn+boSnCP9mCaXn4UKvxMti6FaYcrz64bmEyu6kbqgz+I80BLb4BhPUj+k
	VDppHBUN0tMVZhXn3HOLSo6UGabObcPi1zzimVxOJtGz1AH6lEu3+/xWw6lK0V6A9EDqe
X-Received: by 2002:a05:693c:2c96:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-2d58945c9b1mr6043575eec.19.1776061579821;
        Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
X-Received: by 2002:a05:693c:2c96:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-2d58945c9b1mr6043560eec.19.1776061579289;
        Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm15260935eec.14.2026.04.12.23.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 23:26:18 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 23:25:56 -0700
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
In-Reply-To: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776061577; l=4060;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=37ntqnYxbt/tnoGEfVBaNuji1qCkMWieDHTWp7+jFXY=;
 b=h6UmKLAVvuw2ViAHtaZJ0N1KEw+2AZsfRlJ6f9XTCia8lln/Ov2M9UD4AHf7YtyeyzuSzL85A
 4Rk+pFMhoSpDN2CMzdPm2prdQeo1NHPSOE4T/BZqD8B57IpE6RgiG5w
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dc8c8c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HOj_8Gw7N_1wnwFbGYcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 9fU47nQ3LGDCjZ7J3OELO0N1fVmjyzpt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2MCBTYWx0ZWRfX+oWyWmkT1OCF
 QJMN0YD1bBQycFXERbm0bDBiOLdy66KtcIpu6/98Pq2S3AOfhGA+xiIdARF+l12UhUtfjhYKna2
 KK37CEOwpeJM3mfRijzotG9U1QwftLrmaMxgO1RI3Wiy4kYLld67YrFMi6HMWQxM7CpMiECdePo
 MfVzInIsNWlIzcYzW7MEODsYUJt0ADx7Cny2Uru4E8B44+9yEpdtL8WwiD5r7/eFaWgVFsexWXV
 fue0M2h3I4wAVQARf9vvjhGTe7nJcl6+CfUY6Ju/6kvmzDU15rjCRiVIE0Bh4V4edQkcYrsvkoq
 jrK5MVcWU2sn4jvQiD+bH8Px+mIwffL3BFo0KEWPq9L02Py86NCAUnEXa+yNXnL1LVR28PsNw79
 wSPvpqK82f8g4/Vs2sY8bUr3SClTIC7lZd+1dUnfOV7ZXJ6M1HCYap75Q0KqdbL4JI1vfZaXVMG
 hLRfgmwpBh5DJaWgdkg==
X-Proofpoint-GUID: 9fU47nQ3LGDCjZ7J3OELO0N1fVmjyzpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102874-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5BD63E7BDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:

1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
   4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
   follower to form a single 8-lane PCIe Gen5 interface

In bifurcation mode, the hardware design requires controlling additional
resources beyond the standard pcie3a PHY configuration:

- pcie3b's aux_clk (phy_b_aux)
- pcie3b's phy_gdsc power domain
- pcie3b's bcr/nocsr reset

Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
8-lane bifurcation configuration.

The phy_b_aux clock is used as the 6th clock instead of pipediv2,
requiring the clock-names enum to be extended to support both
[phy_b_aux, pipediv2] options at index 5. This follows the existing
pattern used for [rchng, refgen] clocks at index 3.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,glymur-qmp-gen5x8-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -68,20 +69,27 @@ properties:
       - const: ref
       - enum: [rchng, refgen]
       - const: pipe
-      - const: pipediv2
+      - enum: [phy_b_aux, pipediv2]
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: PCIe PHY power domain. For PHYs supporting
+          bifurcation mode, this is the leader PHY power domain.
+      - description: Additional PCIe PHY power domain for PHYs supporting
+          bifurcation mode, used by the follower PHY.
 
   resets:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   reset-names:
     minItems: 1
     items:
       - const: phy
       - const: phy_nocsr
+      - const: phy_b
+      - const: phy_b_nocsr
 
   vdda-phy-supply: true
 
@@ -183,6 +191,7 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,glymur-qmp-gen5x8-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -201,6 +210,21 @@ allOf:
         clock-names:
           minItems: 6
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen5x8-pcie-phy
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
@@ -223,11 +247,24 @@ allOf:
         reset-names:
           minItems: 2
     else:
-      properties:
-        resets:
-          maxItems: 1
-        reset-names:
-          maxItems: 1
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,glymur-qmp-gen5x8-pcie-phy
+      then:
+        properties:
+          resets:
+            minItems: 4
+          reset-names:
+            minItems: 4
+      else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1
 
   - if:
       properties:

-- 
2.34.1


