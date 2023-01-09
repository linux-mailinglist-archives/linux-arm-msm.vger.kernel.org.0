Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59DD8661E41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 06:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbjAIFOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 00:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbjAIFOI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 00:14:08 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A71BF4F
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 21:14:07 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bu8so11280389lfb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 21:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxCmYI5w6nxSiqH6mYIJV7nQi3+kDtIa5UINsO5Pmjw=;
        b=o4/UvsEtBooqsTfdDvZ4V6Dw9b6IPeSH3r9D+ICRd3/FqS3ykTsMlhZlKml4B8QYK2
         6pWJ47Uk6IXqPlJVReUTgvFYpltrdnF7w0b90VKB3dnZi4iAe9bjKIVqqZH4JIfrTJNs
         E5oaEdqqno73RolkzszE59NYapReoH6b7MvHwYasTYgImDaG5/bqwrDG0aw6YEBc78ge
         YRLiF5zWwsVHNoFaJG70z7aVAbhUWD02OqBpRf2wpFDBm0NvggaTy3o+Ju2HQxGJrTwW
         fzCG/IkMhiOQBsYwl7gVfJ75Ae+xPGxA2c0sLy/jRLqY0pAN3DCA2HM3DMc+E4jQzpvm
         l0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxCmYI5w6nxSiqH6mYIJV7nQi3+kDtIa5UINsO5Pmjw=;
        b=ezluqP7+EIuMd7lgDiAeIXuhR1QMjTvfaBXAJwWatPqe+A2URnUhxJJD3vD3sY3L0v
         L1vGOuUUFTmVkoaerGY4H2sWPuBMIUgNPyua8AoTUXOE6q6ehw7L54NOT10OzsJWn1yh
         zMJe02lRryTsFjYWu1dQnV7hrrHnRYIuX3jM0zyfYPZEA79fv841MDiPcw7nwPCMY48Q
         KHBWGiuLNP/aCyRgXpxwdiM0LGxttXS7b2RskxsMaHA2bsrUDg0JxF2jPwp+m42PBMC1
         0Iy85dQoXlZX1iF1TIM92Pnb3XHHbTPHCSGhGVDGcdVVeJ+0japAYx51ABE2v3Hpi02v
         nj6g==
X-Gm-Message-State: AFqh2krS6Qv3SA36+KS/lKcZjrdJidY8bSoVQren4OyFqk/sOCp0qw1Q
        3kPLSmGOOW+SClV9DtXjGZIM5g==
X-Google-Smtp-Source: AMrXdXtzC8ORw8pqBQvThcAQTLn4SruOsYGLbWvNTAJ/HjwV2v5SQsxMPYT2GZ3HsPLYQLBB+dU7tw==
X-Received: by 2002:a05:6512:259e:b0:4b5:5bc6:e3de with SMTP id bf30-20020a056512259e00b004b55bc6e3demr19630790lfb.65.1673241245630;
        Sun, 08 Jan 2023 21:14:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 21:14:05 -0800 (PST)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH 4/6] ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
Date:   Mon,  9 Jan 2023 07:14:00 +0200
Message-Id: <20230109051402.317577-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdss node to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 0cd59088f9c7..bb69247d7ebd 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1525,7 +1525,7 @@ mmcc: clock-controller@fd8c0000 {
 			reg = <0xfd8c0000 0x6000>;
 		};
 
-		mdss: mdss@fd900000 {
+		mdss: display-subsystem@fd900000 {
 			compatible = "qcom,mdss";
 			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
 			reg-names = "mdss_phys", "vbif_phys";
-- 
2.39.0

