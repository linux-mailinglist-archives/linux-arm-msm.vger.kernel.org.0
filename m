Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C01B425C4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 21:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244066AbhJGTld (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 15:41:33 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:60795 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233419AbhJGTlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 15:41:22 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 7D7F92B009FD;
        Thu,  7 Oct 2021 15:39:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 07 Oct 2021 15:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=q7lysNWY/y86+
        dax3X8W9SkKV4HyuolKzTejQgSxgQI=; b=KrMq1lAAXXvmaAUAnfz7lwERtfWaC
        1f2IWwAY+tHi+KdEXrpleIa9LNWT3eQXaGcn7sN63BYG9dF7qZGWzu0MiAosyDPb
        ce1QaGb12shmJzg72jLm9WHUP5Ny88S4+ONXEw8VYt8SlyyIq93asngRmT08P5aE
        aESn7yBinfKH5T58GU1fiIM1MAaxRWPHuQcgmk4EURXu7Td4JEf8+SywPK58l8Mr
        yGVbMvOgcWQcd36HoU49Rd7U+o8dSUCYzB2+jKPDBoEGh3hRAz+uLtDOTntT+Ytf
        gwvNhSWLto8+1ERwmf+sIef9XLA3AP9dFU/9QNXXKte69Q9Z2k0DGj6lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=q7lysNWY/y86+dax3X8W9SkKV4HyuolKzTejQgSxgQI=; b=anyH8xrh
        Cyy1FtBSxybtYyWFyaf1RqIyIKrKVFr4O59GjhxrGQP1mcJdtzT6q37scqcPWSxC
        libH/eClVWliiWIlcPX80gPN8mWp3zc43USRzhN76J6OjBnt5A7P1iHA84uHblhA
        v0kiPRmKK3Z0dnHk6vaXYmIp+63PVg3O8T25hILJ4DY3CwOXVyS0oE8QbcYqWi28
        Pv1XKrTr5JXD65D9vJHg6toMT0uxSc6PBmRJN3IeIW+C08sUfisp8YwGzvvSTYBW
        5K6qL6A7XpVBl+A4h9sRp6ZXzktcbdMRvSE7BJVsTBmjouq5dRMGJiV2agF96EBx
        vBZMzx9jpgabLQ==
X-ME-Sender: <xms:70xfYZV64G1o-RkvXO3g0BhYsRuHd_srNs4SD7YPG5VagRrX64Vj-Q>
    <xme:70xfYZkrCPZodCFuDCLjJL6xLZ9UOUD3-0oNNJ134tUrvVsTsbIaGrfdhMVZQN81Z
    DobPfRcIUgAw8OGxg>
X-ME-Received: <xmr:70xfYVZeEu90nLkdjPndZOgTo3bwGwgzhboomOj38CIdzAijM_KAQGw3tghYqIEVtGp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:70xfYcXavhvLWXsnQXEfviLBZqM3OZ1GwXn3Ub8Qt10CVk_f1J9xYQ>
    <xmx:70xfYTnorwh5JgS9s6uctCYzXURGXUA95iOrIUYuwN8lRa0O-n1PXg>
    <xmx:70xfYZey-8CNFk0EC8h-mJ_IJItm193yKAcs_FlagY9CR8O0qQI6uA>
    <xmx:70xfYcg2hKctP-_jFoEh1Jn3G_qywGHGiJmCkA86BU_M10X9dXJ-gwaqVlw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:39:24 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 20/20] drm: cleanup: remove acquire_ctx from drm_mode_config
Date:   Thu,  7 Oct 2021 21:37:55 +0200
Message-Id: <20211007193755.29579-21-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

---
 include/drm/drm_mode_config.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 48b7de80daf5..b214b07157f2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -383,16 +383,6 @@ struct drm_mode_config {
 	 */
 	struct drm_modeset_lock connection_mutex;
 
-	/**
-	 * @acquire_ctx:
-	 *
-	 * Global implicit acquire context used by atomic drivers for legacy
-	 * IOCTLs. Deprecated, since implicit locking contexts make it
-	 * impossible to use driver-private &struct drm_modeset_lock. Users of
-	 * this must hold @mutex.
-	 */
-	struct drm_modeset_acquire_ctx *acquire_ctx;
-
 	/**
 	 * @idr_mutex:
 	 *
-- 
2.33.0

