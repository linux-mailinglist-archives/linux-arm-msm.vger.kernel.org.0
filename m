Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD01546F285
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 18:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242097AbhLIR5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 12:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242021AbhLIR5W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 12:57:22 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D4CC0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 09:53:48 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d24so11183958wra.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 09:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3EeMUG1qvuM/qX7FAy1NtSSg8Cr0Oe9i2F6xtVsTAsk=;
        b=NwauIgLhbK6cxKweAx81wNMIr2TyLR6KduThbMS7ZM6lRsa5n8E7hlEBeogyRZoBpI
         qt08lcWktby/rNs0K9BhnFKNRc4eH6xOycdU8QfUoOPVRF6JuevBk3H5b1xBmgiW3wM7
         TSF/9cznTfuGikWkbkzxVPlA3t5ZhKnXYB239odNgApUA2xbrOXNDfVAwWsDofrx6H85
         ZPVlx/rEiuf+ccqGhgcayQgKxVEw2LQ20OC+xQoqYBtNVUceCjsqg4m0BrkwGmSytJFO
         MpD81IRMS5FgNCk1qwwy/F1cGpHmgfGHWWFAvbjLmzN7mYQPqkdGXkY2Ny2vN8BxvXl0
         g2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3EeMUG1qvuM/qX7FAy1NtSSg8Cr0Oe9i2F6xtVsTAsk=;
        b=v4rPlvegKW/da5RUbOo4ykybcGBfhdy7qj6tUV34mQzMiuPaiO5rzHxqRF0HySY25U
         iQi1JIXISWhmKYl4k6BiQvz0rUtnnyURbZZZ7ctedx+KyPGJi83OqZJNeQt3nGSdfHbD
         piil1SgldL3eKh3SlayrVadGCHPvuouUQ4mR0KiuRM2vp99OWyU+hTD9xgj6U7w+/2/U
         dulNjwl+qR6WqOMEvaUalgL06iH/7muK1/+P9W26AKCHiG7p4cV3zo2nNj2Vgb6BbliH
         QveslRQZ32prjSkp6fVbMuheSGbvXE83NGYOBQq9Mj9D6LmtMvdkZM5xGTe+w32U2fbV
         iAGA==
X-Gm-Message-State: AOAM531Cb+4SST8Lko6wqkBjdN29G3xRT2FFwfq8Y6cKEROgNnIcH6jf
        d4GjWK4VGERGCjzYRZb4i/4zl0GmfKWZfg==
X-Google-Smtp-Source: ABdhPJxdCUCgj3MOtm05/Du3xejIgP7JuYpbhLpHNE2pNdC9MuloUHl7Nc2IN7djm8O/xB3rBNvpew==
X-Received: by 2002:adf:a319:: with SMTP id c25mr8155672wrb.629.1639072426823;
        Thu, 09 Dec 2021 09:53:46 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id 21sm427004wmj.18.2021.12.09.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:53:46 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: c630: add headset jack and button detection support
Date:   Thu,  9 Dec 2021 17:53:42 +0000
Message-Id: <20211209175342.20386-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
References: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MBHC support available in WCD934X codec.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 2e882a977e2c..58845a14805f 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -771,6 +771,9 @@
 	vdd-tx-supply = <&vreg_s4a_1p8>;
 	vdd-rx-supply = <&vreg_s4a_1p8>;
 	vdd-io-supply = <&vreg_s4a_1p8>;
+	qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+	qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+	qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
 
 	swm: swm@c85 {
 		left_spkr: wsa8810-left{
-- 
2.21.0

