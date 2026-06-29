Return-Path: <linux-arm-msm+bounces-115028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y0v+AZZiQmrZ5wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DDB6D9F58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pfcdb+7X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gLO0Upmw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115028-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115028-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71C4930242B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016DC3DD523;
	Mon, 29 Jun 2026 12:18:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F37C3FF1D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735486; cv=none; b=DXdDZ158QqX4xdDGUJHXgE6JK2MJOj/VNVxn2t/rOe8/6CR5B5Yq9+H3ZV1uhZ0Im6wSfmQtwzK4gPPRHSo/0WgJagoIYcJXotcwkLQa8wut++U8+UfZedLp/jQ+JedgdPRi5Uvvn/swiOZIc4Woy1to99Ey/+qveV9td7wu/oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735486; c=relaxed/simple;
	bh=0osYs0gFrrJEZE6iCUGbkP1jDPBnlf/O0siNXKMpI0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ae5f8aJqQlcRKvyvQMAEl3tw3ZEDn2aobhsiUEUVu7i5Ba29dKnRcR2ERbuazVdNNqzzEQLwgYBFhxZJtS3kcHD9AwKmH5pTqOrCz5Wfqj2Hwzz3AUo9ZedDhJ2frGVq9b0eueFs3FTH7BEpPJMMCna6DG+RBJLfdjFgoDVNbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfcdb+7X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLO0Upmw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASwGL2603482
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=krgFgmnm5jx
	WmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=; b=pfcdb+7XB0KUiMWiu9eti/bl2Q+
	8p3YIugewfkH8kchyHD7q4yAOEAQrntgB7UpTDsDL0FirNi0SBdIpGx8rWrSOgUy
	STs4M/bu4wVaIWKl9nnkcFUa5JYAGsc2EPGuRT3Rq2GIXWkpjuLlSXmnuy30TEsn
	h77yYZUwiDXW13bXrozFyGsxuq4xqpMVHxup810Ub0RxkkbQoUGa6D0riqA6UIY0
	LqfCZmTQvMYGzo/hbHXqs0YsSFcRHJduClwnTptwbLsMfaV8eyw6kqoXauE3MF4c
	shTcyBKGMtu5mZy32FBy+U8EfqTQ7Dx7BJsQzUsMrZ6Y1Rwvmp3O8kcHcIg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88qnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbd3241499so2848457e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735483; x=1783340283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krgFgmnm5jxWmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=;
        b=gLO0UpmwFkRxQeuNoWYQe8TazXY6oxo2Qb/k6hGcoOS+twZDbx2htPXRY1lUwxwkDu
         J/bAEjRR2qnzE6eDFdepAbZhKjX1ogkiyPmNgXuIYXiucxMULUIk/wOhTdF08qzPVBUQ
         fke8YNIsY7ZNNnWrNjxCzeF09udi7hG+8qr9mHSEklhXoAcYg/3rlcfeG/4pyISr7TqH
         jkDAx22S0dhFZ6eC4TMfdB9K/2PhgclSmT4SYSWfhghbp3kc3GNm6QcbgzUqOjVTnL5o
         nL6/iMduJabu6WSGaFLPcuTh0Mj7Yp4oF55Ff7Saxx3LxerxavSAnKjU8u8/7s3XYHnh
         ytbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735483; x=1783340283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krgFgmnm5jxWmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=;
        b=bx7KalUNdmAx5QyBPCzWFyrdmUkAIsu1cJBmxSPJlHYbmzIvfOzk/uY+tjwf1Jwn5H
         cZPEJsn+uJmH5oGUPStjcniKScysXiGMj9yBEZKhWj9DXMsF+Am2+ccqPp/Cr7ZJ/i2v
         YbgV4DwhKAD5PJPgnTbsy+vbZ7HT8rb844I0Ty36tXJSlOHvmmuk+gOmF5leWSWNKSvw
         lJSV/OJQYl0KAaK5SGjwnQNKwH41UX+9GOnbnMgpLou+pK5kMxiRmHaUePi+7CEkuPU4
         BjQEp9dN8oN/6GsQGacFXB5nCJC5fYPVXpxBu48caZ+9/aCe5ZLpYWSjjSeH8OCPHmV8
         oIdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuJGg1c9zoDcUsnX7vcvJljKjWFGXPLheXq3SjOmyz3FC4YkRLkkbC6sJTGhgzRR2erbWQvzF1xObsntKN@vger.kernel.org
X-Gm-Message-State: AOJu0YzBZXfJyneVltzBJM9s3b7XNENJVpv32RO9Tfwrzo5PlIrM0+Ql
	XvFNKh4Xh48RVsmWQBtZh1ryP/EM3bCGYGnH4F7GsAduZHYc9eEybvVMv1c3QVFkfwdyORoKkUH
	wFxUHSvBwq2JarN5Ol3Z0s9E8hUfsrZ9bqQlXG/lJFw2HLTkFhRSihwd2KdTX1ONKXw++
X-Gm-Gg: AfdE7cnfPXd493C4GtP1ijhMD5URZJ+xpiem29hbF3LOJTfpQwlf8qliZWLVaTbptO6
	Tjzqdb/HTk24RCXDRikrMRDdFQngsbGlyD53rmIcMSE5e3aiWZhZTgBL2GrY1J6p1dDl6HtcA2v
	xtE/C5/yK/q/VFu2QcoG15TPyCcRk6MW0hQBlG8trfONZ/RKF9VY2xNh3gBKV8i8OSr7LwalyGL
	jXsBYHGkGPmXzBDFfuosTZ5KZNy64QcLt1umpPSt1g73PNGTNOqI6hdx3SEixx0Ad7zUr46SYxh
	/GCg/2d+NR8abOqbH+Uesw01frA+SCPnwBPhWh8OljxRYiLuObcYYNJEnHQvipyTTXVQcGlVTBF
	YBSRXYNImQjKjVvchks6l2ms8x2qAlvHVEVw=
X-Received: by 2002:a05:6122:208b:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5bdba88ec29mr230809e0c.5.1782735483520;
        Mon, 29 Jun 2026 05:18:03 -0700 (PDT)
X-Received: by 2002:a05:6122:208b:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5bdba88ec29mr230759e0c.5.1782735480453;
        Mon, 29 Jun 2026 05:18:00 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e0d15sm6837519a12.14.2026.06.29.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:17:59 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Mon, 29 Jun 2026 15:17:48 +0300
Message-Id: <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jMOcj8dtVNNg47sQNgqKSFnyLXfKpQvN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfXyym5cd0mgg1M
 DNT1A5JFxq+rwxbiO3omvcHvTav9bTt1PJ9lbWQt6gVEPDq4OWaPmIkFO+9KKYGFewuOQxB6UFQ
 jHVI/zKMCetMfTZICZh6mpGSkmsmHeY=
X-Proofpoint-ORIG-GUID: jMOcj8dtVNNg47sQNgqKSFnyLXfKpQvN
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a42627c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfXz9aV1wdbhy8x
 SuXpxZec0C/m0D4kdnqZORiUAMfHs6xk/VsVWIx1xRfuaePtA7Eb1xUE7YzbIgoYJZ/j0FPvzag
 kWsajbU5I25ugqsYypCJpIsHdgZ7yZgryUTzgagjPaUXk7jsz3MUZiZoNX9dHsN5xjlkYYtipt2
 yC0xlRCMH74n2hniFb6mdHQvBiWSgkcI1BR3eL8vsTrqn6Bg4iJRRADDS2KeJDQFegSTO7VjxRO
 GIiaWoEtEoz2nSiZbN4rAsqr3sh6Z4AhwYsdhWf17lZfHNOXjddmaAiJ0Hoii+QdfpFdjaENNMG
 pw8DsJcC9wa+Q6AqvG7UfojFSGLzFOSPTblm5xtT5ro4wLAQeGxpQT/Vl6OX1xW2SlUzLUrrVnR
 /Ol1KQguR5DB0MA6SCUHVOs0txsQcYedscf3/lywPThGJ1Ad4zgaIn0lA729p9r/4/LmzebBuQY
 jUC9TsACLni19retA1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-115028-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63DDB6D9F58

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..c8b4808054cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: hf_axi
+      - const: sf_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cnoc_axi
+      - const: jpeg
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Two SMMU stream IDs for the JPEG hardware. The first entry is for
+      the JPEG core engine; the second is for the JPEG DMA/scale path.
+      The exact stream ID assignment is SoC-specific and not publicly
+      documented by Qualcomm.
+    minItems: 2
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: hf-mnoc
+      - const: sf-mnoc
+      - const: icp-mnoc
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
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
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss@ac6a000 {
+            compatible = "qcom,sm8250-camss";
+            reg = <0 0x0ac6a000 0 0x2000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            jpeg-encoder@ac53000 {
+                compatible = "qcom,sm8250-jenc";
+                reg = <0 0xac53000 0 0x1000>;
+
+                interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+                power-domains = <&camcc TITAN_TOP_GDSC>;
+
+                clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                         <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                         <&camcc CAM_CC_CORE_AHB_CLK>,
+                         <&camcc CAM_CC_CPAS_AHB_CLK>,
+                         <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                         <&camcc CAM_CC_JPEG_CLK>;
+                clock-names = "hf_axi",
+                              "sf_axi",
+                              "core_ahb",
+                              "cpas_ahb",
+                              "cnoc_axi",
+                              "jpeg";
+
+                iommus = <&apps_smmu 0x2040 0x400>,
+                         <&apps_smmu 0x2440 0x400>;
+
+                interconnects =
+                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+                interconnect-names = "cpu-cfg",
+                                     "hf-mnoc",
+                                     "sf-mnoc",
+                                     "icp-mnoc";
+
+                operating-points-v2 = <&jpeg_opp_table>;
+
+                jpeg_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-300000000 {
+                        opp-hz = /bits/ 64 <300000000>;
+                        opp-level = <0>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-400000000 {
+                        opp-hz = /bits/ 64 <400000000>;
+                        opp-level = <1>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-480000000 {
+                        opp-hz = /bits/ 64 <480000000>;
+                        opp-level = <2>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-600000000 {
+                        opp-hz = /bits/ 64 <600000000>;
+                        opp-level = <3>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1


