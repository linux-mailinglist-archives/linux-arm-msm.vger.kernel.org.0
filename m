Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82D44672DA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 01:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjASAp4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 19:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjASApx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 19:45:53 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6C266CFA
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 16:45:45 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso162317wms.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 16:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Kip7JGtKPH/G7ir14KAj9xQjGYwxexOnro2oZg7kXI=;
        b=dMyubnXXrCdlf8aWxP0t1d2AsTEVrNLTZH+P1zI6lRjGoplCpYdgl1CeEY8Uv3tsDG
         4Ck5yos1VxcWeL+4vibdNV2wER3TWdoedO41v+rGf5ubyPFIWsEqRMTsTc6AivEdI3fe
         KxNgTOgZf7GFsnPuuG7NpHGQ40vXg17FxCbngMaORcBw+Y6KjbUHNC6DeUGVYK1lbUCM
         c2/uRMIJX6lqjVamAmSu+d0Sa2Qz5sHIGCQ8dCUU43il4Kwa8whSUvEpkvTT8XUfVYxj
         oZunfSmJ8y2NKjuSFCQw7jEPjUvQzI88FwWX1W8FkBSQvwobWOUlxFy7vny49cbEVqsN
         SS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Kip7JGtKPH/G7ir14KAj9xQjGYwxexOnro2oZg7kXI=;
        b=zWe9jyps19VsXXsPMjoBNZApQLMwOclwqXYWEn2su/M6abC7Q7OVf2eh0AxsdJab5e
         LRiJN1Pdb7Agn+BdI8ldRLY7HNr+8+38AZrEAfTdVIOiStIQSNJmRuEW8cjjOfZNBmie
         dU1zHV5+ticnIXBGTEvae1tI5AvgasXI4Qxgts+tePZzbOfOh/3mhxA1ibsPeE1BrIh2
         Ne74Hjwjc6fKyZcRy8qBYrRnn6QzWlh6tGcisz8Mwpy+mjKem2r8jfNWNGLVrBS7Za+P
         0ru1nlJf4idT6QZYS0RdWylxpZQlybO7vJ7zL9Bwkc/LndRoRGKO42WO8y25El+kMz3t
         QALg==
X-Gm-Message-State: AFqh2koygTlIUtBD3s+WPa3uHd5XId63QVwhmBKUFcZskP3zeLqOhLMV
        HcqIdw5BB+VkPqjO10Ok60k+/Q==
X-Google-Smtp-Source: AMrXdXsqVTDn5/Ya5ZDs8WcPVLvXYvsIFToX2e5F2K30NnDa3M5Is8xIWW+ax41fhNb9Aj6b782yaA==
X-Received: by 2002:a05:600c:3596:b0:3da:1357:4ca2 with SMTP id p22-20020a05600c359600b003da13574ca2mr8778377wmq.11.1674089143804;
        Wed, 18 Jan 2023 16:45:43 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b003dafadd2f77sm3870491wms.1.2023.01.18.16.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 16:45:43 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8550: Add USB HC and PHY support
Date:   Thu, 19 Jan 2023 02:45:31 +0200
Message-Id: <20230119004533.1869870-1-abel.vesa@linaro.org>
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

This patchset adds USB controller and PHYs support to SM8550 platform
and enables them on the MTP board.

The v1 was here:
https://lore.kernel.org/all/20221116132212.2842655-1-abel.vesa@linaro.org/

Changes since v1:
 * fixed the clocks and clock-names of qmpphy to be aligned with sc8280xp
 * dropped the child node from the phy nodes, like Johan suggested,
   and updated to use the sc8280xp binding scheme
 * moved status property last everywhere needed
 * dropped the newline for phy-names, like Konrad suggested
 * decided to move #address-cells, #size-cells and ranges properties
   in such a way to be aligned with sc8280xp 

Abel Vesa (2):
  arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes
  arm64: dts: qcom: sm8550-mtp: Add USB PHYs and HC nodes

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 22 ++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 92 ++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 1 deletion(-)

-- 
2.34.1

