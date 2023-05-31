Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD28718169
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 15:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236401AbjEaNXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 09:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236402AbjEaNXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 09:23:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878A213E
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 06:22:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f50470d77cso3935889e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685539372; x=1688131372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ryW+K+LYqR1W2qwoXZKDnRUejfqdymBTRf0P14sODU=;
        b=MZSHZWn0nM7S+f+7zoryLntPic2ZiFW629mjOTJvAB1sQ50phNT+ydKRrnKw/pwi2C
         Rrh3RC1AWpSAomgAZ5BxH6Oe4SIskZfTxtzSXSIeyUGjGPnEAfUXdUvCt8Mi7AdQeHSd
         Io7WE5qQOPkbLZFddQRNluk1Z1R6+mdwbWMu4+MV6Fw8PHQNKThILDSh7h4nlG1YhJMk
         kjG4bDixbCIyTREPfYzrYoE5DCItNSa5HTyovWdjdPsp/O91TYH8R/SdoRVKcC+I3UzJ
         buvbxcv0IM9iZEccCrsFY+Lqz1LgyWq0dT+cSvP0kzC/ZZSPTkYctKsAEGPWbjl8zF09
         /3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685539372; x=1688131372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ryW+K+LYqR1W2qwoXZKDnRUejfqdymBTRf0P14sODU=;
        b=giGepFt+URffhGvv7rUDZhBgpXj5G5cEv9n6EX/rz9wSWd1qvXwxvAnnqX6W2wz15c
         kanzDRU5qWvE++hHkBNWtIJ5cGj2WY7u0f5H0Md5T+izAsriyxyWhWpFRx0/yN1soSKu
         u5WL3bUNZCPG5BwwO4yF7U1C5idoV48aHRsHC2ukiPAaCRBweGZI8VxoFSIj7EOi6rpy
         2fuyJzBJAicp2q2w1GEi8ZcmajkbQLoSdkoU+t4LLaUIaY77NQdplkQvbJskcndpSu1J
         IPXQutYEyJq3dY7WQUMhCtUfQZn9hbazff13XjTtkaGsLwNYbIkjSduWh+/We+dNcElj
         qoKQ==
X-Gm-Message-State: AC+VfDwMHCWSvk3QoAL+qBLa7bWVUhNbsV2Jb+hmqnIX8J3CmRTr0pRd
        X4J7ToWPDP4pzbmhqMt8g/pNpA==
X-Google-Smtp-Source: ACHHUZ6Okrk6JAmq86x5aM/3czvMRqx2NnsfSy5WatBG8B6psdOpQa6A3nmDLX2VslxdQEBzUOfMBw==
X-Received: by 2002:ac2:46d0:0:b0:4f1:866d:9b01 with SMTP id p16-20020ac246d0000000b004f1866d9b01mr2692340lfo.3.1685539372048;
        Wed, 31 May 2023 06:22:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id w8-20020ac24428000000b004eb0c51780bsm720138lfl.29.2023.05.31.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 06:22:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 31 May 2023 15:22:39 +0200
Subject: [PATCH 5/8] arm64: dts: qcom: sdm670: Flush RSC sleep & wake votes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-rsc-v1-5-b4a985f57b8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685539362; l=973;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=28KiIyU64Vcz64CBovN5yeE9vk16BjibiZQ9uV6zjFQ=;
 b=4NyvQdlZdQFvEUvndCC8eaIlcFTob2ugKlmbPnnPwXQ7XTJYmFWvPKt7gwTm2VjF1HeFnS+oD
 CVSUA1GN6F2DtVuZdYaZ/Vv5jelIlEWCukGP3S3rSAuL2cqpj792ETk
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

The rpmh driver will cache sleep and wake votes until the cluster
power-domain is about to enter idle, to avoid unnecessary writes. So
associate the apps_rsc with the cluster pd, so that it can be notified
about this event.

Without this, only AMC votes are being commited.

Fixes: 07c8ded6e373 ("arm64: dts: qcom: add sdm670 and pixel 3a device trees")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b61e13db89bd..a1c207c0266d 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1282,6 +1282,7 @@ apps_rsc: rsc@179c0000 {
 					  <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>,
 					  <CONTROL_TCS 1>;
+			power-domains = <&CLUSTER_PD>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.40.1

