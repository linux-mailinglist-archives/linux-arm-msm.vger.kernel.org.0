Return-Path: <linux-arm-msm+bounces-94395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPYJAPk2oWnRrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:17:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6981B319D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 910D6300691F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608633D903C;
	Fri, 27 Feb 2026 06:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRNHFoC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxAQFFAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C2336ECD
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173014; cv=none; b=T4dJ/OMMfYzSKPz5nFNkZBjMDL9LQLF+GdGFIm8jFy2pEVPFLD/ZlJCDd0xS7kG6qYAkf52A3L6abdWnjceyV1JwxdqxwdOjfyLQsb5J6OyxqEALsM7xqxuGvQmQMXlShnlxYJ8oziQqSS/vZJw1XEtd3wzBeoQptvHVB1xY8Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173014; c=relaxed/simple;
	bh=fLcHXdKV5/hDu2wr6i98ZasPwufFwNkdfF36wyuIx94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jf0KBI9L8i38zsPucXUdX2QFb9d4lFl1c8RTa0/dZ1fNx0BdbiuqYoJGQ9MMoXJxP//zdwvwQkc0foYkJOe3HK4lQ7UIdiKveY62GA+loDSo4etKOWKGRAip9lVpCl2LYlhGZTvG+v5FTGHn4MIuWqYQotIUzEoAidWtBqMJrzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRNHFoC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxAQFFAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K1Ks1620051
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cbpTgWXazdO
	AfAdL49uExcjxZu696DCuIHbDLPHFMMY=; b=dRNHFoC68FeCvWKWNf7RlsJlegv
	kJYv71UwSzSRn2CKIqGriB1k7RsPYyUMPbWuUfvQY1x6yRWAP5423gb3qydPRIpF
	9n0WkqGTghcQbqDHsC3jDiyehWpcO7YkJvaLiHFVLF03qW+D1soiJ7WRJxr/2s3U
	GZaMWYcxh2puxasX1skLwh4a2RzACeaFKkH13eQCwNgDyiXDYg+y6V8LvGgBbc/U
	F1ddcjyUs/o5vSuW1JYFmJF2kF7R1P54HOW2LkU+6XsF/gTkyd4ocBJAct7/PvQx
	BeliUWSGdGTXewgUjeG8tJAfn4yzcN364A+3aXjM21FDvx6dCjnoWfjZ7Gw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjn0x3ek8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad6045810so16916185ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772173011; x=1772777811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbpTgWXazdOAfAdL49uExcjxZu696DCuIHbDLPHFMMY=;
        b=OxAQFFAAp8QIqebka2GFEFIPOir/hGQ/ntBJn58Lu6sSqpp43ODsFb0BIK0pPxaggY
         jLZDz2XAimGvaR8cbGIR6Wu1PWC/cmv7U8Nuhtn5JY2+mG/8T2ekwoR2Czcs2lGk/lag
         x2FzYAC6kmq6Q0Ll+1/b4vlIDKGpupMKjc9XdfVHSa+CkowoqQBC/id/GYxNo3TNp/Cf
         qkDro5QLHwtR5bMqcOtZcV2ItGLWmSYa69TdHCMPCFR3gead/rxsdKbvXd2f++Mea41G
         w/So+gdgbrV6SrH6IR5fTWdwUv9dtYrcobLcQgSQn8hKTCJX0eT9xoS2UJDkCKKKKIzj
         uFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173011; x=1772777811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbpTgWXazdOAfAdL49uExcjxZu696DCuIHbDLPHFMMY=;
        b=H530SS9hJ9QNVK7pPbXIuHOQsOmEih3Z1BjpxX7pgSx7odID7OCC6PjV90n7f5V1Vb
         UJhq6jDuJmZfcn3tMkF0dcGGZb/TVGUVIfCvuLIZtnAaDpXnwNBORLQYjoXhQRh+2P8E
         kcVOsZDjjr1HeXzLRi3VpDjpRanc+/vGtKPITMO9UyPKYCaKcKI/1t5MSUJzXoX6KY7a
         SMtKgCSR5NqG3RKsJdF9k+EIjCa80DOsIv7ZhBFHlkZ3rHT2jX01HlFHtA18JJKj53yG
         HdxAtR/D59UXd+qn3O32c76J2lMvKWd0c1k+u+U8IUSsuUVAaFrM+I0pvu1B1cBXpZQ2
         WyXA==
X-Forwarded-Encrypted: i=1; AJvYcCXlzaI5RTG1Y9gN3PhWt3/MTKah8OpAwrMPdm4WfAecs9RCcWMBUB+VGPK/XYnEwNki0G34aFcR4V56sk1v@vger.kernel.org
X-Gm-Message-State: AOJu0YwmNxsg6FNccYNf3Tx64rfN6H+cYRLFzFZ23VcqE+5NBCc+osKM
	CjGpaAnKWV41GJ3SWEs23V2DTVkNcN5OMyS09OQ+zNhHo9mx2tGOYy5a/a06M5ul3Lrspicg6op
	u976HvuQgyVYiOKQ/5PIEzhU750HsTgSb2o1TJRRzclMvC3fr0abYq1XABrYTwksooOjJ
X-Gm-Gg: ATEYQzxbWA19yEnnFKr+ubwRXOw78GuQk+LTUTWBk+YA+WL7bktERiSgYuHg5/sf+GJ
	ytdUjiEvG9WNA7Kw8NzG85gsUulqxYHc5LiyxIfNJP8CK8uuWLYpCBC5e/z811OZe9l9CmrcF3M
	0JOcaYK+ii6muTIEPN+7lEjtMpC3SNvOjBP31o3XNIEhYPfO7d4dMyS6PmpUScA98BOxSiXstHU
	QQaGpjJntxl4EfSfLl2tfJYjLTA1ywZiMi1VDP/+oNbIYOJSxdKW3eMKPVoTQIQfUBOjGjVYIMx
	5zETm43N6qSOYQRMbIRktZNJN6JKqHq0/UqC+dzCERDD7BQtpvW/6gjPv+BCvIW2fWKzQHo4cNW
	RQ1hsS686RtD8e6hmlUESuhoeXhgOdllla+yZ+R52pmo6GQWDeorzq3c=
X-Received: by 2002:a17:902:d484:b0:2ad:ad52:3670 with SMTP id d9443c01a7336-2ae2e4d9617mr12245285ad.51.1772173010754;
        Thu, 26 Feb 2026 22:16:50 -0800 (PST)
X-Received: by 2002:a17:902:d484:b0:2ad:ad52:3670 with SMTP id d9443c01a7336-2ae2e4d9617mr12244945ad.51.1772173010208;
        Thu, 26 Feb 2026 22:16:50 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:16:49 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH v6 08/13] dt-bindings: i2c: Describe SA8255p
Date: Fri, 27 Feb 2026 11:45:39 +0530
Message-Id: <20260227061544.1785978-9-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: arhRGr5RDsYPdIug38HQfHXvjVW8Dobj
X-Authority-Analysis: v=2.4 cv=I9Johdgg c=1 sm=1 tr=0 ts=69a136d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=apMzWF-kzHp83YoYYzAA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX2EhquvOzL6GU
 z8uYwphuokEjzdfzpC97Tqe/8haIaT3mxPSAXPpYzN9C9eRTg5HGIG1dhY5WPoZ+zL9RdLqyHWu
 zpiBGkU5j9Z027ovu+x6Q5H2iu5wf9e0mmRbjvGvvMWnSlb23M0ip6L03Ku6EHDChfbJYykYdqo
 mzAr+iNzOIYxKX+0EtwrOT5SZR/8exQYvCP2QDjaZhT9JspA+GviccVod1OT15r00q5X9nl11N8
 PGgyOvv3EgRDNvazGuv+EniEy3RW2eqD9q2O+vv4+cN0KoX7Q4GBcg9au4SYGGkgwqP5Lbg2pdb
 kZddjL6sK4hyq0TTKFCg+7rwsmY8Wtl3Qh4GyI7XKB8ZVsW33SbaejZmcqgYHX+/2aik8npfIYf
 do9OMv9+ZSWpsEse036ScZju+XAFY48UcepOdJL+Jo44k7JFlCZ+teOuzUMapNVC0TFFHHfsgX7
 qOoqxp0Iq8qP6uKMSiQ==
X-Proofpoint-ORIG-GUID: arhRGr5RDsYPdIug38HQfHXvjVW8Dobj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94395-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,a90000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B6981B319D
X-Rspamd-Action: no action

Add DT bindings for the QUP GENI I2C controller on sa8255p platforms.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocol
are utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Added Reviewed-by tag

v1->v2:
Krzysztof:
- Added dma properties in example node
- Removed minItems from power-domains property
- Added in commit text about common property
---
 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
new file mode 100644
index 000000000000..a61e40b5cbc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p QUP GENI I2C Controller
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-i2c
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    i2c@a90000 {
+        compatible = "qcom,sa8255p-geni-i2c";
+        reg = <0xa90000 0x4000>;
+        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+               <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+        dma-names = "tx", "rx";
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
+...
-- 
2.34.1


