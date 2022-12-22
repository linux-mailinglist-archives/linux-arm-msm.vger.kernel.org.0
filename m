Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55766541A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 14:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbiLVNSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 08:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235633AbiLVNSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 08:18:15 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A75C2B265
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:18:05 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so5669732pjr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3b0H9FlwI0cHeu/QvvhJdFruV0iaHa3piiWtATy1Lw=;
        b=gnByMWDrv/Lg6BTxLAdidhvjUtHGpWOlSVTpQZb/yNKi+IGyo2ix5/CLp/zvC2ezgX
         rLHDsvBolhEvXSgcaskguoAus95ifGJXB5dvp0tClVHYI1SwNTh6csg8ZGj/AgDBDfnD
         GV9jil3DlgWv8YzUfXAqtFLYxwRyQAuaYTOe0iyvbrxqiw1IFa5qbluv1NBOanOZpjlW
         JH4YTwUoUBAI/OEVyu9NAGYXEYPiDIxk2HhbOS07yrD1Jt5PdR7LnvOi1XAIychU4jTD
         ZHcmcfxg13p3exaHU/ek4vNSsAVLnbNc+lLw/UnxcnnXKst8AQQaSQwR6Do6ACZdgSQ7
         h9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3b0H9FlwI0cHeu/QvvhJdFruV0iaHa3piiWtATy1Lw=;
        b=cvAOt3XRb+3QzVMLuINjlTnuZQ+hLKauFs+rT6amazFLxkPd9VgVQbPWvnuodW5nLb
         hE0e5DdOWlgw5dIgiAhMFwGCVL3WhCVOeFOPNy84iZ9wuNW96kWhRWo0UCT1QdQMIAID
         u+wtBWG+d/IrzFr1ezZytOWEvSw5AleNYlbvzAJ32v/PXoRPjC6ZUvsOAMIRs2t7BWex
         oZYaMn13/hspcOF0jn66B8lPSRLWJ8nOo89BENT8Pis6D+ZPxDuKqZIyDJDHNffFchpt
         Z0/pcXXTUsJKWB6LbpqN6oTGxUfgXOxAgish21AHJ0CZ8McAmzLAfArh0bYR/OUJjhjZ
         NmEA==
X-Gm-Message-State: AFqh2krsuovONoS8MwgvzOyMU7/TWmp35vWEHxkOJouoPjfM5sSqSrTf
        iPIQj3Hx2cSWmWoM8kcH7Vj0
X-Google-Smtp-Source: AMrXdXt1JcCCvNMmg+NUKFmQ0qTatt0gElq/BF6S/H778bnu/MoF9dptpCELzd8BTBoKEofmZwedjQ==
X-Received: by 2002:a17:902:f68a:b0:192:49f4:fe67 with SMTP id l10-20020a170902f68a00b0019249f4fe67mr7323465plg.57.1671715084787;
        Thu, 22 Dec 2022 05:18:04 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.99])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902fe0c00b001896040022asm491570plj.190.2022.12.22.05.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 05:18:03 -0800 (PST)
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
Subject: [PATCH v4 05/16] arm64: dts: qcom: sc7280: Fix the base addresses of LLCC banks
Date:   Thu, 22 Dec 2022 18:46:45 +0530
Message-Id: <20221222131656.49584-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222131656.49584-1-manivannan.sadhasivam@linaro.org>
References: <20221222131656.49584-1-manivannan.sadhasivam@linaro.org>
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

While at it, let's also fix the size of the llcc_broadcast_base to cover
the whole region.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0adf13399e64..6c6eb6f4f650 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3579,8 +3579,9 @@ gem_noc: interconnect@9100000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7280-llcc";
-			reg = <0 0x09200000 0 0xd0000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

