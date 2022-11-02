Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCD761718C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 00:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiKBXN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 19:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiKBXNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 19:13:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557A638E
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 16:13:20 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h12so200288ljg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 16:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
        b=S/Qn87B4jnSh43bul90tVbTclkpZH/Y50HfauJztlau09yFmuoH1d8a1yyHe+uC36W
         DhgE78HyyH9C3yAS+M9EClBqIKclKGuMupTlCFSEr21/fHTUDVigVIrjTgAf4Rd4Nvym
         evat0hleuK3VJHMFXnp3xe8MjGJ/tqfkIYYIAsQdQ5mTretwovhNKYVGlMufVuK/vijb
         sp7GilUmoeRW90PLaH4bFFP2sSCKPO3kG4bPWNvMTROkEIKwBxV9uQhlC8tpMrWXF3FC
         FrTqZSUu2va1E3zB5r6HLB8k5bPaGkt6x801Z8eCeMfBrliHKOJ+VS6OViOrnN6FjvMR
         jCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
        b=AUd6ClMOtBT/JRHK+8NAfOpZl7T/NF1gUgiPWNF+OqakcJaXiy6rc/Qh/MPgxSzbWC
         U9ygeq5+xLXs2AuMvgNweJao2smmmoG2UUSBefTfR8WpWoQroqCBlIQWKxmgljRgfzPb
         lD0ovQTgYxLKOgJacI+kMiGpCCgpxTvJ/thqt5XBhsGsdSfWIUb8tEhNIB0/nPDW8iPD
         wyZRZoUUI06mcYsLs/WuTQZ28AQFyxEmd3Wcp6owP7gd5uWml6bZoH80gDN0HFiQgYMY
         Atm61aUH+2TRPAowsVOFD7sT+HSmkPGDux1u8RFyejF4Yr3XvI0Wn871aEs7IaJnfIua
         SrFA==
X-Gm-Message-State: ACrzQf3tFl0dfLrx0PEjfj1YuhmEHLC5x312/22d38x4+gz6Ja17QVUp
        p+28c/J/54sce0DO4u68Slw3hQ==
X-Google-Smtp-Source: AMsMyM62Nxy/dRZPZAs2gcgoUqkXQxFxmZiU7olOjBRCzkBHDJDDMj7lCMuIOg7k31mvS1+VKomMdw==
X-Received: by 2002:a2e:a48f:0:b0:277:6102:5561 with SMTP id h15-20020a2ea48f000000b0027761025561mr5570227lji.67.1667430798748;
        Wed, 02 Nov 2022 16:13:18 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 16:13:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 8/8] drm/msm: mdss add support for SM8450
Date:   Thu,  3 Nov 2022 02:13:09 +0300
Message-Id: <20221102231309.583587-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
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

Add support for the MDSS block on SM8450 platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6a4549ef34d4..5602fbaf6e0e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -283,6 +283,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
+	case DPU_HW_VER_810:
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+		break;
 	}
 
 	return ret;
@@ -511,6 +515,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

