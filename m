Return-Path: <linux-arm-msm+bounces-110787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKSdKbOfHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:17:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD23D62B3DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05D833004D88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B1A3890FB;
	Tue,  2 Jun 2026 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hohob0sA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O01p6ZlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D10E3D6476
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391545; cv=none; b=hEkCPJGzIrWFEVh2ieqxy4ftF4fkYxXuQcZqdebyuwo6zcod8XUI8k1qRA1AsA+csp6BEa+1WhNHic26ZLAanjpnIyJrdBbBDHCABsyG48ub+oNDC7S5d0AKJPsm7vW+tHeRyV8nlYaEmcgNRTMyG+xH99khzmLs0nOg2wQ3t5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391545; c=relaxed/simple;
	bh=4TJKG8RTz4R+dv3UNXgRl/mjeEf45SUuZJzked/IkbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzL6v1iZMLDEQIlTlAhbBhIKAhAcyRMdwBgG6UhTsUR3Kh3ESmHF3BZh0MeU6+XK+xkmgMP5X7kx2AkPPq9KkgrTC83qwCj/fdKO7Hz5pVDAcierEqEgmJ5mrorEEWAU7D5gCR6M4wtPZdnQqwiZBclLkDR17gdN9CYf67+bY3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hohob0sA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O01p6ZlU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65262TEJ2688188
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=; b=hohob0sAycBvqqdr
	cpqG86dXz2IaSY+iEs6Fq9x3tkF8+NOvcQuM/5nPzi+lQY3Uiy/JVmBR4uvuLowP
	hyT75i07ImJtfhKJ7W2xOHEQITteMr72bs6QYvQbWxvxY5PjvQ0t87Gql+9n1Vvh
	MvF9dijyx66cC42mwVHXfviM44ZLijS1nGnFBYd3WVmFEf7jEYCaxFAGhPXVQzE+
	0SLEM/wQMg9eDB4MoLOjEr1XNlZfo3Kn3fDZiuPgAGu1TMr7v1utOU17ztDdEIxP
	BecNJPXC7JiKiqaFHBbsa1dDhL/MblZCozL3+iUea+MdOU0tI3GIFu6uGW/R11h3
	D9oFzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsja8rn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:12:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d6cf547bso48393391cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391541; x=1780996341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=;
        b=O01p6ZlUii5/reLRPaYtqH4NcyTsQVDKXHCpUN7SOvGYnHL1Dk9yluX2fq7EQzRv1x
         OsIhznUOBkOflVeRTOXWkDB375zepPX9d4vDDi0NiFMDRbWAc2O8KbN+SJmdH8b5v1sq
         Rawpt6ShxqPb2Qfs5XVpZCNZR0DGV8BQzr8S0g7wSdMgOev1DpF3F8VhRyXM+FkWIAzS
         gy3vop9W8A0CWxqQ+sNu6Sxrxa+Cm3cTNF3ELRch4Dx5nUUGbAXtjX7cUvZ+gUF14Dnm
         ojNXXYRNjr+VrL2pwZNRryJ/3GbELIuDI+rERdv5PKRwamE/7O9uU2FIEexpihWRypIz
         Kp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391541; x=1780996341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=;
        b=FhOHSsgMROmV/3tnud5PRhSiV0XOjpKVx0AvmEQlnbVm2UTwUuLbZvL4lnodEq2zr5
         L2EjVXinH1qXTXJ85Ucoqsqc8E1pcBE6MKCEL1kwRsqtqk/9R39wOuT/OLrZGEobuJ2Q
         PAERN1pDmQDchPZT633teVsf2WBcj7I0rz8CLU8toRqUOdbW1NTNxSghPWlu3mqO9UXt
         pxxcuUbvng5x4J74NueDJBryNej/FcHsWS0noWzyxTJTk/U9LvPylHctDj54U92wBbGT
         Av/O/UC586i6RmDtd9B0o3yVPKldv7azBjmtyvqRlDdRW7X2rDxYzuLCWrNyurogMwZ1
         iGWg==
X-Gm-Message-State: AOJu0YylvvrFXAg9BMK1OZpY1keLR7raiJcVl7Ta0OcnISH8nz0s2s5M
	01nAl5NSfnrpzFjLGwS0te8PmShKzBldMaX+Ulq9Oash5ZWlkpsnJaXfv0ZAMjtSQDIiV4cl+TB
	3+eiYLxffEwnwvTm8hMDHaWAFmBajtTfimVUo+ZXw8yqvCnCSxCndeDOSj9c0ceWUGyYn9vEk5a
	tS7lQ=
X-Gm-Gg: Acq92OHo+QSjcrwV+KpWFZH69eACLuhA0AiFT6B/Zal9AQ2yZnXjva3PnwteqYh3JbW
	8dGCDHVPFuXCWgOfiga49jxY+q4MC2QUpUCqq+c1mn2pMmjl307eZSG5ym6t/yVO34rpuoeqMZX
	DYoB6TAAv5NH2MyAQjgaWQzv96X40LmGWFA22vgA8cqhjyzHY6FLc3a63Vi3KRtHsLHZ5CVIEMv
	WROcOE01iOlV3uVJizCIQk6n+GK3q5kTH7q+mCMaYpyVigqePB9K6AUyUTq/JjTTdeMZd5aT2CY
	Mkq8A6+UiWavYOpew5Z2Pt19iwuBgTCoR/QT3Jk0kivtYPEtwlqW1fDPvhniYYGn6ssAOt+nQVX
	/8m0MYZ3kQfFRo8JNcl2FDO+J7lbESm4634Ba4BOQ8C4wtsjV3FS+vScTr8O2SfRRu1IisXFvNp
	Uk8VmG5t+/QJNdga1K4Q==
X-Received: by 2002:a05:622a:5588:b0:516:d4b1:48cc with SMTP id d75a77b69052e-5173a5b4efbmr215705191cf.8.1780391540624;
        Tue, 02 Jun 2026 02:12:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5588:b0:516:d4b1:48cc with SMTP id d75a77b69052e-5173a5b4efbmr215704941cf.8.1780391540253;
        Tue, 02 Jun 2026 02:12:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:12:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:24 +0800
Subject: [PATCH v6 12/15] drm/msm/dp: simplify link and clock disable
 sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-12-2c17ff40a9b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=1745;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=4TJKG8RTz4R+dv3UNXgRl/mjeEf45SUuZJzked/IkbU=;
 b=ox1G7nychJ7oiBzA35Qma6lzidQKD+nkk6+TZgyPQArcq3cOd+PwVMakMQT4j5LHOjZb+smiV
 9CGT1edwi8UCq2Zn53qsPUrVFxLMT3ox/KsmqBNE7QmpzHyHPCKA4pc
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfX8Ha37Skdy+no
 NpwI4q5KVrB0ZUA1TIIGZ5RscFK6KM5Lz1aIX4+eEQ7Y14y+JapMo4d5cuM2W2gK78+Lil6xde/
 MHQDvPaspTKUY+qUV+aiHPqFcjqUGQX5KtBGXozXoYom2f7JLzIM9OE6e/RpL/mwWdUZpJRdB0a
 n7fBfYaCMw7zOgQLywS5fZFziWZ7oY9rRhOJStYqJeT8W/QGtK3w7QGD6c8Qb5jhybDAJKgS6Hq
 5h5Nu1FQBjyCiLPtP1JW2Xo5fv6SXXeFs6ZYsUDa7HcJeMSZBSuFMw8Wz0WFex0mAuF3ywXmrXL
 RW3W0auHHnqI/XGFsAwZopXp2LkeqiF1+AMgBjFtSbFMr+GWQ9SffXFd16Ib07cIz7CnOCjFFcZ
 XtH5dpi/7lrVClIwuV9KdDu27haN3X15zJ3PsT/Lr54Hs6ii3EhAIXmAWfuW+2nmE5a15HIs9fN
 ge8w2H0uGn1k3sda2bg==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1e9e75 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=W1j8KJVysGQzs9t885kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zURt8dV-da1LKiFhuzBDy_pz-ly3eZXT
X-Proofpoint-ORIG-GUID: zURt8dV-da1LKiFhuzBDy_pz-ly3eZXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: AD23D62B3DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110787-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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

Move the common disable steps out of the sink_count check to make the
flow easier to follow.

No functional change intended.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8f472633da82..63e5b191f95c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -716,27 +716,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 	msm_dp_panel_disable_vsc_sdp(dp->panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
-		/* set dongle to D3 (power off) mode */
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	if (dp->link->sink_count == 0)
+		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+	else
 		msm_dp_display_host_phy_exit(dp);
-	}
 
 	msm_dp_display->power_on = false;
 

-- 
2.43.0


