Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C396C41AFEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 15:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240945AbhI1NVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 09:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240952AbhI1NVv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 09:21:51 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF5DC06176A;
        Tue, 28 Sep 2021 06:20:11 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id g184so21179852pgc.6;
        Tue, 28 Sep 2021 06:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skXS9FAAmXWjWTOfJ7iolwq9Ls6y2YQYKSTYxiYgvoU=;
        b=i6WMO8Sh7rRGOyKHKsCDYxJpraDsM/kfqTc2vdZyuidM9YA55oyyKotHO70yVyvMNr
         zfEo8uy9rNi+jiC28DdsNNegAVjlUSFMl5hvRNfh09lKoPLvo38vrtGcCREtCXv8lEz3
         wOL69Fg6t9l25gN29igh5ATaQJC1Q10og2MIg4TexqD8pKqO9Sze06F4H7HADdOVIPWn
         afFtbXYXaQEtYKyPwi7hb+A1r5hjjmNhDvwMgRW6l7v03awBZecb9Pn73vU4k2I5v6Ly
         zuDRQbG0gWzPBtBfMyz2JqjpeqWc9S1mvPW6mv3pnrhMfpqY5B+w4qBxKhaVINQ5SCbL
         TbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skXS9FAAmXWjWTOfJ7iolwq9Ls6y2YQYKSTYxiYgvoU=;
        b=Dt39eoHpBM+binaRucJijeBHsq5z0WTP28asLlitCKG9OOYeFxpdRjak3wMI8dddDr
         smTjUI+P++DuZ6QGXmnOtw+R6iHo2JAnkcfXItealkYmCtHsZUXSjie70PRIBYCPe53Z
         +cYA5UbQ5I8MXHMEcyA52lgkf7KP4Yt1bDnOiW8vu2HMwPC+yM6CY44ZgYL+3eGB5YaX
         IV/SnGAbFFO1Vp5c4gQEg9o2O+CyFOM1+f6WAW9NmXBK7sfNZ1QqVQ6y1zYFKS+qXPKG
         +CfML+9BOHhq32wOh66KMGOqszbrl1fXI4OjKhhnecOqCYgZ1H9762uJC1lNbBAaK+kI
         KMIA==
X-Gm-Message-State: AOAM532XpF4Lom1JFqeS5r5SChL6NU7dM4JV9njuEzbC2KcCd4FlxzZ5
        UKANHP/FNs/bYAVCe6PFnOD7gsRMLIt+XV/fJBQ=
X-Google-Smtp-Source: ABdhPJyAcqBb1eBhinIUc+8FjDCCzm4doSh4iuL5aND31CFGPvloAiVi5tdj6bffjArxki064WG1aA==
X-Received: by 2002:a65:6ab0:: with SMTP id x16mr4585175pgu.181.1632835211234;
        Tue, 28 Sep 2021 06:20:11 -0700 (PDT)
Received: from skynet-linux.local ([122.162.197.175])
        by smtp.googlemail.com with ESMTPSA id h13sm22063964pgf.14.2021.09.28.06.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:20:10 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Subject: [PATCH v3 1/3] dt-bindings: msm: dsi: Add MSM8953 dsi phy
Date:   Tue, 28 Sep 2021 18:49:27 +0530
Message-Id: <20210928131929.18567-2-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928131929.18567-1-sireeshkodali1@gmail.com>
References: <20210928131929.18567-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SoCs based on the MSM8953 platform use the 14nm DSI PHY driver

Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 064df50e21a5..81dbee4803c0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-14nm
       - qcom,dsi-phy-14nm-660
+      - qcom,dsi-phy-14nm-8953
 
   reg:
     items:
-- 
2.33.0

