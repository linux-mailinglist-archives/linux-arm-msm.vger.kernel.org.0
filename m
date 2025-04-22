Return-Path: <linux-arm-msm+bounces-54964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF08A97024
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 17:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96ECD3AAD7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 15:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B2E27CB04;
	Tue, 22 Apr 2025 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsI95WaY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36200DF58
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 15:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334801; cv=none; b=TNUYwCIdeA7Drx3FzEC2eyVQZwYJ+PGdLWvX3AfpePJR+Ro8sc1Ym+EfJwC8jhMUQbJMaCHNU4XEM0SQxWWg0eOWJpiRhLos0ifRcP3Y58H8J6ukLg1RBU3D4XLMjk4zOY2Gp97A59UGlcoqY7sf2EUsgUtkuyEH30rVxHCodjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334801; c=relaxed/simple;
	bh=uPazSbaukMv5nCjDJBrBXsMPS/tiXlaUuWbAxvgDRFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A5cHn22nDXOAYL63W91b/IxkS258MpwlibvrqI4plBam3AGoxBaS1DIWLo9TOrL6K17Nd/MmIPW/r3ghf3iuaKcox30Zt8HfWjWFWCqD+iUFTH2iELdZcKrw+P88fWLy15JSmVaWKCTmbZX+o1q7O/JmWd8LK1MZ/CctwC8qhBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsI95WaY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCg3c4006327
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 15:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0eXE1c+eujdOZqvpNCZyuBCfQNqKN4DWXDG
	yTalUpM0=; b=LsI95WaY6u9av9wxEKGdSj77vlkYlvf0YQ9Ris7rGL1sZOri78C
	irYRpGPP5vLgcNcCYcvpxBF/UiN4kYzC9L1tbCd2qsjtrpJu/SvO1eKjrUs/9VnF
	WOrwB+/DQzs6eivU7yLXjxr5KoMO3AM7TRFjdWW0adGIhX3eeu52RC10DE4hf0Co
	8RIj2cRne9Pwvq1vtnVWsQnSHld7TH5AnukhRUolgQUlMzBkDygXKjHp9VeQZQoj
	W8RwWFV/gd5VxK6u+YA8t5391j8c2dm/LjY0tceCCri7R3FjHMUUqUGP2eRmJm9h
	lHlyn0xVx22g4FVUqVGFeUm91J5pbF4r1Lg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426qwbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 15:13:18 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-72b8343a031so4110011a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 08:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745334797; x=1745939597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eXE1c+eujdOZqvpNCZyuBCfQNqKN4DWXDGyTalUpM0=;
        b=i/9qiZfy7kpta9K0pmxeFt6HYAfeIBMc7TxYK6M4V5zohGN2iW3TX7m+0qv+KKTAut
         3gSdv2YU6vYzuQq53ciQ1+cn+5VhlqxM6SZZdM/Y5hn875tNWRRgnAJiBuxhUaNnBLyi
         obYUIOa3RyTVdp9EmRPdJcq1ZtQtArkgoSU+6CHbJ+U10Ejfv0Wgyay3nYhFsf3aMq8d
         3p30zA9emej9B+rDWdlmZvaV322ssFAK4Yx48JlCk2FzmWa/MHIYmHXmNePP2433xl/6
         bdvV48jI9+r/6z2BwLNzmpn8OHuPk10/bplbNXq8nBQFKIF7cFDDMdna9iEE6LiyaCrS
         050w==
X-Gm-Message-State: AOJu0YzrNKF7tCgzS/0GWYMLiOvrJn7b9snkvTNefgk/4GJN6AusfCOM
	sS7gfmwJxx84kE+wLquios/diO26LZfFnFGXPVBDtdX9+ErE8nhSGqSN5a9cKsM9xoijWeKpWo9
	GRl5Zy4Yuu8PafOc/9MMqFE/hQsAqa8YNPPZzuVqH2ZT5p1unkZbURkzI8rnwJjT3
X-Gm-Gg: ASbGncs7sCye8Jh/uuevp0FS17vy1Gvv515agyEfOC24FfcOYzaDPCD2te0b3jQcIbd
	9VjPJn+yQx0qRm4REe6g2cfs+1egYR9AnMkVvidrRioYVWo26lumzblKnAQYTECiqhnGCETeTuT
	ncI6Hr1wYsVkWwsr6GHNXqDiq1Ush4BsWQ/frJeAiW/k3XddtT6/im1Y5wG0C9L9W3utxyvHFSe
	r3vxAkB2o7Pa5TVE7nunmLhHH/o2dL79+wqtV1QIpyQYqfpbMuXFDn3TNIXJ4EK5xlWtvN26EV5
	0W/UvnR02uVYdbVC0z22TXiZnbGE3Pkp2kF/C4vyaMTgSVo=
X-Received: by 2002:a05:6830:6806:b0:72a:1821:aa9c with SMTP id 46e09a7af769-73006211596mr12334409a34.8.1745334796980;
        Tue, 22 Apr 2025 08:13:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH29UjTy52gEf1iD1SG2ZzoQEhDY0WDrzGQUF8zZOI7EJJmV4LK4GbJX0iN2LNLzDWhsaYNHA==
X-Received: by 2002:a05:6830:6806:b0:72a:1821:aa9c with SMTP id 46e09a7af769-73006211596mr12334379a34.8.1745334796654;
        Tue, 22 Apr 2025 08:13:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433303sm15403950f8f.24.2025.04.22.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 08:13:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: lumag@kernel.org, quic_abhinavk@quicinc.com, robdclark@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Date: Tue, 22 Apr 2025 17:13:14 +0200
Message-Id: <20250422151314.173561-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BUtKeroC3-ja0gtEP3Vpf3JEA63KiO0Q
X-Proofpoint-GUID: BUtKeroC3-ja0gtEP3Vpf3JEA63KiO0Q
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6807b20e cx=c_pps a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=jcYjSkQ04VlNN69X9EcA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220115

To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
be active for MMIO operations. This is typically handled during the DSI
PHY enabling process. However, since these PLL clocks are registered as
proper entities within the clock framework, they can be enabled apart
from the DSI PHY, leading to enabling failures (and subsequent warnings):

```
msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL lock failed
------------[ cut here ]------------
dsi0pllbyte already disabled
WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/0xac
CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
Tainted: [W]=WARN
Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[...]
```

This issue is particularly prevalent at boot time during the disabling of
unused clock (clk_disable_unused()) which includes enabling the parent
clock(s) when CLK_OPS_PARENT_ENABLE flag is set.

This problem is often mitigated via clk_ignore_unused kernel param...

To fix this issue properly, we take a clk reference from the clk_prepare
callback and release it in clk_unprepare.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 3a1c8ece6657..7a547ae8e749 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -543,6 +543,8 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 	if (unlikely(pll_14nm->phy->pll_on))
 		return 0;
 
+	clk_prepare_enable(pll_14nm->phy->ahb_clk);
+
 	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
 		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
 
@@ -554,6 +556,7 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 
 	if (unlikely(!locked)) {
 		DRM_DEV_ERROR(&pll_14nm->phy->pdev->dev, "DSI PLL lock failed\n");
+		clk_disable_unprepare(pll_14nm->phy->ahb_clk);
 		return -EINVAL;
 	}
 
@@ -576,6 +579,8 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 	writel(0, cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL);
 
 	pll_14nm->phy->pll_on = false;
+
+	clk_disable_unprepare(pll_14nm->phy->ahb_clk);
 }
 
 static long dsi_pll_14nm_clk_round_rate(struct clk_hw *hw,
-- 
2.34.1


