Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A1B526D22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 00:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384854AbiEMWv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 18:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350772AbiEMWvX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 18:51:23 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C2F175698
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 15:51:21 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id q73-20020a4a334c000000b0035eb110dd0dso2979921ooq.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 15:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/NkuoBvgXYvzbAWwDOMbCfFkUOSLZa+w7ZV3Xisx9Q=;
        b=q6a2UCZsF6tRfpudX73+ygATvEqE3U/hHfuBCYlGVgjWXvCDSW/ooU2SkKFmpaOLS7
         YPpH0IJZTg6k1W03pYag5iFNAVKNKh4v7OCFnWiYnxn3CaPjUEKIvSM6bxQDufFc6f9/
         GD6o2mcO0TrehK8pAaOFj0Tg314Q26WSVg9rvleROfG4P43JYbhkvNiJiWGcBrLCW3vc
         AaetJgKnbR2vO2uUMIKppHQshRWUF8XugOfLyni+kHaagH7WdeNaEF7qmXo1w+oFY1Ov
         lIngYXjfhjKfXDHnctftngoOo3V11HEGeUk7Fo0gzYlrigRN578xuJc0pfTAIBOIUdn7
         NJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/NkuoBvgXYvzbAWwDOMbCfFkUOSLZa+w7ZV3Xisx9Q=;
        b=lGNXH2v1VeRByx3zwhybaPQn+0hAgpDAwxhXY+9C9mbKdX6wnhPcNXrl6SEAIo97mc
         TO+VyKfs/KUEtU1RzMvioedkjJXb6UNXMb1UHPdSThhDkI8wbUOBBMdHrd0wFiP8O6Fa
         6OaXM5wqrLrVO5Vgh1ND5/U/6hZgvjDgOjEVhnwyPkEPix6s2Mz+/Y7ptYl7n2PqYfT0
         5wzSnD10OBWES/HvhmD8WFETVFPxwPuJ0jZ7ZD4y95IuhWDgPS+bzglI3dA0N+i3baMz
         0ylXcss/5QWL4lEqDx1ZijM9ynFZ3vCKf64mx1m+9QkdfDhVIyl/K3BF1YifRjj3lNZK
         M4OQ==
X-Gm-Message-State: AOAM533UOcSxcFO56yJn4lxTeX5b1DDWZTFkZ53VHJT5CTrlW1IJlHnA
        i8NfbXBkbKqObMH2/TiAJ2nnnA==
X-Google-Smtp-Source: ABdhPJzMxFG/WXvLdVMsesmbtKJjSkP4lUdqfhD8ANxWOAUX1Kn0kFoSk2IBFcRPKM7kdFvPu67Axw==
X-Received: by 2002:a4a:a602:0:b0:35f:2658:f34f with SMTP id e2-20020a4aa602000000b0035f2658f34fmr2737335oom.17.1652482280733;
        Fri, 13 May 2022 15:51:20 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l9-20020a4ae2c9000000b0035eb4e5a6d4sm1592679oot.42.2022.05.13.15.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 15:51:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] phy: qcom-qmp: Add SC8280XP USB3 UNI phy
Date:   Fri, 13 May 2022 15:53:45 -0700
Message-Id: <20220513225348.1671639-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The SC8280XP platform has two instances of the 5nm USB3 UNI phy attached
to the multi-port USB controller, this series adds definitions for this
PHY.

Bjorn Andersson (3):
  dt-bindings: phy: qcom,qmp: Add compatible for SC8280XP USB3 UNI phy
  phy: qcom-qmp: Add USB3 5NM QMP UNI registers
  phy: qcom-qmp: Add SC8280XP USB3 UNI phy

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 138 ++++
 .../phy/qualcomm/phy-qcom-usb3-5nm-qmp-uni.h  | 617 ++++++++++++++++++
 3 files changed, 756 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb3-5nm-qmp-uni.h

-- 
2.35.1

