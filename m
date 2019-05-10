Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C5B19C9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 13:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbfEJLaC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 07:30:02 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46261 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbfEJLaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 07:30:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id t187so2879986pgb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=Nowmg4pM+Rb20HCwqnrJE3ir4gOjFPzAF5fVDd2jYag=;
        b=DaU0WMI+essN/z0vje9uyYZ/QVRI5R7wBylNonZJ7l9TcmbGVfnnheCNpFi2rdH/fw
         mm6qF57JD4HFRZHe2mvxcPLnNjjZV2R4QENKZsyWst8gEEkfrIQPduttU4QnYPPQbio1
         y+Sm36/ksNcO6SplI1eUVlQuOG6OxE0lbRjzyL0VOj/S2+ifDUG96gEiHno20zUl+1c7
         qJzgJBWxT46RYiIyccb1qMZ6O0njE6CU/0Mg1N4AMlVJDP0Yve2guyuTSTh2FjVxt1na
         7MEx5uYwviLZCAey4uRmV3Fnc8hV3+jhM3Eq4LS+mryeP8WRwFR0SBhK9idMQNXTK+AG
         HePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=Nowmg4pM+Rb20HCwqnrJE3ir4gOjFPzAF5fVDd2jYag=;
        b=haoBes9GZhYyqaTi4wx8CHQ9GWXdGI6czj5LIj3Bzn6EZFmdkq4TZcmIAMHF1VfMoh
         QIoQhdIDcijnVAghBw+jAt+5yB7tjExQzDsvgo3MhNM9AjfWh/AWMdki0eS20vxeJLjO
         KazemMoEjPuzH3r6ANH4y7hq/Zj3Rb6VsOt6UvIjVofd2sfVIxLLv0h2qDxzRSszphoP
         dMjmzmwiB0s1bsjDnbQoasW0yixlN3JKPypWp37dL4/ek4kIX9u3fwYTZOjiNgcHErOA
         IM6ms1t4+AWXcND0yrQ5nsGyGfBnqs5diBUsaL+QMlFCuYTe5YASJ57bMswbWoXqhpq3
         0jkg==
X-Gm-Message-State: APjAAAUN5rAbiAE9Mj8W+yLG5SWkG14Eqn4QG4rtvZT09ufnQoTT5B1R
        M8UWnoYGYPcQQvnBWvL5xu3QUH0Oe0M=
X-Google-Smtp-Source: APXvYqz3aNdA7UVeHCg8AIz0RMXjZdXsJQmzSBKVmpxlKPs/GHjbdV6nMbG5/5VUHxpVMz6YT8nheg==
X-Received: by 2002:a62:87c6:: with SMTP id i189mr13483917pfe.65.1557487800962;
        Fri, 10 May 2019 04:30:00 -0700 (PDT)
Received: from localhost ([103.8.150.7])
        by smtp.gmail.com with ESMTPSA id 9sm5583081pgv.5.2019.05.10.04.29.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 04:30:00 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org
Subject: [PATCHv1 2/8] Documentation: arm: Link idle-states binding to code
Date:   Fri, 10 May 2019 16:59:40 +0530
Message-Id: <5f25e2b3096fa73f205e1797e355e049ed9f8c9c.1557486950.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The enable-method needs to be psci for the psci_cpuidle_ops to be
correctly registered.

Add a note to the binding documentation on where to find the declaration
of the enable-method since it is a macro and escapes any attempts to
grep for it.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/arm/idle-states.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 45730ba60af5..3a42335a6f3d 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -239,6 +239,10 @@ processor idle states, defined as device tree nodes, are listed.
 			# On ARM v8 64-bit this property is required and must
 			  be:
 			   - "psci"
+			     (This assumes that the enable-method is "psci"
+			     in the cpu node[6] that then uses the
+			     CPUIDLE_METHOD_OF_DECLARE macro to setup the
+			     psci_cpuidle_ops callbacks)
 			# On ARM 32-bit systems this property is optional
 
 The nodes describing the idle states (state) can only be defined within the
@@ -697,3 +701,6 @@ cpus {
 
 [5] Devicetree Specification
     https://www.devicetree.org/specifications/
+
+[6] ARM Linux Kernel documentation - Booting AArch64 Linux
+    Documentation/arm64/booting.txt
-- 
2.17.1

