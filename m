Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA6148E0FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238231AbiAMXeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238241AbiAMXeQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:34:16 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9C5C061574;
        Thu, 13 Jan 2022 15:34:16 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id l25so12809883wrb.13;
        Thu, 13 Jan 2022 15:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2dWmbxN5l71IvAym3ZDROYOKBKVIFCV45GVEsgDva0=;
        b=IaXu6NCEfRbEqpa4EeSiD/0Fsy1GRpllCFPdyGoeSVTuEzyVI0WS81lo3C1pMNh4Tw
         z6nYTIBuQKfs8v8EPcmfZdIUBHWcPfSabDD7+iC3RjQtLdak8e7iw8F6z53YzZ6rdt82
         LPuQ9ZWPFj9L1GKn42ZVTCJYyJe4ffbqwGDLIajwUuX2dTAM7ZLXDJ412BzCaROVerlg
         J7FbyZpFZ1tq0hZvf+HHjm70S2cZPmKKmi2XovQb6GVBGPIWO4UHLVbJ8Y1I84ZByIXv
         2GLkLFBVhJDCebFUqCCTt07QXHE0Z6bNqV0sgW4Jt6A3BFsuGh6PZTZNWdmfafqnjqKs
         6aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2dWmbxN5l71IvAym3ZDROYOKBKVIFCV45GVEsgDva0=;
        b=K2F+FzVjgwzmV1RfuELSb4mefLnikCibh4kf95adzZP5wh2+v2P+EUscz10bEZ0aNC
         GCu7zdNgHC9yt2aD1uy8bKBxFRuVd1ccuqhwN6AOCnwgpoPTNCayiZzw6XMafi/vWoU+
         76TIVqfQcZDKd/n/zCS0wkB/8bBkw2B/84UJ6HdMvuMKcESbjnlyzuAT5+qOrEbVmlhy
         G/vWUnsFR/M1LRoMfWnwmJyKFXnMML0pLwyyBhbjkJlRwz6NVsgRKTJNIDdJWi4ag/0g
         VLibeETXqc+s8nlJN8FjOvVmLVIhxEgMRng9I9gmgCkDidVWrsg3UTCr2Ko3ytOZOCi+
         59vA==
X-Gm-Message-State: AOAM533hh6KFfh49RcDAAG6lNpwSMzD3Nq4vf3Siwroki5paZsW+3InI
        4qk4deoarKIPHvBKpS/TLgonxDWx70J9Lg==
X-Google-Smtp-Source: ABdhPJwm4TpKnSAyBh91aadWAxJIxTWh+1FZMNJrDYyujSKSKZbIud7PTaNxwc2KJ8GR+Ao5LQWslQ==
X-Received: by 2002:a05:6000:c4:: with SMTP id q4mr6012838wrx.131.1642116854948;
        Thu, 13 Jan 2022 15:34:14 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id u17sm3724748wrt.37.2022.01.13.15.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:34:14 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: msm8992-lg-bullhead: Disable sdhc2
Date:   Fri, 14 Jan 2022 00:33:58 +0100
Message-Id: <20220113233358.17972-7-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113233358.17972-1-petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bullhead does not have SD card, thus explicitly disable sdhc2.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 3b0cc85d6674..b6633be30f68 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -300,3 +300,8 @@ &sdhc1 {
 
 	mmc-hs400-1_8v;
 };
+
+/* Bullhead does not have SD card */
+&sdhc2 {
+	status = "disabled";
+};
-- 
2.34.1

