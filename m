Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7531035E491
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 19:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347034AbhDMRGU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Apr 2021 13:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347030AbhDMRGS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Apr 2021 13:06:18 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F03EC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Apr 2021 10:05:59 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id 7so13027335ilz.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Apr 2021 10:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w8hxS2oFPKpODRGlmUofbxB7DgkRVhysbFqdjt9eLM8=;
        b=KJeRkza+4AMdwLLUa9Wy8mO4WCWajek1C7BQ3kkm3zGi4d8RCdc1zs1SVrxLXbbzDJ
         VRXk/RXPlGv+RklwMm005To05qWaOOEX2EZHvlN2IVBnlp2NlNZWWbyby0PAv/25rpMy
         2OgaVXuJx9lrcHnfrpZ1B0UJ/IUqOb4qT4qNBI/U3lU2Z2CmuK42FddC/pK1yd3999Rc
         UhgmpjMsBptnNVgvvb4hKXPpR/v3akzuMsdW4kprQuebl0g83+MVf+pvrWVD385u+4VH
         NQ87NTwF0EOyKxe8ihkHItp1f9mWEBJ54+wFw3dV4B9wYZuMlyICsiDS5dYESdBHpEkc
         KoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w8hxS2oFPKpODRGlmUofbxB7DgkRVhysbFqdjt9eLM8=;
        b=iZ4AEO0qFRTXKefPWYEjB3xi9e3jdeSvp7BBGARTfM9MDy1pjr4DJcOTSwPS4n4zIM
         W3MP71m2VJZlf9oX+KYlcLrT3vCy3hU/wl4XojOMnZLKc2+hbD9eMB7jus2M3aQ92ba4
         ZPY1+NQtaYxp+yi/k+mnsDO5HnKe3bpqQRjUaLxprYuVz58Ojn2uub6hwI2Vzw4csb1i
         9vsz/rzY92npDh9/ZH+Wx0R+9KWrpcW7EuS3cZ19GNRED+ZrwsXhdpKDDF+5lh5BhXco
         YPeP9y+1e23XWpPUsVSTg1QxPw0sVyty03nqYrIxJru8cFWxYWZj916dsWzTJ/awITv0
         Z/xg==
X-Gm-Message-State: AOAM530F+RQKdsqGLalmLInLkOwqJPfpw2mXD112yD+KFbWYDE4Suap0
        bpbcVzcDvH6s4Vk0ZSnZKMMGUw==
X-Google-Smtp-Source: ABdhPJwv6yyWuCTaX646jmpAci3flUez68KVN8En5150X2w0Sv9cW64uxmGjeoXh9jJf2XSEMgsdkg==
X-Received: by 2002:a05:6e02:1584:: with SMTP id m4mr28722320ilu.108.1618333558637;
        Tue, 13 Apr 2021 10:05:58 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 23sm7495842iog.45.2021.04.13.10.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 10:05:58 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] arm64: dts: qcom: sm8350-mtp: enable IPA
Date:   Tue, 13 Apr 2021 12:05:53 -0500
Message-Id: <20210413170553.1778792-3-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413170553.1778792-1-elder@linaro.org>
References: <20210413170553.1778792-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable IPA for the SM8350 MTP.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 6ca638b4e3213..93740444dd1ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -364,3 +364,9 @@ &usb_2_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l5b_0p88>;
 };
+
+&ipa {
+	status = "okay";
+
+	memory-region = <&pil_ipa_fw_mem>;
+};
-- 
2.27.0

