Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D59F3D9BFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 05:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhG2DJE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 23:09:04 -0400
Received: from mail-m121142.qiye.163.com ([115.236.121.142]:26060 "EHLO
        mail-m121142.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233297AbhG2DJD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 23:09:03 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Jul 2021 23:09:03 EDT
Received: from ubuntu.localdomain (unknown [36.152.145.181])
        by mail-m121142.qiye.163.com (Hmail) with ESMTPA id 046D88013B;
        Thu, 29 Jul 2021 11:01:50 +0800 (CST)
From:   Guo Zhengkui <guozhengkui@vivo.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     abhinavk@codeaurora.org, dmitry.baryshkov@linaro.org,
        guozhengkui@vivo.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, trivial@kernel.org, kernel@vivo.com
Subject: [PATCH] drm/msm: remove a repeated including of <linux/debugfs.h>
Date:   Thu, 29 Jul 2021 11:01:40 +0800
Message-Id: <20210729030140.99500-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUIdSEhWSEIZHh8aQxgfHk
        lLVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OUk6MTo*AT9MLTkODBkJOi4r
        FRIaCVZVSlVKTUlMTklMTEpKQ0pPVTMWGhIXVRwOFAETHhUcEA4SOw0SDRRVGBQWRVlXWRILWUFZ
        SE1VSk5JVUpPTlVKQ0pZV1kIAVlBSkNKSjcG
X-HM-Tid: 0a7af0360a6fb037kuuu046d88013b
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove a repeated "#include <linux/debugfs.h>" in line 19 of the original
file.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index c92a9508c8d3..c22b07f68670 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -16,7 +16,6 @@
 #include <linux/delay.h>
 #include <linux/spinlock.h>
 #include <linux/ktime.h>
-#include <linux/debugfs.h>
 #include <linux/uaccess.h>
 #include <linux/dma-buf.h>
 #include <linux/slab.h>
-- 
2.17.1

