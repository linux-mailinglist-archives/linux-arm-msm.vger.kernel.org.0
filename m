Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8300E56576C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 15:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbiGDNdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 09:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234916AbiGDNcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 09:32:25 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B27312ABB;
        Mon,  4 Jul 2022 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tZal9g+KULs2rwjCJYcH963Bi4VPFEoj6DhN1tkYw0U=; b=Gt+MBoYWTdzeGfweksv9MzPMm6
        MrSb0HiozJfb0keN0kgnVS1UGJ1/w1+QhJ8o8iqSlrh+PlfjZqhN7i56YppUhRsdq3vbsM2FyVXmW
        sglsFSEIQTf3otDNH/o8760tV2v4hfwYtuz6nCX4i+HzjhSFQN6Zj1euPVX8QXfU0SdHdKzpIrvdw
        q8njzg/qKU3+MXprBWW0O4AMv2SAJdY/mzlg/iCzGC0DNGbgl5BGQBwRbKhU4/nzcRttaVQ4TsPwf
        Fg+aSw9B9c9qu2rH9BgAkzE0aqan8AElxsAYDbZszPXhLcflFSE6RHa0JEjWt4kPX/glLPDoRUxX6
        IkqMfkyg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8M9i-0074oF-MO; Mon, 04 Jul 2022 15:30:26 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 4/6] clk: qcom: gcc-msm8909: Increase delay for USB PHY reset
Date:   Mon,  4 Jul 2022 15:29:58 +0200
Message-Id: <20220704133000.2768380-5-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
References: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB PHY on MSM8909 works with the driver used on MSM8916
(phy-qcom-usb-hs.c). When turning the PHY on/off it is first reset
using the standard reset controller API. On MSM8916 the reset is
provided by the USB driver (ci_hdrc_msm_por_reset() in ci_hdrc_msm.c).

While this seems to work on MSM8909 as well, the Qualcomm Linux sources
suggest that the PHY should be reset using the GCC_USB2_HS_PHY_ONLY_BCR
register instead. In general this is easy to set up in the device tree,
thanks to the standard reset controller API.

However, to conform to the specifications of the PHY the reset signal
should be asserted for at least 10 us. This is handled correctly on
MSM8916 in ci_hdrc_msm_por_reset(), but not within the GCC driver.

Fix this by making use of the new "udelay" field of qcom_reset_map
and set a delay of ~15 us between the assertion/deassertion of the
USB PHY reset signal.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 drivers/clk/qcom/gcc-msm8909.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8909.c b/drivers/clk/qcom/gcc-msm8909.c
index c551953d3791..2a00b11ce2cd 100644
--- a/drivers/clk/qcom/gcc-msm8909.c
+++ b/drivers/clk/qcom/gcc-msm8909.c
@@ -2670,7 +2670,7 @@ static const struct qcom_reset_map gcc_msm8909_resets[] = {
 	[GCC_SDCC2_BCR] = { 0x43000 },
 	[GCC_ULT_AUDIO_BCR] = { 0x1c0b4 },
 	[GCC_USB2A_PHY_BCR] = { 0x41028 },
-	[GCC_USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[GCC_USB2_HS_PHY_ONLY_BCR] = { .reg = 0x41034, .udelay = 15 },
 	[GCC_USB_HS_BCR] = { 0x41000 },
 	[GCC_VENUS0_BCR] = { 0x4c014 },
 	/* Subsystem Restart */
-- 
2.30.2

