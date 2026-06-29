Return-Path: <linux-arm-msm+bounces-115007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ez3YGyxYQmqO5AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:34:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABDE6D97BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:34:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b="Mc7/j5UN";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6847303EFA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5713FF1A3;
	Mon, 29 Jun 2026 11:30:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE843E4C9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732654; cv=none; b=Dw6bC82zMI8A5l5WAmUaWuHseOxkt4JH9QFWHLEClsddN1Yz2/YGZzA1k9ab4cZ/5/lyPnqs4ehqy1p02n3fVkrGGQGP1y3x5b6mWFGc9s1DGeuEYFClKBqvVrF5UT3d3yNHpSjlEIkEDsW2CJJOdOSESBufjAG/SdAUEmKAHwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732654; c=relaxed/simple;
	bh=YbebCHn0Us0Y7R7dMxOqglnHArY6LjK6GM4T60ivYzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyqSsmPe+JYVHWV9CUkZ5qdR1ZQg6yUn9IbNtBZs5I8XlJvUIlEeVFWf46iyIgGKlNuFYZ6L9mySvswYiFZDN/emqDSvVjnxONmwa++oHoH9aGFyMkqR2u/+6Qp4Cz5DKfqUhn89/K7SeKNBX5HcqLbSuZEbdHZBeUPeNcFcng0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mc7/j5UN; arc=none smtp.client-ip=209.85.208.169
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3996c9eeebeso24785681fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732651; x=1783337451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v68a3GvjDt67EscXY2lZ/DlUh5IwMqRFPnauIX/l0kI=;
        b=Mc7/j5UNN9cvHq38q7od6oyG0fe0pUQgESITNzw0OFCxtqujF2NwKozXZ5em0pKYir
         h7S3xBwmEVBJEii2v0/CWP+zjpKEvxE6dpY0Z5+3gk/Rf9N465nYShCVW6JhgxOsutm5
         Xp3+wMSnJVaIX4TO8cIxSzOQHyVAwcMFnLZkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732651; x=1783337451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v68a3GvjDt67EscXY2lZ/DlUh5IwMqRFPnauIX/l0kI=;
        b=BgcCug9S3YVLvqHGbAOZtg1UdIoE5WTt0BQQT0n3niqX1pWmB8hN7yiQjovbUGuVjV
         kGcNc5IsugOu7HPxYE4WNBzizXqwzvvrkoWPC9AAtd/l9GgIBsrD2vF5f8g2VblRHOMO
         0PSUGxKGwlbKRLKUvQ7LAw6rBUe93+eWT9DVw1q0Oa7XVGOs2c9INM8yhUdIRLueJJcS
         vHkacksSWnNGa3qkllWzm98j/VFil/2C2LRnE0B4VKdSL9pQ2goV6R3olkfaM3tBjXuf
         bmwXIp0/1FuQxuaw14/LCi3QOj+T2ixEwZMQZl1HwlNRUnU/zUt+fSm1PSKbed7+C2cE
         JfOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLMigUMxlo/e/Lkldd4KcdJztZrX6SGUxs7Xkpk+L5+ZTcixGccr7/AG8GQU0sKN+Sd7LOQWNlX3XbNZz1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxll5621a4V9uXGRWlRsHqOmrLfh5Pu4xZRDByYSp45+GFg0SW8
	JqhXyQ0NjvQTTfUXSM7jNYAGD96sl5zSF+rmN1+7PherSOvk/72ntA76a4OhkpEagw==
X-Gm-Gg: AfdE7cmVocoXH/cYut954jgvbWczmdXOexlYZLa9NM6y6Aatcvqp6iJRLzmBJwu/eKL
	SClkcEalYgp6vBTYLlKlupJOSxTHLoUg8JECSrGhdPX0ZSGd0FQbO78bdRmbVTY+4OUmF61EWSz
	g1ZuRb41u1xEMMS4IOjiNSOOkJObovS5NYj8e6zOEUZNA4yrT/pEtV31RbwvXBziH70OGzjE5A2
	FjmDsnU252Sl3KmyM5rIfAqQ/YMPTeImRr2keVuSZv9ZVksMO6XoAI3bky3w7VKAR+zV6qzsOoR
	3fW5RmP2JpsktHEFxJ+orWyMd/ujNAjSRrVU0G7HkbmoyuB+HgWkJD2AMJewU2gBoYtEtkgIkia
	4KH4bxkKtwI61MvfgNZYBcFH7z7sRzcrHWLAyK7xWLOp/g6MNikUu5YDI32LPzCKdSld6VgV6zm
	d6DgSTU/Vj4RSdBkWBu6/BiGwweUUBQsniJxJHmk0g4SUXWn+NVZjzoF+8ET2i5IKAuNQ4
X-Received: by 2002:a05:6512:2523:b0:5aa:690c:6636 with SMTP id 2adb3069b0e04-5aea1f593d7mr3418663e87.26.1782732651474;
        Mon, 29 Jun 2026 04:30:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:43 +0000
Subject: [PATCH 2/9] media: iris: Replace ternary conditionals with max()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-2-5884c80ee3b6@chromium.org>
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
	TAGGED_FROM(0.00)[bounces-115007-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ABDE6D97BA

The max() macro is simpler to read than the current construction, it
also makes cocci happier, which currently throws these warnings:

./platform/qcom/iris/iris_vpu_buffer.c:703:13-15: WARNING opportunity for max()
./platform/qcom/iris/iris_vpu_buffer.c:583:23-25: WARNING opportunity for max()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index fb6f1016415e..faebb5472866 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -580,7 +580,7 @@ static u32 hfi_buffer_line_av1d(u32 frame_width, u32 frame_height,
 		ALIGN(size_av1d_qp(frame_width, frame_height), DMA_ALIGNMENT);
 	opbwr8 = size_av1d_lb_opb_wr1_nv12_ubwc(frame_width, frame_height);
 	opbwr10 = size_av1d_lb_opb_wr1_tp10_ubwc(frame_width, frame_height);
-	opbwrbufsize = opbwr8 >= opbwr10 ? opbwr8 : opbwr10;
+	opbwrbufsize = max(opbwr8, opbwr10);
 	size = ALIGN((size + opbwrbufsize), DMA_ALIGNMENT);
 	if (is_opb) {
 		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
@@ -700,7 +700,7 @@ static u32 hfi_buffer_ibc_av1d(u32 frame_width, u32 frame_height)
 
 	ibc8 = size_av1d_ibc_nv12_ubwc(frame_width, frame_height);
 	ibc10 = size_av1d_ibc_tp10_ubwc(frame_width, frame_height);
-	size = ibc8 >= ibc10 ? ibc8 : ibc10;
+	size = max(ibc8, ibc10);
 
 	return ALIGN(size, DMA_ALIGNMENT);
 }

-- 
2.55.0.rc0.799.gd6f94ed593-goog


