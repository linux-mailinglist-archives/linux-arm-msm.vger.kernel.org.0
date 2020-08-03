Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E00239DF4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 06:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgHCEBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 00:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgHCEBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 00:01:32 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7DFC06174A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2020 21:01:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h12so7799453pgf.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2020 21:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yUG9PDflOauUKzeZLQPLk7LHLARUNdO3mRXIHJ6GORg=;
        b=XG70c2DzrXSTp1PgC2bTrPGff/xoNe8pEiCz7UiDz9MjZ7Y/JT47wKDfmfgEUueSkL
         qwMeZhxghrcqQIHtk34wJDKqi8XNeEX3B+7D7x6fwzEE/WEqk/1lVJK6/K+rGCNbzqhI
         6XIpXpR2j5TlclO8OuWLugFNhNGwqg45eVJ50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yUG9PDflOauUKzeZLQPLk7LHLARUNdO3mRXIHJ6GORg=;
        b=gKQTMGj7Nu/XY2/yGMFt96fDSnoVVNQGJvyWcxcQcceMVUHqc5s1fVQEL39W+gCjwT
         SBWa7QwnVDR0Py7SN/JqZUJno8UV1cwGTy5QWfgysfD1MxeLAxW8ZvnfrUXc6bhk2vsL
         OZwzfMg58CWc2seHml4nI5e5O3XK2IlUYo+vC/uxFa8xNk+UrzmELu4SjIQd//WlwPwL
         Min+BQGFy+HGB1FetFTpa2TaQXAANbQ/gBoNZzBUl4cjoV2NXUhcHknbymDmkq4rx2IU
         KDPhIOFPe+8KDoyz3R3WOi3jK6Y+WavI5wOnRQMm0VvJHG/nks4bl4cLJCsrQmNkDbHg
         ScwA==
X-Gm-Message-State: AOAM531sfOC/UN2jQqr3CAUdRHm5sYRnthD9gh3sMU6/G4UqjP9LXmB6
        pUyyOmUsT8tVkOx8FE5CNscJ8g==
X-Google-Smtp-Source: ABdhPJxP+lh6ND1hcM+YIlREZCHSyt0Q+gl1D1E1/uP+/wpTAUIj2z3wimskpD5Puv5muq8X44ygHw==
X-Received: by 2002:a63:1116:: with SMTP id g22mr5535601pgl.257.1596427291773;
        Sun, 02 Aug 2020 21:01:31 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id r6sm10440146pjd.1.2020.08.02.21.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2020 21:01:30 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add documentation and machine driver for SC7180 sound card
Date:   Mon,  3 Aug 2020 12:01:20 +0800
Message-Id: <20200803040122.2063634-1-cychiang@chromium.org>
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

Changes from v3 to v4:
- Ducumentation: Addressed suggestions from Rob.
 - Remove definition of dai.
 - Use 'sound-dai: true' for sound-dai schema.
 - Add reg property to pass 'make dt_binding_check' check although reg is not used in the driver.
- Machine driver:
 - Add Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

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

