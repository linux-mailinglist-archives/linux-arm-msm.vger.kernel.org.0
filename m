Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A2A21C05D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgGJXCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgGJXCr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:02:47 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA529C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x9so2853518plr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SOEifiIh+gw1ksCpw3+MdPsiCbOdQ0cDfgdVRKb9Csc=;
        b=k8zU2rjLwwu9xxH6CtqzfzziVe1vGy1bbnfaYS4aV6d8OBtTZkbwlSOJJvvmPXJbSR
         e+lH31NsyffijpPqmezQuKlLqrpVO65l/rRqLmPGfkCVwXEwRCH5bYRYw15DCh6yEcR+
         41eQMVmiDyHYBBVuEs5cYvgWCaYuLUL9AnpjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SOEifiIh+gw1ksCpw3+MdPsiCbOdQ0cDfgdVRKb9Csc=;
        b=eZT5LsleV1t4PRmyHkrj6hec0VW2XRBG8ngHoR5kyTWhogcWkHmD45a0LpgIO5tbJr
         ByvWuIFbuxZ7k8Q0+Af8UnzQPhoRTr6G/S7kkzqomIGp7sSriC0ra10fZkACOwTFL2v0
         Ewz7Z63Tks5PEpNzTgCfFBD+nC5mMxXo/iikCToh95AYFhq7FkWOsSmK4x990SQYNPts
         uXyrzPbBZucBywK14E5XVRfuoiV6xoxuWwe/G2ku95MLYJ6u2swFikc5wBME0wdu0fH2
         Le5YsFBV6cvD5QyZKks5kqy9+tJ7k4jXrRM9UG2CT38WnQacpVlxIwvC7c3iCP/06yI+
         9ung==
X-Gm-Message-State: AOAM531RmaujX5zX/TJDTHQ/9Stuu7MBjiNtnVgHUiR2ltiY0oN0Ijle
        wyoXSQbeI2kpYzdaAinoby7Ulg==
X-Google-Smtp-Source: ABdhPJzdSjyDJg2gb4e4NI73Cop7js70UClKGQIJKPQF33PAmLwF3oSqZOi78uGWEWIaJ81gbrnxfg==
X-Received: by 2002:a17:90a:cc:: with SMTP id v12mr7439843pjd.96.1594422167234;
        Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] dt-bindings: msm/dpu: Add simple-bus to dpu bindings
Date:   Fri, 10 Jul 2020 16:02:17 -0700
Message-Id: <20200710160131.2.Id4b5c92d28b7350d047218774afaf69b683651e0@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have a whole bunch of child devices that we really just want
treated as other devices to instantiate.  Add the "simple-bus"
property for this.

Commit-notes
This bindings file really needs to move over to yaml.  Hopefully
someone at Qualcomm who's working on display code can help with that.

Right now on Linux we have a manual call to of_platform_populate() to
populate our children.  That's pretty non-ideal as described in
another patch in this series and I'm trying to remove it.

I'm not sure how much of a hack to consider "simple-bus".  I've seen
it used like this before, but if folks tell me that it's terrible then
I guess we'll have to figure some other way out of our crazy
-EPROBE_DEFER loop in Linux.
END

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..b88269524365 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,9 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  One of:
+  - "qcom,sdm845-mdss", "simple-bus"
+  - "qcom,sc7180-mdss", "simple-bus"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
-- 
2.27.0.383.g050319c2ae-goog

