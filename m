Return-Path: <linux-arm-msm+bounces-97652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPB0FHS2tGm4sAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:14:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A94FB28B316
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6872317A1E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FBC2D46B2;
	Sat, 14 Mar 2026 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIAneFIH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfZKf1ok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EE82DCBFC
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450575; cv=none; b=dTdMBnnCT/CIVv9ing75T17J4FB8MRt2roWL6j7aQq7YUGm1NAO8RdPQ+/ggkl+qgV88C8UaOerPdvnwiWCsXEKQ5xOALe6uuzyCNWZFBubHr9VImTul9G3a3Mf46eYDW4cumo+5HRilUNx7NIMjZoE47LKZPCZrhzYMZ3ugy0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450575; c=relaxed/simple;
	bh=uXjrwf6kVU4yfPAvO2dRImodIsQs6Els2Ljkho09jGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PcgoOGDxylpmI207SwXp+3QjVs2GmZ4pGzc6qfpbggsCxPEU/mi0wMtJUvhA99qEnw64MtR/k+10nuK/xVj40f5tPdl8QcJD/jjIBHPIhNLWYA5VGn+XwD9GkSZibGFBa8vX8TZEGGWKbKs7d7+rA/35ZiCx27KWXDtdTKYYNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIAneFIH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfZKf1ok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DHMntK1498952
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=; b=SIAneFIHYzYtdSvw
	i9c457l72+BFGZ/KasS3k2GREWqF6viYExSWOfuXX8gmy6qwS6Io5Pods97BxbJu
	nckolsBAE7yW+SOf0f+WKlKS3jCDyCKXUsWC6unEc+fVbB1W5z1nRFexUiFyE6xv
	XNdMPsfgPDrjCvUy/oHi26aKwInwIWXvf3xDy0eIfmpbAUM8r9Lng938kNTViaAY
	R9b1cWohv1UUFGfagfM82n4REkqPv51u/Jro5UVnMg72EYPlnkPCkSdblqvD1GBA
	YAALyr0aowIdAqfiJaKbdoIPeO2jbJTkZV8UmW2Q/YOt08j4wYFNnCYMtOEQFIPy
	iTBHow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hjsu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd858e8709so2784135785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450572; x=1774055372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=;
        b=jfZKf1okRF2BLVPXPAAuI+j5QH/KoS/LWQM5OmjvyPBCfPp2vRESpXNbgF8qdut6XL
         EEFlkwthkerJ5oPBXl+hlKsz2KmeAu61S986g2Tla8z/amyEAJjUC/UZDkAIqCq8m5Ms
         g0c2SI9ANC3B7gRyGbe2ah7q9jylXnJNzCclI5/mjUbYYVHsIpuBe+odzzUZDE9T+aqe
         Sm4q2YOiDiDsxffp7Vx/YXG7O5p+J1lIphiK+mYpK+COTU6UEZ4R7bIhdPUNgNkWf06M
         JIs50LIqrGYyBdDfsCsnUonoiBSRu/pDna2ntRXV/vpg1eQnQGJqz0hrxvLkLYwRQaWR
         JNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450572; x=1774055372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=;
        b=D6Rywm2AjLsruB13h3Fxvigd8YeFKgvUmVpDe9ABdnTMDqw2QVvgM5nSx48Fjx/TiG
         pM1gCSLZnbPUJbEdpnZAalSgr7oJbByH1WAsU3a092b8v3QsFmLS/KrY5BmEvlrAN1NQ
         ELcbzKDhD31YXcOke9vXK44zTiMDNrS0Z2hqywSHkGmrUaWBabS2Z8rrxU/p2Bjjw+bS
         grsR/IqmEIr+C0QTZY2Y9B8PxqO+Lw0GpTOwi6G58PR1FqeEpmRnNSZcdUrs5DL3CJzo
         P/kTroNvYaTITMUY3bWKK3wr4Kb7eDVT+eH4azhkHBG786PflZ+pzJzNREa/UcPqH8oM
         T3Sw==
X-Gm-Message-State: AOJu0YwG5vV9KGSgkDk5F9rpqskXQSgRiY/ApzFzfNwjlkrz/jTAL9Ed
	us0atJyxIx5ZpOgmvGlZ0aK1LvxbF+GvoUR7Wg25H2eO7bgZebJOEpxKRwIi4EaYFGq7MB4nEof
	F38mI9vhQ8pdrCAZhhcjt5XReDB9MnBI9+96cgCWHyAky7cyIHx/tmR/ZHqkdAMFSaZdQmbqN09
	4B
X-Gm-Gg: ATEYQzybSseayPQsEznC5j+VRorbqxqvHesjYtuQQ/osWjpM9HJb3bPcZRZSbXYw3ho
	4d10RO84KGssnqlStnUdEdtiDuXoeyDvE/ItiBcEhgW8sPFVjFglbfjE4gOuMnzPUcpOI7syULJ
	S4Is15YisonPf29qAs6ZOmoGoDlEr01qX/pp8nHUEAgfD7qYeXtBFab41wqRN4QEP/+qQRF4NAm
	svSi4cEge1O1m0b3W0AozKUaqjUC3+pe/fUxjFd0ymJul0NH45LYyvby3bJDdEAzd3yJWh1TOCC
	3o11LIbKroLWdQXFtpWxsWkJVkw1kCydANBaBgpVIQsEkmAY9yAt+pVUNboyMJ7H3ninr5PHL1X
	Zuzo0Vi86T7YFOjvox+IFkvxTBGGDTigXp10c4wPpZxIn9vZMcZSno0c1m2of4Z8IqOKAN2n/1N
	540XKbX4xRCLFLv/XBS5UOL1z9ZlfSyz9ATSY=
X-Received: by 2002:a05:620a:40c7:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cdb5a9e986mr769564685a.32.1773450572531;
        Fri, 13 Mar 2026 18:09:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cdb5a9e986mr769561985a.32.1773450571974;
        Fri, 13 Mar 2026 18:09:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:10 +0200
Subject: [PATCH v5 06/10] drm/msm/dp: drop event data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-6-0c8450737d64@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5908;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uXjrwf6kVU4yfPAvO2dRImodIsQs6Els2Ljkho09jGo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLUzZ2VstDQcB4PSoYDcuWy2wYNQsofcctUxZ
 JuPfGzZpHOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1MwAKCRCLPIo+Aiko
 1Xx9B/wNTzCyzrkjOiq6O/FZ0Q5qkNJinQZmVe6SQM5AmzOtzXD2KKnqSOArT57vXmDMBsXYPIx
 Dembn3NJGuT3NdbV+BG5/udtsbjkh31ptutuVZWmAW/VLXaBq/57EQyUdQM5NvS7iejHuyp3Ke6
 2kL0643sIgryGo/KILVpsSUDLUiobOFEaEak1riNis8EEUSHjvBQkQ0nD0fcRPYIZAOQFgxc6d+
 OzjxOeGLCFxY17EXsjlaK4UYlj/8aGmg2v1f4fGUdLdkaLIAD7mWCrNwzPlI00+6PgCS9Q08dA+
 ekVY/6QQXtSms0YTKXmpHoMt+iFwF5NaA2iUoHH/WpgXmNMe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b4b54d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zd47t_UtYfsHpvN5YEcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: RaUU4ViyxxXrYM-PmnLwWfiM2qQPaSmD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX/AhcRl84BfAt
 6nJIh53CMIiDAyiFe4PRNHy+ifY6b0BRY7y1zsb++8CcWtUfM2GcpTOvYWS4rDQxAy9/vLLKK6C
 KhGOusOcT8/ljrSK7Q7tEtN32MRYCMc3hsl0jPUU6NMzoeP0BiTHRdR0fGK3lV42xTytmQ1CVLI
 4q/ak3cOAYVaQWM6VksL63nUD8VAEP1OfsR5wkyCP+W8kLFtiaGYERRfya9ik+A6S3Im05B32+T
 VVn2vaDBeGbWzd+8qPpdk13htF/axSLqlOlvhbpxt2OzoJIKycrabJ9T64xd/XsCllHBumgLMEi
 KJzYEwY4OIvGR1ngnvysluaIR9JhZyDmhRU7KWqENQm85PdHl4VieA23KHzdnsfc5Meb6GmAkDf
 jaa+6RIzetHhItuEY/icW6jNBduP9aOcKVIpizkdz85SMzsfafV9KpUbGVj8vzcFWruAe3pDWL4
 WPYn8lZUU2/MdIXvLKA==
X-Proofpoint-GUID: RaUU4ViyxxXrYM-PmnLwWfiM2qQPaSmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97652-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: A94FB28B316
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
it, removing also the argument from event handlers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 05c292e27126..bc4078c229cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -69,7 +69,6 @@ enum {
 
 struct msm_dp_event {
 	u32 event_id;
-	u32 data;
 	u32 delay;
 };
 
@@ -218,7 +217,7 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 }
 
 static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-						u32 data, u32 delay)
+			    u32 delay)
 {
 	unsigned long flag;
 	struct msm_dp_event *todo;
@@ -236,7 +235,6 @@ static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 even
 	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 	todo->event_id = event;
-	todo->data = data;
 	todo->delay = delay;
 	wake_up(&msm_dp_priv->event_q);
 	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
@@ -576,7 +574,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	return rc;
 }
 
-static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	int ret;
@@ -602,7 +600,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -644,7 +642,7 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 							plugged);
 }
 
-static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
@@ -706,7 +704,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 
@@ -724,7 +722,7 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1079,7 +1077,6 @@ static int hpd_event_thread(void *data)
 			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 			todo_next->event_id = todo->event_id;
-			todo_next->data = todo->data;
 			todo_next->delay = todo->delay - 1;
 
 			/* clean up older event */
@@ -1105,13 +1102,13 @@ static int hpd_event_thread(void *data)
 
 		switch (todo->event_id) {
 		case EV_HPD_PLUG_INT:
-			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_plug_handle(msm_dp_priv);
 			break;
 		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_unplug_handle(msm_dp_priv);
 			break;
 		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
+			msm_dp_irq_hpd_handle(msm_dp_priv);
 			break;
 		default:
 			break;
@@ -1212,19 +1209,19 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 			dp->msm_dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 
 		ret = IRQ_HANDLED;
 	}
@@ -1649,7 +1646,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+		msm_dp_hpd_plug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
@@ -1721,7 +1718,7 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
-		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
+		msm_dp_hpd_unplug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
@@ -1843,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 }

-- 
2.47.3


