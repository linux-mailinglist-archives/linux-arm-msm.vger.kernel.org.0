Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC17D20F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 08:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732926AbfJJGsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 02:48:07 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56552 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732759AbfJJGsH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 02:48:07 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 68E07F745D4B8C299010;
        Thu, 10 Oct 2019 14:48:02 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:55 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
        <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 0/4] drm/msm: Remove four set but not used variables
Date:   Thu, 10 Oct 2019 14:55:02 +0800
Message-ID: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
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
  drm/msm/mdp5: Remove set but not used variable 'fmt'
  drm/msm/mdp5: Remove set but not used variable 'hw_cfg' in blend_setup
  drm/msm/dsi: Remove set but not used variable 'lpx'
  drm/msm/dsi: Remove set but not used variable 'lp'

 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c  | 2 --
 drivers/gpu/drm/msm/dsi/dsi_host.c        | 3 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     | 6 ++----
 4 files changed, 3 insertions(+), 11 deletions(-)

--
2.7.4

