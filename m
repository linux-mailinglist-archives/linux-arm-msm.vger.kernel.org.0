Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31345710AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 05:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiGLDPz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 23:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiGLDPy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 23:15:54 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76642DA94
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 20:15:53 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id s16-20020a056830149000b0061c47ed7755so3833449otq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 20:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVDIcINsQJnKJYIRtkCuzxiTw7KBm8Z9B1RHvtk5i8c=;
        b=i7xpI24WNCDADdLCeL/TvU5A44AH+8W00ReHGgyKsUoakbiBPqmYfEVurhRlWBhVHH
         CTDFf7PPvZ7sJBtUDZwBM2is0s4AP+UtCYWbOLH3eUQqbe43YgwKCVn24JlxGqmtJ6La
         Jz5HNuBiRRescpgLyMuYFKTT7r1Ywxt+9AMpyJoERwj33pBweFHd35280CecSzZ+QB5U
         6I+qQlfZbm6yo7pWfzAiMwilT6TCx8wntuQy70gxD8ZfS8MiP1Vc0RZPnWAZzDxcO13d
         I4RlklpWFKEXReO0mbOL+ul7cdu4pQOVbOFYwJxoP6Gka3pKphDbbyGBQjgRrhHJuCHa
         MHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVDIcINsQJnKJYIRtkCuzxiTw7KBm8Z9B1RHvtk5i8c=;
        b=XT4AhBy2C2CydfKD2p5boPEsp8ORQJpzZJD4gzZxzqTl0XJ3akNh9aElgt0G+VviZz
         egaWhIoVkrNZwkqcQgf2WLeOnlsF2APcBo41Qzt8Ec4yyoRfStzKFa/qk4evjbNsyVfS
         aYzLbNCACjW/BIEeqXDa1Q1HPbPyU6J/L9mqF4FuUqSq02iVfemh3Jk8zrouOoxEApbo
         a68HHLJqVCFiXaczRyW0my1Q9uVpMSwNn71OQfv0Zy3uM6t7DHVEteecQ7bouZwJUlf+
         phjse5tpMULbJ29gf0EY5Ang/wWm3lXN+JiP96TpuY86Av8mv/+rjzYbvJ8A3YW9C+Wz
         Jj5w==
X-Gm-Message-State: AJIora+lao6/Ny5aCi2FyWB6eMG0pD2S5jYKKBap2WPMkODCkXIu3vJ4
        54BYqBsnrMr5hqUpuP28rzYm9g==
X-Google-Smtp-Source: AGRyM1vVstm/QF12x/kk9cleXO/AFfCPa0MpB3OnAy7UeKAAd2M9UY6MrETdiam/5aZrZsD7NivCDQ==
X-Received: by 2002:a05:6830:9c9:b0:60b:b628:3ed2 with SMTP id y9-20020a05683009c900b0060bb6283ed2mr8405899ott.122.1657595753120;
        Mon, 11 Jul 2022 20:15:53 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k17-20020a056870149100b0010c60ec553esm3987539oab.44.2022.07.11.20.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 20:15:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Demote Qualcomm USB PHYs to modules
Date:   Mon, 11 Jul 2022 20:18:21 -0700
Message-Id: <20220712031821.4134712-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm USB PHYs are not critical for reaching the ramdisk to load
modules, so they can be demoted to be built as such instead of builtin.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d3ad1cb2f5eb..7424c19dd1c3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1208,10 +1208,10 @@ CONFIG_PHY_MTK_TPHY=y
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
-CONFIG_PHY_QCOM_USB_HS=y
-CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
-CONFIG_PHY_QCOM_USB_HS_28NM=y
-CONFIG_PHY_QCOM_USB_SS=y
+CONFIG_PHY_QCOM_USB_HS=m
+CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
+CONFIG_PHY_QCOM_USB_HS_28NM=m
+CONFIG_PHY_QCOM_USB_SS=m
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
-- 
2.35.1

