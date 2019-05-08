Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3EE718138
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 22:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbfEHUnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 16:43:21 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35384 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfEHUnV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 16:43:21 -0400
Received: by mail-qt1-f195.google.com with SMTP id d20so63165qto.2;
        Wed, 08 May 2019 13:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+J13HW6Ql7AVbYnId9Z2QZkxRcrcMv8VFcAxxJspMsw=;
        b=Abfs+E+a4cAbjo09o779pV+bz6q5nWwGBguyKwYYWnn/uI2QSqGgTKRUiln2uIFM4N
         BxhZGcL32DSB0sABMxEh2Zyx9xLyS6KCXhx8yb8Pyd02t3omhPtoA8MnE+Xqm7T7MT6i
         nQ4Ylsu+rqXDfhkswcHo19S4L6P2spvTDF77/q2mM/mfb/Jijui9J32vAUGsreIeCbI3
         O51sIl4AKUcouILnErmLIu+DnT4NB4RZAxX5psIrrcst7vFExxmEFZlEfKVn+571TBbg
         rgyHJiberhayBRkWLXFMlYEkLExTx8pHba3zt0LLuW1i3t5FpoPrm8pfEdVCODbrVxe6
         aBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+J13HW6Ql7AVbYnId9Z2QZkxRcrcMv8VFcAxxJspMsw=;
        b=rzC+KbnGQ99ZVdh22cEE0FDFWixJIZVhKUFc/rq3gGMRueBxNAx182imOzdq638Cfh
         pIiFjCe0QLp8mdoSV1n6XasUZ4EOUxjK6/zBGGyT85L2PDomA5CDDcoLvA+hCZuPAel/
         LRcTImCf5oyn59ec4mbc76SNLpcTac79vHrN4dFHN1laptRix71DDTx5TIEph+PqLF8v
         GEe1qmVzSrDpd0cYhE/AoZ/U+8y4rXlRQlPBem9T1SLcA4ohqHkATYa5rGki0m259Dmt
         X9KZq8FU85nbzhETLla9F0mRVqv2ilXf0WB+MBoqu5dY8ud+KgVc0EoNbAlgj7Vbt/am
         FPEQ==
X-Gm-Message-State: APjAAAWQBu5V4AbR3+EaZ3pOIco/V0MAP7WTRDrkIUq6CHy+oNYpBHBk
        UvvUuREGkVg3O6Qa71JfqIw=
X-Google-Smtp-Source: APXvYqzC+uayIVCgj/sYsqvmOlwsBhYzG+/NFi8gvRxXMRCNTjLlbVy7CUTUTCX52sOI8QS8s2tB+w==
X-Received: by 2002:ac8:26e4:: with SMTP id 33mr57629qtp.388.1557348199900;
        Wed, 08 May 2019 13:43:19 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
        by smtp.gmail.com with ESMTPSA id x7sm18276qkc.22.2019.05.08.13.43.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 13:43:19 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jayant Shekhar <jshekhar@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: msm/disp: Introduce interconnect bindings for MDSS on SDM845
Date:   Wed,  8 May 2019 13:42:13 -0700
Message-Id: <20190508204219.31687-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508204219.31687-1-robdclark@gmail.com>
References: <20190508204219.31687-1-robdclark@gmail.com>
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

