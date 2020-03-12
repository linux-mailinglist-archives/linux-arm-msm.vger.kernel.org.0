Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2FF182787
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 04:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730994AbgCLDwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 23:52:24 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37019 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730931AbgCLDwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 23:52:24 -0400
Received: by mail-qt1-f194.google.com with SMTP id l20so3325765qtp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 20:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KQg257bFU/54D8sZD22vQvVkmqU+8hmHZdOg7G3dJQ4=;
        b=TcIxJvpOUP/f+7MPbEGA4d+S0Zxx5fuLASCk1047vjuKQBiyWaRR7fJmmW637eBk5P
         DIi6ZuWmL6nfYbHDTybLBkrk9tEfPWYuonggc6wFzSEhPzNeh7PpC8OY8CshPSbQENl0
         ubbOVZ6pk39VI/sk6bwZXFCOq0nmi23wi1R4kODWy7JY8gwjyOiLyfPETafK/MxiRajH
         8IhtMhmffv1RXh3LysaVC4+PD1P8vMOuCBv9/vcRraqaJg4Chg0VeqX/MqtZ8/14yEgY
         i1dAcPpR326qbjxajTL33jt22gojvFa7P0rDJzjrHxSKePi3sNb0RsFiYRmdrxqgFkmB
         E24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=KQg257bFU/54D8sZD22vQvVkmqU+8hmHZdOg7G3dJQ4=;
        b=Ps4EgcRZiigDDU1z/U3QRicoKfejZVGZISDS+lzgN3PCZHIzrqa4E0IDYuxVXlEPRa
         /BuSGdHzvfpxGuP2jhr4/rVNHcJxGLNY98SA+kug6JXdRRkFotLWAIqeCPCDfE9Y9/YJ
         R/samNamNXhb8X0c+pIFfN3At3VDShBDMeJsMUZYmGVuf/fPH+qgjlyMtWn965lE8lU+
         KZi/q8PXI055CzOApcreISXjGv7GiQ5bvJzqUIjPDZKfScCkYfYy8V+LKyT6WjUubKjA
         qaTbxS/aRAfFZkz2Sp3b6hM1SNVbKXg2hxXT59ZQ3EiAVgHxC7I7ztFnP1WSpO9lXYep
         BCfA==
X-Gm-Message-State: ANhLgQ2uw4I86WUZ5T3Wfiwh9Cides+vYIAdVFHTDB3IGx8bgS8We3xU
        0cG7RLDXAwuFaI/pXqZWtUc=
X-Google-Smtp-Source: ADFU+vtj53M9tfsuivBLtWhYCrZBup+7hHZahjU3LIYwZDJagukCdl1qw81rCRN0nwK8SPWKPjAi3Q==
X-Received: by 2002:ac8:6708:: with SMTP id e8mr5484258qtp.229.1583985140745;
        Wed, 11 Mar 2020 20:52:20 -0700 (PDT)
Received: from athos.hellosponsor.com (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
        by smtp.gmail.com with ESMTPSA id x1sm7836250qkl.128.2020.03.11.20.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 20:52:20 -0700 (PDT)
From:   Ilia Mirkin <imirkin@alum.mit.edu>
To:     freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Cc:     Ilia Mirkin <imirkin@alum.mit.edu>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] drm/msm: avoid double-attaching hdmi/edp bridges
Date:   Wed, 11 Mar 2020 23:51:54 -0400
Message-Id: <20200312035154.1621-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each of hdmi and edp are already attached in msm_*_bridge_init. A second
attachment returns -EBUSY, failing the driver load.

Tested with HDMI on IFC6410 (APQ8064 / MDP4), but eDP case should be
analogous.

Fixes: 3ef2f119bd3ed (drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder)
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 drivers/gpu/drm/msm/edp/edp.c   | 4 ----
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
index ad4e963ccd9b..106a67473af5 100644
--- a/drivers/gpu/drm/msm/edp/edp.c
+++ b/drivers/gpu/drm/msm/edp/edp.c
@@ -178,10 +178,6 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
 		goto fail;
 	}
 
-	ret = drm_bridge_attach(encoder, edp->bridge, NULL);
-	if (ret)
-		goto fail;
-
 	priv->bridges[priv->num_bridges++]       = edp->bridge;
 	priv->connectors[priv->num_connectors++] = edp->connector;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 1a9b6289637d..737453b6e596 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -327,10 +327,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = drm_bridge_attach(encoder, hdmi->bridge, NULL);
-	if (ret)
-		goto fail;
-
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
 	priv->connectors[priv->num_connectors++] = hdmi->connector;
 
-- 
2.24.1

