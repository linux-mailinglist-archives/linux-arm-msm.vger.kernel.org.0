Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C46F649ECC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 13:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbiLLMey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 07:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbiLLMeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 07:34:23 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00602BF8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:33:50 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so15542489pjr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26Q/WBAWFA3UhuhgRAc8FiDDi9U9JvKaLU8PlXNH5WA=;
        b=cmoELRfDJVkrewKkchK8Em88WWVknErid1uisKdEezigW0Dxn9Ge+SBHmjwBtQ2+E6
         YxtuMsyHyxJodHk+b2wox/kY7OCLlbQ4xGpkdViVW0wO/0iKNyLEyBNvUfiDjQtR7IMk
         HvbBVXEETnyxk2AF22e+0l2ydtor+Lqow9QD7Kg82ZStryQDb7I94QnZBNfp0Jwu5+OO
         Lw+mClb/FD8uDwx+jfrK7+VrkLzIPl3WZX6DkHEld470Qh7pvK3c5cfrTyKB1XpdSYdk
         QrymkULlx0ur9VoOLp10l7FJ1BaTvi180PS7epFyTkIz9mmdI7C2sng3kJY/+L+or9NI
         Isyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26Q/WBAWFA3UhuhgRAc8FiDDi9U9JvKaLU8PlXNH5WA=;
        b=HjybvzaUb1XON1rHYSyOXERJqIGtvWa59uWTsER5I6MeAovQ8wCBsRuXmNFBjVLZwy
         YzRHkrs+5jVNq9q5feJdjxFMpA7in9KbRltzLaaEBCj2cNHHMAxTNbCt62UVCcCEmYnF
         XdUA4LaNvSa1DkN3YgDItQ5jDAgmtzu4fw6piWJpUmSL5Ge01sysIvogQlv+O2xHI7Ew
         QJRFJnFVMS6PqG01RIDvEL0Vk+edLCFmUXKPZCWRXfclD51ND0scLH6hjgPYwwVNNvt3
         q6OIvziU5akqyWFx1BJyyabWGIE6b04KIMH2xK4IwxKSBdwkovJ5qkCtrAsg8wduu1Oq
         sUlQ==
X-Gm-Message-State: ANoB5plrHqq8+egJwQ09Zu5frOY+riow+vDH8+XaG+iB5y+GVjCOp0p3
        4PPjHFTA6dVVq50Xe0YaoYes
X-Google-Smtp-Source: AA0mqf5jgJNfNCAjLII3XBF0QHODNVOJ9pQBUhID7O5h5g2Vvqs89cTH4+jNXSevUebDUpoM1bwLGA==
X-Received: by 2002:a17:902:aa91:b0:189:b8a2:27ed with SMTP id d17-20020a170902aa9100b00189b8a227edmr14858454plr.57.1670848430595;
        Mon, 12 Dec 2022 04:33:50 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.33])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b00189c93ce5easm6252557plx.166.2022.12.12.04.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 04:33:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2 05/13] arm64: dts: qcom: sc7280: Fix the base addresses of LLCC banks
Date:   Mon, 12 Dec 2022 18:03:03 +0530
Message-Id: <20221212123311.146261-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

While at it, let's also fix the size of the llcc_broadcast_base to cover
the whole region.

Also, let's get rid of reg-names property as it is not needed anymore.
The driver is expected to parse the reg field based on index to get the
addresses of each LLCC banks.

Cc: <stable@vger.kernel.org> # 5.13
Fixes: 0392968dbe09 ("arm64: dts: qcom: sc7280: Add device tree node for LLCC")
Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0adf13399e64..90e11cbbaf88 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3579,8 +3579,8 @@ gem_noc: interconnect@9100000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7280-llcc";
-			reg = <0 0x09200000 0 0xd0000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

