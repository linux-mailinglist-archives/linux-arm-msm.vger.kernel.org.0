Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 155426955AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 02:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjBNBAf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 20:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjBNBAe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 20:00:34 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E02144B7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 17:00:34 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id nh19-20020a17090b365300b00233ceae8407so6404552pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 17:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWn9i0V4jviqXHKN2YdmFTxHcOb6y0FVwkDe3mDFK6M=;
        b=m2PnzqgHnJBv2JUn7LigKLSx5KiB21zizYojzPjYtfYTjuDQbwVm8EDB5jrOT7JzjX
         66WOjXVgDf+EqBHClQN82HQlJNLxhk5k9mlv4q91tKTu6Y7d0XyKNbK1Pdj/Ssd/PAyX
         Wk8rQdW0XBTMFaa9EhwneE0mk/s57vTR8VZO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWn9i0V4jviqXHKN2YdmFTxHcOb6y0FVwkDe3mDFK6M=;
        b=v9tv1FNyNV1AffdF2wvGZv2tdZmxekqJTXauHdrU0i/2DG4q6MXSyFgdLcLrZPQTji
         2SYkhrSsvamcY6yxmj9SGhFq50RP5p00Md/xF+Zxc3X6jOyLOLzT9f6fvcRqb6+osns1
         E8/eqDe4lgEVdOh2DIgSfYQz37EvgE9Lj7q4uq+vDx3SlwtQoR9Ue5ObDwFR8h0r2Rjc
         CbbeQyp/cb/0lOHJ0VT28/Hb3vtHhnue22+oxTVv7qMEvC0y40eEzbxU3aP1ddOkvJcw
         ZIlOQia+/1U1GDENPcQQbFCqx01iEz3sNECLMSbwW0xXiE0r30WFX6gX5Djj55HJz9KI
         mH9Q==
X-Gm-Message-State: AO0yUKUCGKcsUIn8+eKOy065H/K4GJLYz1sS9jLqiTnoTbfw+rGAr8Ia
        J2e8ke6dTPmozABhrULyj//zWg==
X-Google-Smtp-Source: AK7set8sGpBqSf//1hjHWq+NO6lviBTQytuDGRQZdpS7yQO9CR0Ya3vQMWzL0MqDJBCSVmvDmHO0uQ==
X-Received: by 2002:a05:6a20:1453:b0:c0:c938:8c31 with SMTP id a19-20020a056a20145300b000c0c9388c31mr146109pzi.14.1676336433546;
        Mon, 13 Feb 2023 17:00:33 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:af55:a232:a032:95ff])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78256000000b00592626fe48csm8482914pfn.122.2023.02.13.17.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 17:00:33 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     amstan@chromium.org, swboyd@chromium.org, mka@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sc7280: Fix herobrine qspi pull direction
Date:   Mon, 13 Feb 2023 16:57:52 -0800
Message-Id: <20230213165743.2.I06f9e461a85fcd5d6fb1e977aa253f6523096b6f@changeid>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
In-Reply-To: <20230213165743.1.I6f03f86546e6ce9abb1d24fd9ece663c3a5b950c@changeid>
References: <20230213165743.1.I6f03f86546e6ce9abb1d24fd9ece663c3a5b950c@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Though it shouldn't matter very much, we've decided that it's slightly
better to park the qspi lines for herobrine with an internal pulldown
instead of an internal pullup. There is an external pulldown on one of
the data lines on the board and we don't want to have fighting pulls.
This also means that if the pulls somehow get left powered in S3
(which I'm uncertain about) that they won't be pulling up lines on an
unpowered SPI part.

Originally the pullup was picked because SPI transfers are active low
and thus the high state is somewhat more "idle", but that really isn't
that important because the chip select won't be asserted when the bus
is idle. The chip select has a nice external pullup on it that's
powered by the same power rail as the SPI flash.

This shouldn't have any functionality impact w/ reading/writing the
SPI since the lines are always push-pull when SPI transfers are
actually taking place.

Fixes: 116f7cc43d28 ("arm64: dts: qcom: sc7280: Add herobrine-r1")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index b6137816f2f3..7d787b12c10f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -703,7 +703,7 @@ &qspi_clk {
 
 &qspi_data01 {
 	/* High-Z when no transfers; nice to park the lines */
-	bias-pull-up;
+	bias-pull-down;
 	drive-strength = <8>;
 };
 
-- 
2.39.1.581.gbfd45094c4-goog

