Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE226951B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 21:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbjBMURQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 15:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjBMURO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 15:17:14 -0500
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F63E3596;
        Mon, 13 Feb 2023 12:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=lhyxKuMPg1u7LMbrIPrED88jm/sNAG8FaKoSTXSM6qQ=; b=gGnS1K0a5qOsL1e7hKa9ZodYZF
        ShK7zpvojBPiANCeTRC9NfKvmVnz8kj9xSHaJy+kD1QMKNsE4fNhPb0HVcvY7Yo/e6IsuCf9CQw8S
        Xs7YdHLdGCDjWnMdPY6wQtmRzRI+bivoYHHG3lBOL2FMt04pY6yAPBaIKAPH3CYPoDlvK1rjQ4LSL
        kbt65YavGRpO8wg04ulc3UsLbh1n0e1FrhLRNbljEizH/DVAT8/m6FUK7QlleSV51Ky7ewRST/Vyx
        L/hH1MOABKqwVlYl0qxZV4B65Tz7U1naY0jzP8UJ2xTwkNv1cCodtrqgpdcxloD1axSx2aE4DpLWU
        FuIvxylA==;
Received: from [187.10.60.16] (helo=localhost)
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
        id 1pRfG8-0012nR-76; Mon, 13 Feb 2023 21:17:09 +0100
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, kernel-dev@igalia.com,
        kernel@gpiccoli.net, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Harry Austen <hpausten@protonmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8996: Add missing property for OnePlus 3T
Date:   Mon, 13 Feb 2023 17:16:51 -0300
Message-Id: <20230213201651.1902323-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 5a134c940cd3 ("arm64: dts: qcom: msm8996: add support for oneplus3(t)")
added support for OnePlus 3T device, but missed the "qcom,msm-id"
property - without that, skales-dtbtool fails to build the device tree
image. Let's hereby add it, mimic'ing OnePlus 3.

Fixes: 5a134c940cd3 ("arm64: dts: qcom: msm8996: add support for oneplus3(t)")
Cc: Harry Austen <hpausten@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
index 34f837dd0c12..5dc8f0adab30 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
@@ -14,6 +14,7 @@ / {
 	qcom,board-id = <8 0 15811 26>,
 			<8 0 15811 27>,
 			<8 0 15811 28>;
+	qcom,msm-id = <246 0x30001>;
 };
 
 &adsp_pil {
-- 
2.39.1

