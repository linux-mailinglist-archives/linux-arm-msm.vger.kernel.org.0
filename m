Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A5674EE79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbjGKMVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbjGKMVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:21:07 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FFBE7E
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:19:58 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so87205171fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077953; x=1691669953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUYkKYV4ujMuk/ZAzUO3GhIfjlSDACYKMYMpvbHOS0o=;
        b=OgunhkVOF31gy38IhMYvZho9KhSZ47S9iBORV+B36TBHEI1JAGoOya2CnSx0xvAq5v
         liYYiSZKkzTxHN0eE1ZHZN8GnyINqoW4vX9CzMfKqC0hymDNkSlYMuuikfxmmc7P/9/7
         QnYrYgoJYopuQIMsxEfvJ9kVIrNI0I+g4ADspVcr0fibplX7pI1EzGfRHHMgQ6Np0IHL
         yDbYoAPrLD0IkK/WKk8gep9brzNYyxwTw+8+AuldU48HIUA9tUlOECSDy4iFX7z/fabW
         wyBC95Ln+K65PUff0VbhhPeTvbTFVNiXgUcujfvrW4UsdN2Qh5whMTACusaKtp54t7FN
         uAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077953; x=1691669953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUYkKYV4ujMuk/ZAzUO3GhIfjlSDACYKMYMpvbHOS0o=;
        b=Nwq6aRhKmIAWEu7eeX+AjSTkO/q+/k+qx4neQe4Rn25M10ZJecow3578jUz2FRZyir
         qJL5n/0e4vThCvsza5LjHDRw+LxOUSkZaMJrfJjlp2x7EAUKKnPn45v84qDIic/aW7bm
         6nzYSn2vebgSRTfQS8gxu+2JJzERLdTyKTnwvFcbAIVOXI2ABwddoCNIJr74ON+41mx8
         pTfYD+PBZKrfESbBhoH4gLjP0tv0i6RPu4uFZJI+t0/TkjNmo9ylLIyWtnGnRCH2+kH2
         4kZLv8oW1yi4WbV8FlnKsOxcnbqi54S9EY4YY73RRH35iXm78eBvkXlsDPuu8HinzjN/
         fkCQ==
X-Gm-Message-State: ABy/qLYFOApZG3MvUlWB9+mAPTOZNGKtyNXA1V8czC3ZxMDDODF7V5rt
        sdaUPk4xh6xyTkyIc1Spm8jSCw==
X-Google-Smtp-Source: APBJJlFPUmyPSwMDVSzJWoSM+iefcHajI+de62524A0AkTML6/JzXuMpkaVh+NTJM4H+MO9OfFHL7w==
X-Received: by 2002:a2e:8210:0:b0:2b6:dec9:2813 with SMTP id w16-20020a2e8210000000b002b6dec92813mr12673229ljg.29.1689077953345;
        Tue, 11 Jul 2023 05:19:13 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:34 +0200
Subject: [PATCH 35/53] arm64: dts: qcom: sc7180: add qcom,bcm-voter-idx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-35-b223bd2ac8dd@linaro.org>
References: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
In-Reply-To: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689077904; l=644;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xdrbax/ndnKE1dzVNPWI8e+2pkkV5TGwm4Tup9sPjbw=;
 b=ULJhbO/N8xan2DF4ZAbAkoTD8jZOS6LFAS8q/YqNYtwsRloh0iYcbUBoTNfPR7QB3ush0REIq
 9YjPh6F2yYjATxZuvg5kiiV3rlOj8Y9dltoQtB+QSLrRjusYdbPNHcU
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To improve the representation and ease handling, identify each BCM voter

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 179544ba12db..cf12f358fabb 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3653,6 +3653,7 @@ rpmhpd_opp_turbo_l1: opp11 {
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
+				qcom,bcm-voter-idx = <ICC_BCM_VOTER_APPS>;
 			};
 		};
 

-- 
2.41.0

