Return-Path: <linux-arm-msm+bounces-82003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53822C61E20
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 23:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 069033AF994
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9012765DC;
	Sun, 16 Nov 2025 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MGhtwBD/";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UoAwPNX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2A199D8;
	Sun, 16 Nov 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331024; cv=none; b=X8kOnV4r6ORsjPq9Vp+vxIp87exhUovo2dfXNvN4YJqOl62/AzZDMXdnN3iVxy3JrKs4jBshkvBznNbraolIr/mG1pZFAvJ64vLm6ZQrtanuI5e+2PzMKuv0OxR/u4sQjs4mjJw/i5BMa4WUiw1jsBsdvwVyW75rkFntVhpubvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331024; c=relaxed/simple;
	bh=DwU8xmE8fnDnLJrwHBqWMO3H0UmHYjaJf5pOq/SZlm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKvnr/L6STBoh9F6w2EZpXAH8PlDiLjRKmNnaEci5deoPh9/kn2TvkXFGwu20w2bs0BnTF5P/1toKdhXHLB/2QLLFdw7uNPff85G6vgYCGbWTPpg63GPizSdJLHIrMS7ioSkm8cZCULCTgD94xS/2iDbd/TxwaoyIABBrjAuVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MGhtwBD/; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UoAwPNX4; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763331019; bh=Ba+iBzT9nytvBVNltmmGAZh
	GvCdcPk+aKxnOb12hNNo=; b=MGhtwBD/8wJPLi1IlQM1tbXjpie+PKpky4+WYkg5chj5ExW3hP
	MJotWa2SyGx89DKcNd+86yL9gKJXMavnVhSik4RooCSIEWhe4fJkcNRDGWX4rb1S8b8KdGGAeoe
	dydZGW29y3cX5wNUfdKD5zyprlCZ7vMJyEMWYc8JqoeBUqkx5MVkPe37qQZkkiaaOBvUDW63VkX
	0SgCS+dSOfe+ytCUCbWkxRmcvrtLCJ2K8n1ZrtgSUW2+VVbTTD7dPJkyy0uOvWZYNrMIUhhgoO7
	dVmfTO6pBemGcIxi/ED7EgfCA2iCtjBrHrxAFIbsssFq6JbR46Sc5gXFAqi498Zku4w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763331019; bh=Ba+iBzT9nytvBVNltmmGAZh
	GvCdcPk+aKxnOb12hNNo=; b=UoAwPNX4yyW9peHXSgdctqTf04DtM3DzEjPTlWILLXQLyf4Owl
	nhXT06MEoh2hL8Rmno0i9Up2rF9XMgbJf1Dw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 16 Nov 2025 23:10:17 +0100
Subject: [PATCH 1/4] dt-bindings: clock: gcc-msm8917: Add missing MDSS
 reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251116-mdss-resets-msm8917-msm8937-v1-1-08051386779b@mainlining.org>
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763331018; l=687;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=DwU8xmE8fnDnLJrwHBqWMO3H0UmHYjaJf5pOq/SZlm4=;
 b=NAVAvwW2zYFaHIzTv2F+OYCeTrueJE3Yx8gm1j5w9fRwo7Td1icngq7Jpa2msjB6XHMu6D7ws
 g2trw+4JmntC3cTUOFPkQQgVLLT6Si/yw4ibhzRdOst0nxeFF0GDHSu
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add definition for MDSS reset can be found on MSM8917 and MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 include/dt-bindings/clock/qcom,gcc-msm8917.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
index 4e3897b3669d..4265460bfb30 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -194,6 +194,7 @@
 #define GCC_QUSB2_PHY_BCR			2
 #define GCC_USB_HS_BCR				3
 #define GCC_USB2_HS_PHY_ONLY_BCR		4
+#define GCC_MDSS_BCR				5
 
 /* GDSCs */
 #define CPP_GDSC				0

-- 
2.51.2


