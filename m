Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED8A4558F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 11:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245558AbhKRKYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 05:24:31 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:37061 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245669AbhKRKXt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 05:23:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637230848; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=IZjEllqo6n47DAYww29d+F19ZT/j/62I0q57hpvPRmQ=; b=ay7Rk9047rWWbKhU90Ly72v2CXstyu+LJltQ1xZJK3ml91ef1DoI3RldobFcKgjHgqxX+WHP
 TGDytyyl4b6Misfo9UDSb8WMrvrlaYll+izD3Y1U8A39Ncw/Vw+VtoktqPa3rASFgYdwxOfz
 7tHxm3ZKYVBnsX2ns/FSsaYF+js=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61962900665450d43ab8988a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 10:20:48
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7C383C43460; Thu, 18 Nov 2021 10:20:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5789C4360C;
        Thu, 18 Nov 2021 10:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C5789C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/msm: Fix null ptr access msm_ioctl_gem_submit()
Date:   Thu, 18 Nov 2021 15:50:30 +0530
Message-Id: <20211118154903.2.I3ae019673a0cc45d83a193a7858748dd03dbb820@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20211118154903.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
References: <20211118154903.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the below null pointer dereference in msm_ioctl_gem_submit():

 26545.260705:   Call trace:
 26545.263223:    kref_put+0x1c/0x60
 26545.266452:    msm_ioctl_gem_submit+0x254/0x744
 26545.270937:    drm_ioctl_kernel+0xa8/0x124
 26545.274976:    drm_ioctl+0x21c/0x33c
 26545.278478:    drm_compat_ioctl+0xdc/0xf0
 26545.282428:    __arm64_compat_sys_ioctl+0xc8/0x100
 26545.287169:    el0_svc_common+0xf8/0x250
 26545.291025:    do_el0_svc_compat+0x28/0x54
 26545.295066:    el0_svc_compat+0x10/0x1c
 26545.298838:    el0_sync_compat_handler+0xa8/0xcc
 26545.303403:    el0_sync_compat+0x188/0x1c0
 26545.307445:   Code: d503201f d503201f 52800028 4b0803e8 (b8680008)
 26545.318799:   Kernel panic - not syncing: Oops: Fatal exception

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_gem_submit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 151d19e..bf95b81 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -780,6 +780,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		args->nr_cmds);
 	if (IS_ERR(submit)) {
 		ret = PTR_ERR(submit);
+		submit = NULL;
 		goto out_unlock;
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

