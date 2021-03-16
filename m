Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A3A33E00A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 22:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhCPVJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 17:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbhCPVJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 17:09:10 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B68C061763
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 14:09:10 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 18so9689729pfo.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 14:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KfsiDRXDWi256dPx6kPXl9YsOHcZPMkcG1NzqoByDb0=;
        b=XphS2ihI9WIrvODsx4Ck8JNqUzPXAwKiSAqFnJ8gA4zdBn+yes68s/2FZmd4WV7kcD
         Bu4lRsIullOAq+yZVyDb1A3qVnJXumgwncIrMO4910mbilxgoOp1FRFlA50KtCbPICUj
         han3RBEsGYPFS7NISEoOcFF6hxH6SrIuyFO7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KfsiDRXDWi256dPx6kPXl9YsOHcZPMkcG1NzqoByDb0=;
        b=hJAdXZzo8a/WSvEWcpR8udKM//l/1kAFr4zA0X8jjwdXusdfZBQs6x+sTesCsEh7WP
         LtJlRk1XOdJP9pkW0f1TK4MiJ3/aYfTRQC4L9g9OHt2MQ3wKtkd6w2TeeFwH8w6U6hdY
         c8TEPNfBN5YksXPDlqBey8xHiyscMGCJXyKM/qzzzOKtymFaDLME+g+P7dQpwdB6izcW
         RtBMzF4D/7f4BFplhwEJDXWorq8YzH6bcyynjBpjAbUHwS3H4pL+NRVWp4uBqno2nxV+
         FZBR8FQq+9wDwW4cf3qYxAYuQRZZqIDN8v4A7rtkWSmB+qdfXdvEd4Je6pWW635ga4L+
         aeIA==
X-Gm-Message-State: AOAM532wE+NIZJV3+koilwJF2oOlGDWSUS5QFuGrFXTiaMYIxkancjsb
        Rq5S08gzjXOwfm4PkiYzklhhkA==
X-Google-Smtp-Source: ABdhPJwTR+A25BWQSeSDuRmW9FcIOJrDBaqzzxhAWfpKM6Tv5nAJPFN5eRVDgN+dgwx7ZHqMd6JZ5g==
X-Received: by 2002:a62:6c6:0:b029:200:49d8:77ae with SMTP id 189-20020a6206c60000b029020049d877aemr1339575pfg.61.1615928950254;
        Tue, 16 Mar 2021 14:09:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:84d6:7fd1:d469:351f])
        by smtp.gmail.com with ESMTPSA id 192sm17358072pfa.122.2021.03.16.14.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 14:09:09 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     robdclark@chromium.org, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        eballetbo@gmail.com, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        drinkcat@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] arm64: dts: qcom: Don't specify exactly what panel is on pompom
Date:   Tue, 16 Mar 2021 14:08:21 -0700
Message-Id: <20210316140707.RFC.3.Id2f7444caac48649e091b00b8a64f30ced65ee5c@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As talked about in the previous patch ("dt-bindings: display: simple:
Add the panel on sc7180-trogdor-pompom") any number of panels might be
attached.

Let's stop specifying a single panel and just specify that we have a
"pompom panel".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Before landing this we need the patch ("drm/panel: panel-simple: Add
the panel on sc7180-trogdor-pompom") from earlier in this series. Less
obviously, though, we also need the patch ("drm/bridge: ti-sn65dsi86:
Properly get the EDID, but only if refclk") [1].

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid

 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index d253a08f6fc8..f98c18f6ff94 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -108,7 +108,7 @@ ap_ts: touchscreen@10 {
 };
 
 &panel {
-	compatible = "kingdisplay,kd116n21-30nv-a010";
+	compatible = "google,pompom-panel";
 };
 
 &pen_insert {
-- 
2.31.0.rc2.261.g7f71774620-goog

