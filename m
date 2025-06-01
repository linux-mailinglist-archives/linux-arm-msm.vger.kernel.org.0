Return-Path: <linux-arm-msm+bounces-60017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0CACA769
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 03:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66E4B189E60E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 01:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CD22BF13E;
	Sun,  1 Jun 2025 23:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/X/6KgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A882BF130;
	Sun,  1 Jun 2025 23:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821454; cv=none; b=RuRvAFNkkZY3QweOYN5OA3tMapse9gpf9T7rhjQ3c3CxE6av+fJgMC8sI+xJdZhqou7iQnavzz/MLkqHMd3P5Oo10SE8xxNDD2qqc/6NZKmaJwcoRGjg0bu57G5X+70eOvm86NnYz86oGvZbKsDInTC23t/qrxOHGGOlHL6/Zvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821454; c=relaxed/simple;
	bh=vWueuddw2ydzxwjiDWJvrd/T8za+hvHT6C4L+PEDBFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bH6OnYyh0tBwHax+gEsVv/tz/2ZSxC7LXQfrwv7nJ5vAGgpaupnmfBtoobfLpy5lUW9EtWS7Ya3koBfnWUlmkpTVX+LNxDG3AU81P/6SAxHfhiIjmmKqpPK+7JAQq3r+bhYQ0oF4Y2fh4CrKw7PV7SGoOMM1VkW2lZP6JyJFLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/X/6KgR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B028FC4CEE7;
	Sun,  1 Jun 2025 23:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821454;
	bh=vWueuddw2ydzxwjiDWJvrd/T8za+hvHT6C4L+PEDBFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b/X/6KgRuN0Y6HRwhlahVuBTOLEFShjIsqHBapwqd4f9bDx7k0o692pAiYG3RkRKZ
	 n9zu/eKWDnmA6pdwp3NLql33l9hKmO45g7wphUxCpzL/VP7JGsP151/x+OPfejHA+F
	 c8IOofpgeVfSpV9hCm0GAOx1hfzRSj1S1GIFr3HTuG7fSFFLhUpbnX4H6JclxxwqzS
	 OsFKcYuQFY0YTV5WTkhRwKJRoWSAchry6dmDWh67mrGM3w3+nRxL+q3sxZiOo+WXfN
	 VDBVNEQQbYsH0zPmXJDAlwCtKsvM1uBn1hoLHpvK6ydE6An8OvwMMtIoQ0fywebaau
	 ZBDH2B+4Y25vg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	lumag@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 06/34] drm/msm/hdmi: add runtime PM calls to DDC transfer function
Date: Sun,  1 Jun 2025 19:43:30 -0400
Message-Id: <20250601234359.3518595-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234359.3518595-1-sashal@kernel.org>
References: <20250601234359.3518595-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 531b4e2c206e5f7dead04d9da84dfa693ac57481 ]

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/651727/
Link: https://lore.kernel.org/r/20250505-fd-hdmi-hpd-v5-8-48541f76318c@oss.qualcomm.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my detailed analysis: ## Bug Fix Analysis This commit addresses a
**critical power management bug** in the MSM HDMI DDC (Display Data
Channel) implementation. The issue is that DDC transfers can occur when
the HDMI controller is not properly powered, leading to potential
hardware access failures or system instability. ## Code Changes Analysis
The changes in `drivers/gpu/drm/msm/hdmi/hdmi_i2c.c` are **minimal and
well-contained**: 1. **Added runtime PM calls around DDC operations**: -
`pm_runtime_resume_and_get()` at function start (line ~110) -
`pm_runtime_put()` in success path (line ~206) - `pm_runtime_put()` in
error path (line ~224) 2. **Fixed error handling flow**: - Changed
direct returns to proper `goto fail` to ensure PM put operations - Lines
113-114 and 172 now use `goto fail` instead of direct returns ## Risk
Assessment - LOW RISK **Minimal scope**: Only affects the
`msm_hdmi_i2c_xfer()` function, which is the DDC transfer entry point.
**Consistent with existing patterns**: The kernel tree analysis shows
runtime PM is already used extensively in this driver: -
`hdmi_bridge.c`: Uses `pm_runtime_get_sync()` and `pm_runtime_put()` -
`hdmi_hpd.c`: Uses runtime PM in 4 locations for HPD operations **No
architectural changes**: This follows the existing runtime PM pattern
established in commit 6ed9ed484d04 from 2017. ## Comparison with Similar
Commits This matches the characteristics of **Similar Commit #1**
(marked YES for backport): - Fixes a resource management bug (runtime PM
vs devres helper) - Small, contained change - Improves driver robustness
- Follows existing patterns The commit is **unlike** the rejected
commits (#2-#5) which were: - Code cleanups/refactoring - API
modernization - Feature additions - Non-critical improvements ##
Critical System Impact DDC is essential for HDMI functionality - it's
used for: - Reading display EDID data - Monitor detection - Display
capability negotiation Without proper power management, DDC operations
could fail intermittently, causing display detection issues or system
hangs when accessing unpowered hardware. ## Conclusion This is a **low-
risk, high-value bugfix** that ensures hardware is properly powered
during DDC operations. It follows established driver patterns, has
minimal scope, and fixes a potentially serious power management issue
that could affect display functionality.

 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index de182c0048434..9c78c6c528bea 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)
-- 
2.39.5


