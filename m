Return-Path: <linux-arm-msm+bounces-82374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A8C6B048
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F8D04E4EF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 17:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06371364EBF;
	Tue, 18 Nov 2025 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6qZy0wL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665CA3612F7;
	Tue, 18 Nov 2025 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487206; cv=none; b=CbZx8+No5ABJA6Pdw1xeNIJEiJU5SpaKLOt9U3P3zGzZVmHY8rKngRnmNSs3t57mxF/WGJbvProbHqyvPWvy/++0FqH9da25pieN0b/x8tY/whC5SJ9PObPBgKGouGUk3AtupGINHD4s2jv/3XvQfaWIj/dkGp5LOdZ0nxamlGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487206; c=relaxed/simple;
	bh=z9e+mCPWxqekBhkpBve1brKRRxFRrdLlaj860hjmm8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFtHI22ersgjiqGsdMPvyor65a36vLfNcXtBhTVwufz10fwFiZFEOti6D8bkv4gJTynHG5A6vFfUzHMt/092omppHag2rTrlC8YkojTfhEQFsKzKBXAcTYlIsj5qhMRnBCB3I4AI8treEtW6R4rfnIUem2F/Jx7BqaCLaAa5K3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6qZy0wL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A81C19422;
	Tue, 18 Nov 2025 17:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763487205;
	bh=z9e+mCPWxqekBhkpBve1brKRRxFRrdLlaj860hjmm8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M6qZy0wLgsbx2kHnxcZTDOyiG4XWiv5EWwVlDi7LlGoxsGEDHwALjMo7CoqslAU0a
	 hi1AHVmLTU5J/m4bgLm1n82WJ4lNzE+r1mh/C99hbfUEvpN0hKljqq/0mUzhUeP6F1
	 FOxKDwf8+a3AghYVXjHrCrfcqPe8rneqw4bJxHBu40WBrztQqcE1f+cZbdJD4XsFan
	 XCwIHs6R/Fex4VvAVaIbLpcEruNVtKi+I49iD5Bp00pmX91RB0+m52y9ogZ6xsQpji
	 Mv2I6q2KRhiOaufcIGIbGvhz3P/vk6TjxSvuqmxSHHUfQerSmfRShqx5NI1+g9/xpp
	 rgTmtwFyCyqLg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Nov 2025 18:33:11 +0100
Subject: [PATCH 1/2] dt-bindings: clock: qcom: x1e80100-dispcc: Add USB4
 router link resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-topic-usb4_x1e_dispcc-v1-1-14c68d842c71@oss.qualcomm.com>
References: <20251118-topic-usb4_x1e_dispcc-v1-0-14c68d842c71@oss.qualcomm.com>
In-Reply-To: <20251118-topic-usb4_x1e_dispcc-v1-0-14c68d842c71@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763487196; l=1004;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kC/ci+bNtwhVWzkSk5oNreXW+M3n/pTuCgni5ROCdaQ=;
 b=56xE4CTwjdli7Pf64dJ4mc1l16bAiVTzloVaq0gRMS2JWsMvrZgoGZyNTTLKopQ8ApWNnk+iJ
 WFdez+FY1WGADVfUs1DhjDWtTrEKvbU9X8Kf20e7kicQbApIASAFDzr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The router link clock branches also feature some reset logic, which is
required to properly power sequence the hardware for DP tunneling over
USB4.

Describe these missing resets.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,x1e80100-dispcc.h b/include/dt-bindings/clock/qcom,x1e80100-dispcc.h
index d4a83e4fd0d1..49b3a9e5ce4a 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-dispcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-dispcc.h
@@ -90,6 +90,9 @@
 #define DISP_CC_MDSS_CORE_BCR					0
 #define DISP_CC_MDSS_CORE_INT2_BCR				1
 #define DISP_CC_MDSS_RSCC_BCR					2
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK_ARES	3
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK_ARES	4
+#define DISP_CC_MDSS_DPTX2_USB_ROUTER_LINK_INTF_CLK_ARES	5
 
 /* DISP_CC GDSCR */
 #define MDSS_GDSC						0

-- 
2.51.2


