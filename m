Return-Path: <linux-arm-msm+bounces-84953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AFCCB46EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 02:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D58C306AE0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 01:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E552773CA;
	Thu, 11 Dec 2025 01:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjbV9boF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aASJxsHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AD3275AEB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416343; cv=none; b=r/FEyuJGD7XXnN7z6Cngn/j+5y8Zcx7fxldAqWu+RWEGWW3uYYUb7g6VMs4Jmn616LuThuaPOCuQKnT5QC3/VoU7Ji62gYBwWiIwfRFEvtVC2nguFiaFGHnwm8urT3oMiFuCUjU4CZYtITVjmpP1HZg2psTAIRGimF4+DED9aYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416343; c=relaxed/simple;
	bh=kWKRDCJl43QsXqXvV30S0DLIHizgcKtZvlz0/nRqD9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LY9F/3ZeDLCSr9XQZFS2rOkmWRmOBs58Vc25UCDV02Es+XoI6C2xUG+4xObCBqigKOXh87vCgiv0xamfxpwJZlyU5r+vbgnEBUahvAQaohW4IBtI88AiMKKahxDnW/O4T03qsHOucZsNqucFznP4xw8ClPE+CTt/fu0Nm9g2acA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjbV9boF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aASJxsHA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPvD5099333
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rASoLVyrBJXhrF0h1gSO14
	X7uGDfAWAuGu7uPdIWy1M=; b=SjbV9boFGKOPGU85sUP0uH1sXjWnDG0VWfsoYu
	8fYFcsHGel8CLm8EU3thVz8dKEsSDAP8lkwQFtfYLprd+HJnTP2sl6qzyn4/g154
	Ykc9sAVzzvng7Al5Nj3ISKMs23Z5ffVimUopNm9J0PEMjRKxGqHcwN9L1pQItUTu
	C5VphfdxnqtFjMmWdipoJWDMNdypLQCD78BLYzgRDDe3gLibbqaHM52ZfrW1bYzh
	etxRD+CkkG3IeVbIQx01ICYYM94jFR9IgSYWa/OWtObiPVNHRH0FrPH22fgkhpxp
	10bNwGrIKfNpFZvsGF6jCL7lzosfD9OyKRi7ObxfXmAVOYfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayes1guvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:25:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0995fa85so11194171cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765416339; x=1766021139; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rASoLVyrBJXhrF0h1gSO14X7uGDfAWAuGu7uPdIWy1M=;
        b=aASJxsHACi+aFgxganaYqYA/MhL2wi75fOItXgDg947OWCdCJ9/i8qtpdjI6F/pb3b
         /KddFdCsZBRoxr6cbW6PkLt0FzAyvbApiw6AuIgkTSxeFKgUbAMERD7WK4sMd7qiiAm4
         4Kwp9z33faNqSKCVS4Fi9KlmoeR8LpkIeZ/SZQEnD1ZUvKw64jLyqe28fPvGSwyWPI+O
         iwxQ6PA7MA6Qdu8ruDQu8IBF/332wbRrXMSD3XMaYGBtNuNTmnzBlJiXbmTJ3tlNsuKq
         HmVVaepD6UxZglkDB95kU+94wwG9WndHRwmp015h6yQAHC70Ft3Qg3irJ1lM7ZPFdyF/
         aT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416339; x=1766021139;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rASoLVyrBJXhrF0h1gSO14X7uGDfAWAuGu7uPdIWy1M=;
        b=VP3swwydmp5Xu2+uyvKM9z+7JPulh3AFFrie/gZaUpt+SM04ycq1EjTgKRvIGz+JBC
         aAuUIF1hQbi/mmpQo/iX45EKphHLob+8YqTyD8nwCTdY65wUgoK3p7tcx7X0A2rK7xbK
         EybC5lB6/nmHlGhkWyt3PS01M2BCn1lyG+Corir5j7TP4WzIVCJlLd/y8F0c5AnjWO5J
         BQZsj9K1FKjLIeZbyEd/OnKJEaseC1F0KhoN2+G6Gj39yDss4MIRgUUwr/FSE0Gan9aE
         Rh05SKRrpun/hRAaYfUrsu6kSqZThtkJlhVqIibMsgMmTCWad75at6iT04e1Vn9x/Si/
         0y+w==
X-Gm-Message-State: AOJu0YyOXeO525qb/8pZKQJrypGzLCiPI7b5loxtuRSj3oCVyF2nrDaJ
	VSf7LaBO22/+lQ+PQgjZ5G6LMsXPr4yaI8qQ9ZDklD2cVp6AdmOerfdzY+/KHDWGx1FpOAfAvcL
	XB0vO4NLzgWvNqmedgAnhAEUS50UJu6+OGHCOjSWUe074aJ5eDV54n6IuSgI40LarDNYd
X-Gm-Gg: ASbGncs9K1eyR8WQawxZVT2qTlVYfC+oYrjSpBmD1fp9pBFEsRSf5bm69x9ktHvx7a4
	B85nltn56Fo0vegOCbL9Gbo9fwE7IB9X6cdyxNO8zrR7vEXe13Ra+Y2ZTO4fzZKB14YiBRTgiWC
	D9j0Io0DlR0oO7qcj+rSYHCSEma5Z3CG65QjT78ev2iM9drscx7C+th395zzBmQaEDACRctXz+w
	RB1ZKxSHdPB+EthCR/kXpNAwJf3fSP7whEkAzFT7mpiwVVMTuVCBwJC+WyyoQu7mxZOvPSeve2/
	ZV7dS7zVDdC3jRdRwlJq0dflmXUnL9LinlE57ZOtS4cPq4wG8AK++bJGPtspOdxjJOkC+tG42SY
	sjDlsY2QfJ9h9hD9iFao+8TtjiZxaMfG7Krnmq6phJle8vuCrXApIspazrQrzLzPSoj3ezgHosQ
	aUzlpoza9dRhvQ093KeQMyoVc=
X-Received: by 2002:ac8:5cc4:0:b0:4ee:ccd:7215 with SMTP id d75a77b69052e-4f1b1897abbmr64678441cf.0.1765416338799;
        Wed, 10 Dec 2025 17:25:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYu4ciIQEllUx8HjhR17H33wdlV8uzobQylA7fUJET6grh8RA5hdohpgJt/Dr2N3rxhiElYA==
X-Received: by 2002:ac8:5cc4:0:b0:4ee:ccd:7215 with SMTP id d75a77b69052e-4f1b1897abbmr64678211cf.0.1765416338293;
        Wed, 10 Dec 2025 17:25:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f44c70sm383122e87.39.2025.12.10.17.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:25:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 03:25:31 +0200
Subject: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIodOmkC/x3MTQ5AMBBA4avIrE3SP4KriAVmMAvVtCEScXeN5
 bd474HEUThBVzwQ+ZIkh8/QZQHzNvqVUSgbjDKVak2NO4UKKR4BKZwWbTPNypFzWlnIUYi8yP0
 P++F9P9RLg+dgAAAA
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10816;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kWKRDCJl43QsXqXvV30S0DLIHizgcKtZvlz0/nRqD9g=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6aVbJ9Nc/uMWROqX3oGPm+4XZZgW1HspTtv48FnnzgX2
 LJXXdDqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEatnY/+lnaVuvO19d5N+v
 99Gk8EHN2ZuWicfytzw9xid9ok5NIFf5yna9qQyH32UmO35pOxaT9PPUys3KkS1/zO/F7ZHxDZ2
 ZmVZ7xUDx/7xDDj90VP5HBc/82/enOVU6paX/4cXDmvcvcJ0u9eUwr3TunXy8UHhvD8/jP2//e/
 Nl9OtVS9zpn5ri+kv2dnaVb2n4xj1aylddPMriruoaHznMKDhztu6fhSrvVeQPi99fytShd0fX3
 PrK8pufPizs1Ql7e/TG71rvjuJTK6scmo/1rE266egdsecvY6D8m+tBEzaKxq9iYpH40Be25M+7
 j+KzfxdHTeXTOSSaesSvJlbOqO6HKaPqkX6Pljqfyq5YAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IXeCACHUQJDJWtoEnksReAopJ3u3Jlho
X-Authority-Analysis: v=2.4 cv=KqBAGGWN c=1 sm=1 tr=0 ts=693a1d93 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-7OkC1N2hDg87y89b1EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: IXeCACHUQJDJWtoEnksReAopJ3u3Jlho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAwOCBTYWx0ZWRfX+G3PAag6bDxU
 RceKSV7Kq3V+Qis8Ehi3HQ101hRhfMv7Gu7h5yty3yfZrtjxOJz9SKAAltyqCPbzm5xhnc3tsbe
 xswEo2QqAJRjkwDKBIbJ/gjh+/3X4MqY5JuxnaSLsCPn3lQwCBVJ5CQQ7ivKvGQA+otm75JcKvc
 LSSkCd+e+uKXtSxVY+CnN4lmDPaZCNQB/no7Bpz0sRs9Vmgkew6ROKjZoKrlzKAcV1QNfR3nbu2
 vbSkew1dB9k78/pEkgQGS+wxDUHC7kA17z5mYgcKGEyrC8Z7vnmw0VkIOloLYWepgF2uQ+TpIPi
 iME9BgZzplwgRtBPGowNCnpZobgVRh0/DzpIqEIR94LbTuW2wnzzTZPL0TTYx7yLWqOVt36tqZD
 DgiQkhXwrxaaTx/vfu77bcghdhky1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110008

Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
by both DPU and MDP5 drivers. Support for them in the DPU driver is
mature enough, so it's no longer sensible to keep them enabled in the
MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
string. Drop support for the MDP5 3.x genration inside the MDP5
driver and migrate those to the DPU driver only.

Note: this will break if one uses the DT generated before v6.3 as they
had only the generic, "qcom,mdp5" compatible string for SDM630 and
SDM660. However granted that we had two LTS releases inbetween I don't
think it is an issue.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 314 -------------------------------
 drivers/gpu/drm/msm/msm_drv.c            |  16 +-
 2 files changed, 13 insertions(+), 317 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index df464f7c05bf..69fef034d0df 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1097,310 +1097,6 @@ static const struct mdp5_cfg_hw msm8937_config = {
 	.max_clk = 320000000,
 };
 
-static const struct mdp5_cfg_hw msm8998_config = {
-	.name = "msm8998",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_DSC |
-			MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf7ffffff,
-	},
-	.pipe_vig = {
-		.count = 4,
-		.base = { 0x04000, 0x06000, 0x08000, 0x0a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000, 0x2a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 2,
-		.base = { 0x34000, 0x36000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 6,
-		.base = { 0x44000, 0x45000, 0x46000, 0x47000, 0x48000, 0x49000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = 1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 2, .pp = 2, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 3, .pp = -1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				{ .id = 4, .pp = -1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				{ .id = 5, .pp = 3, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-			     },
-		.nb_stages = 8,
-		.max_width = 2560,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 2,
-		.base = { 0x54000, 0x56000 },
-	},
-	.ad = {
-		.count = 3,
-		.base = { 0x78000, 0x78800, 0x79000 },
-	},
-	.pp = {
-		.count = 4,
-		.base = { 0x70000, 0x70800, 0x71000, 0x71800 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.dsc = {
-		.count = 2,
-		.base = { 0x80000, 0x80400 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800, 0x6c000 },
-		.connect = {
-			[0] = INTF_eDP,
-			[1] = INTF_DSI,
-			[2] = INTF_DSI,
-			[3] = INTF_HDMI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
-static const struct mdp5_cfg_hw sdm630_config = {
-	.name = "sdm630",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf4ffffff,
-	},
-	.pipe_vig = {
-		.count = 1,
-		.base = { 0x04000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 1,
-		.base = { 0x34000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 2,
-		.base = { 0x44000, 0x46000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				},
-		.nb_stages = 8,
-		.max_width = 2048,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 1,
-		.base = { 0x54000 },
-	},
-	.ad = {
-		.count = 2,
-		.base = { 0x78000, 0x78800 },
-	},
-	.pp = {
-		.count = 3,
-		.base = { 0x70000, 0x71000, 0x72000 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800 },
-		.connect = {
-			[0] = INTF_DISABLED,
-			[1] = INTF_DSI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
-static const struct mdp5_cfg_hw sdm660_config = {
-	.name = "sdm660",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_DSC |
-			MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf4ffffff,
-	},
-	.pipe_vig = {
-		.count = 2,
-		.base = { 0x04000, 0x6000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 1,
-		.base = { 0x34000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 4,
-		.base = { 0x44000, 0x45000, 0x46000, 0x49000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = 1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 2, .pp = 2, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 3, .pp = 3, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				},
-		.nb_stages = 8,
-		.max_width = 2560,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 2,
-		.base = { 0x54000, 0x56000 },
-	},
-	.ad = {
-		.count = 2,
-		.base = { 0x78000, 0x78800 },
-	},
-	.pp = {
-		.count = 5,
-		.base = { 0x70000, 0x70800, 0x71000, 0x71800, 0x72000 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.dsc = {
-		.count = 2,
-		.base = { 0x80000, 0x80400 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800 },
-		.connect = {
-			[0] = INTF_DISABLED,
-			[1] = INTF_DSI,
-			[2] = INTF_DSI,
-			[3] = INTF_HDMI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 1, .config = { .hw = &msm8x26_config } },
@@ -1416,12 +1112,6 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };
 
-static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
-	{ .revision = 0, .config = { .hw = &msm8998_config } },
-	{ .revision = 2, .config = { .hw = &sdm660_config } },
-	{ .revision = 3, .config = { .hw = &sdm630_config } },
-};
-
 const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
 {
 	return cfg_handler->config.hw;
@@ -1455,10 +1145,6 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 		cfg_handlers = cfg_handlers_v1;
 		num_handlers = ARRAY_SIZE(cfg_handlers_v1);
 		break;
-	case 3:
-		cfg_handlers = cfg_handlers_v3;
-		num_handlers = ARRAY_SIZE(cfg_handlers_v3);
-		break;
 	default:
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP major version: v%d.%d\n",
 				major, minor);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100..abee7149a9e8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -960,23 +960,33 @@ static bool prefer_mdp5 = true;
 MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
 module_param(prefer_mdp5, bool, 0444);
 
+/* list all platforms that have been migrated from mdp5 to dpu driver */
+static const char *const msm_mdp5_dpu_migrated[] = {
+	/* there never was qcom,msm8998-mdp5 */
+	"qcom,sdm630-mdp5",
+	"qcom,sdm660-mdp5",
+	NULL
+};
+
 /* list all platforms supported by both mdp5 and dpu drivers */
 static const char *const msm_mdp5_dpu_migration[] = {
 	"qcom,msm8917-mdp5",
 	"qcom,msm8937-mdp5",
 	"qcom,msm8953-mdp5",
 	"qcom,msm8996-mdp5",
-	"qcom,sdm630-mdp5",
-	"qcom,sdm660-mdp5",
 	NULL,
 };
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
 {
-	/* If it is not an MDP5 device, do not try MDP5 driver */
+	/* If it is not an MDP5 device, use DPU */
 	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
 		return dpu_driver;
 
+	/* If it is no longer supported by MDP5, use DPU */
+	if (of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migrated))
+		return dpu_driver;
+
 	/* If it is not in the migration list, use MDP5 */
 	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
 		return !dpu_driver;

---
base-commit: f2d03d96ebe8f6948cea9a47d11728f42d62d0f9
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry


