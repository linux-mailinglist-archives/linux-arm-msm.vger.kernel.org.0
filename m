Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99497789167
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 00:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjHYWJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 18:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjHYWJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 18:09:01 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7C526B1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:08:58 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bcb89b4767so20770961fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693001337; x=1693606137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MesVME7gmyu2rhBwiiVVwaYtOFftxl/qBTkyfI8nZ5k=;
        b=WmdLErzcDsMXyQs+uhCuCMmPaOV8xQE7mz/vNpbdv4Vdzm9214ze8F8RShby+/iWdr
         t4GSywmOKkgHjwE1qqdchm1XexDkcCHvPgAM3o+gZ6N8UNDBJCsiPI5rI9AqVYkf1veP
         UFqiRca/S6P+IqQXWzBciFHYXRi45I+4frn/DTSapjXQZ7z77+h8FjnC9B4Fl3dbriz0
         mamH/w62Zvh1DaaoOf3oif4CXAhM7ZBYJLnnsj2eq3vEeQ8ZgU02mBCwDz6Np7Z5lfmY
         DsARFkej7QAhGN4E/RXaAR1oR1eyn2VjXOUJ6/HQh613c/pJ/3cb5TUI/W7SeSl1yaxT
         U0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693001337; x=1693606137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MesVME7gmyu2rhBwiiVVwaYtOFftxl/qBTkyfI8nZ5k=;
        b=fWjB5XVv7HuD3/Av/gniWDAMKRb+LsvxA2rqIJpoOKwxACwRV0cQtNqLwsUMM6LjL5
         duMS/3YEPCBzVHgcDwGlEtWb37v/5f+wLgrA32IudPRF5yLajz+YyWzSfby63Lgf6gNo
         WOUmFvR+fIE9HkekNo9D9mGiEvy7PQBXVL5J2upFPKbipJ0IDvvHa8eOk8JSJUok+kS0
         SJdyhxVHGsR/Cn7vRxUYsJwNK0n3Rrvcf85F4TW64NLVag2FMvPlqPr2AI3xlk0G+Ncg
         27s0LIsZGeOtdXcwsyGHhKuPP/+MkYX4x7D13bJq1nVUCu/43EOLfcVodtNgXXcBckS4
         QXsg==
X-Gm-Message-State: AOJu0YzC6mg5n1Bsljj1P5q8v1T1Vg2Ni8B4AdY1+xnWZNpHutuWAsPm
        Dwvipct7cOk420yTZfUZjhagBmTVy4l3hS/H3og=
X-Google-Smtp-Source: AGHT+IHRk9J6fZvhrTN2KQs7qQwOLc/v0f4o7r8nIk/OqhB6NKrVEg5dOOBtks7L3J6QrNVG0eRMoA==
X-Received: by 2002:a2e:9919:0:b0:2bb:8d96:6041 with SMTP id v25-20020a2e9919000000b002bb8d966041mr15077745lji.45.1693001336875;
        Fri, 25 Aug 2023 15:08:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u16-20020a2e8550000000b002b9af8422a8sm494951ljj.130.2023.08.25.15.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:08:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: sdm845-mtp: specify wifi variant
Date:   Sat, 26 Aug 2023 01:08:51 +0300
Message-Id: <20230825220854.1655162-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825220854.1655162-1-dmitry.baryshkov@linaro.org>
References: <20230825220854.1655162-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the variant for the WiFi BDF file, "Qualcomm_sdm845mtp" to ease
distinguishing from other (possible) devices using the same board id.

For the reference:

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0x3f soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b fw_build_timestamp 2018-07-19 12:28 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
ath10k_snoc 18800000.wifi: failed to fetch board data for bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp from ath10k/WCN3990/hw1.0/board-2.bin
ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc 18800000.wifi: htt-ver 3.53 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 1516113391ed..56f5bf52d9bd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -718,6 +718,7 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
+	qcom,ath10k-calibration-variant = "Qualcomm_sdm845mtp";
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
-- 
2.39.2

