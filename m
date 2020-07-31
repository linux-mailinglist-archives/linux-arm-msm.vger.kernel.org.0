Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24B7234153
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 10:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731442AbgGaIkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 04:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728437AbgGaIkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 04:40:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6262C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:40:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t15so7189625pjq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hLoyOTSzLDQ51ZbDgjh9dBtvJJhP5tr3Wm8F7z1KJp4=;
        b=kLtktgDT7wK6kb+GRIVgYIgjMj1Q9zyL3263W8/hcM8IocBdBKdKdeUWIuG2YcWJuw
         owIX3/G2px/aecdN3/RT5vBPi5W7AXvDXV4aF4lOivG0ZpLsy2bLJW6qhwXCELjewcVU
         76iWJ4aNwDz09t9sM9bHrlyBWuEtn1gagW/Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hLoyOTSzLDQ51ZbDgjh9dBtvJJhP5tr3Wm8F7z1KJp4=;
        b=G6mUYidof3A9YTFgpyX6bGTQzMvN9TYuiMQIJ8/Vj0HygId2kXAl/E+VCJsx67WXha
         cx5ylmh0Y5m3baFJ7CpZ5HbsdWI/ChKUrY9nkv+9eUjqkOFXHGHIIhp7Gug2FmbPO75B
         IbbhJvqIMyT+5wtR2BFeSQy/CBF4EZJpKfaulXA7uL7RFeydctL0k369GrFkS5ZpT+Ms
         Q/ROL36MGSZLnSbbShY3IcMTMV4qhr00LPljHwwgvHSXmTrRPdMZaBnDlF/TQPocrjog
         Aw6HcUuBbuTxHv23DgF/fsWJzsH6v9UcNqf6uFUIvFF4/smbQtH5CcARC0MN7Y5+LxRT
         qIYw==
X-Gm-Message-State: AOAM532vuXlBPiB23+jqU5aKNYuDYjQ9sU1S9ClLaJ6YFOzPqycHbB9l
        gK2y2VceNksfxgDGgpIv7Mp+1g==
X-Google-Smtp-Source: ABdhPJxis69iyu05nHzc4VnRq1YCk+CFnP8XU11HDYI1OHzqsIuE+QhGaGTRXtID4jo9NYYZYlLyAw==
X-Received: by 2002:a17:90a:a60a:: with SMTP id c10mr3247968pjq.117.1596184835298;
        Fri, 31 Jul 2020 01:40:35 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id x10sm8856411pgp.47.2020.07.31.01.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 01:40:34 -0700 (PDT)
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
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH v3 0/2] Add documentation and machine driver for SC7180 sound card
Date:   Fri, 31 Jul 2020 16:40:21 +0800
Message-Id: <20200731084023.2678931-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- The machine driver patch depends on LPASS patch series so it is not ready to be merged now.
  ASoC: qcom: Add support for SC7180 lpass variant https://patchwork.kernel.org/cover/11678133/
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

Thanks for the review!
Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (1):
  ASoC: qcom: dt-bindings: Add sc7180 machine bindings

 .../bindings/sound/qcom,sc7180.yaml           | 113 ++++++++
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 244 ++++++++++++++++++
 4 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.28.0.163.g6104cc2f0b6-goog

