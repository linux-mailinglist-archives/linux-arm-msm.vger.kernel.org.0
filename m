Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD332680BA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 12:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235921AbjA3LKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 06:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235917AbjA3LKf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 06:10:35 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18991A95F
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 03:10:29 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 403EF219ED;
        Mon, 30 Jan 2023 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675077028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=tTvJQNKPt3bcjIuvFlef/NPCv5oOTHR0yueTdGSEP0s=;
        b=iAU+2DQU7fNMHr1umOkWiXKxOJEAJqOnid6154k+FzTn6WGGELUdY6dUZgvwW7Qdu+Dbsg
        JHCP1K5NWNIu0oge2wCwpCUh8X3H7V79h1odDQBUBKlSjUM0PkmlP7ubQRJehsLTPyKyc9
        9jnosRwmeAQDXk/SoZ6EkdwuGuBQWnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675077028;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=tTvJQNKPt3bcjIuvFlef/NPCv5oOTHR0yueTdGSEP0s=;
        b=yBLZnFHDzLjd3clqIN+hdJtYG3EUtGEKWpoRwy7wuZsZa1zWe6Qbgf6gmPdW2MW3fNPdql
        nyj1YmUXv42+EuBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E725C13A06;
        Mon, 30 Jan 2023 11:10:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id a0AANqOl12ObHAAAMHmgww
        (envelope-from <pvorel@suse.cz>); Mon, 30 Jan 2023 11:10:27 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: [PATCH 1/1] arm64: defconfig: Enable qcom msm8994 clk drivers
Date:   Mon, 30 Jan 2023 12:10:14 +0100
Message-Id: <20230130111014.27980-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.1
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

Enabling the clk drivers on msm8994 allows to boot and test most device
drivers on this SoC.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
NOTE: Working as part of SUSE hackweek, that's why I use my work mail
instead of usual private gmail.

Kind regards,
Petr

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bfafb4313436..c6b08a9d8944 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1105,6 +1105,7 @@ CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
+CONFIG_MSM_MMCC_8994=y
 CONFIG_MSM_MMCC_8996=y
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
-- 
2.39.1

