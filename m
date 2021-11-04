Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEBF444C9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 01:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbhKDAgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 20:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbhKDAg3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 20:36:29 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7F4C035447
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 17:29:53 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d21so8521312lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 17:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=adL1IrmcLNQtAx1Tnay7Q/BSBEO+RgzR6etkjNuPGQw=;
        b=dvZUgAx7KXoERuUSSvaLjKf/80b2OEIShKFciFGUEi//ZsLveE89bQjvWBJvR3q/e9
         6cHOFJauYothvfFtiuPQElQtM2BaSWnY9KxgZBw/sgfY5guSkw6MLjFh//+QADEwtmew
         Lec6nOVkixQgB5rEKIM491R1OKnW8pp1dig53yhax19R4u+964DLcfH320l+33UL+vLI
         LwDlUbxvXtYCdBChCQhtfafkDNfdFhZW8VrY1mfLggjDB/vaMZW7Xjg1V1DOiEgRZ4HR
         NknH8eOnKO8q6l52iCUlbT1PKtYUOvewReqXXVTynTNELuenEFIIhFW3MzGdQO663Gan
         5SbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=adL1IrmcLNQtAx1Tnay7Q/BSBEO+RgzR6etkjNuPGQw=;
        b=uYwVqOykRynEjkyREbW4tbXXvnGzBaAAzddRuy2nsdduQfGqKW9Ke7gl9+xBX4Zslq
         R3bMH0bSVetodOQPj0TNiydg9v+4yHEaNbOn4i1KoL6l4wNzf+9yf7P1MhbQNXugf/75
         evrchYWcya08tJoPe/UjCEBohY0f8qo6zmyYXaHXaDSAziLKuKVSOqD5K0C16fICRXma
         qXw+931CoTk5SNJRLytawT5dqqITk16WPB+w7oq6eOd8eXtWqGFNC/cTqKGT8oLbnhI0
         LLMfNpCVbuE8/KR1Er2fiijrtExeUgzD1+TIeNrq+mT1b5Occ5OOewAF6sQ5vsmQftNB
         gDPA==
X-Gm-Message-State: AOAM532tPAwsQiArqG7XuKeNykdfVImxG6uG1Si3TF1beEnMh9PWk34k
        TtUliewJBeA9KlW6TG1wtCNWoA==
X-Google-Smtp-Source: ABdhPJxaywt9gKzzLUY9ujPiuTY1vz+i6qcWVqmsccKuKtOUkNhpiylxodQOTLpES0RZTUmlkhFKtg==
X-Received: by 2002:a05:6512:3b24:: with SMTP id f36mr19694904lfv.585.1635985791690;
        Wed, 03 Nov 2021 17:29:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 188sm329861ljf.71.2021.11.03.17.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 17:29:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom:apq8096-db820c: correct lvs1 and lvs2 supply property
Date:   Thu,  4 Nov 2021 03:29:47 +0300
Message-Id: <20211104002949.2204727-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
References: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom_rpm_smd_regulator driver uses vdd_lvs1_2-supply property to
specify the supply regulator for LVS1 and LVS2 (following the pin name
in the PMIC datasheet). Correct the board's device tree property, so
that the regulator supply is setup properly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 9dbac589482b..28403d2ffd31 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -715,7 +715,7 @@ pm8994-regulators {
 		vdd_l17_l29-supply = <&vph_pwr_bbyp>;
 		vdd_l20_l21-supply = <&vph_pwr_bbyp>;
 		vdd_l25-supply = <&vreg_s3a_1p3>;
-		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
+		vdd_lvs1_2-supply = <&vreg_s4a_1p8>;
 
 		vreg_s3a_1p3: s3 {
 			regulator-name = "vreg_s3a_1p3";
-- 
2.33.0

