Return-Path: <linux-arm-msm+bounces-110790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPJmJnihHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:25:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97D62B6D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B134730C072E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8B33D0BF3;
	Tue,  2 Jun 2026 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fc1CDxdd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMRZQPVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD443D75AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391559; cv=none; b=t0G/4p+p4He9kC1MATwiXQxobgjpWPOycpNB/2/rlhQ7c0MblOyGJPsx26gqsFWxvhOGn/SR5pwbfH2VGmq23NAF/EzrSzTk9Odi0aTZTpV+jopQ9aEiMeu9wOa9V6SW5AFv80OSkI6CzDStOdxDmTwn1rgx0V1D61Oo6uyI0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391559; c=relaxed/simple;
	bh=VMCb+gh78a5tyRp4ocOtlXR3WU+MH0tKL5IrymVyK/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYhVCHEjTzaV4Q8213O6rmatXVwPwPYt2n9polaR0ePZhIgzu16bKGriGATOYkDtTIPBSWM8ntaGhBSUHhSS8zAxgWi0Frfhkf5sa05+UjLKEKVMOYXPwdwDy+fjjRVlvRrGmFgNNlbyWtihRtRo0WgP8s0cVvcoG4pGiTyFTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fc1CDxdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMRZQPVq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527qTF83132993
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnGOml6KRNLCf8LNyNsT22xgMpxrnwiDol3PAO0B0Jw=; b=Fc1CDxddIHANP11x
	cRrB39iSWkuTIMR6zfUHAGGw4SrivL1gbg7MXGwYB9lWcSTyngO38iFuTZxKrhJL
	5FSpCRhIIpJTN2k8v6J9266YJGA2uPEHImiBO2N3GnIvMxJiLAD4qcPYXpqcfBTd
	dXwhgvvYdCHe1lxgTnUAa5qmTauzhTPTPSxuEI5qLaIOvEelcrD31ADv9AfKQPhx
	02OaSNPJ68clP+exldURvgZHYjx/w1iz7KrkLZi0GieEGIj19sgRx91XM3W20LVi
	OK2+aXg64y7DKgbO/O4j/TlzlRTNPKyvDh9fg2ovvSPaM4Vb6DynK9y0zOs7SLFr
	VnG8mQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu5wrb3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:12:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51771d41426so4635681cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391556; x=1780996356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnGOml6KRNLCf8LNyNsT22xgMpxrnwiDol3PAO0B0Jw=;
        b=UMRZQPVqAquKSYT57tBLK5vi4RWjIR1eYUpERGeNspgaaARe2bsU6glzHLkcD0NIsn
         6GfJc6G5VQqxHI7jURdV9sYH5GmlqiZSlZrPXb63IbUY3Bs2XDjCzmnRGHRCNu3Tl4jr
         X+6EJ4Ciah8lNxtMKI5l1eohTE7eNmFCytR4gqGvEXuhKpfRO5K6TLSstNy3F3S/YqHO
         8e/3CcRIznmBKUt0VH6+wADHBlDnzqZKbRda1Ve+0z8E5BmWJZWn7cGIzIgTeD88GK5v
         tb0/nQGWXRlmt+gd1yEwfB3gTDYBNW7QuO1XROboUv3pWzxWGNRuy+fOMplUUW3fKTRC
         WB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391556; x=1780996356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CnGOml6KRNLCf8LNyNsT22xgMpxrnwiDol3PAO0B0Jw=;
        b=dxZL65cNRRmxZ7A9ErxwomH34GFtslNJUdDIoo2j9jn3eg6Q+FPVysYxdgfHc9QPVI
         JmiDt5afYTE0pnS5ZSYiOjIJFffPmVjsuSqGIzUWs27X4UTzBFB8txuSaayvsr4BK7r2
         cU9diCcsTd5v21zSb+sXtHYUyAFkGX1gTXc0/4nAOGbMWK1vIodZyTMkyp1Qrwc/95G7
         lZMf4/7GkGNcs+r8j3N7O6/OduaZKgMOSJMEqtSnNzqtCyqnk7+m7bW2KwQirnCggQE1
         Z1ep6WrK5u2U885yTZ5liROadyxaIrIcA3+GkJ4/aifTXOppsWaikcOp1Yd9yrr7ibeI
         OLWw==
X-Gm-Message-State: AOJu0YxN5tE2anTM+0kVssAaNL7nKS2EKPIM9OUN5PUTDz5QppmD9m81
	ihm4VGrNcx483UNQYtoo7HQNqSq66R9NpQY9N0FbfBiT3DYfLcSWp5A1A3QUm826L8oHaojYAZZ
	EJd87COFpR1mAke2d/gIFUa5+mA/t8enp3b6lX/34SSUcDLhXyZq0QrGdYmeYDrP50OEA
X-Gm-Gg: Acq92OHfI0XaBsU2fLBKdOY4+c4wPZAaL7WkSmgEhFMTj8zP6saXypTwGp7OW775gKo
	bfMVooDRA5ByxWiv27l2EPunx9ThtHQe6VbkuM2nAedi+ErEOlxaGAMKZHpi2bl5jp9jfvf4O2S
	ijWs7Dv2FC3mohlzy5nhcRP2w5cQpgrOBFQRjA5ccDSbHeAPhC1eCAt15cdKy5UCFhurYDIzH01
	TN8tSv5asspb8CADcqlr6UhMeouqJmnlIQPEHnBZvd4u0dNrUPiHuXT/zII7uUUZF/1GekSkc0m
	bmKWS4UZsRN5Ke/Im51PShdI+aRqpG6xadi2MMmskBKHzptecUxtN1Ouwlclqr219MIurd/jglC
	mI04z+3osZ9IdQ0VRKEq4kZqszsjJdtXw+9hCNgxIc+acaRvHxRyDlVCvtB/IueLQCEk8z8oqWg
	Pj3IgdhzFGDPw0cP9IDg==
X-Received: by 2002:ac8:5fc8:0:b0:517:7277:9362 with SMTP id d75a77b69052e-51772779863mr836961cf.48.1780391555992;
        Tue, 02 Jun 2026 02:12:35 -0700 (PDT)
X-Received: by 2002:ac8:5fc8:0:b0:517:7277:9362 with SMTP id d75a77b69052e-51772779863mr836571cf.48.1780391555611;
        Tue, 02 Jun 2026 02:12:35 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:12:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:27 +0800
Subject: [PATCH v6 15/15] drm/msm/dp: pass panel to display enable/disable
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-15-2c17ff40a9b2@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=3118;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=VMCb+gh78a5tyRp4ocOtlXR3WU+MH0tKL5IrymVyK/Y=;
 b=+MxUWsyBnARoL5Z62MZhRAt4ecZNYa9xBG7vgztbTLl60v1elrbRh/WmVoBaLvyQOPEGYmlxT
 oJC7G1JLVSwC58blLYJYerJpyqtOgCMZPtAfv7p4fQtZmrgohyS1pj1
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 8-G6-c-Ba9doLQFjdE5JMuRaVRIwvMTl
X-Proofpoint-ORIG-GUID: 8-G6-c-Ba9doLQFjdE5JMuRaVRIwvMTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfX0U1YgTe6yHfm
 FK5y/qcDAyWsCy8mDC1e7ITMKENdtTcIg4g6tp8ul/x0oQ0iiirfzSgH7au299cqBWQ2tIKGcGr
 eqH1qPL7G9NiPdiBAyxTBk39SUwF7h23XLrgcqEz8OyJJxvt1AUNzp6p+C9hVFPKnZ0orjoAerj
 Wl0JFCnUy/ss1Ab5DhFy1c3OP6RvdeeEN3EGd5ga+w3bPgX9pfPLQD2hZRgX78DSdkNeD3liWa4
 U5n1r9E4mHLzF0ASJhRO5YFu6f6V6jjZYaBgaI5zA08v+IXFSh+VNidKImh5Jjo4UBkx4cLC5Is
 0lfdEfFwXNIwPs/fXp3Duy8UaYhLmwPrgWqZkiOgFkWvho7oZ3+7ADtauv4SWZ0Ix2TEnF/vZIC
 zdPsSStbTAt7VVKhFDrPbZIkBEDAjkK86stg7uUSEnfRHR0aKzegMLrFLLViaR8MErCr7a6HjCL
 YguuVSFi4OEtkVJbf7g==
X-Authority-Analysis: v=2.4 cv=M/R97Sws c=1 sm=1 tr=0 ts=6a1e9e84 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wgkWW237A_BUGFCT6doA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: ED97D62B6D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110790-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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


