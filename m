Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D13740103
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 18:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjF0QZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 12:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbjF0QYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 12:24:48 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B307130F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 09:24:46 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6a1245542so40105571fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883085; x=1690475085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYaFF944CBPpPI3xTGK+ozEDUtWhjiR1kLsCUSq/tTw=;
        b=LWoWb4vsMHyG2qkazpfTdhW+UQTZZaP+KpW9Fxat/1VZee4W/NKGQEWMqYGZ9NuW/D
         m4BE+3+7lpPfy7kORXnMMu1bSeSKlt7jNRaY8TrFsqHaqL0z4walAIeqcpnYaKEdplVD
         zVKYjMwT9B0tBR/Yd8IcB2nEJlj+n1AoGd3HfdLlKut5f+FuYu/F/MQmAtY2E/ouKsOE
         PUJXqfkz1gHFvCGlVLAU71YT9nrR83dOoYgMvVHd7rBfptkSLO6f5JfCr1/rAq3A0XyZ
         QdODVO8drrPTl7R2Ewo+g5Mm4pgMbt4oi10DHPO9L4FxaqOWf3jd0jHw3mWBZFRgiT4A
         WlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883085; x=1690475085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYaFF944CBPpPI3xTGK+ozEDUtWhjiR1kLsCUSq/tTw=;
        b=hk2AWiEk2uOcn/jtJn2EVbcgPDZQvVDKs6psiZk0hde5dlMfD7hcw/Y3fUEFfqrfFL
         7Y47c6X/5qU5EgpairDL2GwLKYiRf9WHhXpOJ53lp8k8Rpy++xj+XClzYgm14jg2BaXF
         4HC2/PJMEbeJWqOyUeGi1jzM6Mn00k3vzEaklCVKNjx/05AOg3ze/EY+6IDn7cdxjJ6X
         GAMnGe/Koj5jWIaMh3FqhSJ9D4LOuwoT6zLHMxFJ/S5h026+4aUnJxcnsgIHzzuBm1Gb
         c9H5ues0vMIQUVhPQ8V3czLdY101lsw5ALoXFTuGMyAhWq2D8oydD0ihe4L3/eDptgFZ
         E7Yg==
X-Gm-Message-State: AC+VfDyT5VGwl0oG1eClD+4bMt/gi+JjkNnEg+GaLQ3rl2lLiRfmEI5G
        NbBTQJz999GkoUUKvVuOzWBrjg==
X-Google-Smtp-Source: ACHHUZ4ythlTwuN1ng1WKH85xShFqna5kY+HIIDyB4fmlolvggLWrCYvWnSmKrP/dkJwFLHJqDS+fA==
X-Received: by 2002:a19:3807:0:b0:4f6:6b:a43b with SMTP id f7-20020a193807000000b004f6006ba43bmr18574040lfa.52.1687883085080;
        Tue, 27 Jun 2023 09:24:45 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:44 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 27 Jun 2023 18:24:19 +0200
Subject: [PATCH 03/11] arm64: dts: qcom: msm8939: Add missing
 'cache-unified' to L2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-3-6b4b6cd081e5@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Benjamin Li <benl@squareup.com>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Zac Crosby <zac@squareup.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        alsa-devel@alsa-project.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=872;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=y9aAPQNrTt4WUn0fdGxJxPfCCX9Hk5OUZHkmKm33hlo=;
 b=w488Qve8orkSmgHUwwh9oyM25h1xdVtgnB4Ys0LYV1nlQjCqgKtAhax7MUl7l8I5KTts0L1Ss
 gOcd0DAg1r7Algsiwe2DbhrC3vv080aTNk+DR8kKIxjAULvaSd4hkI+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing property to fix the dt checker warning:

qcom/apq8039-t2.dtb: l2-cache: 'cache-unified' is a required property

Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 38fc22e66bda..664ae303afae 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -55,6 +55,7 @@ CPU0: cpu@100 {
 			L2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
+				cache-unified;
 			};
 		};
 
@@ -111,6 +112,7 @@ CPU4: cpu@0 {
 			L2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
+				cache-unified;
 			};
 		};
 

-- 
2.41.0

