Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66BAF1460F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 04:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgAWDdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 22:33:37 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:47400 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726968AbgAWDdh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 22:33:37 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2086EF4ECCCD3E17BF0F;
        Thu, 23 Jan 2020 11:33:35 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 Jan 2020
 11:33:25 +0800
From:   Zheng Bin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 0/4] drm/msm/dpu: fix comparing pointer to 0
Date:   Thu, 23 Jan 2020 11:40:39 +0800
Message-ID: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Zheng Bin (4):
  drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_cmd.c
  drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_vid.c
  drm/msm/dpu: fix comparing pointer to 0 in dpu_vbif.c
  drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c             |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

--
2.7.4

