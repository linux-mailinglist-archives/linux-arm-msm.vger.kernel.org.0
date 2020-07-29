Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9DF02316EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 02:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730864AbgG2AsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 20:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730871AbgG2AsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 20:48:12 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0A2C0619D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2020 17:48:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k27so13322310pgm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2020 17:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EfvldELvo7FLErlsWiPVmAKuN5/SSFt2LmTOBkch4kw=;
        b=xHJHTx9HefSaFKWD99K/a9Hxxsg14EZ0R7MjRerhC5HktfBA386qIt0TiPmveUYa8e
         Xh6QKnGdUkZODk+PZYNKQJ3Wy+8aaXe3dY7LIN9E/E/n74Aj4EKuRZlZqX8vZN6ddulD
         CjJsEJ65XjyBJK0HKWWo47QTOhKXHazH7/9M2ImseYflwXqDmFMuuzwFX7gy7mXHiADh
         +sMzlTGEtTqMsgz+/NwVxVEFfl8BVnhTmX8XbR2/CyfDRLLFWQiPo7F6aLNZF08vIYQF
         /KboZeV5uNNgsWP5UmnxJJaNvzeAwjjShKfH2lLlqzfFWsoQbF6xpIYUumE4rhxPQFDQ
         61gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EfvldELvo7FLErlsWiPVmAKuN5/SSFt2LmTOBkch4kw=;
        b=NV9edYUe8xaj2uc9EBRLe/s6FQdxMeZjzMOqqYgtUIeq3fdvyJNFwvDAJgvvBPJg1A
         OWGPa3nnwqu2jJCfL+xiuPqiHZw9ya85RcZweRycmJnc6uRtun9jrSaETEw2e/dcRVZM
         fn8T0OMHAhPDSQIUnf2TNNd+vmVLITZQ3S5njbKcnphBKSCOGonVv4m0PoM/RRuBQquR
         Lt3QRbFiTZqxZfdE2sQm6SRyBaxOyyyzVtyiR+4MeI2HtRzQ5ox1mpPK6DtPI+komfg0
         94GwuyXBzqt2EoXn4jcwdUEwFBdtkgHTtmSPTaHxdOb4JKC1rE7iFwM5uUTkSZEFb0D/
         dJJw==
X-Gm-Message-State: AOAM530eyIN1Oh4nUSycxiML+/d8i+Oz/E/QuD4bZjNuZiB5+EDj1M3z
        5qTeDwBcmpJpetYOdqAaWHn66A==
X-Google-Smtp-Source: ABdhPJytjlRHqA72yY0KPiWKOWc6Pn9lDKQnBeGMXjcmSmSP/8NoYvt4Jb6mHcI1wDmaqYEGo6JvaA==
X-Received: by 2002:aa7:9422:: with SMTP id y2mr27652112pfo.211.1595983691313;
        Tue, 28 Jul 2020 17:48:11 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q12sm239414pfg.135.2020.07.28.17.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 17:48:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: hwlock: qcom: Remove invalid binding
Date:   Tue, 28 Jul 2020 17:47:57 -0700
Message-Id: <20200729004757.1901107-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm hwlock is described in DeviceTree either directly on the
mmio bus or split between a syscon and a mutex node, but as noted in
[1] the latter is not valid DT, so remove any traces of this from the
binding.

[1] https://lore.kernel.org/r/CAL_JsqLa9GBtbgN6aL7AQ=A6V-YRtPgYqh6XgM2kpx532+r4Gg@mail.gmail.com/

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/hwlock/qcom-hwspinlock.yaml      | 25 +------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index 88f975837588..1c7149f7d171 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -25,37 +25,14 @@ properties:
   '#hwlock-cells':
     const: 1
 
-  syscon:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
-    description:
-      Should be a triple of phandle referencing the TCSR mutex syscon, offset
-      of first mutex within the syscon and stride between each mutex.
-
 required:
   - compatible
+  - reg
   - '#hwlock-cells'
 
-oneOf:
-  - required:
-    - reg
-  - required:
-    - syscon
-
 additionalProperties: false
 
 examples:
-  - |
-        tcsr_mutex_block: syscon@fd484000 {
-                compatible = "syscon";
-                reg = <0xfd484000 0x2000>;
-        };
-
-        hwlock {
-                compatible = "qcom,tcsr-mutex";
-                syscon = <&tcsr_mutex_block 0 0x80>;
-
-                #hwlock-cells = <1>;
-        };
   - |
         tcsr_mutex: hwlock@1f40000 {
                 compatible = "qcom,tcsr-mutex";
-- 
2.26.2

