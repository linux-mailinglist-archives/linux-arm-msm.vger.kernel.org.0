Return-Path: <linux-arm-msm+bounces-97502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKOfIE0PtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:21:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82992283A97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60214304BB40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F271A318EE1;
	Fri, 13 Mar 2026 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHLUWEkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhAVOFzN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D5322A00
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408012; cv=none; b=fJq5PKJIU+NkCxhblFvhn0FIGRTcJI+PQjFZlBoACC0+tskI+XoxVn6ndPhalX2xh9PACuKa+YW/gxoqBn34OsVFqT1LfPQFRUBaM2u/t4q5DwuGWlsEm0oKkkCF8EmQBmy2IkrT8C+TFy1DEeKKvbo9xhgSOacxHL8GazQfPZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408012; c=relaxed/simple;
	bh=FugiAkjJAw8Rc+ElWLy7+3EXCO2X/Q7eYTyyl4toOwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daHdipuXcxCWy5LB99OHPbajrM60YzkjWxeeuR4msU+XnuwguJxfx3bLPCgqhp2hFNvYNUHfAuDvFRRZR+YVQCDmmu1/OhSrl1iFyv8Ix8jp2yyvQsKUcIPD/XZOA455HjfDClbISAkGfB8mkR0EtZjIkC0QIS3sCqKnHlbXebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHLUWEkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhAVOFzN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCOOsW3229726
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qq/iNMuIBUf8ItEQbdTvaDhG+gM00VgveS6mWqyYASY=; b=lHLUWEkNaJLEia6p
	QwvkLhTrwBJrFVkK4lbqCm1MDtyVjnJodyP8lkFxDSz8vJEXbpzDDHTgeQZ9Pw6a
	61etXw5ZXZHsJFJR38yaUWNmxUZiz6K8fxvQei8x66fDCgIdKe0Mt9h2dEwxiCeo
	lfiB/O0UqSxlcmqQKag6hf5lnTvCa++V7h21Vt7QAiWEtTa3EHdRafrh6QxTCzSd
	G72KNJceTB1UsZp9zKbzA5yi5/DErvUy8Lx2skw+3/OaeLvFV1jSlkdnc8ZgdOz2
	TCXSGRCHrDy69mdb2t2nWg0v7vOmRs5G71nJTiwlIvjpxaxR+OrRg9hcC5XkFb13
	JEXMrA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7j9e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a17153ee9so506488b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408010; x=1774012810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq/iNMuIBUf8ItEQbdTvaDhG+gM00VgveS6mWqyYASY=;
        b=EhAVOFzNQi9MN675Y+WqILNmCdSeAefChhvns1JRUesBqczIdXBpUCOq1dRi2lPTp3
         h04PqRaJmSmoMUTrCOsucP3F0Y2lpjU0khFd55l/e6ZjMS9Z3Jx16catQAwkmi+630p+
         erSSWdf9XWansc2o0nlnwWSw2Grk9cq9OHuW8bNPZqzE4+pEaICMchh4qwtFyT4cVoJ4
         Z8pcjcdvNZu45mbeAlCcQXm45vtx+5cqY98PxhCTjgmVsu2pI/nLuvHpUyoE6ZJXwnXU
         josy3jSK5g8Cf2Ebh4PaTXsc+iAeSGw1sCyV3+7IlzN9PCzu6iBGi/CQJ2mIfgJm2gR5
         ACNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408010; x=1774012810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qq/iNMuIBUf8ItEQbdTvaDhG+gM00VgveS6mWqyYASY=;
        b=fBnQsUpwdgAoTYxt9l/PKZNqa36hfL73COSdf/nkORWHlput5i54e6hOy5iBKwp5rR
         TGe0df7Hm3E9FuEr0rID/1Xd82gLosW5DoBQOE3Bq2VlLtQo0ZqPlB2wv4MYeDyG7f4G
         pwEQr7ytL3t6z4FiqTbJTl9FSZ7jI8Tm/GPcp4mYDS0AfnQlMRGR+z13ffjElC0ZthKJ
         aEoQ7xeR4pj42l+HJIs52RM20x6Cn10ffEct4eg8WSEvU2w/pJtLj/FLxWgn/wKOnyTy
         96fk/cMQRPcyfBdHGxPqpESoTZ0/ewCHWQ8OqXCmcbPqrjuyXVeQ0WZCf6atQIPkENXu
         FwIA==
X-Gm-Message-State: AOJu0YzDAUyrh+ySRfYvh4JuudXl42hI0NZdi0t+gxi+zaufu3UwZr0j
	QAycVyeCK/0okhUAjqqKiL/pV2w9PnJ+Cd82UqaF3dNuUkurcmdCvxR74zQRWbobvW9JXFu5QVL
	YKIHr23d5woe54IJ4Wn5ixm5QOM0Hrd4BpRZpBr3OUxMP/9tqPXeU4J05Y3rQGqa403Ks
X-Gm-Gg: ATEYQzyHRY7Fm1dCprmygkMpmMIdPs4kLpcbKTCwch7pmC/CXQHI0yV5InPt3zK+oXh
	8GdB778dWGR5bW0S7MSwLn4jdAKC07ZnBgrulD/YQkeJxNsBIAEWi9Bqp2QO3UXQiu3qNuJpK0s
	9y4bJbHC7aiaVkLZRCycHve7pt8IyhZo/A82tmQ+byjt/FQucCML0biqAz4iaxQ2I7CyqQTNUWW
	PjBtGZH7hO04VvpM/Z2u1ANZINIiWzz5f7j7NaTpfQF+DNhFFm/owuae6oeTkUPj8m47MFT0jOD
	ocndUPjkV9yR3MtVCsgu4QAaVnkaZPJFkZ8R/h5Y9hAd1ak+KySUjZ3oxRik8iSJOfHmKRjjSmk
	KHRxNVnAIGJ+0Il5dAYJiIGwXmDW9LAorWfkEZMk2x1q6M5D5T44emMq0
X-Received: by 2002:a05:6a21:2d42:b0:398:a1ca:7a26 with SMTP id adf61e73a8af0-398ecddd629mr2987552637.62.1773408009928;
        Fri, 13 Mar 2026 06:20:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d42:b0:398:a1ca:7a26 with SMTP id adf61e73a8af0-398ecddd629mr2987503637.62.1773408009198;
        Fri, 13 Mar 2026 06:20:09 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0724407csm5775254b3a.8.2026.03.13.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:20:08 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:49:35 +0530
Subject: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773407994; l=10166;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=FugiAkjJAw8Rc+ElWLy7+3EXCO2X/Q7eYTyyl4toOwg=;
 b=1hVPp6u/PZJQh/cJU9zaws2RRqe3k7bztmgXfJ0w7mz1yMHp8PNVfizwyQoOtNl9tYUCq15FG
 fvxhpF9hrx2A8SDYX6onl4JnRrEjHHj5wNI7K+6SM+Lzc2wqp8wDscT
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: ZGbjwkXF-LzIW2-q2zb2u6OTUKJC3xxz
X-Proofpoint-GUID: ZGbjwkXF-LzIW2-q2zb2u6OTUKJC3xxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX332kX+V2dCeQ
 Wb7dXZii9Q18QZnBtkUHObKWYrG73kHWChdn577rK2re7/PlMPFAIbpVYjz6pYoUfVlymWEfqwb
 PLxeTo4Qapu4uibhmdPdLz2Pd5uioijanZJTrrVRlLgzRe0/ZAxZcSQVQAMO4kBtCuZ2VWeLFkd
 6uYoRB/zxwE5uWhTcseKPtNlV7shHgK99CPEtRjc9hnPsouWvbrTWICAF5NHoKmAKYQU8bW9+uF
 Yj6zOM2ZuuFWUyYbkGxEQS8XyuVoCBADc+QMkb8jq3cFyjmBw4Ucgx3mkxshKfM2LEi3nLCGUc3
 OC6mJc8wa6yqvjyT11Qnao7Bz+JB+rte95XpofpOUo2xmi1qUgKXziAujxdU+PwDbCA/nvtqPeK
 Vq3QNCyq7hSwRLPNqZuxx6gYxgI3NBMSb9KPPt8Y0CuRwSfP6f6S4PZFEi4D5xf04UTCEWp6/ym
 DOCWKd7pJFb0b7FvIVg==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b40f0a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3XxYi-OA7daZLtlGpLkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97502-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.30.132.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 82992283A97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kaanapali SOC brings in the new generation of video IP i.e iris4. When
compared to previous generation, iris3x, it has,
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- additional power domain for apv codec.
- power domains for individual pipes (VPPx).
- different clocks and reset lines.

This patch depends on
https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15

Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
 include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
 2 files changed, 272 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1f35472a2caea7acd2ef20b5cbdafadba882bd3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
@@ -0,0 +1,254 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The iris video processing unit is a video encode and decode accelerator
+  present on Qualcomm Kaanapali SoC.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-iris
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 10
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
+      - const: vcodec_vpp1
+      - const: vcodec_apv
+
+  dma-coherent: true
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  interrupts:
+    maxItems: 1
+
+  iommu-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      - description: bitstream stream from vcodec
+        items:
+          - description: Function ID
+          - description: Phandle to IOMMU
+          - description: IOMMU stream ID base
+          - description: IOMMU stream ID mask
+          - description: Number of stream IDs
+      - description: non-pixel stream from vcodec
+      - description: non-pixel stream from tensilica
+      - description: pixel stream from vcodec
+      - description: secure bitstream stream from vcodec
+      - description: secure non-pixel stream from vcodec
+      - description: secure non-pixel stream from tensilica
+      - description: secure pixel stream from vcodec
+      # firmware might be handled by the TZ / hyp
+      - description: firmware stream from tensilica
+    minItems: 8
+
+  memory-region:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 7
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+      - const: vpp1
+      - const: apv
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - iommu-map
+  - memory-region
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/qcom,kaanapali-iris.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,kaanapali-iris";
+        reg = <0x02000000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&video_cc_mvs0c_clk>,
+                 <&video_cc_mvs0_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&video_cc_mvs0c_freerun_clk>,
+                 <&video_cc_mvs0_freerun_clk>,
+                 <&video_cc_mvs0b_clk>,
+                 <&video_cc_mvs0_vpp0_clk>,
+                 <&video_cc_mvs0_vpp1_clk>,
+                 <&video_cc_mvs0a_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec_bse",
+                      "vcodec_vpp0",
+                      "vcodec_vpp1",
+                      "vcodec_apv";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
+                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
+                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,
+                    <IRIS_PIXEL &apps_smmu 0x1943 0x0 0x1>,
+                    <IRIS_SECURE_BITSTREAM &apps_smmu 0x1946 0x0 0x1>,
+                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1941 0x0 0x1>,
+                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1a21 0x0 0x1>,
+                    <IRIS_SECURE_PIXEL &apps_smmu 0x1945 0x0 0x1>,
+                    <IRIS_FIRMWARE &apps_smmu 0x1a22 0x0 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&video_cc_mvs0c_gdsc>,
+                        <&video_cc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&video_cc_mvs0_vpp0_gdsc>,
+                        <&video_cc_mvs0_vpp1_gdsc>,
+                        <&video_cc_mvs0a_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vpp0",
+                             "vpp1",
+                             "apv";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&video_cc_mvs0c_freerun_clk_ares>,
+                 <&video_cc_mvs0_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-533000000 {
+                opp-hz = /bits/ 64 <533000000 533000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 630000000 630000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo_l0>,
+                                <&rpmhpd_opp_turbo_l0>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 630000000 850000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/media/qcom,kaanapali-iris.h b/include/dt-bindings/media/qcom,kaanapali-iris.h
new file mode 100644
index 0000000000000000000000000000000000000000..757313799293d59b2122dd8d05b654f7a3a9876a
--- /dev/null
+++ b/include/dt-bindings/media/qcom,kaanapali-iris.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_KAANAPALI_IRIS_H_
+#define _DT_BINDINGS_MEDIA_QCOM_KAANAPALI_IRIS_H_
+
+/* Function identifiers for iommu-map to attach for the context bank devices */
+#define IRIS_BITSTREAM		0
+#define IRIS_NON_PIXEL		1
+#define IRIS_PIXEL		2
+#define IRIS_SECURE_BITSTREAM	3
+#define IRIS_SECURE_NON_PIXEL	4
+#define IRIS_SECURE_PIXEL	5
+#define IRIS_FIRMWARE		6
+
+#endif

-- 
2.34.1


