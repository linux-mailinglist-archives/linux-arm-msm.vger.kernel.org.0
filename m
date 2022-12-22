Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9889B6541AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 14:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235432AbiLVNS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 08:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbiLVNSU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 08:18:20 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A302B279
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:18:19 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so5670395pjr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WUljA05hxjrMgWInu+aANTEuP2TXhzChwqlFzG2wks=;
        b=C6UEEu2cv9HWmh2bzqVBHeQNYzwhh1L9U41oaFA6os6JZIvt0qOms7EsWan5cEV7G8
         qsqXREDB3CHZbzOCiJBLqi+fXZTtfzBsk4cLkQLICCPN5ELJM2O4eZQdxJnKWrWekIrG
         Cdl+6PhS6yrwZoCPgec0sAfNU/Lz4Z9OaL1GXz+MgxOIgxkIL5pIC2dRDIATEQyzfuq3
         +D9Ep3r9hv4cZKTwNmtK+WPgoD6mU32mkblcraTyNqu1woMe80CkJJt95f0Gdt2fFgvO
         qHQHrtlUG1k8WwTDlZWoj8h16PiKr9rqRyymr04KacTDb2OIZuTjTbLumfQvjQ/wuJOU
         slPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WUljA05hxjrMgWInu+aANTEuP2TXhzChwqlFzG2wks=;
        b=6bKqmc94M50TYrt31Xa3miCV6x+P2QCtoJtgFdeLj7utymz0AyMCWk57Vl6oIOZMUE
         m2N/v3mms2oPkW9IjbT//U3IrKxP0ELl6Q5UzTzoQhcQWXYmiL6jDEbLXofxCXieTbQU
         WwabOi2KQKSG6VD/gOb2xw4Nwfn9AtDkqqAaaaXWDCqO9n+ZGo3Nsonj8DfR2cZtNr3v
         3CoxnCgQCM0k2FMwpp19JU08kDRgLmIzo7NtPwlukUuIrL3Ea3bWD6za8t4vpCTvz7of
         XeONk/bNxZWtkywE/FlCfPOKBoudz+My5viEBRd4ybn5szomV72UXirk1l0uB1Qoi638
         Xc2Q==
X-Gm-Message-State: AFqh2krs0CM4IQzudndzJr2Msh7QWCJfTfZ+KZQauG2mZsvQ8X44YRP9
        LE+s39ogR2wYz4RU9eMtNAeq
X-Google-Smtp-Source: AMrXdXsCzWm9VWW8TILq8RHEyV9mJ8/MU3x52JiKXifwS6CTKL1XVbjr8B9n0QsLNCyD0eS8wukUMQ==
X-Received: by 2002:a17:902:c612:b0:192:511e:b9ab with SMTP id r18-20020a170902c61200b00192511eb9abmr3162310plr.21.1671715099601;
        Thu, 22 Dec 2022 05:18:19 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.99])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902fe0c00b001896040022asm491570plj.190.2022.12.22.05.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 05:18:18 -0800 (PST)
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
Subject: [PATCH v4 07/16] arm64: dts: qcom: sm8150: Fix the base addresses of LLCC banks
Date:   Thu, 22 Dec 2022 18:46:47 +0530
Message-Id: <20221222131656.49584-8-manivannan.sadhasivam@linaro.org>
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

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a0c57fb798d3..7fd2291b2638 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1762,8 +1762,11 @@ mmss_noc: interconnect@1740000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8150-llcc";
-			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x50000>, <0 0x09280000 0 0x50000>,
+			      <0 0x09300000 0 0x50000>, <0 0x09380000 0 0x50000>,
+			      <0 0x09600000 0 0x50000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

