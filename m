Return-Path: <linux-arm-msm+bounces-59834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 384EFAC84EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 01:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 743F24A7507
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 23:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312672571AC;
	Thu, 29 May 2025 23:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbZMlFDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917D02512C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560529; cv=none; b=tUlHbp0kCFrn7dAzLMs8h+uhRSe6SfHrLYWwwqIrWUo0GW33K/HN+mhyeZOCMbzMHGVd9EyeKwy2FkwsFVT+NGROhDZNv6+UTiHFE8eNQw3NptWF8jyggwsJSooqbdsyNy039xaMDg0o6aWzY7B/MjDccRvOr+mjD+bPVxGhr7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560529; c=relaxed/simple;
	bh=cT7lMKr8k0/w4t/Z5K5ELQ5zbFL0wwmPeLJNmXBBCog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWgpS65pDdsL350Yo0KAVzQKeW1Q5FouF9IyS1RvQeQi4b/kiiUgY/Lz2Ko2Lt3HM9jadyCO+Rny4RPCE+4iviHHRbF+uaGCLIRz9Y+BtlJmw5j1Hw6K2PEU6/JEHkJpa78/fp7dMOyLqIyFAQQ855DCCuhUD1SkcQTLf27LQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbZMlFDw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1Jnw024429
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2gYUU1FXEsiCULrNF5KO3iQkScCDInHxHlMYEUiimg=; b=VbZMlFDwU2tYYnKb
	uEiZxqcsXus/ZntWMn00T7ghi53tFOg4pnzuV16bQwr5oO8ug3AQhSEBEGtTSnNU
	JETQGD9hmiIObOPuU2n3V4BW0UOif4fV8nvwk4lYKvApsOFtcdGyi3UqgmP3OkQl
	T6DHmtkM9sBv2UfIix/w7VFE8GZCBF5GggyN3HMmsbLyeHn+Xe6wjonGbdTjhEEW
	DYbvkyTv906Thz1XTn+kJEgsR6prbzmGeqoArJuSfcG0VFqaPr84GpVCxiTQdxNR
	B5HB4J19utmuPKVMxAvzdKGFfZRibe8S3XL7QrNM0JzP7oHLzJgPqTwFjsjuADQm
	Aw1Npg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mwg0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3122368d82bso1455621a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560525; x=1749165325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2gYUU1FXEsiCULrNF5KO3iQkScCDInHxHlMYEUiimg=;
        b=BbQM+R9b/PMqGCoFNObxGfZR3GLwtAayUsRSNHVGhTofn+dv9gHDQoXej9CpExOfj8
         +21fbvqmOmkNbh93p+5dTUMJUGVsPx50VkVNpdZdSgwGgrvOnowop/7IsL84GI9gIfwF
         6otdNy1IN57WEZoqiB9BV1ofWQBP9SSDhN/AAOYEA6T0syvSi4gzaAN+BygZ5GT5fMat
         o9/J7XP1jd3Rrmzl3CTSaOOn+NlkzAjR5Z+OISxA4jt5EVl2BDtZ1CfstDneKFs9Oqgd
         dNyS35KJbAGiwAw5h75HXQY7/rNPfC2hpohXd5evNYo+GF//F+LnDnUM5A8/l/5ydb6d
         3OYA==
X-Gm-Message-State: AOJu0Yy4zm5lMbcNQ+GE0BulXwCah5atYX7W8nMkHEHHLKe7wA20UXTl
	2lCGYqmtVzsp3BIJtuSs0P7GX+gttZvvI04a7WJx+5EAlkTPnVezJUoGsIxHJtMeXXC46+rQ3+a
	flBWhPnctHfPHVkR9zQspQW+YORC7qCfGwYaw0VCS8bYwzdH/WUhyiqXXvF0uqTSdN2Eh
X-Gm-Gg: ASbGncsdxBxzCpH1aWDlLsecAjsZakzrbosDF+kpvktl2lrx0iESjwr9FORvTHQxQ8i
	2gxSaqt4OmdNBkAuISxdz22L0Fc/gxpPgRwKbF1SyVISrrNRYz3281nrFGauqSWf8NmKGtKUJjM
	s4B9KIr/Rh2buIhrXsm0ttIBefAZzyZpQQoLhzFt2LyQFflNqFY62Udiw8FxHTb81jABZudODK6
	pod8MhY+QyCpugV9IsHTvY0eobo/w+clpvAFvNoeiI12DLMCVRDiPjOjHGc8tW+M1PaJPRxNRMo
	/ahJLTT6Zi4/QIeOqq8MVxQG/3COwqhds6N2OCMsqkBLMpQ6yUzmaWVS8YVMrqvGa+PljM/OdOp
	G5b8IJcQ=
X-Received: by 2002:a17:90b:2883:b0:311:e8cc:424a with SMTP id 98e67ed59e1d1-312415391b5mr2330075a91.14.1748560525003;
        Thu, 29 May 2025 16:15:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBfi+6PW0/stwfIr9Ji9/hRe9cqIN1QfL9pqez/UiTuvBmsR34ao61gV2YnPGnXd7GW1DHUw==
X-Received: by 2002:a17:90b:2883:b0:311:e8cc:424a with SMTP id 98e67ed59e1d1-312415391b5mr2330034a91.14.1748560524621;
        Thu, 29 May 2025 16:15:24 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:15:24 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:44 -0700
Subject: [PATCH 2/4] drm/msm/dp: Return early from atomic_enable() if
 ST_DISCONNECT_PENDING
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1455;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=DKkTNWpb363qNZIlJK/dgUyyIUKi4hoMvgukVRHWsxk=;
 b=G0e1TtIX/dBusekaqwSYgj13I+GIJGnSUpuKurLZzg63+cZlKtSuWTLfX9K/Jf3SvmoD7DKSO
 TB2zvTXe8WuDZqo5wU9ZF52ZD7BofrsrfxkwWe6WFZojdVn4OZxeNAI
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: QbYMqBaH66Nt4TTkpJMYXgEWRXlWfsBu
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6838ea8e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-ysM04AIoonzMzE-3HQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QbYMqBaH66Nt4TTkpJMYXgEWRXlWfsBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX3VKOzoGIO3OB
 NgfSwINLACXIX/PJzV4uVRq7RrCfEifg82oXugiKy3sWjLcM/UXPO4wYQzRn+8jgJos8JK/Jkm6
 8r+YAzFetYPzdI6QeoiUGFB8NAu2KSbxNbZde3g7dWu7NSmkzqku9t+ZhPqQJPfHMFGG3O4+lwm
 K3GaioHCV7MIbivuQwyksgYE6MNeiGGuANlfHTDLM76JhFi9iCz+QkAVEzNYkv1z18kw+K4gHq4
 NtDMiGoYB/ckLt7i3VSWIIsd9udBU9vtzLatCX35IQf/Yezh9c9XLZAF6LFgQExbq13AImCkRXn
 uvwimrHnN8e8VOsQM2eXbpUudGJ9pffKnwL9dl8yxBo8y1iUSudYIkwpJqfuV58j+m4XMePRYzU
 arYByAjDiKNK0CKGQoPy0hyFYLbN/d/GTla7aRXZ/VjchdvMXhB6Q2n78gqMwS3utc1Oc/h4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The checks in msm_dp_bridge_atomic_enable() for making sure that we are in
ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.

DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
msm_dp's atomic_check callback returns a failure if state is not
ST_MAINLINK_READY.

For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
there is an atomic_enable() without a prior atomic_disable() which once
again should not really happen.

Since it's still possible for the state machine to transition to
ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), change
this check to return early if hpd_state is ST_DISCONNECT_PENDING.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1d7cda62d5fb..f2820f06f5dc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
+	if (hpd_state == ST_DISCONNECT_PENDING) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}

-- 
2.49.0


