Return-Path: <linux-arm-msm+bounces-117378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VYe+A988TWruxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:52:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D571E6CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:52:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PcBVRQ3a;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117378-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117378-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BAB93008461
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 17:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA0E438470;
	Tue,  7 Jul 2026 17:52:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA088431E4F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 17:52:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446741; cv=none; b=r3IkzdBAeZq5DKW2CRgyBVnCARYfLT4R4hiNDkQXH3EOlHQKpLVJ438HB6TqS4LQPSRIiMDM+Mdypkvw29f7tJparU3hOecCtv+ziRD+5ZYXStGfSIBzf7CbEeADdipD3+G6bf9DkDD6kB397IW/UmgM/rpzsaIBXqMH+AKaQ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446741; c=relaxed/simple;
	bh=PLTpZ2uaKIACZG1itnN1nSrxyn8t2NhexmU83EALikE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+2320L/wJCule6SptmKG/HLGsDLje2wd+lWWup36rB2HggpoWlKFs/KoOklaY0DaKp+mHwbmNSG2YLe/yuUXmO5vf3m35SVhI/8V77x3zGaS11tEjQuweWz8efqewphDW4cgEGtwnTxAZzcVoLA3AbSocQ4+vokYudUywjnJwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcBVRQ3a; arc=none smtp.client-ip=209.85.222.174
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e99ef0902so190316085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783446739; x=1784051539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKpLi/aSU1pvIw+0U5MiuZ/Ta5E2utuxKfUPqmuk/fY=;
        b=PcBVRQ3aHn5sjSYllmYwXvZ1jrXneyCRHhKi11sV/dDHUHiDhFKs4dNbs3EEraS+th
         594eHPUwoUKnr0j78irPPP51+hrntQteNAk1fE9FwEoXPOCqpDd41Wro+Xoks+GUZPqO
         nrjZSlwixgo2gQQyS0aWWgM7PHIEhWZ4e/UMRK8XrA1LEmhJ4kmcDcJ6Y8AFGBNDm9fM
         fmFrf53+SOYCzxiyFhatgj2YvUjSVflhDBf82Ao85ZlRTY6gkDks0YYRrizAYXL6RlyA
         yn4jsgGoHE66rG69cWOZEBHDUdgCWPYTvCEjHcJyFNVNX02AsyzGueu9DwrYS9jdeU9s
         i35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783446739; x=1784051539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKpLi/aSU1pvIw+0U5MiuZ/Ta5E2utuxKfUPqmuk/fY=;
        b=R3XGjC4fMNIdfIs+3T3+jDWKRst4njB31PJayIPV0h/bVk+7N4dCSgVV3URPa5C0q8
         bPsoGrUdAZNCgEHp9V/7aeRbYbku2ZhkiqjIjxthsDEmVAZem3U8QMF7+X2hGEr7RIjB
         7Wo+m3//hpOiMOTfsLZogCZTbQwQn5q7flh9fTioEF5Y/l7ENHzrqlXH+lhfQdySM58E
         UybRVklqZl0uwA2rNn439ioSlnfOB/aDq1/YNCabgN5e8BzLgF1CB0uHUV2jcQ5ymsu6
         gC6acsqKwFY0gFL/7GnWvSYjKoTcaNM536yR3zOTmFnbr97VV5a2LUKobFd/DJsMXrQ2
         QwPw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2UK3LelMK9winlXAj5F9NNF1P3tVwh4WEqxpi49I4Xko0X3S+4ZeQGWQZn24mmq81mUuw6FfmZ9injg7C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ZcEqSSoTMl0MCLad1G1DzS+IE8Tq5S7nTYwMbmADVcBdzD3V
	GfTB1FQiLoB5R+tGmQ//JsGoCmdKf0BFPQr/+AZvqhXq8ZygBHn4N2j4
X-Gm-Gg: AfdE7clksXx0od9lDGfOanoU4CPLI9hLJJZ1N9dz3kphkYGft2BAJMKmyZGi1RCRm57
	kmOelRvA6RWqyro18sHrUVkCZSCkXengVCsYx/KgY5Jv/TLPi957hDSDiirwaWM/10Ezogv6Rc+
	pboRPpx6yG6fbFLDXn9JRgY/zTt45tNbOk1Xi7e2busenNMygqfSNfVcuJ+jlekWnxzQpoe0z3M
	PzZIv/W/r8zlBeieU3/TuY1Dk6XweFbu/AfHnmV3Jo1Yd13cbLfkJEYmICGGsKt6vtlxBzPv3JO
	AKpDuT39ZoIr+TB3OtXFpU1bDB3CeTlTLRTNgDK0OW5Yr2UErTN8SKwCFynm9JH4+UikBNEffJk
	fxRZcw78F21jRwvWsbfPh8e3XT6p9FLXdEG0syOxedv8GTY4jeJCNDHXJd7qeOcQkaxD34WQTq6
	IfotZUBO0YOMVCwfCGQ5LjVxRm8yy3FjT4U818VXN8fwbKhMZCTvao1TBvPcCTlISRGSxUJYFls
	IYb0jQe+Pc5yY0=
X-Received: by 2002:a05:620a:a803:b0:92e:bd6f:b166 with SMTP id af79cd13be357-92ebd6fb78bmr488673385a.63.1783446738390;
        Tue, 07 Jul 2026 10:52:18 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cfdefasm1229880085a.47.2026.07.07.10.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:52:17 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Kees Cook <kees@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] drm/msm/dp: Disable stream clock after video-ready timeout
Date: Tue,  7 Jul 2026 13:52:12 -0400
Message-ID: <20260707175212.412699-1-dbgh9129@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,poorly.run,somainline.org,nxp.com,kernel.org,oss.qualcomm.com,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-117378-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:vladimir.oltean@nxp.com,m:kees@kernel.org,m:daleyo@gmail.com,m:nathan@kernel.org,m:xiangxu.yin@oss.qualcomm.com,m:quic_khsieh@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dbgh9129@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 069D571E6CF

msm_dp_ctrl_on_stream() enables the stream pixel clock before waiting for
video readiness. If that wait times out, it returns without disabling the
clock or clearing stream_clks_on.

Route the timeout path through cleanup and disable the clock only if this
call enabled it.

Fixes: 9bd0946d5ca1 ("drm/msm/dp: simplify stream clocks handling")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 86ef8c89ad44..139e9fa25d6a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2469,6 +2469,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 {
 	int ret = 0;
 	bool mainlink_ready = false;
+	bool stream_clk_enabled = false;
 	struct msm_dp_ctrl_private *ctrl;
 	unsigned long pixel_rate;
 	unsigned long pixel_rate_orig;
@@ -2514,6 +2515,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 			goto end;
 		}
 		ctrl->stream_clks_on = true;
+		stream_clk_enabled = true;
 	}
 
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
@@ -2543,13 +2545,17 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
-		return ret;
+		goto end;
 
 	mainlink_ready = msm_dp_ctrl_mainlink_ready(ctrl);
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
 end:
+	if (stream_clk_enabled && ret) {
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
+	}
 	return ret;
 }
 
-- 
2.43.0


