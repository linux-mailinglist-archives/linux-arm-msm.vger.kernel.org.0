Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4BD4B2F3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 22:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbiBKVU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 16:20:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353582AbiBKVU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 16:20:27 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5B1C65
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:24 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id h6so17235574wrb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qImSYxU2i/y/qV71r8EFW+LTWk9ZfhM4KeM2jcTcklQ=;
        b=QxSLu+fdnas6QlKDy7hc1wCxmmCDCQi+UF54FoGDjT0/row5+zFN9h7vVwxtrRwgEb
         RsfLpn8W7cF5CJun/sXq2tSchnoPLFfOzWSuMXAyP2m1fhf4AA0iFuyA5CUaYNGYHi9f
         AKK5+Y3lFoZ/VCNbsyoLptA60yuRKPckAipE9+dzW+alA7ceSttMPnuzIXP5O4VHIDlT
         UMA7a2c8IBIJgyCU4wjbOT7k+qT0yluM35SUIWi4FoVFXUZMfiqboAzISXONTrr6XUbX
         qlmd3DL7VH8mFxttR5mgcKBo1dE8RYc8Nb2OWmowPk4wulvWt6VsirLWQgmH0uP5psUi
         A0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qImSYxU2i/y/qV71r8EFW+LTWk9ZfhM4KeM2jcTcklQ=;
        b=75Bbkblb1R2SA0TzPbi/ZWWoopIbThSK/blpasF9qPgRX2+VJYH0+50h28rkYxCGVD
         CN38xVvqMbowIxmbfChAUWgb33QVRrl0Q1NTtJypOelaG/bfHD2+ITrX0mKgXCJunzoL
         SYXIlpdb9QzU6ujcsFSclCkcnx7Y7GWdie7TGGz/rSrGgPHpPgfvpn3R17djaBYZLA+T
         skWYZBu7h2d4csUuW1l4YGXvI91Hap4f3ub37iwrANAN4UWMJ9VU+2wxwxSrKM+aygNi
         rrTKo1ANp06apN5fcuE5GjJGfkCF4znqbj4olEZjqnFL6hZHgBx9TBI1kBRIkkUsb8DO
         3i2g==
X-Gm-Message-State: AOAM531Ot3CGTu8qQToqjVmVqpLZphR7MTNrIDKZHt8+0WHPNNoG74Gx
        IbMM2XyF8A1pS0x6NHrl7XSxCA==
X-Google-Smtp-Source: ABdhPJwEMh8WUnv/93PC2BLzWSybKIbelfP/NotI4vBM1XGxq9G+upA/cpNaC5b5dt47h+SnBImeBw==
X-Received: by 2002:adf:e350:: with SMTP id n16mr2623926wrj.180.1644614423232;
        Fri, 11 Feb 2022 13:20:23 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id x5sm14276017wrv.63.2022.02.11.13.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 13:20:22 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v4 6/8] arm64: dts: qcom: sdm845-oneplus: enable rradc
Date:   Fri, 11 Feb 2022 21:19:57 +0000
Message-Id: <20220211211959.502514-7-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211211959.502514-1-caleb.connolly@linaro.org>
References: <20220211211959.502514-1-caleb.connolly@linaro.org>
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

Enable the RRADC for the OnePlus 6.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 7f42e5315ecb..e8287cf02511 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -450,6 +450,10 @@ pinconf {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.35.1

