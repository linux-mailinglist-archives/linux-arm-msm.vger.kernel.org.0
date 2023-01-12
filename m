Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B516672D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 14:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjALNF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 08:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbjALNF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 08:05:57 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352C14914A
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 05:05:52 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id qk9so44620538ejc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IszrXcLbv1C0ufOCUrkZd80J905kQzALamm/CPBXfM=;
        b=xlQfeN7xC3TRUc5W1wnqMmOH5bhEryi+j7MuZXvP4NYK/TnRAPocLfCRZXInvZWFax
         j2aQVVtgc6pg/uS4umUG9NHrI70MQ9nlwCBSdckRkQFGoxzIWLZASZhHZ7p+othw1yHF
         eHlDiWlTorZfj3TUaSDPROoYECZ++AJ/hZaW8nCEmLc1mcPKtKwDX2Ic4d86gw+Y1Q0u
         QZME5eeztGxr31yUGxwJR/Kdbyl5+r0LcE9rSyRBlZuQg6PmuvwL2cTEX0iJIVgRDAmE
         UevHO6G74oKqN2zZUXYNQOR1PQ+/42Lmj0uBdNsFdg/lbBQkAAqHvZtxEschn1VXQXJd
         a7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IszrXcLbv1C0ufOCUrkZd80J905kQzALamm/CPBXfM=;
        b=rljWqAJl4aOOTPPL+vlmSNvAb+t9wqWOdAdOu4Qe4fC2+zZP0z8NWQOCyxgR17GlDm
         N+Y5i4i9UNsM2IOlypQ7fYmM4Fh0j2iZDHg9EiP0nE3kUcNXjJZSW1EuIJwWhV1hMUye
         vWnOK/jUMjmh2SMyVrvDatfqNNVWQtTP5TpyrmI6EGiD7YVNOEtX4ZcvVaR5iGXQSs8g
         q+BTqgirRO9hEP7Z0J0qdV5fZBGo8DDr5TAeEtL9Xb0s65JVdShp2h8icQLg0ynnqlL9
         R/N01IZplY+9Mc4FHhjzZx+2Om9QQFq4PtA9T+aB0yTnwOLUvq5wtCijGrz7JfJgGzqg
         btEg==
X-Gm-Message-State: AFqh2kru/MWWu6tDkOn6Yh1kX1OSpM5c9o3Uyik0iN355mXbPrNBuEBs
        5WqMqTFj7oXVk0PihtASxThOdA==
X-Google-Smtp-Source: AMrXdXsF3pTGMimbHjkVQwICvApD/N1OZJva+QH5LWTUFwBg/7Pk3pS6B1jaWQYBxxtq/ond66wyeA==
X-Received: by 2002:a17:906:33d0:b0:854:6e3:2388 with SMTP id w16-20020a17090633d000b0085406e32388mr9818022eja.12.1673528750749;
        Thu, 12 Jan 2023 05:05:50 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906318b00b0078d3f96d293sm7427668ejy.30.2023.01.12.05.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 05:05:50 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/6] phy: qualcomm: Add UFS support for SM8550
Date:   Thu, 12 Jan 2023 15:05:36 +0200
Message-Id: <20230112130542.1399921-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset relies on the following two patchsets:
https://lore.kernel.org/all/20221123104443.3415267-1-dmitry.baryshkov@linaro.org/
https://lore.kernel.org/all/20221222141001.54849-2-manivannan.sadhasivam@linaro.org/

The v1 of this patchset is:
https://lore.kernel.org/all/20221116120157.2706810-1-abel.vesa@linaro.org/

Changes since v1:
 * dropped all UFS unrelated patches and also register offsets
 * switched to sc8280xp bindings, like Johan's suggested.

Abel Vesa (6):
  dt-bindings: phy: Add QMP UFS PHY comptible for SM8550
  phy: qcom-qmp: qserdes-com: Add v6 register offsets
  phy: qcom-qmp: qserdes-txrx: Add v6 register offsets
  phy: qcom-qmp: qserdes-txrx-ufs: Add v6 register offsets
  phy: qcom-qmp: pcs-ufs: Add v6 register offsets
  phy: qcom-qmp-ufs: Add SM8550 support

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   1 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h    |  31 ++++++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v6.h    |  82 ++++++++++++++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v6.h        |  30 ++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h   |  77 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 100 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   6 ++
 7 files changed, 327 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h

-- 
2.34.1

