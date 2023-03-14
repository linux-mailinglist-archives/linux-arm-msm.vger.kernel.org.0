Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301406B8CB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjCNILm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjCNILE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:11:04 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2878D99268
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h8so14673595ede.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpWxR/gTt4DLuz+zmuazaeln3zBoZsZPPWaZcqn2/bQ=;
        b=iPFACAwG7069uLQvEwT6Fh96K36au6BrTpRs8YNOyCY7ZDzWSCqBNHIaH6K3Z7uq/E
         MrQcRTTxHFKS8wiza9yshVYzDm8d7L3D6SuSWYNiOnzO+LIvqwcqifCUuw2/d1DXlj52
         pwR5Suq5CHGdMg3nIQ85HWD0rqo0DZ8tZcgiQFi1Su2rwTKsJzz5A58OalgunlgcfpIc
         4C4YCtnLChJMFspkg7OR+R5p73EamVX9cpSyNwZL14ni6kEvEYyTDzK8WRLLvpRDlze/
         RvHC9fPqtnr6WFgTmgTVPxC+SwKOWjI+f3Cz+fXabCSPGikhHHEIAwlaauiZVdTnsunW
         hVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpWxR/gTt4DLuz+zmuazaeln3zBoZsZPPWaZcqn2/bQ=;
        b=SKdQ+fJmD9qfxh8d4aMkOjMmnQdSoYHLsv/5d/Zb9EFj5vEJw4efN+78sFZvNRhQr6
         REFcOop0wOW8W+F5Vs8DNy867lVg83qI+O4kV5l28rEwFH8zxR/hucKk0cO3Vf5ADx8Z
         KlpPigOUVEwEsYXB65TW9oebZ8ZjPHTOpXFC/hc/eQts8BVQjwyH2l+aPH5LqIFC2FG5
         L0XKrq1AHsQh5+alDiEh4tDKz6KwgLYdXNTpCGCi50qa3VSGM/m9uOlJbn1UOGNJVWT0
         oWBMKKSD7ikr1I9HkqhdMwZCqIOkiXky5T6QW1udElluEMD9aXGLplRo9Qx/hPHFkcGg
         ED2g==
X-Gm-Message-State: AO0yUKU/nrjg8bI0QEsTRhraUw7dSn2sKk33gsbEv+AmHGkWcj2SLlBc
        stz4FCPiydoWOZWZNPoKkmXeHA==
X-Google-Smtp-Source: AK7set/ltpM8+7rH4kXUlTAQuO8ROI5W5/lhopquEMhrFs4rdX2v0T276b0trl8U2drt+jB9IfmGQw==
X-Received: by 2002:aa7:d6c9:0:b0:4fa:13b2:716 with SMTP id x9-20020aa7d6c9000000b004fa13b20716mr12401588edr.13.1678781367116;
        Tue, 14 Mar 2023 01:09:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b004fce9ff4830sm584872edb.88.2023.03.14.01.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:09:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/13] arm64: dts: qcom: sdm630: add compatible fallback to mailbox
Date:   Tue, 14 Mar 2023 09:09:12 +0100
Message-Id: <20230314080917.68246-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
References: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SDM630 mailbox is compatible with MSM8994.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 5827cda270a0..e9169876da6f 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2268,7 +2268,8 @@ gnoc: interconnect@17900000 {
 		};
 
 		apcs_glb: mailbox@17911000 {
-			compatible = "qcom,sdm660-apcs-hmss-global";
+			compatible = "qcom,sdm660-apcs-hmss-global",
+				     "qcom,msm8994-apcs-kpss-global";
 			reg = <0x17911000 0x1000>;
 
 			#mbox-cells = <1>;
-- 
2.34.1

