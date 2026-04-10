Return-Path: <linux-arm-msm+bounces-102660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEROCErH2GmGiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:47:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1793D52E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B23FB30CABD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FA9375AAD;
	Fri, 10 Apr 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UO+o8HGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jd2SotCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587403C9450
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813820; cv=none; b=ulBi3hx0YNWKB65YPAWi1MUYBYIGzODxAmNbhc9kmk/nx/cuh7jvvqjzbGZL4kG+7nguClNCDA9SJm/F8u/NJk364NOdeCcqliyzm9jWISOkP3o9qw7TIrPcNk362fCVNeOkrggFEz4x8ynPFjfkg9MXcXV9H/2nGkZ0SMtLJVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813820; c=relaxed/simple;
	bh=0rDUq3l+QkTHF+22CSh35s85kl7DDEChPliOA1TNxqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgrUGmOJjheECY5bEreezEN0NxjdZVqu0MDUT/HWdbLT5o3s6fuE49OKOY99HcdiD6PKn5gpceva91Xs2upvt9CkkcbkTzY/rfu6Q+8CmlZrhZZY1+9hs/JDXlbgxslqdlZcnf1gz0+qXy2J6FVChWd8ek2QmVTMfnsvevAqDWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO+o8HGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jd2SotCs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6m6Ma1433247
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDWaKe5f+7e99KJw/bpieQonEcTMeQipveQM7zWE+/o=; b=UO+o8HGkRbkrRVJz
	xCoeE4wBPBbZJm7xsZns7FnygjkL7xZDBblSf1sfJNZDKM7xU1yoqfOLhygpb7Tk
	w4KxYmGfhfzsQRSSpn798ghmDUA3Xp6NY9G1Kj5ihoVWqFjGPjdkicIoWpuwqYqk
	q7P6z3cN6Il4XoAjLljv1pkJcynmPxU8Vyk/0DljFn0Xpgd/oph7bUcdjKVanG4y
	HuCGqymyJjkud+L5fw36NNh1D8NO6k4clKo0jy0vnrQ44XwcF+8I6pFaH9MGHKgX
	hiizxKg29mjj6mOjo4uDtRzonWDxp3wen14uWtK0OLIYshcaTUDvSJr11vXH3fR1
	8Y7fTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfbpcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89502dfd7b4so33141076d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813818; x=1776418618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDWaKe5f+7e99KJw/bpieQonEcTMeQipveQM7zWE+/o=;
        b=jd2SotCsn5WQV/qV/5fTxq8n0jgTwp1iZfYT+g+RzJjt9E6zukvIKoU5MeqqNFRGp8
         uRwVwjh9jLVN/ybFoKcxsHky+OE+89dUvFaQeY6TJZs5AcAfhqetG3nb+iZYahg6mhbj
         nuLph6G/lVjtwDlzh3gaTm3ZUUHFtaqNKTlT7qYhBaDe8uvDzW4UfjfmflFjm4m0NKze
         c9i3NXYzg0o4cL9mRpSg9ab/JTNit8ww72E7TCuKtEl9jKBgXFOeInxvKccl/Kv7csoB
         AbFCpwg574kfUZnU+0/tQwPB939sXLTEW9jJBQ04lzZuloZIA8HYvLOEi6H5x61f5iAv
         NeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813818; x=1776418618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDWaKe5f+7e99KJw/bpieQonEcTMeQipveQM7zWE+/o=;
        b=ee1BWZW+Q22Tx90DnDQro812uwPonFcHvpXPhz6O5dZ1GMttrNgh1YUJqQUseLxj1w
         z1ZXmClOzzEWufBuyvijkb+SyY86tTh7rG6fQODPEbAFqj879QqPXvHs54GPAnbQ4Ro6
         r8UAvUa3CWNVgE15ewNqbAdj1uoIb2XK064xxl1NK2vogqrY8ZQb/7id9ipsGaluYL5B
         FpDLNZcV+A10j4w2il2qFMnmvMGIV8FjFUgjlNkwq7TLFvjKA1JQEwQ6M1cGm6K0RMRK
         4Png4U5imIXwBRVoGKk/mA4JMIv3nR72k+lK8hPWT1qgFid7MCY3bPiVDqUpbI6dnGcf
         2kUw==
X-Gm-Message-State: AOJu0Yy2bzgwVW2gaxPBEwxV5steu3daTacALeVkcugSR6wDsY5I3h5j
	UaYT24pF+ZZJdRxlyF2bX6X0KmFZnXaPYAMzww3UwWe7wKDUSmfJgnV3FSmBUbG5HOTsRCmRARB
	ywSQfsDIynba1VvtTWYBG83vMu45ntJmy63gGWiC/jyNeFaDlZWuSqq2St3vDJRYePlvb7cNA8N
	IEqmMZgg==
X-Gm-Gg: AeBDietlDXM/gnxmnOKYY5m1s860JgmWfFwrcX+t//wFrFfN1ITj9OoCiC+iAR5hfJN
	AcnjVE+kAIwkOVVb8GPK4bjJk1GlNc4heEsUcxp5t26hJJwBeKydwFmd+UCFR1pSpFlOvCMKjk8
	Z0Rvc0UAU2v2zGB5CmCTxZRp+1/Yemysmfvo+F62MPPp+pJuQimC6aditQmZYsm8VwLQSp0Hf/Y
	GGsNiOt69GRbLMKAi2hshLFU5WHao7ID/8a+MUAvjfPpSTWJAE3jk/VRNk3IwUe0Q2qVRYZPm79
	a6FbGCHyv/X54bhl1L/Q8Bnncc+8+eRUloKAfqZ8wqmKrE4U3vbCUm4NnR/p6Z/4BcR7uJeYf+9
	NfizoUqKqjdvunvFYbUl1VfllI06mc9ptqi12ZgbknUspCj54XMBfpmVqzcUQfFYa/E+zEresUD
	qXqsrCaUY=
X-Received: by 2002:a0c:f40b:0:b0:89f:48d0:4c9 with SMTP id 6a1803df08f44-8ac862ddf3fmr33949826d6.46.1775813817690;
        Fri, 10 Apr 2026 02:36:57 -0700 (PDT)
X-Received: by 2002:a0c:f40b:0:b0:89f:48d0:4c9 with SMTP id 6a1803df08f44-8ac862ddf3fmr33949476d6.46.1775813817280;
        Fri, 10 Apr 2026 02:36:57 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:56 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:12 +0800
Subject: [PATCH v4 37/39] drm/msm/dp: add HPD callback for dp MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-37-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=4601;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5coIwZZglfoV4uKoF/vpQgfWA6y2lt7z+E6eTPu5qE8=;
 b=BxuBV3kygu9oP7RA0Au5CFMzw2KFdoHVQD1nNAWyfy72By1F/uQ6s2PCbKae+UvVcA95edjo4
 izutmyS3bCNCamWqs4Hisq/pUMJtIprSElgAAYNbu9vMtSZhMkMEaPn
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8c4ba cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EulU2RYtZUHqnRkH09YA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX2u7oNNQJEQja
 F7VhTXF3N8Bl6EJvjS0guwidbJ2bsieq0lJmRP7TzefH3HFtu07gFU5oRnHaYk9uOBiCPG9RibQ
 0AA71Z5K4ciL0lil4sq5md1UBHPJ1PpoTfksDvlxNR5eg2G4D2gIfy3D1NYRNM+ImHCFljztCuo
 Pt6osdMtMLUGHp5SFcaRQWYQmh7BsPUE13ssothd9YmWfmaXnsnb75PkKPy3mMq22ukkllJ7FwU
 S/6sYvUqxgXau0F/Z6OJHK2ShzY8TCkqxuzp9BNMLPPZM87VK/qAaPsqEXz8aUIAf2iTVVA4cy1
 JMATh2PCZtW+DtlEelZJre88OYRBK1RA+AkhghYb7SOvKsGK/1BDWl8e32YUEyTwkoFST1RR/U6
 v55nxyT/nCTNhXdQSByltSnsdKZdFeLphPZDDzev5NMJuwGkZ0cZXhoDhsUzTOpAOmq9Q5HuJxF
 hg6MJylCai/eDAU+9MQ==
X-Proofpoint-ORIG-GUID: 33Nvh1UI22ftRskNHWmEuUcS7wOavC34
X-Proofpoint-GUID: 33Nvh1UI22ftRskNHWmEuUcS7wOavC34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102660-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E1793D52E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 919767945ba5..ca89e20b7563 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -454,6 +454,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (dp->plugged)
+		return 0;
+
 	mutex_lock(&dp->plugged_lock);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
@@ -556,12 +559,19 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 sink_request;
 	int rc = 0;
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (msm_dp_display->mst_active) {
+		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
+			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
+
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
@@ -1125,9 +1135,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 				      connector_status_connected);
 
 	/* Send HPD as connected and distinguish it in the notifier */
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
+		if (dp->msm_dp_display.mst_active)
+			msm_dp_irq_hpd_handle(dp);
+		else
+			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+					      connector_status_connected);
+	}
 
 	ret = IRQ_HANDLED;
 
@@ -1793,7 +1807,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			msm_dp_hpd_plug_handle(dp);
 		}
 	} else {
-		msm_dp_hpd_unplug_handle(dp);
+		if (hpd_link_status == ISR_DISCONNECTED)
+			msm_dp_hpd_unplug_handle(dp);
 	}
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index bb3898b1f6b1..71d3f63973e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -490,6 +490,40 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
 	return rc;
 }
 
+/* DP MST HPD IRQ callback */
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	u8 ack[8] = {};
+	u8 esi[4];
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	bool handled;
+
+	rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
+	if (rc < 0) {
+		DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
+		return;
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "MST irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
+		   esi[1], esi[2], esi[3]);
+
+	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+
+	/* ack the request */
+	if (handled) {
+		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
+		if (rc < 0) {
+			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
+			return;
+		}
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+	drm_dbg_dp(dp_display->drm_dev, "MST display hpd_irq handled:%d rc:%d\n", handled, rc);
+}
+
 /* DP MST Connector OPs */
 static int
 msm_dp_mst_connector_detect(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 5d411529f681..08e145399cfc 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -9,5 +9,6 @@
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0


