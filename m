Return-Path: <linux-arm-msm+bounces-97653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ms7GLm1tGm4sAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:11:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB6028B2AD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A286F30BB240
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E5D26F288;
	Sat, 14 Mar 2026 01:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiL3cgHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8fdDQMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14602BE63F
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450581; cv=none; b=QmZh/SiE0TLWKDQlMvnwS1cU4Lj6fG9fUYGuD1pyeNrov3GfJZC9ANNhRTl2Nu30Xal3tKnmgzV5rF65MNE+HHed6K1kHGhWh9M4XzvNF4u+RN40rJzTf3jo8il/e/nbenYm20CwPLe7WLSuVTFDzBTZ5vOKJEYL8L0OwqVTS/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450581; c=relaxed/simple;
	bh=MQAOAijklq47bZWGfTVyKOrZZ6srabmc20fUFvToOvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDue/Qt3m0UthZdPs7AEZ8+KYNeBmTYg829nxpIsdiLv59ZVjnjuXrMjZLbrgeKzwJCVnHMH+gCWQ/+UD6XMEIpH49BvGFM8B/MmuCf8opHkl4rSge/ZwKjLQyJx0GXAl35QeF9ebLREOFjdC0zIcD6qnke2xpE7RzmlbhmTJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiL3cgHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8fdDQMg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DIdmil1754290
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZZatLPKoHZzanwrWmtKdP3sVgEHlttWLJE2LgxI9t3U=; b=IiL3cgHG9IRFVAC7
	DmhSNjjrbd2kKdvAyATxAMg1Cpr1OoMF/VQozONIJXNgGlHyeG3tgfHjVkF5vXl+
	9hILNPg1J9r6CT3TKUltVNJUY0VIRW7iGv+9x5DN5o65kkYJPlqcHZxJytKv+QMq
	ttkmQGM5CT2xdvXhfB8IkMQcSfLTUlOO/PQcKjmMPvduORTGGOhG9oGq/rjFlN0V
	5r4a6zwV9yJXORgXjvtPlAVS83nGrTQ7/kAEL8vhhwF+Ex4Y4xqnxkFsupLBTSbu
	P3FS3vveMj0x4+5JdcaA3jiZ11LJnK1oQ/s/C1oB4GwX9xr2/mIOp9HcznlxGPpS
	wvIo2Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvr24rwmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f1c1e4d6so49564306d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450577; x=1774055377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZatLPKoHZzanwrWmtKdP3sVgEHlttWLJE2LgxI9t3U=;
        b=K8fdDQMguJmhWFYVHgnvOJLHEiiFtuSsy96xWRy56b8GXp2n+cxpABA6rtdYYpN41Q
         lLOg2kEm32xI+QFbBcqPPShVnxe6YDZDpy6vHI/x2+975VWLsQr9VffKTixYog0erTep
         g4j+kGoxhWeT+jIvfHbec0MLlo6x0DNHsYt7y37kUPtl3gtCe4m3xz7XGoYlQ0MvQsFj
         qIm/kScGm/+30kJVO+TURG3GZDwFSPbLIErg0i7S1rgzMWTGuQMVwLkfSh6cejk8eici
         uRDP2OsOzP62DqytHbtcReCpyQXIpezlfWRGW5epyj16wJLrBkOQvTy9VCUFnmtr3w4S
         Pi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450577; x=1774055377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZZatLPKoHZzanwrWmtKdP3sVgEHlttWLJE2LgxI9t3U=;
        b=AyAyqXdGOTq2KWSI0rLgG5tlcxY9wVSYWo3FkPmgKAQSaB7fEIaaptMXVCvVF40W3+
         +KVybE8IuMmazw5NP9BaakYYd7KBQkVf+aIDdIsyXF+cusrQoUKWe4TGorG1HWxmMxa4
         5PfBPbBtbdG7G9rKX/FOP2pj+RoSjozv0hxuf2Zq22mISoCuxJ2IdDsp3BW7Jw5k1MBP
         C6aV4t8i7HOUT8FxAOvShEcfNuwOY8E57KWIUSaHOpjJnj3kTeOodiBIRL3QFFCjJGU8
         ZXXuZcWbUuyM0d48wkTm+WhBKQ8SJzlU0yoJlD2g/hLvLJXvJq+hGNE04k/wL8lXQqSX
         dDkg==
X-Gm-Message-State: AOJu0YxPn8S7cWeMoDK9p9tMYaEPXNWqrZcHL0W4N8urZWbIHnYeCWex
	p7h5qbOF2uzNfGffuiIs2eMHPJsdtNJWyQVVuWxxOyjDGtEOBgchRkSup/JRQeROKz+Mq5Z+DCN
	Rlwgmybnt31aTD4egoYekPqtECHultQGpz5lo8GdSfyOCoy+Qo6+zEnEpNN5g1B9Nf/ck
X-Gm-Gg: ATEYQzwiJv0hhOQOuvSdDAqK6uACGaXnM89RjxUMpXCURQMQOC7KOa67pMx/hsFz1Fk
	bhGdqPW85bB9dwQrTk8ggbKfzBTI1yHMVAL7vLK7DlSHX/5wkcHvlyWXYn6aS7OTEeL0I8ey01w
	lc+/q53wrjmYz2KPODiGKaTTTxc8cDTBiQBTkTfDmTP9MtPCEXLzV+CFfqopVnW9vLVKSL1Y5k/
	Pvfys/lsWP2HoTZ4rT3tTNfgvWKq93DD6dqrYzmeuE2zS3JFruny0VTljRIalLCP5WWjpQxE7yT
	fODsZLPOZaQ1XUin46xgJuE8A4Y8sehOveFpxpicfMZ5nNorMRSvaWnybJS0LwCLB35jbwJ7u8n
	zSt+0w+5bSXMh/Fk3Mt9wR9ODq/vQYezYMtLvr+XIa9FLklxQS2rpZFo1yQn/9q/3E45IRUlobx
	JF0mt5hD2CoSvEgoxAZWaHRKaXVWS7wq4DMWQ=
X-Received: by 2002:a05:620a:46a5:b0:8c6:a539:55d4 with SMTP id af79cd13be357-8cdb5b5aed0mr784249985a.48.1773450576573;
        Fri, 13 Mar 2026 18:09:36 -0700 (PDT)
X-Received: by 2002:a05:620a:46a5:b0:8c6:a539:55d4 with SMTP id af79cd13be357-8cdb5b5aed0mr784247185a.48.1773450576006;
        Fri, 13 Mar 2026 18:09:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:11 +0200
Subject: [PATCH v5 07/10] drm/msm/dp: rework HPD handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-7-0c8450737d64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=32049;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nsafDlTUku1IO76CB4+MgqhDpKVOsXEJotRmXqknq88=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLUzln6hdZ18E2eX2X/bxW2TzPQQXgv4k/ws4
 gnGcOUUPIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1MwAKCRCLPIo+Aiko
 1RxWB/9x+cFRMOAozSX/mn82DlbWGocW2sMzPZD+wP07hR2AwHYRBwGQ9d+gPRDPUYRPfw0Q64B
 /nCUSiRveowS9smXhybBdwQ5I8ZvJyfmRBxbf45ZpSIsKXgZum4J6UaHRWuSFOfnZuG+Y3/0hbu
 Ipjeh9ITarqKlRtkgPwMJHa1FoAZytIvcrPJCYUtV970QgQCrIkXIDbIVnUxPjzRZLpd/0RXgJ6
 Z58kkKLGTjoiMcEpI4bQzuY8IdYsAUckf56xV3/I23ZZ3GLfz7WT7P6yaLxFdzEv0712ruQxs3K
 YH+AubwCQmAbjWOcDQ8DQ+Tp1r4eiF4hxV4p9S11PAH49DVY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX5Lo/GsMDO9pa
 Dnf3/e+1IdKSgwhZpyiNVwKDKgC7yFdvxTcAe+tCeuBlXIxwui/QJDA1YriqVuURX69rlHUPs8A
 pqEHrJZWQnYDsnRg066LerUjKVAEsKCcgipEP3HwqYwEpU69r62ak5HHwh9tL3T0rMu9VXGNTJn
 dyueI7Vd2oadmd55/ShCwLmkFoKp90XOz2k+OrFkQ2grn4NhW9C72kfFjGNTPZ4SmkJWIyRRp4D
 tFsUx9SE8tykd8fG3S2QIPNDbHVIhCPJdcqrOrgXNSYcwo2KC6m62jKvDiIsOlikk1gU14HgkXa
 K/rrE3wyUTM7FSu4XkRhGiotL1IB7ijgNCmUc3SjiSmssn6jkIGV8p+0V4QpV6aY74OUn5g6SKM
 f9mWCDmtakj3/M1j1g/fZzw497NGIc/5ZOkV66PacAfbEIy4GeTgKxkJFHAqndv8LttTYXS5JuJ
 oeorqlSuNYXCt6ksz9g==
X-Proofpoint-ORIG-GUID: Cn1CH73XXN6YtKw34dQWg3_qJxXRbPMt
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69b4b552 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=KKU_MhpSG83TwyDdul0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Cn1CH73XXN6YtKw34dQWg3_qJxXRbPMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-97653-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: BAB6028B2AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jesszhan0024@gmail.com>

Handling of the HPD events in the MSM DP driver is plagued with lots of
problems. It tries to work aside of the main DRM framework, handling the
HPD signals on its own. There are two separate paths, one for the HPD
signals coming from the DP HPD pin and another path for signals coming
from outside (e.g. from the Type-C AltMode). It lies about the connected
state, returning the link established state instead. It is not easy to
understand or modify it. Having a separate event machine doesn't add
extra clarity.

Drop the whole event machine. When the DP receives a HPD event, send it
to the DRM core. Then handle the events in the hpd_notify callback,
unifying paths for HPD signals.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 601 ++++++++----------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   1 -
 4 files changed, 134 insertions(+), 491 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ef298c7d3e5e..3bb08c9a020e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2593,28 +2593,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
-{
-	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-
-	phy_power_off(phy);
-
-	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-}
-
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 124b9b21bb7f..f68bee62713f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
-void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc4078c229cb..d61a8ddd30a8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -43,35 +43,6 @@ enum {
 	ISR_HPD_REPLUG_COUNT,
 };
 
-/* event thread connection state */
-enum {
-	ST_DISCONNECTED,
-	ST_MAINLINK_READY,
-	ST_CONNECTED,
-	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
-};
-
-enum {
-	EV_NO_EVENT,
-	/* hpd events */
-	EV_HPD_PLUG_INT,
-	EV_IRQ_HPD_INT,
-	EV_HPD_UNPLUG_INT,
-};
-
-#define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
-#define DP_EVENT_Q_MAX	8
-
-#define DP_TIMEOUT_NONE		0
-
-#define WAIT_FOR_RESUME_TIMEOUT_JIFFIES (HZ / 2)
-
-struct msm_dp_event {
-	u32 event_id;
-	u32 delay;
-};
-
 struct msm_dp_display_private {
 	int irq;
 
@@ -95,15 +66,9 @@ struct msm_dp_display_private {
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
-	/* event related only access by event thread */
-	struct mutex event_mutex;
-	wait_queue_head_t event_q;
-	u32 hpd_state;
-	u32 event_pndx;
-	u32 event_gndx;
-	struct task_struct *ev_tsk;
-	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
-	spinlock_t event_lock;
+	/* HPD IRQ handling */
+	spinlock_t irq_thread_lock;
+	u32 hpd_isr_status;
 
 	bool wide_bus_supported;
 
@@ -216,59 +181,6 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 	return container_of(dp, struct msm_dp_display_private, msm_dp_display);
 }
 
-static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-			    u32 delay)
-{
-	unsigned long flag;
-	struct msm_dp_event *todo;
-	int pndx;
-
-	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
-	pndx = msm_dp_priv->event_pndx + 1;
-	pndx %= DP_EVENT_Q_MAX;
-	if (pndx == msm_dp_priv->event_gndx) {
-		pr_err("event_q is full: pndx=%d gndx=%d\n",
-			msm_dp_priv->event_pndx, msm_dp_priv->event_gndx);
-		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-		return -EPERM;
-	}
-	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
-	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
-	todo->event_id = event;
-	todo->delay = delay;
-	wake_up(&msm_dp_priv->event_q);
-	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-
-	return 0;
-}
-
-static int msm_dp_del_event(struct msm_dp_display_private *msm_dp_priv, u32 event)
-{
-	unsigned long flag;
-	struct msm_dp_event *todo;
-	u32	gndx;
-
-	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
-	if (msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) {
-		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-		return -ENOENT;
-	}
-
-	gndx = msm_dp_priv->event_gndx;
-	while (msm_dp_priv->event_pndx != gndx) {
-		todo = &msm_dp_priv->event_list[gndx];
-		if (todo->event_id == event) {
-			todo->event_id = EV_NO_EVENT;	/* deleted */
-			todo->delay = 0;
-		}
-		gndx++;
-		gndx %= DP_EVENT_Q_MAX;
-	}
-	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-
-	return 0;
-}
-
 void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display)
 {
 	struct msm_dp_display_private *dp;
@@ -287,8 +199,6 @@ void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display)
 	complete_all(&dp->audio_comp);
 }
 
-static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv);
-
 static int msm_dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -308,12 +218,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-	rc = msm_dp_hpd_event_thread_start(dp);
-	if (rc) {
-		DRM_ERROR("Event thread create failed\n");
-		goto end;
-	}
-
 	return 0;
 end:
 	return rc;
@@ -325,8 +229,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
-	kthread_stop(dp->ev_tsk);
-
 	of_dp_aux_depopulate_bus(dp->aux);
 
 	msm_dp_aux_unregister(dp->aux);
@@ -340,38 +242,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
-					    bool hpd)
-{
-	if ((hpd && dp->msm_dp_display.link_ready) ||
-			(!hpd && !dp->msm_dp_display.link_ready)) {
-		drm_dbg_dp(dp->drm_dev, "HPD already %s\n", str_on_off(hpd));
-		return 0;
-	}
-
-	/* reset video pattern flag on disconnect */
-	if (!hpd) {
-		dp->panel->video_test = false;
-		if (!dp->msm_dp_display.is_edp)
-			drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
-							 connector_status_disconnected,
-							 dp->panel->dpcd,
-							 dp->panel->downstream_ports);
-	}
-
-	dp->msm_dp_display.link_ready = hpd;
-
-	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
-			dp->msm_dp_display.connector_type, hpd);
-
-	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-			      hpd ?
-			      connector_status_connected :
-			      connector_status_disconnected);
-
-	return 0;
-}
-
 static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
 	int rc, lttpr_count;
@@ -414,6 +284,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	dp->msm_dp_display.link_ready = true;
+
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
@@ -427,8 +299,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_display_send_hpd_notification(dp, true);
-
 end:
 	return rc;
 }
@@ -483,24 +353,6 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 	dp->core_initialized = false;
 }
 
-static int msm_dp_display_usbpd_configure_cb(struct device *dev)
-{
-	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
-
-	msm_dp_display_host_phy_init(dp);
-
-	return msm_dp_display_process_hpd_high(dp);
-}
-
-static int msm_dp_display_notify_disconnect(struct device *dev)
-{
-	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
-
-	msm_dp_display_send_hpd_notification(dp, false);
-
-	return 0;
-}
-
 static void msm_dp_display_handle_video_request(struct msm_dp_display_private *dp)
 {
 	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN) {
@@ -509,34 +361,12 @@ static void msm_dp_display_handle_video_request(struct msm_dp_display_private *d
 	}
 }
 
-static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_private *dp)
-{
-	int rc = 0;
-
-	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
-		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->hpd_state != ST_DISCONNECTED) {
-			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_display_send_hpd_notification(dp, false);
-		}
-	} else {
-		if (dp->hpd_state == ST_DISCONNECTED) {
-			dp->hpd_state = ST_MAINLINK_READY;
-			rc = msm_dp_display_process_hpd_high(dp);
-			if (rc)
-				dp->hpd_state = ST_DISCONNECTED;
-		}
-	}
-
-	return rc;
-}
-
 static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 {
 	u32 sink_request = dp->link->sink_request;
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
-	if (dp->hpd_state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.link_ready) {
 		if (sink_request & DP_LINK_STATUS_UPDATED) {
 			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
 							sink_request);
@@ -553,76 +383,36 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-static int msm_dp_display_usbpd_attention_cb(struct device *dev)
-{
-	int rc = 0;
-	u32 sink_request;
-	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
-
-	/* check for any test request issued by sink */
-	rc = msm_dp_link_process_request(dp->link);
-	if (!rc) {
-		sink_request = dp->link->sink_request;
-		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
-					dp->hpd_state, sink_request);
-		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = msm_dp_display_handle_port_status_changed(dp);
-		else
-			rc = msm_dp_display_handle_irq_hpd(dp);
-	}
-
-	return rc;
-}
-
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
-	u32 state;
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	msm_dp_aux_enable_xfers(dp->aux, true);
-
-	mutex_lock(&dp->event_mutex);
-
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
-
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
-	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	if (state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
-		mutex_unlock(&dp->event_mutex);
+	if (dp->msm_dp_display.link_ready)
 		return 0;
-	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		mutex_unlock(&dp->event_mutex);
 		return ret;
 	}
 
-	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
+	msm_dp_aux_enable_xfers(dp->aux, true);
+
+	msm_dp_display_host_phy_init(dp);
+
+	ret = msm_dp_display_process_hpd_high(dp);
 	if (ret) {	/* link train failed */
-		dp->hpd_state = ST_DISCONNECTED;
+		dp->msm_dp_display.link_ready = false;
+		msm_dp_aux_enable_xfers(dp->aux, false);
 		pm_runtime_put_sync(&pdev->dev);
-	} else {
-		dp->hpd_state = ST_MAINLINK_READY;
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
-	mutex_unlock(&dp->event_mutex);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -644,97 +434,69 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
-	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	msm_dp_aux_enable_xfers(dp->aux, false);
-
-	mutex_lock(&dp->event_mutex);
-
-	state = dp->hpd_state;
+	dp->panel->video_test = false;
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	/* unplugged, no more irq_hpd handle */
-	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	if (state == ST_DISCONNECTED) {
-		/* triggered by irq_hdp with sink_count = 0 */
-		if (dp->link->sink_count == 0) {
-			msm_dp_display_host_phy_exit(dp);
-		}
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		mutex_unlock(&dp->event_mutex);
+	if (!dp->msm_dp_display.link_ready)
 		return 0;
-	} else if (state == ST_DISCONNECT_PENDING) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	} else if (state == ST_MAINLINK_READY) {
-		msm_dp_ctrl_off_link(dp->ctrl);
+
+	/* triggered by irq_hdp with sink_count = 0 */
+	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
-		dp->hpd_state = ST_DISCONNECTED;
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		pm_runtime_put_sync(&pdev->dev);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
 
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
+	if (!dp->msm_dp_display.is_edp)
+		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
+						 connector_status_disconnected,
+						 dp->panel->dpcd,
+						 dp->panel->downstream_ports);
 
-	if (state == ST_DISPLAY_OFF) {
-		dp->hpd_state = ST_DISCONNECTED;
-	} else {
-		dp->hpd_state = ST_DISCONNECT_PENDING;
-	}
+	dp->msm_dp_display.link_ready = false;
 
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
-	mutex_unlock(&dp->event_mutex);
 	return 0;
 }
 
 static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
-	u32 state;
-
-	mutex_lock(&dp->event_mutex);
+	u32 sink_request;
+	int rc = 0;
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
-	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
+	/* check for any test request issued by sink */
+	rc = msm_dp_link_process_request(dp->link);
+	if (!rc) {
+		sink_request = dp->link->sink_request;
+		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
+		if (sink_request & DS_PORT_STATUS_CHANGED)
+			rc = msm_dp_display_process_hpd_high(dp);
+		else
+			rc = msm_dp_display_handle_irq_hpd(dp);
 	}
 
-	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
-
-	mutex_unlock(&dp->event_mutex);
-
-	return 0;
+	return rc;
 }
 
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
@@ -1010,12 +772,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * power_on status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	mutex_lock(&msm_dp_display->event_mutex);
-
-	if (!dp->power_on) {
-		mutex_unlock(&msm_dp_display->event_mutex);
+	if (!dp->power_on)
 		return;
-	}
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
 				    msm_dp_display->ahb_base, "dp_ahb");
@@ -1025,8 +783,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->link_base, "dp_link");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
 				    msm_dp_display->p0_base, "dp_p0");
-
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
@@ -1042,95 +798,6 @@ void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
 	msm_dp_ctrl_set_psr(dp->ctrl, enter);
 }
 
-static int hpd_event_thread(void *data)
-{
-	struct msm_dp_display_private *msm_dp_priv;
-	unsigned long flag;
-	struct msm_dp_event *todo;
-	int timeout_mode = 0;
-
-	msm_dp_priv = (struct msm_dp_display_private *)data;
-
-	while (1) {
-		if (timeout_mode) {
-			wait_event_timeout(msm_dp_priv->event_q,
-				(msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) ||
-					kthread_should_stop(), EVENT_TIMEOUT);
-		} else {
-			wait_event_interruptible(msm_dp_priv->event_q,
-				(msm_dp_priv->event_pndx != msm_dp_priv->event_gndx) ||
-					kthread_should_stop());
-		}
-
-		if (kthread_should_stop())
-			break;
-
-		spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
-		todo = &msm_dp_priv->event_list[msm_dp_priv->event_gndx];
-		if (todo->delay) {
-			struct msm_dp_event *todo_next;
-
-			msm_dp_priv->event_gndx++;
-			msm_dp_priv->event_gndx %= DP_EVENT_Q_MAX;
-
-			/* re enter delay event into q */
-			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
-			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
-			todo_next->event_id = todo->event_id;
-			todo_next->delay = todo->delay - 1;
-
-			/* clean up older event */
-			todo->event_id = EV_NO_EVENT;
-			todo->delay = 0;
-
-			/* switch to timeout mode */
-			timeout_mode = 1;
-			spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-			continue;
-		}
-
-		/* timeout with no events in q */
-		if (msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) {
-			spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-			continue;
-		}
-
-		msm_dp_priv->event_gndx++;
-		msm_dp_priv->event_gndx %= DP_EVENT_Q_MAX;
-		timeout_mode = 0;
-		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
-
-		switch (todo->event_id) {
-		case EV_HPD_PLUG_INT:
-			msm_dp_hpd_plug_handle(msm_dp_priv);
-			break;
-		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv);
-			break;
-		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv);
-			break;
-		default:
-			break;
-		}
-	}
-
-	return 0;
-}
-
-static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv)
-{
-	/* set event q to empty */
-	msm_dp_priv->event_gndx = 0;
-	msm_dp_priv->event_pndx = 0;
-
-	msm_dp_priv->ev_tsk = kthread_run(hpd_event_thread, msm_dp_priv, "dp_hpd_handler");
-	if (IS_ERR(msm_dp_priv->ev_tsk))
-		return PTR_ERR(msm_dp_priv->ev_tsk);
-
-	return 0;
-}
-
 /**
  * msm_dp_bridge_detect - callback to determine if connector is connected
  * @bridge: Pointer to drm bridge structure
@@ -1155,26 +822,31 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	if (!dp->link_ready)
 		return status;
 
-	msm_dp_aux_enable_xfers(priv->aux, true);
-
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		msm_dp_aux_enable_xfers(priv->aux, false);
 		return status;
 	}
 
+	msm_dp_aux_enable_xfers(priv->aux, true);
+
 	ret = msm_dp_aux_is_link_connected(priv->aux);
-	if (dp->internal_hpd && !ret)
+	if (!ret) {
+		DRM_DEBUG_DP("aux not connected\n");
 		goto end;
+	}
 
 	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
-	if (ret)
+	if (ret) {
+		DRM_DEBUG_DP("failed to read caps\n");
 		goto end;
+	}
 
 	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
-	if (ret)
+	if (ret) {
+		DRM_DEBUG_DP("failed to read desc\n");
 		goto end;
+	}
 
 	status = connector_status_connected;
 	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
@@ -1194,36 +866,20 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
-	irqreturn_t ret = IRQ_NONE;
 	u32 hpd_isr_status;
-
-	if (!dp) {
-		DRM_ERROR("invalid data\n");
-		return IRQ_NONE;
-	}
+	unsigned long flags;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
 
 	if (hpd_isr_status & 0x0F) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
 			dp->msm_dp_display.connector_type, hpd_isr_status);
-		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
-
-		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
-		}
 
-		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
-		}
-
-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
-
-		ret = IRQ_HANDLED;
+		spin_lock_irqsave(&dp->irq_thread_lock, flags);
+		dp->hpd_isr_status |= hpd_isr_status;
+		ret = IRQ_WAKE_THREAD;
+		spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
 	}
 
 	/* DP controller isr */
@@ -1232,6 +888,36 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
+{
+	struct msm_dp_display_private *dp = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
+	u32 hpd_isr_status;
+
+	spin_lock_irqsave(&dp->irq_thread_lock, flags);
+	hpd_isr_status = dp->hpd_isr_status;
+	dp->hpd_isr_status = 0;
+	spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
+
+	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+				      connector_status_disconnected);
+
+	if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+				      connector_status_connected);
+
+	/* Send HPD as connected and distinguish it in the notifier */
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+				      connector_status_connected);
+
+	ret = IRQ_HANDLED;
+
+	return ret;
+}
+
 static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
@@ -1243,9 +929,13 @@ static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
 		return dp->irq;
 	}
 
-	rc = devm_request_irq(&pdev->dev, dp->irq, msm_dp_display_irq_handler,
-			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
-			      "dp_display_isr", dp);
+	spin_lock_init(&dp->irq_thread_lock);
+	irq_set_status_flags(dp->irq, IRQ_NOAUTOEN);
+	rc = devm_request_threaded_irq(&pdev->dev, dp->irq,
+				       msm_dp_display_irq_handler,
+				       msm_dp_display_irq_thread,
+				       IRQ_TYPE_LEVEL_HIGH,
+				       "dp_display_isr", dp);
 
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
@@ -1425,6 +1115,7 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
+	dp->hpd_isr_status = 0;
 
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
@@ -1436,11 +1127,6 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	/* setup event q */
-	mutex_init(&dp->event_mutex);
-	init_waitqueue_head(&dp->event_q);
-	spin_lock_init(&dp->event_lock);
-
 	/* Store DP audio handle inside DP display */
 	dp->msm_dp_display.msm_dp_audio = dp->audio;
 
@@ -1636,7 +1322,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
-	u32 hpd_state;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1648,29 +1333,21 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display);
 
-	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
-		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
-		mutex_unlock(&msm_dp_display->event_mutex);
+	if (msm_dp_display->link->sink_count == 0)
 		return;
-	}
 
 	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
-		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	hpd_state =  msm_dp_display->hpd_state;
-
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (dp->link_ready && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1688,11 +1365,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		msm_dp_display_disable(msm_dp_display);
 	}
 
-	/* completed connection */
-	msm_dp_display->hpd_state = ST_CONNECTED;
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -1712,7 +1385,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	u32 hpd_state;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1720,27 +1392,14 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display);
 
-	mutex_lock(&msm_dp_display->event_mutex);
-
-	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISCONNECT_PENDING && hpd_state != ST_CONNECTED)
-		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
-			   dp->connector_type, hpd_state);
+	if (!dp->link_ready)
+		drm_dbg_dp(dp->drm_dev, "type=%d is disconnected\n", dp->connector_type);
 
 	msm_dp_display_disable(msm_dp_display);
 
-	hpd_state =  msm_dp_display->hpd_state;
-	if (hpd_state == ST_DISCONNECT_PENDING) {
-		/* completed disconnection */
-		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
-	}
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	pm_runtime_put_sync(&dp->pdev->dev);
-	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
 void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
@@ -1796,18 +1455,13 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 	 * step-4: DP PHY is initialized at plugin handler before link training
 	 *
 	 */
-	mutex_lock(&dp->event_mutex);
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to resume power\n");
-		mutex_unlock(&dp->event_mutex);
 		return;
 	}
 
 	msm_dp_aux_hpd_enable(dp->aux);
 	msm_dp_aux_hpd_intr_enable(dp->aux);
-
-	msm_dp_display->internal_hpd = true;
-	mutex_unlock(&dp->event_mutex);
 }
 
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
@@ -1816,15 +1470,10 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	mutex_lock(&dp->event_mutex);
-
 	msm_dp_aux_hpd_intr_disable(dp->aux);
 	msm_dp_aux_hpd_disable(dp->aux);
 
-	msm_dp_display->internal_hpd = false;
-
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
-	mutex_unlock(&dp->event_mutex);
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
@@ -1834,13 +1483,31 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	u32 hpd_link_status = 0;
 
-	/* Without next_bridge interrupts are handled by the DP core directly */
-	if (msm_dp_display->internal_hpd)
+	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
 		return;
+	}
+
+	hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
 
-	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
-	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
+	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, link_ready=%d, status=%d\n",
+		   msm_dp_display->connector_type, hpd_link_status,
+		   msm_dp_display->link_ready, status);
+
+	if (status == connector_status_connected) {
+		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+			msm_dp_hpd_unplug_handle(dp);
+			msm_dp_hpd_plug_handle(dp);
+		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
+			msm_dp_irq_hpd_handle(dp);
+		} else {
+			msm_dp_hpd_plug_handle(dp);
+		}
+	} else {
+		msm_dp_hpd_unplug_handle(dp);
+	}
+
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 60094061c102..d2d3d61eb0b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -22,7 +22,6 @@ struct msm_dp {
 	bool power_on;
 	unsigned int connector_type;
 	bool is_edp;
-	bool internal_hpd;
 
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;

-- 
2.47.3


