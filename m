Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464F11444F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 20:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbgAUTTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 14:19:25 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44758 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgAUTTZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 14:19:25 -0500
Received: by mail-pf1-f196.google.com with SMTP id 62so1969055pfu.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 11:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aqRmMWrZ2O6AQaqMT6b2P7oahNOZhsaTo9RvQSMwDMk=;
        b=mo3JH4SseKHbVUnb9l+e/2t25z5zoMH0yyv2CYN61032Qsypr4/063jVln69dYTgFE
         NKdRgbhhDRJXhhyJ9xQodzx/Ph/j7H9lDZ/o1f+kDYviMVLkrCMfIgg01BTAL7wJe0TW
         W2pMcpMJNnkwDiA/67EHdMDhVEF6e60L20UEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aqRmMWrZ2O6AQaqMT6b2P7oahNOZhsaTo9RvQSMwDMk=;
        b=tGo9LbqrLJnMNo4EuhwDjOKJWaIkJPMDkIZ/dqGBIZgVMsnmu7dCwqc+tCIRvSfiD4
         M3t9njfCvAJEd3vIcf9Aj64h+fsxkab7lchXn12HgIdUIcJa/+UX+qbIFNcaom4H1UQU
         BsNTZIWnq3Z5tw34duF5W3Ogn9h1G80eRld0V5TxmJCtsf3QDIYb+CNnE/kY/c5d3ESl
         vQ3bkEsxVDffiUwUuhECt3sKSA6p8pMFA1vlKwS8h3+US14KlsaKQBPAZWoKREeU9Kai
         20PsspOXuM1nbhHf/EgRjKe+gYzGEKUH7ixi5fMMLL6Nl2eEjhgNvjE6uCQKLGG+0evB
         vCtQ==
X-Gm-Message-State: APjAAAX54K4qxEHrIybbOrTYiFzXleLUFGbGF/XH6CQ1lSTNvlDJE4A5
        jdYDu53QTh5RoLWywH25pE0r0w==
X-Google-Smtp-Source: APXvYqxYUXNBBxAHz3BQUbedFm4ESJRvljKeyTxsiakxKmCyPYaL8oztIYtPYLhvqyKKllweLSR2Mw==
X-Received: by 2002:a63:b50a:: with SMTP id y10mr7131998pge.104.1579634364327;
        Tue, 21 Jan 2020 11:19:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 2sm41606601pgo.79.2020.01.21.11.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 11:19:23 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     saiprakash.ranjan@codeaurora.org, mka@chromium.org,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [REPOST PATCH] drm/msm: Set dma maximum segment size for mdss
Date:   Tue, 21 Jan 2020 11:18:48 -0800
Message-Id: <20200121111813.REPOST.1.I92c66a35fb13f368095b05287bdabdbe88ca6922@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Turning on CONFIG_DMA_API_DEBUG_SG results in the following error:

[   12.078665] msm ae00000.mdss: DMA-API: mapping sg segment longer than device claims to support [len=3526656] [max=65536]
[   12.089870] WARNING: CPU: 6 PID: 334 at /mnt/host/source/src/third_party/kernel/v4.19/kernel/dma/debug.c:1301 debug_dma_map_sg+0x1dc/0x318
[   12.102655] Modules linked in: joydev
[   12.106442] CPU: 6 PID: 334 Comm: frecon Not tainted 4.19.0 #2
[   12.112450] Hardware name: Google Cheza (rev3+) (DT)
[   12.117566] pstate: 60400009 (nZCv daif +PAN -UAO)
[   12.122506] pc : debug_dma_map_sg+0x1dc/0x318
[   12.126995] lr : debug_dma_map_sg+0x1dc/0x318
[   12.131487] sp : ffffff800cc3ba80
[   12.134913] x29: ffffff800cc3ba80 x28: 0000000000000000
[   12.140395] x27: 0000000000000004 x26: 0000000000000004
[   12.145868] x25: ffffff8008e55b18 x24: 0000000000000000
[   12.151337] x23: 00000000ffffffff x22: ffffff800921c000
[   12.156809] x21: ffffffc0fa75b080 x20: ffffffc0f7195090
[   12.162280] x19: ffffffc0f1c53280 x18: 0000000000000000
[   12.167749] x17: 0000000000000000 x16: 0000000000000000
[   12.173218] x15: 0000000000000000 x14: 0720072007200720
[   12.178689] x13: 0720072007200720 x12: 0720072007200720
[   12.184161] x11: 0720072007200720 x10: 0720072007200720
[   12.189641] x9 : ffffffc0f1fc6b60 x8 : 0000000000000000
[   12.195110] x7 : ffffff8008132ce0 x6 : 0000000000000000
[   12.200585] x5 : 0000000000000000 x4 : ffffff8008134734
[   12.206058] x3 : ffffff800cc3b830 x2 : ffffffc0f1fc6240
[   12.211532] x1 : 25045a74f48a7400 x0 : 25045a74f48a7400
[   12.217006] Call trace:
[   12.219535]  debug_dma_map_sg+0x1dc/0x318
[   12.223671]  get_pages+0x19c/0x20c
[   12.227177]  msm_gem_fault+0x64/0xfc
[   12.230874]  __do_fault+0x3c/0x140
[   12.234383]  __handle_mm_fault+0x70c/0xdb8
[   12.238603]  handle_mm_fault+0xac/0xc4
[   12.242473]  do_page_fault+0x1bc/0x3d4
[   12.246342]  do_translation_fault+0x54/0x88
[   12.250652]  do_mem_abort+0x60/0xf0
[   12.254250]  el0_da+0x20/0x24
[   12.257317] irq event stamp: 67260
[   12.260828] hardirqs last  enabled at (67259): [<ffffff8008132d0c>] console_unlock+0x214/0x608
[   12.269693] hardirqs last disabled at (67260): [<ffffff8008080e0c>] do_debug_exception+0x5c/0x178
[   12.278820] softirqs last  enabled at (67256): [<ffffff8008081664>] __do_softirq+0x4d4/0x520
[   12.287510] softirqs last disabled at (67249): [<ffffff80080be574>] irq_exit+0xa8/0x100
[   12.295742] ---[ end trace e63cfc40c313ffab ]---

The root of the problem is that the default segment size for sgt is
(UINT_MAX & PAGE_MASK), and the default segment size for device dma is
64K. As such, if you compare the 2, you would deduce that the sg segment
will overflow the device's capacity. In reality, the hardware can
accommodate the larger sg segments, it's just not initializing its max
segment properly. This patch initializes the max segment size for the
mdss device, which gets rid of that pesky warning.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch has been floating in the ether for over a year [1].  I know
next to nothing about it, but I'm told it's still useful so I'm
helpfully reposting it.  Please enjoy.

[1] https://lore.kernel.org/r/20181106213239.52133-1-sean@poorly.run

 drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c26219c7a49f..e4b750b0c2d3 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -441,6 +441,14 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
+	if (!dev->dma_parms) {
+		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
+					      GFP_KERNEL);
+		if (!dev->dma_parms)
+			return -ENOMEM;
+	}
+	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
+
 	msm_gem_shrinker_init(ddev);
 
 	switch (get_mdp_ver(pdev)) {
-- 
2.25.0.341.g760bfbb309-goog

