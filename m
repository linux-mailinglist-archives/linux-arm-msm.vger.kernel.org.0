Return-Path: <linux-arm-msm+bounces-115009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b+GDJDVbQmpO5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:47:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7F6D99C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:47:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b="X+DX/Cd3";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115009-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115009-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF887320AA3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F47401A27;
	Mon, 29 Jun 2026 11:30:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1E13FF89F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732658; cv=none; b=s1EDSaNg01z1dvc+xmEtQpCubI6sJuCnvirk8okzMH7ZANsLXFDx80KpuCoekCwwX67HAAMliO9OgIcAZstcgX8xBFjFGyO1vItoIHXP3FvsDZ8vJewGadvCJLioAmK7EE83dyeeHRwiRIv0So6hAXSg7YUiFDtvL3FfOGWQeDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732658; c=relaxed/simple;
	bh=Sle5ow+4bP0fhUgqXuG9sN7s0Wj2a4MVyVS2vDV2kJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqLx0sX7BZYN07keFfykEUC8WKGUvWfZslPHJs48reZiCA+HcfX3Jx9PHxJR9bNl9vpW1OwTW/hFiQVV2kU2hxjWQTZH//P/zaj5t/klZ/3pwTd6csWu497iOz7A2oPmHHni4ymkOb7ZA0Bur3ceZPJwh17EnGGWDX7WOn/SoRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X+DX/Cd3; arc=none smtp.client-ip=209.85.167.46
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aea517451fso3355520e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732654; x=1783337454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14OP//5hcfgr0Q2f08MlIGbZ3gTw8vfmRUmF+42IuXo=;
        b=X+DX/Cd3JH6ph9wvgAzoq+JIu3xkxBmeZ6Zcv18ULzqOb7wVYXSEA4XtMA+lUibqoi
         byrIdWwTr5HQRUtNRwUI0fftjbkCA4Met2uFqynjQsxlxgNC5xosce58UZhrCc2LSVAg
         7sZmGOMpqthZ1FpQ4/HijnaseHaNxDGgyuigk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732654; x=1783337454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14OP//5hcfgr0Q2f08MlIGbZ3gTw8vfmRUmF+42IuXo=;
        b=iwm8Sf2S437Stk+5Rvtxjp+MuXELtvDHJezcLx8gn2H0xqwFfr4ZMLFNyi/JnKWl7w
         DswYOSEMeXfna2yxjPpTvN0R3knu8kM100dk8TVNEUl1PP++s57ZOPh0rO+UL4vzbX97
         K/Y8ZMW+WD6JQbVHPU1FGWvWtl6DnOCWgYHFSt2kjGOhI2g8FQIT15K1/qTi3XkI6u/z
         UtXDGQriqt/ynj+T6WwpIFKg/9FuA5yJdRuAZY19pPmCEbLGmkzSd669/Z2Bj7Xf/WIs
         5WniBG+UFlFBM2C+qEFwQ7FcH5hashCxim4gngbWkrS6ySb/R/Z7zD2E01ebd1Mt/ZSO
         oIoA==
X-Forwarded-Encrypted: i=1; AHgh+RoXqMFtQ0BaxqgcDuijUIWtITDwHRgnATyiiMleCFFUgnbK7eHiCcoLeodvOn6f83BWT73YJnQUngtqtqKi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TvN/84ujThtaJF8SQf7GjioPcqLR2wdviw1YP0a48YdgGTna
	ZroOnmgcVXLT55Y5nw2/nmjTra0DuK9IYH0Ut2sQKbvxtmE8VBdQ0qPIZL41FGnDgA==
X-Gm-Gg: AfdE7cl63HKe/YTIBmkrlWM1LXR3pipXe7FlDPpvMn6qExYi84iUODkY5cIKRYGv+GI
	ZLsKcPFj7BTTkbShSvk2oWLfKQ5gsifxyuzewB8DMIkQYoGrWKYJAVCYc38vAwiVgpFl5IGaP8P
	1Wh5ARa1ncZDd3rVDJ6nALqVry9NZtRVZG1N1JQxRfQNuypZn9M8JEJLyJF1pZkCKwdAl/Tsnl1
	GS0aAeeF3vzQs7Aan6GVqwyrIa5xLzDptoBtZKwBEuotAz8/TtrZGXG1nlkhskDDKwLzby7BsJG
	Sc46AnT18uHriiXklZu3YChPDKQ4Lo5tIIw1jjtZudrOKdM61kmZucHra5G049nITTrabdr7h/j
	q+yOtwGeLGrS6hrccAT15y48wMHW4XR5p7zeGvsWX/gguYZiZJxsa20vKgl4OjBTd0zYsbWzfNF
	u+uIAtOSxxT/z7cHu+0PgfNV5oCorBIdNSM7qdlUC4hPPJKdlj0QQ5hnfqGBnOu8EWlbP/hgzQE
	4J221Y=
X-Received: by 2002:a05:6512:4502:b0:5ae:b8b7:6621 with SMTP id 2adb3069b0e04-5aeb8b7691amr773947e87.47.1782732654089;
        Mon, 29 Jun 2026 04:30:54 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:45 +0000
Subject: [PATCH 4/9] media: vimc: Ensure that pixel_rate fits in 32 bits
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115009-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DF7F6D99C0

pixel_rate is set to VIMC_PIXEL_RATE_FIXED, which the code expects to
fit in 32 bits. Make that constraint into a WARN_ON, so if we ever break
that constraint a kernel warning will be triggered.

It also fixes the following cocci warning:
./test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index d125a79fec8c..83dcc9d61ee0 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -103,8 +103,12 @@ static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
 	u64 total_pixels = (u64)hts * vts;
 	u64 frame_interval_ns;
 
+	/* Sanity check, pixel rate is fixed and fits in 32 bits. */
+	if (WARN_ON(pixel_rate >= 0x100000000))
+		return;
+
 	frame_interval_ns = total_pixels * NSEC_PER_SEC;
-	do_div(frame_interval_ns, pixel_rate);
+	do_div(frame_interval_ns, (u32)pixel_rate);
 	vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
 	if (vsensor->hw.fps_jiffies == 0)
 		vsensor->hw.fps_jiffies = 1;

-- 
2.55.0.rc0.799.gd6f94ed593-goog


