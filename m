Return-Path: <linux-arm-msm+bounces-74550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE62B97C5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 01:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B47C72A6239
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 23:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C53B21348;
	Tue, 23 Sep 2025 23:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABnV+FdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C84301705
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 23:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758668646; cv=none; b=G3ZM+5ruQUT4e4Fs0DnhgamCij7DS39EOMQc9Nv32PcXXEEGoRJGu+WjG8s+zMZpiVHqwyIiu3h1fAO0M/EiCeqqaX8+wYeDzjvN3DFD+XiPGElaXiz2Hte9wjNSrPT19770TkNLlbkX3uymrd9qiNXVVYNMA2d5UbuNWFheVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758668646; c=relaxed/simple;
	bh=fW9hN+Uot5XeGTW0vGy7LlwwOKsTVabOSGy8umKLsfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kZh3YA+RgW4vTZlBbZtc0u/pjBXosTJCUfLTTwe1IR/h8ubhKQI9wMunuCQTn9G2XXQHlb+2oSzcrIHLmboVG3vxenxoA1txQ60ZV+fzuvv2mTvkJ0vzeGUh26WmYSB3rhy7+STPM1by4LaCFZNAJ5dshCTs5tMFJDsNsSiwbOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABnV+FdM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFF1gj007384
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 23:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=58K3+b60HdHpTovM/JEe3D
	u59tHhPSrkRIfHHVYoxDc=; b=ABnV+FdMXhX7JUNBe15zXa/3R/etn09KLf7J/0
	vbec0V8l7Sx3wLsOb1Ln6FFti6YiDWoYrMWafh3HTuGwLmq1ndBSMobZ7rXh0uLC
	WkxY9s1CMqMN4xSDgnOAt6JrcAhMCg4x79EfnpM/4+mF9Os8DbE0p+GVyBdNmmHP
	zUQpjlaefYyXklr01umgSofiyjJOxYfsKyVF4VniysnrX51r+g7Krw/SgeJ4tnz8
	0b0ZNdHcI58c0q09+gXfOeMhml38sAHV4d9M8Z2Ollbl0HL+lQowOOvRw1sjW+ph
	Y9tnqa6p/eV1Rd48l9VroTCu5MJBXR3pOtrDQERzQe4wgI2w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98ja8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 23:04:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2699ebc0319so64524315ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 16:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758668642; x=1759273442;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58K3+b60HdHpTovM/JEe3Du59tHhPSrkRIfHHVYoxDc=;
        b=onx6SOu/oveq8st71Tb5A3qGgNpy9u76bqym6PRDo5nTL7a1ajvnu9CcdkGwwWZMk2
         MghODcnwAGM3X4ePBn1W9+axecoPCu+B0fl6BwS4xFFGFHQ3NydR7l0Ny/pOyb8tzmll
         Ogf8rs0DsY/+ukdck7qsn/uj4Gx2M2J+lWrfCdQUgay8rC3eRU2+fRzHv5Z1azdcGHU6
         zT8vccVsTquO8KqxZrjiId4CURrML4ZboezGhSji1Ihjg6+wS5myFW7LALDh7oYNuwdu
         D2HBUkN7HKScYQgiipjhAacGf0WRe4rWj5fthxFYGPEDKLMQsnrglkhKeGI10ur9y3SP
         FNWQ==
X-Gm-Message-State: AOJu0YzahnUwoYszSIBlL0/7pShZLd+ZEeyLG+kQQ9sNVFCGjvAp7s/z
	lMqOceiJvbpg5pkchW3furP+cP6DlJDJk5G4bScMkGOHVn8BtLcv9l+qDo9YrQyYba09Wje0JnO
	iBRC5zO9tZcQRCOeIif1KTrnKb9axi3loJAGcDYa4bo5XcEN63uy+eZTspf87f4ApeYNI
X-Gm-Gg: ASbGnctMPlTokCwn1cflwwnlpr0OLvlyPK75/y2EV773R+ZHdhtDjYzxUQggCOFvKpW
	h1renjyPVeN/wsp7dt6GBD1NwuTTiP46SRvqetA9Eb3VcRfkBmd2R4Fwkrnoa/vjdlp2LztxsDN
	vbZmGK19fpd6UGGo+utgskmRPcejoFd4G3CiB9FJyFnAvon/D/LDvnjPxKo9mkNCNZVaLRVfIVs
	xR5KFXtQx4HeZhtEjuViY925xjeHZNexEVP1PokOHtz3Bbq/h+Rc7tTqtBY9/KCSB2UNTQAPrTa
	DZACMlJpuXyqCLz2Xw6oi4KHglt5B4+4asC2/xFxdymaFo2eJpbb5bJ9XO1LmhU0KQs5HWhNwvL
	nCUxalkPzuLrTi83lmGvVfqiD
X-Received: by 2002:a17:902:c949:b0:271:ac7a:8f18 with SMTP id d9443c01a7336-27cc874ceeemr61296395ad.43.1758668642028;
        Tue, 23 Sep 2025 16:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWMuXsMqeWdHfG3Q0iSdhZ7PqeKemSONOKLfnKqk8Y8tAkzzt9izQUa/a6kjFlS0LoMYgzhA==
X-Received: by 2002:a17:902:c949:b0:271:ac7a:8f18 with SMTP id d9443c01a7336-27cc874ceeemr61295985ad.43.1758668641543;
        Tue, 23 Sep 2025 16:04:01 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdb4fafsm264159a91.17.2025.09.23.16.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 16:04:01 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 16:03:50 -0700
Subject: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFUn02gC/22MQQ7CIBQFr9L8tTSAVqAr72G6QPhYYlsUlGga7
 i527eYlM8mbFRJGjwn6ZoWI2Scflgp814AZ9XJF4m1l4JR3VHFO5mDRTDfi/JtoKehedFapI4X
 6uEesequdh8qjT88QP1s8s5/938mMMKLVRTqNRhycPIWU2sdLTybMc1sHhlLKF/pr6metAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758668640; l=1426;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fW9hN+Uot5XeGTW0vGy7LlwwOKsTVabOSGy8umKLsfY=;
 b=0WPsi2JqiBm2EAsShjs4ZE0gIwAhchYvRRbOHTVrR4FFGzoOoV5ogBbXidPFi9QwWPCyDf9Ir
 LbTKbrjVP5PCMP5epH26433j6V5fCB7+pSKqa5m+cWHNu7z+Q2uaEmG
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: v41NAAETtP3WOWvFGijkkM_TLFnCQDI7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX9KZGov8ALd1T
 M+QeXIJ0rGw7f+cNusPZtU856R6ElnhaOmQk5+XTqagvtSVTnUmIT7ti4ixRVAL2moT8YayGxrA
 2vj2SrZFwVOIZHYvX/unHfVzk+L4MDRjSzk14w2EEMnUmmDuCZb86H2t18EMvRYCMdsusSCtNKq
 mL/889cAFDkZ8PnnjEJsbXMTRSt37ZoYNdPQJ1mvE40gXYICrQES6qmNfwqHHC7fpWoJbMSNwzt
 F5/8BhtdudWaYfeQWh8qZDlSxu+O7hgccTYO3WAdKvXedI6VG9BXHgr970OwfBBvvehzT+2M0Mr
 IyvWv472X6xQdO3DECOHB3a8k06beW2NH2tVA0KxAuhdn3uexGHjGQkB1dxKyQLNpNROUzS25iL
 wOC63AJ/
X-Proofpoint-ORIG-GUID: v41NAAETtP3WOWvFGijkkM_TLFnCQDI7
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d32763 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Vw-sYGc2aXT8tV8L1nQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Since 3D merge allows for larger modes to be supported across 2 layer
mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
supported.

Reported-by: Abel Vesa <abel.vesa@linaro.org>
Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Changes in v2:
- Divide adjusted mode clock by 2 if 3d merge enabled (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4b970a59deaf..2f8156051d9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1545,6 +1545,9 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
 							    dpu_kms->perf.perf_cfg);
 
+	if (dpu_kms->catalog->caps->has_3d_merge)
+		adjusted_mode_clk /= 2;
+
 	/*
 	 * The given mode, adjusted for the perf clock factor, should not exceed
 	 * the max core clock rate

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20250922-modeclk-fix-a870375d9960

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


