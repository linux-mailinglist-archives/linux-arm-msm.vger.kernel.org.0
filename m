Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BD741E0EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 20:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348994AbhI3SVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 14:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349371AbhI3SVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 14:21:09 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342CEC061770
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:19:25 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id e66-20020a9d2ac8000000b0054da8bdf2aeso6241326otb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+i3Hpuj5DWyGD+byaVbyqbrajvj21zbxepyMvzvhl+o=;
        b=Mbb30YK1RDVjc5EhL0k7FsEfYAyU9MMKl40UwymGuRCKl8Ofgos0ZS1iG15WrKpXLi
         G2XweJZxOWUr9h19Ir1iIRk3MtzNrMpBtsYu3iCt618A784qWNdFGU6N+lruxSE36oji
         CQjH9biwDwMicKW7ZZLas5BllttEJ3U3tybqnBTICr3znG9x9z62m7gUXqYfnovotkL2
         HMkvaYN7XZKB2dcIkxsvx9rz7q2nQtSWiVebt00E5Nvyzzm7m3VRJaZMWYLWb9F+n1MO
         LO+laMNZjJDOnJ1vnEq+R3tpAmXAPSGg4SOr1usB2+KLaMB4pAJj52AweM1uARq/I5pY
         DpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+i3Hpuj5DWyGD+byaVbyqbrajvj21zbxepyMvzvhl+o=;
        b=7iz21Af0MJYnDr33pc/btMMwSx2DvsWuKUu2fe67cSrwAc6mnrhTIqqMBhamElpAsR
         DqhhwSRyGGgYRM2Ri5cIb5NN0bFOLzArSKNUJVGLfPjW/ZGY62w8yybZIRl4gwiYeKKO
         V56UrKwA6TIZ41gjTtUBFrXSMOx6NX+/nR1a2Whx0qZZvacJRWY4O31PDTxDlPis0Osj
         dLUSZggjAjDYqc+FS62jP3SuXAXGxKwffZ9O0yzKNXo9VyXjzhcSJjhr6/IRevYAZKSQ
         setTPRRTN8lQ5l0KE9Ep8gXrJgUV5euH6uHMUZf2G+Z/1hML4ZPEGZH24wa+c6qy2Uj4
         L1eg==
X-Gm-Message-State: AOAM5333LrC4xDisDQyM6KKVBKin89/F+LAGUw+yQsZAJZ/W3b1C5t5c
        8qFs6HM0wyeuWSIpwJhNytCtwg==
X-Google-Smtp-Source: ABdhPJyj6JIbGONbv+B4qS/JI1a9zg/1qkSmDFplVqbsyTD9Q/8A//mOcE1jHm1IEkvTmKkbYl7bag==
X-Received: by 2002:a05:6830:4411:: with SMTP id q17mr6248039otv.67.1633025964474;
        Thu, 30 Sep 2021 11:19:24 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k6sm727416otf.80.2021.09.30.11.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 11:19:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH v2 1/4] dt-bindings: sram: Document qcom,rpm-msg-ram
Date:   Thu, 30 Sep 2021 11:21:08 -0700
Message-Id: <20210930182111.57353-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930182111.57353-1-bjorn.andersson@linaro.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SMEM binding always depended on a reference to a SRAM node
of compatible "qcom,rpm-msg-ram", document this as part of the SRAM
binding.

The SRAM is consumed as a whole and not split up using subnodes, so
properties related to this are not required.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch, to resolve issue with the existing qcom,smem example

 Documentation/devicetree/bindings/sram/sram.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 3eda5049d183..e3311b54db33 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -31,6 +31,7 @@ properties:
         - amlogic,meson-gxbb-sram
         - arm,juno-sram-ns
         - atmel,sama5d2-securam
+        - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
 
   reg:
@@ -135,7 +136,9 @@ if:
   properties:
     compatible:
       contains:
-        const: rockchip,rk3288-pmu-sram
+        enum:
+          - qcom,rpm-msg-ram
+          - rockchip,rk3288-pmu-sram
 
 else:
   required:
-- 
2.29.2

