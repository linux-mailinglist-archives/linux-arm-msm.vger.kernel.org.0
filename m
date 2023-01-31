Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 562D4683710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 21:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbjAaUEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 15:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbjAaUEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 15:04:22 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BBF564AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 12:04:21 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6801622DA8;
        Tue, 31 Jan 2023 20:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675195460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=53yNYbl6xOpRy23zelwug0gSx1HXLYXSbbxVHvhJMWY=;
        b=n98mnwds3wKWDxd0Hz8dB3P7MYfZB+2R65hW88r2yPjMNRv1ib79zgTkeRGHm/j6p6rv5e
        AibFTG7uolZlGHOI893PrggvjWWAfh6M2j7rwFg0IQSl6KKWbVQxOdeiaajyTRt9IfkcBS
        ji6rdBNDMcoxmjamVdaiQXDIf9/z4JE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675195460;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=53yNYbl6xOpRy23zelwug0gSx1HXLYXSbbxVHvhJMWY=;
        b=nlx5p6r4OaHhhV5jBq35sPslgAs2If7EFRedDnzVFM1b1pC8dry6NAHvAdkDZDa2jGZdA0
        +oHNRDb80DpuQhDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04A70138E8;
        Tue, 31 Jan 2023 20:04:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QDGbOUN02WOeQQAAMHmgww
        (envelope-from <pvorel@suse.cz>); Tue, 31 Jan 2023 20:04:19 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: [PATCH 2/2] arm64: dts: msm8994-angler: removed clash with smem_region
Date:   Tue, 31 Jan 2023 21:04:14 +0100
Message-Id: <20230131200414.24373-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131200414.24373-1-pvorel@suse.cz>
References: <20230131200414.24373-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This fixes memory overlap error:
[    0.000000] reserved@6300000 (0x0000000006300000--0x0000000007000000) overlaps with smem_region@6a00000 (0x0000000006a00000--0x0000000006c00000)

smem_region is the same as in downstream (qcom,smem) [1], therefore
split reserved memory into two sections on either side of smem_region.

Not adding labels as it's not expected to be used.

[1] https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-mr1/arch/arm/boot/dts/qcom/msm8994.dtsi#948

Fixes: 380cd3a34b7f ("arm64: dts: msm8994-angler: fix the memory map")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi          | 5 -----
 arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 4 ++--
 arch/arm64/boot/dts/qcom/msm8994.dtsi                      | 5 +++++
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index cdd796040703..a100b05abf56 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -60,11 +60,6 @@ reserved@5000000 {
 			reg = <0x0 0x05000000 0x0 0x1a00000>;
 			no-map;
 		};
-
-		reserved@6c00000 {
-			reg = <0x0 0x06c00000 0x0 0x400000>;
-			no-map;
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 59b9ed78cf0c..29e79ae0849d 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -41,8 +41,8 @@ tzapp_mem: tzapp@4800000 {
 			no-map;
 		};
 
-		removed_region: reserved@6300000 {
-			reg = <0 0x06300000 0 0xD00000>;
+		reserved@6300000 {
+			reg = <0 0x06300000 0 0x700000>;
 			no-map;
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 9ff9d35496d2..24c3fced8df7 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -228,6 +228,11 @@ adsp_mem: memory@c9400000 {
 			reg = <0 0xc9400000 0 0x3f00000>;
 			no-map;
 		};
+
+		reserved@6c00000 {
+			reg = <0 0x06c00000 0 0x400000>;
+			no-map;
+		};
 	};
 
 	smd {
-- 
2.39.1

