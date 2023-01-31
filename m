Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09A2683711
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 21:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbjAaUEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 15:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjAaUEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 15:04:22 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0DB5649E
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 12:04:21 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E7FCE1FF5A;
        Tue, 31 Jan 2023 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675195459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jheVMzd3Dfg9CxisTAH2whUJ4OLMlXxK2z0MaY32/kU=;
        b=gw8A4tZ07jE4UVd7519wvWkfzBGaVaWUX4X1D3of+TsUpYLPokQ5Qh/3MXLOWp63vndkp3
        a7SIaMb9nZbDo8IzABcGDIdnbRq4Z4m18XoJjEv/upPO3zZ80rHXq555NPKiiYMTla9ohw
        dX13d8DsOG6Nmgfe+5PFFRMueHegfRY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675195459;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jheVMzd3Dfg9CxisTAH2whUJ4OLMlXxK2z0MaY32/kU=;
        b=HP1Z0XkUPz7Q9RaFnW8S8BFXWchhpIhlEJvcq1BWDfwBOfiBEptuvDKR/RcDblhk/UOfYb
        6CyRHKmO+tsNfkAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 706E0138E8;
        Tue, 31 Jan 2023 20:04:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kCy+FkN02WOeQQAAMHmgww
        (envelope-from <pvorel@suse.cz>); Tue, 31 Jan 2023 20:04:19 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: [PATCH 1/2] arm64: dts: msm8994-angler: Fix cont_splash_mem mapping
Date:   Tue, 31 Jan 2023 21:04:13 +0100
Message-Id: <20230131200414.24373-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131200414.24373-1-pvorel@suse.cz>
References: <20230131200414.24373-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Angler's cont_splash_mem mapping is shorter in downstream [1],
therefore 380cd3a34b7f was wrong. Obviously also 0e5ded926f2a was wrong
(workaround which fixed booting at the time).

This fixes error:
[    0.000000] memory@3401000 (0x0000000003401000--0x0000000005601000) overlaps with tzapp@4800000 (0x0000000004800000--0x0000000006100000)

[1] https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-mr1/arch/arm64/boot/dts/huawei/huawei_msm8994_angler_row_vn1/huawei-fingerprint.dtsi#16

Fixes: 380cd3a34b7f ("arm64: dts: msm8994-angler: fix the memory map")
Fixes: 0e5ded926f2a ("arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
NOTE: this should be applied on the top of Jamie's patch:
https://lore.kernel.org/linux-arm-msm/20230128055214.33648-1-jamiemdouglass@gmail.com/

 arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 7b0f62144c3e..59b9ed78cf0c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2021-2023, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -31,6 +31,11 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		cont_splash_mem: memory@3401000 {
+			reg = <0 0x03401000 0 0x1000000>;
+			no-map;
+		};
+
 		tzapp_mem: tzapp@4800000 {
 			reg = <0 0x04800000 0 0x1900000>;
 			no-map;
-- 
2.39.1

