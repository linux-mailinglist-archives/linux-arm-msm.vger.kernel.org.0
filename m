Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B49CE6A78C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 02:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCBBTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 20:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjCBBTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 20:19:04 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5A11B2E1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 17:19:02 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s20so20059168lfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 17:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677719940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFVn9m0D3uluRkM2nqEQdbkloQYC5dKGsPwtYRgiq3M=;
        b=XgMJCldRY7BdRSPDtHXVp3Rrtweasl3/6fJHUOz5U0++gqJOOazL0+JN7OPxAuEZB+
         UoZYtZX8oQVuk0PdXsvreb1JrkVf/w+VJuBL8WuFncSNA08upQqj0hE1K9kEz3VHDeZ+
         SqTLD04wlxSmt1q0UNNL/cs9v3gi7hKlvVbIWk5WeyTBRJG2ZPzeKNUem9r8JupnA7D1
         i6rOOatrAtGYhxbW3U8nWmSNrD9I4tr4e79TbeXxJpqyd6fX+nl7yg7oiIJotMpwbBDJ
         ctiZHPSnGopZvHpx4cLnt8MxFp137LbEjp03CtAI45HnzyiN6iDSB/TayEofqZDoKVlB
         oJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677719940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFVn9m0D3uluRkM2nqEQdbkloQYC5dKGsPwtYRgiq3M=;
        b=I9Q2dDz2eNbJcC31IWX3j9QLvRcI+lII8bF67U25Lb6wD0YBMT305P4YdmvfTNr0Xq
         qOIXhD8Yc73Y7YWK0WWTYAt3n3MS4PzfgaS+rE5ooy7egvXngrwAGccA+TWRLtCOHdK2
         6/jCrB6jncyz6vtmsaW7qBLQzfADBKRuI6N8Qx200Cr0nKcJgsr+2mGOCVmUpR8GVBq6
         z2zx5z0RgGpSjsWEXGR+LGYfNWCah//RIiGo9khNzmW7sVOZ63D15VJ03OzcZSQVa5CF
         gZrFZPVBAwT39WG5p1cbRN3ZKf4mGVjXzQYwtnNZG0T///Ox+N145RtdWqF7axf7Dcdt
         m0UQ==
X-Gm-Message-State: AO0yUKUUmuEdjX05WCBwZD5Jb2vGzBae3Fg0xTFpzgdqvlHw1mwILIF/
        fWplhcWWT3VLNnBKqoJV9awIMIcvFbP2p+R+
X-Google-Smtp-Source: AK7set/9gsaTP0SJz4AxARp8GBKyigp1OblEiE9POvcIHUcqtEsKjviwOUUApjXAwEeLScwd4GhRNw==
X-Received: by 2002:ac2:50d5:0:b0:4db:456a:9a1 with SMTP id h21-20020ac250d5000000b004db456a09a1mr2387083lfm.66.1677719940140;
        Wed, 01 Mar 2023 17:19:00 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id q20-20020ac24a74000000b004d5a6dcb94fsm1934353lfp.33.2023.03.01.17.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 17:18:59 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996: Add missing DWC3 quirks
Date:   Thu,  2 Mar 2023 02:18:49 +0100
Message-Id: <20230302011849.1873056-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Add missing dwc3 quirks from msm-3.18. Unfortunately, none of them
make `dwc3-qcom 6af8800.usb: HS-PHY not in L2` go away.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 46b74a21e035..969de1f6d96d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3056,8 +3056,11 @@ usb3_dwc3: usb@6a00000 {
 				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&hsusb_phy1>, <&ssusb_phy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,hird-threshold = /bits/ 8 <0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,is-utmi-l1-suspend;
+				tx-fifo-resize;
 			};
 		};
 
-- 
2.39.2

