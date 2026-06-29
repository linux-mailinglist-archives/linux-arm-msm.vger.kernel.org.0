Return-Path: <linux-arm-msm+bounces-115099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IwKXEthzQmow7gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:32:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9584A6DB3DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:32:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gUldENrR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fm6jSiZi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115099-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115099-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ECA43300DBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654C641C2F1;
	Mon, 29 Jun 2026 13:17:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A6421EE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739075; cv=none; b=BaxkjSciap2aGts7FHrsWA8lfD7J8Uwb1poYYSp24IvE40EiVumARgByyPos3ZHMGFDdrtcFkWheuVGkGzUFHg1IUXst6/gSfnbAD/8YDX+KhKCffyWOKmYyr/fz7ocwiosS3U9e5AuYyYi4WQ3L5paerX8w+njQDoC0RnqjwO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739075; c=relaxed/simple;
	bh=rC8ECe/8MsOC2KoqDzUqIDvobwaJs83BIF8BeX2nSpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EkXDL3MhLinBK/g8Dyc9SgIrZWQ6ZhvOz/h7eQFpI0ybwRkgDbwFBojgLAJ5yNwBinEKKR/xZjDaz8L4MTht2gU9ko+yjU/sQE1LiWDNYSbn6xlSN52NOPSRODa5JtqqQ8YCjZQEdWuNXZx6K7lApbfDVcaZ+iHo76yvafNz5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUldENrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fm6jSiZi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASwQk2603482
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKiaT5xx/5Rjyv5AnTtLaGoahc8vP2Fk5ORlipxINwY=; b=gUldENrRoiE02QQx
	8KpwJoHCUWSLVv+rJG9OkrusdoCZqGzYTSLnBTGShHmzFvQj9Utk1pIfI+WTyxk1
	QKsLbYWWgJ7B2CtV3l+WOiaJOMWsOtD7aaxXFYwE4/RGTzw8FyPpAjDyuKbxDYlG
	QPjnor9iFxeSoOUo+mLmBCMQWn+lbxLerNB1Q8H6NKwXIV4RsjGN1mWGxqaQ+CqP
	yTWx7D21s6gSPcVOSDSMDnLIuqco+nzw1ykB06lKzoI0VyUkXd+vX+2Aoaq0QJ5s
	KK2CF+mdjVgQ65I8prFeh9SBNdJnn+v0JeX+IBPmc4myZ4z/5qVEFe5R6sq47zyH
	PKFI8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88y29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ee40bceb55so43525456d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739072; x=1783343872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKiaT5xx/5Rjyv5AnTtLaGoahc8vP2Fk5ORlipxINwY=;
        b=fm6jSiZieeq1mlxSbMV+brp6cXxTJPWWCQPPFhXUJ/Ee104uw46HnbY/cgbKnMFDh/
         TCs8Sz6Bi9ZvfcHWgFBe/6MsD9pg8okppS2yb9eAopv+yg2nnTjNIZInuy1Ek2gKgG8s
         oRRIFUaOsQWvGP/jgKjd9o63JGq658gtU9MzsRkDqPp1PuWeiaKsWBKXB2juO6j2z+bT
         8dfDreHCclM2POrX8CnllvMByrroeVl1kC8KQmSle40WU7yxmRnKHdz++dZgy1PMflfM
         USEFyM/+ccyEZhdYdFS0YqZBykM2yHWqIlF1sRUmN3L6RCvkr+Bsv4VnrRqfGySnXTyk
         XCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739072; x=1783343872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKiaT5xx/5Rjyv5AnTtLaGoahc8vP2Fk5ORlipxINwY=;
        b=VQntQQAArFU3O/gIalG6XBuKKmGBGbRVtM3B4vqmErRPPyx/3t/144wWbHrISZ3Gqk
         dhUUBI7uzK3Fz5W8CqdRlIjquvweqfF2C/8iltu7s3FyjRgtqve68olG/u4GvvhAe3hO
         dT0MwsotD3ivaPT/BLmBcOcy7AbhWnXL2dD/mCw+VWcECW+Aqt2LwgW9JmaNKN68Iy5n
         O/AWCc8wm61z0VYPfYZdYoD3JTMND5TWNlVd1x/xi5hHxLkQoxtziK3ZGsKjPQAZU5QJ
         lLhxjfQQPuVY3EfpiAsLvqbgSLNnYPfWCYPmIJ39FNpGa0uJluLBnukTlx7USoPAuNSP
         PsLg==
X-Gm-Message-State: AOJu0YydDR/UtcrkR48D745sAV0Yy6jui/UXRuYZJec0tB3LektxzAMk
	1e7biNfwYZMxgSfognTERqF5W3g1+yJ+IhfMv3xuE8U7isAT2J2wHwny/MtLjHD2jRhNJvlAcXS
	S0rt4ApDGkMLyyFIYl9XWLw1NhuMqmvcuR38OHc6lYEtQtt1MH3yB5GjfcxYRe2kzV6SZ
X-Gm-Gg: AfdE7cl6UTc2ofD31yz3a0kQID7NJl4DyNoTwXwzLQIjNCvp5gmVLvaXs4ksK1mBj7E
	nqjESUgojlLPcyQH6aPdkMPntjyqTwUo6ufAFCGYEp0Nr8/PYEApEVjNC4kqwvY1jc0ADFt0NoJ
	PAk8O/t+V9SbJTnjMtZxrZFv0O3bpXByJVzlYc1ILjqK8Dkwtwpft+xk612/B1PqONNWyAOPVPz
	lTbcyVtnicET2pv8eZ+OZIJqFEvXiZ0vIUHT86VlcHo9JV7ryYO/DIkxJgOiOA5csY8ViUj1oCl
	gXYCrlE/6gG8oC3OE5AHK1oCkGd/GzihS/bYFu2VjQiYlNKpkF1zoush1nAXZFlQ6LBG11vvaZ/
	/81mU1Jn/dCHkNMyckqow+UxXxuJ9dWQRzNRwv4EnJfPuua0mMXWeWK7g9SXQcCmZ/rYkeqmaZQ
	==
X-Received: by 2002:a05:6214:f25:b0:8df:1814:3a1d with SMTP id 6a1803df08f44-8e9847828d5mr169656076d6.22.1782739072480;
        Mon, 29 Jun 2026 06:17:52 -0700 (PDT)
X-Received: by 2002:a05:6214:f25:b0:8df:1814:3a1d with SMTP id 6a1803df08f44-8e9847828d5mr169655486d6.22.1782739071875;
        Mon, 29 Jun 2026 06:17:51 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:51 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:34 +0800
Subject: [PATCH v5 16/25] drm/msm/dp: add msm_dp_display_get_panel() to
 initialize DP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-16-1d882d9012f4@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=2339;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=cRES0c0OGAe+Wq5TijiVC3vsN9LDNpp2DEfSA/mpQKY=;
 b=BPXZQqbD+OoLrbR4WKv2/cw7Eg3WmwIrZamFveBb1IYFuenm+zS8vwTTcMf9uNx5hMwA4KBdI
 XiOdxk5XCUGCwUYjQZHTQoiZNCwx0RKrrh4S1PG910ygnx/pr8gXZjl
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: cg7NJ4NwjQVUkAeAazEcG2pkDmbl6jZa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX0u22NxTv0Pjh
 4bqJ8oOjrwqJePaBzsNuLB0F+MYTjPq/8y3hJP3QHmHAlp4a+mdZVfpnPYrdXPoVrGQCnd90UcW
 7T5vmz4u1epxSv7S5EGIkXEYZJQt2v0=
X-Proofpoint-ORIG-GUID: cg7NJ4NwjQVUkAeAazEcG2pkDmbl6jZa
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a427081 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6cFZRJIsygQ8aEszaMkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX64xgFbV/1EBQ
 oH3vrmg+OIviAzVfGc0eTtNhAhrUkh3L2HEuqpnkXsrImLLRomNx/HRcuLmcVUWH+05IIjQon9t
 QanfM1YC2s6t5HJZAl3QTaGQiMNSQmodb+4z9MNTPKlQbJsGjc2m1yjGLFbe1SVhlVJd9QJalKx
 euHqglxRI++p2VEaQFVsPGRWGqtBeZPG6Zz2SYeiM1QNII2BO2yd5+4RcLWuMKpVKjI++Ta78XU
 4QCEg+W2xC5E9HYHYEx3Ks5YGfLfiqpAcvxWbJBnBfsJ5qzH4icWx2cUNMBWyEInIdmvbKj6lcz
 eOEGwi1m62L2tDeYahOsAwkZkjGf5ZWxtCZYFoo2hMKEGhBM7dK3yjIT9CXPaBx6EcMSEvGRvbf
 UmH3FmJvUmZDnZYOLhwHIBRHj4tOcpsUdK4lobmb7K8qTOZj8ZMCDkhtclnCv+iLBm4rLT6rKNF
 jAvmuQiykgbQeH/k+5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115099-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 9584A6DB3DE

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API msm_dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c3be656f10ee..2a74302bcb7c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -565,6 +565,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (stream_id >= DP_STREAM_MAX || stream_id >= dp->max_stream) {
+		DRM_ERROR("invalid stream_id %d\n", stream_id);
+		return NULL;
+	}
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[stream_id]);
+
+	if (IS_ERR(dp_panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	dp_panel->stream_id = stream_id;
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 75dc40261723..676213a48089 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -58,4 +58,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0


