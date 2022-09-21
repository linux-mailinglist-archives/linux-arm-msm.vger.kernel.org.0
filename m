Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4891D5BFBBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 11:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiIUJyZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 05:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbiIUJxv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 05:53:51 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E6F25C3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 02:53:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id s6so8282269lfo.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 02:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=HybsSNYSRccLavRmMCYeRgEaGHdyFC9lgC0pGHiT8HE=;
        b=qIaToEIRN1GM5f90fj2sGInjUBethcEg0NFiuKSuFhkPPQSHrnMcFOwsim7maVoBiw
         GU14VcCnXO45Rd07dTZkQONdVqrtkHQP0LEPg61NjgEJszMH8vMGSqCO2uJLyovd/lyd
         6jFntX/cHmdRScXa0pHG2ZCCrZ1J448U/gOdjoobqP6Q/2h7aWsRVJmpGsrONG5f0Des
         JTNlHYY5sxLa6GKa2ZOJ/oV3ZiYX1iZf9ofB3xwS3OrLKWdHocWTTbKVb/wwvNNm9QXy
         KO7+iUw83jP8xSinebCNpQkFhKReQqcizD9jTiX0vq2MHuUWwGbPbSuZRv9YN7lrlCAL
         hKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=HybsSNYSRccLavRmMCYeRgEaGHdyFC9lgC0pGHiT8HE=;
        b=7np14a0RbSeaI35e7ukikKrrQeU/n0JEjNCFghL20Qqb0UoUxh4OFtMz9vCJNHCg+p
         XW28eGMDzjXGwhg/bEhmh26DVNKa7rJhptw/JVYWf/JGMPAawkvZ62OcesnCxnSW56+r
         yiFEVAD4sNohLgVyggCXYPMhk6NE9U3iRdXEfSEcGxWe6Bk3gBn0Jk4RYE+PMjSNkyt+
         tAIjzMrVdgGhOuvUedptuMXrllP6CQeWRLu9EMUjx/kiGQwOPd2XWvhfcdqbNDxO9Dfn
         bfnyEJuR4mzOA5QTCauAuwuDLXm6F90hDk2PrVyYMop81FUHjXOyyRiZ6eVhUzEU9pLX
         aXOQ==
X-Gm-Message-State: ACrzQf0MSjjvk+0DAoX7HSNiZffwf56Ou13vH9pv2nZLQasjAbUZ+L8O
        HdgbNsT+yTVK/UBR2+5cxORTFQ==
X-Google-Smtp-Source: AMsMyM76AMjIBJiLGczAVQGoYwviqaeF+80j2ARYXJwH4jcLAjoWE9VCKr/q5bTBgHAYHMYOb0BDhg==
X-Received: by 2002:ac2:528c:0:b0:49f:53b7:937d with SMTP id q12-20020ac2528c000000b0049f53b7937dmr8884987lfm.5.1663753979489;
        Wed, 21 Sep 2022 02:52:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i11-20020ac2522b000000b0048a921664e8sm367694lfl.37.2022.09.21.02.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 02:52:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Revert "arm64: dts: qcom: msm8996: add missing TCSR syscon compatible"
Date:   Wed, 21 Sep 2022 12:52:58 +0300
Message-Id: <20220921095258.2332568-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This reverts commit 8a99e0fc8bd3 ("arm64: dts: qcom: msm8996: add
missing TCSR syscon compatible").

This commit marked the saw3 (syscon@9a10000) node as compatible with
qcom,tcsr-msm8996. However the mentioned device is not not a TCSR
(system registers, hardware mutex). It is a CPU power
controller/regulator, which is currently being handled as a syscon.

Fixes: 8a99e0fc8bd3 ("arm64: dts: qcom: msm8996: add missing TCSR syscon compatible")
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c0a2baffa49d..aba717644391 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3504,7 +3504,7 @@ frame@98c0000 {
 		};
 
 		saw3: syscon@9a10000 {
-			compatible = "qcom,tcsr-msm8996", "syscon";
+			compatible = "syscon";
 			reg = <0x09a10000 0x1000>;
 		};
 
-- 
2.35.1

