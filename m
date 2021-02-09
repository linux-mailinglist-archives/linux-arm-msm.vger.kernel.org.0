Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADDBE315374
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 17:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhBIQKe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 11:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbhBIQKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 11:10:30 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E095C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 08:09:50 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id y11so17947477otq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 08:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4/inwIB/bagSTME5nAGqiwX4oeNlpTqINvLjf+dIyzg=;
        b=aTuaZb6pOYgSh7gL+OPQi1FSFbm73knDRD5yGvNdtv8Uacz+GfBTOZQ6Tn5ksK7UN3
         b5axrpCr90QYxVSyOP4a1/eOl3Wz5Y7aLKuwF4eqwbNVcERHaIM1mhKr2HY/wGG2UAyD
         K609NjpuCtYQmznAkIvbat5B2JVeccB7i6uC+CTWS6pOJOPBEVBKC0vZ/qj/R+TPmGGb
         CgHyMOV6p6tAIWl8/llVLy5P0at8AacIaGShbAaKcMeffgBCiwkdBhw12NWXBMb7l5fT
         jTRDM68XS6J0MfPge8ogaOdulB9CwCHHlBJvTfBVglCAbVJDuFNa0GXZT7C3KNSv2Uh1
         UTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4/inwIB/bagSTME5nAGqiwX4oeNlpTqINvLjf+dIyzg=;
        b=BVr3ItZCb0d9weTOuipUfjIXRXhKzxu3A0u/J0ggn2AgXEr+b+jwlYB58f2oLbNRT2
         L+uufVMeB1IBxprYN0ELyHJPswNKOyX8uoDnzwIqpE9BUPyNP/8y5KBMaRoncT1GRvm8
         NnuayXkrndm72h2icQRIhxxTdG/0n03RlbFA31kcbmLK2UNhVdaG1rOHw14SEughQaLo
         yjM5aQgpBmstzxvnQVFAJc8z60id8hT7yQt0yACbT9yCRc16MdyWfc8DLGMGCfRQbzlg
         r+CfULHxl30aT24SSn4ru3pApY+Lvp33Ct6A/oq5dpMngAzZP4KGXyfz6OWU3OdCzi8O
         z/Hw==
X-Gm-Message-State: AOAM530MsUd7M6ZBkgFMIzzQsQonAqZeINFHdrfucwZCCTVjIijnxo+p
        FsiHMivblaMMGRaTL4yIHnY0Lw==
X-Google-Smtp-Source: ABdhPJyebxA3dKgogsPSJSyVMGFHA+vmYOCFxmFOhCuy1WB3Q7NjyW69ejlUEwb/5LULmlBEzcMWHw==
X-Received: by 2002:a9d:21ca:: with SMTP id s68mr16333016otb.164.1612886989714;
        Tue, 09 Feb 2021 08:09:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k4sm2725967ots.24.2021.02.09.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:09:49 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sdm850-yoga: Enable IPA
Date:   Tue,  9 Feb 2021 10:09:46 -0600
Message-Id: <20210209160946.29382-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209160946.29382-1-bjorn.andersson@linaro.org>
References: <20210209160946.29382-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ipa_fws.elf found in the Lenovo Yoga C630 isn't packed like the one
found in e.g. the MTP, so it doesn't fit in the "standard" ipa_fws
memory region. Further more, authentication of ipa_fws at the usual base
address is rejected by the Peripheral Authentication Service (in
TrustZone), so some shuffling and trial and error was used to come up
with acceptable regions.

With this in order, enable the IPA device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 9c2ab377faf1..4dd5820b3b31 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -74,28 +74,23 @@ rmtfs_mem: memory@88f00000 {
 			qcom,vmid = <15>;
 		};
 
-		ipa_fw_mem: memory@8c400000 {
-			reg = <0 0x8c400000 0 0x10000>;
+		wlan_msa_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x100000>;
 			no-map;
 		};
 
-		ipa_gsi_mem: memory@8c410000 {
-			reg = <0 0x8c410000 0 0x5000>;
+		gpu_mem: memory@8c515000 {
+			reg = <0 0x8c515000 0 0x2000>;
 			no-map;
 		};
 
-		gpu_mem: memory@8c415000 {
-			reg = <0 0x8c415000 0 0x2000>;
+		ipa_fw_mem: memory@8c517000 {
+			reg = <0 0x8c517000 0 0x5a000>;
 			no-map;
 		};
 
-		adsp_mem: memory@8c500000 {
-			reg = <0 0x8c500000 0 0x1a00000>;
-			no-map;
-		};
-
-		wlan_msa_mem: memory@8df00000 {
-			reg = <0 0x8df00000 0 0x100000>;
+		adsp_mem: memory@8c600000 {
+			reg = <0 0x8c600000 0 0x1a00000>;
 			no-map;
 		};
 
@@ -500,6 +495,11 @@ ecsh: hid@5c {
 	};
 };
 
+&ipa {
+	status = "okay";
+	memory-region = <&ipa_fw_mem>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.30.0

