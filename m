Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D996450FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiLGBWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiLGBWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:22:47 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D2F31F8C
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:22:43 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id c1so26399254lfi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65TLYKE4m/VwNED2qssio3XMhUo6hg23hdeNmUUoCLg=;
        b=NwVJ4h8TpvPPYtlIK885VXwf6jYnfU/gxVGjtpPpd2SoJcAlvYljS4hKi0e9k4uLZo
         gPx0phjlX/WHPOra4Mq9dpB75BA0J9x1BZQIG4niiIssztuWdZO5hYPhUJseZfwkJVvn
         EyrO9hJI+pQ/xxHvkAIVs7FKlLe2G0apg/Wm/ovKb7C8Y6C8vKreFuOiPvIXKxieC9uX
         Zm/BjqnVSYw5pLQQHkkmue0xPorIx4gt1IGQ3MrFgalezMYa3g+CX0o1uvSlvfiT40rH
         aihm3nkcRKR3s4uPxSZ5zpjci3aKq42TWulWXCd3l0CFi6NlFXl2ycrjyX2q55Ju7ywY
         CJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65TLYKE4m/VwNED2qssio3XMhUo6hg23hdeNmUUoCLg=;
        b=wZEegx1iSO/CBpypzVhbKKg5VQTrpv8+CoPZRYCkmVLiddnCgPSCcfrBWCXvLLsP7h
         9oNJ6QlUe818DZjvYXTIwKMQkEvnWgla3bpX7NWbr96RSyi6I1QklrKGTzKBYYSxxw3X
         gtkowiXUaAW7JLe7HeTwfjM7TWZho6ovapObGBetq/+iUCxQc6p7R6mZ1AS4CGqRYTRw
         ihazuc7CaMhn1ZiLLSgwQT6CLUqtPbiolBfxuYnVRD9oiy+GOQvGnEF6M7AEFRq65K8X
         Fx7wyG22PQp2Q2MAsysg6EBDB/3dLpyGlplEuMZ5iCZX6rC6teHsKJNXm9nKmBlCyzr4
         81hw==
X-Gm-Message-State: ANoB5pm6ooVRi/p/fCtv18BbyQMICmV9Pumtaf++Ly7VgVWtjgq0KJOo
        8CZxu2DOvOM1+MtH501FkDyZ5g==
X-Google-Smtp-Source: AA0mqf4qS5I9697gg4dibpPGYdVbNtJ7Fx0zbTIumwATeqkKlD8w1bc2gjXymlR2CN8qYD4u8aLPuA==
X-Received: by 2002:ac2:4f0c:0:b0:4ac:2f5f:5c9b with SMTP id k12-20020ac24f0c000000b004ac2f5f5c9bmr22924848lfr.206.1670376161763;
        Tue, 06 Dec 2022 17:22:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:22:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v6 11/11] drm/msm: mdss add support for SM8450
Date:   Wed,  7 Dec 2022 03:22:31 +0200
Message-Id: <20221207012231.112059-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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

Add support for the MDSS block on SM8450 platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 86b28add1fff..144c8dd82be1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -287,6 +287,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
+	case DPU_HW_VER_810:
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+		break;
 	}
 
 	return ret;
@@ -516,6 +520,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

