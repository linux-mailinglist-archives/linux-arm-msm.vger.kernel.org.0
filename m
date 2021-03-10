Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683E0333D5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhCJNKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:10:05 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:44182 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbhCJNJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:09:34 -0500
Received: by mail-lf1-f47.google.com with SMTP id p21so33288567lfu.11;
        Wed, 10 Mar 2021 05:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bf+v8v6mu/hLqpY/xWd3Ek+dsa2dTE4nd540kWu2j5c=;
        b=XRxLQk7PspS2kPjxpiLKYCLVP/qKwC4k0oyZorjA1jV26v8mcsU9q2Wi3IHbk+RDJH
         n8y1WDkfpV3/PIPduBXpz3mLnrRQScmLLrJ0e5pGN7lslVTj59kY48VOzZ0SmPANRaie
         mwya5zLicOlrLJl7zoirb//oHbQockUaZ8GQgAjUyhI1dBUsB5NAuXXZ+sMJyJbhN9xc
         dHZgBJ0aXZjZAI8IyV214zDWLZenm2Wa4AxfyzVdAsVX3XkqC4ZhojROnt7OXAdTcihh
         x/zEZlKtu2J3zrCFk4tLci6Oqk/skrSkw1AN4//mcLnMZahDl4dRb8a7x5cNYEThxHzG
         LBHw==
X-Gm-Message-State: AOAM530O2YoGO+I67Kdi4BBzFihcYwDPxzLuEBgaor8XKjwpwxTBYJ13
        QzpVinIWc9EchPOv5OsJgXM=
X-Google-Smtp-Source: ABdhPJxXF59JJoGHGJagijMcMqFlIKTHk6tUObWKR6SsLJFNFu0aEZxcHbnO9kL7EbGy/Ps9qQnMwA==
X-Received: by 2002:ac2:5e27:: with SMTP id o7mr1953504lfg.371.1615381773116;
        Wed, 10 Mar 2021 05:09:33 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id t142sm2864882lff.255.2021.03.10.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:09:32 -0800 (PST)
Date:   Wed, 10 Mar 2021 15:09:26 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 5/7] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Message-ID: <2ad797a4948a4580e0726c14d139e751d228b804.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

BD9576MUF provides over-current protection and detection. Current is
measured as voltage loss over external FET. Allow specifying FET's on
resistance so current monitoring limits can be converted to voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
index b6515a0cee62..9c119c1b1904 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
@@ -27,6 +27,11 @@ patternProperties:
       Properties for single regulator.
     $ref: "regulator.yaml#"
 
+    properties:
+      rohm,ocw-fet-ron-micro-ohms:
+      description: External FET's ON-resistance. Required if VoutS1 OCP/OCW is
+        to be set.
+
     required:
       - regulator-name
 
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
