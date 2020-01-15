Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2BA913C534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAOONc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:13:32 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38005 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730370AbgAOONb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:13:31 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so15908183wrh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77YZKi21/UFq8ab0fDgwp8wX61rx924yS+pIUFv8pqU=;
        b=wCQz6rlV/caolVVopEqfe57+az1sdm5RSdCHSFdWGeF4WYqBkG9XXDkH4HF8pgsJ+5
         llOyCpeZIWYHO2nKQS9WOgJQqccwJC/cSYFhDjjJ000GH6McGos4apLez8qtzikjBV6C
         tfRNjGjtvoHSx/VoE/x8iFT8uLHY6BQSa8EX2AQ3LNwL1BUhgRNb4Yt7JWwDZ6H8hssB
         hbDU8pQmBQA3R33RahIPV1mSqNuBdyRWqQGj1v8iNp+FSxKSMt68XHu8N6xC4PjoKhQ5
         JJZ7Gv9vs9jg9glxHvRVP3AyGVpV08yMolIZ3X3mRrQBnHr9UrInllWHXos+IBij/jvY
         85Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77YZKi21/UFq8ab0fDgwp8wX61rx924yS+pIUFv8pqU=;
        b=eX9n6zGJm1T0i2U0tTLNbP2UwXyUiUsHd/Xeidr/eD0U9FwihlrN9sAONuXdsjG3sY
         Vne7i+Nsn7vcQoSsgJ1aakNHFwSu1YCfTVzkq0/axRa5tJtyqywewjk/bO9huIUZrZU+
         OlbXLP4UhhlxFp/86SSiYT3kslEdn1A3q9Txc6UFfx7r1EtMZgdQBWialvBRsKaRlByT
         oByP439z/jqPRXDeBVptrpDB1j2L/RgaSMYm4QKmehcdgCrVIcvj4XHc9BY9MSAo8AN6
         gZhcIzEpzciwHBvtLSrDgGBmUlFwKg2tifCgA8JkUBw2W3IskskrrlA0V2dG8VVa72/+
         +p0Q==
X-Gm-Message-State: APjAAAV8Ct3b9A2xJVRK/dvoi+hzkexCLkvnb2RRmDSF/LGNDCKzklcg
        2IPY4aPWuo4YqTjr41gkmy8UKUa/qQU=
X-Google-Smtp-Source: APXvYqyrN4dg5SAaK8uSWRpjXcMLagOgensqOz0vk3mNJsx/Gh/cXJYEd3RmoRtdbliIPlXHsKJ3Mg==
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr30586906wrn.124.1579097609430;
        Wed, 15 Jan 2020 06:13:29 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:28 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 18/19] arm64: dts: qcom: qcs404-evb: Enable secondary USB controller
Date:   Wed, 15 Jan 2020 14:13:32 +0000
Message-Id: <20200115141333.1222676-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch enables the second DWC3 controller which has one USB Hi-Speed
PHY attached to it.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 0fff50f755ef..07d6d793a922 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -318,6 +318,17 @@ pinconf {
 	};
 };
 
+&usb2 {
+	status = "okay";
+};
+
+&usb2_phy_sec {
+	vdd-supply = <&vreg_l4_1p2>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	vdda3p3-supply = <&vreg_l12_3p3>;
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
-- 
2.24.0

