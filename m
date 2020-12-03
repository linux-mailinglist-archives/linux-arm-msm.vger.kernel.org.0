Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFDD62CD8EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 15:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgLCOWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 09:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729365AbgLCOWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 09:22:33 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EBAC08C5F2
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 06:21:16 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id d8so2983872lfa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 06:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fC2x1NrmgFex/ZuI50LsbjTePisKBDjpo1XKmPIWh2s=;
        b=FLRFO2A+YTkTHxhFrvoQlQWAz42Ki2yKkVp0OGcrtwTf6WMMHaqD/TGy12n8RzaC7F
         kvbogPaoDJJSwH8M1I9/nqCHLHRbpEyJXGErDi02F/rouBWfjGXnP4+7Dq3EPWnM+nMD
         RTc1eTTJgct6FeFjetVTrBV+ItoX1UKaWgMkSLK4LVVBJJ2v4xT17QDeOWyqd21OcSx0
         q5XkmTdCqTQFpTdgNGsGVmOb05bF+KueEYFMXAcU8QdheB1WC1wNOIC/FhOlcJU2HCTE
         eJ7pd29a4GJxuP82MiXaCZKKFqLLJKdM32dPyLXUYoMf7O3xFI+gL9HhLnKAyussX62f
         99sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fC2x1NrmgFex/ZuI50LsbjTePisKBDjpo1XKmPIWh2s=;
        b=oZbLxoXJ3ElZ+sMKS3J1E21tRr5eSk54cXj/5E3zQK0tEQL1T+xp/1RYNgKKFPWkNJ
         5AYNApgmpoAF9hhRswumEgiXH5lFOgcxWIvdcGa+QAhECmLliFVKlgwyz0DHkd+sDs8b
         xiDDxJwpkixF5Ko34gs0Rkw2470kJfFApxpLxgFmlGTmZVEs4zPYtXZaLAqjWkoYfSus
         0A9viBSpJLQTOQZEaB3ZKiNaI1qifzfskPdvOPCitOANx6GkF3uz33J3mX2a4HauX4cp
         iVsnZVOC6fXolJF4/tdwbNwn6OkkR2DYkXvgb+1cQtsKEW/XnJilpcqZvSsSsxsygbw9
         2tuA==
X-Gm-Message-State: AOAM532n/z94dUvuDOBays83i+0c4Snch04a9TZyifU1bdlvz4/Srb/q
        OAcIlGVZDMlikqLgr7DbXNuNr4XwTrsarg==
X-Google-Smtp-Source: ABdhPJzFcsnC1yWAXPdv8Xohj85a/AYDk+87IBoUDfPMI+bRc8w4jI8i8xiW/wufoTG6Lwlvy8uP8Q==
X-Received: by 2002:a19:6d15:: with SMTP id i21mr1375236lfc.166.1607005275078;
        Thu, 03 Dec 2020 06:21:15 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id k185sm575716lfd.294.2020.12.03.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:21:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 4/7] arm64: dts: qcom: sm8250-mtp: add gpu/zap-shader node
Date:   Thu,  3 Dec 2020 17:21:02 +0300
Message-Id: <20201203142105.841666-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
References: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add firmware configuration for Adreno zap shader on sm8250-mtp.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index dea00f19711d..865b6b587843 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -358,6 +358,13 @@ &cdsp {
 	firmware-name = "qcom/sm8250/cdsp.mbn";
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sm8250/a650_zap.mbn";
+	};
+};
+
 &i2c1 {
 	status = "okay";
 	clock-frequency = <1000000>;
-- 
2.29.2

