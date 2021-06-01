Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB30397A50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 21:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234589AbhFATBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 15:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233853AbhFATBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 15:01:45 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA19C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 12:00:02 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id l10-20020a17090a150ab0290162974722f2so256817pja.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d70mWsIG9EaxVCKWsokKSvhrP1b5Ectf8KCIC91GlHM=;
        b=JQQazUOBGRua3zTuzOQeUQ8DRK6EQpuJmBVaIAhAcctV2/I23SVlW1qX8sLyKjhRd6
         TO7y0Ab1zc3CYU/t1ii7CBgGjzxOw/O+3hXg3v55J+37emS9eNyHV9LqC7S/f+cKuEcx
         Vajipcsu6YfZPmQHoQNCR4r+/YK/x/I6y6ouE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d70mWsIG9EaxVCKWsokKSvhrP1b5Ectf8KCIC91GlHM=;
        b=Q/zop8eLMHRMDmMoKXLMSjPdev7AUyZI41oEbfoALFibKZVlPFZzXqgOAdtzscldj8
         rNWuj4JqvX213gQL/PdNkIBoDh/sihiIPYuHi1BjJbYZxupYKt57zRSknvtCZyUPbSbI
         2+EoTqqw8UBXWtH1RZeffS4wcW7Ze8SPq2ghac1ZquFyGE1sEOSZouQs7gVNBClhk2NK
         nKtnW62PKaB37m9NsENNr9qL9uUhObQqOEC03uCxAfCc34pRFQ0WQixTc81G11286oIu
         OV2i8jNpG2DXMupG59n00zenGQeCwLNUje0H387ZmPkBjjVhcVtEG1BsT/9o9D4gzduw
         kK/Q==
X-Gm-Message-State: AOAM532jJw1+Xs9QXKj8xTLHubF/bDeNp1aBK7JPtKvDcDxYbORD2zQu
        1KW4pZBGPyDwWlb0ImmSc6MgtA==
X-Google-Smtp-Source: ABdhPJyE5vO18OlwMKxn3ult3kWG1P3QdabymJEaRkG4o+qtMD6kSLOjI56Zf7Oc0krRYtNHhCRBWw==
X-Received: by 2002:a17:902:e007:b029:ef:9dd2:be6 with SMTP id o7-20020a170902e007b02900ef9dd20be6mr27303658plo.12.1622574002315;
        Tue, 01 Jun 2021 12:00:02 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ee82:b2a7:c8bd:18e7])
        by smtp.gmail.com with ESMTPSA id a10sm2709753pjs.39.2021.06.01.12.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 12:00:02 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] arm64: dts: qcom: Remove cros-pd-update on Trogdor
Date:   Tue,  1 Jun 2021 11:59:58 -0700
Message-Id: <20210601185959.3101132-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This compatible string isn't present upstream. Let's drop the node as it
isn't used.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..c134feb02eec 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -564,10 +564,6 @@ i2c_tunnel: i2c-tunnel {
 			#size-cells = <0>;
 		};
 
-		pdupdate {
-			compatible = "google,cros-ec-pd-update";
-		};
-
 		typec {
 			compatible = "google,cros-ec-typec";
 			#address-cells = <1>;

base-commit: d07f6ca923ea0927a1024dfccafc5b53b61cfecc
-- 
https://chromeos.dev

