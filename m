Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2583E6541A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 14:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235512AbiLVNSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 08:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235616AbiLVNSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 08:18:09 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8982B635
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:17:57 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id jn22so1955069plb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GFA6I79C1YmmOYQX1BIX7MOGuUjMMgmSjlJ7uhFCjc=;
        b=KyqAKH9suEnSST6nGHfrF6tiq5gOyxJrohsSocczxR2yYtSwc4itB7Rwfc7SH8NQLf
         BOPZJAR/M5OHetigMOlkHgsIEqWFC+GZdcpTBQGve1FYMPv1J3bDllxaG/kYFe48R3kZ
         rkszrwUINRgXb7Td2fzluU97ArKf/8mB1NDMjLIUKHoEEbIeT8GPsj8E4Ny3qEZBPheS
         uYLvV3c5hS6z+vjOmzfvNLSasQIo7ZLkLBKmN+fyEWCGfW90yyMw9m4HJgs6DIfQhYWn
         JzXWbNAb3RUKYta7ThAlAjFkiNAyQDrz5AndikCMq+Mdx+pYaM3bf4ikeORkaz/Rfb+k
         eOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GFA6I79C1YmmOYQX1BIX7MOGuUjMMgmSjlJ7uhFCjc=;
        b=4PDPb9E2qtIwlSDvrHGZldgyu6DQKiMpfpk0hrjE2ces4WqNbue8vEohnzQq8x26wc
         nZLP8yjgncLCoeD9AwuVHglq3zbhFz4KKUQj/fNEC4FOpoEemL7qwHtyWR6SJKt4vy0I
         h2Zj56a+4eyv49mP+DL3dIU8PzcTO1PzuiMimSAFoWwsxjS5u6iV4QJczSb3JcxRlZHw
         whaYZ4iTb6hq9/OvghdqQlAPtsm8P8BnEIZnlHiGY+OMyqtMO2nX8DiAVD+OZrN1ASsu
         PNbVC9Xu0jwaDGrPGFoERRjYbV32dApVtXARhylJvfEAkj9BJKwZNDozETozQBhnw3Qi
         Ah1w==
X-Gm-Message-State: AFqh2kpEVUmua8UezU5jv9SnZ98mkuFWqUgjYzIwMK6ihCvkyeaQgBln
        JFCJnyUcych/fFzTGlI2w/u6
X-Google-Smtp-Source: AMrXdXsatbDMtdO3R2ucECYmD9QW413oKPw0txMOMDN+VIJ/fone11nOH6I7fduVKUAJ3Wo/Y3UYXg==
X-Received: by 2002:a17:903:228a:b0:191:217f:b2ea with SMTP id b10-20020a170903228a00b00191217fb2eamr8592642plh.40.1671715077246;
        Thu, 22 Dec 2022 05:17:57 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.99])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902fe0c00b001896040022asm491570plj.190.2022.12.22.05.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 05:17:56 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 04/16] arm64: dts: qcom: sc7180: Fix the base addresses of LLCC banks
Date:   Thu, 22 Dec 2022 18:46:44 +0530
Message-Id: <20221222131656.49584-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222131656.49584-1-manivannan.sadhasivam@linaro.org>
References: <20221222131656.49584-1-manivannan.sadhasivam@linaro.org>
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

On SC7180, there is only one LLCC bank available. So let's just pass that
as "llcc0_base".

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f71cf21a8dd8..f861f692c9b1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2759,7 +2759,7 @@ dc_noc: interconnect@9160000 {
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7180-llcc";
 			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg-names = "llcc0_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

