Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39824724C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 10:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbhLMJi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 04:38:29 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:37770 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234763AbhLMJgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 04:36:55 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6442C212B5;
        Mon, 13 Dec 2021 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639388214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+kQdM6nPh1pICGYpuGaXXrT6kjEe/tV5JNxY/mG9S1M=;
        b=Q4ozqc2d0W1g7jH42YQ5c+KiJP0Rjlwr9EkrwAQtf/MRXzWtMLja6CG2MkTmiFJQlYaaVI
        tWOh6aWacDPBcvKMbT/e18dwh6NENiqCUDXZpk1hmwZlgS3Uxy5aclOUYO3VO1hTOqdGJA
        klUBqBoWw+dbbQru+rtHc1Og28Yt16E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639388214;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+kQdM6nPh1pICGYpuGaXXrT6kjEe/tV5JNxY/mG9S1M=;
        b=1aqiEhqgU834wv2qODdIwnm3CQpaC2cxevvhqHcoC3XM6ypNzRWHtBD92KIGRYy0WCJccQ
        hUQi/5bj1tJUT7Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24E2C13CD4;
        Mon, 13 Dec 2021 09:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GIchCDYUt2E+JwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 13 Dec 2021 09:36:54 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     mripard@kernel.org, maarten.lankhorst@linux.intel.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] drm/dp_mst: Remove trailing whitespace.
Date:   Mon, 13 Dec 2021 10:36:48 +0100
Message-Id: <20211213093650.19598-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213093650.19598-1-tzimmermann@suse.de>
References: <20211213093650.19598-1-tzimmermann@suse.de>
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

