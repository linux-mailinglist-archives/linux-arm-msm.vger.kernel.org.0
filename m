Return-Path: <linux-arm-msm+bounces-97651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIauBlu2tGm4sAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:14:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A003428B30E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EF0B31692C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8BA29C33F;
	Sat, 14 Mar 2026 01:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/ctSXwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQw0VXUH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710462D5432
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450571; cv=none; b=FCeJWTioMeGbdCXHZAsSTBLgxiUejrFA8rl71xaunJOl1xuQXIPPSM4o0IE1VJTMBCheyp1q6hUH4mfdC/W9DiAR2hvJMXA2mKcBpA7BWkgR2mr/jL+YebGOdaFqAGO1h1fXoJGhVSDitQSXDRDrm1vDP5t8ce58tTNnd32QADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450571; c=relaxed/simple;
	bh=I7G7MN3cQLSG9zzE9VRfHedS7xYGG7oJXnJMlN7BAkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9ZEI1xoXX+2mfFxGI0DT+AijNPqvUm/3v6fAxK6ajHi4enpKnegwcN7DPBceOShmjfxTBnTAXWwgk4TuF82nKO5vZng4CzifZGbQm8kWD87tjT956Npwf7iOP9UHYX0TGlmzNRG5VGkQCXostAz+QZUcUqdxtW15V2t3oueoRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/ctSXwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQw0VXUH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DIadLx2389979
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8tg/xGuicw7U9Xav9pczQObs2YXJZYVzFJvZGTJOhik=; b=I/ctSXwH52K3mw2U
	MO548GHScOUbbjltbKyP8aaPmm8pYZ6Wc7BCE7DyH1BMCjewRp5osSdAleD6fsJD
	PqmJ4bBOxLzT5+GeObKc8y6JntnM2mFZQgCtQiI2Wcvj7iHJZMw38NRWQHwZbqcz
	fg4pq2TjZt1XgcjHGU96dzRdv0GB8/pMTFcvErBT7qJ3ohBYOouyQtKOwXqHzoKZ
	QfSGhTkBQEGiDV/tQQ+4r6B4KUJqo4ybHEHXFJnTqPelbkYkPj4lLFh+aG2mZl9N
	CKDOzcpCqi56c3h2nUJJpoRjmHlzLjcZTAJnHl8v+eu/FHjDhvk20ch1GaPo9jK5
	M8Xj5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5mahe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7a25c5a9so1473433585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450569; x=1774055369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tg/xGuicw7U9Xav9pczQObs2YXJZYVzFJvZGTJOhik=;
        b=EQw0VXUHcpArblgkXLjtcovaKrLajgm2u7O+9GfiTNurgH9bA91dsjFLNTjmhjtvfe
         txebe3rRJqGXWq/lJYnaDLO67UU+mWRTokDM4ei2f8+uETRG+hxwVy+VP7avXvJ8rhFy
         xD9AcBpu+tzuT+N8Yr5dBM6Ed0SIoSck7FoVLLZV7q9Qzu9QTSu4YYSA6wR9J9Go+vtj
         SChxUKRB+PBeAbwlUMIDDPxxWgTvkRuDvD6jADYRPNS08zVyGe0iABZ1TFReWZTWalaF
         wpJzCnBQP+QbeWMdsV32EjEnzPclWw/57fNoEUWZv+LTT6CJCq+6wn+1kDDKcvYgr/9v
         06MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450569; x=1774055369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8tg/xGuicw7U9Xav9pczQObs2YXJZYVzFJvZGTJOhik=;
        b=ikpHuL6Vtg2C/aQ+gsIt3hNmtp3AApBzHvxUWKLjkbsdOdTEsOIGv4k8SywN6EfvtC
         ArAecW4ZJLVXJ/sCrciHSBeV4o/CNDvNwgs7YaN0Ae5UHVzm10gVHch2OLz5vMtuMFhs
         jkLE657QQcjIPKm5wQFQroRHrn5UTRL7JiJMiiptW/iKeoLoW9Ip9WmR7TfLKkcka6PA
         m9QhZs/zrDIw7Q2qB0hSFIz5uMQANvyHd7PPs+/E79+wazp+yJlmwmPUER1MN7UwkzDm
         CtPgMICu6nucwgybrv/t8a78TIjHG08fZRBPjmUNuOXZdTninX4mp7Eg3bpjgRQnDPdT
         btpQ==
X-Gm-Message-State: AOJu0YxZJnpfbAkmDy1Wcf7+GJMBzW0YT3yJV1W6gCYlWi/laN1axsjQ
	pT12f9fVFeXA5Y54zp/oFJhvC6iBRKpxtXHWLemFhoC4CUXmb4yd0mIM+paReDXNGDBmlipbyO6
	IaUp0GDrpFDNd16fa8MK6He/lRJ0NKZ/h34EB1CYoSihFkZPz8HDQ6qo06uPVhvgr53AI
X-Gm-Gg: ATEYQzyQkkLHxUpH16JcBUwa2cj/1UdCOCjbSqIb9yyjpO0ofeNA6Y2r/w9RSOHhaa6
	HxVb/nrCF2dm0lKYyONuWyX88fLRJu6sRq+kuGdikeFz0aDjU5wapYLfIATdPm6+cF/AKamcPaE
	Ws6H87t/RrLN4k86AeHpqrOpaDo+PJPJDhkuhVFEH5M5c8h4J77kEUSJvCQwwFnjC7QZkwAonUd
	vet6j7QkMcWVoZZCUe7aA/kggCuV43gjNsMXgIRG9LAWjvc9TY89/i61aufuZa1BOAsBMPCMjUQ
	CzGU2snRuHUQ9/gg6sbibWo4P+Y8rtWpvk+TA5gdjcW53XwPEE2JF5veIPXraI6Jg6xUZp1dsRi
	bWeJI7Ur/77SMS24lT/+EVVCIWaFCBO3ixcQfdQejNv/k+TtYAB5asZ1ytjwm8Uhqs34+9k315z
	1d9aQ+vQnViwn1cOFQJ5LEquNwFwRW8uBJFvc=
X-Received: by 2002:a05:620a:4609:b0:8cd:8a55:510d with SMTP id af79cd13be357-8cdb5b1b198mr785838285a.48.1773450568650;
        Fri, 13 Mar 2026 18:09:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:8cd:8a55:510d with SMTP id af79cd13be357-8cdb5b1b198mr785835385a.48.1773450568179;
        Fri, 13 Mar 2026 18:09:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:09 +0200
Subject: [PATCH v5 05/10] drm/msm/dp: Drop EV_USER_NOTIFICATION
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-5-0c8450737d64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vX+57P9cyOcJ2Ge82Wk30SNt2ZHf9zxIx/x8h+QULh8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLUz4IAmlxbS1UTnKvwkZ4YZHxl9HswZRItXb
 bBeZtxAb8qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1MwAKCRCLPIo+Aiko
 1TsmB/9cwJSdIlXYS4OWflFP0DNWpVn7iX4Ula8PJ9ALfCCocThDLOj4TvaYaLwUvCq5KXFwWwJ
 OhwGdUJQ1k0PyIJcZt5fNhXctUp4g0qDvxghT7mcQnZ7hGrgs5TB00zgE1l3xq96CcdujiX5j0z
 RJ54lDHtzpKfmujGOgjl7CBvgMOUqurCXl1YQHu+JxqDmB14WE73vOndqw5fNjU0ziIm8XV9qHX
 zR/nO9hsWQgeiTmVEzVUfSocnVUtsnxmaXSr44TqKKDF8yt01kZpcD7OgOYNlWmXBhiV+FHZtMe
 lhZ/r3pWTA4aMPdn91DzvEVrfwKqne1mhNZ1ai5nGxAnZSar
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: GQgeFc8Jo45uYbMIav0p9Ye6Miygi9EU
X-Proofpoint-GUID: GQgeFc8Jo45uYbMIav0p9Ye6Miygi9EU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfXxnVmt/hLBoxm
 Zi21D8Ify11Q1xpBExGSDru+JGRNM+BsxZlH/v5hUebfA7e1bVqFbmblmvaIdtL2ImB3rHG2AYs
 mOmzim/OB4v/pYiN1hdSk2a2OtjWYkta1523LMx5vWiwrBGcsnvG4ct+tAmIXchpgZggY5ZxBFD
 L5DkcMKE0+emMCXyEV+HsbtUcjE3SVyYENY3dV1ZUBTGWo3q6hGVKXKCkC11AxD+r5yPt70fXy2
 pIk0I/hhHCV2v9APXkXXAgZxF2S7DDHakADezlhK7jeWbDPiv+BwjnE3wBuqVg1tj3UvVNsIBQq
 rsesS5JLUEy3O+jp40AJE6nJTG/zAws7xfVR8buIDaIbrMWlSKKMCC1fTqqO8mXiSbnB8dGXy5D
 1a7aqNT4/HaGaLIMSPB/QG+5WrITXt5VoTxrN1L/4Bf2Vb0Sbc0OUNj+0fugzIfkRa2j5iFPVa3
 5/Cdx1ieGbX2nu9Y9NQ==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b4b549 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=gW5k9mFOS1cgrKxYKbgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97651-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: A003428B30E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jesszhan0024@gmail.com>

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e7b1ed5491c4..05c292e27126 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -343,17 +342,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -377,7 +365,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
@@ -437,7 +429,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -506,7 +498,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -527,7 +519,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1121,10 +1113,6 @@ static int hpd_event_thread(void *data)
 		case EV_IRQ_HPD_INT:
 			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
 			break;
-		case EV_USER_NOTIFICATION:
-			msm_dp_display_send_hpd_notification(msm_dp_priv,
-						todo->data);
-			break;
 		default:
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e4622c85fb66..f935093c4df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.47.3


