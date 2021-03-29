Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E3E34CF97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 14:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhC2MBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 08:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhC2MBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 08:01:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6531C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 05:01:01 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 75so18043593lfa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+8Q0oXrMBUUF8CE7R5pzSgMMnLMfJKLpBWJdMeU+Kvg=;
        b=ybO0/FULhnEnk5jpC9ukACgruWaHDTR/3rHmAizO7AhGugRK389MP30cORWXKeUYi2
         1hjj515agYgf3pHDPu5B8WSDZS2741SndfQqIPO7yb/7Yr3n/iEUNTTj7jz6K1SpFafp
         O+TVpO80XRUt0ocfidTLtI1DU/3kHfmplHnUs3EgGvj6jbGaLEkCkHUJaHZq1LtJX6ST
         NTz1yXSg1dnBakqhCIptoXiDM3e0be58I/2TndMFTjwSoEJhtEDBzVeQ6aEx7kPOoiqB
         L2/7yNLa/OBMgCANrB/pz2xMpits59r2h6DtiZlCsbOedAovb6MtYpEPuyHTMwMQioYI
         wKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+8Q0oXrMBUUF8CE7R5pzSgMMnLMfJKLpBWJdMeU+Kvg=;
        b=gRUog3GrTBoJT7JwOSQSS7ooOzFQJYGf6IvdyyfGY4nMMI2lnvZUCjBS0RBj0FTz7M
         LwtnAN7hPmI5hXQC2IN4mSeRMctDZj36ygBMFt+IoRXIsqXBl3mA/Lv+zIVid7kNBfzS
         Zn1WLwrvWGNUpcGMepH0n4hMhhRQ1pnIldk9av3RUBPErujWQXuSnmnn//aP5kINRnxP
         SQTrndcURpy94lBhKv/pZ1xnIY4iStNNykckgmYk89UMjtMGvq2rsvkK6JoWXXMIjWY7
         Ay1jzE8AC/PPnMIS9RHciD7wqtzq7zgxFIN9P4sMKPikIZTqn/JrToc4ESbuga0Vzel2
         kGOg==
X-Gm-Message-State: AOAM533oCcoHb1RxZlXhzw8vDZVPcird5x/Ml5Zxkig5aMkPDcO/jYPh
        vGdPWBa5VqHE1wjL8dMqLOfmyQ==
X-Google-Smtp-Source: ABdhPJxWupiJN7PDS7xB8mTiJz/syDuiuIqkK2JJW59ERweoBfkxm+NI/T7VPNHg+minbdRReJDZHw==
X-Received: by 2002:a19:520b:: with SMTP id m11mr15874260lfb.42.1617019260144;
        Mon, 29 Mar 2021 05:01:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:00:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/4] dt-bindings: msm/disp: add compatibles for sm8150/sm8250 display
Date:   Mon, 29 Mar 2021 15:00:49 +0300
Message-Id: <20210329120051.3401567-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

The driver already has support for sm8150/sm8250, but the compatibles were
never added.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Acked-by: Rob Herring <robh@kernel.org>
[DB: split dt-bindings into separate patch]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..5763f43200a0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
@@ -41,7 +41,7 @@ Optional properties:
 
 MDP:
 Required properties:
-- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
+- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
 - reg: physical base address and length of controller's registers.
 - reg-names : register region names. The following region is required:
   * "mdp"
-- 
2.30.2

