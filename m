Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2747255A173
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 21:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbiFXS5o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 14:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbiFXS5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 14:57:44 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3D681A2B
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 11:57:43 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id k7so2848548plg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 11:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FK/8EcyPF1ew5T6E/EEeA+qWkTFbMoi7Q0HCGQp7WSM=;
        b=XPEuR8lY0dxB4vE3wpD4hGyZgfA7e8EKBsBV2OCEXg9YXPkVYldYbsAMNWp8gT2L7K
         1yQx/kqAEBHkjFQ1FjhHq6l/c5kBICHtXfLzbVLWZp9AzBQlJSPo1NVia5seg8C18K6m
         8sw3lY0Z0ohZKj1zilIO1Zhzbr7feH/wxBOAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FK/8EcyPF1ew5T6E/EEeA+qWkTFbMoi7Q0HCGQp7WSM=;
        b=LWdXEwLO0+IJSwQrTsBovOe+kMh+alcwg7MvertdL/r4cMWysDIdlkMXBx9ufo2rMI
         He9Xf1woXHerQ3CHIvQThWErjCoIuu6lyrb5yO8Ds+S/74IkIrJ31n6qwEPecg6LnAuk
         QXfWoN/23J2oPRTtIfmu6Lq5F2Mbo4KmUgW4MRvMAQs9sDA6RNBtCGyPV6ZA9dDS3QDd
         DtEQomHrCbQ/1YyBOxeZ5/ysOoY3ud49/my+XLUDVmtJqhgZ6/jRzIygDqDr+n8p/dez
         26VS+Lfs7rqhQcYMwDkpVLE9BGEc7rrj5Fh/9kpeSx1PNDosBHqW4Vwq8XbWftGnCD0K
         9ibA==
X-Gm-Message-State: AJIora+8D3wGt6X7OSsJZCsD56d/WoMNoi00x0LCpulxs4RSnoPcLdz2
        O2MTEn+5CEml88GY5dS/nf9OyA==
X-Google-Smtp-Source: AGRyM1skwfGW2cJ7tEwav3q+/uGSYD4X2Eb4qmeqytQY08Wez4/wZJvpgIRAuFg5xMW9tsmHERULuA==
X-Received: by 2002:a17:902:7102:b0:168:dcbe:7c50 with SMTP id a2-20020a170902710200b00168dcbe7c50mr508780pll.116.1656097062512;
        Fri, 24 Jun 2022 11:57:42 -0700 (PDT)
Received: from joebar-glaptop.lan (c-71-202-34-56.hsd1.ca.comcast.net. [71.202.34.56])
        by smtp.gmail.com with ESMTPSA id q10-20020a635c0a000000b0040c40b022fbsm1902765pgb.94.2022.06.24.11.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 11:57:42 -0700 (PDT)
From:   "Joseph S. Barrera III" <joebar@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandru M Stan <amstan@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v11 0/5] arm64: dts: qcom: sc7180: Add five new trogdor-based boards
Date:   Fri, 24 Jun 2022 11:56:07 -0700
Message-Id: <20220624185612.35493-1-joebar@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds five new trogdor-based boards to upstream.
The patches should be applied *after* applying
https://lore.kernel.org/all/20220602190621.1646679-1-swboyd@chromium.org/
(arm64: dts: qcom: Remove duplicate sc7180-trogdor include on lazor/homestar)

The patches do *not* expect
https://lore.kernel.org/all/20220518172525.3319993-1-swboyd@chromium.org/
(sc7180-trogdor: Split out keyboard node and describe detachables)
to be applied.

The compatibles in this series are documented by Doug's series
https://lore.kernel.org/r/20220520143502.v4.5.Ie8713bc0377672ed8dd71189e66fc0b77226fb85@changeid

Changes in v11:
- Add 'include sc7180-trogdor.dtsi' to sc7180-trogdor-pazquel-* files.
- Add 'include sc7180-trogdor.dtsi' to sc7180-trogdor-kingoftown-* files.
- Restore 'include sc7180.dtsi' to sc7180-trogdor-ti-sn65dsi86.dtsi.

Changes in v10:
- Move "okay" for ap_tp_i2c to proper location.
- Remove 'include sc7180.dtsi' from *all* sc7180-trogdor-pazquel* files.
- Remove 'include sc7180.dtsi' from *all* sc7180-trogdor-kingoftown* files.

Changes in v9:
- Restore two lines accidentally removed from ap_sar_sensor.
- Simplify trackpad enabling (51d30402be75).
- Correct errors in series change history.

Changes in v8:
- Incorporate the deletion of the usb_c1 node from 9f9fb70a7294.

Changes in v7:
- Accidentally removed two lines from ap_sar_sensor.
- Only include sc7180.dtsi in sc7180-trogdor.dtsi (19794489fa24).
- Remove #include of <arm/cros-ec-keyboard.dtsi>.
- Restore changes requested by Doug.
- Restore mrbland patch.
- Simplify spi0/spi6 labeling (d277cab7afc7).
- Simplify trackpad enabling (51d30402be75).

Changes in v6:
- Accidentally deleted changes requested by Doug.
- Add #include of <arm/cros-ec-keyboard.dtsi>.
- Copy changes to ap_sar_sensor from v5.4.
- Remove mrbland patch.
- Only include sc7180.dtsi in sc7180-trogdor.dtsi (19794489fa24).
- Simplify spi0/spi6 labeling (d277cab7afc7).
- Simplify trackpad enabling (51d30402be75).

Changes in v5:
- Add comment that compatible will be filled in per-board.
- Order nodes by name.
- Remove extra newline
- Replace _ in node name with -

Changes in v4:
- Cleaned up rt5682s files
- Restored camcc definition
- Fix description (no downstream bits removed).
- Add missing version history.

Changes in v3:
- Removed camcc definition
- First inclusion in series.

Changes in v2:
- Add word wrapping to patch description.
- First inclusion in series.
- Fix whitespace around "en_pp3300_dx_edp".
- Remove "Author" from patch description.
- Word wrap patch description.

Joseph S. Barrera III (5):
  arm64: dts: qcom: sc7180: Add wormdingler dts files
  arm64: dts: qcom: sc7180: Add quackingstick dts files
  arm64: dts: qcom: sc7180: Add mrbland dts files
  arm64: dts: qcom: sc7180: Add pazquel dts files
  arm64: dts: qcom: sc7180: Add kingoftown dts files

 arch/arm64/boot/dts/qcom/Makefile             |  18 +
 .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  44 ++
 .../dts/qcom/sc7180-trogdor-kingoftown-r1.dts |  17 +
 .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   | 225 ++++++++++
 .../qcom/sc7180-trogdor-mrbland-rev0-auo.dts  |  22 +
 .../qcom/sc7180-trogdor-mrbland-rev0-boe.dts  |  22 +
 .../dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  53 +++
 .../qcom/sc7180-trogdor-mrbland-rev1-auo.dts  |  22 +
 .../qcom/sc7180-trogdor-mrbland-rev1-boe.dts  |  24 ++
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi | 344 +++++++++++++++
 .../sc7180-trogdor-pazquel-lte-parade.dts     |  22 +
 .../qcom/sc7180-trogdor-pazquel-lte-ti.dts    |  22 +
 .../qcom/sc7180-trogdor-pazquel-parade.dts    |  17 +
 .../dts/qcom/sc7180-trogdor-pazquel-ti.dts    |  17 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 221 ++++++++++
 .../sc7180-trogdor-quackingstick-r0-lte.dts   |  38 ++
 .../qcom/sc7180-trogdor-quackingstick-r0.dts  |  26 ++
 .../qcom/sc7180-trogdor-quackingstick.dtsi    | 318 ++++++++++++++
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |   1 +
 .../sc7180-trogdor-wormdingler-rev0-boe.dts   |  22 +
 .../sc7180-trogdor-wormdingler-rev0-inx.dts   |  22 +
 .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  53 +++
 ...0-trogdor-wormdingler-rev1-boe-rt5682s.dts |  29 ++
 .../sc7180-trogdor-wormdingler-rev1-boe.dts   |  28 ++
 ...0-trogdor-wormdingler-rev1-inx-rt5682s.dts |  29 ++
 .../sc7180-trogdor-wormdingler-rev1-inx.dts   |  22 +
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 408 ++++++++++++++++++
 27 files changed, 2086 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi

-- 
2.31.0

