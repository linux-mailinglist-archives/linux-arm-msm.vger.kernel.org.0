Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDDE655ADFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 03:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbiFZBkB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 21:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbiFZBkB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 21:40:01 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0230F13D5C
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 18:40:00 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id q18so5236901pld.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 18:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Srp/EXNpLzg2U+1jpiVWipYx2E7RDsq+GqrwFGqqee8=;
        b=MRZctG7Tj2P7uyeZvSA+yhlqoEkIoVAML9xi6pdoMkwmMXsQKhKtmNqdwBWbxll2ea
         9svV2JdNJtismM4bqmwrjTjzmws+1AGVo3kJihyfm39LJ8UZraogCZwGuw7An7vuZC5Y
         mVnjDauZ5JyEnHpJYkkz/TSDT/zFljwgNQA1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Srp/EXNpLzg2U+1jpiVWipYx2E7RDsq+GqrwFGqqee8=;
        b=Sz4bQHabN1h9aZ0JZO5EzLI9y4PmGj6fWOHY4Zlew7e4e7j4EoGJEsOYdqtqLgbj/f
         +yzVCUinGb6FJ+Jk6j73Nttac9mJE56H/eays+liFiwRQHQrgr4PrvQkwwqDt/Fn8RS2
         Jd45GCSITU+hSsR174mpf8BoiNJWpDnfsiSckQNRdoCP+/JukMLcApOjWb1LVlQLP+P1
         Bqm8+BYMK7K2J/2kHHgVtoDWzazuUfkeV3UcH1JYkYWWawq+nPO9s1o6LQeh/bC7AZVq
         FHiWMS/nuFdt/Ux4q6Wtd5Sr26vPFQwPvKNPJ6VGHtDp0VhsWkArhVnDrxu6RThDWTBU
         B1Zw==
X-Gm-Message-State: AJIora/i36uXo6xnPuZ8uQVBU2RxUzSibII8oiIjF36LuhD+A4DIWjJV
        wDZ2HAKIRWLjvtGIw1kNEDUJmA==
X-Google-Smtp-Source: AGRyM1uUshWNdamy7bieEQgd1CHfnXdRkDBdChOwefpxd6jgtkMJeSkhGKxhZKVKEu5IoWgr8Suk+g==
X-Received: by 2002:a17:902:d384:b0:16a:6622:de87 with SMTP id e4-20020a170902d38400b0016a6622de87mr7208456pld.132.1656207598909;
        Sat, 25 Jun 2022 18:39:58 -0700 (PDT)
Received: from joebar-glaptop.attlocal.net ([107.126.90.40])
        by smtp.gmail.com with ESMTPSA id m13-20020a170902e40d00b00167838b82e0sm4283200ple.205.2022.06.25.18.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 18:39:58 -0700 (PDT)
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
Subject: [PATCH v14 0/5] arm64: dts: qcom: sc7180: Add five new trogdor-based boards
Date:   Sat, 25 Jun 2022 18:39:01 -0700
Message-Id: <20220626013906.885523-1-joebar@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

Changes in v14:
- Remove unidiomatic compile-time test for duplicate include.

Changes in v13:
- Remove 'include sc7180-trogdor.dtsi' in sc7180-trogdor-ti-sn65dsi86.dtsi.
- Add compile-time test for duplicate include in sc7180-trogdor.dtsi.

Changes in v12:
- Replace 'include sc7180.dtsi' with 'include sc7180-trogdor.dtsi'
  in sc7180-trogdor-ti-sn65dsi86.dtsi.

Changes in v11:
- Restore 'include sc7180.dtsi' to sc7180-trogdor-ti-sn65dsi86.dtsi.
- Add 'include sc7180-trogdor.dtsi' to sc7180-trogdor-pazquel-* files.
- Add 'include sc7180-trogdor.dtsi' to sc7180-trogdor-kingoftown-* files.

Changes in v10:
- Move "okay" for ap_tp_i2c to proper location.
- Remove 'include sc7180.dtsi' from *all* sc7180-trogdor-pazquel* files.
- Remove 'include sc7180.dtsi' from *all* sc7180-trogdor-kingoftown* files.

Changes in v9:
- Correct version history, based on diffing earlier patches.
- Restore two lines accidentally removed from ap_sar_sensor.
- Simplify trackpad enabling (51d30402be75).

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
- Only include sc7180.dtsi in sc7180-trogdor.dtsi (19794489fa24).
- Remove mrbland patch.
- Simplify spi0/spi6 labeling (d277cab7afc7).
- Simplify trackpad enabling (51d30402be75).

Changes in v5:
- Add comment that compatible will be filled in per-board.
- Order nodes by name.
- Remove extra newline.
- Replace _ in node name with -.

Changes in v4:
- Add missing version history.
- Clean up rt5682s files.
- Fix description (no downstream bits removed).
- Restore camcc definition.

Changes in v3:
- Remove camcc definition.
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
 .../sc7180-trogdor-wormdingler-rev0-boe.dts   |  22 +
 .../sc7180-trogdor-wormdingler-rev0-inx.dts   |  22 +
 .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  53 +++
 ...0-trogdor-wormdingler-rev1-boe-rt5682s.dts |  29 ++
 .../sc7180-trogdor-wormdingler-rev1-boe.dts   |  28 ++
 ...0-trogdor-wormdingler-rev1-inx-rt5682s.dts |  29 ++
 .../sc7180-trogdor-wormdingler-rev1-inx.dts   |  22 +
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 408 ++++++++++++++++++
 26 files changed, 2085 insertions(+)
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

