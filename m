Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237C2333D4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhCJNIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:08:30 -0500
Received: from mail-lf1-f43.google.com ([209.85.167.43]:36401 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbhCJNIN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:08:13 -0500
Received: by mail-lf1-f43.google.com with SMTP id f1so33355024lfu.3;
        Wed, 10 Mar 2021 05:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KrANCoS0fCxeFOR+CSK04kMbdL9AaU/jYXkEl2MWB7Q=;
        b=Irdg9YtWxPOZpUTk8v6aI6CoHBawtE+BsG34Oh2/OWzlmrDTTbfMejFhHmxIx/1Sz+
         xr2PJz/XwXian+RZZQtjPmZHXH4hQZzaIBBPkEEeXwE5esbi6dQK2SNi5sNRIPnEnP+b
         44BXpNRjnWQHixTEE/uI7hvmelD9/i1MDltYkzUC+TzzOGfb6nUQir6lum/yghinsRy/
         YAms/7k7sebtJNlURgSSUbljdiMnsjzNkJ9dzTYq6fXi2dvqwWkkCcg2ifVYhFQtzdvw
         PD9m1X/GF6gjW88JukA0Br/0VWdbDc1LTB4oIFaIDXwNxazRpFX66AdkDEvcD/STJCIV
         zwyA==
X-Gm-Message-State: AOAM532zrA8wy+qgzsQZCSFSvBzhBtf9TTwVhZyYE3dE/DwvLOKTzBfg
        asMBH74f7mSWrVkDFzW2yJg=
X-Google-Smtp-Source: ABdhPJw94cPVW0Dg62i0SqOPGampwNMKErOs/XS2YPQK+DDeShi/3hC5lBmzU2hicdjZJAXiuz07+A==
X-Received: by 2002:a19:6557:: with SMTP id c23mr2067164lfj.422.1615381691418;
        Wed, 10 Mar 2021 05:08:11 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id k13sm2851156lfg.192.2021.03.10.05.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:08:10 -0800 (PST)
Date:   Wed, 10 Mar 2021 15:08:04 +0200
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
Subject: [RFC PATCH v2 1/7] dt_bindings: Add protection limit properties
Message-ID: <63a0101f2e9daf9c0f10f2b97a8468b108ce7d0b.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support specifying protection/error/warning limits for regulator
over current, over temperature and over/under voltage.

Most of the PMICs support only "protection" feature but few
setups do also support error/warning level indications.

On many ICs most of the protection limits can't actually be set.
But for example the ampere limit for over-current protection on ROHM
BD9576 can be configured - or feature can be completely disabled.

Provide limit setting for all protections/errors for the sake of
the completeness and do that using own properties for all so that
not all users would need to set all levels when only one or few are
supported.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../bindings/regulator/regulator.yaml         | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 6d0bc9cd4040..a6ae9ecae5cc 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -117,6 +117,88 @@ properties:
     description: Enable over current protection.
     type: boolean
 
+  regulator-oc-protection-microamp:
+    description: Set over current protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted.
+
+  regulator-oc-error-microamp:
+    description: Set over current error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested.
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted.
+
+  regulator-oc-warn-microamp:
+    description: Set over current warning limit. This is a limit where hardware
+      is assumed still to be functional but approaching limit where it gets
+      damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted.
+
+  regulator-ov-protection-microvolt:
+    description: Set over voltage protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted. Limit is given as microvolt offset from
+      voltage set to regulator.
+
+  regulator-ov-error-microvolt:
+    description: Set over voltage error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted. Limit
+      is given as microvolt offset from voltage set to regulator.
+
+  regulator-ov-warn-microvolt:
+    description: Set over voltage warning limit. This is a limit where hardware
+      is assumed still to be functional but approaching limit where it gets
+      damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted. Limit is given as microvolt
+      offset from voltage set to regulator.
+
+  regulator-uv-protection-microvolt:
+    description: Set over under voltage protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted. Limit is given as microvolt offset from
+      voltage set to regulator.
+
+  regulator-uv-error-microvolt:
+    description: Set under voltage error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted. Limit
+      is given as microvolt offset from voltage set to regulator.
+
+  regulator-uv-warn-microvolt:
+    description: Set over under voltage warning limit. This is a limit where
+      hardware is assumed still to be functional but approaching limit where
+      it gets damaged. Recovery actions should be initiated. Zero can be passed
+      to disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted. Limit is given as microvolt
+      offset from voltage set to regulator.
+
+  regulator-temp-protection-kelvin:
+    description: Set over temperature protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled but
+      limit setting can be omitted.
+
+  regulator-temp-error-kelvin:
+    description: Set over temperature error limit. This is a limit where part of
+      the hardware propably is malfunctional and damage prevention is requested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted.
+
+  regulator-temp-warn-kelvin:
+    description: Set over temperature warning limit. This is a limit where
+      hardware is assumed still to be functional but approaching limit where it
+      gets damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted.
+
   regulator-active-discharge:
     description: |
       tristate, enable/disable active discharge of regulators. The values are:
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
