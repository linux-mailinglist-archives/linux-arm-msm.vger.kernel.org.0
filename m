Return-Path: <linux-arm-msm+bounces-102648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD3FKFTG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F99F3D51D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 538BF30B00DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB0F3ACEF2;
	Fri, 10 Apr 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dd9z5gNR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTTYVpny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001293B8BA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813761; cv=none; b=H+YCL32v8La0Yvi/nMh20XhNcpFpBFgVto1OK/MIMnwY568FM5jmQ3YMoXA+4TN23z4Nk+WNkuBTgwaS9jjvXWe7mLZnBO1thXAT8gkTjsPzLjiQAVlYwWJLKPVn59wr1y+EMHT4f7wG/7ium0ys3/w3sG//qgwu/ZsJ3mJ1UtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813761; c=relaxed/simple;
	bh=f/RQz16Zpyd+0rb46t9HWbjfcFSVL9mHw+8FAEWerak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjE/djlb/V9iOTI7VYPVU1/hVgkskBmkIdh2CIlOhee0q9aeprKyhzN10RXXXhzsNrWihuQroKHKHLDY9e3cjZjdnl+gPFcrHjzThIp1G71gfGB1n1WMXmGLHx4N9ajgwW7bJkr2ZNuaJ9ijCCaVoNSJFhntUoAVRIzaz5rVf2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dd9z5gNR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTTYVpny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6gl2N2866534
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9c41ES0sdM71vStxR/HY5UBmWgzT7fFS9JcAFYCbYQw=; b=dd9z5gNR2KxjtgWg
	GTd1xa7zVYhnBYTsje2JoydhnQGt0TxnUoePVVI7X0dv/s8llqGOTpQ65xtJ9/oH
	kifVcV5psDg8RXooomXOYF+AMyjlY4KSKGayZ58roHvwZ6C4GtQZHBMyEaiTIrkk
	ljZo9flbEj1dmdDh2huF168xZR4r4U+Xrr1mOV8W6pcEDKOsNfERPau6sejU46rC
	d/yQKIYw5PA1myoIs4Kw18dwoBUg9ZC3u/OfnfN15gGIB+7swlAtY/CkEglKWzrE
	DQKAV7Qn6oacnlVK8ty0xCaVHag5sNu7Nvwlm3Q4v/0IjWFgD450Df4jzVGw+2bb
	WmT9/g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decaykt3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89ce375c788so40988476d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813758; x=1776418558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9c41ES0sdM71vStxR/HY5UBmWgzT7fFS9JcAFYCbYQw=;
        b=ZTTYVpny4SULPLvrp0XmqTwCDiTqf80vLvgTLogU2w+VgaePa7+kOUzaagxne/jIk9
         Cq6e9qC6SChjWJNbHJI7wDSmavsJhUvhDi5yX+r/ghGmXQjpvuGwFD7tHtEemxcXwmIU
         MEG831OMRYEXYGpgI97JPHWo/awuXRvQhj6D+L2cq44qL8YzZ7yNVGye79CZvWiA7JHM
         L27jAjM66JCtFEgmhcr+ZuEP1OZrRmi386Zcf/7ImeW86qfzLq26JqHWsBmbTk5gVLH3
         jppo+g/st5XprhlizTlbH2VZCxAQTcFkL7HK9XHfEXWV+P1TGz2znCS/S2R2ued+4YLw
         ldHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813758; x=1776418558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9c41ES0sdM71vStxR/HY5UBmWgzT7fFS9JcAFYCbYQw=;
        b=TMt8zClCxecdk5uoupu21m8NEfTi9NsdhNA8Csh5+nf2J5IP+FMcTmHKQYuMIkkWsY
         ua6ChMv6pNdp+X0tXH1+vGY8Y+urkAChIWPqCsXz4v+yfWZ1klr7h0JYOuTqSRgwTKFL
         5DFQaFoTtSHMO6KwPBY1gQYJSXUWjtfGf8cEqh+BZpsOX34arZhARmAfq+27AqnMG1h5
         krIaiQtFiFCRukusWlmXIK953v9rXhqKsaUemQhVCEK8pZ54HS/efwLgcxtB1hET3xc5
         gj61vojmB5eBSTUYytaJY2LdMkxLmIUckljuxHnVzZsfI+SRjD73AzIllDYorQq4nRCE
         j3fw==
X-Gm-Message-State: AOJu0YyC5zWI2cpKL+dMpYcYP/X1yVlU0P/vx/XaJyeEyWVs91LLBgQd
	4D4X1IIsYE2/nwjdMeaO9ApNGsiLcLLDP1bj1QUU6cJCYfHawsZI9CFZpRFdN9RyrXZe/AZr9og
	i+7HKtcI2CC1JJWLvuiZ4AFJoEVB0bc2nSH6gxAT2jWxV5J8++ospV4Q1aP1SxkW2Rm12GSnGIl
	iU
X-Gm-Gg: AeBDietCdM16YvYXXqjTr7B9om4+BWGnurgSW+cOt/DTJrruxXq+iCgwesef2GRxqaj
	VKNtHo7mxkhujpeDJ4+GIU6YVn5f2Tfn5S4GI8FFVWULRPCRLogSJLUWGJHLCt1cmCKBOJOSr/N
	uExfMQydv5rXd35UiGyNPyTOBVBstJZ1S/xG6AXySUcyt6f3kqfbCuH0eO0nlIu7XgH0YTcVn+h
	jOD55rTt7RbPg6eqQe4dN1w2vU3pNp6XEJmb4N+V7S7qyCEBIiAAuSjVJt5yFZDeO5xQdmypX1U
	/565+9H3hZPF5o2/6llFUCBOQ0xPruIJzKQNOQ59lEbIoRfc4ngsTjhxpaxWJn6OPxJbPzlJWaG
	tdLTxlAjs6NtKDJujTpG1wx/VD88LK3pQHZb/crSnuBF6uKXTIZD51RSbDPPM0dvmz3PFu6YHJo
	w3DGf2epM=
X-Received: by 2002:a0c:f40b:0:b0:8a6:17d7:286f with SMTP id 6a1803df08f44-8ac8613a142mr34289376d6.10.1775813758286;
        Fri, 10 Apr 2026 02:35:58 -0700 (PDT)
X-Received: by 2002:a0c:f40b:0:b0:8a6:17d7:286f with SMTP id 6a1803df08f44-8ac8613a142mr34289116d6.10.1775813757927;
        Fri, 10 Apr 2026 02:35:57 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:57 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:00 +0800
Subject: [PATCH v4 25/39] drm/msm/dp: pass panel to display enable/disable
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-25-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=2830;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=f/RQz16Zpyd+0rb46t9HWbjfcFSVL9mHw+8FAEWerak=;
 b=cC/O0ROu2E/i8qbjxKEb3wkm4o0YFsFvjR/jcDorbaKGJDvDveYW04Tw59v58WHl8xzKb9msu
 ooCfN0XoZdIDrqCOnIbTe7d2b7OGacAfHG0GRbJePcGs+rQ11Ibo1s4
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8c47f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HaYln3OoUMJQEL55_tMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfXyJmBVg/jzsEF
 HPApY5QtHXfAGjYSJSyfVm9l0A2i+nz++UbMewN7TA7ifpFygRmjDAzNCbWo5OxVeMu1230Tx6K
 f+Thvi47z5YxOZ6fAcXnRrKd7vjSc+O1OEREC5YTuyHkQnyd6Q9JtvAjgBWUe4ucUag9RiRmmke
 bxKRUffO1/7a7FQywKoj4S9M9gwfGGXePtkC0r2kso9ciFyHCOWsC+zFm6G5jX/Ak2Xf4624UMO
 8y17kNreEvkZB1IsC3lV5Vj6geD1rJ6ZbFr8wZmQzpV09jAndFvEaLCRvInhku8zb/v9mw2GiDu
 2kYhzahlnXUw1ANFZ2prjGa0i2MCzSYpWKZdmfy1pZ6OIeq8apgp0n3lV4hFT3RV3fXKEGEyV1X
 0ZGGLho352wTTo/cpIzmiVTijMi5sA1qWbYBzxRnL1d8uSprBHoV9nlEb8ymH2lv5LSZ62jcGNJ
 qTi8RwJquRcHFuRovmQ==
X-Proofpoint-GUID: psCV2lysnu5_StuHEuy99YHfFSLrp-yv
X-Proofpoint-ORIG-GUID: psCV2lysnu5_StuHEuy99YHfFSLrp-yv
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102648-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F99F3D51D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass struct msm_dp_panel to the display enable/disable helpers to make
them easier to reuse for MST stream handling.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7b3b9160e005..88a078e53dc1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -668,7 +668,8 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp,
+				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -725,20 +726,21 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 	msm_dp_display->audio_enabled = false;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp,
+				  struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	if (!msm_dp_display->power_on)
 		return 0;
 
-	msm_dp_panel_disable_vsc_sdp(dp->panel);
+	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
-	msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl);
 
@@ -1529,14 +1531,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 
 	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0);
 
-	rc = msm_dp_display_enable(dp);
+	rc = msm_dp_display_enable(dp, dp->panel);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp);
+		msm_dp_display_disable(dp, dp->panel);
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1573,7 +1575,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }

-- 
2.43.0


