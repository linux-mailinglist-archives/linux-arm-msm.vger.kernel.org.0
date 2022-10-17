Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39474600B52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 11:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbiJQJpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 05:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbiJQJpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 05:45:39 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8BA356D9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:45:33 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a10so17538279wrm.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vd4kM4iLHeRkVbVm5qnb83YtTvz+Uiv2cMXrmKRaEkw=;
        b=kq8m38agAKTiOrrAv1A60RdKemWbGMVzSbD9sYp/CXLOi70iQfAByYso8Y93pbJm7D
         aVsMg77CWjxvy4wstlOKxTebbNkO7k3URP6smwIqKLZjZs/5dlfTog2L0x7WHkKccaa4
         LZqhemJQjiwlLZVN0EZcdH3oFjvQifiPiagarZIICt+SII5+EkUX5m/VodrqJiuX4HKM
         23ZwLS/h/lHUG87vg1ZcbeJ32XH+QXiFyEL7cA0hdDEUC98cKlw8K8ncdneGk+o8MnNN
         m2+BT+T8n/1qJmndmOrhSFSh4Fcl+oE9UvVFPiuRtO8TrijG3f9Mmx4dI79Mi1mkeUDC
         A8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vd4kM4iLHeRkVbVm5qnb83YtTvz+Uiv2cMXrmKRaEkw=;
        b=xZ/dGchB5JZCsQwrHHXWBmjTKO06NmBSC6xv2xaeD6XYg7VEEndLUtW4q5c0Jf8VYu
         hIPwIll9sKcdUY2n24cH9AW7IU1g2kVSHFWa8LgTrLlmXxkDmiKG/ErlC4sHpF7QJDyq
         hcbKc/O9wVAQv5Va9XUBmHmznK/xyA9x+2zJVInuwtKkzfOZuJoxbHZDbcLK45xaN4e0
         f+50F/+fOOeV3BOGJ+HXctt1MCN/ZyvXbXmeaMNxtEMPkDcTdL9i3HiKY3+XHdyXRUCL
         EpmOX75WCBkpKmtrapI8l72BxitXiW5HxC/HQTdQoAh5f2VSJKZj+cDh/1jEXT8Jj+ar
         /sxw==
X-Gm-Message-State: ACrzQf2s1841BzMbgNRLiqL1kTVw6JwFMdLsdFllu1n5wqy/EcbnLzUD
        zK5USAjYnD8UrJz71KU+LGDmpA==
X-Google-Smtp-Source: AMsMyM5jNoKCMLFTD8/GLtB3kPYanqJ9kzR7MEeIWKrAd/6FK2XLpL++4rmHJTIAW3izaEotDrePrg==
X-Received: by 2002:a05:6000:1a88:b0:231:bc2a:4f1b with SMTP id f8-20020a0560001a8800b00231bc2a4f1bmr5866194wry.291.1665999932005;
        Mon, 17 Oct 2022 02:45:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d12-20020adfa40c000000b0022ca921dc67sm7824305wra.88.2022.10.17.02.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 02:45:31 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 17 Oct 2022 11:45:28 +0200
Subject: [PATCH v3 03/11] arm: dts: qcom: mdm9615: add missing reg in cpu@0 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v3-3-531da552c354@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-rtc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes cpu@0: 'reg' is a required property from dtbs check.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index de36e4545e75..eaa3236f62db 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -27,6 +27,7 @@ cpus {
 
 		cpu0: cpu@0 {
 			compatible = "arm,cortex-a5";
+			reg = <0>;
 			device_type = "cpu";
 			next-level-cache = <&L2>;
 		};

-- 
b4 0.10.1
