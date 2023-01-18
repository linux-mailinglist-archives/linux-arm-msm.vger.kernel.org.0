Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6771670F16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 01:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjARAv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 19:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjARAuF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 19:50:05 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBE147ED9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:38:44 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so375821wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pT/tvb1zs7oqJaGipg0jXRVX8X7JE27Zd8ObevMN1oA=;
        b=enNQAmr4/YEv7DVQNGVjKt4QCfUBVgk6jAWA8s7rI7iuWQu4n8UVOs9s5EECvf2YC7
         uuFFdjVbCIle7SDvK94UQ5uvRAhOO2EQ0aVysnIoORXsNwE+yXmnE7YAXKdB3dRdsbo/
         8GfZ88gPRcrZV3tdyD5zyfAoa7DP/rdIoTyEknmDHuBzvKGHEUahr1teVVJLhDJ8ci8h
         cfTL4UMJWpqVG1Q0qYEOJjbXGa4ZraKnBUX9+31yomwJLy468YSE+HnnibN1c5cqT8Nj
         10gTrRPrRTveieo0rdCiQhbXb4Jy4jedSUoHQ9+55CxXwhsLRTI0udnFZVRRzr0egqq1
         yAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT/tvb1zs7oqJaGipg0jXRVX8X7JE27Zd8ObevMN1oA=;
        b=rMrkV06TzgIEwgcSoMgxZsXsFOVzrLc/3GlmVIDQ3zA0XDIwbyJwJabz0f8g6XtyGV
         vXn9CHMVgNjQiCK/6c+W/j0xfbcYa23gRg+U2yWAPxdSRIo6pBoMyeyUm8dTmlhZwYB+
         sB8FpasP0Bm5tLcXEKQqJmxlhCZ0LKIaXPRKpiJOQ9XF7I0Qcb0BvGp8dYYOGJWA+0lp
         xY8hmYq+Qo3whQFfRcvYQL7Kq+aZkTxqT/WQ0ou+8egE4DE/2nitkLnxUrOEVO+wuQuO
         mPubglPMXIj34a9DhAei3YTKyG6/6s3NGYkmmt7q34V7AWuCWnHq34qsiCBtJpkM0/QK
         susQ==
X-Gm-Message-State: AFqh2kqXM/QRuwwTmadpGEHOulGY4N26fa/p75/kGBvnTpuYqmAwSLIO
        hqdkGbUlkauTwGJE9A9w0sySxRM+qGfdcOxj
X-Google-Smtp-Source: AMrXdXvpvk2x693gfXhCStD/lN1ESwg8oZr6kmyQBnvzdRQ/Em4ANZPFnreUiW4QKcD8a5vip2P63g==
X-Received: by 2002:a05:600c:1713:b0:3da:fd90:19dd with SMTP id c19-20020a05600c171300b003dafd9019ddmr4835990wmn.26.1674002323045;
        Tue, 17 Jan 2023 16:38:43 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003d98f92692fsm365199wml.17.2023.01.17.16.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 16:38:42 -0800 (PST)
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/7] phy: qualcomm: Add PCIe support for SM8550
Date:   Wed, 18 Jan 2023 02:38:27 +0200
Message-Id: <20230118003834.2330028-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset relies on the following patchset:
https://lore.kernel.org/all/20230117224148.1914627-1-abel.vesa@linaro.org/

The v1 of this patchset is:
https://lore.kernel.org/all/20221116120157.2706810-1-abel.vesa@linaro.org/

Changes since v1:
 * dropped all PCIe unrelated patches and also register offsets
 * split all the offsets into separate patches, like Vinod suggested
 * dropped the legacy dt parse changes since we intend to support
   only the new dt parse mechanism from now on

Abel Vesa (7):
  phy: qcom-qmp: pcs: Add v6 register offsets
  phy: qcom-qmp: pcs: Add v6.20 register offsets
  phy: qcom-qmp: pcs-pcie: Add v6 register offsets
  phy: qcom-qmp: pcs-pcie: Add v6.20 register offsets
  phy: qcom-qmp: qserdes-txrx: Add v6.20 register offsets
  phy: qcom-qmp: qserdes-lane-shared: Add v6 register offsets
  phy: qcom-qmp-pcie: Add support for SM8550 g3x2 and g4x2 PCIEs

 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 371 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h   |  15 +
 .../qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h    |  23 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h    |  16 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h |  18 +
 .../phy-qcom-qmp-qserdes-ln-shrd-v6.h         |  32 ++
 .../phy-qcom-qmp-qserdes-txrx-v6_20.h         |  45 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   6 +
 8 files changed, 526 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h

-- 
2.34.1

