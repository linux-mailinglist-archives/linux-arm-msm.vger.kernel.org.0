Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4827D11F11C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2019 10:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfLNJYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Dec 2019 04:24:37 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7242 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725883AbfLNJYh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Dec 2019 04:24:37 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 789BE513A76B2BD7BFE2;
        Sat, 14 Dec 2019 17:24:35 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sat, 14 Dec 2019
 17:24:28 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 0/4] drm/msm: Remove unneeded semicolon
Date:   Sat, 14 Dec 2019 17:31:46 +0800
Message-ID: <1576315910-124558-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

zhengbin (4):
  drm/msm/hdmi: Remove unneeded semicolon
  drm/msm/mdp5: Remove unneeded semicolon
  drm/msm/dpu: Remove unneeded semicolon in dpu_plane.c
  drm/msm/dpu: Remove unneeded semicolon in dpu_encoder.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c    | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

--
2.7.4

