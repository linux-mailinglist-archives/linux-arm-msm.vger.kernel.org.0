Return-Path: <linux-arm-msm+bounces-81769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DACC5B34E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24CD43BB4EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EC627F005;
	Fri, 14 Nov 2025 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHVAMQjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmOaq1U0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3914327B331
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091835; cv=none; b=KhacdefpXEoljIrxu24Ri3RsiIQ9JktyGGe0nzeNqzMomzCzEK7pW5ph3VVSRU2yCMDx8TK37OD64SuQe/eNYd/4dYJWx2z1joUv6n1lUio7WqSzrWuCKEbi9kSZEzDasrP6u+4a4+8c79D4y7cyu15gACEydO78pJsIOhU98kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091835; c=relaxed/simple;
	bh=wQ4EPeLyGHhSl6u2Yto18CwT2uBhHyqQhzQUmV+w91A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NcMAiIIqdMUB6zeMc5c8CMIkO0LZyjrxiJI2GVZTT9PWMQRhcNOVPVIj1ZeAvq3/ifkAaC3xIT+S+ouMiCRIz+rWq9+aOZp5ShSiEWNwg6ZU9fAaLgWLjBlx38jIy/S/bMcV0rX17+i1i1qWVaqfKsrFQC80sgrTtt0gMi1BmvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHVAMQjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmOaq1U0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMagdm1477709
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qD3y0SSt7nzx/s6G8IYeUSznWx6wT7uGhkHCZulV5zM=; b=bHVAMQjPFU819qLV
	deUXC+gQ8ywoDtrRF8F19GW15Kt+fr5RqThQU7qzTrePlITxwpSGY63OPtKJYejR
	TXA1M+a6LVF+gnyARkh6kn6Aqa9zPz9RSUkz9Qr9rzHEOCMg5+aEvOlTWXegmuf6
	AMOoPu+gNgMTyU85ppm6Hj1pNtBcN8V2pgfrlb/GbYgiATlSZzx864OpgWQzxPjq
	KUl2LHr02hbQrWVqzFls2ynUzyfpMJrMb/KRfjKli6S+tHrr7dASxDw/wkf3knwd
	xwEQWGPUGU0mez7Ol8C67UezkgONY9Mzbs74hZ80t/Jd0eYP3KwKmLdCQ4W78CXf
	VvWtCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9drpr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb34dd9c9so43036671cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091831; x=1763696631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qD3y0SSt7nzx/s6G8IYeUSznWx6wT7uGhkHCZulV5zM=;
        b=HmOaq1U0nPVa3wTa4jJZr5qYkJMi9ehgJX2PuV7nxBaJRqgyhO1rT1bsQrlWRRz5IU
         caPOw/ZsGW49bQNcY+7v6RYMcPnBNYgj1DZpAcixV9YBNLfg/7lU7akhj1eEQEUgP0fP
         znnbaz80MCxX9aNuDCqoymnazvRVPgZ+G53lsN41xylYlsgmaV8c7FrwxfwLSB3Keo4n
         U7jX/o3IunqyVXTZZDfZogUiO352WjQEptft3xbeoZSKhUHIWyJ1ZitDKkh1pEvfpU54
         l49Jm0pfuZot7vy9QjqKodjLi3Up5azBAip+DGCZKeGdF4DhKGKKm42p8Cg9vvv5i83r
         SMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091831; x=1763696631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qD3y0SSt7nzx/s6G8IYeUSznWx6wT7uGhkHCZulV5zM=;
        b=D00M7bKnspfgSpAl6AZHlKznHRLap16aGxmK+iTmUlLSizJNac4OOBCffKtePFzNbh
         6vrC5PHhP7ccOQ8t3q5l0+K1iSxZvtc0yo/XBdrSmfIg2ZXMSjRTJ/UhZKN2xoxSnopz
         t0mFIWi8o470B3LhVr8XZvg6zP2FFsv5mSi1GTVt4MPPi5FEM+BIG8zKwF6qoiXw6E9s
         xQPvtAsiYPs56CiM46mqyqBB837R1hMCQlnh6jgtxxDV6rgussKfhO/OT4VbzVl9aiDi
         Hz7sokvpoi3K2PcBT8FfuKalwRPElYRIM2rxJ3cXks4hDphC5SmcE3jVM3vmM1XNRq58
         ERuQ==
X-Gm-Message-State: AOJu0Yx4cGCekThyMvdWpx4q5VRBuBAC814BKznVCBmVH8sUfTq1AddJ
	nuf+/gHm/kEo3WQiM00UXSjuHDjiwwX6t65dp4XlJ1HLI2wbONtYe8/OOwwKW8fnW3QpyennCPH
	tukBQ3vVzUNFtrH63SxcqPBFvOz61Uk90JSgq5coc3jy5eCMLqEA2RLowEz1F+qS/sFVaZGdzPU
	wV
X-Gm-Gg: ASbGncuY7z9LQTE3MYnCdhvHwmZe0qik8lMNadmmqZfovgVlzEWky4S08ljNh8FLWW8
	yyuNYO9DV0U0r21uNjP5ON7gApmO5vOeLjNKb33GU3GJm8vujIejNKy1kIYMebBDfZ/ijWAi57u
	+x3hoPg+uYMk/BrQBydxHNRgQjkqaRjKS7YTXIdHzEfaMb+jlimYzjhPqB3hzF9R+MILboBDiVf
	vEtITB1P7Hd/2SSd3ktyG/oh5XgZG+PYnBGqMpLHJa/8g6tmvVT6UqyXAKIJ6aT5Jv16ezPmcmG
	sl+Ozq+chlBstVD9Uyk6lko3D1u19BUO85x3lvFVAAZC4WkbJdtFPLIlATbBqa+NFOb2kp44g0Q
	GuJasj+o689DQeGhg+GbW6Y0Cq71w7euQLfVCo0TgtGvpCzYW1tdkiApnU0RvgMQBVoo1s8A80d
	45DYkNqXWNsKo4
X-Received: by 2002:a05:622a:19a9:b0:4eb:a6c5:f6c7 with SMTP id d75a77b69052e-4edf2060140mr29111741cf.2.1763091830878;
        Thu, 13 Nov 2025 19:43:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDUrZrpOfkxuu2QnCmXbhASIGTxd5Yc/oCnlPkzgq2c9dyUHIG6LLVEyybQSqLeChliuOewQ==
X-Received: by 2002:a05:622a:19a9:b0:4eb:a6c5:f6c7 with SMTP id d75a77b69052e-4edf2060140mr29111551cf.2.1763091830423;
        Thu, 13 Nov 2025 19:43:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:33 +0200
Subject: [PATCH v3 06/12] drm/msm/disp: pull in common YUV format
 parameters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-6-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10606;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wQ4EPeLyGHhSl6u2Yto18CwT2uBhHyqQhzQUmV+w91A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVl/nZv2NQywFC1k5OvxkHDZxZW4yS8sY9Y3
 R4JhyH9m32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1a/KCACP4oGXDCBhHf94lE6C6JJUX7Zb33oaTJqEUDAvc3QXiUbhOTVvGgTIpExeANy3iWRM4yx
 wElr3yg6MWQYQiDhHZrsXt81Vj2CpdLIyuIrAKaTQlhXJpwUNTvkpTk17xtooisDYj56s+3cVa6
 Q3fQyoOlUenWgA9+n8KOizJvcG8icflOOeIQhLsUAEJsMOGx0RSdRVU6EcmGS7ZVqTcCihM0buX
 UXlDVraeoY1GS33tmOX77nRPfXxBmSAUnPvByNLtvSnhAy8FtJTm7gmiDJnjbukkcrcwIxTnIrg
 NQ3ieJnQ/wZGrhLXdZWQLmg4lyx4FwnM+g7RauDvL7VxxLMc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=6916a577 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J-CC3KfA7NYzMh5jGAsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 64WsYaR4dcXFENz5_MT8hYqVLg0QEA8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX2qx6Zm/XTAfz
 4Irxuw57bL5F1Ip1xiK+u9c+gJ7sZwzKN/o7t6VQZBQ5iUETf2HH3sSxxyqxzwtOfF/vBxkwgDl
 ib4OJGd4DbZfySwnUFSN8mgMwVUtdM9fmNvU1wOLwxsyVcuTu7r1dzM5t7D9BVihwrpGCUeC5de
 HiS0iv+rAmBpg6XjrT5TN3zXp/OynLvEIIBRgiEz5J92DvyfxawPoqJikQqkCvVd4Yzfsr5dZzy
 TVLCGQ3rSsRH2cEz0k8PojWBGntUDd6xTqnLr/feG1jTz058hwM+GzNjnTsu3g965jFdsInUkTa
 1TkrXzzQGyLWT4lZYLTLUcPLwth7WfM8SwB/zSk93qM4socX65C/XZnagmJ4FkSPcsFb5kGlqqt
 BbJVszlbhKwk9/06uKaKxnZXB3bMdg==
X-Proofpoint-GUID: 64WsYaR4dcXFENz5_MT8hYqVLg0QEA8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

Pull common params of YUV formats into corresponding macro definitions,
simplifying format table.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 120 ++++++++++++++++------------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index d577b3d53fbebced63792b5c65f50dd45211c8ea..900b2de252a6eb2eac3d0670f1aaa77f7520fd77 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -244,27 +244,27 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
 
-#define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
-alpha, chroma, count, bp, flg, fm, np)                                    \
+#define INTERLEAVED_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, e3, chroma)     \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), (e2), (e3)},                             \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_count = count,                                            \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
+#define PSEUDO_YUV_FMT(fmt, r, g, b, e0, e1, chroma)                      \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -273,13 +273,14 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -303,7 +304,7 @@ flg, fm, np, th)                                                          \
 	.tile_height = th                                                 \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
+#define PSEUDO_YUV_FMT_LOOSE(fmt, r, g, b, e0, e1, chroma)                \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -312,13 +313,15 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB |                       \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -342,23 +345,23 @@ flg, fm, np, th)                                                          \
 	.tile_height = th                                                 \
 }
 
-#define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
-flg, fm, np)                                                      \
+#define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PLANAR,                                   \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), (e2), 0 },                               \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 3,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -511,72 +514,61 @@ static const struct msm_format mdp_formats[] = {
 
 	/* 2 plane YUV */
 	PSEUDO_YUV_FMT(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	PSEUDO_YUV_FMT(NV21,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	PSEUDO_YUV_FMT(NV16,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_H2V1),
 
 	PSEUDO_YUV_FMT(NV61,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_H2V1),
 
 	PSEUDO_YUV_FMT_LOOSE(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	/* 1 plane YUV */
-	INTERLEAVED_YUV_FMT(VYUY,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(VYUY, 2,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(UYVY,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(UYVY, 2,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(YUYV,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(YUYV, 2,
+		BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(YVYU,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(YVYU, 2,
+		BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
 	/* 3 plane YUV */
-	PLANAR_YUV_FMT(YUV420,
-		0, BPC8, BPC8, BPC8,
+	PLANAR_YUV_FMT(YUV420, 1,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
+		CHROMA_420),
 
-	PLANAR_YUV_FMT(YVU420,
-		0, BPC8, BPC8, BPC8,
+	PLANAR_YUV_FMT(YVU420, 1,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
+		CHROMA_420),
 };
 
 /*

-- 
2.47.3


