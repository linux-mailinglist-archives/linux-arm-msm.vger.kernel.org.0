Return-Path: <linux-arm-msm+bounces-115145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UmEUCUKAQmq58gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:25:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C61E6DBFFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:25:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EjtrbSou;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UnBGjBRA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115145-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115145-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22ECD301C180
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C583F413D8E;
	Mon, 29 Jun 2026 14:16:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA341169F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742597; cv=none; b=kDnnL1jg8nEEVIMUB1qRNVioB87h8PTig48evlc82Br8oG2p+jJijY+qwk0CHf2oqhRY0LJuWnxGf4jVjPO2c6aB/puKUsasVS1ktifGmKKY2q9RTylgjOpyUIEgHr8l1C1cy0TZh2Pi2g5igRC2yXzQZzvYE8x5g1TiEfSna/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742597; c=relaxed/simple;
	bh=RzJquXKOi3YyeF66FrBYDSkGWZjxoRxULVA0FumTtYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=selqaYtbFaMdjC8TheXWHvA+iKwstswDikT+dnqkEUQmh3pbeSY1Bf2ir8+Yuda+H6FxA0CT8tTvIE+AYopdKzeRQCH/qvR7cWPjCg462HrTf09kppM5enTatDjMGwwSw2Z4srC7Kcb3jBpJFLSQmxePadZNKxehPPaCoIog6E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjtrbSou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UnBGjBRA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT5Ea2627909
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg3KQF7o+VLEpzr4rtd7xV5y0tUXL2CgXc+z/83VRd0=; b=EjtrbSouwwGO2Jbg
	NlzBqUavK2Y5Y5BbKN6R+OEBh33Wh3m0Nl+fA1UY/I6h6gZJk3QSHzVVC3jRpNbj
	zyMrqLpj87sNhzD3Qz0/EC234O5rxm+TSYpWZWZuZNDu5dF/NTDWGDQi56psWM3e
	IV+Uv81lVtX2NMLGi08GSqBitpA3TzKzRyJvhd4c29EgD1WFAFaIKBkPcPdnGC9v
	05vwk+lEQ+tNIZsZP2XxxWWI9og393DyJLceuj0tX857sdCPWG//zEHtoms94Py9
	TOuBny5jCc0eZG6WMnb8d7HzwYPshy983k7kmhPJF0jAzS/8V6jGjUSKPF+ooxUR
	VOLWFg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs928-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e3ae05d649so76101586d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742595; x=1783347395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg3KQF7o+VLEpzr4rtd7xV5y0tUXL2CgXc+z/83VRd0=;
        b=UnBGjBRAPFf0i4Aks2WRevfXeU/gThJQyOU1yql2OKA8AL/5l2+IUBaDaqFj228CmM
         dSUZrGtUzAK4PtfOwwaoAF7erYg3Cm2G/hT1jxMYM+6xdNTJu5sW3cbWzjljbkqYLYam
         DBD3qdePqxH63VdpdAE8g2oerfD6cnH5LDkY0HYutp/NtZ9OMwzD3bReKUGftGhGNauZ
         e6cosg3ObVDjz2X56vvbMELysSyXWXt44QRz3zQMIoSMFLmH5lRZmZAfhJVEXzy2lXz4
         TCNKUBl5o61/RI8OT/aa7mvgG4dDH6NzgyvNBENW5VoO3SUzGEYPnwRhOkuzdANwk+Mc
         JFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742595; x=1783347395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jg3KQF7o+VLEpzr4rtd7xV5y0tUXL2CgXc+z/83VRd0=;
        b=HgTT/bCJodY5fvwFsfiUL9qCdHqGtaPwRe6wQ91KijthZ023xXXuWo6qBYt7YwzJ1D
         rfoZfoWS/wE0liam2nc0P1TVY7XjUiMBx+uaRLzUCTKfVHAqkvGbZXfufdZNjONH5vyI
         PrZX8YYA8iqf3QwL9cdv3W93jJ9AQzD9ZobkZD2oKYfhT+/quJVuEh2gml92ib64W79E
         rR3hA2tKiTU7lhuN5DkHHof0gonqVjyA7BAvujh9KNUCpD8rQHRJUqXPn8ADYRY7Z2aV
         PlkcdMQ7Gr/0+/mFl8T51plD/c08G35oFYB3/G/FIjBHp2fQPmymkjUmYqTXNQJqzQkb
         Uu3g==
X-Gm-Message-State: AOJu0YyvdafHtsg0y5Eydv4EtWFbqP4QkbYFQVDahQdDix3qTOO1b2Mq
	4p2NerX4hy1MF1QfcZC6O75luLvc26hcK450H/yB5hdZqtZ2F1RBQCaoiGPszpuM+bkgyZtEEXy
	1gOBOTjmH64yokMdk/Gk4/B8aX6IMwUYnuLI0rfkrV5uc3QwZ9EUthOqtKifzEb9fAbP5
X-Gm-Gg: AfdE7clV+gmmRBR3qjBYpbhVwRS6KjJJiy+2Cii01EEN6cISSMSpbJEDgr4WTd44mfU
	duxcS5AsoThU1CMy8qZaeC3ohvdyiScVEB/bb6TRyfYNMTI90OJlleSWmhg3O7BWddkiuHfhmDk
	YeVQD6RB4EEANNhPzBVqL/JEaQbq1De0MB3KXIEGrDGv41IziLAsQ6p20CTbht6t5IE8plhVqD0
	WvtY6nSQFj1c70gve6+qUp2gOqPAWZq+3Lid6nO+i+OFrsb8BS+VOVyJ3rTZFVYpujVMwzAkVpG
	tIEjP3TchxBl2VX2DeM5JuT4V+Ka093Egv74ORkQhekQH2rKZtmScqV/58hv5ODMUHO7eBd8t+P
	GC6aDTYVfCPfqv9vGVHIDHfVr0pBxrz/zYU1T2CHloughlGQaGg8sVyfLczJ0famezVLa3w==
X-Received: by 2002:a05:620a:628c:b0:92e:46e5:8f12 with SMTP id af79cd13be357-92e5f0cb023mr151358285a.30.1782742594032;
        Mon, 29 Jun 2026 07:16:34 -0700 (PDT)
X-Received: by 2002:a05:620a:628c:b0:92e:46e5:8f12 with SMTP id af79cd13be357-92e5f0cb023mr151353985a.30.1782742593296;
        Mon, 29 Jun 2026 07:16:33 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 17/25] drm/msm/dp: add link_ready to manage link-level operations
Date: Mon, 29 Jun 2026 22:14:38 +0800
Message-ID: <20260629-msm-dp-mst-v5-17-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=4047; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=RzJquXKOi3YyeF66FrBYDSkGWZjxoRxULVA0FumTtYk=; b=4lTkIB/+mfgRy3oKSPUd6U7GIl6THwmLYLseJgxvSFXaQ6qEwFwXGPJelyLthuOAbw2NhlUzh Vq9yiQD3kmKC2LhTAbmyfvT9B9QrlQCLCx7V/W8FnBM9R2PdExPJO1i
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AsUPQYEcDpbXFsrHDpOI13T7qSDalSQH
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a427e43 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=r0U9Mmpn2XdHegFmGjAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX7KF0FtVyrRI4
 5XQWOh5m6osPOd4cKq1CnYytshmW8HEGW7CTlsR9bgP79EokdzcigMsyAtgPP3lbNUOtldlo9bQ
 i1HRZnyqadKS3wxA2iPsGxW6KoMBWq0=
X-Proofpoint-GUID: AsUPQYEcDpbXFsrHDpOI13T7qSDalSQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX8Hs51Eq8y3+j
 hVWtBcZoq+tQW9ugchgZcBalXzHYavxQXqkM6psx4FpFRijGFfyalvdVGygHB5X/RcWi28p1dbm
 sRbgkTQRFgLemrNLFenPvIOPNdkXpop1M/nFr4l9aiM8Avh4BmslSekGAbOkzeU8iffe1qzLLhN
 SBtv/uHfosVLbupVAoJS5009u8UB3/7TqGElgRs47sZzY4gb5v5ivKHoxytQT/PB+NGvPAgHw0a
 WVVWDp8QDS7VljokSsW2I8PljRcG7Jjkft+vvKieGjKzYpzVP0BYgYgPtmunHflU7j4UD+iAxGq
 oMUswp8q8RExy8zRixDQ1ZYydj39Z5KoVydyZ2UYJYDTiEOGwaEmUIxm8Uzp2ReR+zVxcYb+CgM
 eIeFHB9VmvFkTr5pMVmN1msInkewpQj4DfCeq39HqS+LcjNbq01gJuGG+Nxlp0ulMcN2+nBQAKY
 mE0/bnWYPkMnQGAnGvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115145-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1C61E6DBFFD

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2a74302bcb7c..d56ee10ee065 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -702,6 +702,9 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	if (msm_dp_display->link_ready)
+		return 0;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -714,14 +717,18 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (!msm_dp_display->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
+
+		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
+		if (rc)
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		// TODO: schedule drm_connector_set_link_status_property()
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
-	if (rc)
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-	// TODO: schedule drm_connector_set_link_status_property()
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (!rc)
+		msm_dp_display->link_ready = true;
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1566,16 +1573,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_p
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_display_set_stream_info(msm_dp_display, msm_dp_panel, 0, 0, 0);
-
-	rc = msm_dp_display_enable(dp, msm_dp_panel);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(msm_dp_display);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, msm_dp_panel);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp, msm_dp_panel);
+		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1624,6 +1631,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1642,6 +1654,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 676213a48089..0464f8941e8d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -22,6 +22,7 @@ struct msm_dp {
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
+	bool link_ready;
 
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;

-- 
2.43.0


