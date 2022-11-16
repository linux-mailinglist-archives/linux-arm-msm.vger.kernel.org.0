Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D360662BA48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238598AbiKPKyy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbiKPKya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:54:30 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40456218F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:43:16 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id v1so29185300wrt.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjfAlgkUXxYtzoLU7VIB+TYqOioSKKQPDA1pUqCpVu0=;
        b=cU1vl1wb9/+TR+df56vzBSep6BtCgw/w1ou/y4xJ01/kIfP781OY1I1bx2P3rCOEPT
         KRP5pITCwoBCJUnyMlUKvSiM0D4tk5qzZzm+Kwb29saYC58u7vCPsNYcqyyGhKLl4zkb
         ecJj0gF9PHuETu3hBnE/odbCda01pwpkCa2OcRD4TBbTwL4M4K5a316eY6NqAuc7Qx69
         gIS5gDNd4M/BDthkDa7y6oxG2Aqi6dDhrqWfih4kmiwMs7JySUpb47mmPmBU632jmZFi
         srcpsV+qm5P+fWDDXVOS1wPHcNvXVqkLbSPsWIvSljncS9BUOaNKfAO5r0vHVLFhmDFx
         fgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjfAlgkUXxYtzoLU7VIB+TYqOioSKKQPDA1pUqCpVu0=;
        b=qx6nHxG+RFEXf3h2uYKu2xutwJTDwf/LtKL3ppF2MlbjtbxTJz/hJhYWtfyp1ZGZcD
         kTUOP64KE/Ro4RygHYU9strD+gjP3pJyOSPUZvjekwM875Sme2QDWzm5S1ryL7lklXv+
         SGJOlVDBiNqsNJ6Edl0RwSeAZzRPso9cKsQsr6PXQZ9K5RsWxRAAHJWAVgOp+Nx3uAQ7
         a4Ou1ixunXtHyV/rzt61oVJDZPEMDzMUiKSYUWH1m+ve99K/487Gd5xweTaEWulmon07
         GVyBQePiLvOP7Dva8zMgyxIvjJdjYcSL7qNmF6xmkB7Vs3fqr4SAy9cr64MtuTYgS9h/
         OKjA==
X-Gm-Message-State: ANoB5pnUUakwKlFDD2blDlnx/emPMmxp5nj9m/0uWnZq0LZwLYmnxUps
        IuCdB7ciCn49qRX0QIdhqjjbQsVj6SMRZg==
X-Google-Smtp-Source: AA0mqf7CV+Kqd4WkRCfWQMJorXUGaiEDIGHXzxMqiN1OWEBRsS2gYX0FVGNL8cOqVh1s/xZtDg3+Qg==
X-Received: by 2002:adf:e444:0:b0:236:489b:8c81 with SMTP id t4-20020adfe444000000b00236489b8c81mr13518978wrm.649.1668595394849;
        Wed, 16 Nov 2022 02:43:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t8-20020adff048000000b002238ea5750csm18010846wro.72.2022.11.16.02.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:43:14 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:43:12 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm8550-mtp: enable adsp, cdsp & mdss
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221115-topic-sm8550-upstream-dts-remoteproc-v1-3-379eec11d841@linaro.org>
References: <20221115-topic-sm8550-upstream-dts-remoteproc-v1-0-379eec11d841@linaro.org>
In-Reply-To: <20221115-topic-sm8550-upstream-dts-remoteproc-v1-0-379eec11d841@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the aDSP, cDSP and MPSS firmware and "Devicetree" firmware paths
for the SM8550 MTP platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index d4c8d5b2497e..be06e25409c3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -376,6 +376,24 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8550/adsp.mbn";
+	qcom,dtb-firmware-name = "qcom/sm8550/adsp_dtb.mbn";
+};
+
+&remoteproc_cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8550/cdsp.mbn";
+	qcom,dtb-firmware-name = "qcom/sm8550/cdsp_dtb.mbn";
+};
+
+&remoteproc_mpss {
+	status = "okay";
+	firmware-name = "qcom/sm8550/modem.mbn";
+	qcom,dtb-firmware-name = "qcom/sm8550/modem_dtb.mbn";
+};
+
 &sdhc_2 {
 	status = "okay";
 

-- 
b4 0.10.1
