Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84796C64EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 11:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjCWK0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 06:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjCWKZ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 06:25:57 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987B51042B
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:25:34 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i9so19859706wrp.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679567134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaktxrHqSVBJvgr5m72rtimmU8b1rgEPNt97tFbcEsI=;
        b=RA/Lgk4VwDZLxmXqWCBeVhDkzv9+CRUnqPoo9qv4UtG2XacS8baIy+fTIVEV82opdv
         CAjK2Ah7Dy9KSx5k2zPAgeq2dxSnBLeGXdmEf6/8/VZU0eTtKhmridKEGg/n2wWxlFVF
         pH68Xtcbv5kZXA82o/cTGLfrcXJIPqgeBLsOdGqziepgcUDnC0IlmjLXgsrIjUvujNKy
         ATRzK4Chla46roFSYqSZ9kQ1tl1zVSDCzmU5m/eael73KeqBOf1HLH4Mlam0PHYF2S7s
         MZj+/aYc1u6miyHQ4A6newI6jdqIkfLsMq0vtI8rqmqe7vJz2KYOzrcRo53ggOdnlW/a
         QhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679567134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaktxrHqSVBJvgr5m72rtimmU8b1rgEPNt97tFbcEsI=;
        b=SL/nx9BwpEHkD+4L+soA+aEo1Jt9WNmNm8Sm3MVVQ04DEgJ/xR/eES7LjlmZxKrYH/
         95vA+cDvA61GCt6C5FShozcvX7JOfrfF94pT2bRGe7NqmRr0yuHJA6+YbiODz6YT+BMJ
         kqbOj/PUk+L4sEB7PQxCrMlO9JX02o3qnlAhhnp1h7aGJlS5oW+YeiMNWl/VD6yTz17I
         9D6lPSTchpZLsS0kfIYFhS6/SCt8+XKQFc9Ndi0+N880pNNg+gZtzp/gLUAv2FgYks4w
         fmhy4s/DA+7qKV8F73dnO8h1C2zPxGLZHbLm7z6uBXtrxnuVJIG00FyNakec/no5Zfkq
         zqkg==
X-Gm-Message-State: AAQBX9fWoe7/6k4z0IHUU1EzkN3PPYkW9GvY4/Jabl9g1qQbd0Zoo6qC
        eIwD43OcS/KFMrCEHnJTgTbBsA==
X-Google-Smtp-Source: AKy350YQA+jMkbW6mQuuJtWYSx09at+iDrv03avXAv4uZ7HMAI6MrP6YJqgswmSR4K9JmG855UqLyA==
X-Received: by 2002:adf:ff8f:0:b0:2da:53e3:57d1 with SMTP id j15-20020adfff8f000000b002da53e357d1mr2029999wrr.62.1679567134135;
        Thu, 23 Mar 2023 03:25:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 03:25:33 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 23 Mar 2023 11:25:22 +0100
Subject: [PATCH 7/8] arm64: dts: qcom: sm8450: remove invalid reg-names
 from ufs node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following DT bindings check error:
ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index ef9bae2e6acc..8ecc48c7c5ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3996,7 +3996,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>,
 			      <0 0x01d88000 0 0x8000>;
-			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&ufs_mem_phy_lanes>;
 			phy-names = "ufsphy";

-- 
2.34.1

