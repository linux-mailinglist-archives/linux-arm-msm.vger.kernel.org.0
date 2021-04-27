Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C46736C6B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 15:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235875AbhD0NGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 09:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbhD0NGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 09:06:23 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C3EC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 06:05:37 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id h15so7148817wre.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V7VVwj3gBbXxEDF0SIhHnzpvvo8dbDhx3Tm2X6iKzEo=;
        b=XuWEDpr2cKPdEYcPmm0sqv07TJiSlqZnEPlDLAHUGQH7+uKOhaBtYe0fXwLnhEeqXt
         xO9rX5k/dnwWoHkuQlWYhEjD/6lz7MGKVa9EauiEejtGHclImhS4iWwvb2KMN6bC+1FW
         C9qHnuAFbkxh2yre/+8zbR6KQ5VA1EswmQI6x6PUsG1IZlCxNeORhXBJWRwRzCtRau7p
         9rHanUrjhsJIuitdZmszGkXeiQ50pC53HdSIHvPORIfFTBN9PG4CRaKCJvSQ7Jla5hea
         rA1D7/ltlEE/bDL4PgwUHTxB05DQ9tyceqoyyZX6IxWI3mxtVEzjX9LZsPJv1FRG91w5
         JWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V7VVwj3gBbXxEDF0SIhHnzpvvo8dbDhx3Tm2X6iKzEo=;
        b=Eg/WGYCb4HyuzZPzWbU15TN1D8tYmyN0LSLL44ye03gCRiY9Ar4awrFu0Mk0xY9pLa
         UZebYvBWubWKJ8xCgypFcerx3/UEJPAN0Nph+3DhAKV8I7ifrFRVWup0Qh/eaHTUsOdO
         1qgMvKYUmy8z9ohVA9Vi7ezXUdpN9Z7nJ2v9sn9HQKSsD0YZOm+5vksi9VrHDgW4zb0L
         K2JvRIxb+ChOPTJrgc4l661iIsw6nbIK2hAiK+hO7pkYco/KaevtlkDFpMWpJOrX7RBH
         0vXDVyhXu8k5Q+D9dNvA2A+4Aeoskij7qdmrlqSZevP/lZxS2glv0yqohPiLKGv1+SlI
         euKg==
X-Gm-Message-State: AOAM532IV0R0Ulkp3s4HuoLfZSy22kONx4B+Q0sy812o8fpKFneO4Jml
        XN9OlvTHTDqcS6uxid5e5UmJag==
X-Google-Smtp-Source: ABdhPJyYCliOenBy7EHYf+qMNRR/6w1fR3fSlv1pNp7KfOC4kB+ko+mDgou4gFHhebyUg7uOD6XVng==
X-Received: by 2002:adf:cc89:: with SMTP id p9mr28389734wrj.223.1619528736515;
        Tue, 27 Apr 2021 06:05:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y19sm2488118wmj.28.2021.04.27.06.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:05:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/2] arm64: boot: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster
Date:   Tue, 27 Apr 2021 14:07:12 +0100
Message-Id: <20210427130712.2005456-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210427130712.2005456-1-bryan.odonoghue@linaro.org>
References: <20210427130712.2005456-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Wesley Cheng <wcheng@codeaurora.org>

Add the required DTS node for the USB VBUS output regulator, which is
available on PM8150B.  This will provide the VBUS source to connected
peripherals.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index b21e56a46145b..058cc5107c754 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -53,6 +53,12 @@ power-on@800 {
 			status = "disabled";
 		};
 
+		pm8150b_vbus: dcdc@1100 {
+			compatible = "qcom,pm8150b-vbus-reg";
+			status = "disabled";
+			reg = <0x1100>;
+		};
+
 		pm8150b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-- 
2.30.1

