Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6B44F08D2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Apr 2022 12:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiDCK7L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Apr 2022 06:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbiDCK7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Apr 2022 06:59:10 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39C92F009
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 03:57:14 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m3so12289337lfj.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lI1r1JLEQjk+PqXHoFjrLLxrq89qCHT4i3YRZ2H8Ww=;
        b=mjgc7A4cfQxcuwmoKndCCAtJekWiY6yDidyiwj7vHjHTDnk8Ij+aW7wB/mihF6OArM
         BrijcFMU3tRsubM4J+h3UZm2XIesjYBHJKH4TXsmdpjnr43+QJLQMA25tZ8mWTWK5+AO
         ySjNFjsYfl/tpoVGYF9ObUp/rgJVs24/9/1dMkxxWaK99FaL/5mEnESx8jYC44/7zGRU
         cNN+DzZIhHsEwvm/bUr+JQ9n0Hrqvc0HFdIWb/VNFJwJxSPxrPh6F/16ztVBxYTAgdvj
         oWHsUUjcQXCKCuaHuopskayeIEE7ZcgoDOiC5pCPGwAclAPBqS87XoxNbxt56OM76KxJ
         AegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lI1r1JLEQjk+PqXHoFjrLLxrq89qCHT4i3YRZ2H8Ww=;
        b=E9cezD7590Pn5eNBmdNTYOl0chRkDrEfkJ5e0gq03d2u7A0jEd+rHqIL5sFNJZjjTg
         9PivbA5PMPhNu/wUdI7cRMR6F+To2eWCp3eOePLh4FlUdLFbOKUiZSy6zG4YJFiD2LgK
         NYF7LEsFeyHudA42lsyL610JBHPCfvmowg2DH3fXzi5zcN+FU2km9xVQaw7BWiopcVG4
         wLAulLz5jNFzVmMk3mH2VL3u6gWIRNLGpMJV58n8+//oCs0kaPPawN5a9F8oZT2DilrA
         MPYTybK2p9WRBIWj+2EyrUvGaFQuEdKzkaDib8ZjMK44ImJwGKrCTwxA+b3E98blic5d
         PkAQ==
X-Gm-Message-State: AOAM530XYcz+EcYJmOQcaXEL6AYFwkTeEoo3aKsxcEC+2o7qG+dyjQcF
        jTgy1M+enbK8CstMeu6X3FZviN2G3knYweSfJgQ=
X-Google-Smtp-Source: ABdhPJyfjU7KTTpxweN0DeD6lDjOTcF9okKdDgtm2q1aC0jpGkY5wnnD/7nEUX3zpkFQqgmJdnwkwA==
X-Received: by 2002:a05:6512:3c90:b0:44a:dc25:ab44 with SMTP id h16-20020a0565123c9000b0044adc25ab44mr7232417lfv.407.1648983432759;
        Sun, 03 Apr 2022 03:57:12 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e9b52000000b0024af0b04d04sm766066ljj.1.2022.04.03.03.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 03:57:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        ath10k@lists.infradead.org
Subject: [PATCH] arm64: dts: qcom: sdm845-db845c: add wifi variant property
Date:   Sun,  3 Apr 2022 13:57:11 +0300
Message-Id: <20220403105711.1173161-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

Dragonboard845c doesn't have board-specific board-id programmed, it uses
generic 0xff. Thus add the property with the 'variant' of the
calibration data.

Note: the driver will check for the calibration data for the following
IDs, so older board-2.bin files that were distributed as a part of
Linaro releases will continue to work.

- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Thundercomm_DB845C'
- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
- 'bus=snoc,qmi-board-id=ff'

For the reference, the board is identified by the driver in the
following way:

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b fw_build_timestamp 2018-07-19 12:28 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1

Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faa..f49de3913dd5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1047,6 +1047,7 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
+	qcom,ath10k-calibration-variant = "Thundercomm_DB845C";
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
-- 
2.30.2

