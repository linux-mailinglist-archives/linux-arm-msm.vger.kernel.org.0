Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA355672328
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjARQ1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjARQ1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:27:24 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABE95898C
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 08:25:18 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g10so25103040wmo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2LqQldgrNJPcDI7p5vuw4ycWgmlXdq2eC/RcsIX/VU=;
        b=SffSry5qO7cTumzlgWrGzzUXzaiocJTBbYvKSI+eeNH3+GpuwOSB2hrq4JdaNXXxqT
         3OICczJREC9GO7IqR7z+kLqzAKM3lpF70ow6XKoz+UcEa8GDUv2/ncxF1DXTrLIUJVku
         NX0lQ7vc0XbSafsVoIyNnh5CzBa+Hjv4g09A+OSSOf86h8d4tsB5ez+C7/TiDDtdOI5S
         whLRkKEkCJzArHhw9HCVP1MXE09LbomfYL74nrsfhiIihsDPWn+uSEYY+Z+t91Hi//30
         ITMRku3LiO9Fmve+Azp3sB+IM84XCCjOPAlJXiNSXpJaWAVjAqjPOL4qAbr0CbmiHxnq
         zXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2LqQldgrNJPcDI7p5vuw4ycWgmlXdq2eC/RcsIX/VU=;
        b=6SjfBPjEOToRnamosFLze0X260x4eF+Kh5TroFEZRau7LgaXOKJYbVeZIMjOXgwdP2
         3BngPjj4M8A/2rHXfPqrRbEkogNF/jWhn4b3+hiatxCrtarCjwzXjsC4t+p85PNyDPUf
         9mYCfJjUxMC4KzLiwYqfNU8Bi7NgqWxy1seG7n1c7jH7A6HPWf2KRJmrvqR23OLwxqr2
         S+bWg9jwTcHWotaow3+Qd1H/+lRR6d5Vw/UmelDL8l8hO7FmRbIRdHcRTfMlmQkAP976
         xIRwsyfXDgPVjqEvGLVbYkYVs119zmbrV8Eu48g5+YfbzXtKGDyfaJB/yP95TYk+D7rJ
         cqKQ==
X-Gm-Message-State: AFqh2kpMRr8KmpYB4t3t29lxpj6Wz8nR6wOPOURL4xqNJCw543sGuh6z
        HAb5Ic7+XT52JfLtFJNRDErl2QS/tDqeSddELw4=
X-Google-Smtp-Source: AMrXdXugeQjWoOIfTOVUYB+z1tOrg0w7jGItCArPzaWowUAWzbkTZ5kh1xspWwE07Slny96CI9NWNg==
X-Received: by 2002:a05:600c:281:b0:3da:1132:4b63 with SMTP id 1-20020a05600c028100b003da11324b63mr7293199wmk.5.1674059117316;
        Wed, 18 Jan 2023 08:25:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003db012d49b7sm3670695wms.2.2023.01.18.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:25:17 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 18 Jan 2023 17:25:13 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8550-mtp: enable adsp, cdsp & mdss
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221115-topic-sm8550-upstream-dts-remoteproc-v3-3-815a1753de34@linaro.org>
References: <20221115-topic-sm8550-upstream-dts-remoteproc-v3-0-815a1753de34@linaro.org>
In-Reply-To: <20221115-topic-sm8550-upstream-dts-remoteproc-v3-0-815a1753de34@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.11.1
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
index 81fcbdc6bdc4..5ab5ac05f989 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -374,6 +374,24 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/adsp.mbn",
+			"qcom/sm8550/adsp_dtb.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8550/cdsp.mbn",
+			"qcom/sm8550/cdsp_dtb.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm8550/modem.mbn",
+			"qcom/sm8550/modem_dtb.mbn";
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default", "sleep";

-- 
2.34.1
