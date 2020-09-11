Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715A82667AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 19:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgIKRrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 13:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIKRrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 13:47:15 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3F3C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 10:47:15 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id o68so8062163pfg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CgMtX/bQdS+iljLhW5Xz3FoT/kLLfD7hEC/fOvVMJlE=;
        b=lF42bRcPysLjAz+4XpAo+NifmoYEPSBJzRIvemjHfGghsYHgR1QoV/gvIesYoL6itg
         fP82ZaiRVqJwao1iq3lLyvojkrdgQL4zeKJ0zjStTVlrHIvIY1mXMYowjT05Z+o2GJhC
         uSVPB7TOLIEkNXActRv3e8S3wyfIiHvKTLTuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CgMtX/bQdS+iljLhW5Xz3FoT/kLLfD7hEC/fOvVMJlE=;
        b=E9dGgyvsrWMIoiAey+s8M2+lbR7ZFVdMNBHluo5eGYZdt0S2r/uzMrP+681dpNNnD0
         kOnRRUhDnTA/bwN5V/hfYLeg4I0JWbqrB9TIwO60Oh5/rmjIF0/wo3nrNjmWll1zWY9u
         Z0xERpDkDjcfN+avrLYJAPH84zqywUGnfJjiPs842tR65+o37yv4D8afw33FRyhy/rei
         QX706xUzB02PkPLzvAv+rje3OUUoJVZJ1QtwfnGj/8nQ2o/xx9NU5YfwjLVgJJU5oBxI
         wwjp3QwfCK6nWGe5scbErxvdbKXEf55lZ/tI+2ANXIZDo5Lk6utEDgKrPdNnGlpi0v9n
         7Qeg==
X-Gm-Message-State: AOAM532LqXiWkAvARPXLFPNyW9TA+ERXh300+/HPD/0NzQB2OcMLcdi3
        wdGSnva4llHfRS+iqVB9R+l8xw==
X-Google-Smtp-Source: ABdhPJxNtBdyzMkYndGvJzc/+tnBt6ycOD7P1IyvK0XKGbemUwW2lU1PpHqixxbAgdo+QItKKfXxZA==
X-Received: by 2002:a17:902:8f88:b029:d0:cc03:3ba with SMTP id z8-20020a1709028f88b02900d0cc0303bamr3297714plo.40.1599846434800;
        Fri, 11 Sep 2020 10:47:14 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id v13sm2349434pjr.12.2020.09.11.10.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 10:47:13 -0700 (PDT)
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
        Srinivasa Rao <srivasam@codeaurora.org>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH v10 0/3] Add documentation and machine driver for SC7180 sound card
Date:   Sat, 12 Sep 2020 01:47:02 +0800
Message-Id: <20200911174705.759011-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- The machine driver patch is made by the collaboration of
  Cheng-Yi Chiang <cychiang@chromium.org>
  Rohit kumar <rohitkr@codeaurora.org>
  Ajit Pandey <ajitp@codeaurora.org>
  But Ajit has left codeaurora.
- This patch series needs HDMI DAI name SC7180_LPASS_DP defined in sc7180-lpass.h.
  It will be posted in the newer patchset of https://patchwork.kernel.org/patch/11745565/

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

Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (2):
  ASoC: hdmi-codec: Use set_jack ops to set jack
  ASoC: qcom: dt-bindings: Add sc7180 machine bindings

 .../bindings/sound/qcom,sc7180.yaml           | 130 +++++++++
 include/sound/hdmi-codec.h                    |   3 -
 sound/soc/codecs/hdmi-codec.c                 |  12 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |   5 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |   5 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   5 +-
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 266 ++++++++++++++++++
 sound/soc/rockchip/rockchip_max98090.c        |   3 +-
 10 files changed, 421 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.28.0.618.gf4bc123cb7-goog

