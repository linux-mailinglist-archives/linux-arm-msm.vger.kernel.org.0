Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4F774B0E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 14:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbjGGMam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 08:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjGGMal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 08:30:41 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D760213C
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 05:30:32 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso28774911fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688733031; x=1691325031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iOhcYpnzo0XIV0YBU7Aq8iXtwYGavR9eFvXZloUIQ8=;
        b=wGceMGK7XXBwAwlUtHh99qpcolXpleueiazdnHEdysvWB0uA98ZxytfmjJESZXrbuw
         5h6WRAc92f/nIMUuLzjy9oQp5vlQK1JOKCPcT221fnICI6jVM4hwXDwFEhtO7E4m04yP
         4vLZ/uqcnTtYYYcd3s3rjBeRmIPnQWVpT6LeE/WqY9fJeZ4csnr3zAGV8WjKQfjEqDMn
         2e1JOybYDfs/NwfGoP6wfmmOgtiZrRzHkEtAkEL1SsuxS5ySQUz0tFw+Wy/HNBIAf4Qa
         erGllcSCxRIZoSoFAIDBH3N9uB/RVIck771EKrCrxavdDoBnnPbYtyw2CDy9aoEIqKLB
         UKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688733031; x=1691325031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iOhcYpnzo0XIV0YBU7Aq8iXtwYGavR9eFvXZloUIQ8=;
        b=eopQU267Bszyk+/0MtBf6wXyfAtuDFBr9H6u92dB4+wVvsB/r5Q6rJCsPNw3kq9uCS
         5CBFYj8u7rTMF2JfoIk83LddJQ7YHkX9Pxakk2bC9D/RO13slUBxs836Ylhqu+65Ou3m
         O3QmWXGH/XvlxBrZmKiEioSdJ2XREsCmcF9Onwe01/o1tMoi2ynoXxf+jzvFFEu/Dya9
         sOOxxYxKGoQTJdfcHa2JOKN5bJ4sOt00R3cOGmMnv+GDs5n4kZ55PklLKNiShmtYOsx3
         K8b+ylZT+4DXSTV2Nmetiidn53/CxT8oZtiUpBQ/g6RLhuOE0mWm7jVl59a/cTVe6si2
         Lmmw==
X-Gm-Message-State: ABy/qLbacGLkW+Bga2K4sU7qlfWQ97DsGedsVO2sz3DYxgpFow1ghBeW
        niq1z7tU3BYAjwyuUtYxpajLG2E6mxYYRA/ZlFo=
X-Google-Smtp-Source: APBJJlFfJhjGwXsY+2oKhsXoUHiy189s6DkLIg75Za/l/C8VYS/r3oD5tr71GYraH1xRa97GjDARLw==
X-Received: by 2002:a2e:8447:0:b0:2b5:80c9:9806 with SMTP id u7-20020a2e8447000000b002b580c99806mr3430469ljh.6.1688733030723;
        Fri, 07 Jul 2023 05:30:30 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm756803lji.34.2023.07.07.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 05:30:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 3/8] arm64: dts: qcom: pm8350b: fix thermal zone name
Date:   Fri,  7 Jul 2023 15:30:22 +0300
Message-Id: <20230707123027.1510723-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230707123027.1510723-1-dmitry.baryshkov@linaro.org>
References: <20230707123027.1510723-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The name of the thermal zone in pm8350b.dtsi (pm8350c-thermal) conflicts
with the thermal zone in pm8350c.dtsi. Rename the thermal zone according
to the chip name.

Fixes: 5c1399299d9d ("arm64: dts: qcom: pm8350b: add temp sensor and thermal zone config")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350b.dtsi b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
index f1c7bd9d079c..05c105898892 100644
--- a/arch/arm64/boot/dts/qcom/pm8350b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
@@ -8,7 +8,7 @@
 
 / {
 	thermal-zones {
-		pm8350b_thermal: pm8350c-thermal {
+		pm8350b_thermal: pm8350b-thermal {
 			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&pm8350b_temp_alarm>;
-- 
2.40.1

