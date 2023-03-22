Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4456C52D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjCVRm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjCVRmG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:42:06 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E4B65C73
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:42:02 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id x3so76093018edb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIHAu8tErojOfd5QM6R7iQDgiVIIMil5Ve6NCJeQni8=;
        b=o0d8c7J2Nl+++XEo+RFdcmu3eYoERD8uZv1PFUw4MRwS7ySX8mt/PIdZ41JzNB6t+C
         b2Bip+JDlgJ9yGgTAM+63mIFqQIDfDkjEfajSECk95qKhe/jST8A6If2iTi/yIc5dAIj
         Ye9hka7aOfny5sCyX3gDNvY6TgHHFP+1AKHnFJra+TFasDgI+5yUXBSvpP4/LGpCYJij
         Wh7jo86Tf04dcyxkpoJ5L2VQpDvYCEJ3qACQTTqxKXPTlRczEtqzAEPEDtpEZsUL0sPE
         3OaXr3ZtCPD1dfkknhhlAuUQOvsZtDaudmrZlLT0um78VTnZkjkh6JeOS9V1SyBzPVYG
         TgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIHAu8tErojOfd5QM6R7iQDgiVIIMil5Ve6NCJeQni8=;
        b=qAa1x1SyDgDmbPUM6yEFbVtDI63qazo2IGOuM6ELI89wKujtwf4tzJaFbfwHFF8A6s
         MhkSJ06jce/RMv2DgU2nINiMYf2x4lvnIErJH997SDAynUDE5ztDvdHruxtP7jJ6HX4l
         shHfVqVM9bZivb3iKo4ztJhWz4z4b/k/nP4gLw2ApJn6fr72Xy/6pJud3TzUzfMYaHEt
         5nZhWLgr1LIwfzNS71epWvmpdHbNVmfwT4GNpRApGsPAGqK6ohVbAaLhVdy/MRxtIUp9
         +hetRYMWlb5xD6OrWT+I4glJCD5cCj3fBPZ4J5AlHR2sxKnUHD8dreETaSNAzkIAMMJa
         GU8Q==
X-Gm-Message-State: AO0yUKUO72Ik/ChKYODXIQAtpsTfujysEKlAaGWkvqg5B5OH2MjvPFPm
        IB/PMhu4Yopihhtq3Ef+n441BQ==
X-Google-Smtp-Source: AK7set9GMJ6QIcMoTypmZx/ic2EHq02+vAcqGvN7kcIYKd/76sZBF1deKtrz+koMzug9nWuVaDdIfQ==
X-Received: by 2002:a17:907:1dd9:b0:930:b130:b7b with SMTP id og25-20020a1709071dd900b00930b1300b7bmr7919127ejc.6.1679506922081;
        Wed, 22 Mar 2023 10:42:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm7548088ejc.29.2023.03.22.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:42:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 10/11] arm64: dts: qcom: sc7180: add compatible fallback to mailbox
Date:   Wed, 22 Mar 2023 18:41:47 +0100
Message-Id: <20230322174148.810938-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
References: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC7180 mailbox is compatible with SDM845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ebfa21e9ed8a..61d99c02a290 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3407,7 +3407,8 @@ msi-controller@17a40000 {
 		};
 
 		apss_shared: mailbox@17c00000 {
-			compatible = "qcom,sc7180-apss-shared";
+			compatible = "qcom,sc7180-apss-shared",
+				     "qcom,sdm845-apss-shared";
 			reg = <0 0x17c00000 0 0x10000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

