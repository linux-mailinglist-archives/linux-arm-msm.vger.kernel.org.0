Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFA856A76D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 18:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbiGGQHm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 12:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235526AbiGGQHl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 12:07:41 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66DF31374
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 09:07:40 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w62so2328843oie.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+w9g+Cey/FiU+c+evNQBSvbq3u5f80wmop9pUpMPCWw=;
        b=iURnD9vmhvtLgEQanDFHgCo3SYzniQVWymslJB36g0BTk4YnCNoWQuVKb+BMi9SUXN
         CbVE8XNooKRvoc6msPJLuvWYYfnqTBMR+X0qePzq5FwOrfQgQwALHD8ho3g7qq7vjWeL
         xVRnrZtuJVSshIAQM3iloeSDaSp+oKoV0O3joNJKFOLmGOf3pIpa7VOPHTMlN9m7Etki
         xPPl28Hcs0BXF3ZvL9qYX+SfUW0em3ThnyDL+3AyFCYUoTAaxh5+SlseWC9YuNJMgORx
         dlzG5hNumXt1Dl5VCEzG+Gz5VvRhB5+uDy+7ETx4xSnMYwPDC2QO1Ek37xlriF/eaYEB
         dsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+w9g+Cey/FiU+c+evNQBSvbq3u5f80wmop9pUpMPCWw=;
        b=NM0LGEsu0cWG9jgRsNcEw5zncn3qZhv6RXdIguUSq5Gi63AQrGutKVCk/pnHQwYrdl
         xhr7r9v+LvN+z0ofj31DKEIHobv+7ZWKUPlZkno2QAea/uZA192/UgygaBrbPX5RrcQ2
         IQp+ACnRAUtHtYg+7R8JF1bxY+L36LznoNTWW97cZ5De0MbeX0eXcP2aSNC9yfQxJwPZ
         YuN+Ie5syObvENe3lWw1G9yuvCtbbFITED1NHNp4hzwdi8PI7ejywn/nBI8YvbzdFeB4
         G0LGqMAUh8aNFvhNqaW+2daQ0nafUNCM0uPsa98ZZNXMoJFFL0ypqTY2Sf6HwHCQMBQg
         1H0Q==
X-Gm-Message-State: AJIora/+MaFrz4+xBM99czEuOWyDKWx6ZW97S/i3jshhLHg70v+A8oKE
        EXiFOv2yOPjlUSjILzQgL7G/0Q==
X-Google-Smtp-Source: AGRyM1taZCxMVg5tttt58qo+5JfVyv2P3gY/iDb5eUO/3SCwkb2DtZyVDsCfJEl/+VpJzeOHWLPQCw==
X-Received: by 2002:a05:6808:1647:b0:335:4374:487 with SMTP id az7-20020a056808164700b0033543740487mr2711703oib.121.1657210060111;
        Thu, 07 Jul 2022 09:07:40 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y2-20020a4ad642000000b004285c5e2ffbsm5481487oos.28.2022.07.07.09.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 09:07:39 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        manivannan.sadhasivam@linaro.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SC8280XP providers
Date:   Thu,  7 Jul 2022 09:10:13 -0700
Message-Id: <20220707161014.3178798-1-bjorn.andersson@linaro.org>
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

The Qualcomm SC8280XP need the global clock controller, interconnect
provider and TLMM pinctrl in order to boot. Enable these as builtin, as
they are needed in order to provide e.g. UART.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d2615b37d857..8e44f6a2172c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -541,6 +541,7 @@ CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
+CONFIG_PINCTRL_SC8280XP=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
@@ -1056,6 +1057,7 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
+CONFIG_SC_GCC_8280XP=y
 CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
@@ -1266,6 +1268,7 @@ CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_QCS404=m
 CONFIG_INTERCONNECT_QCOM_SC7180=m
 CONFIG_INTERCONNECT_QCOM_SC7280=y
+CONFIG_INTERCONNECT_QCOM_SC8280XP=y
 CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SM8150=m
 CONFIG_INTERCONNECT_QCOM_SM8250=m
-- 
2.35.1

