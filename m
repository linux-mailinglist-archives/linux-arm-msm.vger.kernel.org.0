Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561F63E992E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 21:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhHKTrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 15:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhHKTrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 15:47:45 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E91AC061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 12:47:21 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so6848107pjl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 12:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv8yz4ZGyAkZxwS8f4QmdO0fFGjnvFKh2Xd6lFbyeII=;
        b=IcIV9z5hF0qit4Ita+LUqPhfrtn/DHV1QTpywKFoARxxB/9aR4h2zH6Uz7GvqUDekX
         rCt3/0dt9WW3zGSLrEUQemTMaCshLvYUdWe408dek2PI3qgHyDfhyuTvYo+0TbtVjtBA
         vWNYtkFy3KQJ/rXPrKyxodMlY9TMuBcBSAp0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv8yz4ZGyAkZxwS8f4QmdO0fFGjnvFKh2Xd6lFbyeII=;
        b=E93vtsxGG9KdlnqK5y2TEw76hhJWWPdv/Hjc/jMklcb7OPkgOd33WFi0t+N38BXkhZ
         vtJ4+po/rdNkiUV7yLm8SCu1UyEnl4IZe6YYqI8sCplFv+om3I3NLPr8qDhW7BaI6U4z
         XWsHC+CzArZB4di36hv6Ir2W9OpyJfMfPrxEDGmG58bRZw99QtWF0XauQK2M43QNyFXq
         d29Wo8Ck8wlkcVb4qJP5oik5dD9dmVb2XDBq13y2HSiahLlUikn3RUuzDLzRsoOL+x66
         egKsc+bKDl+ORZgg/6AK+6GiZ8ehlMxUarv/vSeD+JnIMZ1v+BRAbqzb51VhGeEmaB+b
         Uj3g==
X-Gm-Message-State: AOAM531s49synE0utxG06UxCIZhzVhRhk3uLaPaUBCOW5Gjw149vq9po
        PQfI7bGS/o+N83PzATqnTZzMXQ==
X-Google-Smtp-Source: ABdhPJxq9RyP9XgWY+JGpZllJISpNNJaXeQGljYulmBIDBvXDVyeXlPXwfqADznH/wk/+Db4y8rrIQ==
X-Received: by 2002:a65:5c84:: with SMTP id a4mr366515pgt.264.1628711241021;
        Wed, 11 Aug 2021 12:47:21 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:1c85:53f6:c893:55e8])
        by smtp.gmail.com with ESMTPSA id w186sm365703pfw.78.2021.08.11.12.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 12:47:20 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link for HDMI
Date:   Wed, 11 Aug 2021 12:47:19 -0700
Message-Id: <20210811194719.856593-1-swboyd@chromium.org>
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

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: b22d313e1772 ("arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI")
Link: https://lore.kernel.org/r/20210721080549.28822-3-srivasam@qti.qualcomm.com [1]
Link: https://lore.kernel.org/r/20210726120910.20335-3-srivasam@codeaurora.org [2]
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 0f2b3c00e434..aba0dcdf01da 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -301,11 +301,11 @@ sound_multimedia1_codec: codec {
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
@@ -782,7 +782,7 @@ secondary_mi2s: mi2s@1 {
 		qcom,playback-sd-lines = <0>;
 	};
 
-	hdmi-primary@0 {
+	hdmi-primary@5 {
 		reg = <LPASS_DP_RX>;
 	};
 };

base-commit: 97ec669dfcfa22f8a595356ceb6ce46e7b4a82e9
-- 
https://chromeos.dev

