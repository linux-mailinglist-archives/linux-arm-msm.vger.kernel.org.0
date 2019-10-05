Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E829ECC7DD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 06:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfJEE0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 00:26:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51720 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726327AbfJEE0r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 00:26:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2A4AB89BBE25790B73C1;
        Sat,  5 Oct 2019 12:26:45 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:37 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <jsanka@codeaurora.org>,
        <jcrouse@codeaurora.org>, <gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 0/6] drm/msm/dpu: Remove some set but not used variables
Date:   Sat, 5 Oct 2019 12:33:43 +0800
Message-ID: <1570250029-67639-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

zhengbin (6):
  drm/msm/dpu: Remove set but not used variable 'priv' in dpu_kms.c
  drm/msm/dpu: Remove set but not used variable 'priv' in
    dpu_encoder_phys_vid.c
  drm/msm/dpu: Remove set but not used variable 'priv' in dpu_core_irq.c
  drm/msm/dpu: Remove set but not used variables 'dpu_cstate','priv'
  drm/msm/dpu: Remove set but not used variables 'cmd_enc','priv'
  drm/msm/dpu: Remove set but not used variables 'mode','dpu_kms','priv'

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c         |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c        |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  7 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c              |  4 ----
 6 files changed, 32 deletions(-)

--
2.7.4

