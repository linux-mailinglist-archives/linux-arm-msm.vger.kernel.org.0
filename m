Return-Path: <linux-arm-msm+bounces-59833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBABAC84EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 01:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189474A76DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 23:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1CE25290D;
	Thu, 29 May 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcHQc3rv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400CE1AF0C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560527; cv=none; b=f/RBE3xonhUw0ZbL8lfB8IxIE5pFhrELyF+AD9jG1ziUC9AjAWz0uGBHJGuc9dgU5vcXPXGxgL/l/V/qWxt4U9p8iCvDBRDeANgeIRpv6JcjuSWYPrLW01OC7Y2AbZ2RZe1lsAVA5cIiwuPeb7n0DbN76pQoVeA+elSRXxLbgyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560527; c=relaxed/simple;
	bh=ncFUgjCcjLVp47mdzw5AlWfZzY/iqv0NdO8zjQXSoI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7YhSBSwqUymGhJ2HjAfvRRhXjqc3Dmndphy3TFFFW322ze+HSsApT17vPoOUNBOdm1PfWzHWkF1J7rJGp2Gvc5Z2caQpQZ/3gSx4ms5TkEacd5jKK5Qw99DgRQ7RtmRj7Gx5Qkai07t+SEaE51Hsxj/b01cyLvKbxP8DVXhc+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcHQc3rv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1OtP013722
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9T6LjH71u9zQzlGudP+qBcjCF5Cn/3FIBo8ObljvB4=; b=ZcHQc3rvA7phTslz
	WQBad+h15HW1V9ljZeSKT6KzIE0xo4633oqLhZPzdLJbRnPtnfw5qc5BLc6cawzt
	5CxoqKAvxiSZU7dEoULAmD0ohmR31RfZwo3Y1dNauszmHoGIsOFylGhJxGovR0pE
	41Ryfa4f1DtYM7TDDkSWCppkuPUenm3nQWr+tc5FlwGp1lrVv0SkfyDs8RGI96ik
	avhGIhnNCOwFxV1fGXy1M4pL6ddHcKKHhed9QCvhQ1ha6UB1Oeq0c5Ly7H27Dmc/
	AKxCcjk3HdYUjZ7jcPMSuCARjusr0B7oMCdgi+vkR/8antwimGlXAKx807SHbSyI
	L5Glcw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm11te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af5310c1ac1so974653a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560523; x=1749165323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9T6LjH71u9zQzlGudP+qBcjCF5Cn/3FIBo8ObljvB4=;
        b=sWqps58HJFMarkCz4CxHuysQ8yUsMHxotgf4r49Mf+80tGIREFUHZbpSw+9Bfyzwcp
         XayRKlO7KgiLFX5srqFHu65Dqc5zI6FI497EQiJqLeIJIbHYQ6uuzDh6BBTB0oQWavqN
         RFVVGhlnFEsEN3o3kUFj/DL3qoSpkqnb3CBTeQGH71xwAGwZMly1OaFXhYFOJZM6nWFQ
         FeDvCkh/uFDd4FhuxJAQiUn3MZRK562cGHF+GoUa7RwSNz4NUea8ZRuQDwYNec9F24h+
         Rli80ja1SCDAukSQ7ursoIZ0+VP13ONqSNs+R7dCl+LShmgtXNms6d8bdMCLr5qWGNOw
         C37A==
X-Gm-Message-State: AOJu0YxQ8PJLKldACVegtnOIyO9W5FIUabAWhw9xNX0dhvN0tW7WCxhO
	/8kvF0ii1jkDxDIaZtwt5qL3QAsbAI+YqqGhY2ZAVcR1EUpSM4jifJEqIKhCtSxVRrT80z7mLSG
	t7tKZ5GBFA7kBHnyDWTSgXW5kS/6hYimWCG43b8cztFa/cmmqgtK9HGbl2Tvf3bHeQaeC
X-Gm-Gg: ASbGncutUVaAYVLeE+2OChJ21cjyahpphdYVJqxfGw2Mv1mvaGts23BCy4eieDCr56Y
	4WhEH8gL7QVrQ8yJ2SaA4JNXvyFTOKlcTxUZEQIGcTixWee7+xV8/Jze2ivICwU/DiA6kmnqsob
	3KR7DFICxgHzSqogjjNgB3ajlJnYoKf/pEW36HwvaKfR27lBIB7yDJYlLwZ0jmDsrpBoMbgPvHH
	f6HCTcFoFtEGAJx0Lr9EGoEue0FST9E00Ckbhvn+fmTl6GyJwxYWxcedRyIRVp4Y7MEfKUdbArx
	HseE1LMY9b2a65K1j+xMO24BIgORXsHCaKXNskETcjNjZKeFdIf2Lj3cH3KwEstszULfbkuh
X-Received: by 2002:a17:90b:180b:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-3123efab981mr2365839a91.0.1748560523483;
        Thu, 29 May 2025 16:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO6kVlTul5XfVExNVHlCfMfXtoSx3A+pScknURIeoMKwp8UajMgtsqcqSsCFhBesXHbzaNgA==
X-Received: by 2002:a17:90b:180b:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-3123efab981mr2365796a91.0.1748560523026;
        Thu, 29 May 2025 16:15:23 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:15:22 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:43 -0700
Subject: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-1-ce33bac2987c@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=2307;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=iZ6m38kGUh6Wu9/l4YZxdyErgIvmhQUC45GosLwQHF4=;
 b=JzwNwtaiIIBM44Wr7k3CgOFsd6RO8xdIk4KnRV24BqdwI98BPsxzhcx12py1hq5JImcnhpaHq
 ewjnk+F5+XNDjmSGQssJk40wWDDN1VwB18kGz3ZAu0MJUSg9qNEa3Z9
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: jy4DnrxRZpyTNgTw8yaoGAsSOz3-0PpV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX0DszOcbG/rcT
 cqjYogkGlNNSlsFYkGKVvNlYLRq2BtinqSdhOvv3kq0QDkVA9zh9qkU4mEdVaUmior6IAmpb1oq
 vPyphDxl/CJcz33C+f+6ev8kSqqWZ5uqJtJBG79De+0/LgD1ZHy9mLA8qsE5J2VZlqsu3hL+Wk8
 zQAb77BNI3mS8CSeuzQCoEa67/5R81z/Cyx9PWBzklSHsiQbCVuPZZIHTE1Z/shcUxxh0shdQRe
 nD4SijO4yugwrV/7xFm2WsuNJyJX4Hwt9pdO1xdFIy8sdN23Uv3uvXwnqDZavBRm5fDIWIGkhuW
 RgLnR4cSmD7mqUAv8hSxFBzdmVy8enQc8mCnIG2F2YU/m2SujzV0IS8EZdVpsyOvu2MFaMIjUFW
 POY00xBrsMiyUPXip695scB3C2X9M1skeVQjcse9oP1TlEyquytPluc4fKv0S2wDlWXpoPXi
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6838ea8c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=PbHRmTaTmGSOozFvvjEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jy4DnrxRZpyTNgTw8yaoGAsSOz3-0PpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon
Chipsets"), checks were introduced to avoid handling any plug or irq hpd
events in ST_DISPLAY_OFF state.

Even if we do get hpd events, after the bridge was disabled,
it should get handled. Moreover, its unclear under what circumstances
these events will fire because ST_DISPLAY_OFF means that the link was
still connected but only the bridge was disabled. If the link was
untouched, then interrupts shouldn't fire.

Even in the case of the DP compliance equipment, it should be raising these
interrupts during the start of the test which is usually accompanied with
either a HPD pulse or a IRQ HPD but after the bridge is disabled it should
be fine to handle these anyway. In the absence of a better reason to keep
these checks, drop these and if any other issues do arise, it should be
handled in a different way.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 386c4669c831..1d7cda62d5fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -579,11 +579,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -706,11 +701,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
 		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */

-- 
2.49.0


