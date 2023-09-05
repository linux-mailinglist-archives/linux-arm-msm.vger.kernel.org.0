Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978A9792AFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbjIEQqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355066AbjIEQeJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 12:34:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42810173F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 09:33:00 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so3874049a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693931492; x=1694536292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCtQWgbb02h7KYD8U2ktyb4TldTEghF6cZdnaKwaLc0=;
        b=pMeY4lmdo/OkRpJovzW/wCxst082fSuyZW8JsTT+VCkmED4NBDqxbxYaDuhW1fJ0FJ
         MQFsCS9MkOzRRuqgYi96LiDj7TchnHVky/bjDtSpxVMI1L0P+YJ5NEKf+lFD4M6KUgjI
         gAm7jS/3oSyL7RA+I+hyVqztGS487hrm2qa3koqP3jq5cH9POUuhK+/m4M4D66iyPI6P
         yshAfRxLbUKmV19qrH7ye+aVLVV64aTG6iSlkxnVJSDPO+3BhSJittyAOLPa7LCp/HP5
         aFc+SjEDQVZQYVgI7ClGu5Q1AxyYHWSyajz9XiZOsX/TuJsBqPterZmH8wBOdPBHczCz
         biqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931492; x=1694536292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCtQWgbb02h7KYD8U2ktyb4TldTEghF6cZdnaKwaLc0=;
        b=l2xbt4+W3YSUSC6QCtC/f8pq0Rk5U37n2KcfFWpbN5gbjnISPHwp5jOxILmY15VzrE
         Nn+jiFsZoWHp3CpV/sYG2XYLpfGHTXXHpzs2dRqwQlo/ftQAfGRMijtgNxilB8zz1f54
         VM82xTofG23IjmJmjiQ8KaYHNjoIUUv4jJ5udrHkuiZEGcGb1/7O+eB4zlVHnobQRovH
         fBPC9EWGc4sNswwQkAYrcSk0lGeENmyAM3HBrHpuhuIj4MFxNWogiSBJ+/ZLn+0Evenq
         E5p+urRManyTeKlRVA2lTRxKSBbIf1x50pKQDHuQOH4AChCKuVGtETtXbyKnPBh2e2nM
         ng0g==
X-Gm-Message-State: AOJu0Yx0ZCRSYi7m9FhYLZNkSuuAgwZY1SDAVIqqOc+afXtSRcCIsDb6
        0AG6DfmcbaeeYg03Qw1nLZOyEBPnFgg4gQBBsdg=
X-Google-Smtp-Source: AGHT+IG/vRGmEaxsFaRgwpx5PNlOfs16fo0/0gTaACViAusSmncbJI1uTB1sOjpWhj3mmg2REQVmcQ==
X-Received: by 2002:a17:906:cc49:b0:9a1:bcf9:4f99 with SMTP id mm9-20020a170906cc4900b009a1bcf94f99mr237434ejb.36.1693930778172;
        Tue, 05 Sep 2023 09:19:38 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/12] arm64: dts: qcom: msm8998-mtp: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:17 +0200
Message-Id: <20230905161920.252013-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm UFS phy switched from dedicated driver to QMP phy driver.
Eventually the old driver was removed in commit 02dca8c981b5 ("phy:
qcom: remove ufs qmp phy driver").  The original driver and its binding
used vddp-ref-clk regulator supply, but the new one did not and left the
supply unused.

The Qualcomm UFS phy bindings were also migrated to newer ones and
dropped support for vddp-ref-clk regulator in commit dc5cb63592bd
("dt-bindings: phy: migrate QMP UFS PHY bindings to
qcom,sc8280xp-qmp-ufs-phy.yaml").

It turns out that this regulator, although with inaccurate name
vddp-ref-clk, is actually needed to provide supply for VDD_PX10 (or
similar, depending on the SoC) used by UFS controller.

Bring back handling of this supply by using more appropriate regulator -
UFS controller host supply.  This also fixes dtbs_check warning:

  msm8998-mtp.dtb: phy@1da7000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dts b/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
index 4319f4da8996..7c77612fb990 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
@@ -412,6 +412,7 @@ &ufshc {
 	vcc-supply = <&vreg_l20a_2p95>;
 	vccq-supply = <&vreg_l26a_1p2>;
 	vccq2-supply = <&vreg_s4a_1p8>;
+	vdd-hba-supply = <&vreg_l26a_1p2>;
 	vcc-max-microamp = <750000>;
 	vccq-max-microamp = <560000>;
 	vccq2-max-microamp = <750000>;
@@ -421,7 +422,6 @@ &ufsphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l2a_1p2>;
-	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
 };
 
 &usb3 {
-- 
2.34.1

