Return-Path: <linux-arm-msm+bounces-102652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MmHLi3G2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E63D518E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBE5E30BB4D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C05A36E47F;
	Fri, 10 Apr 2026 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqi9DRV2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jChcXCfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3F3B2FF7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813781; cv=none; b=QJnNUmQ6oJt/T6sA//2KO+SqAWwCdOIjBDY45ILWXQenMJQOiqU/2u5JMFxw2JMrVxQ7VhO37gbTMlSKY3frXeTl7n8ycmpmv2z3pOks6Yc1vhTeQR8p+l3pVAXK/SOqvnMYQNAP9VpOi8awIxX7PG9LjqOHrQ2NqtlidUh5S2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813781; c=relaxed/simple;
	bh=5dDZabK2gJV5AocCk4TUlNuPv9LdzUwUb7VJN5jSChA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTs8hw0HVa9pEOt1DA+6seD8VlwRnbuU8Erci6Rv3Bw0mddXE0LKFucwJjwS0SCAJLVsGCKRAZ5VsAMFkmTQYBZM3TLyLJH+LJEzKGO4RtuBToenQGSCzf5r3nmDxj7x3h0RcBBu479ZSEDb8NmkrTzCWNxL1T83HIZeSb5grMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqi9DRV2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jChcXCfR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5l4fj2866291
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQPABXuaBBLVN92KBP183Zw7YQBShFEgYenJ2CGRAHY=; b=aqi9DRV25sUgxeXH
	tcj2NOJP4RQuAbWf+pI05k8XLW60kRBGaYerRqyILNWaBpVLT1vqsug3s8THanmz
	VB7jxaBwl2wPfSrmZWIKHgApvmaPLAnRMHeSlOzf/B7dLurWTlyM+dOISBGN59b+
	K1oj3pprI2HlfX6TkkjKuX9qGVHJzO1aS3STYss1MYtAkhwcU1y2aS8IZubhClGm
	+z4odfiTVoJG2gAm/eE3MIBLpoGiFIO4+T58h67rcGf3n4Dcrl11yDrSnvaGJyJK
	mt+qWtmjTOzOUXLiviSx/0DN6I8P4jtcdrAQyn2zrxjvPxxJShxxCcrYQlupjbUT
	qZy6ew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decaykt5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a1f96bf221so62770586d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813778; x=1776418578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQPABXuaBBLVN92KBP183Zw7YQBShFEgYenJ2CGRAHY=;
        b=jChcXCfRuyBY3BN+P+UhcPSYxtJ1/F9vbf+vpqEGHcGPRLbPEIKOpv5r8FRw3B7OCW
         Pfini3PSad31chN6JqZYdD1MfI0yQHDbdIXpH3u2j6qFo5LnZYss+HC/uvPhkD5hefnI
         x+0SzaxkZkdKHBFOzkhch34BfqTJmLKEzdk456F8GzXgkymg4GbJkrdmSWQO3bTL/3Pz
         VROaz+yoqPr6LHrePeFU9Yg4Bvf1CZasyZPzTuDMuOfGxyNF4jY6iOcE3L6icZpBCNRI
         7Dy1D8xvAri9WVSEB0wBsXl9EeMLzLBEiLVz3bHjgMHfC2SPnA4JhKNh3IEwEsv3swoT
         M6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813778; x=1776418578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQPABXuaBBLVN92KBP183Zw7YQBShFEgYenJ2CGRAHY=;
        b=D48hD1AFbu88JO390SOu4OH6lcEBWpwb9nGtnILFmXqBJZAM5zamnA6moLVnKeqlgb
         9x4mDUzoBbfmehX6uJTFvpOROGFSCPBWPX6eYSD4XLF2IqS+YOyr1KwzpkL13cmdhV6L
         vovcuTvvr4QIVSds6uNPTXCRnmqfcFK8LDZoS+mT3iBmxr1eaZjJs9p+eNx+oFSR6DvX
         lyxS3b1Z5iE7KXGHGeuyexPGZfGxwLsjXatO3hpECmYWE5BGkcT2O85dCHxMKGVb27fj
         bxCUuqlGM3Xe+hFnkufge+sGG+PWOOw8Dtn3AG6wnyjkDRNZ8FfXyj68FYEUjOlYH8WV
         k+vQ==
X-Gm-Message-State: AOJu0YzX1uKdyNHVSKU8unZ/D3vQi4x9LX4jFEkm2QLWcHtRJBhwoYIT
	rQD+sWaQ0VGri0LooeZFOoqyBWqePiXKYXN6UqVIH98UrpYh7v7pugYkeF59w3Jcxw5r328mQ/7
	ufm+IZtSy0cdjsZ4bz+IP6chosEV2e8MQBxWVeBC3Le0DYu1q2jtTzMi2maOosCm1E5AboPJ/hl
	reYzGajw==
X-Gm-Gg: AeBDieuviL5vrdf8ZQGRUURQyimbBnO/R6duVLo2yXsg+t41VcJmuS4CNXnHsFM5e79
	65IcE85szdl8/CA5J6o2GTNKDuzeNmuBYwapynvcsIyTwz3Xuxygc4NrvzyoP2RtVwe0pB5mlta
	twVPGpiTXMTpCPuakV7xRM4YzyaR51y7+dfRPHxMgdPGNs2K1C7oSbmZC1tBtiMzKQk+3qCtuaN
	RiGo5Zms7epx1myv74j8P1WlQk0HOjlXvd5n/vcrlkbjWX4HWMd6zWEG4HScMjO05Uupdk9iQEy
	9fGmFxzlRgva6OwbgsOkObsGAHQoj0i69MqQZOlxzy9dfAGIJH6g9BARaNrzYhlFusGzLVNzDJq
	sDw2RzJew30+xtt78+SrLxgHmVLB2KeGwdBMIkcanmFzq37aNBw7QqGbjmHSXiBSzN/tk6+ncc3
	nEHJo86rM=
X-Received: by 2002:a05:6214:4018:b0:8a2:3f80:2a22 with SMTP id 6a1803df08f44-8ac862d6535mr30227166d6.46.1775813778151;
        Fri, 10 Apr 2026 02:36:18 -0700 (PDT)
X-Received: by 2002:a05:6214:4018:b0:8a2:3f80:2a22 with SMTP id 6a1803df08f44-8ac862d6535mr30226966d6.46.1775813777733;
        Fri, 10 Apr 2026 02:36:17 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:17 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:04 +0800
Subject: [PATCH v4 29/39] drm/msm/dp: add an API to initialize MST on sink
 side
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-29-b20518dea8de@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=3422;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0Fikc4rnY1UekND7dRzqfk9ihtHHa+1WVLOx8xNYQ4o=;
 b=8hLy4E3IvJa2/IITkmxuQf2Wv5ngHhhb4QUgFjbsYdAiYbRSJwQd5KzIEu7dyeYgwGFmLpyc9
 HSXKtsPBq4vCeEwjzSFU4cgwzG5Fc6sYOnSxY1LINd1pZBOCqp2I7U9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8c493 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vCCEq3Mv4WXTdc8uXsoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX8efaip1oPYPJ
 uViim7PrUPY6jAaINeUeEKmBRdwhSyMIiMGiyD0+IUIuUd5l5+rXziBbLHDsMTzvSWLTypxv0wO
 kSJFeVZNN7e/bqvjEWDsQAUIPpYdzie2bBuksWUpw4l2uwleU+KIOBD/X2JXp1SL2JEY/BDAb4i
 gfORfRxXhojOncZnH70Q8VLkFIXawYiu9mb4bgdnv65WRk0qW2zNbA64L8tp4dDneSnRv+0+vRT
 9cqRF3hQ16Q5ukoQkB3HXAH4iR5OWIX2QlsG/x6IHCsVhuI6+PTSC8GEERtccJT1xLMt0PdC9UD
 PogBXQMzMgClF9qYMOOWzVCVEpkflO/RikDD0FikMvdfRlGOOfj90pZD8TEs9yRDDB6LAy1P2nO
 e3EcZMg7tz+vX03BUatIJse363N89IkbpJAfEEBmc9wm14xrC1tsfZhlDLuUL+P3oQjZT9SDw1j
 rZZXcUu+ZKAlw9cU6Ag==
X-Proofpoint-GUID: DbNqymqJ57JZaSUmRUNYAmQOoamHm6vJ
X-Proofpoint-ORIG-GUID: DbNqymqJ57JZaSUmRUNYAmQOoamHm6vJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102652-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 777E63D518E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

If the DP controller is capable of supporting multiple streams
then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
DPCD register to enable MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 57 ++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8ae690ce2b9f..abf26951819a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -270,6 +271,40 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
+{
+	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
+	u8 old_mstm_ctrl;
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* clear sink MST state */
+	drm_dp_dpcd_read_byte(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
+
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
+	if (ret < 0) {
+		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
+		return;
+	}
+
+	/* add extra delay if MST old state is on*/
+	if (old_mstm_ctrl) {
+		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
+			   clear_mstm_ctrl_timeout_us);
+		usleep_range(clear_mstm_ctrl_timeout_us,
+			     clear_mstm_ctrl_timeout_us + 1000);
+	}
+
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
+				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink MST enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -288,14 +323,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (!(dp->max_stream > 1) || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
+
+		if (rc)
+			goto end;
 	}
 
 	msm_dp_link_process_request(dp->link);
@@ -317,6 +357,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
+	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
+		msm_dp_display_mst_init(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:

-- 
2.43.0


