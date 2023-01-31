Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6035068370F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 21:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbjAaUEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 15:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjAaUEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 15:04:21 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A193256491
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 12:04:20 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 526A522D97;
        Tue, 31 Jan 2023 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675195459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Qyk+Yl7SgYwG/YWf/eaT3bVxsLhh91K+A9h4C+sg/qM=;
        b=EChDp2pv6Lg2SL26XqpOS4vToPPQonECudtB9I/dKw6IOOOU5WxpwtNVMrHz1+RDehcq6N
        J51roQj3+DkrApoXfChgzTO9gjW9l92lF7LoOb8C9Si8c0Q1cPCinvPbYB4q/5nUic0QuZ
        yKG9IECd0e7Iqc8IKAAD/UE2pYUPI2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675195459;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Qyk+Yl7SgYwG/YWf/eaT3bVxsLhh91K+A9h4C+sg/qM=;
        b=5Lroj2AyswiMlTZFGUZetxOmmfRXoBkA9AckrZ2Am2ghL/B6TWz5e3iVkYEmoctjZRty2j
        /x5L21JkM4L5WFAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C391C138E8;
        Tue, 31 Jan 2023 20:04:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id bCb7GUJ02WOeQQAAMHmgww
        (envelope-from <pvorel@suse.cz>); Tue, 31 Jan 2023 20:04:18 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: [PATCH 0/2] msm8994-angler memory overlap fixes
Date:   Tue, 31 Jan 2023 21:04:12 +0100
Message-Id: <20230131200414.24373-1-pvorel@suse.cz>
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

NOTE: this should be applied on the top of Jamie's patch [1].
(I'll rebase it if changes needed.)

Kind regards,
Petr

[1] https://lore.kernel.org/linux-arm-msm/20230128055214.33648-1-jamiemdouglass@gmail.com/

Petr Vorel (2):
  arm64: dts: msm8994-angler: Fix cont_splash_mem mapping
  arm64: dts: msm8994-angler: removed clash with smem_region

 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi     |  5 -----
 .../boot/dts/qcom/msm8994-huawei-angler-rev-101.dts   | 11 ++++++++---
 arch/arm64/boot/dts/qcom/msm8994.dtsi                 |  5 +++++
 3 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.39.1

