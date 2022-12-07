Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1EF645BC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 15:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiLGOAb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 09:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiLGOAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 09:00:01 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BD55CD00
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 05:59:54 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id h33so16434597pgm.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 05:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLq9sh6o4ERCEMfeTO3oZ27aDykjuMrf9ORiNyRUQ6k=;
        b=aftBG4nXLc+S+EIeGTyWH+O6YzVguoNWwbTwF0jpe6dJJ6A4fSyhs3OyuPHHKg7Wru
         FUKl8QA+DsApeQRJSgRnTbNG4i4iZMqYPcERbQA2WuDIk3+r1NynhQjlqRIzs8y590wo
         R+sCZDS9l5p/XBQ58r/C+GntagEzlZqXol3JjpaAmu2HrIB29HSQt7viv9CK7eucKoXu
         HjMZ0w/Di/imX6pvusTBusMddj1Cn25VDZOmpkbkkYfkjickSXb6DBIYp/Ci6nGrj/cf
         1VxXyXSk2MgWlfMCHnUFj/fUqM61kNMY9dkGiHQZ5EpSCGR/kPf6ID77EQ66fPJHM+P6
         knwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLq9sh6o4ERCEMfeTO3oZ27aDykjuMrf9ORiNyRUQ6k=;
        b=AUtledxPlz0qJkNbOFzSocFOUwuoSS3S66MkNrbhpwchAq81/dcd7ILKWReCjB0D/T
         hF3nZpJdD2uPErD9g3+iND7ohFT/4RznS/bjrTjm5TNGqymEqIy6E0m8zE0HtHpjY/1O
         TKILKTfx5qFi2VNBMrmuEhAlQ6hpMny9yaX8vgvsynL+hZgY12TcJ6sT8g0+oPwlACsz
         +XWP2jqeI6YC8r9dxmf1KDr/HH8fnfS9mfjZV7fWTqTH76kkDDWEP94JTmaKxnDJ6K8J
         JacRMmgThy55SODgKafPnudlRwzX0nXVZ4snoFIcXwR5hTFKp5jHe9/E4VSsBsRQp6GA
         h2hQ==
X-Gm-Message-State: ANoB5pnnd2a03cje7ESwu7/HxCABmzmU/baVxWjdM70erPF/YPOV71Ch
        BQx2pr3BNjYh37jnV1AjKQ+g
X-Google-Smtp-Source: AA0mqf5QHPzg4U5Of8BBxzVGVmDVExV8eT81olXJE2Q8NaI+sNIdpumTiOXEvLLdcNMtWaRe/oH/Cw==
X-Received: by 2002:aa7:9192:0:b0:563:1ae2:6daf with SMTP id x18-20020aa79192000000b005631ae26dafmr5692435pfa.71.1670421594384;
        Wed, 07 Dec 2022 05:59:54 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.5])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902d49200b00186b69157ecsm14720160plg.202.2022.12.07.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 05:59:53 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 03/12] arm64: dts: qcom: sdm845: Fix the base addresses of LLCC banks
Date:   Wed,  7 Dec 2022 19:29:12 +0530
Message-Id: <20221207135922.314827-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221207135922.314827-1-manivannan.sadhasivam@linaro.org>
References: <20221207135922.314827-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Cc: <stable@vger.kernel.org> # 5.4
Fixes: ba0411ddd133 ("arm64: dts: sdm845: Add device node for Last level cache controller")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 65032b94b46d..e1c0d9faf46e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2132,8 +2132,11 @@ uart15: serial@a9c000 {
 
 		llcc: system-cache-controller@1100000 {
 			compatible = "qcom,sdm845-llcc";
-			reg = <0 0x01100000 0 0x31000>, <0 0x01300000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x01100000 0 0x50000>, <0 0x01180000 0 0x50000>,
+			      <0 0x01200000 0 0x50000>, <0 0x01280000 0 0x50000>,
+			      <0 0x01300000 0 0x50000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

