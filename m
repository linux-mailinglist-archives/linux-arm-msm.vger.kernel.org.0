Return-Path: <linux-arm-msm+bounces-95659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBbdLQeXqWlKAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:45:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C225213C15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD75B333A662
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F293B25F96D;
	Thu,  5 Mar 2026 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrfCuB4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfcavfrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014B13C918
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721092; cv=none; b=lDa4rtHSYRYxVOA2APtM9nNRoX4iC09S6k3cwalzAsqTSPSfk/3DYevMlP0x9n8WGI5SMntR3M4EiNuKGxwLa1IgWJYyI7f3gt9vkGJsws+/sW3LaOFW/bHUy+Q1Qgkx6wr8jGkN0UN64N8rd/BGoYuG/Zu2UnAfyNP+6yQsm74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721092; c=relaxed/simple;
	bh=I8rK6s12S9h0XB8WDnncnpqwoYXRqAwrD4SMU9QyTY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7L26KtisJ3CCQaWqrqscrxnq1WcaXDoJcwydC1l5VQ4BfjioSxYvQeDfjWsraLRwLBwon8RoqOQYx63LP8cwvY7oAXxMnqQkmvNb42sz/LIusmb8r3ot+uJIPk92ZGm9gfH8PE1vQ20lDns/91em2SDQkQyzSYDcOOVOdBvRVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrfCuB4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfcavfrB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFoim456083
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dm662BBng2zzi9pxMPe+Dyj+lpwsz7Dp0qh/kR+KjPA=; b=CrfCuB4TEIy78dAo
	iIoiWxZ9KGKtW++BM9AJiBmrzVUSTvPFs81/20wo0W+hTjGat6rTS8HzeubwEMpF
	uUgmJadesF3QDV3LCwaX+Hvej/rOCpHfglvCF3tkPZMVbA4itWfyGb1yh3njZBGe
	jT9N9xbB++5/JvJ54q26TTG7gXM+jHhaU9cdIAHrkPpNam9bj0j5qNSr+oogV0tr
	5bQ/UMqb1rSTLyXWk8zwxV+JzmwqfXQ+2dSMI1uxElHi2h7klvLeanA9AhRaKgof
	Sawvsmd/Aqz/CPxXs+S1gQTBd1Dp2HuGie9nIP8tP4H+ThFmurKTWAA0o+/fcC9b
	pGYGPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wkj62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:31:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0796368eso209179796d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721090; x=1773325890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm662BBng2zzi9pxMPe+Dyj+lpwsz7Dp0qh/kR+KjPA=;
        b=DfcavfrB41IjIGRW4dA2YI/3W+s2FROqKOd9dUB5PdEG0ZalB8LExOtxS3QyDzZTIl
         QhYes6GS1e9/NzhnzEGQklsg+kZvZ2NnxGEMr42IccRUWlBRW+qN+IfoZknBJjKQpXhC
         iBI5lTuGfE3jp/tduMdo3ivJXaIFSRIRJ8BjWj8L918mg7u8buKX91ECXGxLbKE8LU7m
         0kJ//VkOJCa+7KRHmY0XNxzRg5q3Xpg3V22H7tbfB10t5cUhKMq+MIpvLisAL1TsUJ+g
         VDT2SxbeRmYoa/+MiFvvAIFhxGu0RsWkDsiTHosfBWPL8acJcfFQwKVz4pgTMfgJDsG9
         JPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721090; x=1773325890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dm662BBng2zzi9pxMPe+Dyj+lpwsz7Dp0qh/kR+KjPA=;
        b=jQoAI9+0s+anixsGXAwX/J4V2cLe8RixMawvRVeV9X0FM24noW77wOMPYjgOVMTKaL
         aNeGrNIRkOT7Pttg9MgwB5KtiS7Uvh6QsF8ieWyfcM4J0GK1BPbcFwc++CdSuuBhJ0AW
         rswfmrzwGHlCJuOw+zutTaGOAs3y7VHuXlylWQ5Wqwzy4TBmpP3BZU+GdwFuT2p41e9o
         zZ/DoQWuVACbBQ0gaVd+gTeEQ6Sfsb4cXi223NNDz4j3rUOcQHjJy/tNdz70Qj1oTCG9
         MupZbj8B+x4H0yGxosG5HTvT1noLGk4iLdqS/IDVsXIzV2nVSRYiSAP5Blg/iEqDqaQ8
         v4jw==
X-Gm-Message-State: AOJu0YzwVPMpuPHe9cwndDQgCo2vuN1Z1jngIqufiyXA1z2F32Flra2F
	mbSC79TKXpXu9M8DnLtUVLd4EahN0tJaGolZhCZfo7/ik9VtFhvN2DrFUovmJKQlpxh8bJhfPGG
	GbQ1R6LItfgAKCoJ79UG52Jc1+gVf8oXG86nPVPXPt5NIjWd+se2qJyobVsAUImXSzKAiMWrx7X
	RY
X-Gm-Gg: ATEYQzzhw4P/ruaHEda7Fj3JGrJpUgtRvUAIED8iUBIhAKbggG3kKo4+7big3vl73Y0
	SZkeMxUnjiheqTfQPf3+emJfT5k1chLfRMrEnGA99lIRjIYUxsxwxDPsQUUo6wC5MhZbDFwUWY7
	Wy7Dnf1camE70vmwUhXlFadA7A+Yirs1sHVHjMTU2S1/fqVL5LmBzd1VhKd4CszJFmZB67DkQNa
	cosf0ntvYWXNLFvD5MPQOX8EsgYFbItF0v2YAieEpwXhhrFdhuvsIz9Ju3lfzylKkItBaopbtXg
	aKNVkH29guvHceE/ylhdIY8Z3AdZk1tCrkBhNF5w7vV9An/W2oSKjyDgMa9nJRyy+4XikIxbe/g
	SzHjzQ34c+m3SjY5YYYTxA94YxYYqlFxoBz41hIeuyG64g+hwLX+eLisXDFI4Oo2Wo0RGOnpVzS
	D03eR5JyHs5KAjEcjCyAi7gGTUBGc1DXZF4FA=
X-Received: by 2002:a05:620a:3949:b0:8ca:3d7c:e74a with SMTP id af79cd13be357-8cd5afb208cmr653174685a.56.1772721074516;
        Thu, 05 Mar 2026 06:31:14 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8ca:3d7c:e74a with SMTP id af79cd13be357-8cd5afb208cmr653031485a.56.1772721058621;
        Thu, 05 Mar 2026 06:30:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:30:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:47 +0200
Subject: [PATCH v4 5/9] drm/msm/dp: Drop EV_USER_NOTIFICATION
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-5-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vX+57P9cyOcJ2Ge82Wk30SNt2ZHf9zxIx/x8h+QULh8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYq3v0+B1pdezNRiSo6SlWnGVibturHchqG
 U66YpfGOc6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1VP9B/9MBpJQ817H4AWTAIeZy7HcR8b+F65w/PHRo1ul2hWes3E1XsDDCmElfIhf4be/s0bxiRr
 Jp67xLF9WHDJj4Uh3b3qtY4lzu/jSFbvq49dSuQbKM2YGaHlXxMaUf8TqQzebyoAKVGi+pvS/Tb
 Hm89tMD4kuclG2akP5018pHVj0/YC5U5yknRpjJQ8cHBGhhFNDZBItUWrGsDQQ9Jj6+Z7xWt6hF
 zDX7crLLzRorpKtKZBv2mFgEmxmlEeyJXn9U5sROqfRK162QOw8UkRUwugh+24QjtBUtXQessiA
 782kSvQ0N18HCvm/Ex75oJgPQjShSlNTGICPc2M3j4qqVH2m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OFhOjxe45yPqZkD-Kp6blg1dYz8Sw9IR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfXx5dr4iMHhZhB
 SFMFp+5lMeK+625+Q10vnzYAMw3Ace1KMYXf78NgyItJtHmkyG3LI5eOHKGYpmwW0Mi/FFYuDo9
 1CncLiZmwSycItHF2nVFfomOP55lhSFVccKETzSQQyhBc9FADQPCwTlR6KTIdQOx+iTSsYC+KMQ
 iq4+tbtE6wP1me4IKfW0slxw9WpL0PWATQZlF503sBR5wfVTHYjM7sbTJeB8z10uLtfXAlo8r35
 a9zJKET64Q2nXKKKyk6P7EikGPqQPWgPEaBWTM8ObLUaYaCJ4eqiPjcXlSxc7drYk50V2aso0hS
 LBhij2H9dwyp3svqk8/PXKRPjw88Jeofoez1kDt6qNRfETlbiOsaMkam04NXn2OcDLYJWItB2lx
 q+cUFpeyc3hjdHuq7fDeTQsJhn/MiZha7DDtR8HEfM4r1J9VygzLUX2vdRHJV4ZTLoZIzTShkL+
 ZxwCWKd7Y/LzMyCHtQg==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a993c2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gW5k9mFOS1cgrKxYKbgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: OFhOjxe45yPqZkD-Kp6blg1dYz8Sw9IR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: 1C225213C15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95659-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e7b1ed5491c4..05c292e27126 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -343,17 +342,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -377,7 +365,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
@@ -437,7 +429,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -506,7 +498,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -527,7 +519,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1121,10 +1113,6 @@ static int hpd_event_thread(void *data)
 		case EV_IRQ_HPD_INT:
 			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
 			break;
-		case EV_USER_NOTIFICATION:
-			msm_dp_display_send_hpd_notification(msm_dp_priv,
-						todo->data);
-			break;
 		default:
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e4622c85fb66..f935093c4df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.47.3


