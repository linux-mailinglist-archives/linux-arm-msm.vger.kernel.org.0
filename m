Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 799724E7D2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiCYXpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 19:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiCYXpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 19:45:23 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7DCEE
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 16:43:46 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id o13so7629927pgc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 16:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NjmE0PbFYFwWsKdcKDF/bNsV7kfL0yBtHChWwZZV2Nk=;
        b=dhVDiHy3cwzTU6EjTh2wHXrFp0f8La0Hlxx+1p0r179QsSFa8KVV/LXnf+8LnUD+cs
         ehIKJvFujRCsjw73ryJQAX41ewUFVELwvHzXKCpuoKQWXroZS9Rb6t3QQ8xBsmU1AGGh
         xE+iI0xyGF3EX3dUWyVAQie47EkrOZEVE1T4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NjmE0PbFYFwWsKdcKDF/bNsV7kfL0yBtHChWwZZV2Nk=;
        b=7L7X4LQUvgPBobBJAxE8tcFte083Kh13YT2qgxg22BPRNzJfae27V6t5JFbheQvlZ5
         3owsF+2Xieca3uQZUS328fRkZfnlDcJF5EHbLD4TMqtfzCqaDUdTBy3Su/S0uxod488/
         IfQVqtikc6XElFXcLI1zOFW1vgi4sXwzGeeaKSwMc/ixGy2F+znx6DOe2X3Np/gm/1M9
         9up3VMD7B7Brm6CJlTjXDhzevmzcsCBlE1gA1yKzv6YW5DkJ6fKvyTXRnitTzh3ZEijc
         V1NsMI54P8NBl89fBDoyN9th/mtbwM5yfhrYLcp/FkSgu+RDQvEQT5eMvkBX8zQT6AFb
         jH7A==
X-Gm-Message-State: AOAM531izDVBkvuPGgcqlYhE8flfzTR87h7OTfIdqw3KtYHsyeSEI4p+
        4zkXxjBKYN+nOGuigN5KjLqAmg==
X-Google-Smtp-Source: ABdhPJyJWNcZYXWBiuyLykebWFydaiBJILXDLPfP7ZK5bmsAj6FnDcCpFLely8OGk2KReS0kGJOMuQ==
X-Received: by 2002:a65:41c3:0:b0:363:5711:e234 with SMTP id b3-20020a6541c3000000b003635711e234mr1494243pgq.386.1648251825790;
        Fri, 25 Mar 2022 16:43:45 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:5662:afcf:5e0a:c3a5])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000a9100b004e1b7cdb8fdsm8684525pfl.70.2022.03.25.16.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 16:43:45 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Joseph Barrera <joebar@google.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sc7180-trogdor: Simplify!
Date:   Fri, 25 Mar 2022 16:43:41 -0700
Message-Id: <20220325234344.199841-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's a couple patches to simplify sc7180-trogdor dtsi files further.

Stephen Boyd (2):
  arm64: dts: qcom: sc7180-trogdor: Simplify trackpad enabling
  arm64: dts: qcom: sc7180-trogdor: Simplify spi0/spi6 labeling

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 9 ---------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 7 -------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 7 ++++---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 6 +++---
 4 files changed, 7 insertions(+), 22 deletions(-)

Cc: Joseph Barrera <joebar@google.com>
Cc: Douglas Anderson <dianders@chromium.org>

base-commit: 52deda9551a01879b3562e7b41748e85c591f14c
-- 
https://chromeos.dev

