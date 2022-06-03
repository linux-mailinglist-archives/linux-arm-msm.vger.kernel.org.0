Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB07D53C6A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 10:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242671AbiFCIAf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 04:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbiFCIAe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 04:00:34 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F35635DC6
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 01:00:32 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id t13so7654073ljd.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 01:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrvGGdTixNtHqZKbOYhe2mvn4ahNb6KY/VMia2Pab18=;
        b=loatCcjfMy7QKanwzr7GedUfJt9jEKeeIOhv+ylp7vFZM6yhMnocRI8wi8e0al3jJ0
         TheIEChZviLS/tO+zzjhKQ6yvO5XsWY8o/+oNrHGHIpVkHG1paoUbQILXEdTxdgFkCrk
         xCpLKkHsMlT5JOjHgmOzmvwy0ek1h22+mNBaLqeW0Is/BXM5TJlgfF6ht+wv0I24W1Qy
         emptBGYbQY/+PPY28O1iNkROYdVP9JTyi4QlVEYzvQE6QEfV07tGpjniHF4cKJupzbCy
         wG8L3Sm3G+ayrij4zQxIa9ieqCRE0SdRUucWUWl13ckYlY0wbpvwKHYqNhd0969Ybdnv
         YbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrvGGdTixNtHqZKbOYhe2mvn4ahNb6KY/VMia2Pab18=;
        b=nFNlAIhWqir5v/vN+69QH+LHJ/lOEl1O4bVvl5zfBjv5Lv1UPcAPf9911kG27ipmlZ
         OqSVHcgqlwKsH32G1UaYrKqO8tB5VTvY4FzzFTuTtIPG/GGSQn3m4u3QVnI/bpu6op1s
         BcmD5JwomnsV/ZGPrZioZXh5Rl4oWyXx5olP6zeb7DO8l3yYlKK8kaqcEmEqec8NIoaF
         0VdvkfbxfDt+JXCtWRjMkRvS3mnVGQdH6yq31u5FG7WtErQDw3cKCES0FsEUL3fRQXRC
         QgQInIE69Jxr7+iPXVJHvG7iacUIZFqunwoyaNSEQ/v60/+8HXhkqtvdHuqhyJingCw3
         uC8A==
X-Gm-Message-State: AOAM532j8KoUC2QAKeeQB0T5e6R3jRpKV2/1NTyb8HZVhnSfq7wYqPSD
        P+W+8qCLkkyrLwIj4CvLvPGoBA==
X-Google-Smtp-Source: ABdhPJzCHzolNrS18FB+PHhzFrcPQ66j9Yf7aK5+y9+0Viwj/6TelSvj7QMtjERQmN9kRmO0Ic98Dg==
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id s1-20020a2e81c1000000b0024b0f443970mr44204367ljg.97.1654243230728;
        Fri, 03 Jun 2022 01:00:30 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id l13-20020a2e868d000000b0025582d66aebsm50356lji.70.2022.06.03.01.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:00:30 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v6 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Fri,  3 Jun 2022 11:00:17 +0300
Message-Id: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patchset adds support of a camera clock controller found on
QCOM SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
type of pll, its generic support is added in the series.

Note that SM8450 ES variant has a slightly different configurtion,
the published version is intended to support SM8450 CS SoC.

Changes from v5 to v6:
* rebased on top of linux-next,
* added Rob's tag,
* fixed a topology of power domains around titan_top.

Changes from v4 to v5:
* fixed the same typo in a usage example found in yaml file as in v3
  change.

Changes from v3 to v4:
* fixed a changed path in the yaml file.

Changes from v2 to v3:
* fixed a typo in a usage example found in yaml file,
* renamed dt related files to match the compatible "qcom,sm8450-camcc",
* minor fixes in the driver per review requests from Bjorn,
* added Bjorn's tag to a change of exported symbols namespace.

Changes from v1 to v2:
* updated qcom,camcc-sm8450.yaml according to review comments from Rob,
* changed qcom,camcc-sm8450.h licence to dual one,
* disabled camcc device tree node by default,
* added Stephen's tag,
* rebased the series on top of clk-for-5.18

Vladimir Zapolskiy (7):
  dt-bindings: clock: add QCOM SM8450 camera clock bindings
  arm64: dts: qcom: sm8450: Add description of camera clock controller
  clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
  clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
  clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
  clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
  clk: qcom: add camera clock controller driver for SM8450 SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml     |   89 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   20 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8450.c               | 2866 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  145 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,sm8450-camcc.h |  159 +
 8 files changed, 3292 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h

-- 
2.33.0

