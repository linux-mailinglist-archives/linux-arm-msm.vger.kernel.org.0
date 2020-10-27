Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9BC29A33A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 04:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504538AbgJ0DWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 23:22:43 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42672 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444572AbgJ0DWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 23:22:43 -0400
Received: by mail-pl1-f195.google.com with SMTP id t22so24368plr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 20:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mzwmsuVM9xAQyK7nWxmsn3GokXE1FRx/WdryCE+KZmo=;
        b=THv4SgwUuhJFRyThc/WRtCLzzk7pvaG53zJeOnN6noAobD3Bdk+nqTPWA6hK3KpM84
         gXuRXli8VERWYhobeaOFqnXX7A6KSn5LZnopPPxl+/EylKbwaE7IWLwGcvbxrLjtzLbp
         Xlzr6L6ggxuHBu8GrRNBWDRM7v3SB4/eVQVc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mzwmsuVM9xAQyK7nWxmsn3GokXE1FRx/WdryCE+KZmo=;
        b=t1Kt5bedAoYnteixZr5Mslv8syeNaYfcqPEJ4ZfHhvpLUye3mO4PROgLlLf7GeRHsM
         bH5IHK3gDBqAm8GTaH4NxAFIFxvdBOsqSPbA55CZ/qotpxPPUYiqWrWLYFhEUyRg6jz1
         UaMCl8WaREkocLuBR23cMmUNicIa3U3MiyUTl2Yr+S+foFlMnWSReJaybos7q32OciTB
         0H9YqtgEe0YE+hJZFkfrgA/QvcdjGlyS4BUIM34Ju0dDu5rs7B2H9c/iuHV+NTCDI6E5
         tYbaosx6xlsQe5eTecpI0vt4x4wXb6xy5YqMtGR7yeEpOt5vps6BD6xXpj7ZE7iunrdf
         XdzQ==
X-Gm-Message-State: AOAM533meYLyViPtxiN0DBcJrKjl/XTxrEKGRFl4M4mhZk/Jt2MftDM6
        LdTpGwNGDe+PRrbWM4Zsw1cxsA==
X-Google-Smtp-Source: ABdhPJw60lunYrbSac9zYPpjYuj0d1PNHTWP/m5LnyFqoAaSyUqfiZAK2Yke/rBQgfJgSUlKi0EihQ==
X-Received: by 2002:a17:90a:4684:: with SMTP id z4mr98449pjf.97.1603768962510;
        Mon, 26 Oct 2020 20:22:42 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id n16sm202246pfo.150.2020.10.26.20.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 20:22:41 -0700 (PDT)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        xuyuqing@huaqin.corp-partner.google.com, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH v12 0/2] Add documentation and machine driver for SC7180 sound card
Date:   Tue, 27 Oct 2020 11:22:32 +0800
Message-Id: <20201027032234.1705835-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- The machine driver patch is made by the collaboration of
  Cheng-Yi Chiang <cychiang@chromium.org>
  Rohit kumar <rohitkr@codeaurora.org>
  Ajit Pandey <ajitp@codeaurora.org>
  But Ajit has left codeaurora.

Changes from v1 to v2:
- Ducumentation: Addressed all suggestions from Doug.
- Machine driver:
  - Fix comment style for license.
  - Sort includes.
  - Remove sc7180_snd_hw_params.
  - Remove sc7180_dai_init and use aux device instead for headset jack registration.
  - Statically define format for Primary MI2S.
  - Atomic is not a concern because there is mutex in card to make sure
    startup and shutdown happen sequentially.
  - Fix missing return -EINVAL in startup.
  - Use static sound card.
  - Use devm_kzalloc to avoid kfree.

Changes from v2 to v3:
- Ducumentation: Addressed suggestions from Srini.
- Machine driver:
  - Reuse qcom_snd_parse_of to parse properties.
  - Remove playback-only and capture-only.
  - Misc fixes to address comments.

Changes from v3 to v4:
- Ducumentation: Addressed suggestions from Rob.
 - Remove definition of dai.
 - Use 'sound-dai: true' for sound-dai schema.
 - Add reg property to pass 'make dt_binding_check' check although reg is not used in the driver.
- Machine driver:
 - Add Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

Changes from v4 to v5:
- Documentation: Addressed suggestions from Rob.
 - Add definition for "#address-cells" and "#size-cells".
 - Add additionalProperties: false
 - Add required properties.

Changes from v5 to v6:
- Documentation: Addressed suggestions from Rob.
 - Drop contains in compatible strings.
 - Only allow dai-link@[0-9]
 - Remove reg ref since it has a type definition already.

Changes from v6 to v7
- Documentation:
  - Add headset-jack and hdmi-jack to specify the codec
    responsible for jack detection.
- HDMI codec driver:
  - Use component set_jack ops instead of exporting hdmi_codec_set_jack_detect.
- Machine driver:
  - Removed aux device following Stephan's suggestion.
  - Use headset-jack and hdmi-jack to specify the codec
    responsible for jack detection.
  - Add support for HDMI(actually DP) playback.

Changes from v7 to v8
- Documentation:
  - Remove headset-jack and hdmi-jack.
- Machine driver:
  - Let machine driver decide whether there is a jack on the DAI.

Changes from v8 to v9
- hdmi-codec driver:
  - Fixed the naming.
- Machine driver:
  - Fixed unused fields.
  - Moved snd_soc_card_set_drvdata
  - Keep the naming of HDMI as dai name until v5 of lpass-hdmi patches.

Changes from v9 to v10
- Documentation:
  - Let compatible string be more specific for board configuration to allow
    for future changes.
- Machine driver:
  - Fixed unused include and macro.
  - Add temporary macro SC7180_LPASS_DP for future change in sc7180-lpass.h.
  - Let sound card be dynamically allocated.
  - Change compatible string accordingly.

Changes from v10 to v11
- Machine driver:
  - Use temporary macro LPASS_DP_RX for future change in sc7180-lpass.h.

Changes from v11 to v12
- Documentation:
 - Change the file and title name for new compatible string google,sc7180-trogdor.
 - Change the example of model name.
- Machine driver:
 - Use the definitaion of index LPASS_DP_RX in sc7180-lpass.h.
 - Fix for compatible string.
 - Replace a comma with semicolon.

Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (1):
  ASoC: google: dt-bindings: Add sc7180-trogdor machine bindings

 .../bindings/sound/google,sc7180-trogdor.yaml | 130 +++++++++
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 266 ++++++++++++++++++
 4 files changed, 410 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.29.0.rc2.309.g374f81d7ae-goog

