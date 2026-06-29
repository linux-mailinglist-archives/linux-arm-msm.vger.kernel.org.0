Return-Path: <linux-arm-msm+bounces-115102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uoUMDkVzQmoO7gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:29:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B98AD6DB37B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:29:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dEJwNika;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=InjwIE5f;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115102-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115102-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF8C930711C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE41241B37D;
	Mon, 29 Jun 2026 13:18:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4141E423168
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739089; cv=none; b=W9uOM/urFQR4B5ewQS3/h0wBEEEkU+CLw0HGyman3mPzcBZbc9/MGIfrGoXezDvdZsyhd/GYFvfe0wAUHh/VfzTzpnqtLpnhj1sKPTGkZKZf1ImLF0UpxpUk9ARc5931hk70inGnuaHd9sTJkj6p63Ph+5XlMG0GdPWBzRmQB3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739089; c=relaxed/simple;
	bh=ZmA6j9PaSgiCKIx18GfrmSXgrNCTuY6lHFe4jcnsXM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhvnawvS06oP4pmZ5lNmFEyhA7YtPQZeyp8vxHqyS96bL/gY9JE5/rGKVfq2pmViFwVgZcwb6nystkfxoAS5QFr31Eto1WsQknZHOLhR1XltQ9mFtaldrJGmRvnAuT8alTdm5RRI7epV/BRJt+DMkweJESVm8JQyXTMXKtgqSeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEJwNika; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InjwIE5f; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATSif2592843
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTRODGoRdiTbi9v1uwQEXTif90CmJA2jnvlNqKTiqQE=; b=dEJwNikavyA6bXL4
	SNw47lnNppd/bM9glrfv0J4e6p2pVFgTRmcBrq8AjsF3pSje8MzFQ5Zi015Lw0T6
	6W4XMmCd+rzFrTHsY2uHgdduftiQc2C0Y1BwjCOPyZe3bELiKWPQri+L8NTi7eKD
	SYpybFNd7VU/26ojk1Fe5NBYdYDFD7ZxjXxVomaBOYT/kB+8hWPxUpPQ2b9FRkuv
	O3duwTr0itkrcV+DIVrx7ZAjdbGGmGFu8AK4shprYYGyDXgPzJC1elaAioLCSkcQ
	2g6kmKNNv/AChMWSl88wpX1Mx6XqKyplnxfJSYApCX1tf8j6kfgK0g1QPLoMv8AC
	ZwRf+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhtcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92da6f3cc81so407376485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739087; x=1783343887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTRODGoRdiTbi9v1uwQEXTif90CmJA2jnvlNqKTiqQE=;
        b=InjwIE5fCInmrsXXuH9yc7Cp+Zuc7Gk9i7S6FZfxB3WUh/Syf+r1wyZcXNkwevhJkk
         8B2AN0EShmYzo+jmKEYQhhlVDpzFSbJXBMohAq2iWlkDgYozutL1aqmuueKnrkpCIy0J
         6BOSch3Ry6t+sk80PX3ag5G7PpARJSp51kEI9QC3tMk56nFm1twJQT8deBz39Tpu/tkx
         mBwUpWTMfIxBMj4J06/z46fqOfU0LDHovxjICOTDn9VGjXYmJcpZIk6iqFN77pfRFPAG
         YsoCSw9OO3XVh28rb0lukA2OIcZMKMajuJDpLR+i5eu5eizV+Xgf3KDJ4QiRFl6RzQD6
         k+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739087; x=1783343887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTRODGoRdiTbi9v1uwQEXTif90CmJA2jnvlNqKTiqQE=;
        b=kY4W7RPmOS/+5vsLskdpewtUmCLhh7mpTVXJtiK3tVEC3HYd5KUfSgZ5Dhgy57sLBU
         96JLorwEDdXzFD2q20beroLNh5kDfvupStz2dH+DEUVOThut0u2beO1Fto33nzV7ywpB
         joS2qGNMmiFQKHqmYuvfh2CbTmvHS5FaQfo8H8BXtmXcApkfgzSUk7S0W1hLmwpWUIKt
         G+qIoe1GjQJxjl6/Tcqm2Q7950QV1TZwB5+x6QgrVe5eejm91dio23rJ2iwAF8AJZ/Gi
         WOKrp9ez3gUfOP+OTPtGeTJEhkxkZSGSLjwi9NVfZy5GncF9pohAET3ZxC62QRwR+BUf
         IKjw==
X-Gm-Message-State: AOJu0YzYQIFS6ZSUTpQPWLpF1zulvhkz58bhPt5HguhUDJUCKDzRXDNL
	Mm92Bs48Fs/veCQ68h6N1ND5wMgDFTJtx3+xnANYE1vXPGP+yyWQNZDDBMNfmLP/gDRWvuEA1iE
	j+V3DRyd/oLvrlbFIf1QiKAU/3ZXqPaMj7cTdn+ehnNGodwAzmfBvt6EG2u/xJP1Ifw1+
X-Gm-Gg: AfdE7cnH+ssbUUPABKPm6uIAUVAAmhFO3XCmxG91ZaCEHyKQwhuY/HpGguH4G7VGdvi
	SOFTX/NuXjQP+mhnYVv7J2gxgXLVCR7B1oLABHIiWjisxJ6asjKTo3SmbYpNkOGBI/6JLdtJnap
	neKmOpTLjrQudxa+EG/9AXqsWhUJTY1IlcDF/wMTrE58kTlcLqAx3qEmAryLq2egmfChczDRGjQ
	NXaH3QaciLf3y/3MTPZ81NnOUuytG3DdI08hLHuGCDoh+hfcLqPweTsjMmrIc27ciDvAN6NdRzt
	sxmWP31PvIZYO7LwHFLEMD0uYGBB06wdBwVOGfwO5q0WAkfnuGT+LY4fZZjMQksoKXTMy5LlwQe
	ZeG3zXG4V4xhuQOCq8+bn9OUjN+p3Qy0Bmm+1JhminjzfwXawIQU8sn/h1qXgmTPW2JP2BPqdLg
	==
X-Received: by 2002:a05:620a:318f:b0:915:a457:bf94 with SMTP id af79cd13be357-9293ddae9c5mr2651652185a.48.1782739086562;
        Mon, 29 Jun 2026 06:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:318f:b0:915:a457:bf94 with SMTP id af79cd13be357-9293ddae9c5mr2651643885a.48.1782739085994;
        Mon, 29 Jun 2026 06:18:05 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:18:05 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:37 +0800
Subject: [PATCH v5 19/25] drm/msm/dp: initialize dp_mst module for each DP
 MST controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-19-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=7456;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6XyUS6qRZs5X6/pKt4qoYuSBISthOP33nj+/4w99iLA=;
 b=50jbqliHDtGlXbwJhIhm/V5+mXrBDp2j2PNZemFj0YuQimRgyFsYJa+UsI9mvdPcbz34NzROT
 s9l55lC7vhgDSNmEvClQl0lrXEmMeQybjnD2N5MUHNlw4xY9v2l1VYe
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 8fZFkUQzMAfEJOhq_1uFVAv0kikuYIH9
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a42708f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Tb4r1nT5KeEeR2f--GEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX6K7I5BQ9uC8a
 BCqMnep/xZUees40R/z8Ers6iU3CygLBGb/lkDINcJ3zlCmHa4HaBW1WNksazDMYBNqE2cD6KZb
 MscZz/K1j9Lv0Nu8K58Zg8vSQKbFIvw=
X-Proofpoint-ORIG-GUID: 8fZFkUQzMAfEJOhq_1uFVAv0kikuYIH9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX2tnqx3HlEN3D
 MKc+uhsqa9izR8U7gvTvquVMXegduMLxN72I1q2j0lhssYUeat6Ut4DhcQOSI31r7k92BmS7MxJ
 AAA2pZZI1WjPIcfDQgkQCd/JMQL7tXZnwt4fhACXzo/KLO1UGl2yPa1CEqVGQTXxsrO57NOItOj
 OnI4ZweL2GLj15yIYdoSU7C6Bv3bUlSLStnbjx15/Y26ngfSB40gp7k0v0V3zXLCM4CnHNqWbnf
 61FbUzvhzLn6g4W9nCqpYcX0ARtoaO4p3s0wAniusQACdL79APNZmnZqxy1avx2eYo/+uiV+z6s
 7VLPURahBTi5VrSkzk85RXrFDSQxwhtZSaM5ivbmISk2FHlV6UsoOztU7TFSTq+UI8J4qI/LNlV
 UPBQYFxsDimWz7dE/y6vxCOpmUmVOQugdf34WT/ryeWZy5qPiNa0JGUcD3Nu0cd6kw8gRKLse9V
 QBGgvcjbUkAY770bWOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115102-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: B98AD6DB37B

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For each MST capable DP controller, initialize a dp_mst module to
manage its DP MST operations. The DP MST module for each controller
is the central entity to manage its topology related operations as
well as interfacing with the rest of the DP driver.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile            |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  6 ++++
 drivers/gpu/drm/msm/dp/dp_display.c     | 18 ++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h     |  2 ++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c     | 60 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h     | 13 +++++++
 drivers/gpu/drm/msm/msm_drv.h           |  6 ++++
 7 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index ba45e99be05b..d510be1c173f 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -145,7 +145,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_audio.o \
-	dp/dp_utils.o
+	dp/dp_utils.o \
+	dp/dp_mst_drm.o
 
 msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7a00c4094d5c..91d33b432427 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -682,6 +682,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
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
index d56ee10ee065..fc9c1e3e57ab 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -28,6 +28,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -351,6 +352,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
 		msm_dp_display_mst_init(dp);
 
+	if (dp->msm_dp_display.mst_active)
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
@@ -522,6 +526,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -1530,6 +1539,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
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
 				   struct drm_atomic_commit *state,
 				   struct drm_encoder *drm_encoder,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 0464f8941e8d..a185819ec57e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,6 +24,8 @@ struct msm_dp {
 	bool is_edp;
 	bool link_ready;
 
+	void *msm_dp_mst;
+
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
new file mode 100644
index 000000000000..78b8dffe111b
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <drm/drm_edid.h>
+#include <drm/display/drm_dp_mst_helper.h>
+
+#include "dp_mst_drm.h"
+#include "dp_panel.h"
+
+struct msm_dp_mst {
+	struct drm_dp_mst_topology_mgr mst_mgr;
+	struct msm_dp *msm_dp;
+	struct drm_dp_aux *dp_aux;
+	u32 max_streams;
+};
+
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	int rc;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to set topology mgr state to %d rc:%d\n", state, rc);
+	}
+
+	drm_dbg_kms(dp_display->drm_dev, "[MST] set_mgr_state state:%d\n", state);
+	return rc;
+}
+
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
+{
+	struct drm_device *dev = dp_display->drm_dev;
+	struct msm_dp_mst *mst;
+	int ret;
+
+	mst = devm_kzalloc(dev->dev, sizeof(*mst), GFP_KERNEL);
+	if (!mst)
+		return -ENOMEM;
+
+	mst->msm_dp = dp_display;
+	mst->max_streams = max_streams;
+	mst->dp_aux = drm_aux;
+
+	ret = drm_dp_mst_topology_mgr_init(&mst->mst_mgr, dev,
+					   drm_aux,
+					   16,
+					   max_streams,
+					   dp_display->connector->base.id);
+	if (ret) {
+		drm_err(dev, "[MST] topology manager init failed\n");
+		return ret;
+	}
+
+	dp_display->msm_dp_mst = mst;
+	return 0;
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
index 5fee0b291059..963303079220 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -356,6 +356,7 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
+int msm_dp_mst_register(struct msm_dp *dp_display);
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -377,6 +378,11 @@ static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
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


