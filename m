Return-Path: <linux-arm-msm+bounces-95951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DKaJ2QIrGkWjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:13:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2422B611
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50EF3300DA5B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383573491F4;
	Sat,  7 Mar 2026 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9IId/P/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4B28314C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772882018; cv=none; b=o0JNuyvGzSpTA6PvkTSMQ1f+RgE6ovyyZWWLrHce4VoYhz/UxaYqAyKVQhqBsrgrHTtnab5aScaB1tswBPiiJ9uRFK8TSiV6Nww9HQB4sO4DcTXDuJ5I/YXUKNvJFxc4RGYfAdc4rZAXTqtB4VNQ/H9otgkSKgldozCd5W3eLN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772882018; c=relaxed/simple;
	bh=FxCqRUT30QxsjEJSGnSFdAzp9zp4Me7XwZEwDRYHFV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JkxO57XkGMLUfHSpkxtjEboK5LUUrVMwSL/PpFemjl/eUEI4kvg5gueOYntV9qdde+TrQG+ZvtNkrQwZgW8aivAhxcbaYO4n3l2VThNAsdtyKuCZ02El7s4p5Olk8KdNEF6UANy4EETbN66yRjbEdGmBRABF7LUll4TpNzBRI74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9IId/P/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ae4988e039so45388055ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772882016; x=1773486816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfZvykbj+Munv01zyroOwx0N1ICA5mAYoReNuZjedZg=;
        b=D9IId/P/rgr6tlTdvp91oZ2fpaNl9TC2xOOizzCmaaN7N71K9L0B6jMCAUMZJsdsEy
         I3ekkCm/lP1zuLxiVU+RG3O09wDdHnHwM04NsKrJNjkkrUlhv5li7shCnEdOzzZmus00
         4hazcCVq0HzJatr+iD7IIv7NUO8nKPo3/D/AI+LQSEW7+T5lUjVs1k/nfC/ll8wk7RSe
         ROqmUDSQC1/kukvDRVxRICBta65lbhSFmvQF8QhphJcUGLhVUkhg1gBeghQVeItn1jdC
         pMjBRd92PJmDmfRm4MSeX0t/uId6UfGkhmOt+YOqfos/0LQ1T6T3n6hD10oQf/dXrqRX
         dF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772882016; x=1773486816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RfZvykbj+Munv01zyroOwx0N1ICA5mAYoReNuZjedZg=;
        b=Qebns0zvUY9qctJR/MmTEFYOJFST0pug4lGxzTXP1LZyvEX5/N96HaU2KArvekIp/5
         It4GsaNtf3rGsoM64TfKVcpqtngOwHxNWk5TTfJoZ05U7Cg63lfTKe7gtdJTFSHOfosz
         GeYXM51zROV8JdqmEqNX/31WvUUlA3Wu2fxeXOw5FHbnjl/9An0dbw1jM6zzlNbSTvy/
         xwWwY6Hk/YWyKFeYoqY3L7BJSiv+CUjQzTG1bu4IodybKsPzWcpamn0YLQnysj4wJg7O
         sWsmg/+fvwl+G5foF3xeohWF75B3pYlVE2atwHc3HHTmZ+Vt6I585FPQMC3D+FMKAQKJ
         khYA==
X-Forwarded-Encrypted: i=1; AJvYcCX8iJl16DaBPLA2bgNZvmzI89JTgWUD1OFeWCpJrKWmMfgsG4/hEAFqkXM9TQ/v3cxaEmmaD0K/tynVwUiY@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEwrEWQ3RNrdveo93u7E+mwHcW2ckYKtSRJKIhhadMf8M0AQy
	6N4x4R/rSRTVC0gf8Lq/myfMOl9dZtC3yLNV3lsv1ry7lRV92Jsk6GMf
X-Gm-Gg: ATEYQzzEMTMkQl961/JfXPqqoTxW4iBEplwZ5IEhi38bVcm0AeDmNjINgWg6jwF5FiQ
	ovIqx/7nWtW7FKXGwLrcim7Ir2AHLqrlRnIeEExjjZhpAjN7GTSjj8Y7/cm6Gl2eDUP34FtDvS/
	UrbqdteE0ibKYikORY5RDXhttpURsgJTbbHEsAR+YKboq9RV0/Z5Hv/Zd/mndcApRgBlc6m2NJc
	U0cs13Hx1NCbjzx0JKY81k+G/hEBaEqr4HpudOUFfVo8zNqrFMjhjVggVVO+Ej0hEq2vu4GRCmo
	yzjKogTwnyqRU+RcV4KjrScI8zfSRAvrZ2U/Y6AaJi8pmVIz/mmOtoFj2b6lz09arYsGy8XdpNA
	i/0okZlB8dgGPZWeNxGH4ezBZ1LXugyeUU1hw0NM/e86GYfsvsOKDMabrDX4JGRP0feNv27V+ha
	hc0iQrzqsQi1i57LyOAQ==
X-Received: by 2002:a17:903:1a07:b0:2ae:5d90:9d95 with SMTP id d9443c01a7336-2ae829cdecbmr51388105ad.14.1772882016362;
        Sat, 07 Mar 2026 03:13:36 -0800 (PST)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e7bsm47350265ad.46.2026.03.07.03.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:13:35 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/msm/dsi: fix hdisplay calculation for CMD mode panel
Date: Sat,  7 Mar 2026 19:12:49 +0800
Message-ID: <20260307111250.105772-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307111250.105772-1-mitltlatltl@gmail.com>
References: <20260307111250.105772-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 59C2422B611
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95951-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.981];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

ac47870fd795 incorrecly broke hdisplay calculation for CMD mode, fix
it.

Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7c16216e8b..f63165c7ce 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1016,8 +1016,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		/*
 		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
 		 * enabled, MDP always sends out 48-bit compressed data per
-		 * pclk and on average, DSI consumes an amount of compressed
-		 * data equivalent to the uncompressed pixel depth per pclk.
+		 * pclk and on average, for video mode, DSI consumes only an
+		 * amount of compressed data equivalent to the uncompressed
+		 * pixel depth per pclk.
 		 *
 		 * Calculate the number of pclks needed to transmit one line of
 		 * the compressed data.
@@ -1029,10 +1030,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * unused anyway.
 		 */
 		h_total -= hdisplay;
-		if (wide_bus_enabled)
-			bits_per_pclk = dsc->bits_per_component * 3;
-		else
+		if (wide_bus_enabled) {
+			if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
+				bits_per_pclk = dsc->bits_per_component * 3;
+			else
+				bits_per_pclk = 48;
+		} else {
 			bits_per_pclk = 24;
+		}
 
 		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
 
-- 
2.53.0


