Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE1F4F0C94
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Apr 2022 23:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbiDCVP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Apr 2022 17:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiDCVP2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Apr 2022 17:15:28 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01935DE92
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 14:13:32 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b21so4276516ljf.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMPaPyy8X1OwWohD/hMg5RjGIJzh0j06aGMAa/tRO58=;
        b=xtCHaXEL3B7JtJmiOfgw/5K797OjvdWN4RDGY74bocZC1BIXK0aIeTJvVIW98LFV3E
         yk66NlhuzHmUBuQoAVK9AhTThKlDQaar9bkkYyykR7lxLCWsYsibthKYNOaYv5Ax2Gfv
         E3gLzo0R6c/35nQvxJKwob1nI4tdB8ElFueAW38+E4etYTL1DHtKVM+FNvbY3T0StdbU
         bGiESxS0immLPMoUNofLfrc7kjRPXXCJSsn+mNCj/WfZYhL8cmUhN4OxhX/MaR7rJuvG
         zylN+OB1pBWVcAfJRm8YhCttACXZG6RZ2FYquodJBKzs8y6X4q5ejwv0X1XTtbMJtoXr
         qY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMPaPyy8X1OwWohD/hMg5RjGIJzh0j06aGMAa/tRO58=;
        b=fb4y0NgUFZUBq7r9NcnflZpzeXQr1pI6neH9belmzLl5i1HHkj7L1IjkgFuSYpoGPV
         s9ZJGuFT7h/7xu44h+uVzx1VjsdLafTtaXwgjtbCiRc2o73KlhxKHOBEQzxl9pHHXCVc
         tXoEZ0S15cItruTl8A7kyEacx1Del2znpdFDyNtbExl784pQmycP6Dqk9IT0yQj5IjBr
         IUPZfbwbWw8XgeOL2Lm+UpOxBEvaOoggPCCN22uUFiDjMbG2eNdOQ+9VExlAbTIZdANw
         PQFupITLcfKRJpMI6ZeqyNvaONdyfTeQNe6ZHfI8eu9QMGSw538A2zg6i1T7y4x+dCd+
         +z+g==
X-Gm-Message-State: AOAM532BCHAIMUt3PeaqC03dWZ3muddiaG+adMWVpoKys4ow0QutWpHV
        jIvgaFRHzJbFRLTAFYER2oKLzQ==
X-Google-Smtp-Source: ABdhPJwoXD+8n28HUyZcUcnPakmo7z1m2dDv8Ak6BfD2fTj86msxhYmizVvchSvR3vBL8TQShPQZ9g==
X-Received: by 2002:a05:651c:1501:b0:249:8d28:5659 with SMTP id e1-20020a05651c150100b002498d285659mr20206317ljf.138.1649020411244;
        Sun, 03 Apr 2022 14:13:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v21-20020a2e2f15000000b002456e6cdab2sm866255ljv.93.2022.04.03.14.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 14:13:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: enable wcd9335 codec as module
Date:   Mon,  4 Apr 2022 00:13:29 +0300
Message-Id: <20220403211329.1410725-1-dmitry.baryshkov@linaro.org>
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

Enable CONFIG_SND_SOC_WCD9335 to built as module. This enable audio
codec used on the Qualcomm Dragonboard820c device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a6564664676d..554080f02963 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -823,6 +823,7 @@ CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS571X=m
 CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
+CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.35.1

