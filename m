Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800442B2325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 18:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgKMR7y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 12:59:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgKMR7x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 12:59:53 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC40C0613D1;
        Fri, 13 Nov 2020 09:59:53 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id s30so15199466lfc.4;
        Fri, 13 Nov 2020 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rLBeGE4EHQEGFvdeUiPT+uwhedXd+nZWR0kWBVXogCY=;
        b=q8XUFb1suqtGh7gjTg9P/rMR1kv/C0eY9Zb5W+ibxUAzP9TpLwXxV3KEpjlF4Ea7tW
         Q71Wj5xLprFTVlf8BE+o5q3MFpzbkN8fJoYJ63Ge3zREh21X7jeupMN0c/BgYKW4KoGJ
         Cl8Kx3cbSMnDnHJlQRfQ+58cqEVLQpbk9kWveaQKm9z4w2O3Ecb4LPfKB6+a4s+YmBSc
         V5rfGiKsIroXSR37EvaOa4w4Lx+0/u6L9HMHozW45xoHDCLikFvLC/+4CD/rKqmg+XiW
         yeIHUGnyKYUhJI3DhoZiseTv9bsGVGdhu0MDln/BtZuwz1ExxrytEhuw3Z5jGBAFccWA
         x/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rLBeGE4EHQEGFvdeUiPT+uwhedXd+nZWR0kWBVXogCY=;
        b=jJw+WFbqSvZf09qx2fobuXFQ2wcwUwgUjUxM3CXqb6LTcsm+EKcbDOS/XzJFhXsN51
         btNsHgNl2uDJY368tQgmETjlv9JDNtaht43Vb0ASdlASVGtQsnOnlSlot+sQgrA7/9oG
         IRCzKyN+yUarTJutowF8MEPD/AUUC7IWnZBzj5exnZNGq0IrC3gdmdJhKnIbi8DTNVUb
         MbH3fMqGvQg/TtVZaY/0ED9buZ7WjErQgltyn9hY0Kvkwz1RQgUfIlwLme93wo66nSZP
         fXGbfpMuqDfOTQmAmm9UiPK/NdaDjYlBiE/kdf1+W/8K3HoYnOXleWs/+5lDWcWTU8nm
         1wnw==
X-Gm-Message-State: AOAM5329A8oBAOfSSvGjYq5VpczETsNdoy6fJhRwleATB0rJ4FDaqTaM
        YC8GJLZ7DaTov3kDiYTSjaA=
X-Google-Smtp-Source: ABdhPJzYqf8qf7AGlH4/PnggpwA6oFd3NCArsKewcI7wWdXSrzJFP4GJZpQVvVrNgKgvUBa0c47bcQ==
X-Received: by 2002:ac2:528e:: with SMTP id q14mr1236306lfm.34.1605290390166;
        Fri, 13 Nov 2020 09:59:50 -0800 (PST)
Received: from localhost.localdomain ([2a01:540:2326:b00:1d75:252:b367:4629])
        by smtp.gmail.com with ESMTPSA id c1sm1629363lfj.222.2020.11.13.09.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:59:49 -0800 (PST)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, stephan@gerhold.net, Michael.Srba@seznam.cz,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 1/6] arm64: dts: qcom: msm8916-longcheer-l8150: Enable PM8916 vibrator
Date:   Fri, 13 Nov 2020 22:59:12 +0500
Message-Id: <20201113175917.189123-1-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

L8150 has a vibrator connected to PM8916. Add it to the device tree.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 2c204d535d66..d106bdbfda68 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -61,6 +61,10 @@ &pm8916_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&pm8916_vib {
+	status = "okay";
+};
+
 &pronto {
 	status = "okay";
 };
-- 
2.25.1

