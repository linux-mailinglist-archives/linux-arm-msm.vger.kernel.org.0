Return-Path: <linux-arm-msm+bounces-117079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id veOGIkxXTGqUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:33:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E09977169D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:32:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pHaIJQ0x;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117079-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117079-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71D103029AE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14644302753;
	Tue,  7 Jul 2026 01:30:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B084C42087E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 01:30:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387844; cv=none; b=YID3JnGCW6URoWZyDLmGCS/1SofSIm3S9A3vRQs/l+wPRzA7P7gu1GMPXCn6s764N+GIhmArzQUqRpK3YsR818TcJJKzSmBOn9y2J7PTWeGFdl4U4UIjheAoBe5ZUPaZi/eGuQQZh44exP/rh0Orfoxjee+SiyWK52S3Giqtwt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387844; c=relaxed/simple;
	bh=hlzNnsVV1o1LCgnMnPlGAyIjyXfohOSH516CMeMRHeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+6PGIThLi6UqmlIfvg4PXTjgj4wyx++W5MNFdEq2r13WcSsdVh8MW3V4xFas1/+QHu5SRAHZKh3QtOB66JCW33WV1WbDd7Js12hOogxTDGbaCCSzQCTLHRicraM43ClCz6TYgT/RQSZSJ0fe1N2qxydcP75Xnz+hJfOyjRHIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHaIJQ0x; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cab31bcc06so2554895ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783387842; x=1783992642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROUC3cgy4QtTAai8fuwZ/i9UUpJYp/TQoiTouEVN0vM=;
        b=pHaIJQ0xeZJB1D+gX7nlpC3oz/xmmdw/1EyKN4id4/+x9EeAPpTVxlWtzik8mZRw03
         hBzYVGCDtAo0bmP/dNK34zc0bKFc6dy8XEQtZMBkNtCNaGp85He8zBWPMv8d4fPpPQRZ
         qrHDm0oM6TsngwbMlQUvHpRyzeKPVWm0sB9KLD62KmhD4ap51zQWvnMMrRj3qvkFsBK7
         fcpd95vDaOcY5Xm1vKuDiFMXTxZNBbFBayZ1n7LbCu9BzbPeoOqcpwzyQK5DjFaW0u1Z
         lWCT09L0FI0HmCovHSlK9KRDSq62qGRm0bH/Z1wxSpzWZoMySQYsFdj17JVUEK3PTo5K
         4p7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783387842; x=1783992642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROUC3cgy4QtTAai8fuwZ/i9UUpJYp/TQoiTouEVN0vM=;
        b=b+EPwpWXSBrM0JE4j/YGNUu95BUlIHBL1yZZ7/cUWLkEBMhqzLxe54ZiATG9ErE8VA
         q/EItbaCsfBnlyD1b6OJ6dGH0P68POYSDFuQ5QZgl9a2yW2EKX9TkichIEWSo86oJdR+
         lmCalueR+xJiM1+w6hYOcViZt0yxHkmooYnCPb4gAa8gqNtdlMHQC2QC4Wij21flN4jB
         bPe3jPrJzeIOc//swTvzcq6S5yEbBZImIUGuTy5/caqVNW9J5zK8JiD5wEmsfGZ3jCB6
         nJn++JgL2JY82dZhd9DGaKx+UtAz/VH7eRs01HIFaPxPNxC0sJ5U1KeXhStZ6FZQsL3r
         XLbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDTYSW4syf0Cq9GWPipVAvE0Ij2nr2nZbYpDIXyS8U7u3UPlkATe7q5VpQFWODSre4BqpZK5XuyzW4qa9Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyTt1mUG9seFPRQOq6nDEvfc/LHxJnCF/2PFnAAtZ1eBLXfEXmV
	V8biZ2JCHoYVMRWdI00UlI4XqfogUIEI9mzbJljI0W27ALUo9zljXyvY
X-Gm-Gg: AfdE7cnFOh+nNFcw6heSvm2DgHaOW5onrg6k/igCY3qGX7oTR3NSAsbjW3C6jCP17ll
	soeXS4oWd3sx6Vso/dLHxvtNRXUBP8QJnLkc/43H6Wv+IQd2LeNuqONtVE+24Zu5Qscfw18HKSJ
	6R5Og34NxpRpiqm4741FE7m3OBo4+2ysj4hVuvm4uGupJaIrlQJEJGoAh8auayOFsT+EHWOXlqF
	MoyZOtq+06ALUVWYRGEU7yyUy7vtd6XEfwiCTR+fEiHabDc6+3jK8zfyNdX3OM+VbDyXP4z9Zmg
	gn3uJIz3MVcF6s1s9ZX6YJ3T6BKZX6knaeiM3ZdUh6PtYHX7kwoCHummPgL6yCWHb72dEn6mUm4
	oGnfPGtpnRvYZhSBSD9k6L51vU6El4HXNOc3rtwlltk4O96z76KPiUh/iSRXEO8jegbB6UasOp6
	WsCEVqS2ALCJJDUCoUMqCeNI1nRgy/FQ==
X-Received: by 2002:a17:903:41cf:b0:2c9:e9ef:bdd9 with SMTP id d9443c01a7336-2cccad90e8cmr5468245ad.7.1783387841900;
        Mon, 06 Jul 2026 18:30:41 -0700 (PDT)
Received: from kavandesktop.local.lan ([50.46.174.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm2653435ad.45.2026.07.06.18.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:30:41 -0700 (PDT)
From: Kavan Smith <kavansmith82@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@oss.qualcomm.com
Cc: sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kavan Smith <kavansmith82@gmail.com>,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2] drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value
Date: Mon,  6 Jul 2026 18:32:40 -0700
Message-ID: <20260707013240.681012-1-kavansmith82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706180753.408753-1-kavansmith82@gmail.com>
References: <20260706180753.408753-1-kavansmith82@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,zonque.org];
	TAGGED_FROM(0.00)[bounces-117079-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robdclark@gmail.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:kavansmith82@gmail.com,m:daniel@zonque.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,quicinc.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kavansmith82@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,zonque.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E09977169D7

MSM8916 runtime DSI commands still go through
msm_dsi_host_xfer_prepare(), which re-applies the link clock rate before
enabling the link clocks. That is fine in principle, but on DSI 6G the
requested byte clock rate often does not exactly match the DSI PHY PLL's
realizable rate. For example, the driver can request 56250000 Hz while the
PLL actually runs at 56246337 Hz.

Because the requested and actual rates differ slightly, every later
link_clk_set_rate() call is treated as a real clock change and re-locks
the PLL. On a video-mode panel without an internal timing generator, such
as samsung,s6d7aa0 / lsl080al03 on MSM8916, that live-clock glitch makes
the panel lose pixel lock and visibly corrupts scanout on each runtime DCS
command, including backlight writes.

Fix this by rounding the computed 6G byte clock rate up front, before it is
stored in msm_host->byte_clk_rate and reused by later transfers. Once the
host carries the PLL-achievable rate instead of the idealized one,
repeated link_clk_set_rate() calls become no-ops in the common clock
framework and no longer re-lock the PLL.

This keeps the normal transfer callback sequencing intact, preserves the
OPP vote path in link_clk_set_rate(), and matches the fix direction
suggested in the original 2018 discussion.

Reported-by: Daniel Mack <daniel@zonque.org>
Closes: https://lore.kernel.org/all/1a682c5b-7fc9-3aaa-120b-64b239a355a3@zonque.org/
Fixes: 6b16f05aa39f ("drm/msm/dsi: Split clk rate setting and enable")
Cc: stable@vger.kernel.org
Signed-off-by: Kavan Smith <kavansmith82@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index eabdaa4..5119862 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -603,12 +603,24 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
+	long rounded_byte_clk_rate;
+
 	if (!msm_host->mode) {
 		pr_err("%s: mode not set\n", __func__);
 		return -EINVAL;
 	}
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
+
+	rounded_byte_clk_rate = clk_round_rate(msm_host->byte_clk,
+					       msm_host->byte_clk_rate);
+	if (rounded_byte_clk_rate < 0) {
+		pr_err("%s: failed to round byte clock rate, %ld\n",
+		       __func__, rounded_byte_clk_rate);
+		return rounded_byte_clk_rate;
+	}
+
+	msm_host->byte_clk_rate = rounded_byte_clk_rate;
 	msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
 	return 0;
 }
@@ -2056,18 +2068,7 @@ int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
 	 * mdp clock need to be enabled to receive dsi interrupt
 	 */
 	pm_runtime_get_sync(&msm_host->pdev->dev);
-	/*
-	 * Do NOT re-set the link clock rate when the link is already up and
-	 * streaming. On MSM8916 the requested byte-clock rate never exactly equals
-	 * the DSI PHY PLL's achievable rate, so clk_set_rate() re-locks the PLL on
-	 * every command. For a video-mode panel with no internal timing generator
-	 * (e.g. s6d7aa0), that clock glitch makes the panel lose pixel lock mid-
-	 * scanout -> ~1s of displaced/wrapped image on every DCS write (backlight).
-	 * The rate is already correct from power-on; downstream MDSS only refcount-
-	 * enables the clocks here (CMD_CLK_CTRL) and never re-sets the rate.
-	 */
-	if (!msm_host->power_on)
-		cfg_hnd->ops->link_clk_set_rate(msm_host);
+	cfg_hnd->ops->link_clk_set_rate(msm_host);
 	cfg_hnd->ops->link_clk_enable(msm_host);
 
 	/* TODO: vote for bus bandwidth */
-- 
2.43.0


