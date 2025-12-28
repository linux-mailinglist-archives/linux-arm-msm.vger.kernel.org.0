Return-Path: <linux-arm-msm+bounces-86703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B04CE48CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 04:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDBAE300F31E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 03:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF103224AEF;
	Sun, 28 Dec 2025 03:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaBQxW9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYJg4CQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA56223DC0
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766894241; cv=none; b=hafY2+13P7Fv0xYucKl7L7+sytsZddV4O04d2smfwTJi4T53tKATp7luLROBAD560dvrK7XOp52XhhOmBh3QavJvTC6joOFtqOd8swQ4QKJrEwNfvsoWjOH0tC4gwIQuTHkmDYaRhP/VMv5eUKfns9JWoWU9BW2lyJr28URW1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766894241; c=relaxed/simple;
	bh=IxKkHlJfGK7EIDe7WmG8uOdNaTCNZBMfy/15odjwZW0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hL7PjaInQkdFTuzw/7zHqbVLFoe5VcBfQ95YRv1MC/SYMnLmkZjJoINfvr7ZIapqxAYKw9k8mafo0YA6OG92+I38ycp3OXe4HwbETUIkry+/rAXXpQe+YMIsggkM9cxsY70tUJQxKYxuUq54fTfn8sgyr972pm7DpHllkxVnUFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QaBQxW9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYJg4CQy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS3JqPW1446541
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5DiAqw1ZcG0Aq/fFC+FSh7
	8xdWoL0VHM+R2OMDl1/kw=; b=QaBQxW9BLnwlb6go0IfMbEqTj8FNFrCPwySpgk
	VDFzLOLogkoMLRJje1sIqgI9p1ZLq6rpw05sf5q/YvJEQ/ON7rcltoynF9tb3X5a
	dttcc/2QVtoF/7BXmFriTnQav/opH0LlaizWeo+JNJ8hgF394p6MmXmrbOsglWdf
	kneot73LupPicCq0Z8zhYVqb0S1+xgXwzWn1LNUjdpqoPwiaGpg1mK0BG5iMyK0S
	5h8aqjq2GLU+yrxLycoybkd3VzhEfR0+tBW4EepGPT84Ks+Ut+kW+uZavsVWZanu
	vnLz/nkKZnCy5Wxx0KAnd8gGCGcDmyO/k5tJUN9hkjz1O7qQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1snfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:57:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a39993e5fso213120386d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 19:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766894239; x=1767499039; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5DiAqw1ZcG0Aq/fFC+FSh78xdWoL0VHM+R2OMDl1/kw=;
        b=NYJg4CQysXobgslPt1dyDVAtb3Sy4PnxwvMD6LPMv62sOb6GRZsoDyZN9VKvOMlSkN
         UN7Mjwv40HcX1vTMk3x+YgN3hV9u8UgOLVT7XiEKAkhuPcK7mfG5gIU05RyX9Cc1CTOE
         wd9OfnUwlECVsibvdWu55r7DuaNRJUCQr2sGxTqVTMKTVrssDFivZvSM87vRdo8Ssk9/
         gBFnlGkKaIldVGDO7vEwrCFvzkgaxP4VlQo0RpR7/rvOM1QbwiS2GuOXxK8NVr/vTL+j
         5+znLZA+3kzdkSmJygGWZiNp/ls0osW0w6eIP2QhCU6u2youptYDx9v/2vpF2ZKUTRiT
         94/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766894239; x=1767499039;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DiAqw1ZcG0Aq/fFC+FSh78xdWoL0VHM+R2OMDl1/kw=;
        b=l9DkzGTZCo9hZLgPD0Q4Lq1El2m/GWRy3c+4HqMg4cV1e/MTwFa0yHdGM2PxSwx/wc
         rCkygHYhe5iEja1rCpz+KqSqrnHsvH/BZzymU+x99K+mn7HwVuOt8e2BsFRI0jNHLoNr
         MVLz3EG71Ih5o9AeaOHAUcpn95eFPL8+eYoPH89LFKtblUUDgXsdh0r2NukBYOw7RVuH
         YvRURNSSKq/wIqhxMEIEp5Ukrs/HSJCiCxODpc1hI2LQZYduSy5hNYjd9HdcAJwBRpWs
         HIcnBZ+71n3ZuAqK5idxLSExQg9rGsSgC5Cu5uagKz8Z/bf/XUMEgY4RahVzJKEXoZg0
         4tdg==
X-Gm-Message-State: AOJu0YwMHTqA74rB+JpWiWQxjekZSE67wToEL4rmXPC1wObPfxWAv0up
	vbP/Xb9zIEjOzvbP/fIkbp+SVM5X05bXKzrVNYnL8F3kLGgXn7Bn4VTdYLiwwVgGKZLgi3Ws70B
	MfbGYIab1T3CN4nruXSMJO2GsvALpqOzSRG4Gax45RkoDFROHIUIDrTPP6WkBkFUXxNSF
X-Gm-Gg: AY/fxX7NChuoW+tC6xP6F5JhXwHngOoN4p3AbV/uJ+qt+sLst5YU/UVa/aKNs2VkQHg
	n5adGb+mbH2uh4fiotZf38HNrgov2BChmxnLk8sbdCUT5WfmxHLjL1F0Wv6HyzeulbyY+67qpkI
	t0bw+ePIRZqMuccWJqbAiRHpUInsnSEYfWX5I26jDj2SuYqfDWXLkfsUauq29inJvad7qpXu2b4
	eC3iWLswkzoU825NR6jEl+rvY4TbHndiUzWS7xf+5l32VUEMOdRA5ZETDyj3hN6TyR2CdC1bHBn
	4NZ1zJggQnfRa9medpf+zv0vSQ1f4Vg2J7UWS9QSBvkpsQiw5dpPKSfmJvuhVEoHcMMgShUnqUm
	7zpV9V7rNzN1VdZf1JXpMWZBOUhEhoSvvtyO3CXOwk3JH2ZHm7diPNHVItzD/wzAZ0/vYAL7n/x
	XPEkGPBWg8YR79OaxrVuu6H+A=
X-Received: by 2002:a05:6214:5f01:b0:88f:ca7d:348c with SMTP id 6a1803df08f44-88fca7d35d3mr363207086d6.14.1766894238540;
        Sat, 27 Dec 2025 19:57:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB33EtJboK/KgPGBeUpD01j5/RSStbmZSdsrkvyWaeKXqPomK83RZhgY6FEfKvWZqUGyTtfw==
X-Received: by 2002:a05:6214:5f01:b0:88f:ca7d:348c with SMTP id 6a1803df08f44-88fca7d35d3mr363206896d6.14.1766894238118;
        Sat, 27 Dec 2025 19:57:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5d37sm7883586e87.7.2025.12.27.19.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 19:57:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/2] drm/msm/dpu: fix vsync source programming on DPU >=
 8.0
Date: Sun, 28 Dec 2025 05:57:10 +0200
Message-Id: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJaqUGkC/62QMW/CMBCF/wryXFvGiZ2YiUKaDQkhOlRVByu2i
 VWSS+2QFqH8d5x0qtSR8enufe/e3VAw3pmAVosb8mZwwUEbBX9aoKpW7clgp6NGjDK+ZCzFru0
 ttu4Hf2sseS6YXYrM6gxFR+dNnMy094+orYcG97U3amYc3173Byp2G0Gl3PJEbgq2lUlW5iKhZ
 Zm/FEXBn9d/1ojqqs5rKkjnQRO49GeAT1JBMwXWLvTgr/P1QzLFPjpkqjGkM/nfFwwppphmiko
 mrLKarSEE8nVR5+hufhHjON4BV2HQiWgBAAA=
X-Change-ID: 20251224-intf-fix-wd-95862f167fd7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IxKkHlJfGK7EIDe7WmG8uOdNaTCNZBMfy/15odjwZW0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKqaPfxCPvQoDz+Gk1eRb2fiSIz/KJjGppgul
 ltUwZybMSqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCqmgAKCRCLPIo+Aiko
 1SdTB/9+FZOo/k16YwouZfjY4lczCT8CKZWjxl7t8IX+J3GRcQJRzZyzbXOdk3x0FqJR9hV9cmu
 5ePoLq70earhHc9O1cbxxQAb0DDNKuo+kkcZjPl78dplxB1vG8lLyqe3bcbj9Z53LfQujRjOZIA
 GZ8zL4ga8V7WJJaIse7FjFBGcvNbPwiICi+odcYJzvLuX8xlZC+OBkWMRrOhYZnMuSls6Y9Bk0V
 s867NYcwquv7OhwF/jOtN5s+MfPmgNLlw3ImCkfmAekpHp1YMnYFbZFzqEXmeZ+FtcTGRmqOAvF
 JpkjqZqUvp3nG8eNZlXrD6TgobKZi3PAaCpwEH1j5qzKnk7k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jbZH-uMLOYAYzl4eUFBC8VwLYNMCOYyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfXyjpepWEnajP0
 fFmCEoJa1fHAiuFg/yiN2Ugb4wigMhCsTExvDwWs4Lqj8nz03QNxSE6dKfLBm9ugBEP8uIQxeu7
 YyKEEvLyAQM5LJBh8RbdLw8oHuF2uUxVXOiWEL5bZTL4xVDI5WfJQJ9Eg77F+bNvsV6BcWFwjw8
 jiEsbSERCoRkEBzT1h+XAqifsC0pJ8Onijn5agJqS2b92OHwzfHVqeMZx/U02l3xyPhjgercd2P
 8+0GrksT6kwn3TpwNtcFGbcuy91oxtZrKnzGPDQ9EXzfc0DSvf8B8f7bQMAtSnw9WwBoRzN+9sY
 VsNlcUpK/q/Ik9GsDfJVX4NIhk96PcYQW85PCb0I6b4WREAo//CpAcoGvXooaO44LUtueCa4e87
 ceKVReu00vVmDbn74r7/2unztEjxoyCqHgPZjBaqB7BxDSvinMVrDGKYjSHEi33K+Pp0BZnq8in
 23CpZAbwQKdP2a30TeA==
X-Proofpoint-GUID: jbZH-uMLOYAYzl4eUFBC8VwLYNMCOYyA
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=6950aa9f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=4r7oZHox7d71xAMh2p0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280033

Currently VSYNC SEL programming is performed only if there is a
corresponding callback at the top block. However, DPU >= 8.0 don't have
that callback, making the driver skip all vsync programming. Make the
driver always check both TOP and INTF callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Fixed typo and white spaces in the commit message (Marijn)
- Dropped superfluous comment (Marijn)
- Moved vsync_cfg.frame_rate init (Marijn)
- Adjusted the Fixes tag for the second patch (Marijn)
- Link to v4: https://lore.kernel.org/r/20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com

Changes in v3:
- Picked up the series per agreement with Teguh
- Fixed VSYNC SEL programming on DPU < 5.x (Marijn)
- Implemented WD timer support on DPU 8.x
- Link to v2: https://lore.kernel.org/r/TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com

---
Dmitry Baryshkov (1):
      drm/msm/dpu: fix WD timer handling on DPU 8.x

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 63 insertions(+), 20 deletions(-)
---
base-commit: d2b6e710d2706c8915fe5e2f961c3365976d2ae1
change-id: 20251224-intf-fix-wd-95862f167fd7

Best regards,
-- 
With best wishes
Dmitry


