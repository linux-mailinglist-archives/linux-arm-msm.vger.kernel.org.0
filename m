Return-Path: <linux-arm-msm+bounces-64668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74FB028B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B6E35604CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77E51DB346;
	Sat, 12 Jul 2025 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK9dcDmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D7C1E7C19
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281924; cv=none; b=GPxAL7zH2Pi6MN3tN3S9Nsuc0kKyzEC82kgA0oH/3GjY5aW9TN80Ygh20+P/bkaLT4dpe3FUg62DVbY9O03V7fCZD+AtPAJmQE9WyjD8mmSfQGZhAn7dyH3WrH3nhMO67xG8bFXXgEQ6JzfGByuBMb+nyQ9tb9sTVx+tCRN0WWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281924; c=relaxed/simple;
	bh=nIfQUqs4DWyTyQ8X+5Gj4joj1SqszgTJug8d04v5+GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UO/VS7zmAgUloNv9yTX8ICy7ucP3YKbYNYLNovgbgH/nSvNx64lajerJxJTlGyoHu2F9mPOKtrXs2MOLp6SZX8YBn7Dtpvvy+G/YOTRDJsoMT7wt0GMx+eO+PV6QAVKwPPssNfPg6NV5nmvLu4iEhzZWH81kiEv3wy7xgpb9PAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mK9dcDmu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BNoiPf018452
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FtDMkE/nYvcymb9V2MvjT6eL01NcAA2GyDnTtlSRCMc=; b=mK9dcDmu/p4ImfHO
	j8vjU+nuAxRlrek/XbbCsHHIB3y61NLTmrvLRPnmWhwYJ54XNozT3d831EvNG04Z
	q0cXIQjTYyffeEAvretA62opuwVgGo44UV3kGvBJYKlxnhF9PSAawiXtPyx6B0Zp
	CivnL3qqMv+BaDIRzUbFWNmp2GunpYvxgTBiudpkKdW5s8jmAFE9wPiRTokDxB2Z
	ifGLzpHzPnQs8t7BKNTMpYapF5Qn+IPsKf4hXfZks1eGqX5PZSuvSM5G9PbXRg+C
	vrA78rMUIzwfEYzo9ZA+WL9B1a+CdppL5rd/hR2v2mNdbdzKyGDz+6IXgLwuBqIh
	t5qKTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf345xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3138e671316so2357930a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281921; x=1752886721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtDMkE/nYvcymb9V2MvjT6eL01NcAA2GyDnTtlSRCMc=;
        b=gu8qDujwpoprIwIEvCsC9s9v8cZFbcaHXdmHt88geZszIsqLR5NdmByQMpxkZbaIPZ
         hf7FZ9KI7SbXebK9ZzXWqDRVLT3dvjLzx71l87Ed1xwf5TAZQqzU+yyTut3Q8JyKXTCQ
         dWXqWf0uzgOcq9Unz6Sou2UHXLHwvtVC1VeciaDpITjQ9PLqw6j7Gv6uPKu5jgkv18fz
         6LrQ2oFBKnj13GoeKNB9ZKh47et8FZOUxDO9CPtcWQSjMMwJPTg/DZA6KRAiJNO2fzxa
         DYkOTYoFNDFPL9FbblYU/TGRiLr+4TjAo6PvjGkcpughDOWtVfWOWHVVD6TOGRds4a52
         OK7Q==
X-Gm-Message-State: AOJu0YwGAIFGDJMpkp+yAHtEzviKNM9SaJdM9KHSpiXyeAw31Ekp6nEM
	FND8QO++1Vl+7ZXOm3BX5xSxNcE7uBSczbvOF6lI0XI/HCzurZ1bRvb9TBdNbKKSwGPu+mRcUTE
	ruX1gkLE4xY8AiA/pEmSCjt9VCtnQfkjdM5ytC9EO+KSb34zIOcWz4fDlJTGDHFOka8fs7Ctb/x
	L8
X-Gm-Gg: ASbGnctqhMRmc48otehfJ/xzyULI7Y323XtsB0hJpZtnTLKgGijR/1u2sWlBmgGcExK
	ZiLO20qvFfqIckOjx5sm9LokW2D+IT52bo7ukzlLxaIzjAHFX8LoNYh+kFEGOtqVfr3BdKLpJdG
	FNWGbKjbZkzXFlPrEenl/DZVMVnuJVOAqMk91uksRrx5Eq14Qnn5moqUnc4kxVEmzw2sdqSv09C
	GoWen6vcTr7CU47g2zvg0pwcvM1fFNwe+CVDusJfO4kCZcaTXCQVxfo5aLt3VqYsdjY/qbewTik
	CnnAZdMkRRqWWUKxzlroOM/I+N0lwzhWog7QD74+qhpPk72czsScwKvjjAL7FhlQETFLXzJkr+r
	erkB89f4ky0YOWm3Yjn8qmyaX
X-Received: by 2002:a17:90a:e7d0:b0:312:dbcd:b94f with SMTP id 98e67ed59e1d1-31c4d4cf62dmr6563742a91.11.1752281921321;
        Fri, 11 Jul 2025 17:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkmyvyut/CURZ5YzbZaUOdCU1WWcrvWnhSu6oPk2z13iP/0OOjcK8+xnbnEI46xI8fV/XCXQ==
X-Received: by 2002:a17:90a:e7d0:b0:312:dbcd:b94f with SMTP id 98e67ed59e1d1-31c4d4cf62dmr6563680a91.11.1752281920613;
        Fri, 11 Jul 2025 17:58:40 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:39 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:14 -0700
Subject: [PATCH 09/19] drm/msm/dp: Replace ST_DISPLAY_OFF with power_on in
 atomic_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-9-33cbac823f34@oss.qualcomm.com>
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
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1734;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=czxDsq22LT+pLoYLzhxwBsQa28JP07lsZiCICURAXyo=;
 b=XhpMkCEr08Yom6OH/qj4yFXw2PuaeopNT+hn2CIYsc/UvIaRDghEcO05XoTOrr/0rliS3F66p
 QxV+5b5f5q+BLyFCJzJrnez36qE+LlI4Akf6ai4ujGbBP5Cx23+BH7W
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX86smkGEbsLLY
 KpdZ5RtXwAIOjfJW5OpJZZQggQMrgFqPdiiiRDs6meupetBB+b+sastfDoexRKhcMQXyVu0uHeX
 iBwuHiWQr1Sqj4pp9l4vmwOZNk8Ak8w2usRAqOV6urzzZIVWMvX7/wvYfvxZ9ySbfCu9iFtBwTA
 auSOX8FtqoYNr6iLyLYgrI0cMwVtlh0DhRcujY/SGWeRWr4FG32plkhTvoj9xxEkcpydCEGVAiF
 cx+lX+autRWOVO72olEilAfrunlnwwRGNizYdQmGhVxuzjc6wxYorZ4rPldvBc2FXTT5AARUL4C
 YwmqXT4YI1rUJDQy54O4gTWisOBetfdK0m7UP/ccopghqWST7QB9rzwzGaLQjyCrsj20t7YkWhL
 7CcxrMIexYtyM7CJbirVQd3PJSknQlOTSOKex+pe3psmjRKhpD/TlQOXrHJaIOeoBhFkgabP
X-Proofpoint-GUID: CVQJUbbplPjowTnr_d_H4J_ikAh9M6Uh
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6871b342 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=c02wphsZB3Yn0AVd1wgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CVQJUbbplPjowTnr_d_H4J_ikAh9M6Uh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
that if the display was disabled while still hotplugged, phy needs
to be re-initialized.

This can be replaced with a different check as it just means the DP cable
is connected but without display being powered on. Replace the
ST_DISPLAY_OFF check with a combination of connected and
power_on checks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 98f5274f123e..6535c1cccf84 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1564,7 +1564,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
-	u32 hpd_state;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1585,7 +1584,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	hpd_state = msm_dp_display->hpd_state;
 	if (!dp->connected) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
@@ -1598,9 +1596,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	hpd_state =  msm_dp_display->hpd_state;
-
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (dp->connected && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}

-- 
2.50.1


