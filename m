Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F23E2A41EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 11:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgKCKbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 05:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbgKCKbS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 05:31:18 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7E5C0613D1;
        Tue,  3 Nov 2020 02:31:17 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t14so13360674pgg.1;
        Tue, 03 Nov 2020 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RwCtdM6b4YnLjvtF8V5rJbVv42DObRc22ofZtbywkoY=;
        b=UQZvAR/UeA2aq5TkvBMNg5oIDgOrWLrClw42qxh46HFMKXlIpXT3ncoh/MumsJYKvU
         FgzwtrDYJlyU2fOZjkh/DlO4gUFtIZlHDt76cAdycCpF4q4QiZCUC0uT3K0ENeQan4wZ
         3lIazIqT09oR/tjrddyUtqirSs5lvwJ8u8pEqP/hv27dtjZFgACeWpdVSxFNDt6eUYNc
         aBrwYjHWCIsof63x9EU9Q89UIwGGyFCfAejGYIPJQS/XDbniwLgozK0s9NUZjUtaVQx/
         cUsdbrpsBJoey+4Z+wrz6bDNNU1B049jWI7C/7MML6J8Wn3yo/vY/P0UyA3EgaAW5Y+4
         3P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RwCtdM6b4YnLjvtF8V5rJbVv42DObRc22ofZtbywkoY=;
        b=Dbx/S5VRMljciTw3ejmv7n8+T9OinRRm/ccyHi6O2BmjOY/vF78eBAhzP0+rV3hgTp
         c/DKnnSxgv0BVhrMTB4/75GIkCMsrgSzO5YGckWGNVSoHyh2wPeuUmejZOkfue1zD5EX
         O5tK2TnBwVzEubcI1DvXH3YmlKig5PLYWLKD5IUBETCAoeP+1TmcbHzkAR2j95jSoTE3
         +DIbbc+ixYx+7Y8Cw/YkPqTH5Q4olIW7UGWPpNFDfDnW8uJa+tqxFk3DrNfZZOQ3e4vl
         TxUw6rkZw9BRap4jGp/rr6b4XcF7ExW63lBn4fIyUquG3OEnT+t9yGR4ft0nEu7twT2i
         /yzQ==
X-Gm-Message-State: AOAM5311LOCnt6++mGsiIfywf9mv3tN9s+IruX4hXzq5Zoui3L1JAouz
        8GPstyucaZusrGc+u7SIh2XrDw7nSYEuKw==
X-Google-Smtp-Source: ABdhPJxOkMLdjKssOgQo2Tmo6jO227+Icksti352LshSjn6MUs89LphDpnDlbGA2KYYZdcxdzqlbBg==
X-Received: by 2002:a17:90a:7e0a:: with SMTP id i10mr3144330pjl.89.1604399476622;
        Tue, 03 Nov 2020 02:31:16 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id 6sm9777051pfh.112.2020.11.03.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 02:31:16 -0800 (PST)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v5 0/2] Modify documentation and machine driver for SC7180 sound card
Date:   Tue,  3 Nov 2020 18:30:49 +0800
Message-Id: <20201103103051.34553-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- The patch is made by the collaboration of
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
 Cheng-Yi Chiang <cychiang@chromium.org>

v5:
- Machine driver:
  - Fix a format string warning (Reported-by: kernel test robot <lkp@intel.com>).
    detailed info at https://lore.kernel.org/patchwork/patch/1331087/

v4:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - Remove redundant judgments in dmic_set() and dmic_get().
  - Remove 1 level indent of judgment of IS_ERR(data->dmic_sel).

v3:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - move variables "dmic_switch" and "dmic_sel" into struct sc7180_snd_data.
  - Remove redundant judgments in dmic_set().

v2:
- Documentation: Modify the dimc-gpios property description and examples.
- Machine driver: 
  - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
  - See gpio property and use anadditional control.

Thanks for the review!

Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml | 58 ++++++++++++++++++
 sound/soc/qcom/sc7180.c                       | 61 +++++++++++++++++++
 2 files changed, 119 insertions(+)

-- 
2.25.1

