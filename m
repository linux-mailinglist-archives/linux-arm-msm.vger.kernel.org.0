Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E6A3218AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 14:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbhBVN2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 08:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbhBVN1h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 08:27:37 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE31C061793
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 05:26:56 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h98so14263416wrh.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 05:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oY/R8xUmHoMXdWUIvUY6QVkFhbtPMa36GqY92BVHRh4=;
        b=ZrkO7D7W1m+pHeDT0y+Mjq0OZZTO/iloZnizApAuQm31H/OcdKgC553JDtvxetCxJl
         +96dCCql6rxhluWzBdbngxZSy1GwFqCbdYIkYBsDiiAyJGMjJOv7obV9M6mnL/xQOELz
         YR3r2Lq9f7IpxNsj5DJVwaG0RHUTzoRTRQDdlKs0keh18kjBVeDOLnS29OUu4mU29jER
         ZsLrDjAePoECfAi/6Z2KTj3vm32ZnVYMCS+Dq/1fT0ZtNDJBut/3D6f3WoErUJeOLLYv
         +bF2vCnxTmHnVFc2cdKtQDMrWSk3OgabHb39uViM2bA9i20ciL6A2ars9MsnY8Kw0bNp
         0Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oY/R8xUmHoMXdWUIvUY6QVkFhbtPMa36GqY92BVHRh4=;
        b=IzCg/eyyS+oSKDYM1lw1+bgLSgLg54orGHR2Nvp7ASCjBtouSIiDJbwcYI1ZEuYFLG
         XdtBTrKYS9HC2Urj09Hz0FjaMk0llQZ1b/qu597IS/gduU5Vn2fY7AqPev3gOKnr3jFo
         61qv1AY39+Oq7iW5gxHxknmOu52eOY1ZoUyIhCcsXpytVQh8F2zF1Z03HgVyz1ZTPkPR
         Hq/VYtU1oSxVZ2PhfQCf/FLLRlV9/HIo+75QtNrDdDjXf5qAZFw6Ksgs/QZheJw3FW8b
         ZBq+CPOUi5KLsWkmv19IWwNv27fJ6rz1kCVacKtD4xY6xob6k/kwjAXunsY283RUULHE
         wqiw==
X-Gm-Message-State: AOAM532u8tdUpgBUfNwNhHUP9kFhnmsu0/Spiva9JcvTYn8NWgYbtgMS
        PSO2NBicGzJVUkwjjRIyhai5wQ==
X-Google-Smtp-Source: ABdhPJw1UaMqpM38H0NKxUaUib518kwdyHYL8VLR+ZlyPKjuR2aCe/xkjkwgsY7smRX4Wo+x3REXNQ==
X-Received: by 2002:adf:f542:: with SMTP id j2mr21639953wrp.46.1614000415617;
        Mon, 22 Feb 2021 05:26:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t7sm3079918wmq.44.2021.02.22.05.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:26:55 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@qti.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8250: add mmcx regulator
Date:   Mon, 22 Feb 2021 13:28:15 +0000
Message-Id: <20210222132817.1807788-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222132817.1807788-1-bryan.odonoghue@linaro.org>
References: <20210222132817.1807788-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add regulator controlling MMCX power domain to be used by display clock
controller on SM8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 65acd1f381eb..81eaa2508d5c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -214,6 +214,13 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	mmcx_reg: mmcx-reg {
+		compatible = "regulator-fixed-domain";
+		power-domains = <&rpmhpd SM8250_MMCX>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+		regulator-name = "MMCX";
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.29.2

