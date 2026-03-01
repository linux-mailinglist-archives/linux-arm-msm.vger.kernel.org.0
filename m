Return-Path: <linux-arm-msm+bounces-94673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKr2B0mVo2l7HQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 02:24:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D71CA703
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 02:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3971306F399
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 01:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39877257ACF;
	Sun,  1 Mar 2026 01:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZ6qolNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1696B24A076;
	Sun,  1 Mar 2026 01:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327942; cv=none; b=XIdzUP4NLfBm3M0UwL6N8HKlbC/IgOTXkYmkssoshkfoecAl5V2UVukhjCcF1Z2g02n26bYy6Ak/K6nPvOXHB7pKIr+vU7fM5PR0gTA7fkPVSS6dpUZSIdAQ/3eSmS8m7oX5NUIud/p/3CPnSiNRmTVVjiW2pEHWBC4qRDh8mE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327942; c=relaxed/simple;
	bh=UjAzZ2KRBnSlhhiqG1iN7IwjVD1fMhKONsQjSkYLGBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0G+AszrEaxlgJbsnmmW1/cBPPiT70WLx+QB+FUVgfiYzZwIiXqA/KrQoL4fQaQXixl+aXlpEwghMS3H7JUjjkKvYWJlxMP5QP3a8k3TeN6dvf+6ZsoJ78bUAE5Te8PXfzjILUGC4TCvm8dx7AOu177DtnZFelPO49CMsOpDiFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZ6qolNz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C78BC19421;
	Sun,  1 Mar 2026 01:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327942;
	bh=UjAzZ2KRBnSlhhiqG1iN7IwjVD1fMhKONsQjSkYLGBI=;
	h=From:To:Cc:Subject:Date:From;
	b=RZ6qolNzZbPjhABC5WSRoDpH0VFZ+LQeqFhxv05ALclLUXTATtLLEDFs8JF8duQl8
	 1N36bga6jZdKYYzbrFJ/uyxJmksE4JLekaVoTO7M+17AOqfquP3sxjpzz8qunlUM88
	 C03bUbOBAbzbfLMaAciVvEalSVD1A4MU3QRifVEPbiwIu585t+guXBNqDFy+jcAdfX
	 Yn8MtdDemdQSARCX6PNXApdzpeuoti9sX7EPcMYGxGzVW0WphfL8+bXh4hdZTNbLLM
	 1+GzU+JFhGk12WQaUG4Funhk5uPujIjKpbn6p8FxfX+pJ6rwVu3Cyhtsz4bCGpyhmT
	 2UQft4D7TmzxQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	abelvesa@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: FAILED: Patch "arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:18:59 -0500
Message-ID: <20260301011900.1673538-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94673-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aec2a00:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF8D71CA703
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 0907cab01ff9746ecf08592edd9bd85d2636be58 Mon Sep 17 00:00:00 2001
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 24 Dec 2025 12:53:29 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the
 DP PHYs

The DP PHYs on X1E80100 need the ref clock which is provided by the
TCSR CC.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, even though this change breaks the ABI, it is
needed in order to make the driver disables this clock along with the
other ones, for a proper bring-down of the entire PHY.

So lets attach it to each of the DP PHYs in order to do that.

Cc: stable@vger.kernel.org # v6.9
Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Link: https://lore.kernel.org/r/20251224-phy-qcom-edp-add-missing-refclk-v5-3-3f45d349b5ac@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 51ad2b2e6375f..03629639dcfb6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5929,9 +5929,11 @@ mdss_dp2_phy: phy@aec2a00 {
 			      <0 0x0aec2000 0 0x1c8>;
 
 			clocks = <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
-				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsr TCSR_EDP_CLKREF_EN>;
 			clock-names = "aux",
-				      "cfg_ahb";
+				      "cfg_ahb",
+				      "ref";
 
 			power-domains = <&rpmhpd RPMHPD_MX>;
 
@@ -5949,9 +5951,11 @@ mdss_dp3_phy: phy@aec5a00 {
 			      <0 0x0aec5000 0 0x1c8>;
 
 			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
-				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsr TCSR_EDP_CLKREF_EN>;
 			clock-names = "aux",
-				      "cfg_ahb";
+				      "cfg_ahb",
+				      "ref";
 
 			power-domains = <&rpmhpd RPMHPD_MX>;
 
-- 
2.51.0





