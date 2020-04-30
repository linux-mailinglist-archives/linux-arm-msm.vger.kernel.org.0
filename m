Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144CF1C06CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgD3Tqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgD3Tqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:46:35 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580A4C09B040
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:46:35 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id r14so387261pfg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CNXt2FmO52CndewwhPBTf6I3mlSfjDZ6zV6z3LcD0VE=;
        b=EeP8tZraylGTLmSTJH6KQFW78ibPGi/n6VR3j90ey0lht5hgmByF7Ag8EXQRMbYY57
         IlG5tDXde2JUI0MV5tWKn0bOMGytiYol6M1pGGnhyrNAPTxlRKSNOdzzdJxAJ4f2sMAH
         03lRzJvQy2wVsDVtMwt8z0cb7Mlulvu7VFMf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CNXt2FmO52CndewwhPBTf6I3mlSfjDZ6zV6z3LcD0VE=;
        b=nQq5gOF8HcfAmIub9PXqBx4mbUyPK3rrbKLudMAGrvqLexIkGH7EqgYtDeKLQLjA/l
         0Y/5WDiLK1s4yUtm9IJ7vg5UaUfa6JqfLs0BzlJaC3JxteZXwYbm/pBimdr9fW/dGsaJ
         TAbJgCzeVY2fulxxARAbt0traF66vG9ZRwryNK4glFXAWaEjh7qn2NK8mdOmUQ9m6C9V
         7PDPaAL8wJcGbPHZDaltLaacrMmSkMFBUMh9kEiVb7X93MuHvOYD0++fXb6cyoPNgS6E
         FLRUTy1MjO1Y7+pGX1IF7e4MC4QD85lsxFCdR0Bj3wQWPWPyZAF8IrFcDvnIa3r7KeHO
         andw==
X-Gm-Message-State: AGi0Pub/v+eGr82AtOmQCuCrWy4wvRHJfODsOPM6A2ynGoqpHVnwWGMl
        2OamZjY/i1Y8x/dUd97yZPVl7g==
X-Google-Smtp-Source: APiQypJ5w6J53xRub/aTQzetgTJoWBXw5Zybbw7vRWEji/fczl1ZvQQJUx093mXZMrARd9s0cFlHQQ==
X-Received: by 2002:a63:8ac3:: with SMTP id y186mr506112pgd.277.1588275994930;
        Thu, 30 Apr 2020 12:46:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id u3sm495993pfb.105.2020.04.30.12.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:46:34 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     linux-gpio@vger.kernel.org, jonas@kwiboo.se,
        robdclark@chromium.org, bjorn.andersson@linaro.org,
        jeffrey.l.hugo@gmail.com, jernej.skrabec@siol.net,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date:   Thu, 30 Apr 2020 12:46:17 -0700
Message-Id: <20200430124442.v4.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200430194617.197510-1-dianders@chromium.org>
References: <20200430194617.197510-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't have the HPD line hooked up to the bridge chip.  Add it as
suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
Document no-hpd").

NOTE: this patch isn't expected to have any effect but just keeps us
cleaner for the future.  Currently the driver in Linux just assumes
that nobody has HPD hooked up.  This change allows us to later
implement HPD support in the driver without messing up sdm845-cheza.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
- ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9070be43a309..5938f8b2aa2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -548,6 +548,8 @@ sn65dsi86_bridge: bridge@2d {
 		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 		clock-names = "refclk";
 
+		no-hpd;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.26.2.526.g744177e7f7-goog

