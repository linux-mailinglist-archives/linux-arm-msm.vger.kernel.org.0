Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562F1380FD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 20:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhENSfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 14:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhENSfx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 14:35:53 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40AEC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 May 2021 11:34:41 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y70so366156pfg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 May 2021 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lELtbwQEctdIwPQb3wCQp5OuKO4/lkfT92gv1xyToGE=;
        b=gSrEImsqcT8WUGbSMZ53B7UmwxHd+LIibGRNufbT852dWJIzp0i8btI4zX7WXhaYtG
         XvOIwJcw8HHEeQkgQHQ5YeVjBnSpqI8AgJNG4QNiIkHMitswBlzQoq4kHxTrUiXytj0Z
         RsCHapE64niz5srWtsa12N8xR/tqm/VLRfqtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lELtbwQEctdIwPQb3wCQp5OuKO4/lkfT92gv1xyToGE=;
        b=LWAXue9+9vUbsHEhI6w3UZwEzUWpgKHqdd7NRDslASsPx5lN/B/KA4YYU/8Sf/9fZK
         78KlNsyY8vmlcjLxUwOFQioL+hNkUJ+ed5iFgTNMihyX0BdDLdU/5wArAU5Op+OzWAIz
         Af376CC9hQCR9iVWp2wNusZIip3BcWaxGTPErHi9nTgeHThf96BGJKX00+8pZGrnYCbG
         vUefJon4X5NuV/p4wbp7Te0Bxd7Iqb0Sn24Cv5El8QaJN7iSC56tT/CPT5pYVOM+ok4a
         ihHJ4H+5bBQemQQ+sVYZHe4R3IR2fjsYU1EMqi6vrNXpFETsvoTFzQht0BO1znAHvWr5
         Xnng==
X-Gm-Message-State: AOAM530xQLiNJ4ToC2lGxs9x0Z+qOy1pmtQqORJ2V0hsej+7NtQUNW8x
        42iyelAKwHz1R337H7cmCM4iCQ==
X-Google-Smtp-Source: ABdhPJwwG0FPWg4ZVysBvGRUFzN69CmNe/Rog4IBIjy9UL84MRc8Br5Uk3bUyMH30eFS+wfxZ/h4fQ==
X-Received: by 2002:a62:585:0:b029:2a2:3976:60a9 with SMTP id 127-20020a6205850000b02902a2397660a9mr42984565pff.47.1621017281302;
        Fri, 14 May 2021 11:34:41 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:6d29:e373:344b:8862])
        by smtp.gmail.com with ESMTPSA id ga1sm5375127pjb.5.2021.05.14.11.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 11:34:40 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Move rmtfs memory region
Date:   Fri, 14 May 2021 11:34:34 -0700
Message-Id: <20210514113430.1.Ic2d032cd80424af229bb95e2c67dd4de1a70cb0c@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move rmtfs memory region so that it does not overlap with system
RAM (kernel data) when KAsan is enabled. This puts rmtfs right
after mba_mem which is not supposed to increase beyond 0x94600000

Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index e77a7926034a7..afe0f9c258164 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -45,7 +45,7 @@ chosen {
 
 /* Increase the size from 2MB to 8MB */
 &rmtfs_mem {
-	reg = <0x0 0x84400000 0x0 0x800000>;
+	reg = <0x0 0x94600000 0x0 0x800000>;
 };
 
 / {
-- 
2.31.1.751.gd2f1c929bd-goog

