Return-Path: <linux-arm-msm+bounces-105244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMYUJ4Ik8mlmoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:32:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D604496F70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3627308021B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A1037C92F;
	Wed, 29 Apr 2026 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8oqG2jD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPQ6/FwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE037B400
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476298; cv=none; b=Wu2HynRi++3GyYUccKhTLuDZzwRcDLaSSQ0FQYXLSFQiYmBK0OflSLQtWOTjy4LLwbg5hZcJ0LhN8qH70x8tbm4cfSShGgjS27CwWk41iLFLQvg3Pm3xmvEyC6faYq/TdpWH2kXOHakxDLuecYi9PNSavlds54RZYAlIFJ+MNYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476298; c=relaxed/simple;
	bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYPmHzcvFyQFHYBayoYueD17W8ehH6pCEo7ux08jsZEDEzf4zqr4qHatMeo8AizrtEmAtQx2N4JU5fTGl7205eBsyx/C1F3KqfJbD117nTrI0P9ZnCWm/qx2dkIikIS8WYA1E+XkPR9l0Ga6Kd+UfPpow/SXQRI1ZxzVoySYkNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8oqG2jD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPQ6/FwD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF7v6U963237
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=; b=N8oqG2jDWombJYvq
	tZsB63F2YmRClEKLURoKXuOpMS/B6byGpue31iVLZROIriU/aLbommp1WCdYe6aG
	bz4gG5U0cVSLqPYKL9GdwnTknbSGu8E8ZAJVpDWLMCZSQvvEfmAdUGdf1XtBuTfJ
	oczLT90+JMv7uR8vCE1Ts9Mg8TKcS5LBIouSD3RVp9Gwt40VVyzH624Z/8ZNWZaN
	cBjzwH9ys8Gax5ULFSEz6Fr3gY62cm/3IiecRfhS0wpePgTeZxIh4/3na6obVRcD
	0PUGbyd0iKZ7Qcs/DnwQY/kjusRmZ3x77OTncVtmDB7SO98WIivai2H9Jm8R4704
	Nr3TDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4v1d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3649e59f0ddso1254620a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476295; x=1778081095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=jPQ6/FwDtJanM0DyDNhpAQO7U1HzRvaZW9XSIQwJha20Z1Y10lrrar1cILecs8q/jM
         iUNl8q7hMImBzfRK/CDq9y6U8VFi0Cyi+I8cHMaQ6rImToN+4U44w3VWvj+aX0EV/wRD
         DeA6T5zZUv9ajNk4UbRig+0ij+uvCo0fJ5ozfhn8IZ7fRWIWrWzlkKvFCUm61PKMjRpd
         vhDKo1TAe/Ho6MJqASmFRCRjljhCbZkANV/eYoiINn0IVkqTLRnZEYDanuPfG9qHiFqq
         NLW8dWqt/bkCjBD+y1a5CTCjU9zHaw7iT/s78v7A3rLFByxB4i3rgBpaoAY2ZqmyI+iH
         epVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476295; x=1778081095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=X57RkesnIKzl+sfpjtmTfsXGcy907k1OpBKtkjZ2IXnsTpMlrnghxxM1RSqAXQoo8+
         ld6HexGSF3bHU7rFLfexfUDIDIvzp1peHhbXP7GqjrvrK7FL2/RdetrSmixHyXhgTL2o
         K0brGju3Jmws4N5UesYRbfy/w1PAGaad3wnGYJBlCqVIhqUYS6hIumKyJJh5Ax6fiVgn
         GSzJ6duuF5c6CuwdAWz7AvJzW3T1SnVtVJCbmfuJFBlRuD7VQbBzjoTxGq4NoZNsdINC
         K1P3F9mwXIUgZEtiuYiK1YB6d5KEjLKzt4cyeNRV5bHPk/h7gEDIc8F6RclO8KrJD3G6
         e1yw==
X-Gm-Message-State: AOJu0YzvHjAIw+FnXydN/4y/5iX75mVNglmjXFjdUqrnoouwAJlSnuV8
	aY4pFYV3axQsngmWocTriSDn30/+6yewB+fO7FRY6x2cP2pQFP2rtxANUDhC+b4JIg1+WlMnZ3z
	QnklUJGpJyj3JgXD5kQkuXwdkENlv4pgC9vDbqoR0dTueYfzmkQiXlYgD6ZBnH8BlrdP0
X-Gm-Gg: AeBDietg9cyWMp5xyEmT5qcV+tjmIi4KrzqPcJrwhOeRCf4m3YjLPmzGkKQm0W9c8BR
	IV6PesU+qpZd82wRwfDDBc4uk7kZJHm2hpbnctJoGvHS0pIXxb0TBZzIeiP7PjZL+p4pl5pZPAA
	eoVN0gZFbTIZPec++fX6bzbeZ1LcscSfH2vJalL3Ubaj6aI7VDE/c1wxDlEMc7bBS7+81SFrnZ2
	4+EossMjNCz2HGfNSaCEAQjehBFTYtnhp/clmNYvqhJvRfqJX9UkuPCQJEBWEU6h9BvymoUoKxK
	j4u8KDvY6Jq/lijJRcAlWc2H6PPXIi5a6cDzbBUOOTQQhveCUEdO8Wah/c31tTNe3hw6JlzicKN
	6OG9gOON19YO/I2JqX/JDAslgS60NAUD+1geTVjfCs3f3NgzHXaIWoAyEu9+lONaUNKTZzsn+sE
	HrJMbxK37+TvxitEV2vFEgmQ6dTIJbsrLpz+Nq6a/cOPXJrK4KbDcHkWRThXiJ2f+Ej28=
X-Received: by 2002:a17:90b:5444:b0:35d:9f7c:142c with SMTP id 98e67ed59e1d1-36492055f11mr8811649a91.26.1777476294819;
        Wed, 29 Apr 2026 08:24:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5444:b0:35d:9f7c:142c with SMTP id 98e67ed59e1d1-36492055f11mr8811612a91.26.1777476294352;
        Wed, 29 Apr 2026 08:24:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd588ad5sm66732a91.3.2026.04.29.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:24:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:54:24 +0530
Subject: [PATCH v2 3/4] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-ipq9650_boot_to_shell-v2-3-9b0dc3d1f3a8@oss.qualcomm.com>
References: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
In-Reply-To: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777476269; l=894;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
 b=ZiGr36yeLWDWz/rwMpos3EpHE6sMlPJGhdwRjn53GQe03ljyPYrbSrZitAR0iHT9+PWL07Hzs
 eLR2oWrl5mlDp3lpObDcbE0nYeU6EOzow5MCaRcZ17MxBcAHiHVDcBr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfXyRd9qxN1jgIY
 0OduhSvV/iFh4E0IP1Z5TpqC4FZa3fa/0b7YTiZUpdYTg6Lh/+hRXVoMzXOWSoI1cGe8aZxX14F
 gEfgv+iGSxpsSgmVFIfszDhCKRmSZh+KIC30Z+gIXFZvxEuUPxqGLFH6dZ0BgmtHZIXDHG+srGc
 2XyG7sVsY0n4peAExczJ/HwLbaEmlh73GmMXOoKndXu5lLyM2dacmCfisStExelkXnSUl56yVOb
 p2yX1Pe5kfbFU6svuI9CNOETjzYPE3PudPnSvNKeTtB9k61+5t/5mEg07A13fm79KAa4OUD+msE
 C5X4+VjfoqnIw+dx8j6SKc3L8Mkmmb4CtpRjb3Kwh6PHpb+VqKKlWnDCqYZMwmO8FzdAUurPyFR
 gD5rPdzM+I3qDi/+Tb7zWRTjcwVQo2d/kvf3P0u4rx/mM9E271wlmKudMfG9DfNeg2LDbLV8IX3
 9QQNzLhDMzZwCM1cZKw==
X-Proofpoint-GUID: LKbN5MfISmMshIWltT7NtaD83wTD0tZ2
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f222c7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LKbN5MfISmMshIWltT7NtaD83wTD0tZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290155
X-Rspamd-Queue-Id: 3D604496F70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105244-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the new IPQ9650 SoC/board device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1


