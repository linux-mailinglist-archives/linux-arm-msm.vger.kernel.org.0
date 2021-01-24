Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954DE301C70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 15:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbhAXN54 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 08:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbhAXN5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 08:57:39 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8312EC06178B;
        Sun, 24 Jan 2021 05:56:52 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id by1so14239249ejc.0;
        Sun, 24 Jan 2021 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aTj+3LRHlPTMkRPTqwqbdcRuQaEmUjPAcJHSK59V7eE=;
        b=TgIPmOlIH01hQEsYLswEntf3+gTcgZv0o43D6l8n6fjBzRsxFtebQN4mutAT2ZHwW+
         coLaDTGkQE8YRFX8xcQwCA6Jf83L1nrgnvp/G5UY/nF87hC2cUddRDMxSA1es0qtYJys
         laSM/3ov9ihJj6ulsPig+YCLqcgxHqMY7MP0t/lj+UKdGPj1j8K4Wz/TBx7p9e4fOq4A
         Zapj2UDbISzXTprXn2nWqYKVXRn3PEBI9aBsDnwyc9d+mkAigGRFDXjZrdxjD948ZkiY
         SNAWEXxyT3xyPRj9pCpTaxQTXTkEkqToUFAiE98IS1o8Aum1zaZX8s22BYN7WL0lNzW4
         BiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTj+3LRHlPTMkRPTqwqbdcRuQaEmUjPAcJHSK59V7eE=;
        b=Xec8DEMRqnDpSknsjBqfQcre13yJc+z+soU+yyERPvsTJ91FkjveS6jZegF1gjgrdU
         IrwRiVw32A0++2gCjL6GBpOAEa1uW1llLQUD1iHlXaZTRrViW/uPhoBVmGg/Nu/9Z/H9
         0v3Dxjl4uk7HNeOAqNqYvPuw8Mn+T4IKk53DqjwHowdXRn7oqvtnfhw+bzn3G+cIcbkc
         4Q3tfYtQUlPtJVTRD63Ta9gqwbUxKIkNwlnz5L6+d0xVF+sbcIvNRGb0TVN7uW+2zono
         S0JtuyJdyClFvOsnnTFRWcwb+AOVJKqzkoJonWZuozsl8WMZNvFI+BQzCNnEN0z00l5E
         Ob2A==
X-Gm-Message-State: AOAM533pnX1tIYCdNjVrVkJFeyKJ6wPzAnRtm9jrG5l+1S3eaYhJNUCI
        1d/7dRZCwBGqpyOpG5ybaHY=
X-Google-Smtp-Source: ABdhPJzlSsvl6ptXhJwb/5k0iM8/bKA8Bici88RxgfbYGtIFRg6cWhKVTw3+eR0aTA9/4F3ol2glGQ==
X-Received: by 2002:a17:906:1741:: with SMTP id d1mr773792eje.182.1611496611284;
        Sun, 24 Jan 2021 05:56:51 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id k27sm6965635eje.67.2021.01.24.05.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jan 2021 05:56:50 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 4/4] ARM: dts: qcom: msm8974-klte: Mark essential regulators
Date:   Sun, 24 Jan 2021 15:56:10 +0200
Message-Id: <20210124135610.1779295-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124135610.1779295-1-iskren.chernev@gmail.com>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

s1 and l12 regulators are used for the memory and cache on the Samsung
S5 (klte). If they are turned off the phone shuts down. So mark them as
always-on to prevent that from happening.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 19c96b47a5dbd..27323403aa71d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -30,6 +30,7 @@ pma8084-regulators {
 					pma8084_s1: s1 {
 						regulator-min-microvolt = <675000>;
 						regulator-max-microvolt = <1050000>;
+						regulator-always-on;
 					};
 
 					pma8084_s2: s2 {
@@ -115,6 +116,7 @@ pma8084_l11: l11 {
 					pma8084_l12: l12 {
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
 					};
 
 					pma8084_l13: l13 {
-- 
2.30.0

