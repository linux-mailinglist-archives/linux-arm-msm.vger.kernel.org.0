Return-Path: <linux-arm-msm+bounces-102656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKTTCKfH2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:49:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AAE3D5308
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B176303204B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED993C8707;
	Fri, 10 Apr 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpmeUKRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZWs6or8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F483B47F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813801; cv=none; b=n5kJJFyk1ZzJjVTXxd8Ct35aEz/LbpZoDth7WgJY5O1JifGk+pendk0koZaVEbqnumm3kJqGKNg4Ufj5tZemIJa3ARH/btrkRzn0nw0bEhWlBab117iB3yXFVVwy6hy06uesq/osjm2vB3zt2O51U5dReM1hsPWL4+lbGDUQDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813801; c=relaxed/simple;
	bh=dd8y38ThkJ3rHjE0FsBBQGfO3q+HfWhmqfp6mEiqwCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUaQO7N4R3nGbvbA4jQTKjFs1Mg1xx6kR/xC5ex1ZCjSL8jxP9wTy5x0GbnH9zE4bg+zx165KuXF6oZQ7ih1h4wcfVEvv+dfPWiIuP961NhB9zCIqrFDisSoFHQGClauu7kTzwQAOmyhvSM5ymml8RHR9cjzacS4NdF25bnsn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpmeUKRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZWs6or8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oQkN4148720
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmC1jrH6R/pEttUTO6gaSkswPeGvo+UHEDKw4bXdq9A=; b=DpmeUKRGn85CoMxN
	Ze7ZMwGlgeuszclH9xbNbT4+Qs+r9pcpCUF3Z4ySr1v1LS96Fuorat5QOpaLQB/l
	BG6R+y0YVGuyirRamQ32EzX1v5TQkbhfVjbpN74VFRTpPfv3GSrgquVsvaZ5ExTy
	Z56+wOzVkskbhS5qUV/GP6D4/jo7f2jdO5hDZND9kSKDvwLa1gsgiixRbWtJVl2J
	ESdyn6/+h2LmIt9ywlwszOZkzAJZkk5D0Tk1yzf28lK487J0/xTTnlf634ITI4qR
	R7an6D3oS7J8U6Uc0fy2HWGcj9yhhUXY+OXpqrP2sKswgzu45eimRcvB6ywZidUv
	zmJisw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudggstu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89f670976acso53284876d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813798; x=1776418598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmC1jrH6R/pEttUTO6gaSkswPeGvo+UHEDKw4bXdq9A=;
        b=WZWs6or8CC0cof/2n+CuauT02RgET0aIS8XxnecjTr00r21UOXCdR/KI6x286poldi
         MgalXsNV50P9ZPWx3VBvnMsY4Pi7mi9cqbHCk/VnssQaxs8xkZnftHGOfyEHYa91Lzki
         ppq2irQSpxseVzjYGDv4zZxp48yHAB5995nkZFY5XiWyjp1W4EfGEBvQjm/Jjd6FMzCF
         eEYbtAdiKTcUnR3fvpXkGUxSXIX04/ITTu+FnMH6vbVdvbI2XEeSNoZvZQFiUotUgwhF
         3zUxKAs7jPMVT9ZGJaDSfBNf/ou4eOSLovdM99Hh32Ws7f0cetS5n+0J0MiiCnns4JKs
         6sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813798; x=1776418598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmC1jrH6R/pEttUTO6gaSkswPeGvo+UHEDKw4bXdq9A=;
        b=kHDCt66L/eQzsFPoVNpyGcGlTaL3C2Yx8JEJfSB9GcL46vF/B5TwJdbElu5jmBsUax
         48S/X1ZlAYAQLedPXDVhSn2B3iWHjRsbJ89onv3f+5ukQHc3B8ltG27baCK31EaEQuS1
         kWLXwy7mSQU57Ylb6aSYg0ubiOOVDHPdNXpNvZ2lGwrO7/fa2NzNnG+OUsm8BF4/hu1L
         UHxiA1lwKDcK6+wQ2CbgezyeZ4/ownwF0/lRRFVbfISUgdFcYJd4A3RvyQWg6Y1sn9v8
         5RzdySxeuNeu70YRTnyf42YKC94rx2mR107zVmF93ezyG1ERPr2AoS4U9/G5Gqvd6amt
         ccyQ==
X-Gm-Message-State: AOJu0YzDvDcG5pIentPJPRbkQn8OX4qCWM4tk3fW1Ag/Tydux7yPogpc
	gMvyuhLdYkKaNHcVQfeuddrjhE+Ztbrcotqv6aesbc5jaJikYHQGxcpDkTPaPqVsSeFNcR/n2Rk
	SCPW0MzJ+ZEarAG8SDDx5a4vVrNByFStWm5fXl1t9mmmLyAaGYYAA/A4FFPOAJHpLqszhgWkBoP
	0Iu5pYdw==
X-Gm-Gg: AeBDievvhIVlgNsyfqXbWi+XCZjVWY3GfUNdk0jmb5A67m/0iGl7E/qmuILZ9VuU0Mj
	UzkHd0jA9j5RQfcuvHZdxAaaMkDMNsK3nkXg7/NaZry6Vr1XhAKAANBFFqUKg2gOX7rnh+qUD5L
	Vo7j/toa5laptSehc/cljuRP/4AaCras7+u7+Ieev9BRfIoCYu4nD4HavQaFcUCzzDXQU9NxX0v
	bkCpTeAsk1+iaqPfkgfYrr711eKptCdcN1GlJxI8Wo6HRHBfJcez93X+rOuqWvYx8AGY09wjwwN
	9sHng9Pp9GU/7UmfqgDPlYdib8g4WUfQud0COgVWxSTgoAiGHEFs4fsdwU2YaSV1ef2yhy7nSSv
	HqOVrixlGQFzLT39QyoVTsv7zPUNSo135YYGXFfGRUnsYccczLnIcHD6e3oTOp0m4NyVH/tVFdw
	bSxX/2rxo=
X-Received: by 2002:ad4:5f8e:0:b0:89c:e4c3:dc2d with SMTP id 6a1803df08f44-8ac861632e3mr35335396d6.2.1775813797710;
        Fri, 10 Apr 2026 02:36:37 -0700 (PDT)
X-Received: by 2002:ad4:5f8e:0:b0:89c:e4c3:dc2d with SMTP id 6a1803df08f44-8ac861632e3mr35334956d6.2.1775813797186;
        Fri, 10 Apr 2026 02:36:37 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:36 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:08 +0800
Subject: [PATCH v4 33/39] drm/msm/dp: initialize dp_mst module for each DP
 MST controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-33-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=7877;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=3YFcKvp4gwFyNQoOPReMX/pBKXIsYYad0fVFQsjwdrw=;
 b=xzEHEx9LRP4bApsuxgDPtfUxqCk950DPbkP8A4bTihZLWfXceaygJ2EfZGU8QtOIETfQC08cq
 KJUvJXOcnn6DRKMlZCH21IZSwJgVLsfDmSCFx4sb4bWgfJBvrZfL9fl
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: OkGtDd2K0MG4bYBwD91Pr2PPT_PNzm6U
X-Proofpoint-GUID: OkGtDd2K0MG4bYBwD91Pr2PPT_PNzm6U
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8c4a7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Tb4r1nT5KeEeR2f--GEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX+iUhvs/pOAc6
 mtm+3rc7q4zKfc9Zk7XG9HYm9Qx+H3M/mk0fn6ZyTTzFnE2N40vqdWwrGBFOuPn1ysolI6OiZ5k
 8DOsa61a6w2StMmKdiQGgoll7I+NFvW4xWLXrcCwvEhCWFpqI6TLEZ8O3eFiOXd+nhPbNpSGGjC
 NwbTbRPH+v+PLLQTeUXIJyHrP4J6ze2i7XIQIk+9PPku4qH735OE7hJyCVZ84EfNo/S1tuimGAU
 8rVGYkhSckxdiFJUkeQQArMh3gcqpJyo+xjaqiAp55cPwg0YwdXwv+o3Hjs9/rCbmD+JE066Tx2
 SFv8Ci+9kUJn1FofWPGKK8fTqVT9FR6YJyzMwQWDVdKt4+Im04U7WsmeWXcEc23j/jdZEOkF36U
 aMSmICv+7BaRZCn7CUnaZw+C78G2TzscDxRnSBKyaqA4B6XeSZlkAkj523YL62ivB7YEaUeNxWN
 +naFBh6RQYKFsC5l0OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102656-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78AAE3D5308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For each MST capable DP controller, initialize a dp_mst module to
manage its DP MST operations. The DP MST module for each controller
is the central entity to manage its topology related operations as
well as interfacing with the rest of the DP driver.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile            |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  6 +++
 drivers/gpu/drm/msm/dp/dp_display.c     | 18 ++++++++
 drivers/gpu/drm/msm/dp/dp_display.h     |  2 +
 drivers/gpu/drm/msm/dp/dp_mst_drm.c     | 73 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h     | 13 ++++++
 drivers/gpu/drm/msm/msm_drv.h           |  6 +++
 7 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 8b94c5f1cb68..1d8426876aa1 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -144,7 +144,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_audio.o \
-	dp/dp_utils.o
+	dp/dp_utils.o \
+	dp/dp_mst_drm.o
 
 msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 090e7d790593..d7ce13a4586d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -680,6 +680,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
 
 		if (stream_cnt > 1) {
+			rc = msm_dp_mst_register(priv->kms->dp[i]);
+			if (rc) {
+				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
+				return rc;
+			}
+
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
 				if (IS_ERR(encoder)) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9eaf6994a350..919767945ba5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -28,6 +28,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -360,6 +361,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
 		msm_dp_display_mst_init(dp);
 
+	if (dp->msm_dp_display.mst_active)
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
@@ -527,6 +531,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -1556,6 +1565,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
+int msm_dp_mst_register(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_mst_init(msm_dp_display, dp->max_stream, dp->aux);
+}
+
 int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 				   struct drm_atomic_state *state,
 				   struct drm_encoder *drm_encoder,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index bda76319c459..55874daf41c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,6 +24,8 @@ struct msm_dp {
 	bool is_edp;
 	bool prepared;
 
+	void *msm_dp_mst;
+
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
new file mode 100644
index 000000000000..b6c7b8211025
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_bridge.h>
+#include <drm/display/drm_dp_mst_helper.h>
+
+#include "dp_mst_drm.h"
+#include "dp_panel.h"
+
+#define MAX_DPCD_TRANSACTION_BYTES 16
+
+struct msm_dp_mst {
+	struct drm_dp_mst_topology_mgr mst_mgr;
+	struct msm_dp *msm_dp;
+	struct drm_dp_aux *dp_aux;
+	u32 max_streams;
+	/* Protects MST bridge enable/disable handling. */
+	struct mutex mst_lock;
+};
+
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	int rc;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
+			  state, rc);
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
+	return rc;
+}
+
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
+{
+	struct drm_device *dev = dp_display->drm_dev;
+	int conn_base_id = 0;
+	int ret;
+	struct msm_dp_mst *msm_dp_mst;
+
+	msm_dp_mst = devm_kzalloc(dev->dev, sizeof(*msm_dp_mst), GFP_KERNEL);
+	if (!msm_dp_mst)
+		return -ENOMEM;
+
+	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
+
+	conn_base_id = dp_display->connector->base.id;
+	msm_dp_mst->msm_dp = dp_display;
+	msm_dp_mst->max_streams = max_streams;
+
+	msm_dp_mst->dp_aux = drm_aux;
+
+	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
+					   drm_aux,
+					   MAX_DPCD_TRANSACTION_BYTES,
+					   max_streams,
+					   conn_base_id);
+	if (ret) {
+		DRM_ERROR("DP DRM MST topology manager init failed\n");
+		return ret;
+	}
+
+	dp_display->msm_dp_mst = msm_dp_mst;
+
+	mutex_init(&msm_dp_mst->mst_lock);
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
new file mode 100644
index 000000000000..5d411529f681
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DP_MST_DRM_H_
+#define _DP_MST_DRM_H_
+
+#include "dp_display.h"
+
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
+
+#endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3061eca49cb2..5f73e0aa1c2f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -363,6 +363,7 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
+int msm_dp_mst_register(struct msm_dp *dp_display);
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -384,6 +385,11 @@ static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_register(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.43.0


