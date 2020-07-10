Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7516A21C069
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgGJXDB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgGJXC4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:02:56 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BDFC08E6DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:56 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k5so2831175plk.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=co3iFm8egyAhpjouB4wYZ2DsUz/fkVXl0yTaXVEDDSU=;
        b=l5ce6hjS0xdsv66VLkfTFe9rwljnNeJ2hAUFnEXltlcciTj3GGqnNyK32o3TZO5+uL
         hQu+6PL0ibJ1s2JdZyy9/nrbrSEwM2PdoIk8FFiIaYNRhJ1pg9Q1h6xsMGYxCxgIiy7t
         r7I75GuEvSq8lGjPgTHXgmf/mqfSk79NkurBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=co3iFm8egyAhpjouB4wYZ2DsUz/fkVXl0yTaXVEDDSU=;
        b=po7Ilzq3dEOiLTAWQzyuosvmLY4IKLcWl6QkQNu2JXUmP/p73CFdymOlhbw+9U9y1e
         cyUW9irBqbrxQenWiwNusp+i+I1WZX6+Q+b0sEVgTie/hSTNaFpa3DAYAA2ouR5jdE6u
         iVoO091OambSoFIz+pUXJ7XnHXsOUq44Ql/xuJI9ERSaLBs1qYQRml2J91OcBqM5DSub
         RQxxLLiQQIGxaWuGdLbyEm1ZcanA9u17wFr5qqgyRBcZZEJXq5WSBm+YrUM+L7TgHfdL
         HS44Del7gNqNYEsWV4PWJCIChwEqrIXXWc18qDL7uOxsvvfur1mw3qv1sv1u0Z8phmOO
         76Mw==
X-Gm-Message-State: AOAM530a87COCJrbDOlIZZg1ieAHnmtH9Ugz+YmnqfUXcYDV53hw9iXT
        s7LamCT6cEM8JbzjDAtQZHwmCA==
X-Google-Smtp-Source: ABdhPJwAAHPNollF2qNbk1bn/dIvuDP118bo1zP5qg598VD2MSzTkTnoyhetCyghTdH9xKFShiITnw==
X-Received: by 2002:a17:90a:7b84:: with SMTP id z4mr7749468pjc.106.1594422175761;
        Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] ARM: dts: qcom: msm8974: Add "simple-bus" to our mdss node
Date:   Fri, 10 Jul 2020 16:02:24 -0700
Message-Id: <20200710160131.9.I667d728b2a99b1ed50df01a3e14483fa69babf0e@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As described in the bindings patch, this means that our child nodes
are devices in their own right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
If this patch lands before the patch ("drm/msm: Avoid manually
populating our children if "simple-bus" is there") it doesn't seem to
be the end of the world.  The first time through
add_display_components() it'll notice that the children are already
populated and it will be a no-op.  When it gets a defer it will then
depouplate them (even though it didn't populate them) and future calls
will just populate them again.

NOTE: I have no way to test this patch, but I'm assuming it works OK?

 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 51f5f904f9eb..9f84c9fd716c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1402,7 +1402,7 @@ cnoc: interconnect@fc480000 {
 		mdss: mdss@fd900000 {
 			status = "disabled";
 
-			compatible = "qcom,mdss";
+			compatible = "qcom,mdss", "simple-bus";
 			reg = <0xfd900000 0x100>,
 			      <0xfd924000 0x1000>;
 			reg-names = "mdss_phys",
-- 
2.27.0.383.g050319c2ae-goog

