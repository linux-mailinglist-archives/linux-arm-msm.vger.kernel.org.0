Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8324ABBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbfFRUZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:25:26 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44547 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfFRUZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:25:25 -0400
Received: by mail-qk1-f194.google.com with SMTP id p144so9435086qke.11;
        Tue, 18 Jun 2019 13:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+J13HW6Ql7AVbYnId9Z2QZkxRcrcMv8VFcAxxJspMsw=;
        b=m+HxYuSmzA49hIX2C0R/5k+lHUKTIv1oK6hQCco3oEPOdHPlkqevF72yM+yYin7kua
         QzrAxnvVqHxxjWLAbb3t56f7b8EC4dkXbCIx7AOuMRYf+gQzgU0FA42UoJ/BddGOIWrU
         XYBbLaRsmrdKpe9RwQ72o0TKKEZOTT5cAZM5o9kzYniijBjFp3F+SKk3x/Istrhyf0OC
         bazZli+kqlvHDv4zh3JqtKHnNb364yPF7y5OQawsRysIarus7HGQ44iLbukMiA47Kxoy
         wGCux6njKAkW+nCyx9U1Oab1OGdGexPnBZHE65mwdTKY+/LAo0cKGdUQExLg+s7ck9gH
         BPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+J13HW6Ql7AVbYnId9Z2QZkxRcrcMv8VFcAxxJspMsw=;
        b=XTYCNFqU7xy/JRtdbLTT4MsGPzvy0PhBMCEyStyWlG4CD7gb+njpkHS17/IGv6vcoz
         8MIaSbNDM6YY8QJwgVoHXkJDks0NksUxR24Hvi67BqxsCE7MI233jW45FdIdXaoovgKk
         +OCyPFLR7NXzs61Pqe1zg1VMKAcJfrD2SuOkoEqKWCR7m0biW+lwwqJ/FpcpoynzxC0w
         FBmSoDsBhfdXh2cQMbqTCHk5PX5vr6t73/KNJDtHEQLc4PYaTBnOye0tvqEHKUqRjMpN
         zI1VWZ8DmEajghjclZEk0sG+5OEberWe9vx9NYXdYvGNsXEfDW+TIO+xcw5waFDbh0sg
         91Hg==
X-Gm-Message-State: APjAAAVlxZsS4ByVuFrnSFtr9ANsM0AzTTM1O/gzYrDbx71b9GSpVaUa
        PuyLKLtIJnzaZpXSZC3h6D4=
X-Google-Smtp-Source: APXvYqxNDvLChkQUBiXIko0dDMbNastU/9GEX6agttSnnnTf19sIWCx8uUHQaJTRlVcJjODqD+0iUg==
X-Received: by 2002:a05:620a:10b2:: with SMTP id h18mr30836066qkk.14.1560889524900;
        Tue, 18 Jun 2019 13:25:24 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id r17sm9594246qtf.26.2019.06.18.13.25.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 13:25:24 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: msm/disp: Introduce interconnect bindings for MDSS on SDM845
Date:   Tue, 18 Jun 2019 13:24:11 -0700
Message-Id: <20190618202425.15259-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618202425.15259-1-robdclark@gmail.com>
References: <20190618202425.15259-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jayant Shekhar <jshekhar@codeaurora.org>

Add interconnect properties such as interconnect provider specifier
, the edge source and destination ports which are required by the
interconnect API to configure interconnect path for MDSS.

Changes in v2:
	- None

Changes in v3:
	- Remove common property definitions (Rob Herring)

Changes in v4:
	- Use port macros and change port string names (Georgi Djakov)

Changes in v5-v7:
	- None

Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index ad2e8830324e..a61dd40f3792 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -28,6 +28,11 @@ Required properties:
 - #address-cells: number of address cells for the MDSS children. Should be 1.
 - #size-cells: Should be 1.
 - ranges: parent bus address space is the same as the child bus address space.
+- interconnects : interconnect path specifier for MDSS according to
+  Documentation/devicetree/bindings/interconnect/interconnect.txt. Should be
+  2 paths corresponding to 2 AXI ports.
+- interconnect-names : MDSS will have 2 port names to differentiate between the
+  2 interconnect paths defined with interconnect specifier.
 
 Optional properties:
 - assigned-clocks: list of clock specifiers for clocks needing rate assignment
@@ -86,6 +91,11 @@ Example:
 		interrupt-controller;
 		#interrupt-cells = <1>;
 
+		interconnects = <&rsc_hlos MASTER_MDP0 &rsc_hlos SLAVE_EBI1>,
+				<&rsc_hlos MASTER_MDP1 &rsc_hlos SLAVE_EBI1>;
+
+		interconnect-names = "mdp0-mem", "mdp1-mem";
+
 		iommus = <&apps_iommu 0>;
 
 		#address-cells = <2>;
-- 
2.20.1

