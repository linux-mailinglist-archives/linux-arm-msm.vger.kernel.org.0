Return-Path: <linux-arm-msm+bounces-110777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH8aCwqgHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:19:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973362B45E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC4B430F2CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4C33D3CF6;
	Tue,  2 Jun 2026 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZ1PcfUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFYXhU6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46C3D349F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391494; cv=none; b=rjTUExiplrYyEdQPjnDhMrQcw9T2u64588qn2YD6lKEdUiglcpOK2r+Hl9hcoAObYkXMXSPc5X1exvYX8yuvTI75pW4/fYGVxcoU8yij+nG1SNjKD/p+eONygUIHbjQ0yHdswWYa/tapHPiZUIg7uPK4cXx/bPs6Zt2ETYdDhww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391494; c=relaxed/simple;
	bh=HuWHEfgETeqeFInaSeDlkVr7MomHzKqKAmZIdQ6wMSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdnhp9+klWW+9+1B6UqeQ/Iudegm+/blDDtSuR/Fn+dFjXggqkNZQmZz8SbIp9EzBnlSJburf6FZVITY+ldXxvHxtp4CgMqIvXk8n+rXd1ZnaVRNcchrP1NORhPB54Qz6MXl4v5x1SN02FhdO/ZXMHOkAszmiKvcmgYtx4FJgOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZ1PcfUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFYXhU6y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tna51855109
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Duf46m0jTOVOH0fYjqS+1d3N2OndiCBozOdXn5npkR4=; b=IZ1PcfUf1rl4SRr4
	0rrKO0ahjDhHtkN4zmWWZNwz2Hh8hzBIPGJrMd3/vrFgYtefoDwwWuzc7q4YPcSk
	MlwnHnirbmvQpxgWv4E6bZ0xPkcoa3Ys4bvCviaH97lmv2vgS/a21g1GPhSo8lh/
	78deG6a495TavcqK74fKfY2r8+ZBSG02bP1xdV9LEf1Sh/afoVYtqi8Tgnbc2X9h
	VbZ5cvnHJ9JlFF0APRMfW447B9jlfKdPLshHtcP7JtIDiP18kQubcqSEk//ibDLK
	iDCQjbs0ZR0NfrssWWX7WlvtZXCG7h67B9cU9tjDhpSg+ANxeYzovFQsVHRZpLiW
	mZGLPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf78su0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:11:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176d5d7222so6955851cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391491; x=1780996291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Duf46m0jTOVOH0fYjqS+1d3N2OndiCBozOdXn5npkR4=;
        b=HFYXhU6yRIb9LePZyFiWgMYipWUM6xLh03HQ/7nsFFVvkt5wHlwp6MbWQ27WjwDxbL
         NHNSC4im8uSxMQispLTsMadB3jkaqJrlosq7RFx7M6s41YGWZlkP1api29Sx4q+e/jpl
         slSKU5/BIExaHf/MpBf8OulFKd+rmSBKIoJqVhmMvoH7QRLlwB4bQ/Uy/EW1H1xnDmAg
         feDRRtsBIk8T+J2/0J1O37VM8uoAR1lBWwLlEobevxjsNHht2qvmUMgJ5JSnHgn6+ADn
         bnrZCNb7hGs6dv4zAkvLArgvjBz6c7YVOQK3l9a3DTF79GOHKElLJzzmIZ1bO6S/OnpV
         YVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391491; x=1780996291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Duf46m0jTOVOH0fYjqS+1d3N2OndiCBozOdXn5npkR4=;
        b=QVKS+2mbvtGz/KFSkLm9mT0A+ed7YoTYcznDgWvaMuewyfg1CmlMQie0Irpk+Y4DxH
         fmLsbp048I3WmXiLLSvOFSLyp4uqYGLUzZJpw5Qh9uHG3GT920m+Ft66/DbIaKAva7v/
         XEiwwAZAgeACz0Q8lAL2sVSlESmF7n86BH6IWETmPA2Y22PbCzDmdxM6UsTmKRP7is0m
         PprxxRS4eLERj1EPBZPcGCFVezBp6ppOUMjqcj1DHQmkydZO3aQvtu9KUm5R69g2fSWF
         8ti/si9hn+K7M6PZCEY+qWShy1njqAB4MZajarxhElyvwqnHri/WCIFIqnFO3cI9Un3a
         0Gmg==
X-Gm-Message-State: AOJu0YwgBZZeWsMvEvU7R7Mo0ndPdTUVPlaJFY0j4r47cOA/n//VX6q6
	jnPgZukvyK8+kjSR6q5FG/bP8+cu6gh2gLpko/dLh4UsaSAym7OxLG1JlTb9zrU555I1Qc7gHdo
	jj9bwlKpMn5Hn/TNtouApeEzS0FyhBX7mtz0B0b1RIZeAA+W4QOQl7oXcUaGYwJXCa0wV
X-Gm-Gg: Acq92OEVQgZSk8mBOBS7N9lNlj4E7ou6N+f4koFKpY/kYaYkh4s8TfSFK9CLLoEmQBw
	eG77kKTPvCYduatOjNY9tEhaBCpz2xrYVYKpAgqRxjf9KwrHOpoB0RuBJzqix8Zy4one/cNx42q
	oy1GlJS4Wu/XKEJMxBfFkdayLI5Mqg/H34EZmnxSzmzT4WxUhZLeU7+UVv/120r/A5jVEexs05e
	dq3WT/R1ahrAGj2sSsuivIt2VRomA1L2bcJQcHBeVPi9IsW0/glAm8AfeCb5/dZhGenlqzCyVGh
	DmLhHO1TVXCUpu6PDmokOZvJfLCXPOz5TAb8FLLGihmjT2AHYbNcISTiOkcxG+nrJjHTCWXqQg1
	5zoWV75Y2l+lLaz6NL5vV4DHZRmsxECzlI2JzHfcBk+ANpwigB7bFbDDRICkfwYvdpYVgorDNvr
	KUN3N9NJoA7+MlVZW8IA==
X-Received: by 2002:a05:622a:284:b0:517:6ef7:f6ea with SMTP id d75a77b69052e-5176ef7fb5fmr10989191cf.11.1780391491183;
        Tue, 02 Jun 2026 02:11:31 -0700 (PDT)
X-Received: by 2002:a05:622a:284:b0:517:6ef7:f6ea with SMTP id d75a77b69052e-5176ef7fb5fmr10988731cf.11.1780391490741;
        Tue, 02 Jun 2026 02:11:30 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:30 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:14 +0800
Subject: [PATCH v6 02/15] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-2-2c17ff40a9b2@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
In-Reply-To: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=8155;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=HuWHEfgETeqeFInaSeDlkVr7MomHzKqKAmZIdQ6wMSs=;
 b=M69pZb0hXor2OgwRt9PIzLikRSelckTn7Ng1DDuYG7f7f/Lg6xBo4UBuvTKsw1Z4oTMeB9wT7
 Kp42JM4BCdGDqLlk4eDsjSgkqlc0A3YhqxTW3kIZ7iebQa6reK19O/2
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1e9e44 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ohAeICWEHyx3i1rom8gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: d8jGmAcns8LOJDeBX_3DFC2cpUumT3C1
X-Proofpoint-ORIG-GUID: d8jGmAcns8LOJDeBX_3DFC2cpUumT3C1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NSBTYWx0ZWRfX+j3HfWVsVimY
 xKQc90HA4vI/81ltcVp666f4uJxygd3fwrH0zQat4SiqSPG4xpu/TktRX/90xA5HczaL81c2sGR
 Sa5iuw1cjWlxeZJc2u2Hb3TtuvT+VuzKfIhn+izPhGnbdQcz020yzQtlzoudZJHrH3Cn3Bh+yXY
 WaYtAEbJY2XCgYR6dUnWG1QAUPIQI6LU3E8dDCxAknX4ZBk7lYRVMH9xfo2XgMPCG2y3807bGZ+
 wiGxukgE6kXYoCfCgMNroOl2lEMz5vEJzZ0dsZP7Wsx4gYXaXNSCwtV1nrOq19famHZ7MX1/8OS
 Vl0jXoe3Z6qQToswq2Ca7cJDduDvVcJE1pvYvoSGkSLZarLFdzUytffJjgYo8V7dhP3VHxsaNeP
 aEWJ2B3VevYHgGZiaPgA0y7zVtVgRv4KDGbxBamP/vWl1eAt+VuwjBW+bRv5lJfDDzO/O5uUgst
 bge1jNbhTxCc7RjIXMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020085
X-Rspamd-Queue-Id: 9973362B45E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The bridge .mode_set() callback is deprecated. Remove it and move all
mode setup logic to .atomic_enable(), where the adjusted_mode is
available from the atomic CRTC state.

Drop msm_dp_mode from msm_dp_display_private and store the mode directly
in the panel, as it was only used as a temporary cache. Both changes are
limited to msm_dp_display_set_mode and are kept in a single patch.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 81 ++++++++++++++-----------------------
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 -
 drivers/gpu/drm/msm/dp/dp_drm.h     |  3 --
 3 files changed, 31 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e3682c4d6077..181d238addfc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -63,7 +63,6 @@ struct msm_dp_display_private {
 	struct msm_dp_panel   *panel;
 	struct msm_dp_ctrl    *ctrl;
 
-	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp msm_dp_display;
 
 	/* wait for audio signaling */
@@ -597,16 +596,33 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 }
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
-			       struct msm_dp_display_mode *mode)
+				   const struct drm_display_mode *adjusted_mode,
+				   struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *dp;
+	u32 bpp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
-	dp->panel->msm_dp_mode.bpp = mode->bpp;
-	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
-	msm_dp_panel_init_panel_info(dp->panel);
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+	if (msm_dp_display_check_video_test(msm_dp_display))
+		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+	else
+		bpp = msm_dp_panel->connector->display_info.bpc * 3;
+
+	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+	msm_dp_panel_init_panel_info(msm_dp_panel);
+
+	/* populate wide_bus_support to different layers */
+	dp->ctrl->wide_bus_en =
+		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ? false : dp->wide_bus_supported;
 	return 0;
 }
 
@@ -1309,7 +1325,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
+	if (dp->panel->msm_dp_mode.out_fmt_is_yuv_420)
 		return false;
 
 	return dp->wide_bus_supported;
@@ -1365,15 +1381,19 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
-		DRM_ERROR("invalid params\n");
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(state,
+						   drm_bridge->encoder);
+	if (!crtc)
 		return;
-	}
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display);
@@ -1386,7 +1406,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	if (msm_dp_display->link->sink_count == 0)
 		return;
 
-	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
+	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
@@ -1446,45 +1466,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	pm_runtime_put_sync(&dp->pdev->dev);
 }
 
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode)
-{
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	struct msm_dp_display_private *msm_dp_display;
-	struct msm_dp_panel *msm_dp_panel;
-
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_panel = msm_dp_display->panel;
-
-	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
-
-	if (msm_dp_display_check_video_test(dp))
-		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
-	else /* Default num_components per pixel = 3 */
-		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
-
-	if (!msm_dp_display->msm_dp_mode.bpp)
-		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
-
-	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
-
-	msm_dp_display->msm_dp_mode.v_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
-
-	msm_dp_display->msm_dp_mode.h_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
-
-	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
-
-	/* populate wide_bus_support to different layers */
-	msm_dp_display->ctrl->wide_bus_en =
-		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
-}
-
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index b659d22f5f28..6ac5bac903d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -56,7 +56,6 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_enable          = msm_dp_bridge_atomic_enable,
 	.atomic_disable         = msm_dp_bridge_atomic_disable,
 	.atomic_post_disable    = msm_dp_bridge_atomic_post_disable,
-	.mode_set     = msm_dp_bridge_mode_set,
 	.mode_valid   = msm_dp_bridge_mode_valid,
 	.get_modes    = msm_dp_bridge_get_modes,
 	.detect       = msm_dp_bridge_detect,
@@ -233,7 +232,6 @@ static const struct drm_bridge_funcs msm_edp_bridge_ops = {
 	.atomic_enable = msm_edp_bridge_atomic_enable,
 	.atomic_disable = msm_edp_bridge_atomic_disable,
 	.atomic_post_disable = msm_edp_bridge_atomic_post_disable,
-	.mode_set = msm_dp_bridge_mode_set,
 	.mode_valid = msm_edp_bridge_mode_valid,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 041aa026ae2e..4bd788ea05d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -36,9 +36,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode);
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.43.0


