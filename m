Return-Path: <linux-arm-msm+bounces-102627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DK4IrPE2Gk4hwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:36:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED93D4FCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C58B93060A05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40B63B52FE;
	Fri, 10 Apr 2026 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS25G3ml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHZ+Z/M2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD93B47C3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813656; cv=none; b=TbryA474UEP41pGxel6wknMe/1PEIi/kCOwbkSisckVIhVttF1iA+r/dXTeBoXcBtPWt8UF5LJhIYtEftS3pF3WhwMRs4D6MyIiMKNbBH+y67iKG82P0uW4dO3+fcmmE+y31j4OqG75ZC95mizpG9dLN4NiHVl8MyYz5uJEHdso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813656; c=relaxed/simple;
	bh=9wzpmcOHoBOq6BiCkmrHwhLf/OqV48UkD8j7/jTLUvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOV3UmH0BUTIqaDr/JB/w03DObpLxs3IaNbeZIZYtSRmnOmTQ6h8xmUpFXiKs9ZjglXkTbR4sA8AJcfo8pFQJ7ORzgxSqZ4SDLRPyLFfb3yH21cs5VJu9u4CUeU1Bg7PNJ10Mg91knmyMW6Uhy+UumEFCApkF+8DO7bgO6qg2ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS25G3ml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHZ+Z/M2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A8tCNd115453
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2cqSDHqNgVvUpQ2UDVNucOxrHSj4G+nvJMZ5j+4sYo=; b=bS25G3ml963D+4sM
	rIYshNcvxf34m20u5h2a3JAnaoKmjZvCJqNg4St8GECKzSod1RnQf8CqyI9usCDm
	8OffamoR43yl2Xb6b0thW9WoKftG0+b6fKicOSnb2iMnjJ7jwjrI5HabRnUO9IDZ
	dOg662rLTytDOX2cFhcvzBaNYN9GYYq4AaSuh3pmjzRXs6X88t2bZjBgmnUBJzlK
	QbgEzzx3TgXuR9Ilwy9HsnzC+0y85RozdzUGDc89Bwhq2wPzGxQgwAnqxoCNsVFJ
	N+HqNcDUQhzPJGTPTwd126NExF3lKIllpiIVWGiQx8jcy99z3liAmBroFNUAeLJh
	p1UWEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xb8te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8950562d351so40671636d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813654; x=1776418454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2cqSDHqNgVvUpQ2UDVNucOxrHSj4G+nvJMZ5j+4sYo=;
        b=CHZ+Z/M2IFJfR8wDVtaQN4YaBtnR6x/12CL7A1w+rh10Odfq7xht93RvPgz6t5kif5
         0KjG4lLynVumGcI1iAf+O96vveSntChcY+8PVU+Lzx+sa7Qf6XRCEXmm7qwOD1PFgLU1
         vorf3YEmCQenMbR7wgkhC/kPpHndoV3H8+we2RIYn5pyjK3M9/Kn4+YeGRNWbekTmEAF
         5AxmRVvOlyw62onaLlqL0TJy8gMe7xyP99hvEn3Ewwft1stiHNooabiTx0HEgDOeQdk+
         pn/n3detPrs8fGzVkGQoJKhAZdn4sYS5+mDfsUuLAJAaAKyn/RH/SaLrpt9x5fId80nb
         KKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813654; x=1776418454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c2cqSDHqNgVvUpQ2UDVNucOxrHSj4G+nvJMZ5j+4sYo=;
        b=SMXl56tthsNl2T3i0eq18FQCTVF0iZac0OrqVPO91acRS23TOxEc0dHF7642taVa6Y
         0y/CtZYHlr4O0zruDGiCQv3139ss3+DloSt27lLo9CHJht2RwtJ2UoNnjCR6TnRl/l3w
         wG3Rwthc0O7GCHWRoj62r0UVY0+WYVa6U9JsJ8bvykRlLTpn8k8+UXDxVbBTYUFT/xBt
         zRdZiwvztrd82+wkwyN8eGwcL2qYfXsN2CtVyY9WdiAyF4Mo7Ck1KHg97bYUmsg2C4hE
         BGgKBaS3LcN03H0Sbm/5p6iCV6nbAOAkU+8h6pSZcmjlJren188JOotkHTxs8qrQkiIj
         HIJw==
X-Gm-Message-State: AOJu0YwkDwpn0JOBVVRfB5H8XO+twIDSUX0PvmR4r0QNMnwFb37U1w/1
	0+WPYZqyGzb0+1KP9xZxcD1JL3AVXubZO2cwoyipAtRrjXed9x9f6ltMJ+7cSGTsrzJdffKG98Q
	UIXliihCvR+hkfFTepqM0SF4cHSHxlZl+168judJZKfjQLDIeJRjrF50SBSsCmxtUVBEmFPF186
	xjfeJKWw==
X-Gm-Gg: AeBDievcQTH+hCohNZoqCqvPjpXzLkznNdNiMnMmri5XFd72AOkv21ckCsXVgcFtP+L
	svOvmTGpQ0dzJEBcniTROg82QzjnbOvZqBHf2YbWn2IY6pvxKrftnAE8otSpMeXbHw8Cdbd5YGz
	rWWdbxmSFhxD0mQFYsDMeDVDYUbD+dQAphH+OfoxgKt062bFHkKU7StZ4YneRGvCKL6qniAR4QC
	ivKgwA/8xZz9l7uuXV5U+xWcsqC7J+4BedI84d255OiWIZWh+LJ1G48AurKTiKOfCdHijzhbM3B
	ACAKeFc7/w0boBpp094UhfwN6QA3G09saLaD/llP8n13CrLG6vMQtm0vOBk1bm00/RY5dS3qgbA
	8+sPWKw6sGUIE+yGCseX5OWypveP4oZmASOMy81wE+uWKyCvuBiq9ZKpBhW46wYj8hvlFJ+A119
	8dP1/n2uw=
X-Received: by 2002:ad4:5949:0:b0:89c:c75a:e83b with SMTP id 6a1803df08f44-8ac86319c15mr31742846d6.54.1775813653709;
        Fri, 10 Apr 2026 02:34:13 -0700 (PDT)
X-Received: by 2002:ad4:5949:0:b0:89c:c75a:e83b with SMTP id 6a1803df08f44-8ac86319c15mr31742456d6.54.1775813653299;
        Fri, 10 Apr 2026 02:34:13 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:13 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:39 +0800
Subject: [PATCH v4 04/39] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-4-b20518dea8de@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=3890;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=jXQCAxCiXUJRF5Hy5TGXsy0zyup8wBHq7tf5RYhaBiU=;
 b=WGsTo1NHR/4bJtLAXFiYRnBHZTj9PqjbvGytlM2rfB5uHc5KVWe4B1JU8TM6JJaCmRKf6Haro
 NY/UjH39L99BndgMunlcShYVvNU/wAP5i0xUmW2OYB6CqGXjQY6e4I0
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfXxU0aKnMssmlF
 HxGLdHRShn92qSdx7jWAxuhUs06afCVxmmSM+Fkkg+d0mfT5z68gYPy6eOoOR/3u8pqSpXNXTUf
 Tu5v9pzlZU95yFRqYafQMXD2aLy1cKBfRTZAL86cMZJ3H3qQH+O3bBklOihW/NEHYsnj2wAboFc
 akym9AABbjv1MAABGOsDeANtKfdt9IU5WdAuS17jSt8zbbYE/omKm2N3bzPn6a8M7Dtqcrs8RzZ
 lYS3sZNL6ITXRt/CHMRzrj41uJnOabRPqW3a6eAH9ht7r1Zmk97TyMUggp2W9/zfK/WAjEG1gJ7
 BCcvNF6GPoKjN6GrVPn6UIZSxkSS4pcC9wLv8VEZW3KNotUSkZkLcP18sbE4WX3hnoa4D51GLiO
 vHNMidAAN9/ut5O5bHImb2qZXuldp1t4mXOr+6pL9dAn1pU7ROCgnYE5lDEYRGKY2kTh+BYUVB9
 2TvW1JV13JJ52rRDu4Q==
X-Proofpoint-GUID: dTcPuV9kLYOEq7ce-ToWGuHJu3yrWmLl
X-Proofpoint-ORIG-GUID: dTcPuV9kLYOEq7ce-ToWGuHJu3yrWmLl
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d8c416 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=We74lq4XQ-Qw3Vo_XYoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102627-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CED93D4FCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 0fd4a7b6d931..476346e3ac19 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2576,7 +2576,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2584,23 +2584,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
-
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	phy_power_off(phy);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 1497f1a8fc2f..5d615f50d13b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -46,4 +45,5 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5ecbc83c3838..58c46d5ab4d8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -719,12 +719,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_panel_disable_vsc_sdp(dp->panel);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+
+		/* set dongle to D3 (power off) mode */
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt

-- 
2.43.0


