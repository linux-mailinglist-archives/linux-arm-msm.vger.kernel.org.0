Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05258781E25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbjHTOZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjHTOZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:22 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5E83AB6
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:44 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so42911061fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541243; x=1693146043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvOFn83uvDLvxypbQV4yA9YZmZPvjQ28Rts4dfTJ0UU=;
        b=udWICl/vgzADjnkEGf4lYpn5AYLR/ed6MKD0MohoZl+bOStRaWKRXuSD9UcdEbc2Y3
         kBXJJq4uo1BWjY1dBcD+elA3vQ0P3yKCFlJ63HeqaS3EdAGAMNsCbi2VaAZS+vSAPPsE
         tVRm8z83FUKH7ijZa9OIe94/cDrVXF7oSP5Kxry7OhhYMn1YF/AXX2rsskxSagtIX4R0
         X154vhlGHSvbgcFImC0b6zkNe8JTBjDu48vngLLs+47U7n7bThocyVVb5kVPCDeYWvxg
         b7qS8zkUgPk85TiHDudJPFYDeNNglkB8+8/idbXwlT5jHlul/99/YzyBaEMtacEAJWyR
         WLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541243; x=1693146043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvOFn83uvDLvxypbQV4yA9YZmZPvjQ28Rts4dfTJ0UU=;
        b=c9c/gYpdrX084iYs79cj2sAQzrJVf5wxFH9zGFuEAugpWd2VeNddr0hZNcAbDxTMw7
         P+0dDxX2Dcm+9OJak/4y159RD8pzrlcFtGY44r1MJz/WF18kgTTBaMLKpv6lII+3gSZx
         A+mH1RroCkmH+MoyF1N6tgsTldRZdU+oDSJUC7ln5rwZFmnSiMgX3DpLY9E97hJ9esgE
         dVJ9R7wgsTo8LoznwyT6rRnQKCZZYzqiRMx3yuKKVBReC0oFdc8Nd4MOarGbPkpZ23xH
         M27M4bdV4zWOmedTe5KcfZerqYiRaC4KrcROBX05mc5J5QhqHHbIcMGo3fkvmrGlX2+M
         /oRw==
X-Gm-Message-State: AOJu0YySzXwy7GQatbKPJ3rZtcvo7X1XztZljKEufADiyiQTjMgJxUY2
        BhnY3SJd6dK2vX4Qyez3dqwq2g==
X-Google-Smtp-Source: AGHT+IGVYD8bjwArB6f+SD9KJklho+KRKO6hgA0zrJLE1RLH5+FTMvLtY6pVHGO++5Zc+8QpxPEEcg==
X-Received: by 2002:a2e:918a:0:b0:2b9:bd23:947e with SMTP id f10-20020a2e918a000000b002b9bd23947emr3064041ljg.27.1692541243272;
        Sun, 20 Aug 2023 07:20:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 07/18] phy: qcom-qmp-pcie: support SM8150 PCIe QMP PHYs
Date:   Sun, 20 Aug 2023 17:20:24 +0300
Message-Id: <20230820142035.89903-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reuse sm8250 configuration to add support for both single lane and dual
lane PCIe PHYs on the Qualcomm SM8150 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 565764c5ffeb..a63ca7424974 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3750,6 +3750,12 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdx65-qmp-gen4x2-pcie-phy",
 		.data = &sdx65_qmp_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sm8150-qmp-gen3x1-pcie-phy",
+		.data = &sm8250_qmp_gen3x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sm8150-qmp-gen3x2-pcie-phy",
+		.data = &sm8250_qmp_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sm8250-qmp-gen3x1-pcie-phy",
 		.data = &sm8250_qmp_gen3x1_pciephy_cfg,
-- 
2.39.2

