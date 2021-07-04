Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37D73BACE5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 13:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhGDL3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 07:29:51 -0400
Received: from [94.230.151.217] ([94.230.151.217]:55524 "EHLO ixit.cz"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhGDL3v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 07:29:51 -0400
Received: from [192.168.1.138] (unknown [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 14A2323B1D;
        Sun,  4 Jul 2021 13:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625398034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=oiwKbUAXbzsSS+rTV6o6Dk/jfUyfrsoams0wlxGmMmg=;
        b=R/zJUYBZoTfA/Zq2TPxQ9Uf0Xk3/yKSlV3iBPceAoyZRKQeaW63vVsJV6hEJPQRbO3b9GW
        swVaf8D5OatBAWB/NOvR7SSs0ZYvhUIUmIgrWnjPOFZ5gV/M95sypifd1ydbxtqQWgSL5G
        3rfqmtj8UItCg6fd3RiysO7U+XbogcU=
Date:   Sun, 04 Jul 2021 13:26:27 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: [bisected] "drm/msm/dsi: Move setup_encoder to modeset_init" breaks
 mdp4 on Nexus 7
To:     Sean Paul <seanpaul@chromium.org>, robdclark@gmail.com
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Message-Id: <34XPVQ.P1FNDWYZG4OM2@ixit.cz>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bisected to commit "drm/msm/dsi: Move setup_encoder to modeset_init" ( 
03436e3ec69c8e026224a5f172e5d0431f722305 )

Hello, since the commit, kernel fails to boot. Issue can be 
workarounded by reverting it (currently applied on top of 5.10 LTS), 
but it's not optimal.

Kernel 5.10
 - commit included - dmesg [1]
 - commit reverted - dmesg [2]

When occured, this commit causes NULL exception (excerpt):
...
[ 0.822291] msm 5100000.mdp: dummy supplies not allowed for exclusive 
requests
[ 0.839104] 8<--- cut here ---
[ 0.839145] Unable to handle kernel NULL pointer dereference at virtual 
address 00000000
...
[ 0.842164] [<c0840318>] (msm_dsi_manager_setup_encoder) from 
[<c083bed4>] (msm_dsi_modeset_init+0xa0/0x1d8)
[ 0.842215] r7:c2e44280 r6:00000000 r5:c2e4e000 r4:c2e3ca40
[ 0.842264] [<c083be34>] (msm_dsi_modeset_init) from [<c07df6b8>] 
(mdp4_kms_init+0x640/0x878)
[ 0.842312] r9:c2e4e000 r8:00000001 r7:c2e4e000 r6:c2e4e000 r5:00000006 
r4:c2e68000
[ 0.842363] [<c07df078>] (mdp4_kms_init) from [<c0819594>] 
(msm_drm_bind+0x348/0x5e0)
[ 0.842409] r10:00000002 r9:c2e4e800 r8:00000000 r7:00000000 
r6:c251e410 r5:c2e4e000
...

David

[1] https://paste.sr.ht/~okias/c5a8c329929d71b64b11bc1840770f180a6c2b7f
[2] https://paste.sr.ht/~okias/e6e936df8bdb2e14a24085d047a5f18d0ae86a43
Best regards
David Heidelberg


