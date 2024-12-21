Return-Path: <linux-arm-msm+bounces-43039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C289FA08C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 13:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C651679E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 12:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD9C1F8668;
	Sat, 21 Dec 2024 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSSqjc+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC92594B0;
	Sat, 21 Dec 2024 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734783881; cv=none; b=fP7FmCPKAagNsavkLF7YZksPDo8yTheLtSHqoHJboekSrdGcWlc+lEUmeCOTdGCeCYpCict/vX+GHfqD3Rgb9NxXDN1u7/ggVJXxYdEQeIUGt0kxKhtrgTVwozQHfPXrske0n9lurddNA9PGhnj575UIXB6Dzofzmr0vuaLjvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734783881; c=relaxed/simple;
	bh=2ysZvwKghVV8xK/v6rF2uZNOP88Q0RYFebrbhqAaXnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgkKJGZ9Y0lqgItUQjkk32qDT49OApETe3cSrsrcuQdyoDGocVhSTmGmWfoP6FqQfZuuJpkoDRyfAoTpuTVV6NODzVzbzQMyWin8uMKpgE55+2dt6zZ19W1q4sSZwQ00k91G4ia9IRDn4+ncz2/jl+2N9DPpagDDjCI7GBPkMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSSqjc+D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4252AC4CECE;
	Sat, 21 Dec 2024 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734783880;
	bh=2ysZvwKghVV8xK/v6rF2uZNOP88Q0RYFebrbhqAaXnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eSSqjc+D9OQZBzHtmDRtzEktH32yMWOEqqesn2eY4XJIy+v2VKyDNJ//+fJn4lh3O
	 NCFABiPXzNDLXCNUgtfCsOXB7bM4dXY+/crhz/bGUJv58ITTs1rBjqmFoDU8t1KZfz
	 XgVjeqz2s7ZDYn7L4kJUjvrxlQ/m+KPqJicmROfYgfSFx/A1TihYvq6mThdWgLVcQ1
	 j02u+3fqgGUi1CqBUAPi2netQyg/b3YPr6Bo7poj6GRO/B2IDkUaBFqPIET56LvRmn
	 472/jUz/u5AL8WIZOcC7f0fasWBBtVb1Q1cqgzGtc/6G7UtxHecHKKUlETlOwZ9Z3b
	 WYEwLeOpHRz+g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 21 Dec 2024 13:24:10 +0100
Subject: [PATCH 2/3] dt-bindings: clock: qcom,x1e80100-gpucc: Extend for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241221-topic-x1p4_clk-v1-2-dbaeccb74884@oss.qualcomm.com>
References: <20241221-topic-x1p4_clk-v1-0-dbaeccb74884@oss.qualcomm.com>
In-Reply-To: <20241221-topic-x1p4_clk-v1-0-dbaeccb74884@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734783869; l=2345;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Rb0uPv5NwTKLqb0PMyy/hvByarJ3mrcXsy5ajyu71bI=;
 b=110JL1983Es2Mdma+22s7P6m+Zn+vsY+SZ2f/mZoFqMY8rdaPob8g5ax9XAoFHWiUO9TtHIs4
 dp60RZjJr8uCgNAY7iRcujrG7ieArKENQT3fFS+G0Us3f4DCBSBeapJ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

To make it easier for X1P4 and X1E to share a common device tree base,
extend the existing latter's GPUCC bindings and reuse them on the
former platform.

While not in the same file, it only makes sense to introduce the new
compatible in this commit as well.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-gpucc.yaml        |  1 +
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h             | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 5c65f5ecf0f387f30ae70a8f2b25d292f6092133..02968632fb3af34d6b3983a6a24aa742db1d59b1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sm8550-gpucc
       - qcom,sm8650-gpucc
       - qcom,x1e80100-gpucc
+      - qcom,x1p42100-gpucc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,x1e80100-gpucc.h b/include/dt-bindings/clock/qcom,x1e80100-gpucc.h
index 61a3a8f3ac434df8c504afcf078a5bee386a3832..27b8f50541fd69cf687609e6175844c4ac533368 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-gpucc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-gpucc.h
@@ -33,9 +33,22 @@
 #define GPU_CC_SLEEP_CLK					23
 #define GPU_CC_XO_CLK_SRC					24
 #define GPU_CC_XO_DIV_CLK_SRC					25
+#define GPU_CC_CX_ACCU_SHIFT_CLK				26
+#define GPU_CC_GX_ACCU_SHIFT_CLK				27
 
 /* GDSCs */
 #define GPU_CX_GDSC						0
 #define GPU_GX_GDSC						1
 
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR                                          0
+#define GPU_CC_CB_BCR                                           1
+#define GPU_CC_CX_BCR                                           2
+#define GPU_CC_FAST_HUB_BCR                                     3
+#define GPU_CC_FF_BCR                                           4
+#define GPU_CC_GFX3D_AON_BCR                                    5
+#define GPU_CC_GMU_BCR                                          6
+#define GPU_CC_GX_BCR                                           7
+#define GPU_CC_XO_BCR                                           8
+
 #endif

-- 
2.47.1


