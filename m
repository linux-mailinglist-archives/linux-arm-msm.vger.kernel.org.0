Return-Path: <linux-arm-msm+bounces-82375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD2C6B057
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F140234D192
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 17:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34984366DAA;
	Tue, 18 Nov 2025 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6gnBj0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E261F355805;
	Tue, 18 Nov 2025 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487211; cv=none; b=QWXr9scCWfy8UbC3iYez+zok2l/a0xm+ACQJEwUqnue5CI7XVU6f45mgDIUlH9mUyrc2iJmWmF2bJo+3GM3FdRlu4BD01qLzFLUvz3ZzEpfNG8oy/UpqO6rEtLgGFcbrrQjQHY61vRoJf24op2GPMwMeGnrPsB3V7t1XPZ1nei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487211; c=relaxed/simple;
	bh=X29jigJ4sNWr7ZjzTXCg8YMvnT7UKJqzyc6/sR9+BsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oT6/IpCUNKuumCbdpNb+23x7yiKWKKs3jq0Rj4EhmXolrBj3qaQVOKl+juQF8GARPnUlnY55FmwAwVDvZCr151zZZ9bG324GvOkTFAxavPNEwLswquYhlrptQvm9XmD5Wm26pG1bJftUEOCJettnI+1ld6wjkbV2VreQ38qfY/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6gnBj0c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE80C4AF1A;
	Tue, 18 Nov 2025 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763487210;
	bh=X29jigJ4sNWr7ZjzTXCg8YMvnT7UKJqzyc6/sR9+BsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p6gnBj0cQNx3b9Kiy+5O8BwRLh6D42m1O4XDgygMSA9rKPYKCtt31IqZFJ3cdKOT5
	 o3Fcizngyfv1IHY9D7iYkl53H+nqIxrllc2weDLJhgUGengcMK22aL6IGOlUI6iKfo
	 hUU5kREv//9g+y7KsRM6J4JESIaOL5ULOPnVcxM6R062fh+MnHfEEzJGRkKaGaKbom
	 R+NotuPnyl8vUAAwXlUTtdhG38Wb+/R9xfxKT/Rqo9WwMDsCfM9xrX47O6KxNIBTRE
	 y0aw4c5gU/hmA2Ja39u7FHTFdjNT6ZolCF+5JwkW61cowVJ/WsAZqAdxuhuiTqyTcb
	 IWkt01azfNCaw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Nov 2025 18:33:12 +0100
Subject: [PATCH 2/2] clk: qcom: x1e80100-dispcc: Add USB4 router link
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-topic-usb4_x1e_dispcc-v1-2-14c68d842c71@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763487196; l=1099;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wbdd2tkxTdZv7Y0gsKjwzwa6MBdYhKZzB2+xXmlj4lg=;
 b=8wTn4HJyseMuZhNd1RcG0ehw4sCnRe9DNb/SXFqBUzr6htGkOtq+wXvziEYLQm3ZrAUSluabZ
 A9cslyS4J7qDmy+6BPrQa/qlF/Fkr4+KdX8Ee/OfxHq9IcPhIBnzgNs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The router link clock branches also feature some reset logic, which is
required to properly power sequence the hardware for DP tunneling over
USB4.

Describe these missing resets.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-x1e80100.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index 40069eba41f2..aa7fd43969f9 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -1618,6 +1618,9 @@ static struct clk_regmap *disp_cc_x1e80100_clocks[] = {
 
 static const struct qcom_reset_map disp_cc_x1e80100_resets[] = {
 	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
+	[DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK_ARES] = { .reg = 0x8044, .bit = 2 },
+	[DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK_ARES] = { .reg = 0x8068, .bit = 2 },
+	[DISP_CC_MDSS_DPTX2_USB_ROUTER_LINK_INTF_CLK_ARES] = { .reg = 0x8088, .bit = 2 },
 	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
 	[DISP_CC_MDSS_RSCC_BCR] = { 0xc000 },
 };

-- 
2.51.2


