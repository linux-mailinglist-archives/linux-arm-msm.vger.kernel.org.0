Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5B14D3B94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 22:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238312AbiCIVBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 16:01:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238300AbiCIVBg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 16:01:36 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946B150453
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 13:00:36 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id d10so7758009eje.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 13:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zozG4Oy5Pt0vWjsRDZ91928+qvWs4STBKU9M4pGg1h4=;
        b=hiaFscqfNthX5u8u5hIP2J6nGbojCaeIDru25jt2Jos0I26L1g1B9OXWMTb2HwD/AT
         qrwv4w8jz58HpATMm+50WRlKf7gGyRogIho7CYM+odqwxdUpYRCeOK5MEBNADz5OBO0t
         mE5kTXqs1I5MWRsK815CvlSVqLyZzNxnv3Y0gRusO1lyhMWuIPhhhIj1EzAipKLCOZ7u
         3fljIXOihAUESa2nKXcauzX1T9SNNd5YOw9WsScX5CQMe3c5oIgrxPmhd9QZHjx/3A8X
         GQXCQSOIbthfgYELN3pgnhx5WPS+WjXx3AIbEalU2ELkpRCOHYAfGfG0tTz1xJAAX9qZ
         74GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zozG4Oy5Pt0vWjsRDZ91928+qvWs4STBKU9M4pGg1h4=;
        b=6MIc6IaoTqvzZedJyHXAPj7uIK5a/oioTOMF2y4GYN6Se8O0bMja3K8p9qmwK50t7m
         x+1lk0Ge1aXZASEl0Yob+UO43PC9NlglOp47F2YFSVfKIwfkY9HrBMek+XQu+YuX/K10
         4vlX8C1H0f/mvUHFXfl1yqNsSE2vH48RtUDuSQRK5Wk/kl46Cq5fQ9QdTCnOAsL9ElkB
         /FYPIZdwdakVc0RMeKL4M+M03PYgMnBL55wP7rOLqLtUKdOQt/pdThXcjci6B7BJtU4h
         MK7PqrqOzSXBgQGzhbzXNNnDzS+Z0koDzGHBH8K1hvEvl0r50QWhozNDPJJEEnUFdrTb
         jb5g==
X-Gm-Message-State: AOAM530mobsEq5ZInqCaDZl4D3a6keZxyCi3DSYHmHnidXteFDy4B7X4
        vni/Yrg5UU0BlnFLNAYHf7W01g==
X-Google-Smtp-Source: ABdhPJyYvcg4GbQsjDdgi3vP0gS33LBUjVeZzJW5ufYkEkS/C5awFHN9ageJk+p8FCPIApMr3MzySw==
X-Received: by 2002:a17:906:a210:b0:6d5:9fa:11ce with SMTP id r16-20020a170906a21000b006d509fa11cemr1617726ejy.172.1646859635190;
        Wed, 09 Mar 2022 13:00:35 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id l26-20020a1709061c5a00b006da815e14e2sm1114743ejg.37.2022.03.09.13.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 13:00:34 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v11 6/9] arm64: dts: qcom: pmi8998: add rradc node
Date:   Wed,  9 Mar 2022 21:00:11 +0000
Message-Id: <20220309210014.352267-7-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220309210014.352267-1-caleb.connolly@linaro.org>
References: <20220309210014.352267-1-caleb.connolly@linaro.org>
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

Add a DT node for the Round Robin ADC found in the PMI8998 PMIC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 0fef5f113f05..da10668c361d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -18,6 +18,14 @@ pmi8998_gpio: gpios@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmi8998_rradc: rradc@4500 {
+			compatible = "qcom,pmi8998-rradc";
+			reg = <0x4500>;
+			#io-channel-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 
 	pmi8998_lsid1: pmic@3 {
-- 
2.35.1

