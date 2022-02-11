Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A5D4B2F48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 22:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351283AbiBKVUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 16:20:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353589AbiBKVUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 16:20:30 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE64C68
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:27 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id w11so17271860wra.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o/d166yo9TtkM4+c7x0I89HNNMPO2K1Na/pBqagV1Y0=;
        b=MbgOlo5spfEC8hCE/EOFxOS2ueJMFq4HKxYCjwdtVmnelMXcnzpLW2NrAhaYmrgWey
         bJczkKEOn8ytNuZ8PsRDkR0QW/LDeD7e4N/u+qRHh00cW9uXtXplcVrMFfqguoLd5TlI
         lOFvwLGGLsFCWuqR4/aNUR/oh7rnHSDHfNDenAyQgKheud8B9j+u0daw3TG+hofMmLRo
         JY6DzswkszG8CV38N2KK4Y++aMNg35LKm+fUxySbFWVg8cZnYfxf8c5O2xNbdoQv7r9p
         TJOKbFXYaVcL5A+O7IjKQSV1+x40fJ1UB84H0Kj16osJRxSJiqOCkZX3B3ninGoya7R3
         R+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/d166yo9TtkM4+c7x0I89HNNMPO2K1Na/pBqagV1Y0=;
        b=bl9HTyHF3uB39AxVuabx+rG2QhwaUMlnT9mHWQ+CoKS5YZQVqHYltoFK1475JynfGd
         AIo5zH4o2EW6Vle8zNLZJJSIw2nT451oVPKYMFyKV45/AvEcX6V5IA0P3qrWB37sGY/R
         rwx4AyTXjvn00gh5peRg1BG9kNGwVCVWYQ1vhsRKxucU1x4aPeEtfcdSYgN8m6UouMU2
         zi78eIxSXBOhgYyMWYLwxtO2iA4/eL777ihWzim0+uyBNEHdC1FMstR05vIeZ8L9fO8F
         sZL+8tLDwie6vuYuJ5/MG09mWH1MM7xJ8RSoRcLrBlRboiETeg9LN1+NWGZ2gpC/+rD0
         YIfw==
X-Gm-Message-State: AOAM531BzVejlw6gAA7bvZlozxH2HvC6+ihW9qc0iqv+53ve/kTt8HH6
        X2gP8WNlsDkJree4oURy4lBWUg==
X-Google-Smtp-Source: ABdhPJziSJsedjC6g3EGZpOd6xSdkDK2oGv9uEK65oxUBGa3mTJzU2KatuQnr6TNOXXP4Ax51gl13A==
X-Received: by 2002:adf:e409:: with SMTP id g9mr2812714wrm.496.1644614424204;
        Fri, 11 Feb 2022 13:20:24 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id x5sm14276017wrv.63.2022.02.11.13.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 13:20:23 -0800 (PST)
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
Subject: [PATCH v4 7/8] arm64: dts: qcom: sdm845-db845c: enable rradc
Date:   Fri, 11 Feb 2022 21:19:58 +0000
Message-Id: <20220211211959.502514-8-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211211959.502514-1-caleb.connolly@linaro.org>
References: <20220211211959.502514-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the Round Robin ADC for the db845c.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faa..1c452b458121 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -595,6 +595,10 @@ resin {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
 	qi2s@22 {
-- 
2.35.1

