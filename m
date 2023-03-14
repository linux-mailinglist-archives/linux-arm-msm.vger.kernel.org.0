Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944376B93A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 13:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbjCNMUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 08:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbjCNMUA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 08:20:00 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36072A17D9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:15:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id r27so19706056lfe.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678796066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeylFVo7UbFotxXKN5Jk9AW63WMsXe+ARjqLamdFW7w=;
        b=nlnvdtT0jYFDekSBiKe7kjUgKmeWkEU7n0KtJb+UJLMZg1jzoGWP3xgtTelAmnACbh
         AA/ExRjWQucoaj8aSZF2s0Csf1EoU2R1WE/e958Uj2/o+Mz4eEucxi8rxcCUljmRLhoZ
         F1HDrxg7hUqEUYLPhNivl5i1idRb+Qlxeh3HIahd8uQKoKq/Toz+sWV6UuEJxZg3E1nc
         N9aaFO48cremURTz8R2Fm7ffMf//BthoMS2ObeHCSOy3O8dakc4RXC5mBOP/bkBldHrB
         crA1RnK7faaSzYwIjcOOcEco4q8JmHmX6ajsWPtbuvh5ku9HjIr3+bkM0nE4MeuLFBEJ
         DT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678796066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeylFVo7UbFotxXKN5Jk9AW63WMsXe+ARjqLamdFW7w=;
        b=g8JwWLMEiX989oMtyNzzJB4Shjt1WScXcrkCar40TUHs3C4I8BWLHDVl2NLUg2QRU7
         CRBTINqVRbjiFJrlquNkL7vOulUx1a9Ai9qfkOTGJP7qLQLckZYT8FQAfi5Ajg6L3wcS
         mlas1dIzDv5aZf3xSmK/k27TE7NOKKXvd/Kw5+sQhmxFND1+eBcK9Odgc1yH1CRSaOIv
         +Kqi29eXK5qxSQv1/O+Aj1jc5TYPlzaD1kPCPsmvB7wqGCaLfYnz1sW/S3FpWrKUzWnI
         rW6JU9ieI984ruIqsCYpUrt+G52Oo+x8TRNTDdvcbwL7ewF5UkwFeC3f8GlgUptvyrQq
         Fnew==
X-Gm-Message-State: AO0yUKWhnnlfKr8XDixyfWaQW9nu+ZiUW5AMrDtM5wE0QhH303/415s1
        cDqyq5oA/xr/4Tl8Q+VaRsxwDA==
X-Google-Smtp-Source: AK7set83jGmoRhPfkqMbcEJHHm7krfEcVsYNn3fRI8hjQUMi1nyZZcK+S70SwgroH8ClftZB5Jk5Hg==
X-Received: by 2002:ac2:446d:0:b0:4e4:b9b4:bf25 with SMTP id y13-20020ac2446d000000b004e4b9b4bf25mr748332lfl.68.1678796066123;
        Tue, 14 Mar 2023 05:14:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:14:25 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 13:13:48 +0100
Subject: [PATCH v4 10/10] arm64: dts: qcom: sm6115: Use the correct DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-10-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=835;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fTDJ/Pk/K83TEsz8nt+gatYoQ7InKrC5bjtKXy4Z9Sw=;
 b=HhZ4vHeSq1k1zTiLWtKr3SD+hh+THRKo/3SDYCP8seyGUW6Irn5LUOqcX+223SewxioRXEQR3Uzk
 jQn7R0qWCdG+pjWnvGDWgOMp24G1gVyrZyKTgLB39uI8m2Ev/nR7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the non-deprecated, SoC-specific DSI compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index fbd67d2c8d78..18c7eedff300 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1219,7 +1219,7 @@ opp-384000000 {
 			};
 
 			mdss_dsi0: dsi@5e94000 {
-				compatible = "qcom,dsi-ctrl-6g-qcm2290";
+				compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x0 0x05e94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 

-- 
2.39.2

