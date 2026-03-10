Return-Path: <linux-arm-msm+bounces-96667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLa7AFErsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:31:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95F252063
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38641323C7D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6108C37AA6A;
	Tue, 10 Mar 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StyWuhXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3DA2FC037;
	Tue, 10 Mar 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148836; cv=none; b=AJ0xSX+UXag34s2j5Dla9nCswLfPhR9WKlcOM1iPrEqghRFMnFCCCu6eemuksBz1gxhqf2XsLQ9xol65HXkl416CbFP8BaTTv8H6x2B7TKT0Zo0OCYlZ5LF8Z++NkoUAGU3ypRPcwNLpw5BXw9JBqrFMEDxwPsRtoaHgz8blB84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148836; c=relaxed/simple;
	bh=Dygqb+VzJFlCPr/Paizij05sMxwUrE4iBosntsxs0tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rnWxJEj0BS2Gv1xYcroZHq6JcHFBbbidFv9b4kQicp8p5g2scCCOBhZSGxR4Q1vvJFlWwFTKT5jXwFawrgTt02VtA/3uRTg9V7Sr4Uvh37eeQAf0QTl6IoZboEavKEmIg2AeWPu9vTJL6nkgylFPR1rsiv49TldGIGPZH2XDP9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StyWuhXC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0192EC19423;
	Tue, 10 Mar 2026 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148835;
	bh=Dygqb+VzJFlCPr/Paizij05sMxwUrE4iBosntsxs0tM=;
	h=From:Date:Subject:To:Cc:From;
	b=StyWuhXCzyJPk3LDKL7W5Aop9vEpK/sOED+tkAGXCKWDpnYRyPyZ8gepSfYCv8N9c
	 P6DUnDMu08vaDQ+T9AVnyexvMQhfQKj8GjAxcI6VDVPwuCeQJ5zuh8NampsKPTcLFG
	 dSh7TkeVr+YlAVtWT0xqQxQQEJoU1iNUm1sgTBDwSMmeH+8A5NyALV3JszXqyW4DEB
	 AkeyQYy6B3GBZFb7KvZkZOZS9g4pdXoOhgbVdlWbX4yvYHaP5NfHDDazDWQrv1yItz
	 Mr3NWwgBx5+bPitEtp7UnSTlR+dVkeRycGKOdwzm2kPNtAYeyc9/W8tMWPqNKbifoS
	 aOOlcAEtN+uvA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 10 Mar 2026 14:20:25 +0100
Subject: [PATCH] drm/msm/mdss: Add a TODO for better managing the MDSS
 clock power state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-topic-mdss_power_todo-v1-1-59457b8b7486@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1hZaf6hXERFpU81CUxpRQby7x
 eVbzDwgGAkF+uyBiCcJ8Z5g8gzsOu8LKnLJUOii0aXR6uBAVm1OZAp8YZwOdqyq2XTW1742bQm
 pDRE93f93GN/3A767X6lnAAAA
X-Change-ID: 20260310-topic-mdss_power_todo-4a19cf5f5183
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773148832; l=1793;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=FGbnaUib9uRu3abrN32AWgJZlFWuy/Q28ilmx5hne0s=;
 b=SsdDusLV3PkFtfEmX/JhXKfvIIQgT/GvlF9E1F2H4805D60ZW9D0hSaTq9sW0uMvx9wJcksqk
 BQ/ADkzlTQuAANHLdS8ZSE9n6WlFB4KbshpEtz2lAOWhIFmSPyAPrNY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 6C95F252063
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
	TAGGED_FROM(0.00)[bounces-96667-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There's a small window where the MDP clock could be set to a high rate
(say, from the bootloader) without a corresponding RPM(H)PD vote to
back it up. This is normally not an issue, but could be, if rmmod fails
to shut down the display driver cleanly, and the module is inserted
again, or when the providers' .sync_state has timed out.

Mark a TODO to fix it one day. Linking the relevant discussion below.

Link: https://lore.kernel.org/linux-arm-msm/d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..b783dfec83b8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -262,6 +262,14 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	icc_set_bw(msm_mdss->reg_bus_path, 0,
 		   msm_mdss->reg_bus_bw);
 
+	/*
+	 * TODO:
+	 * Previous users (e.g. the bootloader) may have left this clock at a high rate, which
+	 * would remain set, as prepare_enable() doesn't reprogram it. This theoretically poses a
+	 * risk of brownout, but realistically this path is almost exclusively excercised after the
+	 * correct OPP has been set in one of the MDPn or DPU drivers, or during initial probe,
+	 * before the RPM(H)PD sync_state is done.
+	 */
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
 		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);

---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260310-topic-mdss_power_todo-4a19cf5f5183

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


