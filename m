Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C534756A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 11:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241737AbhLOKnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 05:43:23 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:48602 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236702AbhLOKnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 05:43:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 90F3121124;
        Wed, 15 Dec 2021 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639565001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+kQdM6nPh1pICGYpuGaXXrT6kjEe/tV5JNxY/mG9S1M=;
        b=gL1zaJdMR3tjJltMspFa9wmVLHBXBCLskLykz1BOXgiJG8Z+DvZJZbRF3jbBUHNIS8maNb
        fGFTZL30CkGETgOPRdXexROdB7nZlehxZUt06G/674VJ1Hta11Doi4qJka64xVA7DeKCT2
        YAqTp2WGiuQG4rXjUJfd5O8TXkbLA9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639565001;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+kQdM6nPh1pICGYpuGaXXrT6kjEe/tV5JNxY/mG9S1M=;
        b=afp3Mg1BHkqNp3fChQUHu9yRLd26cNFId56q01DWf1DFoxzVbB8K2S2Hl6m+bYCR5S4aBt
        58ooVA8OYoKDlADw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 49A7113FC5;
        Wed, 15 Dec 2021 10:43:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id oJMBEcnGuWH1eAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 10:43:21 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     mripard@kernel.org, maarten.lankhorst@linux.intel.com,
        airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/5] drm/dp_mst: Remove trailing whitespace.
Date:   Wed, 15 Dec 2021 11:43:13 +0100
Message-Id: <20211215104318.18866-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215104318.18866-1-tzimmermann@suse.de>
References: <20211215104318.18866-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix coding style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index f3d79eda94bb..7f0ff96261cf 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4811,7 +4811,7 @@ static void drm_dp_mst_dump_mstb(struct seq_file *m,
 
 	seq_printf(m, "%smstb - [%p]: num_ports: %d\n", prefix, mstb, mstb->num_ports);
 	list_for_each_entry(port, &mstb->ports, next) {
-		seq_printf(m, "%sport %d - [%p] (%s - %s): ddps: %d, ldps: %d, sdp: %d/%d, fec: %s, conn: %p\n", 
+		seq_printf(m, "%sport %d - [%p] (%s - %s): ddps: %d, ldps: %d, sdp: %d/%d, fec: %s, conn: %p\n",
 			   prefix,
 			   port->port_num,
 			   port,
-- 
2.34.1

