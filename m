Return-Path: <linux-arm-msm+bounces-112967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5xLDOAdiLGoHQQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 21:46:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DECB67C2C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 21:46:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MaHvfdw+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jvyX7jS5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112967-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112967-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A16733CEEC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B407C38E8B2;
	Fri, 12 Jun 2026 19:44:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F4733D4F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293465; cv=none; b=qyLl2D6rYMbN6aKjemDONv9qhoJSH7eYGTJ6C9hRW0b25/k/Vo9mq4d6uKADlGA4vIN3ff92WF/XUJWczHz1FkiYHe+UAnO024nVkaytZdr1AP7XZsKeE/A3KKI10Sp79CBV1Goxy7UMwBASDiUyhWsvUrqXM8/C7cguUjSEKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293465; c=relaxed/simple;
	bh=J9o6uiC3hi8q182stCHjWKLIz7MjXttP7UeclIVpQzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HC6egrGQwFp+MnFfNOEgh9lAzQqJIo3MmrYpZECgNK3Id6UKc3MO6zeRbigh2Z7Ev1VT7d/lokWssfuVnWPknBoW2mrAEd2pvVzPshAmF1ly4FdwP61OCIDsaDL7evRb3L8JsWQCD2wRhYPSQ/UgI69GjRaC8fR+eHwX01ulReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaHvfdw+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvyX7jS5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CJFvqr265824
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQY8vaHCT+s
	6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=; b=MaHvfdw+R4kWe2I2ygXJBk4KCr9
	jmv4LGOcAz0Mv+G9qGMxhpHhjQe+8Goc8zzg4db9SjCrCjsg7AhwHuOuNPf5Z1Ni
	T5p1Ua/OhfJoMw6e4+nXKqA3GA9auL+W+1AOiGzq8Gx7QQZGCa5zo+lxno7QIDlI
	7R+S+Gecmm1RqEIVN76tzNe0apH/KTaYCtihDRxDLoBaWAei0eRMqVJn57RDYZYd
	DOkfFVQ6LiYTM6R25Qc3yuFMR4xw5cDendEPbtM9U0VTXHY6zwu53I515+bqrsKi
	pUOtsCbP6zkFZXiEAWNCF8/gcM1vg2ztfBKmk1LUn8XeHEvvRN21qu4BJ2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4err46r2vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cea98a0effso28558106d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293462; x=1781898262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQY8vaHCT+s6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=;
        b=jvyX7jS5VIqz3CTpBGqm7xmrwoq4TEh4/Epk1U696tX027zGcWz78Vk+WXJB3GS7hc
         M5XeuTCI/zTEJuUmuV2Zpp2SDEfNoPmwEV4ONg9Doq3p/YgWKpJMqFgUrOAXcbUaCEhl
         wofmPnMdU6JuHVaDqpueYQpmjLr0v62IKdTI2GcymPrOoHBc1oCQhMs5bKCA/Tl+SoLD
         5kUnM5Jbog78JVuup+vIeKfoWlrRyOOyK6L1axHA7EWWZyw9V4w+hRFNWOfZR9+7IYlA
         kWjIe1nSDYq3z8xCcp0JMEhEbIp2SfAY6rR/mAdQkN1HYDtgdsSGMJ3t5wzplBeQo6+P
         wJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293462; x=1781898262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQY8vaHCT+s6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=;
        b=s0qnwxbkxhc/flJ9XVTss00jtn1fha/RBDI1u4ifvh8/Vn76LekufjHWFAWOkoAVtq
         LlrXVYSjtbItHJXSUgD446gKH16yasaoMxC+KAqb+NLIKk3QWMLKXU4qLFDrk5U+34vp
         0faQHSijJFNJvteWd2aT+tbJDi0o9YIZuu1nvHWddjwqK4pBUIcdhlN+3JRR1jkngevJ
         ORiqQ93WUk9kUVMjkgkfyelk2h1VzxlLGH9wgA+82Vc2tZUWGPzpYozWjFRJLztatRg0
         gquQ4c8gW7e9K1Ltyr0RCTMlOCONQc5fFx+FhnmkbkJ64MHOOX+LPQHjFUcklu8AEdli
         OtcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DE6VnrieTLXVQt+yqiHuVIMBDkJDkMwmPD1s74A5SWyFC9iLB4LbB7+HpnFZ9FwMToQC88K3zA6PXZDwf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9g0KhK0AeLU6/8SzemPwcE/A/0y96RERiwySpArpYnfIGlFlE
	4/pvVCH3vq9DIQQi1xNZuoU0LHcrfp+CDxHBXZgOogtIND6KKVMXM3eSsI8W4qOQo5ILGsz5zra
	QCFQkNS/tAxxGD+piWdxpOUXf+9dUt/sWAEVYNaJa7XQJ3+J/NpOUoVUa4RgA4I2iO1/X
X-Gm-Gg: Acq92OE8iCekOkEZlmUiV2+1uNEiCcpz0Ckgjlli6G7viHzkhuCuKWtW19seazlTR36
	gAj5GPRV41cMqW4z8T/UL9vM5Jyx5Dr6it4xaJBvPvaL8J6enYx2rYie+Tf4QxhZ1CkMLWfldPr
	5knND5akoV2x3PoUQIBoZ3mRmr3bqRViT0ejdtmq0+KxP3NQd1kL9DRwgYFHaZyZgGe3R0yhYgv
	3OYZkTQ7JVIURDyScNwAK4SXLt4c9LBwcMIoIGlVGYINkVcd1+54ZlODWEp8na/bQKuos++AUYC
	FpI4c1Anj667cZbMeq6t1inNXhrvMpbCoMvJRJfdAJdzaiaJU+AtfIQqMZinRW0S6ToGddjAPqC
	uJfKM0nPPvmAzoff67Fbiynq3+HHgJn9th1bHbTUnpqJRTQ==
X-Received: by 2002:a05:620a:4152:b0:915:70b5:b204 with SMTP id af79cd13be357-9161bf58dc3mr589395485a.54.1781293461674;
        Fri, 12 Jun 2026 12:44:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:915:70b5:b204 with SMTP id af79cd13be357-9161bf58dc3mr589390485a.54.1781293461248;
        Fri, 12 Jun 2026 12:44:21 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:20 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Fri, 12 Jun 2026 22:44:14 +0300
Message-Id: <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M8N97Sws c=1 sm=1 tr=0 ts=6a2c6196 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=8hwD-i0G8y5I-v6eKTYA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PpwVwhE05GG_AjCd0baJ3OrgcPx1csw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX5kn4mlMDjUR9
 bqIFXkJpc8I0sqQlJKZ0+MIB9jDnW+Ij9QhU9ew5WW4LeFtXsZMKMdzDlsuh5ajNEZfVZHHrQOU
 JdtizLYxRGg9N9y8wBpZXzRa+ZWA+nlNAH33dD3sbvEEJ/RdT7Jt3QgBnJN1C23bcwLQ2jHnr7M
 myHPl/MCom/Doy6nvNjIiRcixQXv56pVlj28sjoEJLwnxn233E2b7pScBaHneHBABeZUmJg1RzQ
 AF1otYYZbcMvsybKxLhzcwvGtVKTr29Xb+0zjhG+iheJPDEM6ruuCO1GnqIlVnWH/UBiRzG14jp
 mYHReMZjcSzhk7FLhyDsASfQDu6N41LHEaNLnSV+p+nHlTnhbA584CK1hQtw69oPJfD4AM3tTbb
 vQEoHOP62FFJq+8P1zU1S8mA60deuYhn9VqOvNAFEj+aLyAUgG39InC/6FUAyRo2nloO+8/5k/i
 uoRv1jYGW3RT7e4ZoEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX+L8et+4pBFhN
 4QV2n9qO9wyqLwyM+opEVuJmWnowvlEPn2sGnr1suI1/ma8dzW/Z3c+PsQWDxuYGpBBPsh20Mm/
 o7wcJTikPZ0faQaoq+5vueJ7RZx36EA=
X-Proofpoint-ORIG-GUID: PpwVwhE05GG_AjCd0baJ3OrgcPx1csw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-112967-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DECB67C2C6

Add device-tree binding for the standalone Qualcomm JPEG encoder
hardware block (separate from CAMSS media pipelines).

Document required resources briefly and scope initial support to
currently used compatibles in this series, including SM8250,
QCM6490, and SM8550 class platforms.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..83f19719a869
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
+  - Hariram Purushothaman <hariramp@quicinc.com>
+
+description: |
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+  The JPEG hardware IP version 4.2.0 is shared across SM8250, QCM6490, SM8550
+  and related derivatives.  Platforms based on the SM8550 register layout and
+  interrupt wiring can reuse the qcom,sm8550-jenc fallback compatible, provided
+  the correct register base address and IOMMU stream IDs are supplied in the
+  DTS node.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qcom,sm8250-jenc
+      - items:
+          - enum:
+              - qcom,qcm6490-jenc
+          - const: qcom,sm8550-jenc
+      - items:
+          - const: qcom,sm8550-jenc
+
+  cell-index:
+    description: Legacy JPEG HW instance index.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: jpeg
+      - items:
+          - const: jpeg-regs
+      - items:
+          - const: jpeg_regs
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: gcc_hf_axi
+          - const: gcc_sf_axi
+          - const: core_ahb
+          - const: cpas_ahb
+          - const: camnoc_axi
+          - const: jpeg
+      - items:
+          - const: gcc_hf_axi_clk
+          - const: gcc_sf_axi_clk
+          - const: core_ahb_clk
+          - const: cpas_ahb_clk
+          - const: camnoc_axi_clk
+          - const: jpeg_clk
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jenc";
+        reg = <0xac53000 0x1000>;
+        reg-names = "jpeg";
+
+        interrupts = <0 474 4>;
+        power-domains = <&camcc 0>;
+
+        clock-names =
+            "gcc_hf_axi",
+            "gcc_sf_axi",
+            "core_ahb",
+            "cpas_ahb",
+            "camnoc_axi",
+            "jpeg";
+
+        clocks =
+            <&gcc 0>,
+            <&gcc 1>,
+            <&camcc 0>,
+            <&camcc 1>,
+            <&camcc 2>,
+            <&camcc 3>;
+
+        iommus = <&apps_smmu 0x2040 0x400>,
+                 <&apps_smmu 0x2440 0x400>;
+
+        interconnects =
+            <&gem_noc 0 0 &config_noc 8 0>,
+            <&mmss_noc 0 0 &mc_virt 0 0>,
+            <&mmss_noc 1 0 &mc_virt 0 0>,
+            <&mmss_noc 2 0 &mc_virt 0 0>;
+
+        interconnect-names =
+            "cam_ahb",
+            "cam_hf_0_mnoc",
+            "cam_sf_0_mnoc",
+            "cam_sf_icp_mnoc";
+    };
-- 
2.34.1


