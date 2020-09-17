Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5DB26E750
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 23:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgIQVXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 17:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgIQVW7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 17:22:59 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E1DC061788
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 14:13:29 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s205so3255893lja.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 14:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+q32KKfvQ8vwPBE7D57+tI6W4ETqZSqkktr32GH0s8=;
        b=SoiNw2WFQ2njmegjpwS6mxU+DxXK0K3LYLdZ63AGM4ciNfEy5pJRDj0Iu6+1DdgoS8
         gUr/MeFr6g0XJcFKfuz+C3PDCtzCo0B++ivyH+Bc53MpYz+161HXmGgIMfdRpaIsg3b+
         eVqSCRmMTLnFIMmqXdMVJfzGhGack3BLegki4Fcn9k08kRTlyJCSJu4KGapVXJiDKopV
         5Jk+nKzGyrr96xkRJ3zGrdq668drF9S20MzPYFMtEHqQ1azbHLl60SZva6isXAxLMzwe
         EcA/zFi8W0QmH0wSiK2rX9zQ2SzGSHJwZgVlcf7nMTGp4rcN7sj+pPDPHfsuucK/Kzuv
         upng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+q32KKfvQ8vwPBE7D57+tI6W4ETqZSqkktr32GH0s8=;
        b=Pp6JMFAkzzCHTY3WcKp4cyyxT5UFKYelF2K5BntvKGwpfwD/SWC+p548BC0xSf2u0u
         1ytRw4rPrIypBreT7/NeL9/i2Z+Ynf3VBcXkC4AUVmdTDF4NabVjNiuyfm+fBFHSytpB
         Fxrqg77PV9/qpC3pLDpfPW1rdm0FOHyEgvot3q29YapQvm7EmP8AE1IxdmBUTQ7Bel8S
         i9uGIKYYcXKG8izZHVp2VWyJ3kvpYOfFlQgAcL1FBVoi6O72Y6mtJrlBcJLsSSVrmuy+
         cS+XCjXfxYNKp/ly1U3zfMBpeLvplpdbSn0pccnocsABjA0YAaB09p/aUZCHr7sg9A6V
         PoTg==
X-Gm-Message-State: AOAM531vnBN4wmkU59raIdrYacX5/SDQz0ZxXCIKdCFZCSm+3wSvEkoi
        RqqYzw/8+Ip6SgBXYQI0tnRFh8yhiRWxJQ==
X-Google-Smtp-Source: ABdhPJx0MrgPCAWI08JRyqGMYdNLcjDf7BwswkxiwDkLY+Q/0KwRYNGluzsAZpupPnPMGOL72q9qlg==
X-Received: by 2002:a2e:b178:: with SMTP id a24mr9729704ljm.276.1600377207536;
        Thu, 17 Sep 2020 14:13:27 -0700 (PDT)
Received: from eriador.lan ([188.162.64.171])
        by smtp.gmail.com with ESMTPSA id h124sm136711lfd.203.2020.09.17.14.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 14:13:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: enable rtc on sm8250-mtp board
Date:   Fri, 18 Sep 2020 00:13:21 +0300
Message-Id: <20200917211321.3295947-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917211321.3295947-1-dmitry.baryshkov@linaro.org>
References: <20200917211321.3295947-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PMIC's RTC device on SM8250-MTP board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index fd194ed7fbc8..c85cab9c9b41 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -378,6 +378,10 @@ &i2c15 {
 	/* rtc6226 @ 64 */
 };
 
+&pm8150_rtc {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.28.0

