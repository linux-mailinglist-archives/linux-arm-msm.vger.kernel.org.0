Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B1B649078
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiLJTpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiLJTpM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:45:12 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850C815FCD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:45:11 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id q7so8446621ljp.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTxXPZd/zZjPTG8mdYq9Nva84UN185kLKQpiTCuVtMU=;
        b=FZTjPlbWw+TbRJ2Kj0tMIaKWJVzalvhg7MHIHxG55fl8EdqXEsfD9jqMAc7f2UgFaA
         NPv8vRO55RgRbfCEycV7+pKmENF66Od4YtX+HmZilRzCSHXisc9ctiofWX1+0UaWIMUA
         uMfShdcz7vZRIZAr61QPbJYEwJLwTFUWmKa3M+TtgM/fD1egqL7nEDCDObw2XHG08P5O
         lsCt6fKt2VZLqWABIETPckEYjsn/R8cg0WYRUR4NMlsIeEdlT+m/XATZCKmJazBXVAv3
         twHK6c4a0GcYDfIkz4wbo3byGgkxXs38OnjHKe1QSliH0KFYU2Mt+dhT2GYIl2WWg2IQ
         mKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTxXPZd/zZjPTG8mdYq9Nva84UN185kLKQpiTCuVtMU=;
        b=Mt3WZcnqw1WGZ/aPi82MZukt7qQfcjiQhRz7eDAKug5IdkBMa9EXJqLNMRWvkkGHiP
         rrPG6WDTkCR+s5MAz5AcmZVAICUJmJS3PIrApR8Sp4xbFsj1yuDtnGrjyKxpTI99TLB1
         ZkCO6r112s0W6HZe1MO0qHkfHsOw36RNiS9NXYockaTG+Y79TEngrUfQqIm907e5RBSb
         V79o5bcMAbzQqimxZDnKrg+66hynnOkUdHP1h8YDL6R2pM8x2Me7G7fgqCijb7BKDi97
         45CswLWSSK9IDWExWunsh4alKl/LjfQa4VwB4jw5WslCKzVTIND3XZT/JvRUGMagBWRY
         1Y1w==
X-Gm-Message-State: ANoB5pnhPlst0TQavoxoMP8XMvb++92WobaXN96cfRCK/CAQa7L1y1Mf
        X6AzlbiimT1nveRwOqhSFUTgug==
X-Google-Smtp-Source: AA0mqf6J2jcLAR9SYvdeH3fneOmZZXtIjvdA8btylCzXRdtef9icrhaJTY4kR9G4eviPPpHXtHVfYA==
X-Received: by 2002:a2e:9b89:0:b0:279:fa66:a154 with SMTP id z9-20020a2e9b89000000b00279fa66a154mr2594996lji.34.1670701502839;
        Sat, 10 Dec 2022 11:45:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e9-20020a05651c038900b0026c42f67eb8sm721952ljp.7.2022.12.10.11.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 11:45:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] arm64: defconfig: build SDM_LPASSCC_845 as a module
Date:   Sat, 10 Dec 2022 22:45:00 +0300
Message-Id: <20221210194500.464556-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221210194500.464556-1-dmitry.baryshkov@linaro.org>
References: <20221210194500.464556-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the low-power clock controller driver used on Qualcomm SDM845
platform (Thundercomm RB3 board).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 536276b1610f..2ba78e91ad2f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1108,6 +1108,7 @@ CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
+CONFIG_SDM_LPASSCC_845=m
 CONFIG_SM_CAMCC_8250=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_GCC_6115=y
-- 
2.30.2

