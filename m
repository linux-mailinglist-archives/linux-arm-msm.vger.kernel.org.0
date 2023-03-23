Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 216C96C7424
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 00:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjCWXhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 19:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjCWXhu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 19:37:50 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDE02DE65
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 16:37:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id h25so44854lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 16:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679614662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szL/+w2Axq6DdFWIyIaTAORK+vW5wgvKFmHCeq8RaMo=;
        b=u41NO+Exq8W4WGyFIlN+wKKBahfz9V2+/sh9BMKPwceStIQ+hmIt1A8gNseEgcE5hu
         G6vqT/uUx0Eqv3vXjJbrZ8CVvsnp+KvAm790dssFgC2ZfoGDbobaSekDrtth+bY1Tk+J
         ZllBtS68iga0dcmylvRO034kGxuL1f8FvCpn4N+fbDhZ7sl9NvoxNSxQSiNy6BscBCYD
         Z3C57ua2MP5B7S10Zr9nJn0ynL+cev64YJw2x/j5LRUsOhFbbga8G3o8i00isEXtpO5K
         bJ4QD8nwgG2Z/5ZmlM+eIJLQX/ey/Tbd41stGiUhGM42OB76E5/71Va7pOK9KW2dS3fX
         cAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679614662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szL/+w2Axq6DdFWIyIaTAORK+vW5wgvKFmHCeq8RaMo=;
        b=z/OngM3+YZv71GXGBkAyaYPJJsBchwDVCgKTcd1s+vz/NHoFFH0FOAc3vyhAqE4HvG
         Lokd7/60KTbQCNSYp68iPzbGZiRpOIgyc5eFdljdpnwyXHUx9SYc/p7qBnvDsPkA+zkf
         oLtf5NbwkbLgFv+HYufL/ty4BzqoeVpHNhVnfeD+Hf63JyEwn3Opdoh6bEoUuf+jTD4O
         z27bX2Ob69LuKeIvtWKp2fVXZGxAGIIipj79An27db9fCLmem9GGfy1M/HD93f/WI88r
         1wGoflKPxmompm+oUSeuiBDx5/mwG1Vb9CA7z9D9Eh95mTNvlGHW4LAjLqCWA2fTFZRO
         9lig==
X-Gm-Message-State: AAQBX9dK6hN+N+cvqdd7CpHYqLbsntAEyBIMJyLBr19RS9/YP+tPGzR8
        XJKHLm7+1BzODFn4IOMhESub2w==
X-Google-Smtp-Source: AKy350afuEbiBl0as0k2v2jYkjd+R4/OO+HuAW6aUF4y6jJppwFVRhfnQ2Chhf1YnbmVQLrL6OdnQg==
X-Received: by 2002:ac2:4464:0:b0:4e8:5738:78a9 with SMTP id y4-20020ac24464000000b004e8573878a9mr149609lfl.3.1679614662576;
        Thu, 23 Mar 2023 16:37:42 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id w9-20020ac254a9000000b004e845b49d81sm3105264lfk.140.2023.03.23.16.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 16:37:42 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: sdm845: update QCE compatible according to a new scheme
Date:   Fri, 24 Mar 2023 01:37:33 +0200
Message-Id: <20230323233735.2131020-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
References: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the old deprecated compatible name of QCE IP on SDM845 to new
ones based on SoC name.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2f32179c7d1b..bca0521dc08c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2643,7 +2643,7 @@ cryptobam: dma-controller@1dc4000 {
 		};
 
 		crypto: crypto@1dfa000 {
-			compatible = "qcom,crypto-v5.4";
+			compatible = "qcom,sdm845-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0 0x01dfa000 0 0x6000>;
 			clocks = <&gcc GCC_CE1_AHB_CLK>,
 				 <&gcc GCC_CE1_AXI_CLK>,
-- 
2.33.0

