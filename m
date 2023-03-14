Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056E46B89F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 05:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjCNE6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 00:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjCNE63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 00:58:29 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997A9570BA
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 21:58:27 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id x22so3906345wmj.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 21:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678769906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc/1zJAFELXcXoQvk99Xi1e1l/yoiiUG+pMbW40cAu4=;
        b=DmMTslwct4+raH0uEyweJXaxBY337k+9Yaj39Y+aPCkVhQU6u7V0JkHjidmLhjeK6w
         T5iwI2pz9LsgAWPJ4lL0hjYLNXSJwvNO0XjKeV02jipqAp8HcPgqCxf8rYllycngV4PS
         /VGQ0ej0BhnkLnMuGQHmcUrsN28CIkNBjY2bjQm5uYKPwejASZkYyyHJBM4jX96nvnqi
         SDE7Bgf0FXDPJPRD4hQR27NJ7+xyRq+XHtngYJ0mOUTD9NdJnINaJi+G/gS3/+5T1H5O
         xYvWAgbJhzbiEE9mI5PTwC+ILNj1fdLv5o8lsumZ/f4kb320cd1MQku9bpHIKHekgRRo
         jauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678769906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc/1zJAFELXcXoQvk99Xi1e1l/yoiiUG+pMbW40cAu4=;
        b=QuBLITp+GNuvrGWwXQ0/nN0l5bzcOBkuj2XZ2tjbOFMLeSwZum0xU0oYFnPnoMCjsS
         rpDQSATEMSf8GD4PsFLUdDvr4n+r96ojIjk6WPc85Tp2Pk4HHC3K6fI+ojSV1Wl4KPVm
         CbP+XZL6Ju7hpWhU7PcOm8mRsOf3UtMfoMEvdS65B7XPSsWei9+YckdFIAFTWOB1a2JH
         OoWAPx8O5+Z1pUBKMOfW784xBh3O10aaEgQ9kVJMlE7kIzcgF1PDLtA7Xa+V1RY9FdE2
         dNuUJeYN2SxzHvk+ttWR4mwJKNkGLuqoFwMrPvTOdSRghXavyyTxEyxUJkUlU6R9MdZ1
         gggA==
X-Gm-Message-State: AO0yUKX1SLpWcpWePW0sxLOBc5R7aNEuuPo59SJKXd7SvQ639DKBCekV
        R+asMFsRo0Fb6+xUdysqwWuB5g==
X-Google-Smtp-Source: AK7set+1w75JuEOiwXl2NZDyPWPJ+vY4nCCeJhKMN8YMUco3HRR6NPxN1kzUt2EJKDMo0+u+DPKF0Q==
X-Received: by 2002:a05:600c:46d3:b0:3ed:2b27:5bcc with SMTP id q19-20020a05600c46d300b003ed2b275bccmr1205451wmo.38.1678769905946;
        Mon, 13 Mar 2023 21:58:25 -0700 (PDT)
Received: from lion.caleb.cas.dev (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003eae73ee4a1sm1548760wmz.17.2023.03.13.21.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 21:58:25 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sdm850: commonise framebuffer memory
Date:   Tue, 14 Mar 2023 04:58:11 +0000
Message-Id: <20230314045812.3673958-2-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314045812.3673958-1-caleb.connolly@linaro.org>
References: <20230314045812.3673958-1-caleb.connolly@linaro.org>
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

Both the Galaxy Book2 and C630 use the same address and size for the
framebuffer reserved memory region. Move the definition to sdm850.dtsi.

This also enables it on the C630 which doesn't currently reserve it but
does have it specified in its bootloader memory mappings.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts | 6 ------
 arch/arm64/boot/dts/qcom/sdm850.dtsi             | 9 +++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index 9850140514ba..6e36ad2f2d3e 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -61,12 +61,6 @@ aliases {
 
 	/* Reserved memory changes */
 	reserved-memory {
-		/* Bootloader display framebuffer region */
-		cont_splash_mem: memory@80400000 {
-			reg = <0x0 0x80400000 0x0 0x960000>;
-			no-map;
-		};
-
 		qseecom_mem: memory@8b500000 {
 			reg = <0 0x8b500000 0 0xa00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
index b787575c77a5..89eda97daa57 100644
--- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
@@ -9,6 +9,15 @@
 
 /delete-node/ &cont_splash_mem;
 
+/ {
+	reserved-memory {
+		cont_splash_mem: framebuffer@80400000 {
+			reg = <0x0 0x80400000 0x0 0x960000>;
+			no-map;
+		};
+	};
+};
+
 &cpu4_opp_table {
 	cpu4_opp33: opp-2841600000 {
 		opp-hz = /bits/ 64 <2841600000>;
-- 
2.39.2

