Return-Path: <linux-arm-msm+bounces-97649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPxhGWa1tGm4sAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:09:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F4F28B271
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3589307F039
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8DA274B4D;
	Sat, 14 Mar 2026 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IywVHW35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLfjiD/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F0C1B4244
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450566; cv=none; b=ffCRpXM6FSGhKhehijua5Em86m/DMtNJSDHqEelzK4DrDmW2hEx53rRRoWq9EExm+u4pTm7ssDTyqrRCN79ZOA1cAyDoelBEqsARYM6GrEjWnCDGtpNfsiut5igcdD+qOrNvY6fS4C2urOX2rJRxGrRx7w7DF4payJM5yyi+vR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450566; c=relaxed/simple;
	bh=LPHhajodLCFrdH7G7QitIxc+DezXxi+iOPyKRDEeXY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNWSu5HENmLzMz1+y8qciLd1T/kEnJZ9sx1q4MkyDFQumpnw3Ptf2rtdFANjA/AvlJJovfVgrlduqNxHEWmrB8d+ue7T1uYd/WAIaYnTgZZ/MB1z+goZumuaf4t7k2Gp4qFE7E7oP/Tl04J8ezzHyidZNAb3bwBSfGbCpfwVPGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IywVHW35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLfjiD/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DI96vQ2393503
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzVpX0vOq62SAEgnYrHTEusxqWZeEyyGEwRMXWbZKk0=; b=IywVHW35D64eBKqG
	BeOFZTrqkA5iVDTNsPer29OPudwL98ljqgD1eHAgkV9NbKltw36SGsQ3qK6QnlxG
	Hn1cM/F5e1tTwV0G4FB3h149z621eZ5dE536ngDc5GuXkSt1xpVRJDER2FKLPk5C
	tYpntrKrtFkI0uS6m5iwy08Efg3UCGabyhS2quixuKvUnQY8frSa1zLFazPNJCx0
	Cj9PM7qNMbwF0/n9yVODjQOpTxtCno19EEn7ZXLS5tjIP7CHi+4NYXzHCE9y3TzL
	ueB7XjQk9bNI6NL1rotvjwB3+24vk1ib0brCAapv3woMJLDCkEUdEjaBbj/4HXQ8
	j0bYVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5mahds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso2616811885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450563; x=1774055363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzVpX0vOq62SAEgnYrHTEusxqWZeEyyGEwRMXWbZKk0=;
        b=SLfjiD/HxdLF4H+nkoSWJic16IUqn+4HEFZNYAf9L+Duc+JElfjc6aYQmJdRAuhwKq
         E7huWFHDfNgvJPJukfr3aRbcvYkSm8hCJWmscDqHeCuGAC/wSdNMOK030hMRwBBhoGXA
         siAm6StULztNxMdCIjCwbJaqOvnp5q1NTCxNWYr4sZOcrsK+9IaiavYYQ6qDiYpGdBU+
         r9JwCk1JlBsb+tpZvrlPWlPdnGTuP2lorXuDx/E4J/HVarjBWKB87LgsD1DPWtb4xk2J
         m5t9ZOM8jUkNKJMb9bpV175XsoSrV+3ZETVZEbWCXn0yHx/p45dpl4U+94kxZZefnH1D
         7jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450563; x=1774055363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pzVpX0vOq62SAEgnYrHTEusxqWZeEyyGEwRMXWbZKk0=;
        b=EPzXzPM5JcwEhwfPUa0iydPCu52Qui2i2HDj2/Z3z7bGYM1GLqCkWirJty8JsMe79X
         GIbewSFg+W5hb7ph1NKCsCn9Ku0jCNKij7wBBmJd46GUpxw8GodIbSb3dQj7qBXENrPh
         WG3/sgy395nVXwJcEzJMUmnSVbq4PuDllozTFAK6SP+2RFXCxh02Xg1MKiKKRE6mPiFZ
         cHphq62VADTfJNRnS8CrNRQWmCaEXtVwfvENgYt1X4GZ1XopRckO+KeKUU+mrX/0y7VS
         0xT6Ek5qSdk7DTT7pOpkPnLHPeiRxaQw+yakaf9lQGM3Igu6BRbKwszfHZBdzmPfnXO8
         ZzXw==
X-Gm-Message-State: AOJu0YyuCBEUoenvKqUV6mUipdiOeZ+lmf0cSxckjUuNpYOE5SkiPtUK
	TWG138ZIkZYf/6WlnnTILYi+hxuZrgmZgErcPAzlV0jXyocZSEQwxwwtqzQQsWwWclYbeedu5Xe
	R0Y5Yt1jfPXUQjiPE9VVb1vvTlH42c1SyvgQeXtn/pkLgk1JlzJxSOPSDxMxCYo3lbZNgd+SW77
	Hs
X-Gm-Gg: ATEYQzy1bhzpkRmryyel+WN47yrxY96DPPLYU7P7ZoyzE6ydUeVfMTrGOCreKX4+yX+
	VI/wsHvf8+goUbrXgZskcO96J061m5nm8jO5UYKYvy/vH+em80jCrfxBUp23M6jiQGZmjworLuw
	LUX85na7JCsWvzalcFJS0IZjRT6C+31mh/JonPmcFv4OADZ3Y1iCuUFOIAxdAR6HjMnFrElfayL
	ACyFlgW1vcf+i1WzH41IyPRrLhvBkvJTG8BB3OpdiOW1Cg1vOEvIM+HxhpAgoF+sN3VlIdqg9+n
	r7+PPs9VRzmPv65T9ES3lBm1gOlfQtoxMifNKkqaKromx1Z0XbxR4QgkmqF3yqwIQAF1cVjJQKo
	PcW0TFUodqSCJhynlTLRfu5c18xhZTaHHte7Vmaow9DEC/y5ZQGjPp5adobjq6tVMiJGFAj0dCn
	7Y7cEEknpHzB6pYWoGb6fcQqT+n+jhqNYZwBU=
X-Received: by 2002:a05:620a:3195:b0:8c6:b247:4c with SMTP id af79cd13be357-8cdb59ff4aemr800777785a.2.1773450563373;
        Fri, 13 Mar 2026 18:09:23 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:8c6:b247:4c with SMTP id af79cd13be357-8cdb59ff4aemr800774585a.2.1773450562940;
        Fri, 13 Mar 2026 18:09:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:07 +0200
Subject: [PATCH v5 03/10] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-3-0c8450737d64@oss.qualcomm.com>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fflo70A3oSMP6LkHXNPuDEYg6XV8ot0GBkcmgzq2Sd4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLUzSX0Yvt+mbPHdcgYX/8JV/EIlm8oX59QLb
 v7OgZfSiEmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1MwAKCRCLPIo+Aiko
 1XqFB/9wKZJq9LxL11bSOqiNpbCmdspf5rAtBMF7Lh/1flH7eirIkNkwtuSh1f1lOZmHQod13v5
 6SiTzPdY8EHcz9CEe/qvUi5t6qroB83+AjUz7D3BNy3whNHMYkfRdRkX8zcu9V2CD2EG5JzmtRE
 QALNFS74iW8+b6A4VekcaL9OsCajS3FphsdP+n+i5U3pr1dB8U4gH64SrBBwavuLt6Y7tnP+fJh
 qNnEfLmfE4yP7Ij/pwJgb2BPxkd9Oag40r8dPnqzwJrpH9GaRzlO6xKeT23k4ZflqtnwuTcrR7a
 GIUPfSUx5TY5HznvwPHI/oQmPBzcsfftHTDf6N961rqB8DBE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZOLpWLv8GbEfI5Ti0v5yAeEXb0Be23CX
X-Proofpoint-GUID: ZOLpWLv8GbEfI5Ti0v5yAeEXb0Be23CX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX/SsE515D3ZcS
 vMf2GBFpaoYbtmZafcGxp71vXc5k1Y+gUEmakqjBaHwaVjwl5xbUKF0L9NMb896VIVnvez5osya
 no/9TI5Lt52zZTCnv62q1FBzy12ldDyGmxbxXJ1+uYjZ/hYsKjTrOhfvNXb67Dt5D+Jn6YB4HZL
 8iQsoe6RLsYZwgt7zFLgMM+1ChtkPWROZfzo8hW4K6g23nD7lbyhhyi9Pw7KAMTOlkjHfWdVDjE
 Mo5sin2zog3H0HlSZfV2PPlV+XIKTm1wZiNj486KSzE5Q0kQ24Wd72yVC3Xsee9u8139znycuLH
 6yN39MF+gKBrPOtYFUXb6TmOrYS0YA04oBaf6PaO3aOOpcTIzbvxkdmv99mIvITGe4KDNCPv7Yg
 JfwkxGYe6FLJKaN3gqlgx9NGjYR/4iiWV/DvcqsEgw/465Gy/A8CywSzh9f3G/oWJtpTTiDOUx9
 pEpJ4YVopnHOZr2jONA==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b4b544 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=jcEwYMPARZwhhGfK5pwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97649-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1F4F28B271
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jesszhan0024@gmail.com>

Instead of relying on the link_ready flag to specify if DP is connected,
read the DPCD bits and get the sink count to accurately detect if DP is
connected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5997cd28ba11..a05144de3b93 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
 	return 0;
 }
 
+/**
+ * msm_dp_bridge_detect - callback to determine if connector is connected
+ * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
+ * Returns: Bridge's 'is connected' status
+ */
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *priv;
+	int ret = 0;
+	int status = connector_status_disconnected;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
+
+	dp = to_dp_bridge(bridge)->msm_dp_display;
+
+	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	if (!dp->link_ready)
+		return status;
+
+	msm_dp_aux_enable_xfers(priv->aux, true);
+
+	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
+	if (ret) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		return status;
+	}
+
+	ret = msm_dp_aux_is_link_connected(priv->aux);
+	if (dp->internal_hpd && !ret)
+		goto end;
+
+	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
+	if (ret)
+		goto end;
+
+	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
+	if (ret)
+		goto end;
+
+	status = connector_status_connected;
+	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
+		int sink_count = drm_dp_read_sink_count(priv->aux);
+
+		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
+
+		if (sink_count <= 0)
+			status = connector_status_disconnected;
+	}
+
+end:
+	pm_runtime_put_sync(&dp->pdev->dev);
+	return status;
+}
+
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index fd6443d2b6ce..e4622c85fb66 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,26 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-/**
- * msm_dp_bridge_detect - callback to determine if connector is connected
- * @bridge: Pointer to drm bridge structure
- * @connector: Pointer to drm connector structure
- * Returns: Bridge's 'is connected' status
- */
-static enum drm_connector_status
-msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
-
-	return (dp->link_ready) ? connector_status_connected :
-					connector_status_disconnected;
-}
-
 static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 			    struct drm_bridge_state *bridge_state,
 			    struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 9eb3431dd93a..6c0426803d78 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.47.3


