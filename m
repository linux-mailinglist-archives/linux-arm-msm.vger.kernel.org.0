Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A31077C84A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 13:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjJMLi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 07:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjJMLiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 07:38:16 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F14EB
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 04:38:12 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso2458702a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697197090; x=1697801890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBM6ErArjaeuBbIlwBAlMfcfi+6e43gtVVtakkQbEgY=;
        b=p7vYmdxCDJGkllT9nIQpuTbdSATNpXhRuP+D0NJRF2lA8r9fgZ6sgKSEhTKCXgcDHb
         q8eFjPLVdi902nGBPF/+eO8Gmj7fyc+n4fiTfLOm9oXrPCimFdCbKnqu8WrTgPUDRKZ8
         CjDP6gvStlblsBRAxzBXRmjzoJQ4n6paZGAq42p9d35DcDBEEkTy0vcM8zRsF3m9K8Z0
         Zg15AeKOZYaWV4qAoXw+OLEHRuvdoUQr17iRArCTI+y5MmnDJIWGOnnMn8XatkbR20BP
         g2XFtQCImTK/fMqWEP7fXfIq4CUHbKhadvmF7zmOI/kkCS/yQnsE/fLpmk6uaMQgVb1k
         pGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197090; x=1697801890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBM6ErArjaeuBbIlwBAlMfcfi+6e43gtVVtakkQbEgY=;
        b=v+laMX6B0HwX5QcthR1Vg3gW+Zvf2e8g26UwPO3s2ZWk+YiFQUKLjqJVMQBBEMS3VA
         ZnMx65UIS0SZSnJkY/Pw0J6kCQUeowVFdfa6pBOsrvyAl64cOGSc+/gAt+fNwWQ5CLL1
         XT5gF3kasI7U48HeUym+YUFWCkvTDFh8TbxaxuXEW6Z7Tv7uJODwwsEbLF4nUlg+4JxQ
         1CD5SuPdKCdjYOOpCKotD9Yt24i8OoBhk4uaSuXrDfeufOBqRB1XL4Q9EwqfRp5xfidD
         CJLflOb3QdyBefsHYSkMpYFwFFMzxNFPfphEcASD15vGpxdGpdFPneW0l2o0Jm01gzjX
         +2sQ==
X-Gm-Message-State: AOJu0Yzbf0eYBiNRsfi1rsjhfPqofXMuFO5ABhu94qPPuUtsnBISws/c
        6xCVSbpedKaulTTZyJJSnb/wlQ==
X-Google-Smtp-Source: AGHT+IFIQuOTBqkA/VtH+UNyX6Cij89eBw9xBU+Q+5BAlaKmA2QqSgfIirC7HlPFaFtT4FrqCHvdDg==
X-Received: by 2002:a05:6402:524b:b0:53e:2409:d6f3 with SMTP id t11-20020a056402524b00b0053e2409d6f3mr693039edd.6.1697197090667;
        Fri, 13 Oct 2023 04:38:10 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id v18-20020aa7d652000000b00533dad8a9c5sm11360772edr.38.2023.10.13.04.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 04:38:10 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 13 Oct 2023 13:38:07 +0200
Subject: [PATCH 3/3] dt-bindings: usb: fsa4480: Add compatible for OCP96011
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231013-fsa4480-swap-v1-3-b877f62046cc@fairphone.com>
References: <20231013-fsa4480-swap-v1-0-b877f62046cc@fairphone.com>
In-Reply-To: <20231013-fsa4480-swap-v1-0-b877f62046cc@fairphone.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Orient-Chip OCP96011 is generally compatible with the FSA4480, add a
compatible for it with the fallback on fsa4480.

However the AUX/SBU connections are expected to be swapped compared to
FSA4480, so document this in the data-lanes description.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index 86f6d633c2fb..f9410eb76a62 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -11,8 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fcs,fsa4480
+    oneOf:
+      - const: fcs,fsa4480
+      - items:
+          - enum:
+              - ocs,ocp96011
+          - const: fcs,fsa4480
 
   reg:
     maxItems: 1
@@ -53,16 +57,22 @@ properties:
                   - const: 0
                   - const: 1
                 description: |
-                  Default AUX/SBU layout
+                  Default AUX/SBU layout (FSA4480)
                   - AUX+ connected to SBU2
                   - AUX- connected to SBU1
+                  Default AUX/SBU layout (OCP96011)
+                  - AUX+ connected to SBU1
+                  - AUX- connected to SBU2
               - items:
                   - const: 1
                   - const: 0
                 description: |
-                  Swapped AUX/SBU layout
+                  Swapped AUX/SBU layout (FSA4480)
                   - AUX+ connected to SBU1
                   - AUX- connected to SBU2
+                  Swapped AUX/SBU layout (OCP96011)
+                  - AUX+ connected to SBU2
+                  - AUX- connected to SBU1
 
 required:
   - compatible

-- 
2.42.0

