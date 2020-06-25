Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3DC20A4A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389963AbgFYSVY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389648AbgFYSVX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:23 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8FCC08C5C1;
        Thu, 25 Jun 2020 11:21:23 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dr13so6899102ejc.3;
        Thu, 25 Jun 2020 11:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4YyWZjo1Rao17M2WBNOlXiH1pgc+bZLqeh1CFGBC0g=;
        b=GsAJ7OQC5IMReFHLiXhtrABQj1nIlInb1OOEN35a7KjDbW4PN2MBAV2/XF6wrAbWgp
         sCcg0INgWB0umxaWsB76oSUTONGdIBn+riYsRRPgIbzyYVPnDqHj7XOD2qEODoundmIM
         WuA2VcFT1l8x8teYY4jcwuNC9aqlaKnVCZ5jub7m7iG9x53BEx09XTm6560s4Um7i9va
         Q09O496IrhJpuSDVvb02S8WnActPp73IW77Oia/P/utfcms0tuC0yZ2LPJ8yX3B1Pc8I
         D4VISvTBJVG10yDHHI1mxds4qnsVlgJ9tKPW7AAtO/mcBaTzs1dIR352/zySqad4EyBB
         gdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4YyWZjo1Rao17M2WBNOlXiH1pgc+bZLqeh1CFGBC0g=;
        b=dOhiHooxythV7FaY3mVrJyst7qGF8puSCB51DavnvUfRbz6DXERQ5uW1wrcOdZJbpi
         T4LmzOs+qogzmADrCfLDSV0SaQ6+9rAT9qsuVR4EGGIKRqF9v6807/SuBvbL5JyKMh0R
         HzDgrY+hJxjFW9JrlkFrfIYSzFFkqQunn0f2Xw41M4bdLmVXSV4ogrwr0f0rU1GNj95I
         dnWO9pBv+o0kNTyRLitvOBAV8xuAC7IjRC+giF2MhagjIdDiYT/bTa3TnvU1nLJJkcgl
         oL6SR3svJO3ARkVtgSzu95S5egMA7+rGBOvHNMmYGW259ulB0n2yjcGu6u9p57wGKskw
         7tmg==
X-Gm-Message-State: AOAM533Xymu7YIrL53/DlJVhalVF4JWMx0wzAIKQvtYL8DwGXc4P76rl
        h2ojylvye70LRYK16KLOK68=
X-Google-Smtp-Source: ABdhPJxlndAspyQ6UezzJ05sF+JvJlQfn9awYF6Ne8upK9WdCAtV0UxcAGm3EghuVvWmJU9QZWlVxw==
X-Received: by 2002:a17:906:4f94:: with SMTP id o20mr29826519eju.113.1593109282174;
        Thu, 25 Jun 2020 11:21:22 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:21 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/13] msm8992 DTS updates, peripheral enablement
Date:   Thu, 25 Jun 2020 20:21:04 +0200
Message-Id: <20200625182118.131476-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

changes since v2:
- fix commit messages (sorry!)

changes since v1:
- drop some superseeded patches
- reduce the amount of commits
- modernize the 8992 dts
- add libra and talkman DTSes
- do some housekeeping and fix minor issues

Tested on Libra and Talkman. Bullhead *shouldn't* break.

Depends on my 8994 patchset [1] (because of compatibles
and 8992-related SMD RPM patches) and my RPMCC patch [2].

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=307939
[2] https://patchwork.kernel.org/patch/11622057/


Konrad Dybcio (13):
  arm64: dts: qcom: msm8992: Modernize the DTS style
  arm64: dts: qcom: msm8992: Fix SDHCI1
  arm64: dts: qcom: bullhead: Add qcom,msm-id
  arm64: dts: qcom: bullhead: Move UART pinctrl to SoC
  arm64: dts: qcom: msm8992: Add a proper CPU map
  arm64: dts: qcom: msm8992: Add a SCM node
  arm64: dts: qcom: msm8992: Add SPMI PMIC arbiter device
  arm64: dts: qcom: msm8992: Add BLSP2_UART2 and I2C nodes
  arm64: dts: qcom: msm8992: Add PMU node
  arm64: dts: qcom: msm8992: Add PSCI support.
  arm64: dts: qcom: msm8992: Add RPMCC node
  arm64: dts: qcom: Add Xiaomi Libra (Mi 4C) device tree
  arm64: dts: qcom: Add Microsoft Lumia 950 (Talkman) device tree

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/msm8992-bullhead-rev-101.dts     |  20 +-
 .../dts/qcom/msm8992-msft-lumia-talkman.dts   |  39 ++
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi    |  90 ---
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    | 364 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8992.dtsi         | 522 +++++++++++++++---
 6 files changed, 852 insertions(+), 185 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts

-- 
2.27.0

