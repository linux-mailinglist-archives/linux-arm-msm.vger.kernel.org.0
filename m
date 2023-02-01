Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0FA8686E14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 19:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjBAShB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 13:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbjBAShA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 13:37:00 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F467F6A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 10:36:32 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ud5so54145227ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 10:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMsshg3yDTcXo0WpBNsBi10C7mrSWCDo0VnlIcXBpuk=;
        b=t9G64TC3oh/EcHKL9xHV334Q0h8gE5DCNQbClSXI0XINdiNBuFkusGmU2hMImD7C9y
         jCQuUXIaJRryXOfAKOoaAODg1QT0NaUw0TzU46EBBibnfrZU9LE3t854Dwu4PFyd8XYX
         ZESVgccWqN5ePHQ9W5rYlXTblSCvzF0pvi/mm3vHFp4FDr8LgZV10FoDDOK57hktL2TR
         ZOg8MsE7xwHveVqQMLXsKt7riHNtkUg+vSKLUWmAnplGL4oXmQF78mSwWRUWKJeyWQ6F
         oFJ5gW+z2SPw29fPV8kjWqYj7vRhpI4i3yhCtLxFEP06ZzRGkkCErphVhPJIygXMhD+j
         09uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMsshg3yDTcXo0WpBNsBi10C7mrSWCDo0VnlIcXBpuk=;
        b=TB8cXoZ3/8RGd42cEDFaLP2+9fKV40EWQawoE6Eq7eAC1L0OmEBWYtvkteIlH+JzNL
         KP1Qqd7LBAoANojD4GwrLGMyjiwEV2edHpNBG4/5YshnZJAZlK7/2SxMBq0a3AW7Rqcd
         cSuA93ixb75OzA4oEGr3IZSSiU0z1lYvJu8wDlSPJn/k8G9GSd1OyAnnxx3bKAu6Wu8d
         vqAGwysQfSIlldVixgKZV5knGDnF6Lg3jTJ6fRVHHXtXdsiu7x3hz9fFHix/L5ZawJ4S
         lcUF0ErFi1atxDWVO5/FKAyUo+r7PQn/WPysIz5yL2TdOCIMXuGeMGvgAaCy4BMDY+Ph
         gqaA==
X-Gm-Message-State: AO0yUKXJv63k/MKOKGZtYp+ji9geZfCdOXZ3PdCfazL4ZotBZAjetOVJ
        haN51fMiW9t/0xceBNl+ofcZ/Fq1J4FtS71I
X-Google-Smtp-Source: AK7set9W2/xUCT8U7tf3K4qb5KwOgvjvkXLuMkPXfbhYApNMovy7Oz842EKPCYBEFoI1ObIOKi1Cfg==
X-Received: by 2002:a17:907:7f05:b0:88d:d304:3423 with SMTP id qf5-20020a1709077f0500b0088dd3043423mr3899262ejc.70.1675276590051;
        Wed, 01 Feb 2023 10:36:30 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id t13-20020a50d70d000000b00458b41d9460sm10297508edi.92.2023.02.01.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:36:29 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 00/10] SM6(11|12|37)5 GPUCC
Date:   Wed,  1 Feb 2023 19:36:16 +0100
Message-Id: <20230201183626.351211-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

This series brings GPUCC support and the correlated bindings for
three midrange SoCs, all of which host a GMU-less A6xx GPU.

v5 fixes some issues pointed out by Dmitry and picks up tags

v4: https://lore.kernel.org/linux-arm-msm/20230130235926.2419776-1-konrad.dybcio@linaro.org/

v4 only brings a tiny bindings amend to [7/8].. I thought I could
fix it without running dt_binding_check but oh was I humbled again..

v3: https://lore.kernel.org/linux-arm-msm/20230130153252.2310882-1-konrad.dybcio@linaro.org/T/#t

Konrad Dybcio (10):
  clk: qcom: branch: Add helper functions for setting retain bits
  clk: qcom: branch: Add helper functions for setting SLEEP/WAKE bits
  clk: qcom: branch: Move CBCR bits definitions to the header file
  clk: qcom: branch: Clean up branch enable registers
  dt-bindings: clock: Add Qcom SM6125 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6125
  dt-bindings: clock: Add Qcom SM6375 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6375
  dt-bindings: clock: Add Qcom SM6115 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6115

 .../bindings/clock/qcom,sm6115-gpucc.yaml     |  58 ++
 .../bindings/clock/qcom,sm6125-gpucc.yaml     |  64 +++
 .../bindings/clock/qcom,sm6375-gpucc.yaml     |  60 +++
 drivers/clk/qcom/Kconfig                      |  27 +
 drivers/clk/qcom/Makefile                     |   3 +
 drivers/clk/qcom/clk-branch.c                 |  15 +-
 drivers/clk/qcom/clk-branch.h                 |  43 ++
 drivers/clk/qcom/gpucc-sm6115.c               | 503 ++++++++++++++++++
 drivers/clk/qcom/gpucc-sm6125.c               | 424 +++++++++++++++
 drivers/clk/qcom/gpucc-sm6375.c               | 469 ++++++++++++++++
 include/dt-bindings/clock/qcom,sm6115-gpucc.h |  36 ++
 include/dt-bindings/clock/qcom,sm6125-gpucc.h |  31 ++
 include/dt-bindings/clock/qcom,sm6375-gpucc.h |  36 ++
 13 files changed, 1759 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sm6115.c
 create mode 100644 drivers/clk/qcom/gpucc-sm6125.c
 create mode 100644 drivers/clk/qcom/gpucc-sm6375.c
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6125-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6375-gpucc.h

-- 
2.39.1

