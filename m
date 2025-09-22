Return-Path: <linux-arm-msm+bounces-74479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA4B9398F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 01:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7FF2A13CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 23:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4727131B12B;
	Mon, 22 Sep 2025 23:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1FLgZPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942C031A57F
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758584049; cv=none; b=XWqYsf7hAiuUvfaDWO5NOIPGZCkta5E9eAItJ3DMijN3LLUtVrxkOeUHu/QS28Rf/X/2Q3Y7SAzQNG8rFtPKNwzV0kgFChUcUPYJ9hnl8gAzkzU0XxPCe/f4+H/T7Uj2rPo1yhKxk9QIoj0cS3StmdVGNjy6KhJdBzPe+AVzQR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758584049; c=relaxed/simple;
	bh=NO6OCdz9v3Tc/Ktiqg3Wh+gypiA56gt1Z/XEzJOevmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sNsOuXAOk2eO01OF3NfJVOsCvp4BkU4HyXz7w5AtZMWOPHfiWcdKH+hyr4sYpNglA00aKCZ45iEICh6fBBmU4OAe+8+ursVcHbjcMP1rIvcSfHBsBtTZv07L16fpuSewIQFglZZ9JpQg0QrE7fU+m1mu4bWuGNHFvY7h56z8Wyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1FLgZPW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MH68hu027923
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m6ztTUa1Nhe291Dt3QY6n7
	qVtvRxyg0bpRvNd5kITc0=; b=E1FLgZPWQQqKCbHet7mgc23S2YPAxqBgIGCBo7
	F8/N7a7T7hM5JZCCHceCUCUCn1aiKp4j88BwNktkH4QSRgSImNJVq/Lh1btO32yi
	hne1s3ewJn1fmmf2lX7j9W2AoZcdKrwtw5WIv2bK8SLfK8KdR4FVajZ/BEI7xyW3
	liePs0S7WY/McEcJMSBlnh1nJTgGiHoX8dxGuKORiybg85TLFj1zuuvCBl+v4i7F
	VAKnuVvN+IZeQjBT7FnegKWgvXK9z715oG+2zU5YD77A8Wt2hfEV9okr1Tb1WGTc
	OPiyKP+ISTYladpR0urdkVEQhZB1hXgWOtpgeBSFcRVlvfoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajerxr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:34:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-272ed8c106eso14496865ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 16:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758584046; x=1759188846;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6ztTUa1Nhe291Dt3QY6n7qVtvRxyg0bpRvNd5kITc0=;
        b=sXeNL+v/xM+B69A1bFNirXqypn2FKSbvMHGluqd16HQVVCgwsEzp1w+A9HRJfsCCAy
         /9+zj4bfyKT6Vezk66+tDNaDdiVHsys7glD6ljUjgg6xKvNbNrF8/DJmnp77tpiFmHYM
         pwIDhrqLGB9ta78gr93PQxOJ5966FwFUsj+rYavGZV645BQG9MyQFAogJB3Eeg7zkFBV
         uTLZ3hME1wru1bB3JE0Xdw3igiHtfQSdqVzR3pRbTrDyGJrK4dA+qCa9nWGKc+AsbuSx
         AAza6mm/hTTm/16X+tgflKwrCTN+xqqE+w6wEngZW0yddklOlvp+r2az7dnscSzMz7wD
         tC9A==
X-Gm-Message-State: AOJu0Yw26CKGXQmG0s4YLwhSrUkwSK9sKsUsh9rLdCNmnirROYBxWo6O
	Ly5WYMO++pfXdIwYRhzmK1hG+TSQDx28x/fCPZe5imVbBkRSWvxgSPeAJqITOBO60Oeg+tMdTay
	RgNHFpZThZpksNWPcgorHXZEIiUSYkew1gR3Sc6eDIKhbxhEKm7sgpo5TvmAxspGtDn34
X-Gm-Gg: ASbGncvfoHgysxyAn8JMhYjdHeSFOiO7isHQzNQ860IkCLP9ePXnk/T+3oZngl0e2WI
	4Wcs7vYC1cGUEsw5QI/x5eaqAdGklknj4NTUSe91I+kQqWtQa1Sp/i8FuXQVhPzFjJ+9lRp9SBJ
	iMVI8Qykm9rGOOvaa8tpI52L3/yMUL7+/qJzzq5YeLpLSARpesHuXY64dThhbJI0d46P59PJZcS
	4mEFz/2fj5OwUOw7921h3t4cta/1eaY4xfXZYKuJCb5T0mR3vURjQYF6/FBBZUGh3D41TWJtybW
	QIy7WRS8ObbON2Tknu6Y7u1ouhA13MVvgcGI6akrFU0Lr7KAjOWZtut4OkvW2GbxRVUvsE1e5oQ
	bUaZCAjafaaqukhb9/7sUclnO
X-Received: by 2002:a17:902:d58f:b0:278:704:d6d0 with SMTP id d9443c01a7336-27cc41d1be3mr6027345ad.19.1758584045842;
        Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSbin/PIvKVcn/OXuhCk/5eExOX31UGaUEM1vyKmkyPKW8/DOkrYdu+4YvFnTtODfyJdb6Qw==
X-Received: by 2002:a17:902:d58f:b0:278:704:d6d0 with SMTP id d9443c01a7336-27cc41d1be3mr6027095ad.19.1758584045367;
        Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698019821dsm143706275ad.64.2025.09.22.16.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:32:39 -0700
Subject: [PATCH] drm/msm/dpu: Don't adjust mode clock if 3d merge is
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJbc0WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMj3dz8lNTknGzdtMwK3UQLcwNjc9MUS0szAyWgjoKiVKAw2LTo2Np
 aADo2laBdAAAA
X-Change-ID: 20250922-modeclk-fix-a870375d9960
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758584044; l=1310;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=NO6OCdz9v3Tc/Ktiqg3Wh+gypiA56gt1Z/XEzJOevmM=;
 b=FqqpcegGZLXcfSidwXQSnQCKvesciEyokTB8ipKxsrgPjY51xArxNhIg82ImuTocCxHkuuPGw
 VJFOYqL/PstDdIHfGPlZ+Z8RwhNoeEAsIRRkKI74iPOGYZqxpsIOTuW
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: 9B-9YOYny5IFojXJOQTMaYb50pRsZ6-d
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d1dcee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NBkOncM4Jvnk2V6n248A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXwoORyt2qCw9d
 CqS2T6F61ojlCCubZPYDFt7ut8HSF2yIooAtxhNcqSEXioXBIFMz0b/4bRawCV8n7O8C632lb7r
 Wv6ADPZi8PsFcud3DS0+eq+Ky+UaPnVRWnENhvpgV83yERmFNAxgpCrL40Qg4u2SF7Th+1D6ibq
 6MXqbO1O1U3TjpJz0mz86hH8vRC/QmUIJTFzuRm2M3yOvZN8riFYm6TdmsvxQMgUoZIpxLhhCUu
 jQTiWILHLJBHLBNvAgghstSL8tNI9f/34brygaVLhnLXGWecAkyQoaUHuV/fodJc+2dvuB1zCRS
 x4+eGNRheBrRvnvh5ySof7fZOWt0arUqY2tsiZ7OA0Yi6l6YqrwY0tvDmEvkMxgc9H2qbTN0U6y
 ApGM6jD7
X-Proofpoint-ORIG-GUID: 9B-9YOYny5IFojXJOQTMaYb50pRsZ6-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

Since 3D merge allows for higher mode clocks to be supported across
multiple layer mixers, filter modes based on adjusted mode clocks
only if 3D merge isn't supported.

Reported-by: Abel Vesa <abel.vesa@linaro.org>
Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4b970a59deaf..5ac51863a189 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1549,7 +1549,8 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	 * The given mode, adjusted for the perf clock factor, should not exceed
 	 * the max core clock rate
 	 */
-	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
+	if (!dpu_kms->catalog->caps->has_3d_merge &&
+	    dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
 		return MODE_CLOCK_HIGH;
 
 	/*

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20250922-modeclk-fix-a870375d9960

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


