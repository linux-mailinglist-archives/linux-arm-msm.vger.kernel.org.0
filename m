Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDBA636F41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiKXAtA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiKXAsk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:48:40 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B49FED71F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:16 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i12so303153wrb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
        b=S3iq9reBoNXzjyZUJ4Y1oiTjkQbS8Ds2/ZBf83ZYm+RwXkFfktXpOQD7E9KECYGAZB
         RDTMqDxNcDmdcpuIOEGbRPTHvm2gSzax/TaSJb23/2Umkx50rbTeBZGFqQ8x6SzJ+Tm4
         Mbfb4ZgcDxme3I8zegWrFAnkA4P4U4fqctsBVVaV2kaRxePmzBdsxm6IJAI22NbIJ3Az
         LDcdel4HN5OWHlQKuczzkDY2ETb2Vz+D0hCF7TiQFvEp/vUDv0suDlAZvZeeXOIZKUhr
         ENw5YYBTnH1XVfiFPEjTd0bbyNbdgQ2qBbWX224Y/eS0NRielSAfzTl1+EBIXInvMrYZ
         r6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
        b=aMoRt/rtzYNAI9dUKt30Qsxpu+N2ul3Fi/Av6CWzoSppn1cxrzV2RbOc3AeQgNy0Bq
         Znbr7KAkQN0CEuWa+lwzfBchpTHHyF6LVgaHl/HFoKzMk1ShTvmVddz1ew5TsCPQy8pA
         0Gy7dfeHK2fJ/i+r/fprGIckK+9qqMlkn4n/azI1sbDL/1XKp+npV4nhb5csR3AY0Wj3
         qz30NiVRAZo9w3Obj1zNDZkuhslxuB4tyXdDgc0yd8XfovchpcyxWzE5/6vSGGQNOkPV
         g0hTZ/1hgjcnvCZbi7Tx2ZWvCy+UbFnr8wwVykCXDWoroICYNPRZaJU51r5rkopaU12T
         Wxew==
X-Gm-Message-State: ANoB5pk8G9ozkwn55+zv/3vpRqbRilJlYpU7dHDUX5niFxfUWCxyDu5S
        eGVZXRczPICu7OR7Ys34Svqoo5kxnYeR6A==
X-Google-Smtp-Source: AA0mqf6fjZn0prOEpCWcToLazE5h25TknfPSJG2hbEg0kzP8UkJ/xnf+irWkERN8nfS904+UjNdNZg==
X-Received: by 2002:a5d:5744:0:b0:236:b7c6:7ef9 with SMTP id q4-20020a5d5744000000b00236b7c67ef9mr6874183wrw.10.1669250895693;
        Wed, 23 Nov 2022 16:48:15 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:15 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 09/18] ARM: dts: qcom: apq8064: add compat qcom,apq8064-dsi-ctrl
Date:   Thu, 24 Nov 2022 00:47:52 +0000
Message-Id: <20221124004801.361232-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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

Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for apq8064 against the yaml documentation.

Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d036dff4b14f7..a8b089eb0dad2 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1287,7 +1287,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,apq8064-dsi-ctrl"
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

