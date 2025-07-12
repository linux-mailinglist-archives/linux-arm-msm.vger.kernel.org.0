Return-Path: <linux-arm-msm+bounces-64665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36908B028AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 02:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7205E16DBC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 00:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01EA1D5142;
	Sat, 12 Jul 2025 00:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxbK+gQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E5D1B393C
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281920; cv=none; b=T0EP3T87zyq7zGrVZIfON9NqqOPUOYPbdegw68HC9CUMpqzI0SWcDpkWF1BP21hdYXKdrJNq1VyhGg/YRYvwp89t4SmdprNlHQNFvc81EQQf8X7H4+e5d2MGAqhOlpp1bA9jRwq01mopGvHGEdzGAb7xRrGaOxoeZ7RGi+LEw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281920; c=relaxed/simple;
	bh=48wdgPtyNZwMd6sZV3ZvvtvNWOvHLwkNGaRnCDc5QMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A87Qp95W/9JPO+fH+CkwSre47OoqLxRF0UaXqosdvA6/K/1goKY7D6JFJbnmxcakNSMmzm9JgCNbET00Yn9FMzYsA1pLA2qkU87HJilT79Vpz94LEdL9asCU4p6RJB3TFxAS4sGzO/cTpDn91qid4YpAjfpoggSwjoMi56j9wcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxbK+gQ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BNRRea021754
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ztg4BCYx+5l4ffFBXcfolxY/m0CGJMjBeYa+I+72rCQ=; b=ZxbK+gQ3o7Lg9I6o
	tW32UyfO1cE7hcJZNK52s6E4qCyyLXtZD3NlGUJWVHJIqQzMaW+zR5FJDYshzoZG
	WGfyr4GJr+7DGenQlUAyffo2YMu+unknAwcPrtgoYskZ4CNKf1r7C1GsuAAozurz
	7UCHEyr26QK04gctvrweQeOMfyvTd6BFhYHdyzdvTZv9jVVQJftY5txVtGa6H3Di
	kbP7XhYsakcEgOE4sgWQyqqXgKz1WKitp1dXXxOhcKfuqlJq6dJsxUSpmaUM+d1r
	gv1bs5iry7WxdWuTv66MZ6UW8B2+sOimH1zxdHYGAyK7spoS+/3qUJeMuRkHmxSr
	Vu5yxw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so2518995a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281916; x=1752886716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ztg4BCYx+5l4ffFBXcfolxY/m0CGJMjBeYa+I+72rCQ=;
        b=ZZGEDmHzQPYvxC5U4r3ChDsRS1CYF66wfx+MbQrkvQSLfI2wvxw/GHkapg9mpoyXlM
         7w2MaeuEkTQKRPtlMTKUPL8c4Q+5pYjf2rsXeXX51EmzPK4aZltDWD7z1rTV9VGMeyX2
         xc3l1s9zZnZnnpKiFKaGU3yjXBHl7mtAcfE/V1nZ3+uoX3UBHlW6IpThpTEcdo0KZqq0
         9OsJKxDR/Els2CWxgYgP7f2IxdpsGqUF7dXUws9MSdIhNXv8xGZQd1pRcj4JPqHJ4kal
         sCqUy/2jLoqq3qpTwqumgtBhFkNovfcMl5CUKG12e/gh+afproh8B02WI2GuSzY3PS5+
         CWDw==
X-Gm-Message-State: AOJu0Yy4y2UZb7bNXREVE58qCqNYNaRzy9KUe1/vo1SEk/IeT2+UDziC
	PU0PWkxPVqKHyzxpNiSHmHguoOCMMQGKUKqzbKY00Y3RYb1bMt/jcG2o6QNoXjymZYBEb/880dF
	iDZS6eLoa/yXC6LkNNoDbQ8xomfBDgV8oz138/peFIRdMxGhfARdTDN4+IxnC8Ua11bp7DdWd6b
	QS
X-Gm-Gg: ASbGncslz2gswxr/MMtFgQ3M1ryumKT2GqyM8emfDpxT6Q4XTVcbs0jSFe8ByW6wcZe
	ECce6X78d6rEyz0OYeS1xBBY5GlbMJiIT6z3/3RGOnVm2XDTvwhYMqnhfHoV0up3f+gBderc2mK
	mcotRifRxK1twIEUIBJys6KX6IYgM83K2Ni5U4T6anYVBlcGZ77oYL/asOpumjsCtcAZDlKpK6r
	B2z8vFTAaBdn5fFFa9dDy5qYIfjy6LB0IzuCx7BBye3zoxY3+s9ylnJ+HWKpL0CTXKhru+kf1Cc
	mgcTtKpoeUqOyVvc9Du3jXYZ8K5cZQ+2HhUPvIr1z853T/etBwJbPmm8YIonTGbKH7o4piAFutg
	x/kZPEYQkWLKLd6RqMqm/wpZD
X-Received: by 2002:a17:90b:4b8d:b0:313:b1a:3939 with SMTP id 98e67ed59e1d1-31c50da140amr6038218a91.15.1752281916054;
        Fri, 11 Jul 2025 17:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYEyWKARo/kBpo3bdZrLz9C/cBJUuLVhrx+I5Awn+rzHrHkONY97ZQteD6SKGI0oaeUyzVHQ==
X-Received: by 2002:a17:90b:4b8d:b0:313:b1a:3939 with SMTP id 98e67ed59e1d1-31c50da140amr6038183a91.15.1752281915603;
        Fri, 11 Jul 2025 17:58:35 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:35 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:11 -0700
Subject: [PATCH 06/19] drm/msm/dp: Replace ST_DISCONNECTED with checks for
 connected
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-6-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1974;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=48wdgPtyNZwMd6sZV3ZvvtvNWOvHLwkNGaRnCDc5QMk=;
 b=dzPxfM43mTJa1032ZbcABoClTN8ieb2y7bh9ZE8auswDZJG9PPyvhrjmKx0NoQMg2/vNJ1lx6
 b1y9e7Ioc0RC8W5E2bRm2Avg76t5A142aCXiryZaYeU+RfQsDfZp+6v
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b33d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iO33u3U-fp8Dsq_J1c8A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX2jcLLMXiMswj
 nRGyUNVPryJDk1UNMjCc23FyJ+is7BfXd3X63EekHu7pnMt1oxstGK07fC7emhpvsFqYfcvAxas
 xeiUfskb7m128g+Ac4nPBfRf34lxVouQagQMBnpsSAM5KRL3Sr43pLFD/N1MsIpnmHO60EN+x3W
 SPcYZy5oWLTG4Pux3t921PREFhw7AwVyzGNV4VUEPWsFVcThdZhzOIz52GcSIIWTEkRKsbR/cvo
 3IO3woFjkAlDreOdkRjXIelRMi2rDqSI3jX8mA9/GlaSMwHzYaxneS9TOskBc9XVVGwRK9bwP2X
 5DPpBrW7S0BOhzlM6ByvwuZLtD0pIb7X9mlA9al7iVSgL6eSlO5wXjVQ43sb7iETXRZ5HjeaP//
 64vo+BQiL5Bgu3x0O4wbAxwW3qR5KSxuCkoMTYkk+crku9pK98pU2qZ0Wg65JFm7f3l8no2P
X-Proofpoint-GUID: YORKes8DfdC6QIq3jpcrKuIuLcO-dNWQ
X-Proofpoint-ORIG-GUID: YORKes8DfdC6QIq3jpcrKuIuLcO-dNWQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=929 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

Replace ST_DISCONNECTED checks with checks for if !msm_dp::connected as
they both represent the DP cable being disconnected

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index af3cc32aa123..0f1c1fd2b1b7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -521,12 +521,12 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 
 	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->hpd_state != ST_DISCONNECTED) {
+		if (dp->msm_dp_display.connected) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
 			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 		}
 	} else {
-		if (dp->hpd_state == ST_DISCONNECTED) {
+		if (!dp->msm_dp_display.connected) {
 			dp->hpd_state = ST_MAINLINK_READY;
 			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
@@ -543,7 +543,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	u32 sink_request = dp->link->sink_request;
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
-	if (dp->hpd_state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.connected) {
 		if (sink_request & DP_LINK_STATUS_UPDATED) {
 			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
 							sink_request);
@@ -666,7 +666,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	/* unplugged, no more irq_hpd handle */
 	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
 
-	if (state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.connected) {
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
 			msm_dp_display_host_phy_exit(dp);

-- 
2.50.1


