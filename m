Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EBB252C17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 13:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgHZLFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 07:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbgHZLFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 07:05:03 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B649C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 04:05:02 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b11so723231pld.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 04:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqlq1PfT56HOoFMV6L94hJv96dlmh01C5Xs6bahtBkI=;
        b=UeOWj1bLiRwpjx0xxo7VgpqGSSWO0JgJ1jDlPJnXdrM6c/bGEfxHVRjO52822EdGos
         hMjeRcRFC8MnALlN0EL5KFiJ7OeDjlvlw/2zKk58tdxtxb/emtza+ibHAB+OxblK09Lb
         CEPrqLjTKx3bpE5zD7EXrW2cyycWVsGx+84oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqlq1PfT56HOoFMV6L94hJv96dlmh01C5Xs6bahtBkI=;
        b=U/wAM66UIwpkaPxAbD7iKa7+SUGIqNCWR4Rr1NbF+U5nkTxbRjS4guV0HvgMQrh4fw
         elXcqLy/FR7DFEhduZtOiEOVxs4EGh89rZ233zT75s07J95BZEM76rYg55qrJDI4uvr7
         W8EF5gpf/pFQ50iVIE/KVLAfd7wJCp213JpxTDmIV4HJiKovo/wxU9jRPzHe3qgWh8IN
         E1nTbpoesL4Pi06+/r5kNLPwCsZvCNGa0qxo21hqOkidEiw0amt98lOAoeR+Cu/0+kT1
         hFH1jzRnX5ds4RZpzFIeqTP8gpWkA48Zx7Xp2DO8JEl1znwcU9TXptjxuh5pFbjTes/o
         JymA==
X-Gm-Message-State: AOAM533W/pb9FiZiQ/P5xNR8yq+zuvflSDtiNF9IFsQozT6RgA+h9gsk
        zjncNZXRg1GLbos1a2i3e5FQaw==
X-Google-Smtp-Source: ABdhPJzkWckbe2f7/EY4eUKIYZ4JNt+7W4ArRJA9yhosyjN47O+337w2fSQAeHRBzXhqgEJos8I9Lw==
X-Received: by 2002:a17:902:9309:: with SMTP id bc9mr11228131plb.51.1598439901835;
        Wed, 26 Aug 2020 04:05:01 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id x5sm1888539pgf.65.2020.08.26.04.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 04:05:00 -0700 (PDT)
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
Subject: [PATCH v6 0/2] Add documentation and machine driver for SC7180 sound card
Date:   Wed, 26 Aug 2020 19:04:52 +0800
Message-Id: <20200826110454.1811352-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
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
Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (1):
  ASoC: qcom: dt-bindings: Add sc7180 machine bindings

 .../bindings/sound/qcom,sc7180.yaml           | 124 +++++++++
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 244 ++++++++++++++++++
 4 files changed, 382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.28.0.297.g1956fa8f8d-goog

