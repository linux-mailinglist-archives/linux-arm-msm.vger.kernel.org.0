Return-Path: <linux-arm-msm+bounces-95654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBYdLZ6XqWlKAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:47:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5DE213CF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0BD331A7ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20593A873F;
	Thu,  5 Mar 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvJd+QZV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGtoK/qk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742523A6403
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721060; cv=none; b=i+4tuO1GwnI2xpZN5EnPd0m1uTtDFiyVfbXjpMwAqRO3lhCby+YIBreqGIbCOBMYH/uGMG8k18PmLzXfOZspkHu41awVmVEejm6zmrTNgAeEs1h20yHGuhAit7uwtvEKaLg1SRgjQ/urOvDpI6WhTr0eJWs7rHAiAxrCGoX+YbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721060; c=relaxed/simple;
	bh=93mNWzDSyV1/6hDP+y0Mc4joR9UKuCrK6sioo+SXDbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1lqRaXUlz9DXCsra+9BBY4xV9YY73o8sIjdFj9U/4Fh//HXcgdwYqDuS1O0T5DbY9LOHUCTLzz5k8EGGz5WVt0K8ZKSC8N5U8v2ABmHEVcLvi16JdOsp1+xADs1kFE7Ut4j3VtMpE/pqDrPmMASZfZ67c7B/vmt9MNSkhY3Z3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvJd+QZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGtoK/qk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFp8f1517955
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=; b=bvJd+QZVd1cuXnBe
	d1Iu4H0BCI2RvIQ9+FkYoE1LMp3W7g5Uc6RN07q/YdOmW1zHapFWPIWyeWiFKAav
	YKH24h5m0nbgSt8D74Xju/mrNkgbx2PV26C/BNweWP0lsDNrG33K7h7XW1jU9VtR
	ew+d7k8hen45yRRSpoaDEZEXf0S9Q67KHumSzIg3f4YYC50wNAO5bLBlSc8Dn30+
	Kz/97wUNFKI7vThte+/E6Q2jg4qNXVGeogaG+SZqwXWDg/1m3iilIKYb64Lif0G/
	pA/RQEexF2cAUbDw1dY8n4GUS4DBcdTo1srCJ+CSPFRv3E/dvZwg0tRzDTichBoB
	EgXcFQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptk2ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:30:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56afd606ff0so156313e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721058; x=1773325858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=;
        b=KGtoK/qkbUqf3OcAia4GLegsi1/5Lr4T61BiMSPwWwV+id1zPSXKMZqV1Yqrinkfvj
         LcKzJtpX8kIW+mrFaY7mZmE9cmqPuZDQX053ZqTSFgqDJw9ll6aCyVS+4wAuCQa3Yofw
         ngrMTK3IfBnpj6TAqG/IPp1tMvSha4+cQO9ruiblzWnQT9zd2iBqLDMi9/UR/Hs8e/si
         4dFHUc7Z+algRKSU0tNvqSLnTYT/92keQ7gV4+BDfGvqW6PBjGnr0lGqsj8Spv4Ohr2e
         Miii2JapsIyWoyWpLH6McvIfl058VERkLCPLJj4PXIJVEC5fy093UpCzXOjPGLCTGGcD
         poAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721058; x=1773325858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=;
        b=tC1V3CuX9nxE2LFmK5bq8Si+orJkAhSibLixuhOsBQlHC/aL0D7HhhtlBBXK35DA2m
         Fdi8i3hBUwUsqcx6V39J0GwKpURER5E+RWfYnSrTJdFjxxbitN9Gm/MY1b9vPf6s3d+9
         qkV+SnMxY7oWt3w269BDBIVmp19VwHYSf7Eh4ddMCGdSzEzRgKN8qEegLAaijTHteJtA
         iazvKnahTmh/MbN4fOVzPau5e0BS9o9oEj3/QPzMBcy8aKHaDE/gX8GkfApGcYjptmql
         MvMVX6bX8JR1CFUiafxiyGMft38He6kGYiiI0/HY19vMgvW4OhzMnRokDA92wlYS3CDc
         qd4g==
X-Gm-Message-State: AOJu0YzlTPV9PemVN4izvpj3jo8jYUtRqSpAZtHcpqFeNYsahZdbhpj2
	Hmo1JzXFD3EHqvft4ldP6o2Gd6/C3vte0z6jp3e2t3sKy2JIR9ZXCJ7PTFb2QULxdxeQLVDOuo8
	6deVT4+pfEuM+Fqptpja/9d1IGPeqgNxHZWYTPvFZKFu7fiP8mxoV3Q1dJXpCeZQ8ZDGR
X-Gm-Gg: ATEYQzyUfNx8bn5fzyzUTRd96GECM4PzPFuLsG1UwaJqxk1KMyjzfYSl17rgQdpuKBb
	bjCQKEE8cuj4d/PoJRCeQ8teR5cN5o7akWFavJaGOjhqHC6D3CQ/lVT8JBXdI7btncqm4IO0RPp
	imzQ2r9aUJ/veF0sbIWQASijCeGwcXNfmgqc9TKWpluCYXwVXSHTpLRXA7x4nTnzAxsxIw/wQ05
	Vm/591G6xdh8FBuPqTqt1z5n+2hZ7fP/qNMLCItaITfwUKR5Nfe+K8wfbECjd9uE7ch9jyMmsl7
	hKOwC+R9mHsAjUKwIs9hbXCUY1GQI2dm+8sn5uG1lHlAgOA4G2xVU0vwyPn4sz10tUfmk/yJ9SA
	+EJQMIpEp3qaganM2snqehwEfNaojtHGckmDPMc35Im1ZJ+Bn5clrHDD8WEHlgMwBxpyTl/RsVH
	KWhEmvX6ps2FOjNadOS3pf7XUOBywMnflgOQ8=
X-Received: by 2002:a05:6122:3b11:b0:559:67df:5889 with SMTP id 71dfb90a1353d-56ae7603caamr2234051e0c.6.1772721057650;
        Thu, 05 Mar 2026 06:30:57 -0800 (PST)
X-Received: by 2002:a05:6122:3b11:b0:559:67df:5889 with SMTP id 71dfb90a1353d-56ae7603caamr2234012e0c.6.1772721057127;
        Thu, 05 Mar 2026 06:30:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:30:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:46 +0200
Subject: [PATCH v4 4/9] drm/msm/dp: Move link training to atomic_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-4-39c9d1fef321@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JI7bZYAZgZZoG3QbCYkVN62ORKAZ93CC/pbTrYikaXc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYJcHCddaM4Ycs5ue+0qxkZQCBHCEMF1NlK
 SScGLBEaXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1QzyB/9fUSrBJ7tXabZzoPSyhUByYGbsn2dwnTzGpCkrAjntqwc/Mvda3/QcMsW+TyTExxAMs2M
 uJn3K30cHJ3NJjol+mvY7nv8c/FVBw+JaAhKVwwyVripMBXYbheLqRTwnliIo00Oxn0Lw0kXZxe
 2Gcb2i4YIg0IUhgubc3D4xY1EAS8M1wYZuCFDNuIdykwpshp8qAkQ6GGUD6Vrtdm4tmLA4CM7M/
 eY7KoHPqppMk6+nsWgXJ2P61V2eInZvVGs1gPd1Yuh/BbFLf7zmCw3qluHzYcWR0EXJQvpS8VeK
 hi4FHW4s/frRPcAQmJYOucfohIoY5zf9dG1PzU1M8RcZTCKm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfXzjkSuzDnQFe/
 admihJx8cQtcfyuXsBDdzhDlXgmOeSvxmTTZigomU9JCkx6NMt6A3zszH4FHd1tAjIvwWQBfIKg
 2/5DTWjH0vB1N6YTdZdtQXL4s3ZCFubQtS+31CL8/UVM1JX7uRv72v8LBdRlwco5A4pqf39QXTs
 Udk6A/g/6BgnXfbs2saOgdaE0nBNWLIYZgn1KbK9pdiDWdhfM4m/y8bUTyXOUZpWSO+mf8Am+2U
 neHAxTJnwhYsIiBc76OnwKw6wGt3Seh4IVDvzGqdLYIc7lyNzJKSqyuwMWGIVhA0ppaze0iJsLB
 K8MLWVqydSuwX8y7mr8fRYbYk/GwkjPNxQ+yNQxNqIsnRyOYU5bkGNe8rHLXYaGq61kTQ5mvLeb
 ZEpfcPsiNdewKDrF1kOQ/jUevopBw35vvIXf4hW+t10v0x79x/v+ZmMbvVVeT5GhLqIINAjSN08
 jreLcqw7AVBnHOtvNhg==
X-Proofpoint-ORIG-GUID: K6nkMkqc8tL5OWwXZC8gETPFl1fmLCPC
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a993a2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=IoBVowuyLm_M3JZO-XQA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: K6nkMkqc8tL5OWwXZC8gETPFl1fmLCPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: 1C5DE213CF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95654-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a05144de3b93..e7b1ed5491c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1695,6 +1690,11 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc)
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+	// TODO: schedule drm_connector_set_link_status_property()
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);

-- 
2.47.3


