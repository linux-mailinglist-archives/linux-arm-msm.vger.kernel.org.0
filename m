Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2EE7899B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 00:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjHZWTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 18:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjHZWTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 18:19:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4241B4
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 15:19:20 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ffa248263cso3298099e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 15:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693088358; x=1693693158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u04fNM9jM1a8dvFbZeQ1OtE1KJdVDz7ybA7tB9Mdkq0=;
        b=R14CAKFhTzIwL5BfoMncUWG6dpAc/WJylbDyT+jNdNu+LSYVJ9A/Kqkf1yS+iu5UZ/
         Dnlib1f/ipg+v9gL4VzUfwXJEfVg2t9f6liGRsqNFWRcgeachGA7oNzaTYgiNiMo4a6+
         wuiDBZXCSDW/sVhgw70aJ1Vf9AKmCJYOTEMCEVdsthSsqJC355siQkxdaeLfdgoESQvd
         CYxOcSy27fpC1MO2I9sL21o/CUfh59Wm3c3gjorVGeG/I7/p5jz4GUndAp8pk/4ykoxC
         InR/DiuZKcV+9NiR/b3+fy3HP3mKqDpdScD9bAnBq1bSvoCddTdgymzivohEDpJCBRah
         FNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693088358; x=1693693158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u04fNM9jM1a8dvFbZeQ1OtE1KJdVDz7ybA7tB9Mdkq0=;
        b=dGrlbudswqdAHKcSZe8e/pCEwtHQbw0F1FafOGU7LuLBAyaQfwopophyMPiwbXRvxR
         Z+2L94HNsHpwvtBpDc6rxdrZTZGu7gop/Wn+1ANeM/8n4bKzlgR6vIVzsCnHv/9U6Iu5
         kRAH7u0pPoez77Cxi8QTskP62ox24iLXgrm909SmGg45m/7M3REPqcVEU69IBCADn86Z
         tpPtbkvXl4nJP7kPkskeFMB0Kby2bZnAl43yfq8kLkZQ3GvUcxScoLCGrom8e1fk+hEM
         svKMuxknS61lxAZUOutEBqYydIeBj1YtRDy0HmGY2y8D6HqM8Er3Qb9+Ylws+3JUpCkU
         8wlg==
X-Gm-Message-State: AOJu0YwgwhAUa466Oyto+BkuV5O95iMXgTiET8YyKy7HinuaofjGaA8X
        i9ZfKBEgCtwPPvlZBZkSarT+rA==
X-Google-Smtp-Source: AGHT+IEQhftTnnRV2xZh0DD7CGx84DmRdNjMrYVZIXtSYkz9hAO672jH9cjrdLz9tY/3syRag9qdtA==
X-Received: by 2002:a05:6512:689:b0:4fd:d64f:c0a6 with SMTP id t9-20020a056512068900b004fdd64fc0a6mr18710701lfe.48.1693088358299;
        Sat, 26 Aug 2023 15:19:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a19ae19000000b004fbad341442sm868672lfc.97.2023.08.26.15.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 15:19:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Kalle Valo <kvalo@kernel.org>
Subject: [PATCH v2 2/5] arm64: dts: qcom: sdm845-mtp: specify wifi variant
Date:   Sun, 27 Aug 2023 01:19:12 +0300
Message-Id: <20230826221915.846937-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
References: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
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

Cc: Kalle Valo <kvalo@kernel.org>
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

