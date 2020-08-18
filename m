Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64402247D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 05:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHRDuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 23:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgHRDui (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 23:50:38 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC6DC061389
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 20:50:38 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j21so9110098pgi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 20:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L+fYjkynFyH+KCl0jWBEBHKijSYN/dF4ARXPVNGaQQM=;
        b=U7W3ZwvEyucNLgpTuXKO+Fea1/eJLlR0mPFhXwjNutpFzk9PqySXIshU00AerB3aAP
         exjDCSHc7Q44p0cuHG55xtoSAZpsNrigC/nU7SBalsicGvQGrubOCJZdl60qvsIGi9ln
         VbzIvm7ckUrjuNhXLoyrTfKkgz25d3fY9Q8fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L+fYjkynFyH+KCl0jWBEBHKijSYN/dF4ARXPVNGaQQM=;
        b=Rj6DUAB+MJ84CuAHZmYcb7mc/0w6dbHhuWpO/cAFbnbbDUiwpTzkmoWDXPgTvDYdZ1
         B377hT6FLdDUTlGCFJzKyIAoWzkWIuQRD32/eIPG4NmE6P0jx4Pci31Y54gFnOr62F18
         fFymO05QWGejSaHtXiqAovhRpEA/CUuhp1ann/qqNDBCEHK4N90ZA1QEu2hx3RP7DnPs
         xEx4IsuzRaDxJ/qa0iqNbM0sELbYA1YWUUT0KANET/xMG3MNDFJcC7MFCYtrmexvwgxa
         6tmQZhWlXcT1sinmH8KWq5a2cW6UozJWY02nxz8Q7QGs2RrKRhw+WGGCkjrZxqy8pMDP
         Ccrg==
X-Gm-Message-State: AOAM5339eMrhUvv/pA3NXakvQCdkC17iyv02CFnCh0afFoQziP+NVfrt
        RRGrzvT2snlZdcd44gvan2Yhvw==
X-Google-Smtp-Source: ABdhPJwOZAE9hTAf+g8j25SSPWCI9XpRT7qhdaBdEEOEKopHXSwjMI0HeaXbfZo3T5zZ7gTAtyP3Jg==
X-Received: by 2002:a62:18c9:: with SMTP id 192mr13351829pfy.23.1597722637939;
        Mon, 17 Aug 2020 20:50:37 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id j94sm20469763pje.44.2020.08.17.20.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:50:37 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Add documentation and machine driver for SC7180 sound card
Date:   Tue, 18 Aug 2020 11:50:26 +0800
Message-Id: <20200818035028.2265197-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- The machine driver patch depends on LPASS patch series so it is not ready to be merged now.
  ASoC: qcom: Add support for SC7180 lpass variant https://patchwork.kernel.org/cover/11714317/
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

Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (1):
  ASoC: qcom: dt-bindings: Add sc7180 machine bindings

 .../bindings/sound/qcom,sc7180.yaml           | 127 +++++++++
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 244 ++++++++++++++++++
 4 files changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.28.0.220.ged08abb693-goog

