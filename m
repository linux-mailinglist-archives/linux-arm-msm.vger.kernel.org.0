Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D41690A74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 14:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjBINix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 08:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjBINiv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 08:38:51 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA0440C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 05:38:50 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id gr7so6424807ejb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 05:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teoBKH/xnumZutLhR1lTsGt6HiXAAYfHJxJM2LYx8fk=;
        b=G/uuvbOxNB1jOHxuIz+T35oO8H5+UMf98NvOjAmZ6vFzlgXXhaqyNlQZyV1Smi3nD7
         woTPs7dozQ/4iNsI5dT/a3zrLY/iFisvMeaxYuRF2Ni+SxfpdBzuCmZ5JUNHQcpfijRi
         vK5/bbPms/NUvTNyotHEHrQbbtUkjfrZ1d1nDlCg8kq7X2yUCrGBhhzsAXHFQl1aY4x7
         /Fc+VchqkCYIJ+5tbEuoMvNHKwkFYERkiTf3yFSGEROU2DaKslQw4Q/LNbUnGx9QY3Iv
         stL+PC0TtOwzlCsGTIJPLrgtg0KkqUul2x5Ok7IH2ElgzNFABW0xuZRQqgRy+zRysD/5
         m9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teoBKH/xnumZutLhR1lTsGt6HiXAAYfHJxJM2LYx8fk=;
        b=eZFCJtM+kZ+uf3La1Bay0lIJl+uKsr6cUjnN/F+lNFzUMNoEy4/hWwsC++5at4Z4cP
         gWflpxJEN1caGPJ2rxdRmwGoYFWgi8gHStSxwN9k8WlpkndLGbh/eLs/M77D5KmQZ2cF
         d9MyziAag9USiLaOrcmwIvbAsoslh7Uj4DWLRIXaIMH8y9L1aaKKWXyIBxE7I2bRjftr
         JU4pgPJBgPg1RTKGy37JJAiqfRIUfeCHiXHCyBJ7gv88gET7YgSBJ4A/QH1J3u2jmcpN
         X5xYde0rGh/5VWbCjszg0HlMqfS005zf8N/2rPmZksAO5FzBIa9+FTn++pZW1d0hAxQG
         y+Dw==
X-Gm-Message-State: AO0yUKUgZMTtczBClVUUxqYYJNQG6eQrhHvd3vAX+3YY/aipI/p75Ujs
        bGA+eamDH/0Y3tH/tspErus6mQ==
X-Google-Smtp-Source: AK7set+DHeRxdOeZF9XY/umYouZ9f/FTI2/QQ8wP/VEMl2Sh87/V1u0FZRWMTxgofkpHc3TJyGBUtw==
X-Received: by 2002:a17:906:149b:b0:88c:8c2e:af17 with SMTP id x27-20020a170906149b00b0088c8c2eaf17mr12516883ejc.2.1675949928898;
        Thu, 09 Feb 2023 05:38:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:38:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8350-hdk: enable GPU
Date:   Thu,  9 Feb 2023 15:38:39 +0200
Message-Id: <20230209133839.762631-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
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

Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
the GPU to function properly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 54654eb75c28..09baf6959c71 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -284,6 +284,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8350/a660_zap.mbn";
+	};
+};
+
 &i2c15 {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.39.1

