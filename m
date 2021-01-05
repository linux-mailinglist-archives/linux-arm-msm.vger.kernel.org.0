Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DE22EAAEA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730164AbhAEM2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730160AbhAEM2S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:28:18 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2347C06179E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:07 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id c79so18294397pfc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X6ZtUI4Q1Kv9KoNZEzoxKYY3jMlU4aqhIrm/Qzwt2c4=;
        b=dKduIlTCdTKFktJ6HofjNmdTpknfFFyT90L+XjenCIy9ZZYrPa58pgF00E959x3T8p
         6eQ5vyp6ceHB55CzY42nmWPRIyjY92b3vyU7Cj+qXO/5fQei/K14pZ4mMvrLhkNHa7/G
         628UYcoWhzB9iZJstrdi0q1ESkC7Rk6U9LdszX0LDSI5TfEy8NUrCjf+g5WebqAXAUVR
         4hzWNU4bh6rejwOZBAeILLbvpoTBoJs6XqQ8zvsyaS/FgO2NzIfXrIpnULUpE89ixnmo
         jrGHmPPqI3Vwj5fhd1TNddRPJOzMSYjuicFMtYNdgmfSsHNjK/kz3uneo4Eg761+BTxo
         YSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6ZtUI4Q1Kv9KoNZEzoxKYY3jMlU4aqhIrm/Qzwt2c4=;
        b=ZWW3pu96hYHQKnfkkyHJOCakmHS04a41d8WVJS1OqyXiqWFE9mMOqzd6INhtzSej9Y
         5TErbAw1e8uycGzAvodrNBoM5bAiRxflRBKIfrOAohf7CSbkxKUR3djfn4Xcv9y0RoLI
         tsFN78P1+2VQH8GQeLzewyy/4gSAJ4MP5sNlHGb4YPqq0HrfrtdsMGku+UaF+NksTLYd
         Kf8Q+EC2T/EV+rNHXQX8X04EAf08Ef4RNgPgefyqyAyDikS+sEjqlAdAvvZjLphI1SHc
         i/TkmnkKKYhk3/qloSSM7OF8LHTReOh4TVyNPudwZPgw8zFfz22ASXfwK4mg7hBRCs6/
         xUqQ==
X-Gm-Message-State: AOAM53152T2eGLysgSnbYX29GBFps/H4cMP74YDHR0fi+k6WRIZLD8PM
        vFKBXp1iU76GpbwDiKHNWoQN
X-Google-Smtp-Source: ABdhPJy5Vot5UvDS/HhIZ/5oEs29EL8lEixpW1ONKPJX+34/Tvylj26riRvc1rLLbOJBmwOPJEAkuA==
X-Received: by 2002:aa7:85d8:0:b029:19e:610e:1974 with SMTP id z24-20020aa785d80000b029019e610e1974mr50545499pfn.21.1609849627238;
        Tue, 05 Jan 2021 04:27:07 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:06 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 03/18] dt-bindings: mmc: sdhci-msm: Document the SDX55 compatible
Date:   Tue,  5 Jan 2021 17:56:34 +0530
Message-Id: <20210105122649.13581-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDHCI controller on SDX55 is based on MSM SDHCI v5 IP. Hence,
document the compatible with "qcom,sdhci-msm-v5" as the fallback.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 3b602fd6180b..31f4a5628595 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -21,6 +21,7 @@ Required properties:
 		"qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
+		"qcom,sdx55-sdhci", "qcom,sdhci-msm-v5";
 	NOTE that some old device tree files may be floating around that only
 	have the string "qcom,sdhci-msm-v4" without the SoC compatible string
 	but doing that should be considered a deprecated practice.
-- 
2.25.1

