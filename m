Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C70D471815B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 15:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236369AbjEaNWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 09:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbjEaNWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 09:22:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F8D123
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 06:22:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so6574793e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685539365; x=1688131365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JKYiKf4WFoepDG7kmkdMIn6G2nwJhX9hDLD5w9hRh4=;
        b=COq5zbTTMl/Il2oroAPsQu387YsO8bcsv3rUCk0E6TrpxJStBB0ewGqKobvxPlw2Av
         Jcno/cqIoWjjdVHNslUKDgU+s+iagQcLAuGbSb4YWhDApd32ZNz6oHO2VSo6wxs2QVql
         Wy1lcyHLPd3jcf+M2ojuAcvJwdrB1nEQRe7CEXjzsQWkzDZmjhBsGXtBslnYiGrc0VzA
         MtoJvKs1umoynbs9yZ2j1uZzb/T6/S+M2MfjTYFC8+GGHovMoJW+Nl6gWGBiOBa0A6XP
         +g/D7t+HAgxYX0+rCfLEBZcMXD2vryxerI9KMx4A7yDob4qkEHN5+SRhyJx9IF9dDU5S
         ED+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685539365; x=1688131365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JKYiKf4WFoepDG7kmkdMIn6G2nwJhX9hDLD5w9hRh4=;
        b=CvwPXDptqNoeGH8u+jT3CqFK4HbvZpwrQ9OoIHbSwwq6yHYwjuUecpPvyWSH8OnAGx
         XMryvEc7WiG/WnlR5PYIfvb/XO2sDSTKjnj/4Ehy0x/vuJkfCrXQMHyhuYUsmj4g94z5
         m0vIjl+bczHM56+qArZBXhdnKXZ7034hyowcHaLsxxpqKzdZIpZxAorSKKXixGn3xoDH
         MvY3PpM1Yk1XfLKo574gKp98mzVwAZjwTru99FjggMqexUBG2OE7frWonq5bPBIDIDqD
         0ucMNA4h4Tb1ThSJ+eJHglwPTaocAJRHZM1E3FJQJ0MrV/l/9KyAy9K1+IPZVraNsrsZ
         HPUg==
X-Gm-Message-State: AC+VfDzBPh01FhZmXy+1qYGM4VD3XC3PSHvG3b4vLoL1R/tjdlwxKLw3
        tMyuC/Ix+BFkoLrwkRXeUmiH2w==
X-Google-Smtp-Source: ACHHUZ5tVXoPXD/h46/3Eoit4fzIAXXmCoVmbRQRn6cV2QD21d56z9phcsFydOzNAVLlpmsmaNYacA==
X-Received: by 2002:ac2:5303:0:b0:4f3:93d4:2bc7 with SMTP id c3-20020ac25303000000b004f393d42bc7mr2636780lfh.36.1685539365516;
        Wed, 31 May 2023 06:22:45 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id w8-20020ac24428000000b004eb0c51780bsm720138lfl.29.2023.05.31.06.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 06:22:45 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 31 May 2023 15:22:35 +0200
Subject: [PATCH 1/8] dt-bindings: soc: qcom,rpmh-rsc: Require power-domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-rsc-v1-1-b4a985f57b8b@linaro.org>
References: <20230531-topic-rsc-v1-0-b4a985f57b8b@linaro.org>
In-Reply-To: <20230531-topic-rsc-v1-0-b4a985f57b8b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685539362; l=1288;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WglQhLbldyvnWzPBrjju0jtd9AVV7mA5SfLScXjhzs8=;
 b=S52hqN1JXHaGwbGDFbUsOhaB5i4ksxo9xYZWuKR1BSbhWX2slaYLV4qP1zT02k/PnVEZV1iAB
 xuhK81Syaw3AUTe+hud2ETdH9/aRl7RIzmD7Qq0pqxdX9wRvE7BsZ9l
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

The Linux RPMh implementation refrains from sending some RPMh votes until
the system is about to enter suspend (which is indicated by all CPU cores
entering a low-power state). Lack of the power-domains property will make
it such that these votes are never sent.

Require the power-domains property as discussed in [1].

[1] https://lore.kernel.org/linux-arm-msm/20230512150425.3171122-1-quic_bjorande@quicinc.com/
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
index a4046ba60846..af632d0e0355 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
@@ -124,6 +124,7 @@ required:
   - qcom,tcs-offset
   - reg
   - reg-names
+  - power-domains
 
 additionalProperties: false
 
@@ -179,6 +180,7 @@ examples:
                           <SLEEP_TCS   1>,
                           <WAKE_TCS    1>,
                           <CONTROL_TCS 0>;
+        power-domains = <&CLUSTER_PD>;
     };
 
   - |

-- 
2.40.1

