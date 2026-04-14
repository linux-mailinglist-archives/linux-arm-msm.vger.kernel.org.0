Return-Path: <linux-arm-msm+bounces-103030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKXSM0LK3WknjQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:01:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE63F5966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28529307284A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFD127FB1C;
	Tue, 14 Apr 2026 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apcGzutO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFHzvuH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974BB21638D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142843; cv=none; b=I6uEzEFL5j4JoUYQe+fsoIeQHXQPuE9ADv1CFviLa+GRZ73sQiVKSJdURKJxEUmKJXxEs9biRHqOmpXmZFFXJQbVibk28PrnI+av9wq/nPr0bJE9C8HroXgnhoznC3PkzkXnk2PImtFL+eYsQFBHcIQWo9o7ffzk5YBcOTT45eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142843; c=relaxed/simple;
	bh=+G8A9ery+s3UQR4ks8cuL74090Vvan1tS6zqjUU4Zrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdKDzeyn4wKpgJ/ZzcmBMmMxrcA6VRo1PCeFgOciuoO5h99h8oyGPvxzOR7TkiOGRbk/18uO3Ef0Ny+SNxG5cZQcQjR8Zw+AgIUYFSRyHxF9S9a/fj1ZHAhqydAPFnWIKb6Hd98pnsVYFr4McxYFwJYuqwrGEAl9KuTzKjpfngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apcGzutO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFHzvuH3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCpB13505568
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKV/5f3Zwel3X0HBSamMpA4C9Dpr5+g/2xdz/loKqVQ=; b=apcGzutOoE2Vbx5N
	MqeP2A+WfN6Lu4A8/aXlHbG0SCvgqt/uvlBpGyk0cTSAcnscG2XrNFXSppUbWLnU
	PBmxJz/BKs6Gr4I4+lDU6ah30DqGAG7epR9rEDG+1unKxHev6f1TR9D6jJ6WzdFy
	r/t+teaOKRlIhnXMA2fM6wMafx4znIVUswDsB1fSkn5j0XKhPMaa9uBDsTfPSVR5
	CZqRHupdwqHBegVtmsJ2l+POgiBsYlr9R8hu//gNfVTufKQaiDY1Ef/pu3aeCzVU
	0P/v9Sz30ZaOdzP19Py8+H13SS2zpHgKkeuqjqHyB2j/NXD/njiD4zoq5eBueIHQ
	5qdR2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870h2d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24308165dso97136595ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 22:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142840; x=1776747640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKV/5f3Zwel3X0HBSamMpA4C9Dpr5+g/2xdz/loKqVQ=;
        b=HFHzvuH3wfciGvrBxG0rI1Dajd7rrga4mBUcgAVUxkfC+LI8W+WCZGUpeU7HufGKvT
         1kaUO6k9ooEqOCJAxgDnidUHFai21rUDnU+slX87s0c9z/jK568HAmTZ37RL1Nm5LKJs
         BqeTISlcEG46L2Ekiq89lnm21GJ5bw1VPoYsDstItmh57/weJwrwEs09qkZWpD716yQd
         jSYncfrHrZjSuXEFKYDmUPoqBVKBQ5bWzNCSUb7MH2R54J8Kq2+c61uaJVUlGLWQ/Zvl
         WQ2WlQA7+rbljGnYlZNYcgzJDLS7Wid6WvA2brtE5WsDaZrlmmaNAXcFKqBcx26TiYIn
         EmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142840; x=1776747640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKV/5f3Zwel3X0HBSamMpA4C9Dpr5+g/2xdz/loKqVQ=;
        b=rGqcrtRMXZFvH5Vh8Ib+B1xZzp0/F0XgV0w3YZR/JKuoB9vvmoWc74SDbQkRI6IA6F
         TtiZLGitSCpEsveYEdc/e4CY+wWmaRHz4KQoapOEa8BaxWP8Sli/oCbRwWUiGZXQBz6H
         tUhyZmr5oaJkkfHLozzXELzEoeFix2dBgNFUTSo3rRQctwRgXQ4eVmgt5alcpVCoj7H6
         qjZnNnMM4pFGM5R78+y3PY9uCoakcIgpCITfzNGWWU3s68r36WTqsEwdbAJY7wJolApl
         zEUXxaGVxvJpS1nct1dmmsTVR6SIjnXR2YnCjW1pEFJOiDS3YsoPVMptfajZlOq6E/w/
         Z/vw==
X-Forwarded-Encrypted: i=1; AFNElJ+GhfisPI1o88AyDb8KSIhFFHKR4Rt1ojwF7oocPDog6AaR/M9j7cTkNMZFeyvzuGdpkbMJdyS0FTGHg6Xm@vger.kernel.org
X-Gm-Message-State: AOJu0YyDj3MD7YWI7dgtKhxsmXdbEPtDv5F5pIsPzH7SbTirmcmNS36P
	+BhdljO93Ow+e371jpPJvQKDTRYJSJzpCFQjGXKAOapNqrZZiRVz7rp4E5wSDHUkW8yOC4gCaPv
	70GtgcKB8Qcxco+vulscELJfXNINsrTNr7P0pTWfmVsYBT6OEkw1BtE+uSaodZe3IbyMNBleHzn
	2g
X-Gm-Gg: AeBDiethlOZGHwOLcba4AKsYwA0Mfyz2OCmxGGEOZFJvrmoaghMvp+ISfDI/H99J66I
	HA6c0ZfzFbmoOTTzMGP00gJBf7S5LTRzwegL5XIl8ksUTE8sdZzK/2RSiHCo4GoqMsUp0ooO+4b
	qlH4W2gOzakUdKYaIFfPudn6PI7W7103LYv+jHgtY8RejbVOM0qpNf/CW5Y/lY3qf6DI0aNGTBj
	XC16pqHAwpEeRsqcXdlpEO28uGlmjztmp8Kk3EGXJbeGO3MOyVAoFYc6A70E+64+fZ52BEeHvC3
	jSTfeK1v6P0HWY6/b1mLspOJd8i19WvUNd7mDLnKehuOvU3UsI/KEgtp3bzVIr0xmMYshKUTrQ3
	zuF1IGQvm6I8k5l7La4TKbslPGUm2/5aR2VyiQ9NcnZBZuWWzMNpbud4=
X-Received: by 2002:a17:903:1d1:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b2d59b838cmr173346715ad.19.1776142834880;
        Mon, 13 Apr 2026 22:00:34 -0700 (PDT)
X-Received: by 2002:a17:903:1d1:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b2d59b838cmr173346045ad.19.1776142834257;
        Mon, 13 Apr 2026 22:00:34 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:33 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:29:57 +0530
Subject: [PATCH 01/11] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-1-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=7566;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+G8A9ery+s3UQR4ks8cuL74090Vvan1tS6zqjUU4Zrk=;
 b=XO1zeby/rN6i9PLEcVfWtA0m0CIuWGsMgjInqQlzFiOsTdjyiloYh9P4cjbtWRq/DqAw3dmE3
 c3nzQHxMEHqB8QMmy569IAuCmPBR1bLQH8lMu4YGlGuaWOfd7bbQZNB
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX3CHkkWGnO5JA
 Vx+iJgwOor02JO3CEoc70/hO83BDXVLE9/FJpnLvZtGC8JXVounKcWcvykugpAWkN897rmOGsKS
 qhGrLRfJU3wzzuUvmBI3nA+UeORev0agJA5jhBE/fVznlcddjGXkpSegESwufNmc3en1SeGqoye
 siTLNVP7CF+DXVkP4IK51fDLpuxkyzv/fbU7GffDVKyDQP60xFxJG3DMh66eJwe37vR2/s5wEcV
 3zjK2oGkdhW81bpWiXTmv6eHyq4BzZzgI7tl7lZi+/zu9xSAu1chkZw3azelkQZFH8fWSUd7F1E
 P1+1IIIvdD2dgjI/b+d/nlLo9lFW/4J/woOJckGJP9oxKVsHvImNjxLXC4H+C2Fvno1KE+3R7tW
 hkqdO3gnoQLENvsjLT6U76WF53YgW3glZwXE20SpoS8KO8X9HLhH65LI2dWWLqVP7xKjmBfigsH
 Y62xZHwljHxM94DXqoA==
X-Proofpoint-ORIG-GUID: CGHrURzJMKEX6MI_rffH7lAKXY3OqIPn
X-Proofpoint-GUID: CGHrURzJMKEX6MI_rffH7lAKXY3OqIPn
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddc9f8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=17OVpTNTOV0qq6DYWkQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103030-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DBE63F5966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 220 +++++++++++++++++++++
 include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
 2 files changed, 231 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..10ee02cd1a7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,220 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface_ctrl
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: iface1
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
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
+  iommus:
+    maxItems: 4
+
+  iommu-map:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus_ctrl
+      - const: core
+      - const: vcodec0_core
+      - const: bus1
+      - const: vcodec1_core
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
+  - iommus
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
+    #include <dt-bindings/media/qcom,glymur-iris.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface_ctrl",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "iface1",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommus = <&apps_smmu 0x1940 0x0>,
+                 <&apps_smmu 0x1943 0x0>,
+                 <&apps_smmu 0x1944 0x0>,
+                 <&apps_smmu 0x19e0 0x0>;
+
+        iommu-map = <IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi0c_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus_ctrl",
+                      "core",
+                      "vcodec0_core",
+                      "bus1",
+                      "vcodec1_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/media/qcom,glymur-iris.h b/include/dt-bindings/media/qcom,glymur-iris.h
new file mode 100644
index 000000000000..5766db0b9247
--- /dev/null
+++ b/include/dt-bindings/media/qcom,glymur-iris.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+#define _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+
+#define IRIS_FIRMWARE	0
+
+#endif

-- 
2.34.1


