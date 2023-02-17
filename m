Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C34369B279
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 19:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBQSmx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 13:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjBQSmt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 13:42:49 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9F623C49
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 10:42:46 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3233420D20;
        Fri, 17 Feb 2023 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1676659365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9xF/4lz5E5sm+C+V6iX8R7hLInjZZebEpf2rlqrSOf0=;
        b=rANH0pyuW8XYY2Diw/k7W+EJRrhALILmyti+lRjL3JKS7sfhyZ/2OPnZ3UTn2fYOTMzxlf
        a2jG3ZU4oupTl9nIivsis4DPILLDT1GaRpG3OH//EwPjUuoMgpoo9WMhiDf9nTItqDSDQb
        KRqlPHgmjwpp1eFZQ6Sjxsl/+GhQFa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1676659365;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9xF/4lz5E5sm+C+V6iX8R7hLInjZZebEpf2rlqrSOf0=;
        b=Gh/1j6lvVKLJkD6wrbgsco4+RwnwUirywuFXlrxB7AJAr+CMMJAEWXpi71Cs4j6y8XoOfy
        ck/T0bJc1cBMLaCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80F4013274;
        Fri, 17 Feb 2023 18:42:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id yBcYHKTK72MvAgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Fri, 17 Feb 2023 18:42:44 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 1/2] arm64: defconfig: Switch msm8996 clk drivers to module
Date:   Fri, 17 Feb 2023 19:42:38 +0100
Message-Id: <20230217184239.21450-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217184239.21450-1-pvorel@suse.cz>
References: <20230217184239.21450-1-pvorel@suse.cz>
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

Switch to module, because there is a support for probe defer on the
power-domains. This should be working since 2b28a1a84a0e ("driver core:
Extend deferred probe timeout on driver registration")

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 03762b376bb2..3a3d4a0c2c50 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1107,7 +1107,7 @@ CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
-CONFIG_MSM_MMCC_8996=y
+CONFIG_MSM_MMCC_8996=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
-- 
2.39.1

