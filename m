Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A126564B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 19:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbiLZS6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 13:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiLZS6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 13:58:38 -0500
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07FFE61;
        Mon, 26 Dec 2022 10:58:37 -0800 (PST)
Received: from email.seznam.cz
        by smtpc-mxd-695c6957-dx4vg
        (smtpc-mxd-695c6957-dx4vg [2a02:598:64:8a00::1000:4c7])
        id 1bb4020fad94bd541bb3bc78;
        Mon, 26 Dec 2022 19:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
        s=szn20221014; t=1672081056;
        bh=NL/7VPzQpLbEfmL8j77MPiVdn47WRUJI6I8rxExWd0w=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=hjn6RzKPfrp4HqGa29/jAiUeVsL0ekYI2TnVeg7K00R9J5Oga120poGmbpbYiO2KQ
         VKOO3yU/DK3F5Apof8PYTN2aabzEVWFf4K4zmV1yZSH5ud3uIVgik2NxT1D3bmjpeS
         SSC4m2wKqv6kaXfbtYWL+OulwymUYqbSyerH8FNfYt7jpZ3Be8yTXdSpGo9QLX3c2d
         MHIjLjTOcaWRzyp27Bi7ah6nWjBtJGk2MEDzZjuOTrLLqMN4f8uVTQJHIbi7c9zog2
         LZE+rU1kFfIrp+SLIxFp/1ZK1RrMSmvnZYQ2xjgzESpxVFamOnAsNJmPLIxxojULhW
         06neZPiowQ7HA==
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
        by email-relay17.ng.seznam.cz (Seznam SMTPD 1.3.140) with ESMTP;
        Mon, 26 Dec 2022 19:55:02 +0100 (CET)  
From:   Petr Vorel <pevik@seznam.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem size
Date:   Mon, 26 Dec 2022 19:54:38 +0100
Message-Id: <20221226185440.440968-2-pevik@seznam.cz>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221226185440.440968-1-pevik@seznam.cz>
References: <20221226185440.440968-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Petr Vorel <petr.vorel@gmail.com>

Original google firmware reports 12 MiB:
[    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000003400000, size 12 MiB, limit 0xffffffffffffffff

which is actually 12*1024*1024 = 0xc00000.

This matches the aosp source [1]:
&cont_splash_mem {
	reg = <0 0x03400000 0 0xc00000>;
};

Fixes: 3cb6a271f4b0 ("arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping")
Fixes: 976d321f32dc ("arm64: dts: qcom: msm8992: Make the DT an overlay on top of 8994")

[1] https://android.googlesource.com/kernel/msm.git/+/android-7.0.0_r0.17/arch/arm64/boot/dts/lge/msm8992-bullhead.dtsi#141

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I'm sorry for introducing a regression.

Kind regards,
Petr

 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 79de9cc395c4..123ec67fb385 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2015, LGE Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
  * Copyright (c) 2022, Dominik Kobinski <dominikkobinski314@gmail.com>
  */
 
@@ -49,7 +49,7 @@ ramoops@1ff00000 {
 		};
 
 		cont_splash_mem: memory@3400000 {
-			reg = <0 0x03400000 0 0x1200000>;
+			reg = <0 0x03400000 0 0xc00000>;
 			no-map;
 		};
 
-- 
2.39.0

