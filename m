Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A10475802A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 16:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbjGROyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 10:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbjGROyi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 10:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55866A4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689692032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=lD9hBi/o5k7aJyF+JJZTpU1vYmPYMPbaaBCJ0qSIHvE=;
        b=coqGiZnBnTKp8VLUN3MJSLG+wP4cgU2NLSGp9eLvPEDIDaQ4/Ql2oGsdiEjDC7REyPeTcI
        rDsahQDEXF2jMDf9Aum5RcQMZ8JEgkafKkFo//4kYTfGjoVGdUbhSwMLI/Ry9bJLc65FP/
        fl4uZk/NvYH91r20RqTjBGreFhtwaEQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-z_aQXrYgMwy3W_NXp0I3iQ-1; Tue, 18 Jul 2023 10:53:51 -0400
X-MC-Unique: z_aQXrYgMwy3W_NXp0I3iQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6372702c566so49449036d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 07:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689692030; x=1692284030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lD9hBi/o5k7aJyF+JJZTpU1vYmPYMPbaaBCJ0qSIHvE=;
        b=LxbH8SpHsO9REIros1j8tye/+uOzWIUfQ6rh61/zDnlFnz8EJD5labYh4arPK+p7Fa
         5akqdrGkKduHyuInHyGup1jHRrlqAipueYF99ZUlSZF4g1b+qcI56KWREOOkcqUpIAoW
         wgHJYB1OUjkb6zGbxmUnX4hV6u9PcCBirn/6ArVqU4Su//YajCbOPg7yonpur39RQ/xi
         n7ES18uof51WX6mpxCuLHew7yc8raJYMwTewj5erMOHAmalwjGdj1pwdPmblzd6eQ1CY
         AXySkwQb6sW1wO+4FJu4VvTWR4BfgWyr3JeMyOOJpSeBnjtQAFTuyz+hwhsMtRAKSVSw
         te6Q==
X-Gm-Message-State: ABy/qLaoVVbo8TYg3d8zpX+IaPDcuXENrrZvYRfja4mm9lkGW9tI5A2a
        OqhczHatiwb4Kq1wOgbVQkslC3mQyAgc9fsqnBj9m8fS7nln/oLJv4+WJgRijLV4YtRLGoA6FI1
        moSWP8n7mv6t3zky34LpnOJOgjQ==
X-Received: by 2002:a0c:f2d1:0:b0:632:738:922b with SMTP id c17-20020a0cf2d1000000b006320738922bmr12278676qvm.61.1689692030615;
        Tue, 18 Jul 2023 07:53:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG6vwmeMAloCaGRcq6VVi3zzI3/WT6q0HTBf2wTfFTTx4ElfWS/d+wNn6BDmIRz5XQ9x7tNsA==
X-Received: by 2002:a0c:f2d1:0:b0:632:738:922b with SMTP id c17-20020a0cf2d1000000b006320738922bmr12278661qvm.61.1689692030359;
        Tue, 18 Jul 2023 07:53:50 -0700 (PDT)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id z18-20020a0cf012000000b0063646f1147asm761735qvk.135.2023.07.18.07.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:53:49 -0700 (PDT)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eric Chanudet <echanude@redhat.com>,
        Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: sa8540p-ride: enable rtc
Date:   Tue, 18 Jul 2023 10:46:10 -0400
Message-ID: <20230718145105.3464105-1-echanude@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SA8540P-ride is one of the Qualcomm platforms that does not have access
to UEFI runtime services and on which the RTC registers are read-only,
as described in:
https://lore.kernel.org/all/20230202155448.6715-1-johan+linaro@kernel.org/

Reserve four bytes in one of the PMIC registers to hold the RTC offset
the same way as it was done for sc8280xp-crd which has similar
limitations:
    commit e67b45582c5e ("arm64: dts: qcom: sc8280xp-crd: enable rtc")

One small difference on SA8540P-ride, the PMIC register bank SDAM6 is
not writable, so use SDAM7 instead.

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Changes in v2:
* Default pmm8540a_sdam_7 status to "disabled" in sa8540p-pmics.dtsi.

 arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi | 11 ++++++++++-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts   | 15 +++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
index 1221be89b3de..85a077619ae4 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
@@ -14,7 +14,7 @@ pmm8540a: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		rtc@6000 {
+		pmm8540a_rtc: rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
@@ -22,6 +22,15 @@ rtc@6000 {
 			wakeup-source;
 		};
 
+		pmm8540a_sdam_7: nvram@b610 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0xb610>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xb610 0xb0>;
+			status = "disabled";
+		};
+
 		pmm8540a_gpios: gpio@c000 {
 			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 5a26974dcf8f..608dd71a3f1c 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -407,6 +407,21 @@ &pcie3a_phy {
 	status = "okay";
 };
 
+&pmm8540a_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
+
+	status = "okay";
+};
+
+&pmm8540a_sdam_7 {
+	status = "okay";
+
+	rtc_offset: rtc-offset@ac {
+		reg = <0xac 0x4>;
+	};
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.41.0

