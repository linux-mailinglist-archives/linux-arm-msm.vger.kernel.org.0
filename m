Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD5C10AD65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 11:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfK0KQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 05:16:14 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:64310 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbfK0KQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 05:16:14 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Nov 2019 15:46:11 +0530
IronPort-SDR: Qp494lQ+am4ylxGZ8MTvUKCSOUEOfZaZEJDAxZDOv7E88WehlZ/cFjIjgspwTSGMxbK2OOwb/s
 i+y0GQASfJlCr61kIYpVDRtyv1bAitIGVGC7nYQA6e35xfkd7ESYe3lXZtPdom7XBRhIz0dR1c
 baIqfYktoZFarl9JbaHYrKN/X8u6Tdrhx5Pjmi+ut+GvrvtvRohzoXZAIo6nU+7F1T5skt9+3S
 0bgGgLxbr46y51wo1KSGzRw55qI9sOorGOwEdOXUPWgwe/WjPNMcn9m7N1YCzDkzD5GnGYBh0J
 PVtN7Zg4DpiDAzAiZBjKpPed
Received: from dhar-linux.qualcomm.com ([10.204.66.25])
  by ironmsg02-blr.qualcomm.com with ESMTP; 27 Nov 2019 15:46:10 +0530
Received: by dhar-linux.qualcomm.com (Postfix, from userid 2306995)
        id 7652B3B5B; Wed, 27 Nov 2019 15:46:09 +0530 (IST)
From:   Shubhashree Dhar <dhar@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Shubhashree Dhar <dhar@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH] msm:disp:dpu1: Fix core clk rate in display driver
Date:   Wed, 27 Nov 2019 15:46:07 +0530
Message-Id: <1574849767-6376-1-git-send-email-dhar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix max core clk rate during dt parsing in display driver.

Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
index 27fbeb5..991fff1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
@@ -187,6 +187,7 @@ int msm_dss_parse_clock(struct platform_device *pdev,
 			continue;
 		mp->clk_config[i].rate = rate;
 		mp->clk_config[i].type = DSS_CLK_PCLK;
+		mp->clk_config[i].max_rate = rate;
 	}
 
 	mp->num_clk = num_clk;
-- 
1.9.1

