Return-Path: <linux-arm-msm+bounces-94509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GdOGo7koWm+wwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:38:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D11BC181
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A5BF3111ADE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0051338F241;
	Fri, 27 Feb 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsV/3gYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOUdl+DI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA49395D96
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217419; cv=none; b=CHTxG7MU8G/9ni3vc55yHpYACpY9BhssWfhw8YGcFocM/3GK7NA7MG1YRct6bRGuXRJ89eRZqOeS8NZznVMr1kTQPUTVR0QWRgmWDm2RirVvleGcfEDkVqIKU/NPb9Wi9/whMNQLgxbDibtDDtJp648lA9X96gNXAggZpAs9SPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217419; c=relaxed/simple;
	bh=jtx4caMdNiI5fTAT/34EoDSgo/ae6naKuxWgagrfJEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qG6YI5RiYvQEWe9kCO/C1JouZ4aOuJQJxmFPEUeCZ4dJuv5QRFUGYwGASIYSYnLhFat7VUAE+BdgLr5Yzi+UqPdLKieOzxB0IksFyzOP0EWtpWBGAYUpsB53Q1Jv5v7lNdJPBeBHnvMuEoFc0t5VT9hriax9bzaRJue8lqkI7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsV/3gYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOUdl+DI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0IgE702185
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IE3O8RcZ2cyQt1CqaPozoDzewVBG1KDsBmyvR+tfIo=; b=OsV/3gYrV1l14RTJ
	PMq1/L11GC9Cs4GYEIHiIDY2FT0nZth8fvgSwhx9jOnVnCymrK49842cRzjWBns8
	Ml2pATas6s0cbD1+fmMZEEOIa0+bU9ksqv/MPCQFawM5/1RynjJ6R6IWNZgeurNU
	Y9HZdvgwaT4Q62oNdpKOj0DQpFJ5cu3yrTFLmjlHgj9Ry8UYBZUIyT67WBY2127R
	do9Kf8IKSqHyMVPakMEDtRd6g51jmEwU7tgUzGKqtyeJq9mgvAy233MNli60xjqX
	5tZRITz0CS0ajXjI7dsbryBJ474VxVQE/reExep1jhnI6itQP2TW8z6uGkFw4v7H
	6fzmWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x89rc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ad1b81aso2762318585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772217416; x=1772822216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IE3O8RcZ2cyQt1CqaPozoDzewVBG1KDsBmyvR+tfIo=;
        b=LOUdl+DIRxZzWJVgrx0VWjxrVMAkJ4Y+mwUE5Cig/JQxpRhehtw8iN55v0hUBALCi0
         ksAj+8Pd69Hb8t5ujSLhaAFXUtjxqQX9LwyQGMXmrCF7E0kLl/bQ0M6oVIK5cuyld/pd
         ida/KmJZsx06GCq/2D1o5JhXiufZjeKGo6hr+wEGh2LplqUP1sktAK0LRDOVUKXWTE+0
         bwKOuu1xpaikZWkOK4+cxO0vbdTAdHhiR8a14fACK3sZKQwgdu5RwuyJ9tT8GuB7otGT
         XizB6ZvQ1IBlOoLbPsIfIaUFUEhae4UzEikpRCwnMTVxf64ctm7Qqfc1UX7Y6vBoMRH0
         h6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217416; x=1772822216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4IE3O8RcZ2cyQt1CqaPozoDzewVBG1KDsBmyvR+tfIo=;
        b=Isdy8yq5/FQ5sNp6qIJ2hEoHgjvrV4Az3MjJSWyTyPlypl1k85QUEaUkCDCtY876ay
         ArRXIsmCGIiEd08a/O5DHqQZ1fzM5vwvMenea/zKkBRCLQ5Hqy5MvoIPnjkfGMB2ShqM
         noVL/tQmjx9a5i4CiP3JQx8YqEsHw15wT7poINUaaxI/8pHM+Nn45kj/zAu9q6HUODB6
         Vjfe7KriRCaCDaL10//0DTjhbkmQdjhbEZ9mMPMZLNKg3rwMl/84ZOHENk7TYi+b9Of8
         lW8GeWUMClWvO3Fm7/vTYRd9yf8kqFy9eRQ8WfV4GkYCElkkOkCnzHrIFpFPbq0pvbCN
         6ISA==
X-Gm-Message-State: AOJu0YwSmB/j3+XnuBSH0qP6YyPKXZhOZkJ2XB6NiUcDNc+LAB7kx752
	fOuX0JgoVVmdJt+S+N2bWRndeZHnZkO6k+2mbv1syfkkvnw0jrwtMfCjkcHvBGVfL3GkyTMrBQF
	gEiI1jFNMgxirDspImsIvZGJ3THgpcLFEwlu5Z6hPEJZbnCOmXdUBnpCLt7/5Um8chdHs
X-Gm-Gg: ATEYQzyHtT1tQH9bW+UKhwl5QUZ8DQLFOk2xb0iSg7akAxPl9MOyCU7qJGvuIqa0cu3
	d2HqhmLNt9RIs9Dstrz2/5Jx8ua3veYcYHuHMPb5ZlsrIrIRlNXKNAfumX5DeZVmEatMTbDzwB2
	ObX3fm55ufIhM7OXQyOThMakB5pZOxbYxbS76uksbgZRCuOVjAkKj4zZANICDMpJx15yzc0EBcs
	A6dec2+xWz+5odZxc5Z5eWRm0wJDpGwJgJY6rJP7ptOTlqyWQjFWo5M564JwsHBK+z10AIjnsiW
	nQj7M5Fq4uuIx4YDGUDFecyU6Y63stmyiJ0yMX3rfjE1xcFNoz5PEQIwV/2eUi1OtLIedH+Aivp
	feIKFrIc77ecGG6dYL2Jmft/oSa+wLecgREpXn65hnwzabPa/nOivFleV5fX1QOWfp1zquij433
	gx5VEs0azUlZBX4inBn8gvLc2RTS0R5WLzu6U=
X-Received: by 2002:a05:620a:171e:b0:8cb:72b2:2a03 with SMTP id af79cd13be357-8cbc8dc4137mr459911185a.4.1772217416315;
        Fri, 27 Feb 2026 10:36:56 -0800 (PST)
X-Received: by 2002:a05:620a:171e:b0:8cb:72b2:2a03 with SMTP id af79cd13be357-8cbc8dc4137mr459907685a.4.1772217415832;
        Fri, 27 Feb 2026 10:36:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:36:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:42 +0200
Subject: [PATCH 3/7] drm/msm/dpu: replace VBIF-related array with bare
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-3-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6597;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jtx4caMdNiI5fTAT/34EoDSgo/ae6naKuxWgagrfJEU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ9jPaVwM4aQnIOKc+/if5zv2gfEuub3Q6A9
 SHtG2AtIlSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPQAKCRCLPIo+Aiko
 1TmdB/4iQUwctUc7kIs57oUEj9FLfoOw4gu6LX8KYAZASl7LqPJGQ2f17dtLJalrY5/20jiXtlS
 oK3svF5J9MJdskMbCk6IblkycJC3gPt4CF3nJS62u2uXBkDUNvS/MG9NtDL5PInb/barPt0D8iL
 /8kLInLsInhKJA93/+m/6CT21NHrpG2HL1ReswAGkwtLgnecuPaEUgrys7ZCaZuA/DCQ37rqVgv
 Vt7VVdapdxVFF/iRPsB0W8gKk2rOCeEIX66pmq57fZGRIDSRdIhtlSYhbs/bZ8oONUQz7u66O96
 iWNDUbx1yNHOS07FJdSAG/8V74/pFZzrgHVQDfdHARw9SwJr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a1e449 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZDNR4LwpRtkDERcRuL4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX52z3PjpZTYb3
 cW2YlGYfGW7Rh8XuefsouYGLAcCWEeBXWbx5JzBpe/O0IvaaY2gtm0fR4P28oYfJytctvIubY8w
 JBU8mLL2Dbt1s4M9aSU43ckoc6omIs+Azsm98ZVnp0+/NKN4JMz85oMzV2yRDJDvK3g/5aCstFY
 DN4KC6/5+RYs+eO/xKXbrTfq5Vj0bC//Ypja+uPt7Z1CrvmBsx10IHIuYJOi2Niysy9uk5l0+dU
 3m03pbS26rmmvPaCkiXy/TiLGyeFv9cKS7cZtpcXIWi+8rpfPCXTrYaVzeptP+2VschLya0WCrc
 ycmNfb8uyp5UN86x/F3kzefWlvASAJHOSSxsdIiuNshfHVVciGNJMly/slc8rXPX5jmw438qMx8
 xRo0gT4jDl4bEqJ2JuXg4PmShWRgMnS1slF9yeiIPhcbadafavJ0agoucFbBSS/fCdI/MvUcLGc
 5ZExyxmJof95frS9Rqg==
X-Proofpoint-ORIG-GUID: c2_4_5ZHZPQXNg5yN8QxZChfd-pf5kco
X-Proofpoint-GUID: c2_4_5ZHZPQXNg5yN8QxZChfd-pf5kco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94509-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D00D11BC181
X-Rspamd-Action: no action

As we no longer have multiple VBIF instances, it doesn't make sense to
keep VBIF data as arrays. Drop the extra wrapping and keep only a single
instance of each of the structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 28 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    | 45 ++++++++++-------------------
 4 files changed, 29 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index f3cb827034cc..a169628eb512 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -286,7 +286,6 @@ enum dpu_wd_timer {
 
 enum dpu_vbif {
 	VBIF_RT,
-	VBIF_MAX,
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5f0960368db3..416dd4c2464d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -886,16 +886,12 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
-	int i;
-
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */
 	_dpu_kms_mmu_destroy(dpu_kms);
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		dpu_kms->hw_vbif[i] = NULL;
-	}
+	dpu_kms->hw_vbif = NULL;
 
 	dpu_kms_global_obj_fini(dpu_kms);
 
@@ -1220,14 +1216,14 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	struct dpu_hw_vbif *hw;
 	const struct dpu_vbif_cfg *vbif = dpu_kms->catalog->vbif;
 
-	hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif[vbif->id]);
+	hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif);
 	if (IS_ERR(hw)) {
 		rc = PTR_ERR(hw);
 		DPU_ERROR("failed to init vbif: %d\n", rc);
 		goto err_pm_put;
 	}
 
-	dpu_kms->hw_vbif[vbif->id] = hw;
+	dpu_kms->hw_vbif = hw;
 
 	/* TODO: use the same max_freq as in dpu_kms_hw_init */
 	max_core_clk_rate = dpu_kms_get_clk_rate(dpu_kms, "core");
@@ -1343,13 +1339,11 @@ static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 	}
 	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
-						  dpu_kms->pdev,
-						  "vbif_phys");
-	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
-		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+	dpu_kms->vbif = msm_ioremap_mdss(mdss_dev, dpu_kms->pdev, "vbif_phys");
+	if (IS_ERR(dpu_kms->vbif)) {
+		ret = PTR_ERR(dpu_kms->vbif);
 		DPU_ERROR("vbif register memory map failed: %d\n", ret);
-		dpu_kms->vbif[VBIF_RT] = NULL;
+		dpu_kms->vbif = NULL;
 		return ret;
 	}
 
@@ -1370,11 +1364,11 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 	}
 	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
-	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
-		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+	dpu_kms->vbif = msm_ioremap(pdev, "vbif");
+	if (IS_ERR(dpu_kms->vbif)) {
+		ret = PTR_ERR(dpu_kms->vbif);
 		DPU_ERROR("vbif register memory map failed: %d\n", ret);
-		dpu_kms->vbif[VBIF_RT] = NULL;
+		dpu_kms->vbif = NULL;
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 993cf512f8c5..bb3393bd102e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -63,7 +63,7 @@ struct dpu_kms {
 	const struct qcom_ubwc_cfg_data *mdss;
 
 	/* io/register spaces: */
-	void __iomem *mmio, *vbif[VBIF_MAX];
+	void __iomem *mmio, *vbif;
 
 	struct regulator *vdd;
 	struct regulator *mmagic;
@@ -81,7 +81,7 @@ struct dpu_kms {
 
 	struct dpu_rm rm;
 
-	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
+	struct dpu_hw_vbif *hw_vbif;
 	struct dpu_hw_mdp *hw_mdp;
 
 	bool has_danger_ctrl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 6ebd9627514b..a4c5ca13179b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -11,14 +11,6 @@
 #include "dpu_hw_vbif.h"
 #include "dpu_trace.h"
 
-static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif vbif_idx)
-{
-	if (vbif_idx < ARRAY_SIZE(dpu_kms->hw_vbif))
-		return dpu_kms->hw_vbif[vbif_idx];
-
-	return NULL;
-}
-
 static const char *dpu_vbif_name(enum dpu_vbif idx)
 {
 	switch (idx) {
@@ -170,7 +162,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	u32 ot_lim;
 	int ret;
 
-	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
+	vbif = dpu_kms->hw_vbif;
 	if (!vbif) {
 		DRM_DEBUG_ATOMIC("invalid arguments vbif %d\n", vbif != NULL);
 		return;
@@ -219,7 +211,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
+	vbif = dpu_kms->hw_vbif;
 
 	if (!vbif || !vbif->cap) {
 		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
@@ -255,16 +247,14 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 {
 	struct dpu_hw_vbif *vbif;
-	u32 i, pnd, src;
-
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		vbif = dpu_kms->hw_vbif[i];
-		if (vbif && vbif->ops.clear_errors) {
-			vbif->ops.clear_errors(vbif, &pnd, &src);
-			if (pnd || src) {
-				DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
-					      dpu_vbif_name(vbif->idx), pnd, src);
-			}
+	u32 pnd, src;
+
+	vbif = dpu_kms->hw_vbif;
+	if (vbif && vbif->ops.clear_errors) {
+		vbif->ops.clear_errors(vbif, &pnd, &src);
+		if (pnd || src) {
+			DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
+				      dpu_vbif_name(vbif->idx), pnd, src);
 		}
 	}
 }
@@ -276,15 +266,12 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms)
 {
 	struct dpu_hw_vbif *vbif;
-	int i, j;
-
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		vbif = dpu_kms->hw_vbif[i];
-		if (vbif && vbif->cap && vbif->ops.set_mem_type) {
-			for (j = 0; j < vbif->cap->memtype_count; j++)
-				vbif->ops.set_mem_type(
-						vbif, j, vbif->cap->memtype[j]);
-		}
+	int j;
+
+	vbif = dpu_kms->hw_vbif;
+	if (vbif && vbif->cap && vbif->ops.set_mem_type) {
+		for (j = 0; j < vbif->cap->memtype_count; j++)
+			vbif->ops.set_mem_type(vbif, j, vbif->cap->memtype[j]);
 	}
 }
 

-- 
2.47.3


