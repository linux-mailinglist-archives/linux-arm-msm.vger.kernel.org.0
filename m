Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B6469B27A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 19:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjBQSmy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 13:42:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjBQSmt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 13:42:49 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8B65EC92
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 10:42:47 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 32D9E20D33;
        Fri, 17 Feb 2023 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1676659366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K9twRDV9zKb0K7kEef7pmiWSU9fJecbHnyqp3pFfZeY=;
        b=Ol/nWobd7IO1/+8mJ5wo0x6stk4imc0UyzKF/Hu7JXaaWDSf5aMHv48RBXnRfs6oewaDX2
        c3IaSlCKFu/Gi2wpVHj5j4OCczHOhF0cZlyqKrwOxxkyzgbj2dAHGvfuv07JXPs+Wu10m8
        mgIPJYRulKWhCwBM+Ncw9uOhRC4Edqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1676659366;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K9twRDV9zKb0K7kEef7pmiWSU9fJecbHnyqp3pFfZeY=;
        b=cjrQhEOgHZr6MHYppAcXNI2m/eBcNnbVJKq+lCHQetOSS2dyB+tUYgfGP6sZnnEiEcsMdU
        UM8ectqSs4v/WIBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BB1913274;
        Fri, 17 Feb 2023 18:42:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id SFN7FqXK72MvAgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Fri, 17 Feb 2023 18:42:45 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 2/2] arm64: defconfig: Enable qcom msm899{4,8} clk drivers
Date:   Fri, 17 Feb 2023 19:42:39 +0100
Message-Id: <20230217184239.21450-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217184239.21450-1-pvorel@suse.cz>
References: <20230217184239.21450-1-pvorel@suse.cz>
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

Enable the rest of qcom clk drivers on arm64, enabling as module,
because there is a support for probe defer on the power-domains.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a3d4a0c2c50..4f3f728b0ee5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1107,7 +1107,9 @@ CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
+CONFIG_MSM_MMCC_8994=m
 CONFIG_MSM_MMCC_8996=m
+CONFIG_MSM_MMCC_8998=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
-- 
2.39.1

