Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C8469B278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 19:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjBQSmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 13:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjBQSms (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 13:42:48 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D895683D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 10:42:45 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7021534444;
        Fri, 17 Feb 2023 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1676659364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=JKqzWsocOn/shOcKCyJ/q9IjwayZWFBuif4lFSbr3eU=;
        b=Hpd/zEVCvO6rO6GWLUXfSr9PbW3Jhp94E6JRyaTPVS0IR6Dj+9YPG4ZgZZCDZoXrZYmo8A
        9uQL+O9IE13tYmRx1Kdm1KS75YMYlXwkxbnalpArckgUVvLSsGfdzciEcwx3+hXE7+YNhz
        JLzRra0VelTw0UF2eawD5/R6OvaA27o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1676659364;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=JKqzWsocOn/shOcKCyJ/q9IjwayZWFBuif4lFSbr3eU=;
        b=TXHRsaaDW1x3rt6d161arOQs50oieclJl91DMGph9j6SW51Dk2hAwOCHb6ZSwDoBzlCDoA
        2zN1j8vkjbt5Z9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8DC213274;
        Fri, 17 Feb 2023 18:42:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id y/eSK6PK72MvAgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Fri, 17 Feb 2023 18:42:43 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH 0/2] Switch msm899{4,6,8} clk drivers to module
Date:   Fri, 17 Feb 2023 19:42:37 +0100
Message-Id: <20230217184239.21450-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.1
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

Hi,

based on previous discussion, tested on msm8994 angler.
I don't dare to set arm 32bit clocks in multi_v7_defconfig.

[1] https://lore.kernel.org/linux-arm-msm/20230208230628.xoaqt4hby5ec4s6t@ripper/

Petr Vorel (2):
  arm64: defconfig: Switch msm8996 clk drivers to module
  arm64: defconfig: Enable qcom msm899{4,8} clk drivers

 arch/arm64/configs/defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.39.1

