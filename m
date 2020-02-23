Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6EE71695CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2020 05:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgBWETv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Feb 2020 23:19:51 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53607 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726884AbgBWETv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Feb 2020 23:19:51 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 5824321B01;
        Sat, 22 Feb 2020 23:19:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 22 Feb 2020 23:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=3tufXe1fL7t2q
        MfUV7AoAiRO7jy5bJvdqR1dzLQlDus=; b=TsBQ7D98kh1a8h/iD/7I72q/WG6yY
        0pkwFIcJndxaNtJ+XQ9l+MNjsh7Z4W27s/+7CM/8BCOkx0a1JlsWAqtESIP/tPfk
        9rXkDeGOsOtYtn7sDaZTaZ6koH9O62VWP7y0ybUX0FXH+mIRCp99rv5gP4cAaplo
        uK6GKuddfNKXy3x7Mksw7RR7M9iSbt/mMcJKTau/W7rUfEK6507yRHHPdk9F1Dal
        Dq0qR0DIItwLDPauI8ks4Awdkzl4WBuKH+53CMzO8oqsajoz8h7Fxa1gYRV31SLg
        sYYk9SOr7JkE5jCEri8swDi2Z4ENGpcvJMCIInjr/A0fx68g6ALha2XBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=3tufXe1fL7t2qMfUV7AoAiRO7jy5bJvdqR1dzLQlDus=; b=s72qjcMR
        rkgX7SucHtZUUEYCFB1aG7fR7wLJ94MeJIVywjxQNFwGWAHpm9ghrmQTkhlvicI7
        pxiWYaXH1tc4koeocnjm3RoEWPD2SiAm4FFl1p0DJElRb/ZSCE7rE2w0+2txjtpN
        bGxHbWV+o/wGpuJPWSI4yEfsAaB+iXAp3Njlo7tmt3ymiRqkpYj1zkMeU+06VcG8
        DGJeIXYPbPPLASNFT/Cv9iwNI28kZLu13e9cr4FbT74XJ5z62EQBk1Uq66G/70Kn
        GHQftx9sgjdEcBb05sEm3BY0i9y4QEq1OOJ4Wly6A6WFBGzKEVtvYhjAG4dfv1cg
        bnQ9MOuaR4PYuA==
X-ME-Sender: <xms:Zf1RXqidYo4dxs34wPwvLCTzrcnBicU1EgWtK3TuduAI0iq7y2NCIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeejgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
    ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Zf1RXn7ln8dz9-LF5s3x_RmmCbIFy7S7lt2mdXPtq88lfcjZn2ESEw>
    <xmx:Zf1RXh2g-IjbKl_TKWU9VdY4M8oURlTNwxFIG3cPxiaCgRBsecu7-A>
    <xmx:Zf1RXitq8vP3mDa2BhFMBC2GNAfB7wtUwKULDBrfybSSRdFN8fYLFQ>
    <xmx:Zv1RXiYirALwDSpzHxQ2bD2RDBBwxKqnfi-8LQGqZzqV9UioZoccXg>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4A0C4328005A;
        Sat, 22 Feb 2020 23:19:49 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/2] Revert "clk: qcom: Support 'protected-clocks' property"
Date:   Sat, 22 Feb 2020 22:19:48 -0600
Message-Id: <20200223041948.3218-2-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200223041948.3218-1-samuel@sholland.org>
References: <20200223041948.3218-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that protected-clocks is handled in the clk core, this
driver-specific implementation is redundant.

This reverts commit b181b3b801da8893c8eb706e448dd5111b02de60.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/clk/qcom/common.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..6e150fd32dbe 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -194,22 +194,6 @@ int qcom_cc_register_sleep_clk(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_register_sleep_clk);
 
-/* Drop 'protected-clocks' from the list of clocks to register */
-static void qcom_cc_drop_protected(struct device *dev, struct qcom_cc *cc)
-{
-	struct device_node *np = dev->of_node;
-	struct property *prop;
-	const __be32 *p;
-	u32 i;
-
-	of_property_for_each_u32(np, "protected-clocks", prop, p, i) {
-		if (i >= cc->num_rclks)
-			continue;
-
-		cc->rclks[i] = NULL;
-	}
-}
-
 static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -272,8 +256,6 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	cc->rclks = rclks;
 	cc->num_rclks = num_clks;
 
-	qcom_cc_drop_protected(dev, cc);
-
 	for (i = 0; i < num_clk_hws; i++) {
 		ret = devm_clk_hw_register(dev, clk_hws[i]);
 		if (ret)
-- 
2.24.1

