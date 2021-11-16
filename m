Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A51452AA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 07:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhKPG11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 01:27:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:58922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230266AbhKPG0u (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 01:26:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57E3461251;
        Tue, 16 Nov 2021 06:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637043833;
        bh=q2O1rifNDJeVJrPjt5gSWkeOt1x5Bq2Ty8Q5ZVN/76s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UbBcr9RmKDtULhlQy9i+ibCOP65PstvCzbPlwaOJnqfwWs+ksNQCqyHXucTCauni/
         kt2H1xYtLUNEEwDBeXWznQj6eF6ubm+YXQXQpuAhl0BogSSjOKYncnAIeax7ky8Npl
         BwPmE5bp+4ZY2VBQfY4/ZGQ2Ezz9Vtk8Goq8crmh0LCsQTtTkC6SNLWe0K88MroMnY
         OJKa29voKkqebSWtjOdLasmRbzeLjk4F3op/HTN47lODzXxYS6ThstMfNxiU34RK8J
         rGLAl/+ldQ9w0qixO1glNOxNtZVkeCptjUaacfsk5Oj71CNbYdY6PRzSybfMe6Ua2G
         URtFZCYkUKQdA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 08/13] drm/msm: Add missing structure documentation
Date:   Tue, 16 Nov 2021 11:52:51 +0530
Message-Id: <20211116062256.2417186-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116062256.2417186-1-vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Somehow documentation for dspp was missed, so add that

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index de7cb65bfc52..c4a588ad226e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -102,6 +102,7 @@ enum msm_event_wait {
  * @num_lm:       number of layer mixers used
  * @num_enc:      number of compression encoder blocks used
  * @num_intf:     number of interfaces the panel is mounted on
+ * @num_dspp:     number of dspp blocks used
  */
 struct msm_display_topology {
 	u32 num_lm;
-- 
2.31.1

