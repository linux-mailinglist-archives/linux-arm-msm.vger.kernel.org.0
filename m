Return-Path: <linux-arm-msm+bounces-116998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FgQhFoEDTGr+egEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:35:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A991715078
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:35:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LBwrdGXK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116998-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116998-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BFAF336352C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1240F430CF9;
	Mon,  6 Jul 2026 18:05:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5642CB1A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:05:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361151; cv=none; b=WN1UKWxDAWu6MmfEoSFWlJ9ah+aRPb6ewoJYeVR8kXVHtJ/u3/y5yMmmxUloqrlmvQUMo2FXB0NUCpdsnb7wFXYiSc3Y6zK+kU1QaPFl09+mb6QgB7XXTI80VCzrRCf1jNS2vcGyipPw9y8R5Wn1t+9XIdrOjOxIjie2kgcH2Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361151; c=relaxed/simple;
	bh=BXQEx9CaabRp+UJTE7KgBl0/Y30FFzA4oi3ckcKkQ0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dye2TFHGqgDH11t4qHPqUIx8EgImiKa0mfcwS8q/lGDerizo1JdyxaFIA81sfildeYW79IGFrI2jgYLtSxX/N4w3mHQJv+31cNf3yTZMiuYo1a5oaohScs+K6su/8iD4YCyS1D/mZNNH0Np9S+JlqIvREmduTF8odifqDSmH2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBwrdGXK; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cac39b729dso2833705ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783361149; x=1783965949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBwDpfgatM4P1+rNlaJNEBnJH772jVzISiyjiBJelCY=;
        b=LBwrdGXKwoIh1gZFxeZT1Jel6ufX2lA2bK02HElcfIAsakWqyXYrGS5UJ9N8lcJHjR
         q31vRloNIqtjOQBggyJ0hiySHTxDkSua9wRAJeBHOdYZmhKORpJXld5iUgdKXOtTWCWr
         aDnuPBbLIKJluGWIFtmdHf1RAUKREQR0kvk2UVqAwi0QgMdjnTAegWES1HRpM/LnGC/I
         BGV62kh8YqiVGjULo9TRpFWuUU0b2ArqveNQ0FyabQliBZB9rULj2iB9iHysbc0oie/t
         fH215j9D6k5/215DCyQFV4bp8nVe6zMvilZLhHUSmBeeS55/cy4savQ+wUn3Jf2E1OPO
         l1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361149; x=1783965949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBwDpfgatM4P1+rNlaJNEBnJH772jVzISiyjiBJelCY=;
        b=HJBN0C84aXSaCpbI5ZOkicaj4JmJHqEfwU0BbOv0YrqVYl1kt5CYvVdhED1jLjeCW8
         hAHgn1Zox00fxb5HOlMAEy1Wk7+XoYtJgaKCqQNoBKfbPpLtvmGQRi4CiAvnJ1Q9xjdK
         Q9FfkGJ9mLuGnBnTlcP29bvgg/4Iw08NFVVGYjc9hT94xeSPnaTk6aV1Vwj0/uvuYtkB
         QXQDC/5p9r54nMin+2bTtHbqrE8yIPz/CVRfC1tm0pmeNziVDrlXL97r7twHxo7oWMOW
         XtsCwEr8VmBJ9zfIg+uiH5VaiUD4vpXwwaZ55YYEj8b0gOi1LWIOK4YcpIaD+qLC5p2v
         3wrg==
X-Forwarded-Encrypted: i=1; AHgh+RprugqUcKpiBSLVb1ofrcfjUeaH7vqAQOzSePhiLtN3guRME+s9FTgMpJhWPc7BiJgKhEGwjhKpPpuOkGNo@vger.kernel.org
X-Gm-Message-State: AOJu0YwjRGI1U9T2XY/efjvkyEd/WZxbdZB2zIeih7E9YD0iTz1S0M2H
	RRe8JhjJtSuv7UcuRv0ttKpiftfWWPq4dbANLNeRAqb+Y3v2H9A3aaFc
X-Gm-Gg: AfdE7cl5M4ey7Q6COA+uztSWeOEjadIxqt4VRnfZm0nhgYiqVaSETg20h2dh+MSNh4o
	VcATnzIO1AzKjaNZ1AMiPnwEvznN1Kl6YM+ROak8gjPjmxHgnaiNdl9e2GKVswq/Q0fcX6nNZZV
	AG5J4duqR/SgKEXuMUVPCSvT/Crtbf+q1OhoYnOCJMzZUZPlTlEl/e0lvb8R2tQwzKFDoIQ0rsc
	ZyoktHUM649q635Q6X7s7efXc1tiwAsV9+L9X6CSIsOkj6/1HtrrPd/tkDSzr1Ghxp141FuXzBL
	BDVQMe/r+fXxMriH0SOEsubGYwb+iK3/1TdTFYX63UoLthWchdcfowVW9ZCdnQzykRJM9cJOScc
	Mtf6Xf3PbMcXD0uX4gyjOcF9xFKXEJ4WQWai8ablb4Bm0VTf2JsK2aM/orP9En1BXWD3I0HCq7C
	Dh4n7Bo5PspsjD+krCq4MWLYv2zDr1sA==
X-Received: by 2002:a17:903:18c:b0:2cc:6817:d9c2 with SMTP id d9443c01a7336-2cc6817e7c9mr60828115ad.4.1783361148922;
        Mon, 06 Jul 2026 11:05:48 -0700 (PDT)
Received: from kavandesktop.local.lan ([50.46.174.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7765789sm55875995ad.41.2026.07.06.11.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:05:48 -0700 (PDT)
From: Kavan Smith <kavansmith82@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org
Cc: sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kavan Smith <kavansmith82@gmail.com>
Subject: [PATCH] drm/msm/dsi: don't re-lock the PHY PLL on every DSI command
Date: Mon,  6 Jul 2026 11:07:53 -0700
Message-ID: <20260706180753.408753-1-kavansmith82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-116998-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robdclark@gmail.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@linaro.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kavansmith82@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kavansmith82@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kavansmith82@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A991715078

msm_dsi_host_xfer_prepare() runs for every DSI command, including runtime
DCS writes such as backlight (MIPI DCS 0x51), and unconditionally calls
link_clk_set_rate() before enabling the link clocks. On MSM8916 (DSI 6G
v1.3.1) the requested byte-clock rate never exactly equals the DSI PHY
PLL's achievable rate (e.g. 56250000 Hz requested vs 56246337 Hz from the
PLL), so the clk framework treats every call as a rate change and re-locks
the PLL.

During video-mode operation the byte, pixel and byte-intf clocks are
already running and feeding continuous scanout. Re-locking the PLL glitches
that live clock. On a video-mode panel with no internal timing generator
(e.g. samsung,s6d7aa0 / lsl080al03 on the Samsung Galaxy Tab A 8.0, which
regenerates its H/V timing directly from the DSI clock lane) the glitch
makes the panel lose pixel lock, producing ~1 second of displaced/wrapped
scanout on every DCS command. No FIFO underrun or dsi_err_worker error
fires; it is a silent clock-domain glitch. Stock (downstream MDSS) firmware
sends the same 0x51 with CMD_CLK_CTRL, which only refcount-enables the
clocks and never re-runs clk_set_rate, and does not glitch.

The link rate is already programmed at power-on by msm_dsi_host_power_on(),
so skip the redundant re-set once the link is up; init-time transfers
(before power_on) still set the rate.

Link: https://lists.freedesktop.org/archives/dri-devel/2018-April/172218.html
Signed-off-by: Kavan Smith <kavansmith82@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2170,7 +2170,17 @@
 	 * mdp clock need to be enabled to receive dsi interrupt
 	 */
 	pm_runtime_get_sync(&msm_host->pdev->dev);
-	cfg_hnd->ops->link_clk_set_rate(msm_host);
+	/*
+	 * Don't re-set the link clock rate when the link is already up. The
+	 * requested byte-clock rate rarely equals the DSI PHY PLL's achievable
+	 * rate, so clk_set_rate() re-locks the PLL on every command; for a
+	 * video-mode panel with no internal timing generator that clock glitch
+	 * makes the panel lose pixel lock mid-scanout (~1s of displaced image on
+	 * each DCS write, e.g. every backlight update). The rate is already set
+	 * at power-on.
+	 */
+	if (!msm_host->power_on)
+		cfg_hnd->ops->link_clk_set_rate(msm_host);
 	cfg_hnd->ops->link_clk_enable(msm_host);
 
 	/* TODO: vote for bus bandwidth */

