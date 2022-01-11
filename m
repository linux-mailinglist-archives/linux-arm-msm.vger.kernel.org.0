Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C688148ADDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 13:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239873AbiAKMuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 07:50:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239831AbiAKMuJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:09 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A42C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 04:50:09 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l4so10928933wmq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 04:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i3J0iR8CZ/SPxuoJH0dKoQEaxyyD2J8kywG8W64X0rY=;
        b=shZrjg1plL49dAnGufQ0MNkaj9RLYOjJkZ7HtkjLxt/+fIYrW0bk1FX0EhByXbXe4d
         T79bxG/N2o/aYOoZLBjTm1xuKA0RBezifRdVIIGulmkjDyMVDFVCZq2IgDfOAUR3tEw8
         c/Ll0Ahpw3mfwj0ytk0UUincMgC1FEZsYpTcnoMsfSczTaUlmJMIWXTdMBIsrdchMK7j
         QutLcnZXY6VkFgnOswmedgUoEzJ9PNEcNhdz2CuKuEnUVryZTpQ5BU97RYPRzgNWkNcz
         nC/KWefFaBtQCv7KuqORc3ZNjfZyn78jmv+s4bwjQmdgdGnnSQpDf+aOuJIPI0A8yjAp
         wcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3J0iR8CZ/SPxuoJH0dKoQEaxyyD2J8kywG8W64X0rY=;
        b=3mEzSMtjUDts+Bem4lJzPOfFCIGn5xG++QCYmEBpbPHQJthLjvg7mWXv5/m0xgvjXC
         +29CvlbxSgHNr6BqNHBvXWNNLg31l4t+uXVjWsEUCCdT5FpKyHshEsgorqPD3gskoLc5
         /kN2TmnkAesOUuwCNpYCzE+57antlV0NpVPSjyH8agQY0U0qZlL+buGT5op1s++x/ptl
         rlogD5mBJSNpYGdxeiAYJwmA/k2EnInLodm36PhAO/VWlXJQpQxOThvvkMEaRNQ3araP
         NKXupha59Asu4AoH8WvpFtnKFy4WIk93joaQeZ2DN76xCqgLIL6Ol4XlLNRmT3vqOhTc
         9uIA==
X-Gm-Message-State: AOAM533PcejH6Z+NkjjStxgG0dybzFeTNIBfSMyvaPRIjYasT8pd3Wn1
        zd7hIG6mOQqLSVCx+LX+AwDAJSndHeeR5g==
X-Google-Smtp-Source: ABdhPJyPBRKbf11gsf2QHn4SarCr499bW+nTDvfWZ5f0aCyvGplsKVLMRQ2PCEq3u7ZEnQZ7PdKwwg==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr2363160wmj.23.1641905407364;
        Tue, 11 Jan 2022 04:50:07 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 4/8] arm64: dts: qcom: sdm845: Add camss vdda-pll-supply
Date:   Tue, 11 Jan 2022 12:52:08 +0000
Message-Id: <20220111125212.2343184-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add in the missing vdda-pll-supply rail description.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c4db88dbf8766..f7bfd69b13620 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1116,6 +1116,7 @@ &cci {
 
 &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
 
 	status = "ok";
 
-- 
2.33.0

