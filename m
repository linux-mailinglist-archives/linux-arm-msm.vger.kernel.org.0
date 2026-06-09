Return-Path: <linux-arm-msm+bounces-112111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZbBOHMzkJ2r24AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:02:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB065EAD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:02:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o3YRE2cH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZcLKDW1O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112111-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112111-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96EA930C7907
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1014B3F23C2;
	Tue,  9 Jun 2026 09:47:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF63F4127
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998478; cv=none; b=Ey+SJY86af6CAJIV/KWGzUPJoWDDTt04N3xJfKwfSbhLromIbjD5Mx7XtJmnAhYS6KZk/CLLOHaBBFSGlhGDGhu1HdkmbRN5qkwP6sUWk8E2nLn/SBEaZB8sS2innNJHWcDW5PapxyDDWI9CupWtl5854cJ9YWviNJpFN8lmBbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998478; c=relaxed/simple;
	bh=VMCb+gh78a5tyRp4ocOtlXR3WU+MH0tKL5IrymVyK/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNcb7TB5yPN4iTevhiNPm1gEIg+e6PMhRFCz4OpdaomTXA+WmkZUWj5t7jNYbcnFoPJYKzGDrJYRYG1bnlCgLI/P8aZHIw4/MlaxDxrIBzeUPtij5yT048njgojbGhYOSXMfi3X3BSRYqPOd/Qj2KQr0pr0kd1pdJPyqL7jmxkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3YRE2cH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcLKDW1O; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6598WjVK2130224
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnGOml6KRNLCf8LNyNsT22xgMpxrnwiDol3PAO0B0Jw=; b=o3YRE2cHhsh/ltE9
	50OL9hBRBuBBVS1pnxeManKhzKUZLAh/iEPA571FCXXrzImF89yRpIs7GVt/VMBE
	5QhAJd1uBUE5hAvvF7bnwCLxYtYfHnvx9mkM62WkmqrfkPdvmcz+6EPJ2apSyuOq
	TmTHE32n+9dwNg7xRCfhM4LETbFHaK4voZPv5hdZG11QOIYXCrSc0b8Zz9sROe67
	59peK1FkodcsSVOJGH+8vwAUBWAPvq55DQ8m0xfNafwPjvKe9fpS3sW5ouOCpf8b
	dApkV3j80UFZ2ftbTgAQp1fLmfcwb1p9YQRlm4YnbcxIUzhk6wF0bz6K6grzF2Vo
	a1scXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0a76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915b6b63056so772043685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998474; x=1781603274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnGOml6KRNLCf8LNyNsT22xgMpxrnwiDol3PAO0B0Jw=;
        b=ZcLKDW1O2Uqkigru/BtqAVB6Wc9Up+Y41jBogaGLS4ELVkX9VsoVltBP/vTll6EGDi
         zvKDkaMSpzG6tGtFErxgmqWShc5f9+WW7by6RQd9exdDy3ki3ZTaNxBbGwvSLIusqR/w
         IlQYEWXhmIguzdT+EJ31TxC43R7XA8438cgnDx6o0Ul+7BIb3LpXR6OLNFpX5zXiQATf
         iFatZ18YeuGoHgOs3orogolaZXwL6I5VFvCyyX1f6VQJ8sRI+VT1vD7nlCAc9g5MJFF0
         tGXo4MuBI8rAy4dylctNKxXUcOc1VgkVgST8qjw3D7po03w8RCAgcTC+fVji8fAuM1go
         AseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998474; x=1781603274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CnGOml6KRNLCf8LNyNsT22xgMpxrnwiDol3PAO0B0Jw=;
        b=hGM+CBLtyGzKaj742K8p8lOslYh/QU+YIZqzIwr1551QX7vJf4xgM7XfOAkrvJQl66
         NbMeDOWopWISq0StVdyCuSsjSE+eWWpAphRddR8Noa/MeiTpvGmJhdGyoNWxdkvJK1VP
         0GA4BO0w3Y/YPrxxQX3aIihluJPqTFwPYptxaZUFjraLkd2zorzA753hyskFBBPHkmc8
         UKI1y5N4aSM8I6wv/c/rpqAVVULiV3dB3lM1Q/C5VBThrWA8WW8Xw0eEgoo1tzS9H4Ch
         WQoIH4Zdmk+kDdTuaDq3Z9N65vn802Lkq120UkcNXanbCtuL/Wq4b4iXnbSMAFLCZali
         onRQ==
X-Gm-Message-State: AOJu0YyaTG9myA1ZhgA8SH5rog8YRdPrAOON53nsRTMVx1YMOP65+uOj
	Wab28JEHCkKPa81HAMbleUFWHqrZsmYX5Zb++QzMl7ktSYEKMIbWwYCt925oICUjRVKYuFHBDm6
	u1elgGaimba6ydudxHPJK/9+TArIKMEA1IOAGSFR2oDHcJBnaWWtQBdEKU5bdhsI9oWqv
X-Gm-Gg: Acq92OGysLQFXdpbJlMz8iLtA+peIWylA+TPUL/fA0srhejNfj4uqockypNllFrTho0
	SIVeKxj01Fg8efUyeDsWZWUiI5aZ7FbqNjClNtzUozEz5EMEvkNd5Eb2Y2j3SVSezQjqpm/jIlp
	sVkwdO32EqC5kitT3i0r0LpMt7AJoGVibZGRWXBQ0c2WhBvXMC+/leJ2YtOGD2hmZBcKCk7S8Fc
	WgG2b3V9BO/+RyBRJz0Fn6Ee3kQ0j8s2RNQGyfY5BikIRbR8ocP6Nn4cGkB05KQrJOaCZqJv6Tf
	fIOhp6z/kn3G4DYH+HJVszTgNYFHyc2aIkrOWi6q67MOIi35Fz//ZHFBq5n9w+GrArlik4CqU2x
	6VVnSgUKp895KuMRIBkAcBleTfehrj9Yaa0P8sjPZgrjPfhHRGMLYySkeZVSyiZTok+97hBDzL6
	YnDXzNSIpiGnxB0w9CSw==
X-Received: by 2002:a05:620a:40cf:b0:915:79c8:ec9c with SMTP id af79cd13be357-915a9da96ecmr3113621885a.35.1780998473892;
        Tue, 09 Jun 2026 02:47:53 -0700 (PDT)
X-Received: by 2002:a05:620a:40cf:b0:915:79c8:ec9c with SMTP id af79cd13be357-915a9da96ecmr3113617985a.35.1780998473462;
        Tue, 09 Jun 2026 02:47:53 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:37 +0800
Subject: [PATCH v7 15/15] drm/msm/dp: pass panel to display enable/disable
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-15-ea04113e8233@oss.qualcomm.com>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
In-Reply-To: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998393; l=3118;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=VMCb+gh78a5tyRp4ocOtlXR3WU+MH0tKL5IrymVyK/Y=;
 b=/bqYPwe+BT8wRDn37HT0g7sYFYdExLZp0AYNmLazK1zbmjMz62sd7TCVmyuOCWbG2FJSdIBCi
 nv2MEP7UAp4AK3aejuq8vXcpP63dyQNtdlsQFAfYzSKoPTnz4Xi703l
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: DnckpMPcVBBoQBdpFoZfGD4X6TTvWJkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX3RDLFVuSUFoN
 igju7rX95qgzTxehevzgTYy7CqHDNj8yls4AiVaehp2PJTTxxNYhZBKc6Vj59n6LtEyvxbQEW85
 MooAWew7/A695DSU312+MKUdbq+Y/IyvZilv3fnLUnw+wFqTH9HbFviPKYUfDNX55fnLKxA6ZHf
 B0/AEHEhdr8KahF4XnD4DvMONUB0I5aG84wgVEHz8TFKXBSZIhn9uTYDNMHFlNb/cgeeF9CGZ0k
 maWYtOj8Uu2xm2Fe5AzzJsuJ2TG8ugOajIMlxGQPcmx9kEkI5HgmXmaLIcJTNoqtS8Sht1THtXy
 SeCmrcT8OdtmkbO+riCW2GiRQmlFFPO1m/yYpH79Jgj/rmY+ZCynhZV0j2a7UKky1B6j+5WMWL0
 LqpDcxZ05+K6EJgFbGe+558XJoic1NijsnvpmNbaN2sSzba9HT1g6OjjnPLBjR+hm+ByPdHn1By
 BzAZVZIQcgMnuqWe6UA==
X-Proofpoint-GUID: DnckpMPcVBBoQBdpFoZfGD4X6TTvWJkg
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27e14a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wgkWW237A_BUGFCT6doA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112111-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88AB065EAD1

Pass struct msm_dp_panel to the display enable/disable helpers to make
them easier to reuse for MST stream handling.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cd1f2899b733..bea5bfb22967 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -650,7 +650,8 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp,
+				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -661,7 +662,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -707,20 +708,21 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
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
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
@@ -1437,14 +1439,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
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
@@ -1479,7 +1481,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }

-- 
2.43.0


