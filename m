Return-Path: <linux-arm-msm+bounces-102647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLrQLfLI2GmkiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:54:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67B3D545F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D77230BF030
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EC53ACA7C;
	Fri, 10 Apr 2026 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsTSf6x/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XA6yBmzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7423C1413
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813756; cv=none; b=PVwohsW4SjanJF1zAsqYDQzOo+l5ygfxAVoboH1WZQNbEq5sPoUvLNIqVdk0zWfgvrMAA2m/nQHduFJc8LNqehUTjHQkUXq8vSkSH56llrqtsL2xEcDYfMCjdaeNA6h7oH1ewjP5FOnvOhissnLivdMtHzWN7is/El3Xf8nTErY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813756; c=relaxed/simple;
	bh=5dPPK/vqSa+qtBhbsYuPVQd47tbzmeUp7YSNmjusLwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0YAGr3gKOlwbF0SWB1MLTLXd4Ua1dyXs/kn67ruELBEX7kRamYHfNyGfwhiT4rrZ3jh991ql/xHlzlZEydiENuvBZpiv36qibVHgidLntT3wADy0VAPBIj9mXZS8tFWE/kARQqkIYYiVvqaQmvFNqsUMUpei95LCZA5unpnQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsTSf6x/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XA6yBmzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A7hXP13934972
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61XgEuen/vh1qSyxqs8oQ2EWPQNDTMGXs/P/Z/wvWxc=; b=dsTSf6x/NzDD4CAy
	0lH49QILi6G+snmybk+DgUclv6TEZSEVj40I1j3wVKIIbDnVeU+Kn1T4dgMVlWG/
	8v+QXi+PWvbLEVqA/D2+rR7aPnXuHTZU1CGXHTC/UtyEgK8AAwkGu+pWe1012RYo
	Uz8RJ8LkFT/NtG5akvbqDLX2CG1nzBRogqzUJalmsOBAH5eN+hYeLxobJu4JXUeD
	O2F53Bsnwn3Ir1EgnUtCYkZyfKiRzYcCwOwmNHiEVQ6tJVrrPMFek3wLOqg26J+I
	J8teCbcuQOzFT9guTBJC4S1iSP0Xp4UEmDKmjA0ojSnC8/0yK9HXJbt4GZcE+rRb
	GAFzxQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sbfua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89ce375c788so40987816d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813754; x=1776418554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61XgEuen/vh1qSyxqs8oQ2EWPQNDTMGXs/P/Z/wvWxc=;
        b=XA6yBmzk9WeNVs/nkYzJUGHK+attnaLKwwYeeoPgpPp/SRllK5m4BULc8+zqPht+OA
         /HHdPSPlmje6wCa4YcoalnNVsGBn7PPjCCIlou7i9aeXzVgE1jG8SgKdpKicQQVevQ/6
         89uqkivZ+2g4Sm9K5IbRk6vgOp2z+CAOFb9qNaZUhnmQFbSntbk9y48h5yLw7D1XT2Xg
         1QzDDIU6U1JtueCTYg9S6anJoFRRKRV3annzJTtR8zDsvMeSpdAwa7Vr1D2r9FtZqtCp
         y9f/xvOKr7NsAGSuDI/VKJiF4ZrjxNGTAVP8JHXz9oSIdSRackyppsLkp8UpxX2rVlo/
         dhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813754; x=1776418554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=61XgEuen/vh1qSyxqs8oQ2EWPQNDTMGXs/P/Z/wvWxc=;
        b=VG7VUpYO/5YfAKiYf+0t+/xEdQTu4x217e5ujRT1gx1WfMslcEln9b6YGEjYBV8wxB
         05gn/wseEs6VRQT4a6/Qu/UusWKQ7IIf/988yUCUsseXatPkjPRkocNZHSAYJCU1ejBt
         2RzWgBa+6A2z34ak7Yio13+b5RdLVdDMpi71QkggpAQLQFQUhz8JorBIAdgBTT3mqhQp
         e9EOA5HZn6y7wbk//lm2LdUUdOsqpz2G5JqRWGuMqtj0s0MR7fWZsFRV6e0GvtMa5vFb
         8fQ1OXdc+yTvnSAOkxJzrMID5hXL+l3aYIdlhSdvcPaM868DKeoJuCdjxrfZnYQOK7YG
         c10A==
X-Gm-Message-State: AOJu0Yy9w4cSqEilhwvj+TIHTnpMdc2j2CM3XuMu+h+gux9alMtVdexL
	32/xqS5YHmTEKLuI0o3weakaF08RkbcHwSINOC5Se5WHnbL1x5eugqhfipfotk5J2l19y9sa6qT
	bqBdFHuq9oHXHdvT/+gYVFperALA3CdWiux40RDIcly+LLEtCfMGN/YE/wE1z3jrRuFDAKC3rLT
	oixVntsg==
X-Gm-Gg: AeBDiescnXKjfnNUBmslueV57DoUvysdP8asENfVEhbZ8QlxPVhDYRgdMXye+dZbAlL
	KWPwxBbVQ7FbrL/nb50HD2huifGsDMcPw8cTXe43WlktYwU8MqA9k/TFIAcyzz6iHzCybCgHzrt
	pBT+zN1gdI92y5/NioGpo7UUbGIUcqB7lGu6Bno9RKaBWk4vqKNosuOI3kZFjd/KhKXhLmiiWYp
	jal5x0kvF8NpH/m2dpLZFFYwmIpHX/u1Z0PA118koQIYll8TY9aVPSqQ4yJJny1wkJRTQoY9jQJ
	Ps/Gaxz1RY479byce4azF/q/KJQMoARkAr5PJZ9xqybqyoGV7WGy/EB9nFFmiAcvljPfPdiOpmQ
	srZ+We94UP7n26h2l1knNh0xStknFcMDGQmhFRg5KGrpsZoeXC73B9BQlTfnLP5mRQ97lFO+46Z
	+GJIxrX5k=
X-Received: by 2002:a05:6214:449e:b0:8ac:7f70:4441 with SMTP id 6a1803df08f44-8ac862b51ccmr32891236d6.48.1775813753747;
        Fri, 10 Apr 2026 02:35:53 -0700 (PDT)
X-Received: by 2002:a05:6214:449e:b0:8ac:7f70:4441 with SMTP id 6a1803df08f44-8ac862b51ccmr32890866d6.48.1775813753334;
        Fri, 10 Apr 2026 02:35:53 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:59 +0800
Subject: [PATCH v4 24/39] drm/msm/dp: simplify link and clock disable
 sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-24-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=1710;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5dPPK/vqSa+qtBhbsYuPVQd47tbzmeUp7YSNmjusLwo=;
 b=YnPj9rhLUqX0YMJuz2KcI13tmzC5pqiY6d5hLKxDeRa5BnhKKAvFXqZZs0G2L1JkUppp16Gyt
 XmGF/bb3PUMDT1iH5NZwq881b4Zg+vYe031JZuwYOXjWIRCdbH16bxQ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: W2xuAdxMi5p_DLdvYcOayxl6a76Vnlbg
X-Proofpoint-GUID: W2xuAdxMi5p_DLdvYcOayxl6a76Vnlbg
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8c47a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kizIpwokdwCcU-m5XREA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX0PbnPAhFehtb
 xiJCL6rHr+YwTOudvFYhigRBE8gAeJ5QS5YWiWuMDlX4iY6tdRQPMk5fgyOs4U/oh4WI8WndHXQ
 qOrRZVxTiS1O3YDrzWpLlgRaXVeZdijroZ/WBqsUHq0oXePm6AlE4MiqkXO6EW5ii7E6ZR6D1Ht
 nCovEh4LbmDGkOOxwSU14oGPz3fyF3HBGh1fMe4dy/kvIbUQp28EtZBG5iDmuq4jS1eq9kP4li/
 rOcnO4PT6hk4Gix21b1sJvMWdz5JG+HhyNhjBxbEGoJNHt/qBS6es+F/yuVRW+5bJVfjdu853HN
 zppQ47UaKJ2wkfr5bYvcGV+KveWKjbZ473nyqLcFVONThg0rjK0JGsYL0MblnRYO3QPkfIP6p0K
 F7/b+KEXPB4NhwgmZZH0ICC3uuTIAxls5N7F5RK0guOOjHN9fQJ6Gfgb/GnfY/xNr03h7J6IZ3x
 QoRM9q6oHn8DudlY3+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102647-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B67B3D545F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the common disable steps out of the sink_count check to make the
flow easier to follow.

No functional change intended.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e8028402f748..7b3b9160e005 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -734,28 +734,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 	msm_dp_panel_disable_vsc_sdp(dp->panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
 
-		/* set dongle to D3 (power off) mode */
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
-		msm_dp_ctrl_off_link(dp->ctrl);
+
+	msm_dp_ctrl_off_link(dp->ctrl);
+
+	if (dp->link->sink_count == 0)
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
-		msm_dp_ctrl_off_link(dp->ctrl);
+	else
 		msm_dp_display_host_phy_exit(dp);
-	}
 
 	msm_dp_display->power_on = false;
 

-- 
2.43.0


