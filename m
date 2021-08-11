Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D2A3E9AFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 00:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhHKWmI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 18:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbhHKWmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 18:42:08 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FE2C0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:41:44 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so7495840pjl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZkgoN/E3ei3MJPWi7TbA8qd4frB9b3vJQaTmtmZ7E2Y=;
        b=iQaqMwRCHzi/JM/uX4fXvMJmdgfdFMLevDQPx4mA/I85We2L/E6wDtiPTohUlsW3n9
         5wrwSrfWbqtS/WycrZggipAAFkUFT/sixsZWUlisPUtMYDifHRoZzG2U2JmRFj+DR5sX
         9R8j1udu7++wP3M3E7GFqN7hYKCi3tOM8ftQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZkgoN/E3ei3MJPWi7TbA8qd4frB9b3vJQaTmtmZ7E2Y=;
        b=n7JPymAnH8zgZ14tHvuiDehO0h0dJOgw85cyKheWpg2cQ8iuNpOHodoM4jYiQHcHBm
         /gMFjkwZYobT398sPLJRSbb9arloZOItO0PC8WLX45b0Fzsj+VM4UN58d6ovE4KLDwg0
         DT0uVMikUo9Vr/mVZdFKiAyS7ekj5BWZyrAAJpnpxjSGUkuwuVPgstSYwriiX/jKivQ/
         W4VpqrbZXmxmMjHMFJh7zKANoAWF3KiI5pn3yGLmjxbP4eqo7F4WDl126r5RNUGVRauk
         3UGtNZnonMsTutqu419NhRpqM0LuN1wOXyBTAMKCGU85zJMJv1m3jWaT0IEhkFYci6/i
         n9sw==
X-Gm-Message-State: AOAM533tKzjjqFlB5MyNPoN8NBIxiLISEn3uSHN5pZeEmsDm8JoRUA7S
        fn2frDPWB6wOit1+NBtGpnyHig==
X-Google-Smtp-Source: ABdhPJzD+O3FLjuR7UEvLAG3OuBAcRgVzHVkgXsNu8GDDbLQRCQnSqghlRlIC9ogv6jl5FHRenKKCQ==
X-Received: by 2002:a17:90a:9205:: with SMTP id m5mr12913062pjo.172.1628721702959;
        Wed, 11 Aug 2021 15:41:42 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:bdcf:e817:770a:2829])
        by smtp.gmail.com with ESMTPSA id ms19sm347792pjb.53.2021.08.11.15.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 15:41:42 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link for HDMI
Date:   Wed, 11 Aug 2021 15:41:41 -0700
Message-Id: <20210811224141.1110495-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This should be the dai for display port. Without this set properly we
fail to get audio routed through external displays on trogdor. It looks
like we picked up v4[1] of this patch when there was a v7[2]. The v7
patch still had the wrong sound-dai but at least we can fix all this up
and audio works.

Cc: Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Fixes: b22d313e1772 ("arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI")
Link: https://lore.kernel.org/r/20210721080549.28822-3-srivasam@qti.qualcomm.com [1]
Link: https://lore.kernel.org/r/20210726120910.20335-3-srivasam@codeaurora.org [2]
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1:
 - Drop sound-dai-cells
 - Replace hdmi-primary with hdmi

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 0f2b3c00e434..70c88c37de32 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -273,7 +273,6 @@ sound: sound {
 			"Headphone Jack", "HPOL",
 			"Headphone Jack", "HPOR";
 
-		#sound-dai-cells = <0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -301,11 +300,11 @@ sound_multimedia1_codec: codec {
 			};
 		};
 
-		dai-link@2 {
+		dai-link@5 {
 			link-name = "MultiMedia2";
-			reg = <2>;
+			reg = <LPASS_DP_RX>;
 			cpu {
-				sound-dai = <&lpass_cpu 2>;
+				sound-dai = <&lpass_cpu LPASS_DP_RX>;
 			};
 
 			codec {
@@ -782,7 +781,7 @@ secondary_mi2s: mi2s@1 {
 		qcom,playback-sd-lines = <0>;
 	};
 
-	hdmi-primary@0 {
+	hdmi@5 {
 		reg = <LPASS_DP_RX>;
 	};
 };

base-commit: 97ec669dfcfa22f8a595356ceb6ce46e7b4a82e9
-- 
https://chromeos.dev

