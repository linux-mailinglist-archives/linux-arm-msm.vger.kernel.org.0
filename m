Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86C662BEE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbiKPNEp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbiKPNEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:04:39 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32DC20BE3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:04:38 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so1415123wmg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vR3wIx7EW9hgDUtMcaNCRtPsUzU/Fsg80EDhgEd6Q8=;
        b=wGC4cGVogRU1VqG2U4X/a7mtcOiMMwqfCZE/OkA/wGGshCGB9I/lyHNpoCVjLxg/vh
         kiuFYRL7KYy+e+X/g/CAt5nQyPH+GonOCQgNl6LHva+VY0Xlb7Vk1zhNmvft70Du4pHM
         FHin/N84wmHwQiG5IJxG6qujsZSj8V6zpCnVZHBVt+AOzyCzZDXX5OFdZdk8zKtTqAUw
         VqMivzdGvpgtZGWYdbG+CAsD9VU+zc7ZZZWe1V8XgVC4epM7xTKiqtJlumuKUekOBBGq
         8jmMultLupsYSi/VOM6ANxxleTrbBj9nwTIH84Qtx/+qBhe0HuvpJpBnR9Zvqp7UoLpi
         Za7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vR3wIx7EW9hgDUtMcaNCRtPsUzU/Fsg80EDhgEd6Q8=;
        b=VQGteTuTXSwJSQL+ZIsJ0H4L1EqwYJvlhelqRwI8JzCWQfM5lplSVuoSNrtS1zQ/Pd
         MnmYCUhJ6tbGBiQBU2QMkMIzNkj0LN9xLVynZQYfM2uOT9FvLqFTGl0EmmHl7tHDhF1i
         M2i6v1iNFYX748/lCS7WmXb1omqApTeLeaRw6dKF3IBtkGW27QI++scPEjXUKSlRolud
         dPQpck3/Pl9r5uxznK1pxD0BWsgvbj8h7l4WNvGv+sKq6ixpf2NkK5SScTrP8vTxSIXE
         Uz0ep9N1KKHFeaG33pgdWHtppVTjfDVva5HgGBrE0xX9vWDw4GVTM/M+L2YCZQ6UKby6
         LOTw==
X-Gm-Message-State: ANoB5pkyAIzS8v8ZeuM75N/i5PoKIoTm0DCHtGh9ZsWuwwz2PMMOHLOU
        bxoSCqYx/V7vjNCgYgnOXXXtKA==
X-Google-Smtp-Source: AA0mqf7vDcRFT363wHkUM9ckPoIHWYcfv3slKyse2PgZLDSURQcU+yDmZUC4MBgE8j990Mdo6c41zw==
X-Received: by 2002:a05:600c:92a:b0:3cf:69d4:72ee with SMTP id m42-20020a05600c092a00b003cf69d472eemr2078055wmp.122.1668603877127;
        Wed, 16 Nov 2022 05:04:37 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id co19-20020a0560000a1300b0022e66749437sm15130613wrb.93.2022.11.16.05.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 05:04:36 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8550: Add PCIe HC and PHY support
Date:   Wed, 16 Nov 2022 15:04:28 +0200
Message-Id: <20221116130430.2812173-1-abel.vesa@linaro.org>
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

This patchset adds PCIe controllers and PHYs support to SM8550 platform
and enables them on the MTP board.

This patchset depends following patchsets:
[1] https://lore.kernel.org/all/20221116103146.2556846-1-abel.vesa@linaro.org/
[2] https://lore.kernel.org/all/20221116114526.2679041-1-abel.vesa@linaro.org/

Abel Vesa (2):
  arm64: dts: qcom: sm8550: Add PCIe PHYs and controllers nodes
  arm64: dts: qcom: sm8550-mtp: Add PCIe PHYs and controllers nodes

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  25 +++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 245 ++++++++++++++++++++++++
 2 files changed, 270 insertions(+)

-- 
2.34.1

