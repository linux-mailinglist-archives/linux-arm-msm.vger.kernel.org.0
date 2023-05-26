Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5D46712F26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 23:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjEZVu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 17:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjEZVuZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 17:50:25 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735F2135
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:50:24 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f601c57d8dso9848655e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685137823; x=1687729823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9LWN7uiJnsfEyNjOznDeARmPA/LULcuUMnMk07h5/0=;
        b=WOCz3+T2w9sOysh4OH02Mb2Vo9XiIzUGn2nWBKDv8qiF2qI4CS2xv9wxdOwjxg7aC+
         n24WduTJUM7e4mifdMIUX3LP/VQLV81NRYenO9hLV5IaRVnW1vabaoBr/ykC3hPD2AEz
         nEAY+8NLvd9lcj9q/4Kvqj8v54BWKSc9VgQB5bWlNP1FA0fgn9zGGE4sa12RBTo4bGvV
         CIxrttKJOrP1cHfBndxuPCAqwB8XXo56j9uQJDMzr5nk2tt3p5VOP37r+E82UBG3+x8I
         Jwnyypq7k5/X+WwsdKaTaI5/aJK1cylbUs7+J+J1PKP9kFBRisq04BAoAemUBllPTXxX
         TpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685137823; x=1687729823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9LWN7uiJnsfEyNjOznDeARmPA/LULcuUMnMk07h5/0=;
        b=UxItJgd5cGbMGV3QUcDBN4FYBtb/X87d5oIKviQpnlqJPOTdBDgGSh82kyktgtDa7/
         85S6R2Tkrhw+n1JxMoIhovqx3JzbFx6P7RmoV8UStxNJpDswoonlF/iErKntDKLeJb1P
         /Fd//NZk2hWOLVknW/SJCc4K5YoVimLnvkuPBqV7qRaZRJXsu6t2JMYPQ8o4DESDQaBF
         M4T5hRB/j8sdsMp6NRkPQd2CC0JlZMEvx+Ikvl1iWrKiPLSY96s7WZeTGQWj8I2MjK30
         sb7oeKn88wh3fHu/HLJv8Jqs9q02VYr5UcgWiM0IKbJE19hv3/FfZqaWDN5SzPSgf7Nf
         6x9g==
X-Gm-Message-State: AC+VfDw6RBjlEMnr6Gf2qv0VUzMDFd2/bIS3Dn6BMJbTNEDrvcZdjKJl
        YULiL0pfkNQpPAp1gj57mstv1w==
X-Google-Smtp-Source: ACHHUZ62NdY/c4asWcIPpb2ciue/qZD7lbbOi5RPQJE/J+S3h0kqUAeBJ0zD4FJaffs2+2WGok2XgQ==
X-Received: by 2002:a05:600c:3103:b0:3f6:6f26:7254 with SMTP id g3-20020a05600c310300b003f66f267254mr225498wmo.3.1685137822871;
        Fri, 26 May 2023 14:50:22 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id u4-20020adfdd44000000b003063176ef09sm6294314wrm.6.2023.05.26.14.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:50:22 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Fri, 26 May 2023 22:50:21 +0100
Subject: [PATCH v2 2/5] arm64: dts: qcom: pmi8998: add charger node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v2-2-2a5c77d2ff0c@linaro.org>
References: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=NNDml/1564JCkxp4dIc4Klv6pOfclI3jdMcVHpTokFg=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkcSmcJh83dgx/vdMkmo8yA4tTfbWaU/NRm2mq5
 zj0hk+HixmJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZHEpnAAKCRAFgzErGV9k
 trHyD/0SnCVzBKQAtfwFECnThg2WWnWcacI6IXdPXLF6QxPvLaL3U0exz1zj2zfcQrGPijR9q4v
 oQ7ys3Wz+xrOecS6AMqCyVtGqOV8oFAwMav0sejZ1dG7ZGojbvAL2UYSBMIl+JFnVPbZ5LmlwnX
 uvdBKIHl5o5QIzmLRqyy91qhbG+dm7y96HB7QM2xGPsZ+Yo1WTRYXkbZzB/j5rEaNy5G6pfmxvH
 UC6IQQHDWcDb78u6LdY3QnOqZ9A1uKITolMmER/xdhl0TPi+Mv0/GmSlgvMTBEAIZGeMCa+iA7C
 3ej4F+8AEVeXbYsdw1CO09TTmm29dPtTicjyP6q/CFwOlnk8Mffdik0AZSiCWq0ZIvolJbStGD5
 9oG1BK58T6P9SN7sy2MNtNn6ScVndFa04xAeNjTDta1vPbS/t3rWh+MyQXgOTLANY4xRcHnBRG8
 zowJh7qsFg6eLyRhRdDyDtgzlieqSA4v8JepVwsxiV5jWHHkD6rU0t4XWkFySaxYrFGHBVA/lRG
 PfHiHGo4tg0v0ULGkyr9ccxHhHRLalEXSTQVLeuh5lk2d36068bUASNioZ4Sc2bF9ZiZ6lTnfqg
 OwQ5fwnN1RJKdNtZBqtOUL2YuscYctMVqZ9JoaBCkiC/wMGYFPOdRwCp/ZtAXaMnNycuKDgV9og
 2GwlG6FaCWUPhAg==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node for the smb2 charger hardware found on the pmi8998 pmic
following the DT bindings.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index be6f60bfc26c..73f51451d21d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -9,6 +9,26 @@ pmi8998_lsid0: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmi8998_charger: charger@1000 {
+			compatible = "qcom,pmi8998-charger";
+			reg = <0x1000>;
+
+			interrupts = <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-plugin",
+					  "bat-ov",
+					  "wdog-bark",
+					  "usbin-icl-change";
+
+			io-channels = <&pmi8998_rradc 3>,
+				      <&pmi8998_rradc 4>;
+			io-channel-names = "usbin_i", "usbin_v";
+
+			status = "disabled";
+		};
+
 		pmi8998_gpios: gpio@c000 {
 			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.40.1

