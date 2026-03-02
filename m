Return-Path: <linux-arm-msm+bounces-94946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC77EfCUpWmPEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:47:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8E1DA0E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF1EA30683BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A87A3D9024;
	Mon,  2 Mar 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhfgjWMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F22430B96;
	Mon,  2 Mar 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772458897; cv=none; b=f8KVioXV6DnC/wF3AV9bB/X1Rv36k+TV5QC1xiG7dUmSYMEdO83QC2dL1t58yIUKYq9WZWk0wGHqJj5+GPzS5rLY4KtyhiFRs+XCa0vURqYShMoiqGTs2S7kmb5ZyXOaIuzgyeApygd2j8I92uiVe6mSC3wUHQg43Runne37gc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772458897; c=relaxed/simple;
	bh=h/wublz1Ca35s5noMWyzECiy7g/MJAJFvBvHdqHan1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O3Rs4xCO3h6uyRbvivpqAYf2HsWi2xuUcogS0iHNyD1URh/jkzSfzZUb88/m8S6T0AizdzSpSD/lOo2IbQ12u3uHHyBPlHLvPROoRpdQVD45UsAwfg4Ern48kBBHSkKgh3goTdkmzLX6ZkKpKasu7I8K5mgygETVCgEag9t4td8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhfgjWMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F6AC19423;
	Mon,  2 Mar 2026 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772458896;
	bh=h/wublz1Ca35s5noMWyzECiy7g/MJAJFvBvHdqHan1E=;
	h=From:Date:Subject:To:Cc:From;
	b=BhfgjWMM9s4b80bx3wrn0q52RMki3+tLUYG8DkqEFgMkqaLgEJ6qOKZBuEgKsZ0T5
	 iTDWDdDuUojIh5mo4YvOsBAKzWcU/aP/dLXbuG/t2e2l/YLd5GsdB0un/gVdjjDk1V
	 r6i+RngIgvknn9RIur3R1D427fLIzzgELdCzny1xI/mODMih5/eDvbLjr71rf6ompU
	 0isLZlh7QFZHBYDAbeJ6TqzATAKkbt7E/nW59IehyddnER+9iZZdcRRn14HcW4DmbT
	 clg0PVCnXx9afLSpuV3XmB6RD/ELcwqLt2Bm/B61BfvHDwqFntHuSIwPe4ClYNQC96
	 EXlVGuWuiFZSg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Mar 2026 14:41:26 +0100
Subject: [PATCH] drm/msm/mdp5: Remove MSM8974v1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-topic-goodnight_8974v1-v1-1-e0006f7a0526@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBPUor+rRMSkk85GQyOC6O5Jy
 2/x3gOZElOGqXog0cWZYyhQdQXGY3Ak2BaDlrqTjdTijAcb4WK0gZ0/12Hs20sJowhxaxHlYKD
 ER6Kd7388L+/7AUMv13loAAAA
X-Change-ID: 20260302-topic-goodnight_8974v1-c1eaab4aa08c
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772458893; l=4425;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Q5ct592WfC/mLHBqsbQfOSQ51VNEbV7VADXUolMFCCM=;
 b=nxGq84eBHCzYGUqYSVAsZxn4SWSgjtN7qeoQVyyuOiSkYuMmiQZF6QGFkLJH4hz0DPgcXMcnf
 bEFhGo3Aq8PDdGKRf16WS5GrJrHZOsLQqFwE2+/b80L8ynYpsmaKlf7
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94946-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: A0C8E1DA0E3
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

To the best of my knowledge, the v1 version of this SoC had been
superseded before any device was released on the market. Everywhere
else in the kernel, there are assumptions about the SoC being revision
2 or the later MSM8974PRO.

Remove the config for that flavor of MDP. To bring the naming in line
with the rest of the kernel, remove the v2 suffix from the remaining
config.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
related: https://lore.kernel.org/linux-arm-msm/20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com/T/#m579aac6cddd5bd5b0adfa778061e6397082014fe
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 94 +-------------------------------
 1 file changed, 2 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 69fef034d0df..7c91fc1915f3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -14,95 +14,6 @@ struct mdp5_cfg_handler {
 /* mdp5_cfg must be exposed (used in mdp5.xml.h) */
 const struct mdp5_cfg_hw *mdp5_cfg = NULL;
 
-static const struct mdp5_cfg_hw msm8x74v1_config = {
-	.name = "msm8x74v1",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_SMP |
-			0,
-	},
-	.smp = {
-		.mmb_count = 22,
-		.mmb_size = 4096,
-		.clients = {
-			[SSPP_VIG0] =  1, [SSPP_VIG1] =  4, [SSPP_VIG2] =  7,
-			[SSPP_DMA0] = 10, [SSPP_DMA1] = 13,
-			[SSPP_RGB0] = 16, [SSPP_RGB1] = 17, [SSPP_RGB2] = 18,
-		},
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x00500, 0x00600, 0x00700, 0x00800, 0x00900 },
-		.flush_hw_mask = 0x0003ffff,
-	},
-	.pipe_vig = {
-		.count = 3,
-		.base = { 0x01100, 0x01500, 0x01900 },
-		.caps = MDP_PIPE_CAP_HFLIP |
-			MDP_PIPE_CAP_VFLIP |
-			MDP_PIPE_CAP_SCALE |
-			MDP_PIPE_CAP_CSC   |
-			0,
-	},
-	.pipe_rgb = {
-		.count = 3,
-		.base = { 0x01d00, 0x02100, 0x02500 },
-		.caps = MDP_PIPE_CAP_HFLIP |
-			MDP_PIPE_CAP_VFLIP |
-			MDP_PIPE_CAP_SCALE |
-			0,
-	},
-	.pipe_dma = {
-		.count = 2,
-		.base = { 0x02900, 0x02d00 },
-		.caps = MDP_PIPE_CAP_HFLIP |
-			MDP_PIPE_CAP_VFLIP |
-			0,
-	},
-	.lm = {
-		.count = 5,
-		.base = { 0x03100, 0x03500, 0x03900, 0x03d00, 0x04100 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 1, .pp = 1, .dspp = 1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 2, .pp = 2, .dspp = 2,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 3, .pp = -1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB },
-				{ .id = 4, .pp = -1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB },
-			     },
-		.nb_stages = 5,
-		.max_width = 2048,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 3,
-		.base = { 0x04500, 0x04900, 0x04d00 },
-	},
-	.pp = {
-		.count = 3,
-		.base = { 0x21a00, 0x21b00, 0x21c00 },
-	},
-	.intf = {
-		.base = { 0x21000, 0x21200, 0x21400, 0x21600 },
-		.connect = {
-			[0] = INTF_eDP,
-			[1] = INTF_DSI,
-			[2] = INTF_DSI,
-			[3] = INTF_HDMI,
-		},
-	},
-	.perf = {
-		.ab_inefficiency = 200,
-		.ib_inefficiency = 120,
-		.clk_inefficiency = 125
-	},
-	.max_clk = 200000000,
-};
-
 static const struct mdp5_cfg_hw msm8x26_config = {
 	.name = "msm8x26",
 	.mdp = {
@@ -184,7 +95,7 @@ static const struct mdp5_cfg_hw msm8x26_config = {
 	.max_clk = 200000000,
 };
 
-static const struct mdp5_cfg_hw msm8x74v2_config = {
+static const struct mdp5_cfg_hw msm8x74_config = {
 	.name = "msm8x74",
 	.mdp = {
 		.count = 1,
@@ -1098,9 +1009,8 @@ static const struct mdp5_cfg_hw msm8937_config = {
 };
 
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
-	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 1, .config = { .hw = &msm8x26_config } },
-	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
+	{ .revision = 2, .config = { .hw = &msm8x74_config } },
 	{ .revision = 3, .config = { .hw = &apq8084_config } },
 	{ .revision = 6, .config = { .hw = &msm8x16_config } },
 	{ .revision = 8, .config = { .hw = &msm8x36_config } },

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260302-topic-goodnight_8974v1-c1eaab4aa08c

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


