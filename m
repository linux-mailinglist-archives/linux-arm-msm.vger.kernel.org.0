Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3808B21C064
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgGJXCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgGJXCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:02:53 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB43C08E876
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:52 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q17so2839625pls.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rE/FJ5cYzpFqRF8eT/aCqXqC9qh4D6JVTbyHc29pzro=;
        b=W05HtcQbPIXl89xuFzm4GPwHFSTzuwS6hsd6ixbS+qwJmURhFW+04wI+YdXhaXJdwf
         gZyBNbX0eJuS6UKNz9BnvMBF+eGM4d0cV+AzqPhAvOQ+M/XgJa0mXxXlTlscAKe2+ZEL
         ji+EXJAV1US4mTdKcZIuo2k2hlDCXBrobBLQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rE/FJ5cYzpFqRF8eT/aCqXqC9qh4D6JVTbyHc29pzro=;
        b=tyG4VWQD23GFFHtVnnsO5zvqNN+pP4MYLBHjUh2PsMPvv3m5UuhcllDCYUHT5U3TyG
         uVkkUHQJkD0iuQ77Zg580dR7cV1hNUXelkIHSMXJJOUbnzLcUGkXk8D8dEyPggkYm4bF
         6160cGz3MtA9sWjDJBRtlVCs5ohhqYLDb+Y2vsx1rpZh0RNrzl82O9YIIPA1WTSmLpgO
         5tSCbjXhJHbeZ56xQGGrQPyde3cK9boFOJJkoiWpGgwNEykszy5x7IJqhUP0q5+GDUta
         h8F4UsyxXcjq7siB4ZJ/jV2OXOct4bU6GpAZjL7odV6AgiAQy3FMGNIfTsx9KgN1m4yz
         q/AA==
X-Gm-Message-State: AOAM533/b6l1jLVVDITrX1YLY7YMn6l2XmdNbe8SAcnMO58qgMjSAAPl
        lCchokE2avkt39xOsd1j/79qXQ==
X-Google-Smtp-Source: ABdhPJwjcX9D4B+Y8sp8rehAg+DrC8K54299WPrDi2IEEU/9tpv0fAIuMD/Nv1C71frqmllXTO8cGA==
X-Received: by 2002:a17:902:6906:: with SMTP id j6mr18275162plk.125.1594422172084;
        Fri, 10 Jul 2020 16:02:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:51 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: qcom: sdm845: Add "simple-bus" to our mdss node
Date:   Fri, 10 Jul 2020 16:02:21 -0700
Message-Id: <20200710160131.6.Ie343c226b3566575fcaa9e4a8732674a1ae1b513@changeid>
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

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b0d8308a3e95..e52a5e95168a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3582,7 +3582,7 @@ clock_camcc: clock-controller@ad00000 {
 		};
 
 		mdss: mdss@ae00000 {
-			compatible = "qcom,sdm845-mdss";
+			compatible = "qcom,sdm845-mdss", "simple-bus";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
-- 
2.27.0.383.g050319c2ae-goog

