Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D0121C073
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgGJXDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgGJXCt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:02:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC1EC08E6DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k5so3230347pjg.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kf4bs78mZD6VPb7hGbMzwU1SDkoaJXih+VvUUu+oT8M=;
        b=SfhM9LjMFbCFHtzRBA4SYqf4zywNRWj3h+ZgZB00uTROQfzpfdrl4ryysqaf4tBwmn
         FN5/X0Iaz/Jv0JelCgSiqQCksM1Mtpd61VVkSa5kJaEzio+e8kAzYsbBZWtOdJnGC0IZ
         LJKsybrd4RMtUZ3XEr2Cn+AYmRcozOtq4sOtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kf4bs78mZD6VPb7hGbMzwU1SDkoaJXih+VvUUu+oT8M=;
        b=PxkCkZkOWt7NoCQtzppftEyeCvPVzktIX7MQagtBeWkWrCqgCQs1hKA6clBhlQ1bEH
         MNpm7n0t+4XicoFZVQ20tm+xz2vmVUdZZzN2lR/T0EGv1L4m6bIdO3a/Xyv0r2saDlCB
         gf+4gqoqbqtu35/Ifs+ZMecEugLpqd63A02PCNhksLmvvoZ4p5LRLL4EnZzjXkGKhZC3
         LYOhlIfklbxKmoBEMQAaSa1+ajrUl7/miwUI7NHDRz1CLVLNQNO+Fdaddzqjyj6hxY37
         DWhwadla61MjC+sW2EDb12CL96ZpaPmvA9FAElW4STnwjXpoezF3usAYfvWJsV1laNLH
         GHeA==
X-Gm-Message-State: AOAM530BTKpzUn7mJW0zj3E6TehKvLKS46BFjLbXtLmhreugsRUTEKrM
        1O3/anmrf9IYgBzcGy4/iraW/g==
X-Google-Smtp-Source: ABdhPJzXgkBIOOjHFIe0B/r5cwGP2/G1OFIlhiURScaD7ul10GXJnds6PU6GdJAicb/gntGJ5m6eTA==
X-Received: by 2002:a17:90a:e7cd:: with SMTP id kb13mr7950555pjb.138.1594422168452;
        Fri, 10 Jul 2020 16:02:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] dt-bindings: msm/mdp5: Add simple-bus to dpu bindings
Date:   Fri, 10 Jul 2020 16:02:18 -0700
Message-Id: <20200710160131.3.I823f3420d7c25300a58819ff03560ca4d41e53f6@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is just like the patch ("dt-bindings: msm/disp: Add simple-bus to
dpu bindings") but for the mdp5 bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 43d11279c925..bb57b07b7546 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -9,7 +9,7 @@ controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
 MDSS:
 Required properties:
 - compatible:
-  * "qcom,mdss" - MDSS
+  * "qcom,mdss", "simple-bus" - MDSS
 - reg: Physical base address and length of the controller's registers.
 - reg-names: The names of register regions. The following regions are required:
   * "mdss_phys"
-- 
2.27.0.383.g050319c2ae-goog

