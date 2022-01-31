Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C804C4A5019
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 21:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiAaU12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 15:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239022AbiAaU10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 15:27:26 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FDAC06173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 12:27:25 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f10so2834910lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 12:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CoYp1DT3orunTN7t79pQgeCGznzZBnizlaRhvc0xhig=;
        b=Jao8smwOSz1HDyl9zCFCPl36KgBAlpChP2ESB9b1aoo5i7mhumtLQ75DQQAl3tXewH
         xFkcj2Dgmh50NFcDogv2d8nX2E0RATzsqPcrG9FeI2HqWuPa49FbGDbVQidjFq839TYo
         fyjs2EC5OdvrInlXp29xm1xYLINR9rcmD/fkbwsBTpkgiljkmBFpvqDkaTEaXDMTAhwO
         oqcttYPpwsjSX2eja7eX1hcJ6ZTrFqmEItexeEqT7QBs7QMdLCH3dsesFPzxrlTdSjll
         +hEsubS+0AYqEX6NSXp4YFA9xOE5GNKALF/IZljfLmSC0ZNyab3a4wmwV8p8q5OqI51a
         Lsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CoYp1DT3orunTN7t79pQgeCGznzZBnizlaRhvc0xhig=;
        b=UuOmjGXmBenHDeUrS7svb8dG60fDMQL8sAimAfZo4QGHO3M2eq11euNL56sGQsSvDp
         nlQGqO1E3eZrHgnjr7izlrzutDVd/T22qQnK1bpXuBk0s/rBtEohxLTdUoYeK0/6Axhp
         YT9e8jLrxSG4Yh2wmAqWLzNmkD14wKwKPhfuvmu4A5IL4wHFFRQ3twhwdb5AONfYnRCg
         RjchQx1X5KUNLIPiMdN3y8eydq1izVRhC/6JW77BBzvHf1+fl0yfV3xjmd6xZCSbrmPZ
         IZj5MCZpGI7XjlqGBt9Vg3+kaoku03TrLuMsSZifxfoI7oiq/+ncwm7KDxNkg7jffK7b
         g35A==
X-Gm-Message-State: AOAM531Q5+IDEbmVl/3vSb6l/9mjgvJ0H/qoo5r2Hpr9Xh0BkDbbsq7h
        e2AMU08bMEOV8sJUD25rBEBqnJWYMegp/g==
X-Google-Smtp-Source: ABdhPJwsFdpCkmEKVu+dKik9qipo0OaQbPVibuem4Y1lbnyfBAV5u2P3aion4159wGJ2Koi+ePhNBw==
X-Received: by 2002:a05:6512:c07:: with SMTP id z7mr16560375lfu.527.1643660843497;
        Mon, 31 Jan 2022 12:27:23 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n9sm2130811lfi.227.2022.01.31.12.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 12:27:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 2/2] arm64: defconfig: Enable SM8250 video clock controller
Date:   Mon, 31 Jan 2022 23:27:21 +0300
Message-Id: <20220131202721.2122605-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131202721.2122605-1-dmitry.baryshkov@linaro.org>
References: <20220131202721.2122605-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the building of the sm8250 video clock controller by default.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 087a1612902f..bbe40f0fd620 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1024,6 +1024,7 @@ CONFIG_SM_GCC_8350=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_SM_DISPCC_8250=y
+CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
-- 
2.34.1

