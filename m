Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1B251C2EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 16:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238019AbiEEOw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 10:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235620AbiEEOw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 10:52:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683DE5AED1
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 07:49:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b18so7870727lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoZ0Eqmh4BqqsWbphqJgjka9zGhcz3eJW4qXEdNNikE=;
        b=ZIOGpHP4emKueopZmD0eqixb8cX4DymanLeICsPrjwODSLt1hR4l66LB1raRTNjepM
         yGcs41mD8rUghVDHk/9X1HHi2hpvqEMgNXDYQ79nAA1glpRDDP5Ogc6PJ0jf7G1ovGfi
         QxMDTNsmmt90r9a+quYlMbTavI0TalNVET08H1mrX5ZoNrD+r/PTxizR0Z8HBcU8S9ux
         MHF24n3ek8lbcG/XLraNxHYe/vf1qWEBJH2rs4m2cjqkoCymYYqlKjstuBwp2bcvlKpF
         4LRvKAmcGl2nmmEPhmXdLd/avBHcMUJpUn6NXgPM6+4xZZffObeTlQKZY8R8nfmHS3Wx
         7FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoZ0Eqmh4BqqsWbphqJgjka9zGhcz3eJW4qXEdNNikE=;
        b=N8AEVKz8HCmOIyqnUcdWTuzy4MVWmt8mHMU4+40/pJ0Dj418DwVap1Ruw+D4HcAf/h
         Ec3GnJjwcT8LKzbN5yf6ZBngC3iez7LX7xtDXIhYuTRArbeERTCRlMrIMAajn8/D7Wre
         vNfqq6hFoFp8yto3xpEKDOgs/2nABOtacOlj4kugBq+DYupDqeNSyweNbxVgKv/kxhvS
         PtWpHrkcuFF9yuIs4YouZ+IWDyRD7GG+mgyg4LXD5T3BzSH1dF02FTWGn56iKaIWbDJQ
         Km61UR5gPzDmEKvLdPC2pzEvNugBidbFcQ6PXFFHeEoRjvBBbAb/CBPeVEekZpbiEsXR
         kkdw==
X-Gm-Message-State: AOAM531Cg+L1Qmx8d3eaaru8zGwoDXKr9jmZIJ8Qkv407sDiaocHer8C
        A/sKbUNP9H1DTDTml0WYWBakX2rdqJH/wQ==
X-Google-Smtp-Source: ABdhPJzXrOKhzZMIjMNv500jpBm14maFcd5lBaoMdBcvU/G/L9c6RzbEPK7BhRlEWXanCgez5qwHGw==
X-Received: by 2002:a19:5043:0:b0:472:36fd:4fc2 with SMTP id z3-20020a195043000000b0047236fd4fc2mr17916965lfj.258.1651762154549;
        Thu, 05 May 2022 07:49:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1-20020a19ca41000000b0047255d21205sm236414lfj.308.2022.05.05.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:49:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: enable Qualcomm LPG leds driver
Date:   Thu,  5 May 2022 17:49:13 +0300
Message-Id: <20220505144913.1432346-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the driver for Qualcomm Light Pulse Generator block, it is used
on many Qualcomm platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bc9cdb7854b2..883d0cc7308f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -934,8 +934,10 @@ CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_LM3692X=m
 CONFIG_LEDS_PCA9532=m
+CONFIG_LEDS_CLASS_MULTICOLOR=m
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
+CONFIG_LEDS_QCOM_LPG=m
 CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_DISK=y
-- 
2.35.1

