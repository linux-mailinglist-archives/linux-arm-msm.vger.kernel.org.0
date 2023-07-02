Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2238A744F4B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjGBRux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjGBRux (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:50:53 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F011E70
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:50:51 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso58267001fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688320249; x=1690912249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFmtaGVmc56D+wc8wdPUx9Q4WKtn19zlog25nBfTvDs=;
        b=BrJk5JnN/lUJAyVEDJrBD1jipizyEaZIh6sfWDVPFlbywTYlvPvNQcJXWQ6xQeI5mC
         xawMycLPwo+8LUSNGuHcos+ikYxRYmvIVwUiIl7rLbVn4pE4rqiw8lBJaLJdx8Nu05XV
         sjRZNpmjsE/zBlKurLUzue4CjCaB2T1degN5HGhJXTs32UPG/9ylI+LYRNoLhVOaSL0b
         zFLhZDNwTVf6Qxzib7Ab8Hg26jZwer/NJVLGpd3eYmi4qAg6SWXHjNOOH3AO5G+M7pjH
         b0F0/oFYv070XLwz8esfl1CyCatkPtyMRjTdHRp09q/Q46e+QQmrTFsysu2cgjaRqOLq
         FHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688320249; x=1690912249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFmtaGVmc56D+wc8wdPUx9Q4WKtn19zlog25nBfTvDs=;
        b=Eljh5fQdKuddA8oZ7EbeLP77S5PDRAVJKGpnUVNWWtx6XHMzm4rOVRwkkXr3FAJCZv
         iqMVYlj1ZU73TCpPyc/ebuSqXEGfVPCKUoBlQvrFtfPXsq5FbvfOtWCEetsJDvWUz9se
         NT0Rqfwgb1KH5fey0mtkLH16E6kE9MXQu3HNQe2QcG7PZdEkJ5wa9FB2vNS2kRTDhjnK
         SvcnTIKqTxB4MeqZHK3hhVCgX3wi+Zur74BjQZctC1GxIeagVuUO7ldGP5YHEyeX3S6T
         S/RRRlIi4x3QnGCgxqFc6H/WMGMUyLgGUu3WPDmiOISdLlf9Gaaj9leSuD0mu5iXfY5A
         SbKQ==
X-Gm-Message-State: ABy/qLY4KXdcAvkEz+LDJCdGT40CJA9uR5ZQCpnq0eU5/WtGms5T8BjY
        xFls6e8i4X04f6CpTqckX3B28g==
X-Google-Smtp-Source: APBJJlHO/bpiQa6ClXjNS+0e+7fRkveZmImiKYRv5uYTS1onzrNIEI+SoGfAebz3i4eWtTPOa5762w==
X-Received: by 2002:a05:6512:3a8e:b0:4fb:987b:ec3c with SMTP id q14-20020a0565123a8e00b004fb987bec3cmr6388236lfu.56.1688320249647;
        Sun, 02 Jul 2023 10:50:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac24c81000000b004fb759964a9sm3354130lfl.168.2023.07.02.10.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:50:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH 4/8] ARM: dts: qcom: msm8960-cdp: constraint cpufreq regulators
Date:   Sun,  2 Jul 2023 20:50:41 +0300
Message-Id: <20230702175045.122041-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add additional constraints to the CPUfreq-related regulators, it is
better be safe than sorry there.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 414881d34c60..cba0d1e460a1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -131,7 +131,7 @@ pm8921_s2: s2 {
 		};
 
 		pm8921_s3: s3 {
-			regulator-min-microvolt = <500000>;
+			regulator-min-microvolt = <950000>;
 			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
 			bias-pull-down;
@@ -287,7 +287,7 @@ pm8921_l23: l23 {
 		};
 
 		pm8921_l24: l24 {
-			regulator-min-microvolt = <750000>;
+			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1150000>;
 			bias-pull-down;
 		};
-- 
2.39.2

