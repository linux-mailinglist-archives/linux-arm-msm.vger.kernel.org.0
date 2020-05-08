Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F151CBB04
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 00:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgEHW7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 18:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728279AbgEHW7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 18:59:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6D5C05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 15:59:23 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id a4so1557798pgc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vsTJfgywY7Yh1c9SFAQgkpGdzTCsAoe2msx951M+8gg=;
        b=n9+oTteokcsg2gGmnR4zRXRtCjsq5CrG2/r4VvKp5PLRS6msCbvUx5BSWg8VI7PfNH
         fzOsZRW3n3BzVqfaRQEfeYZ0ExlYzMI38EGyARXFt1+uLUQiP9Ay33UhJpvbrHKTotIb
         LxOQG9/Gg5iz7YwU/lMlQXNVEpWwfcZUhnxWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vsTJfgywY7Yh1c9SFAQgkpGdzTCsAoe2msx951M+8gg=;
        b=cS0P6m65N3cxY3bVA30Pg3G+MJGiSEvl6NZPY1cCRkp9rq+0l1wvv1cE4FehYkhOAE
         02pL14FULnVKcq51/EcP31zfraisA1E1Aj20sKU8U/+/Afd+DdAjNRBK9sKnyqrBp86Q
         JocwxUzTq4QpANg/92xlHnHx8hp0edPhJNBnAT23fBe5dsr1Hb7ajoXjJtYk2HCl1Poy
         +8X/cpj1ebUJGwPHdrL1D2NSqTjVchvOz3D6vTWPpl98kSodWB1TxjtBSmitAO91ASB2
         DAYJCRRwLwwKB2hLSwBxMGiEQamreDdHanr8TrvbMvCrGj9IBSuuv9SyngzCawslFXzC
         uO4g==
X-Gm-Message-State: AGi0PuasDpXB0cCiIWBobHI0p6zqUjlYIRKCQfNhbMoAb/qgPjlLIqMI
        XL29s6LnmaepfhQXnFmAYOXbcQ==
X-Google-Smtp-Source: APiQypLZztC92CaipNrfEO6dJof+q2mxxAWh+ZlB67X3GIWQuimnyFCwmWlKu1p11C9clTK29MCtRg==
X-Received: by 2002:a62:780b:: with SMTP id t11mr5202971pfc.196.1588978763500;
        Fri, 08 May 2020 15:59:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i72sm3062874pfe.104.2020.05.08.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 15:59:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: display: simple: Add BOE NV133FHM-N62
Date:   Fri,  8 May 2020 15:59:01 -0700
Message-Id: <20200508155859.2.I37c879ef4ec6d4028a3d45728bc3a58060bba175@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This panel appears to be the same or nearly the same as the BOE
NV133FHM-N61, but since (in the very least) it identifies itself as a
different model in the EDID we should add a new compatible string for
it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index fdd74d07f645..d6cca1479633 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -75,6 +75,8 @@ properties:
       - boe,nv101wxmn51
         # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
       - boe,nv133fhm-n61
+        # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv133fhm-n62
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
         # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
-- 
2.26.2.645.ge9eca65c58-goog

