Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68ED274B0E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 14:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbjGGMan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 08:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbjGGMal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 08:30:41 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C8B2128
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 05:30:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so14155411fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688733031; x=1691325031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89AdRZgQvPlVelxOzYk73hwb0yohQu0q875LmPhcpjU=;
        b=g9fUlbmUbO51cBm23uFw+HH6Qus0lvYED9r0yPf26KNI17omm0G0fkq4+CFxbanuul
         nMFhrJEmgbKuIRplh5ZGyKKhBV+TRWsr0xu0F4LiTjuHgU15fE8YiZHxaQiXduXy7yWC
         /wzY72rzuIXePBS6fqe1l0uW5QEhFKMlI3PLJdguT2gMrIkwLxRagx/+U+FBKE6VxyYG
         NMhIHrGCgtGPk66ScSkpxRTHrKicdfO27GP6BU0y/QFM556z2Cr6EfWJii31IoSda4SZ
         Cl5ZB0Ga3ZVRTkQotB9pYBYDBLNPsibXgxA+yilvMktj+FFU7ISFIrH4hUhoVWScPq1C
         vMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688733031; x=1691325031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89AdRZgQvPlVelxOzYk73hwb0yohQu0q875LmPhcpjU=;
        b=UUGluIqPnJFdcduXr8E4KqoqmoVjiVJ9WDH79ZVW/qhBNr5PmVdYRXnJK6F3KJIOGy
         EkT+QuY7MQ9TbNDAY9xdJjT/HiiGUhwh62er3NYsC1IwscJzM8n8Fe/troiDFiPUa36A
         RVXKF56gYGw9HKqeWYbZhag9QUr3+46b8eYoxgr4rHpPfIPkfcnq84GH/e3+oOGV0Ocn
         1bowkCWhsbgJpeTwZslD/9Uua9daQkba44eH22CNUzvamy3OtAHOdGIUxzXkP3BrJ123
         7IW51CRCV6otA6JqcfgWvHttaZ5U+oc6aMCSZcYv3w3WEfIV6NvVTRYRStFeRSUVujRc
         a0+Q==
X-Gm-Message-State: ABy/qLara0N6WbGQrNoeXtAKgrCBluzPMu4v4wqRJgtfkv6l9Tyl+GhI
        +2jyudIwrwTa+rdqtx66cpppmQ==
X-Google-Smtp-Source: APBJJlGUIaCJCI/A8RmmPjtvVo69gFy6EG+FW88sQ/Zz0XRyctXpv0lNteSBISEYwpo8tIQw51RDWg==
X-Received: by 2002:a2e:300a:0:b0:2b6:e361:4b3c with SMTP id w10-20020a2e300a000000b002b6e3614b3cmr3313758ljw.14.1688733031462;
        Fri, 07 Jul 2023 05:30:31 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm756803lji.34.2023.07.07.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 05:30:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 4/8] arm64: dts: qcom: pmr735b: fix thermal zone name
Date:   Fri,  7 Jul 2023 15:30:23 +0300
Message-Id: <20230707123027.1510723-5-dmitry.baryshkov@linaro.org>
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

The name of the thermal zone in pmr735b.dtsi (pmr735a-thermal) conflicts
with the thermal zone in pmr735a.dtsi. Rename the thermal zone according
to the chip name.

Fixes: 6f3426b3dea4 ("arm64: dts: qcom: pmr735b: add temp sensor and thermal zone config")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmr735b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmr735b.dtsi b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
index ec24c4478005..f7473e247322 100644
--- a/arch/arm64/boot/dts/qcom/pmr735b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
@@ -8,7 +8,7 @@
 
 / {
 	thermal-zones {
-		pmr735a_thermal: pmr735a-thermal {
+		pmr735b_thermal: pmr735b-thermal {
 			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&pmr735b_temp_alarm>;
-- 
2.40.1

