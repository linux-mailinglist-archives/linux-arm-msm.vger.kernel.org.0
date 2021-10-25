Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38E24393C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 12:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhJYKf5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 06:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbhJYKf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 06:35:57 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E724CC061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 03:33:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z20so17951424edc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtXEbVNAEMP2fIX0FN1mTXTkNu2gxV03Z7XtTW5qZGI=;
        b=lud7xTvvv7SSrJ4ZVXj4n3sTCtB3XgEGe/pZjUgBinjzWS0BK3cVapFx5YDEAOqYdy
         OMa5Cswx0p19NFK5dFDY8h/nfxMLZKPq+LncN10pzMOoxAvrgPjr0+Mfkdrznsl+LTGL
         Tj2t99Iarp1TbcuSis/PKVBrMlZFmdBPkXKPdbRzq0rGGB1ZqRQIKhk90sE6k72oQNEw
         CLV8p+aKFkVG0+RQAUuW+XhO6iM8GH2ElYoJsuYq5pmxXbbz1h5YtjqjMabev06tPD+6
         JVPxw/g9j/9yZ4EmPTdFkZiByNfACqahmBxslZPO7SVk88NKbs52svQAMHcxu4eQcPMO
         nFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtXEbVNAEMP2fIX0FN1mTXTkNu2gxV03Z7XtTW5qZGI=;
        b=PeoRYqSKvpdZMq3TaJ0A2x3F9e8PINHbMrZdB8DNaBonu10Bsmqt94nztzeZk1o5LJ
         r5DTCBeYtU15UxxBmgYD81f6rbhHe1NJh08H/qdYEaUhtEQoxcDq1lL12PyMedPXjhhz
         SRhHtCMqkQS5KEkEBAORUTy3nNFp32+ERu9dTH2wpwH4soVLuYLrMiv7sccM7XedS0Ja
         XveN6PgycwSGdVDXPN0o9dnmOH0iJrbxN2Dix4fH2XuYOvIbEC42/FiVVjPwnlhe8vA9
         RUMMDOwmYbcEzquVReGJUmR9hCPSfsy3BSR1hAIYsMIA1XNQhACYvGVFUzHCHuIsFubW
         3rLA==
X-Gm-Message-State: AOAM533k2VC2b9KqFcv9uWLBSRpNpZA4xDspVibLFCm43RsQDxm2Qncx
        QhXQUrh9xAmt8GkrwpCq2tpWOg==
X-Google-Smtp-Source: ABdhPJxyz8wed5e9lJ191A1Sw4zknkZdq0E6LTsECxkZVJ5Wcllj8LVVRVx/s+8UcU0o7+aWqpzimw==
X-Received: by 2002:a17:907:7b9e:: with SMTP id ne30mr5200109ejc.531.1635158013466;
        Mon, 25 Oct 2021 03:33:33 -0700 (PDT)
Received: from localhost.localdomain (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id k23sm8562822edv.22.2021.10.25.03.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 03:33:33 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v1 1/2] media: dt-bindings: media: camss: sdm845: Make clock-lanes property const
Date:   Mon, 25 Oct 2021 12:33:21 +0200
Message-Id: <20211025103322.160913-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mistakenly only one out of four CSI ports had the clock-lane marked as
const.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../devicetree/bindings/media/qcom,sdm845-camss.yaml     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 9ca5dfa7f226..d8fb6ce1d7f9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -106,7 +106,8 @@ properties:
 
             properties:
               clock-lanes:
-                maxItems: 1
+                items:
+                  - const: 7
 
               data-lanes:
                 minItems: 1
@@ -153,7 +154,8 @@ properties:
 
             properties:
               clock-lanes:
-                maxItems: 1
+                items:
+                  - const: 7
 
               data-lanes:
                 minItems: 1
@@ -176,7 +178,8 @@ properties:
 
             properties:
               clock-lanes:
-                maxItems: 1
+                items:
+                  - const: 7
 
               data-lanes:
                 minItems: 1
-- 
2.30.2

