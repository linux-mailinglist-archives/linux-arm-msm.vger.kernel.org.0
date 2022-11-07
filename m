Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A5A61FE6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 20:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbiKGTPm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 14:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbiKGTPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 14:15:40 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73E32A268
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 11:15:38 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 130so11536203pfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 11:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCHSGnCFJ0y/u8SQ+Xtk+pvjFKxhWsoTtgBkVZ7qxaM=;
        b=TwTXuGCgoe+Z65wLfGNAl2YpRz2wltTlH9WaarTkzyxcNuqjq7OP/xRtRRBMbAKp/r
         yBLXUgFsTL3cz7EnQAj/lTBse27z/05qQbXwve0LY0Qhyox4COYPH5+V5SLO/lBcFYK8
         BqbpdoK40GlI5FVGftaGRXyN3+w6eU8I99ZA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCHSGnCFJ0y/u8SQ+Xtk+pvjFKxhWsoTtgBkVZ7qxaM=;
        b=d4ZKQz2lPDZgsFU6HZ//bK3OC0h+gYwGP5QDjQOAnq++UjUm0WHAdu4zkTo46WkO3Q
         F6eWj2LHNRom07ShWKSMIm33jXfLb+Q2f7hFu0XGC72vBAws5esSXzklpDKiMjliGRXD
         7fKf98vsS+CgMvtkv5aaPQanrZvMaBCJXOndOtcMFRfkBL0qp9XUB2hfX7+zaU6buMD4
         NiFBrifI4gG2h7j+WqNoKu8DOb/zNPbDQqQ95NlgXehWHzStM+qjeAGDmLq6adG4NU1P
         CJ8R8tagHyjpG0rE2llKqJWrpzMBM3n9Abs7/cY4ewsGNY4Y66mqqqU/gci13jzaxUAd
         bblw==
X-Gm-Message-State: ACrzQf05C6gBiQBwUOqFF53mysfHX40UTcWaSN2DiCkCe4KZRWfjStYZ
        e3RG9JogcLF0hxHxHA+VODqFEw==
X-Google-Smtp-Source: AMsMyM57yEmLDsxYkqy5WClNr4Ff1qFsZt/FJwLmrYrNwVcO744HMtZOn/erJGiCcLU+9G/pqnohcg==
X-Received: by 2002:a05:6a00:2285:b0:56d:5d42:3aa8 with SMTP id f5-20020a056a00228500b0056d5d423aa8mr44174929pfe.79.1667848538360;
        Mon, 07 Nov 2022 11:15:38 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:11a:201:4652:3752:b9b7:29f9])
        by smtp.gmail.com with ESMTPSA id r11-20020a170902c60b00b001830ed575c3sm5306627plr.117.2022.11.07.11.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:15:37 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH v2 0/2] Update fingerprint node on herobrine/trogdor
Date:   Mon,  7 Nov 2022 11:15:33 -0800
Message-Id: <20221107191535.624371-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series updates the binding for the Trogdor and Herobrine
boards' fingerprint node. Now that the binding has been accepted[1]
we're ready to merge this in the qcom tree.

Changes from v1 (https://lore.kernel.org/r/20220317010640.2498502-1-swboyd@chromium.org):
 * New patch for trogdor

Stephen Boyd (2):
  arm64: dts: qcom: Fully describe fingerprint node on Herobrine
  arm64: dts: qcom: Fully describe fingerprint node on Trogdor

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 20 +++++++++++++++++--
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  5 ++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>

[1] https://lore.kernel.org/r/166718941539.790.4332712127794687523.git-patchwork-notify@kernel.org

base-commit: 95fade4016cbd57ee050ab226c8f0483af1753c4
-- 
https://chromeos.dev

