Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA25060029A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 20:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiJPSEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 14:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiJPSEM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 14:04:12 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E3831FB8
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 11:04:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id a10so15091472wrm.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf2LXEpI/FgNIulJdzuAoex7dYJdbf0Ac1cuVaPGe7E=;
        b=fTwq7IUqseJ2liU1PvqopOjqDzkpAwRCh27zUyBt2faGsCtfLDD/1GaglTSm8DqoxN
         0becC0MaZAhMntfgnJN5/ktHRtjahCD/qHofYPlz/9o8CxMSGhZ/b0zkTjbJPYAnIPL9
         HHkXcz7/Fz1RmLTRJbymNxYGUt9/FKAuBnyvaX0mO7Del389guYnkwXbNIgC71P71J/4
         mWQHsm2ZNFyT+Jypu85wwP11Q32wx9MLvDDnvj37K9SQCwlkHKHxSbg/7aA0Xx0YoZv1
         Q+dpzryTAh+2M/7vMEuXxXlZGZtXgLA1XeooGTqrg6+cjND8S54pv4gDLYlvhkhehHGT
         yt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rf2LXEpI/FgNIulJdzuAoex7dYJdbf0Ac1cuVaPGe7E=;
        b=dKSD5jZG4wXaw11p/gIZt+mUprT7OGa4YdSm7w4bcRyiPXRKGISEWXppZMEBBqsb+i
         ZhAS3+3dPvVF6tfpd7FmfDL18dygRQE0Pz447FhAVzd5iAfUM383BgcbdoAteSU+R1XL
         y/4/qDxsIp2uuyedkNVrY++ZljIAtIPsGEpRj2AEInDq4REoQaUtqPJTv4FwR+sHDW2t
         E3ZhW9CzR+HlRAC6bc4xFmYFlhTs3w00GrXiU+b4ymlIqPh5HYymJ/1lIggYdsVQ0qxm
         GtjmY3MPCxl4Nl3rAXivWA/ihnTsXd5MYup9N/72lAABOtZ6R+byrEi3f8fSwgPtGw+W
         1GRw==
X-Gm-Message-State: ACrzQf1xTme3QdGyEy6ooAn+YQOxAyYK92v2/ReBwM1SCBNArP7/ojKf
        yEZEPC/8utLWdNqP2wnNqoP99A==
X-Google-Smtp-Source: AMsMyM6mHK+vi3TJatYbuGPCFEUY7H2xPwtu5DabQBtS4tiVu8bUQPZXLez/7Xssl7jttdQWFbdvFQ==
X-Received: by 2002:a05:6000:18a2:b0:22e:72fd:c5d0 with SMTP id b2-20020a05600018a200b0022e72fdc5d0mr4038549wri.682.1665943447731;
        Sun, 16 Oct 2022 11:04:07 -0700 (PDT)
Received: from localhost.localdomain (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6d45000000b0022e57e66824sm7844181wri.99.2022.10.16.11.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 11:04:07 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/5] arm64: dts: qcom: pmi8998: add rradc node
Date:   Sun, 16 Oct 2022 19:03:25 +0100
Message-Id: <20221016180330.1912214-2-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016180330.1912214-1-caleb.connolly@linaro.org>
References: <20221016180330.1912214-1-caleb.connolly@linaro.org>
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

Add a DT node for the Round Robin ADC found in the PMI8998 PMIC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 6d3d212560c1..5a479259c041 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -18,6 +18,14 @@ pmi8998_gpio: gpios@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmi8998_rradc: adc@4500 {
+			compatible = "qcom,pmi8998-rradc";
+			reg = <0x4500>;
+			#io-channel-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 
 	pmi8998_lsid1: pmic@3 {
-- 
2.38.0

