Return-Path: <linux-arm-msm+bounces-108594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DCWBUq1DGrClAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 21:08:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F558407A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 21:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E030306BAB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA2D2848AA;
	Tue, 19 May 2026 19:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6b8drNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkyLd6MB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E23AFD0D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217525; cv=none; b=XTHtIGT/kuD0M3JlXw3fPMDJkjHEAAzuaqAEqqap0eKD+HJ416vXpm6SwVoVFxx29lE7xq7YLuv++khswuqyUBCecxmhj+mh+YqXiSEJWqKiBKcb26f4QW3JQOY16XFeSnNygsOhPzpDljmOrSuOWfyFm1487UQzCIVnQdbiias=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217525; c=relaxed/simple;
	bh=FswLjexa4W/19cOLQDCspqJYNyI5kjTklXut13h725o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeOVlH5vaGHhV7mOjpgSlOuWTFzfBoplYb6mm79mR/ZVeJ4BbC3jIpMMRt8mPC1cjJWuoCNXUv8KaroY0PMb5HVLmT63d/vzhbiK+iSU15T4bCIv7qEilCxsAYOapGG0zOUN0oWYE+GuZ5jhvGIn17/uLaVhKSScpIo9vdlmHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6b8drNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkyLd6MB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx4am2867811
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHAPpvkbvRI2RnEglKIra6lXC/2fx7JbZmYyoLMJzkg=; b=Q6b8drNkWgalir8q
	qSifjUkbQahQkJKS/9lDriMXkn8wZnsz2aGwTUyi/VwTIhr2C1FrVyAMA+ipaW/d
	6AYFlFl28LHF1D9gPEJ7r8zTwOitRT2hDn97S21/l1zrnaHpE6F31Idgb5i4obke
	EcyQO5GCWeJglRQGCT/d/VIVrud6NdBZ9I3EIoAG3y+DGygCUbcldfFwdH4pQmIJ
	NPHHFilkReR8fs8T/Ncd/uLNIdObCRdGaKuNxbWWg2uzcOE4EJgV6kwp3ggUPOrf
	osZv9xxULK+KfEjxnXj4jzC+IHr9L/OfqevTcnxOPYWgo+upzWK+vGJvfMKKOJS+
	4FZDCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3w92y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:05:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c827bda3052so6246485a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779217523; x=1779822323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHAPpvkbvRI2RnEglKIra6lXC/2fx7JbZmYyoLMJzkg=;
        b=XkyLd6MBys6SpwD/3YdJErNtOAuoZp60mSiWQkebEfJ94bIp+pTqQyOkUppf5YIy9/
         GRBJY86qSeLSUy9WMBeWbCm8mDF6KibGCbWPSKjol6ki1F69whHvwIVz73dQgW4ZviZj
         4u4ifbXmf4R36IQCxeJzlaniw/iwHlm+tfWjpDGlLplGfdmfipIGZaQ+boX4tjv0fKGv
         7Lo9y0/iwm2OaKxzo1oz5cN1x0c/Pu4uqb2+MFVTbql1AW0AEZ0tQ/rf68dMARSseAP4
         J4JNyxX23JbKWtIw1gGGn/wn8C/XGW51GMN1aB7zfmcZKIsBXxsd18HouV1K1JsvWO9v
         jngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217523; x=1779822323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gHAPpvkbvRI2RnEglKIra6lXC/2fx7JbZmYyoLMJzkg=;
        b=FfWyklrNe+2l4D6SLnJkxEOKq0PXJ1zArkPybOrPtFBq9xACYEb00EwJWQPzAAE37S
         XjI3n8Iuk/e5CEfA1vV8AlzwSHi1W2PEg1neL1kqNR5uuCOS4pD4oKMY5HSeQLMwDm58
         c/oid9C6+hU2muT7y5mUgb0M0XFbv3bXAGbzvrmfkwW7x8+E6xs6SKtBUS9nT6iaOfM3
         pFYFMaRu7xqQauNnPL5MxBFS1+uJDa1mfIZmK902hWhrr0Ib8up2Gv8WSYVQHWsp/OgG
         EuuBLc9wT1tJZs6ZAxBWhk9hI7QyiCwQHGQ5gt/5Bs3rI6EIwJYge6hP3bEk7F4ny16g
         DFrQ==
X-Gm-Message-State: AOJu0YwGnfGOUL16xDDuEkdIup8YGwNSKHM1UGXPt4KDMvIwIxWtlXTH
	DK5iLMfxa9ASU8DU674RiF2Fejf44mUP9LwGoLsQtR9jdELgfYvGxcTU8Cv+YGjzkTJZD6r1RlO
	BGXq2qbrbveOj5giQkMz6EwigaFzdpeoIGq38TyFgBNUmVwQ/A5GrxXTNrqdLK08UAYwr
X-Gm-Gg: Acq92OGpWJRi+BsCCw3HpBlh+Slgxgx28R3I8gtHYu6X+NDp7PDrKfh1BKUs6+pygck
	y+piU90FvoMVVoUlE6R6Jsy7AWJMnY0EAkvULHfM5BbqCQQc0Kd5IaFSKgyvi9aDNocvNA7juE4
	VAndbba3FQfEAcLkJncSCsJ3DaI5/QJx/EQmImzDpORdlhLumBx0YNW8hnAoqSjm+mFjKYSnOi1
	GFTFRJIdN6zQ19V11t+tWYhg1OCqLc/xtxRMVKhDeiap/9sPQVpxUJ7LlFFUTlRuBgA09Y9TajE
	o80DxftzmBypi+N3G4RJFBJXIj9scP4COfCttIffUlacPhZuYEK/Qbz7qkn2PrKbDVSc+IoItei
	v6TqIv5pdhQ//rzrycDD1RM5A6eb1c1vLwOBciz7ut4SxdpKohpIVVMkPStg5IFlfAmX0aIxFM6
	Sd1E9DOjP+PWl8pxfD4EGDRZcn/oZFXrNGOwfTqex9Dnt8lToxQxY=
X-Received: by 2002:a05:6a20:9188:b0:3a2:e089:ae56 with SMTP id adf61e73a8af0-3b22ee36135mr24018342637.52.1779217522701;
        Tue, 19 May 2026 12:05:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:9188:b0:3a2:e089:ae56 with SMTP id adf61e73a8af0-3b22ee36135mr24018308637.52.1779217522069;
        Tue, 19 May 2026 12:05:22 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19794e6esm17423401b3a.25.2026.05.19.12.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:05:21 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Date: Wed, 20 May 2026 00:35:09 +0530
Subject: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power Management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
In-Reply-To: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779217514; l=5161;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=FswLjexa4W/19cOLQDCspqJYNyI5kjTklXut13h725o=;
 b=R/5ABYELjlk9wnZSNkHlXqO9inFOaDo6atAm1JPNGo2b1bxoEK8e21KAIv9zuc8/jpap//BlT
 kOHtpjS8SwAAsG92mxeQQh3I5aLQaZRx85GVpGmQrV5W3+HNmLHna9W
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MCBTYWx0ZWRfXxqI2hpFmnqzF
 TozlzlgzOBIDX7nPTNwG/0j59Y82jMgTlQdUri0FpyimEa4kDm300hQJCLj1C/y4UfG8wWnDLS/
 lGruvp+QB7FX5st2vgwQs9gnvYYCaeXy3dcjRxfbIUXCMN7/Nl9DHoSkAQ9I/5A8Y3FkNcpongB
 JXPKrW6LchN7xMNeyNceGvoGn03gA2xtU1HZViIGiQuTDYSUyTsu21oIp60Jyr6h2ivkd6Oo9ur
 FkV3MEZ81xlnf2Pixvv26pel9ceJp+ZpRIwOVqghQX7RaHqnwCpaeAbibQKgKUblu204l8TFHBz
 j4FF9F+gVjAjVabrXRi0YRknbwrJsiX2uPubbaz28MVICUg/nEAkq/fa7XYdeahU4OcvKYDMzR1
 P0f9Xf53NKFfN3ukgco1TeT4spY6DaCjdA4whW4Fg3If9e7J8BCwoclR7vYEdqy6O2cCmkoraEH
 mdRf5XBeBvEBWf7LyuQ==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0cb473 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=85UeY_1I7I5IrrPC5DQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: rUrGLiflK4k0eBJ78RSS4eGe-32o6tHR
X-Proofpoint-ORIG-GUID: rUrGLiflK4k0eBJ78RSS4eGe-32o6tHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190190
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108594-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,4ae000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 734F558407A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for the CDSP Power Management driver, which handles
Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
Power Mode (LPM) transitions via MPM handshake, and provides virtual
regulators for the remoteproc driver to control CDSP power rails.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,cdsp-power.yaml         | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
new file mode 100644
index 000000000000..f0f89fdeba4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,cdsp-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CDSP Power Management
+
+maintainers:
+  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
+
+description:
+  The CDSP Power Management driver provides power management services for the
+  Qualcomm Compute DSP (CDSP) subsystem. It handles Dynamic Clock and Voltage
+  Scaling (DCVS) requests via SMEM, manages Low Power Mode (LPM) transitions
+  via MPM handshake, and provides virtual regulators that are consumed by the
+  CDSP remoteproc driver.
+
+properties:
+  compatible:
+    const: qcom,cdsp-power
+
+  reg:
+    items:
+      - description: MPM (Modem Power Manager) register region
+      - description: RSCC (RSC Configuration) register region
+
+  reg-names:
+    items:
+      - const: mpm
+      - const: rscc
+
+  interrupts-extended:
+    items:
+      - description: LPM (Low Power Mode) interrupt from MPM
+      - description: DCVS (Dynamic Clock and Voltage Scaling) interrupt from IPCC
+
+  interrupt-names:
+    items:
+      - const: lpm
+      - const: dcvs
+
+  mboxes:
+    maxItems: 1
+    description: IPCC mailbox channel for sending DCVS responses to CDSP
+
+  qcom,smem-item:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      SMEM item ID used for DCVS communication channel between APSS and CDSP.
+      This is a platform-specific value that identifies the shared memory region.
+
+  vdd-cx-supply:
+    description:
+      Phandle to the CX voltage regulator. This is the actual hardware regulator
+      (e.g., from MP8899 PMIC) that supplies power to the CDSP CX rail.
+
+  vdd-mx-supply:
+    description:
+      Phandle to the MX voltage regulator. This is the actual hardware regulator
+      (e.g., from MP8899 PMIC) that supplies power to the CDSP MX rail. Optional
+      on boards where MX rail is always-on or not present.
+
+  regulators:
+    type: object
+    description:
+      Virtual regulators provided by this driver for consumption by the CDSP
+      remoteproc driver. These virtual regulators pass through enable/disable
+      requests to the actual hardware regulators (vdd-cx-supply, vdd-mx-supply).
+
+    properties:
+      cdsp-vdd-cx:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        description: Virtual CX regulator for CDSP
+        unevaluatedProperties: false
+
+      cdsp-vdd-mx:
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        description: Virtual MX regulator for CDSP
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts-extended
+  - interrupt-names
+  - mboxes
+  - qcom,smem-item
+  - vdd-cx-supply
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        cdsp_power: cdsp-power@4ae000 {
+            compatible = "qcom,cdsp-power";
+            reg = <0x0 0x004ae000 0x0 0x1000>,
+                  <0x0 0x26018018 0x0 0x4>;
+            reg-names = "mpm", "rscc";
+
+            interrupts-extended = <&intc GIC_SPI 65 IRQ_TYPE_EDGE_RISING 0>,
+                                  <&ipcc IPCC_CLIENT_CDSP
+                                         IPCC_MPROC_SIGNAL_PING
+                                         IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "lpm", "dcvs";
+
+            mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_PING>;
+
+            qcom,smem-item = <503>;
+
+            vdd-cx-supply = <&ipq9650_s2>;
+            vdd-mx-supply = <&ipq9650_s4>;
+
+            regulators {
+                cdsp_vdd_cx: cdsp-vdd-cx {
+                    regulator-name = "cdsp-vdd-cx";
+                };
+
+                cdsp_vdd_mx: cdsp-vdd-mx {
+                    regulator-name = "cdsp-vdd-mx";
+                };
+            };
+        };
+    };

-- 
2.43.0


