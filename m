Return-Path: <linux-arm-msm+bounces-64674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD38B028BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F8473AA233
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69792222A0;
	Sat, 12 Jul 2025 00:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boHp7gWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62832206BB
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281933; cv=none; b=DpmLvuQa1/pmzHZ7HXB3xOIDRWfRcE15Mu6kQNUN7JN05RxecXWUIcf/n30JeLrWxlygmi2EYSW8fmd/TcLVX9uPY3aL/X6M7DaXp5h8GGUaKrqEwFymSJ7hp8dmeb1lYc1LqfxkT1/IFzEyRmU6UFVFZ9rQ1nO8VilriYmlLsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281933; c=relaxed/simple;
	bh=9kVJAzY2UVngycfebqlTXxBWX8Abe2dBrz4IzUnf9Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1Bu82Vywe7u6CV88iMYf3r3VqMSPNs71qaCep+voaEuYkjRbNHI7yddeOFPpTkVB4SMtQea02pvyNibuUsbAMENWyIboY8EAVg2KEh5wqauToqcR0g7VfnI3R/+CQAyW5/ONTDotIwxike1I6RdlZNds8hTu0prbeIBFq4Sxl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boHp7gWT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BLglup021884
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7sLJEL4Y5lJZguz3eyBuo3UOb2LWXxlleh1DhGvnHak=; b=boHp7gWTt5GjwyVG
	d6rxAUCcj9DL6VBNPZR+42TaXUrC/Fm+CGZQA/7I+YeuA58sxmCBwy6Ukg60fHMO
	UZ0AQVt1Ixdwh4+Y9ZA1D2l64D2XDnn0MnZIaMGzVPlPKDiLVJAd3AiuOApmILVn
	l1hiQwLcNe4NXApwSl+OZz1Dyb4oF/97+TNVyot7yp2kJeIZ8PSmD8BLnfvLae4N
	l351z2l+Z7N+6Gqiw2Mv2ibYKGbR5kadlmLP0MLRLpShOw5ojIcBpKDOKRnuE143
	ISilALVm7hJEWuhJQ+fahJwgvNoGjGG2UrbVDm79OEw1PTLKk4Z3D6iSx4cFYjXq
	qUF0gA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3928ad6176so2403596a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281930; x=1752886730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sLJEL4Y5lJZguz3eyBuo3UOb2LWXxlleh1DhGvnHak=;
        b=XOOqAhuiRnC7CTKYOteVT15Vzs1QL23QF0ZIdUwK3JHqEVLiRPwL+mDLzAICzO5+oa
         OevYoCYv+2DUjmbl8V1BTUJLSFmSFY7cMYuu2ZGLru7h+s6NUTbzevtobKre3uViX9If
         aI1gWuyvqkje2aTrkKAu4eFlUrbFnkZQsNiPP5AXhKW2MvIk+TiJr5C3bV1mU0+07/Lm
         SraWrugQUaDfsY/Zl4EMhI4jA0RDyWMEUk9989EMd33dJZDpInyg4/XXjkA6BV2tzsZd
         TjppL5MkHyqlQ9xyGfOEiWiT5LjHL9Pwn5ygeylXZBGUUPa1V6sEQJAIcOx8Rt3w/FgY
         Ftfg==
X-Gm-Message-State: AOJu0YwZb33PqG7xZl7RpjUIEWQOzPJisz4gOucahTv4mORknEc56evt
	7n+jW6QK7LxkZF0QCjij1Ntf3Y1l8LDaTm+gCutRxGYxbUqOt1ZLvc4x0BmBMb9jIkw21B1nUBS
	BddPqwdtDh7f+RMGHVbJaTu0PqOs7+mpadRJUNjEaiO424p5rBSgu71xFXymQzFTDZrfSsM5sRT
	P+
X-Gm-Gg: ASbGncsnzACf6EMvRXyVnisp6YVsk6S0Xr2ttIN8MvukFyND5ov3KwMRX6U0bTn01qR
	XGzZTexNKeUiZqjAPTHzu3DIm9KdjP5zS1KsjDGyE58DV/kAsuM+zE9a9MrgfTkBh144qnfb1v8
	h24qkEX+GDLEHi38ot/Ttd2+j9Li0iW2t/KUU+A4XUre1eXAwyqEyt80MFRWf3uyy5i99XcVqaS
	qIbqspmKLn+FmUxf9ki8JInTRB1NKIwvFV5oyoWTNwhHxzx75UlmVNJwlzZJk92qoMXzP7DeJeX
	XUK5HQdFD1qYAoNVVdtghn8Oph3aUuPvsUqaWGoOCLIcsH30MGsgHTbxgiKnsZ+OGhwfX2ZUtXk
	BNLpFzTzZI2WUX4vaSpWNYnyc
X-Received: by 2002:a17:90a:d88f:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-31c50d7b0e2mr5926409a91.8.1752281930191;
        Fri, 11 Jul 2025 17:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwePogEFfPtz3jAzJvuYrrBkkmysTcdFzL7yxrfrSVdKodFresGxmdbEN7GKCEIj11A4IDg==
X-Received: by 2002:a17:90a:d88f:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-31c50d7b0e2mr5926385a91.8.1752281929755;
        Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:20 -0700
Subject: [PATCH 15/19] drm/msm/dp: Drop ST_DISCONNECT_PENDING
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-15-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1224;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=9kVJAzY2UVngycfebqlTXxBWX8Abe2dBrz4IzUnf9Vc=;
 b=CYGPKGabSZ/+TIsiQAZHb2A3eC/F6u/eET7zLcbCthqfB2ue7vTy3EREyb3X+n5CiyHbVY84j
 Y/BXfFJMiXUA/hiWbzM8LmB5YRERO18jZHLTmDJU4AEqP3Ua3kRWLdX
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b34b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=P6Iu8OupbF04u0vqO0EA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfXxWsZVJgaadzO
 VyuBPdEcDmpgndIzm/tzUj6A/z+CTHzrvtEXSUxcSWUL08ilkWhUC3rHIWytZtfDWPh10clDhls
 tWLx/s6WTeMYX2aFZlzZvFLBB30pmVWZUANu9W8WHAESSqkg4zadM5UeJxe1o0MpN63E81J7FVc
 24TBtA4NpVcVj5K3VTFfNjFIZ4PSSbAYEmd4238itw2w7DI755IL/SpM2u0HAnzWe37OzcL3a4u
 EZi1S6rsmGvXEs+kTAYIv9DARYxnZ3n8zLJPuhBgx1/ffAUDa1GjKcOqfi5ThIxZisceYSRVVso
 iZ1YO53K4rQaIRl4rxKET3Z/HojjrWLtLF6kPUND8un9uTBUofU11mpx2YO3rQR7pBkJQn9H+Oy
 uY/4sSFRHE43BYZECy+OHxJ2Dza9NwIIwjiKWFTMEUWfn3QWcU8TFS5dRH3tgHKRb9TVZPMS
X-Proofpoint-GUID: zVblNuj2yYLxa65k_3unvi2xfICmZp5E
X-Proofpoint-ORIG-GUID: zVblNuj2yYLxa65k_3unvi2xfICmZp5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

Drop the now-unused ST_DISCONNECT_PENDING state. This will completely
remove the hpd state enum.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c7ad61e96b37..529e30193168 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -43,11 +43,6 @@ enum {
 	ISR_HPD_LO_GLITH_COUNT,
 };
 
-/* event thread connection state */
-enum {
-	ST_DISCONNECT_PENDING,
-};
-
 enum {
 	EV_NO_EVENT,
 	/* hpd events */
@@ -517,10 +512,8 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 
 	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->msm_dp_display.connected) {
-			dp->hpd_state = ST_DISCONNECT_PENDING;
+		if (dp->msm_dp_display.connected)
 			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
-		}
 	} else {
 		if (!dp->msm_dp_display.connected) {
 			rc = msm_dp_display_process_hpd_high(dp);

-- 
2.50.1


