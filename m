Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C8F3D4BB8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhGYDqL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhGYDqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:46:04 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A900C0613D5
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o185so6824059oih.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kU1VfKV/KwidsxyPTuvcQ9ilMU6Cwx8iFZjshNBHlrk=;
        b=TRygaLb1d2m9eOGCp6xYaANeKW0tOnOoZgQUGxgLOoMYwf+qIpEE8Rpp9HKxSQ2lfI
         tWdu7DdwKwVM5s04IZr/iL8VuBBoAjCHxHzHAflBHRPHf3KtBpmDN5JgZeMRC+nkyrff
         FkM+Q0dRk2WI3LnGnTmu4VMb2ug+ib3gcQw44sLHlMn3aqwNt9dFlKB1j+/Y9+bNE42V
         HmfGNgOQvpx+AC06SYnxWW6FqPEi7Ffg8EsoUNKpyMMbga3Pu4TlP/RpE6RQbcVSWGgM
         RRYovJ0OkjLyEtB4VzulN3ZfQsEFvwBTk4jYxS5qDX3NNf/UsBagGyHU0X6m9CAbEyab
         BEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kU1VfKV/KwidsxyPTuvcQ9ilMU6Cwx8iFZjshNBHlrk=;
        b=pMpvjCC0JniQH5/QaSS2ekTLM+bSuM4Oqlr/xttBk9SL2dq8gouvBXkF3lAIGi37oP
         3wvwD1RsdDlMnloyIHhim/oCNp8OLrEAqITonBXKoRYb2xA95GsKVoaCivo/Zo1cp2GP
         FYHVtivXDv9urB+67ndwRV13Snd7w/gWFD7ecD9SYIzwmL6UeXYL3adxgBf3FM/LrxW9
         GGhOLmSTIVg761twTNaSuSnEFiw9VGjwN6zlhUuA4SjY5YfBRKpBxU2B+Nz0FJJ9kLAt
         Rer9WI9uRK1/MqjuBE8KLoZPCfgRyRRGCMlK6RNTPNFqPgDYm0BhkNsBs28sA9e2/UtA
         anIQ==
X-Gm-Message-State: AOAM533Nqy7KyTTo3LzC43vjZj4rmxF6mumCNZRS1dRCvyIy35El9aBK
        gWxphMr0ZS77DIohngCQJ3daDQ==
X-Google-Smtp-Source: ABdhPJxWc6HpCzL5osAC98BzBe6A7qGjaV21OAnlOfljD7bSse+ehjQIL5aw6E0ECmbEg7gTl2MCXQ==
X-Received: by 2002:a05:6808:2089:: with SMTP id s9mr7702063oiw.156.1627187188672;
        Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: msm/dp: Add SC8180x compatibles
Date:   Sat, 24 Jul 2021 21:24:35 -0700
Message-Id: <20210725042436.3967173-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a6e41be038fc..c6056e0b0845 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
 
   reg:
     items:
-- 
2.29.2

