Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E94625B97F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 06:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgICEAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 00:00:23 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54209 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725843AbgICEAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 00:00:19 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 6240B5C01CF;
        Thu,  3 Sep 2020 00:00:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 03 Sep 2020 00:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=kGU1vj1XbPmI3
        GbcVRuOLRdT/UokAk5NkRE0C6HEpFU=; b=Kav0Y9YAS9HFWVGY9Hn5elC31ASXJ
        9gbkssJLzdj5Qm2qyEiBhoXUq24qOVyMNcZhnx/cZGnkzNAmDCpAQOKihKoIOOR/
        h91eOk6R2usm4twMvrMzUf4qqEHDQjsaBir31fFirv72huZ8gLU4OXOjqjjRKP2R
        Jz59EYEMY0ofVCMeNnVMcIBGJBUFF4/+Rs8UEhfJCw7x4IlfE3uRbXRyp1b0tdqC
        Iwkc9JoHnMKIBFn9qj7LFvZWCIph8sxaPgu/sL4Ak75m3wVcAdXhFk7wMBdzJ6Hh
        Ga1wi3g6FNMHilksK6tKrEo056ZKdn/XkPfF9Xcro3EGGKcWgT1n0DwTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=kGU1vj1XbPmI3GbcVRuOLRdT/UokAk5NkRE0C6HEpFU=; b=toW4nqzL
        c/GhCWcPpZP8p4/r5ScvQmZiSDreftq3W4cXwSdqsVmt7N+hL7ztRiJPUy9Jh+ZA
        urATG6M1L1bamLFk65/A23LwjOKfXKRLnaTNyS50uoKVKAOuE9289k7zqMp+vfkD
        e6uqkXwOfdRfV0QbyQvdTlm4r1MGO3CQ6nUie73nUTL76J2Xaw88C826S2z9emAH
        O9hwBehCzRgBB8g5WIFSfh9wq8C6AeE4BNLENhE7c5qDjNT7dKfdlA+6YCKvPZtb
        dcEukayYBrPr3GxKsV5yTM4/nmTqPDzub9pxJAWMZZaVnwVcbwNS/0vrM2idBshV
        DYKaZM/x63Gf6A==
X-ME-Sender: <xms:UWpQX0gx8v8zzCsi9eCKU3-h1W0HuEFE0AbaJzpL8YJQwI3H6powWA>
    <xme:UWpQX9DHu7iyZH-o24vm8uqPhRJCDHlrt0SQGYDHKGSOgRTpSP1bKyeS-bYyFbg1d
    jyh2cOD_1sOg_lt_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:UWpQX8FLmeiL76mB_zwJVLOrCZHQxXN4jwHbA85V9-FvgyRufkz3Lg>
    <xmx:UWpQX1QTJDyW34XT83NGlCuTai7dzjFCiAfikfCNnGH1crdrt2VJ9w>
    <xmx:UWpQXxx3beqUKZ6CIFw-_k0g7Qt2BPYspRXf1OaUMhKODtL5ENp1cQ>
    <xmx:UmpQX4l47uA1tuxr1FzrRoUER1Qfv6Bcd2eclUetvGvMoQkSilKZEg>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6773630600A3;
        Thu,  3 Sep 2020 00:00:17 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH RESEND 2/2] Revert "clk: qcom: Support 'protected-clocks' property"
Date:   Wed,  2 Sep 2020 23:00:15 -0500
Message-Id: <20200903040015.5627-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903040015.5627-1-samuel@sholland.org>
References: <20200903040015.5627-1-samuel@sholland.org>
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
2.26.2

