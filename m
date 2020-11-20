Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D7D2BB647
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 21:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbgKTUJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 15:09:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbgKTUJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 15:09:16 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34512C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 12:09:16 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id a18so8928614pfl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 12:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfymUBAMPnscgJxXttBDGIhTapd3XcXto9ob9Nf/8hk=;
        b=cxREEUhu03A0vRrbnkG/czu2MN+ftWNFq1cQEgKatoha9fssBw1sYNwNYvyCwYWs+N
         gVEw0g/WM3EavkUW4qVVXOpfC1vUDxHQruZiWIEoruLETt2GrO/3xSz0VSbAxijV9uAT
         oo+yPjsUuD8XKlUSSHnMpABuffY0yDdY5Gzvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfymUBAMPnscgJxXttBDGIhTapd3XcXto9ob9Nf/8hk=;
        b=l8/ZTSQXqLfCY86w9T/QBlDagN+w6QUcOvxThf98HPNdMy1Q2GJKUB4L2XbbsUNCJ1
         OQGLSLbYgJlb2qbonsrg6aKuJFr3n6sTHRw93J6M4HaYBxXpBnVvjAA2ZJBDhei4pyrS
         BpeNZvHByTXGrrerdTJlQ7CHdk64WyfT4AfsVf1P4z6lrnlL9L9AAOt2xYdgJlwPrHt/
         /CtnyPYQxqBNzZAV4yc5oRyj300KAO4w9KjOGO7VtyGHRbo0sONEJYnHkuaIEdDYZxQx
         5LcuLFfJ0HUISZGPriJyXeQtAQ+UKL4kHV2+4QN5BDu9TACTHHWqwoTkPL6H48cbh7qq
         BHEg==
X-Gm-Message-State: AOAM531v29JpR92HQjlWqTdslYenkEu85CRcYZWh57V7el8J+T/dDPcw
        MJinb6Y466D0OqgkyWIPZthaROGbH3EEcg==
X-Google-Smtp-Source: ABdhPJwVOpRGlhivqD9EaIH5+QG3WF/E6o8+aD9UZFedVwwkNHBrM+ysmz0MnYPwE5pi6m4YFOmS5w==
X-Received: by 2002:a17:90a:aa13:: with SMTP id k19mr12444785pjq.145.1605902955659;
        Fri, 20 Nov 2020 12:09:15 -0800 (PST)
Received: from smtp.gmail.com ([100.99.132.239])
        by smtp.gmail.com with ESMTPSA id r8sm4679626pfq.197.2020.11.20.12.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 12:09:15 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Remove double pull-up on p-sensor-int-l
Date:   Fri, 20 Nov 2020 12:09:13 -0800
Message-Id: <20201120200913.618274-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This interrupt has an external pull-up so we don't need to pull it up
again. Drop the internal pull here. Note I don't think this really
changes anything, just noticed while looking at this irq pin.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index d48a75afdafb..3eb1ff2483be 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -1331,7 +1331,8 @@ pinmux {
 
 		pinconf {
 			pins = "gpio24";
-			bias-pull-up;
+			/* Has external pullup */
+			bias-disable;
 		};
 	};
 

base-commit: ead9f7d7ea9e20843e29e688b53859cea20044ee
prerequisite-patch-id: 239dd75c9c3d2ef544f95466280f296fc217c096
-- 
https://chromeos.dev

