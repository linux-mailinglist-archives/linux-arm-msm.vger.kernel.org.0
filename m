Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2F17434C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 08:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbjF3GNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 02:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbjF3GNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 02:13:21 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A609358A
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:20 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b69f71a7easo24370331fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105598; x=1690697598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edP5PM6mjKVSJWtiU1VEZfC4hL5CzXucY0brXKKjw/M=;
        b=FThiX6KJQdjSdcL4qPR/7suGpJYL4jCq2gf4lqy1VTbENY4jPSvwxzCN7EGzBucGur
         d8OtW4r12iuM2b7WHnBq+OXIDs0W9aTxPJf/oq4tzTCRno+Xlja9dNooEQvGXiSuAJEv
         Q8ghvu1cvd0jL+dlYfbvGihHclH6qiwNQa76PO0ErzynDBSoh1SoV5Ux6JXleK5fSZb3
         wF1XMpV8DfbavEme7ju9cv67YyHH7INCTK1QjnkWROMI1pdufuEopzDDh5GuGn56dv3C
         kl4MzdR3+xdYNdgU3TT6xDxNeStN4z2Is224HQYfjput/0fVleBCdEP+LNe5IgChpIGs
         d37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105598; x=1690697598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edP5PM6mjKVSJWtiU1VEZfC4hL5CzXucY0brXKKjw/M=;
        b=FAGZkXZhM97yP3uIDWO99MHnCpXcNLFNhRab2HhzKDUJEDSjuKnvRpmXAZuApkEObZ
         u4dQ+zvE6RYgItfC2U/j4S1Cz2S8N1HuIxHoDdf3vz06U/0TXqvFok1ImWMaPYvN6gKl
         PahgiNJivfa4SSyTWYEyCVgqT3gBhN0y7QY3+z/wznDXtGqk2do2NCIqCExP9u3DVQgk
         0bm6QihADYh4Y2ztcakVLs//zzWMJXB2onff2ZCofi0Tk7YHOPjdo6QLuzQfCeIr7K13
         UqKfw9lNWhjBsR/HHwhNbZv0atGWVWEQJh/FrQhqtMJni2M/xmSQvQpaqDlUp3wYysBU
         9lAw==
X-Gm-Message-State: ABy/qLYTwBl1luq50yPrvnr/wKy/BkNDtJwYU6bHPh75U9NG2onh4nhG
        +yxSDBMR2IxMgUeSodcKGcJkWA==
X-Google-Smtp-Source: APBJJlGJDsLiL7jxqx42MQOU1tPm3eGCzkQ9PqcEeQq8DM02k/SCHCGknCR3xIeXDFsE644iBOD2vQ==
X-Received: by 2002:a2e:9b97:0:b0:2b6:a19e:5168 with SMTP id z23-20020a2e9b97000000b002b6a19e5168mr1287613lji.39.1688105598503;
        Thu, 29 Jun 2023 23:13:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb0d6000000b002b6caeb4b41sm505582ljl.27.2023.06.29.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:13:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/7] arm64: dts: qcom: pm8350b: fix thermal zone name
Date:   Fri, 30 Jun 2023 09:13:10 +0300
Message-Id: <20230630061315.4027453-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
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
2.39.2

