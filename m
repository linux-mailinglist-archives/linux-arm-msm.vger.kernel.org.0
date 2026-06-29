Return-Path: <linux-arm-msm+bounces-115008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xQaGEURYQmqU5AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:34:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8916D97D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:34:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=CnWmCATg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115008-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115008-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B0903043C0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEA33FFAD0;
	Mon, 29 Jun 2026 11:30:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90C73FE640
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732656; cv=none; b=e9cOwjzOsMNIPvWKVFsmqUmXYwYhcS3uC54MuEz//WpSv/MR7Ll0NGAe7+/DcxmwYXrcbvtHqf2s0A4fMYSNmQmqjwWc5cR/y1f2YHwS8SAHP4fpZYmggdX1EuQuXoayFbvji7f4YjUEEad9OGafUwsdTTw1g1CX2eydTMUtovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732656; c=relaxed/simple;
	bh=MA9wyNKAIFSI8cZ6RwlfxRs7RNyreh11fwj2AUJTswg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbu52E6G3LWnui9VqpeWbnIpR8oYc5obGXTJZBHR1YMG5z82Jis5F/MHEESPZm9VwgleFZpSttdj2N9BBowryDqrPAtwrBW3ujS1mhdcnnA16FRm35/0It240Qq06+wN1I3ob+bJwNnszW+ikE853z/F3XH0UczudABGlP7OhTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CnWmCATg; arc=none smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aea5e2a361so2121854e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732653; x=1783337453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bl6/Bp62Zltv0A1R5yKMqM8tfS2a1IrH1+EEEyO9+LU=;
        b=CnWmCATgLDBLZReaV3eW1UOak50cQyFow2a5wQn/4ZulGR05f1Di3xd9MPeYXzSV/A
         HqzmFpNgFjgiHeyFw8dvka/HoMlIQoGoqSfBBVy63dl9/0mqt/DzW7nkbp86MgXJ2zsL
         EsXlDX7szYmeWJ9qXP/9UT5j3qYJZpGeHI/TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732653; x=1783337453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bl6/Bp62Zltv0A1R5yKMqM8tfS2a1IrH1+EEEyO9+LU=;
        b=s3grGnBPC8DpTV+lo7mhiWIgamhgS0UR2c6tgF4w2l2b4iiVMPUalJTu/yxoPDZG6E
         CcwFQpzyyf3KA65cbJx4WDrmhlw6saCJGAemaYSPbyINXECd388me+t3UlJPbrV/da0I
         AMdm2eq2MhPEhnxyLXspU7VQdCTYd4kNVQh4sXL37VMkx2zcPdHuVSSN+lLXZ0Befo+A
         ID0U36bPDKgbnvRnsAnI8z0RmMZzAh++0w5BZNZP1z9Ov4/dNOLNVWZbj5jEthiHNXSe
         uK7MfqdakPplJgEc1ZcxEwCW+CexD+Ud00GMg3MKfj16KplOWlKkOMey/IQE+ZT+sMhd
         9ciA==
X-Forwarded-Encrypted: i=1; AHgh+Ro08saKOmlIsFW1AcfF2gRKtz3731L7RxL+tRsSTntdP5A5Qh2X1h1RWoRhzLeX++oPiCyM+xuxsX2ViGp5@vger.kernel.org
X-Gm-Message-State: AOJu0YylbxXTDo05posdqkzKgtiE/f/0Pj7xQ9pmLwJlaafBgd9W12s0
	EQS47ZGv6HiyHaVt+BCFwrdhQJ/7Fkc5gYGti7D1Oq4nozy2ggewsUyTG4UzFKXLRQ==
X-Gm-Gg: AfdE7cnPSYflNKsrWtl1bbt/ximnQOk8FIPqITGN+dP5aDUPUO5Wl4Tf0h5Rxp24v2E
	wovpg5WONyZ6DK8dE/4jr1UsdbNR5a+Fk+RNeNjIOkPt+l9OgCBHSvxrAjgFYG5Cp5dh9S8X1Ek
	ALEoq4DnoVQzaJjRxygP0Zvh5sGjgyNVgcj4vfYVI0zai7opSzy4w2ooMaurWzYSvRU17ZqoPF6
	Ar0yfnTTWK0DljEdkmxCuHIsXHTcI0oSCf++7Gt1VH7AGFml/8jo1xV4tTrRiACZHcJx/8WTuzh
	wCSmdpe5nBzN5qS44V1hLRqGas8/13QzXrGiF2SHbPkpDm0V0b50awkcp4LNTwtPmTb7ns/749K
	xjiOPX48iKg3GSUtndsq2mxgoPT+iUoBSfcQKkI0ooyuk2l/lKZtK50Jff57IX/9vTATBVGLBgr
	xFPf4s9DhNtDrgekAeAJpRGMWRnTQi8M8QDitSYwSMByQIYJt8vihElut6FcurQWGZ5BNy
X-Received: by 2002:a05:6512:6188:b0:5ae:a9eb:eff4 with SMTP id 2adb3069b0e04-5aea9ebf0c9mr2134236e87.61.1782732653051;
        Mon, 29 Jun 2026 04:30:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:44 +0000
Subject: [PATCH 3/9] media: vimc: Fix prototype of
 vimc_sensor_update_frame_timing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-3-5884c80ee3b6@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115008-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A8916D97D7

The function does not return any value, make it into a void function.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 5deebcc78a33..d125a79fec8c 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -92,8 +92,8 @@ static void vimc_sensor_tpg_s_format(struct vimc_sensor_device *vsensor,
 	tpg_s_xfer_func(&vsensor->tpg, format->xfer_func);
 }
 
-static int vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
-					   u32 width, u32 height)
+static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
+					    u32 width, u32 height)
 {
 	struct vimc_sensor_device *vsensor =
 		container_of(sd, struct vimc_sensor_device, sd);
@@ -108,8 +108,6 @@ static int vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
 	vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
 	if (vsensor->hw.fps_jiffies == 0)
 		vsensor->hw.fps_jiffies = 1;
-
-	return 0;
 }
 
 static void vimc_sensor_adjust_fmt(struct v4l2_mbus_framefmt *fmt)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


