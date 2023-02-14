Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3316955AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 02:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjBNBAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 20:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjBNBAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 20:00:33 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FB714487
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 17:00:32 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id u75so9251786pgc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 17:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhxllVnbI2AwFWPN2tKYS/gPDBTeZyTnINmF5vnAF9s=;
        b=jiksO25M1xbJMh+TgDf925qz1OI33yVXPFpT+lYue4N/aK/2EjPChZIbJ4iopZfMH9
         qL3CQlp3Q9OGs9elRk+awGd4bmSX4oldimJ+cw6T7pzAirT+A7PkIorWfcbglVMNxmcY
         x/zEMdVvjkjXDnoH1Sfjv0OboADk5n9MAOyyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhxllVnbI2AwFWPN2tKYS/gPDBTeZyTnINmF5vnAF9s=;
        b=06dZwUIRfmq2hV/uWWIoTDTrR+o96vc8GXP6tPhRtrvMXY5RDPIIwjxlkc69vXa0gA
         UnbnZtvwLVnYMSsrnu8roPzlnzObwWkZmlzarb/+bhOd2brtw8BARXIp4E2iLDMlPG9O
         tuZ/QehMZQdqvUmALx5zrlDk6EPKEzuMMpH470R+Z1YoDz9cMrG3eb1irbP/nx9UnCRq
         Mu4cJbo2nxbkqdM1Upf/jNfScjsu8RgLV40Ia6neImopQHO7/gjBbNH7dznplMN4HkCX
         8pQXb3vl+SCnzmd40wOsrPiNPI4QTWLLTN40uB/b7uzcdkiOgVqK/BP+qpcEOToSbzNJ
         Bqkg==
X-Gm-Message-State: AO0yUKU7Gz2xT27Gcj5M232IYF7Y6QyBBApcirCppF1VuBTxOcbiJgIM
        p9SMB+hbamsvRCTl4iNw+pZ1Xw==
X-Google-Smtp-Source: AK7set8iW4DJ4L1yxyeqR9ZgfBeGOdNmdI6N6GwghbcLJ89R3Z2O7NX985VWqNSUx6RrQj83e5E4xg==
X-Received: by 2002:a62:17d2:0:b0:5a8:49c8:8533 with SMTP id 201-20020a6217d2000000b005a849c88533mr397121pfx.8.1676336432029;
        Mon, 13 Feb 2023 17:00:32 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:af55:a232:a032:95ff])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78256000000b00592626fe48csm8482914pfn.122.2023.02.13.17.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 17:00:31 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     amstan@chromium.org, swboyd@chromium.org, mka@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sc7180: Fix trogdor qspi pull direction
Date:   Mon, 13 Feb 2023 16:57:51 -0800
Message-Id: <20230213165743.1.I6f03f86546e6ce9abb1d24fd9ece663c3a5b950c@changeid>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
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
better to park the qspi lines for trogdor with an internal pulldown
instead of an internal pullup. There was a footnote that Cr50 (which
connects to these lines too) may have pulldowns configured on one of
the data lines and we don't want to have fighting pulls. This also
means that if the pulls somehow get left powered in S3 (which I'm
uncertain about) that they won't be pulling up lines on an unpowered
SPI part.

Originally the pullup was picked because SPI transfers are active low
and thus the high state is somewhat more "idle", but that really isn't
that important because the chip select won't be asserted when the bus
is idle. The chip select has a nice external pullup on it that's
powered by the same power rail as the SPI flash.

This shouldn't have any functionality impact w/ reading/writing the
SPI since the lines are always push-pull when SPI transfers are
actually taking place.

Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 423630c4d02c..de40abcd18db 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -1054,7 +1054,7 @@ &qspi_clk {
 
 &qspi_data01 {
 	/* High-Z when no transfers; nice to park the lines */
-	bias-pull-up;
+	bias-pull-down;
 };
 
 &qup_i2c2_default {
-- 
2.39.1.581.gbfd45094c4-goog

