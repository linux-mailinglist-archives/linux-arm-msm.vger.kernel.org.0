Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58C0637F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 19:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiKXSns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 13:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiKXSnr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 13:43:47 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BC4FA715
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 10:43:46 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a7so2819664ljq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 10:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nRilXNMejATHqCRSqUdhVZuc5XWTnwhyCKI7xkZLMk=;
        b=U+Q/ZGQRh+ciARUPs8rBICHV5ApE1U7SEvrBSdJ5qjUPyWHlGhFBnvKX5TmLQmc0Y8
         YbmHuFewD5VFAnPFA4LcvDanVlN9rArajfpN+SlVHKiVmL4I9cE2FhapmeV/+9vHHreS
         JeRiDsXfG+/EZOluHIsbKXGsZ7XdiBltUZLlc20aY02lp7I4n9+Vo/dOiKobzHd34uKy
         GirAXRa7vnrBNr4tmpY3mQTi4MhSOFl9nJKfEflTgJ3zu5MYx/lbo2/uT6aP7ywWjPw1
         yqZR460mxQYiYzlKfdfg1DzmA7K1mSZ3pLZH24CtTe+iug5L7glEkMsUdVlcwy4eWof2
         l5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nRilXNMejATHqCRSqUdhVZuc5XWTnwhyCKI7xkZLMk=;
        b=uJ4jnlaI5ArAfYDyU3+lOx229zaAoFuThBDEvq+aWv0wTzjMx0lb8vOwcJ8/ABv2cI
         MCD2icjj2JR203R3N6HsD3Dl+9zTusBuFZyAijMB0MueBMni4cVkaAC79gz6DXPmZHDh
         lOp+7+0vKfO1JykjiSCN5B3R5Ip1oabPAiSc73GRJ0UNaUTZXf5o+8WPamPFu+1pVVDx
         H44NpZtje+DZUyk4Jfu9iYOUqUWN6sNWA7L2W1cpthmMpig94H2vdck08yCA9QK/6mNv
         NYkGyUyTCb1Jk6DzErsMObZgmJXG0CX7n3LS6LK2fm1oWpaBAScpNQ7OwQcPNT4Fq29m
         xcfA==
X-Gm-Message-State: ANoB5pmBHcr/WagAoQoNOfoaYFYyFeELESjr5RtHbybQx7okCO6o6Fve
        yvLB5jHv5iFjCQz7yGG4TGXmTg==
X-Google-Smtp-Source: AA0mqf5bLcnGSFfnThKEl7E9M7Oag927/C28/iLbqEtG5ebaSXT1G6t4nwsznoEkOEdXPf1v8oZdtw==
X-Received: by 2002:a05:651c:213:b0:277:e01:610e with SMTP id y19-20020a05651c021300b002770e01610emr10427702ljn.181.1669315424541;
        Thu, 24 Nov 2022 10:43:44 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea607000000b0026e0434eb1esm159098ljp.67.2022.11.24.10.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 10:43:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/15] arm64: dts: qcom: msm8996: drop address/size cells from smd-edge
Date:   Thu, 24 Nov 2022 19:43:19 +0100
Message-Id: <20221124184333.133911-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
References: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
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

The smd-edge node does not have children with unit addresses:

  qcom/msm8996-oneplus3.dtb: remoteproc@9300000: smd-edge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. New patch.
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index d31464204f69..cc65f52bb80f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3426,8 +3426,7 @@ smd-edge {
 				mboxes = <&apcs_glb 8>;
 				qcom,smd-edge = <1>;
 				qcom,remote-pid = <2>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+
 				apr {
 					power-domains = <&gcc HLOS1_VOTE_LPASS_ADSP_GDSC>;
 					compatible = "qcom,apr-v2";
-- 
2.34.1

