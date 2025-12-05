Return-Path: <linux-arm-msm+bounces-84502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B47CA85DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 17:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C47C3320D603
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 16:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6664533C199;
	Fri,  5 Dec 2025 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7LOy5bb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exG5T9k/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C13E32F773
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764950692; cv=none; b=iK+7HtNSSu5WgwuhYoVVgHhRDz7AgV24w1ndE9XlCohwhHK69GX01wpWMVnEIpvA8q3R/5QGP8Hu015rpF6CEDKCAvEpNVVsM/L1ii/BwrxPI049I+oani0w6mv2N+tycv4vhMp7WnU35+oCKt+Qw2zhg41ptWCgpzR0CO8UZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764950692; c=relaxed/simple;
	bh=fHfj+X5odWToZlfvxvpunav3y6Mzg5rvPNzj7Ey0w5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OKQndqzkGskCVdiSoSL98+7uMSB/AugsiPPz4+Pen4FbOBTlNQvEXpRjFbL+gyFSzSH8mP7bZHq94dzKykaOrFdPy6l0+SvwHn+RViN4PgDSI8no/5chduBIXNV8TGtLN7k8IJZuCjuC8gaQhmkCgJNAwYWs8NU38ochc/ZvljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7LOy5bb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exG5T9k/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBHSX520534
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 16:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S0NnzglkMPPQB2vvQXKO7guesAoNPG9cmtU
	s+J/UQDU=; b=U7LOy5bboGSbSlLwVZs4P2CcL7nc86zcNEulufT1cOlbj5AcZNk
	+wM0glNsuJo/fLo7dSS28dEi0hMV6C8TcKTH8ZYf534RNfTJXbMTfc6sG9rZbOFA
	Bx15WNc1tFKnOsgnMsc0WSnBDPDLoVVzBUef9x+b30behK/Hwyp5U9Nd0ldkzZdn
	cimhA2wwSggmpdbdnOMR6VwTw3D9OZ2hv00jythJCiMoDavsuSvIgADfTOmdZaFT
	tZ6z57Ab5iHszvSzSFASGQ20OVX+96T1Gx5B7kF/XJXBTeL9qzrlyL9l15GmlEWz
	w942Hig/k1mwlXs4Rbw6NX4tFuW2wmawOWw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auys7ggug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 16:04:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93edf3a4d40so1586889241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 08:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764950681; x=1765555481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0NnzglkMPPQB2vvQXKO7guesAoNPG9cmtUs+J/UQDU=;
        b=exG5T9k/IsUBZGmfdHMDlsTEozmeIXxQdNYz/K4jcz7ABdLkaVhQwCY5vWE79+2B+5
         yOrxcvpC7LihYTYS/7C/yxSA6C/NsoTkfeBlX8PBeGq6ofSTNtvV5eI/KBCkJRZfqEtI
         5ADQwkgb5Cdg7K7O0WE7wIsi7wz+NwdXgdzsmc2yhLh5Pd7EJZcD3xTgjB+3EVW/lRmF
         5nRE09ZChgZM3kGGW/sNCG3fSUNMrVMBnIQ3VSXLTWqNPqvKAzeEOb4dchquc2BsVoQM
         U9Av7U6SmeOZ6jK2+QhPHp/+jhxcGeFF0fh6XPYG4mrngBFMO/iPJZ7a/Sz4XXa2Ad1v
         WLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764950681; x=1765555481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0NnzglkMPPQB2vvQXKO7guesAoNPG9cmtUs+J/UQDU=;
        b=WsLtE/p7iGAt2rAeq9n/deu2skgt+MSeDyW5lqh3cJyw2qivFE3xHbw11MfLDAMTc7
         uYQ0gcGAoqapsQ6uIb9Fy1Jc0T4U2GKzo97nZrprXzKOpJ2y64Swmo+S5vqmqffrfEQD
         y2pcSLvfy+AWOsGXHvEVm4WtBQZKmFWKRWgKBNmasWStWvfi3wpaNcidQTiQw9EHEIVO
         +VGPka5mJKp1SkLdkwRGO49lbl92oJnNx/xmlNqM3v4r46SdJdkXOtSBczcDeT5w6K6Y
         8v+WfQjxa+gEfH0p/BHx3LUQ0mfBL3OOKPUU5braZiCk6tQmwi7hZaRBtwXSuOI5jvKO
         wvAQ==
X-Gm-Message-State: AOJu0YwraBzIsp+SVks+DVUdXqccslJz5l6pHm4tzu+IAtK03XWO1YcY
	w/C/sckowoT7SrlIdU3gvfv3BpKJpntjLfxqtUTqe7us1NMoDxUF3JQlt2BfYpE7wuWC59rRK7g
	c3dPUMowjjv0O67RYrMy+CBmJ5HKKesyW8S86rAocXONuPyMg0D18Ai3BPuxdk0MzBVWOqImYqp
	+PJjs=
X-Gm-Gg: ASbGnctNYurKuN6bmDkJ7q8SLq+jP/BOzr5bheSyXeFTl+naS7lUXchxj7yOOdkMeu3
	F1sFdYDEucIW7gghgh02xpkhQJfQqkK6bIe3RVuuqu+WJm/9c8gFWAekBDbeggL71fYOHEA9jd9
	BHb6FplNEVoTXWkq9hdpLXi1aRwYsycdAobkFOvQoXwfNZs0qekelQpM9mos5htQWISd/WGJVEg
	E4o26q5/HXOroKNIq3jUuYUgAKnuRSMKoQMgjgvpmpv6dT2m9dTc+ch234Wdh5Vj+AV/3z2xH8m
	VxdO9G7hHL8cg6x48CUIX59j4qVI5391Xwygqgd/Vw4lrPjqTIDlQR0apA4kv/mQNV2xVvmU/8X
	QCGrf+zG73jcvU3sMTo55HUweCWaKvKy5MrhsUdd5qgqlCqRi08kggzk2obg35zBTSp7DoWjnZS
	OF
X-Received: by 2002:a05:6102:15c9:b0:5db:dd12:3d16 with SMTP id ada2fe7eead31-5e490d80fdfmr2719345137.6.1764950680827;
        Fri, 05 Dec 2025 08:04:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaamrW4vWITSAODt1Bj33kiLJnhqkPdX7g//zCQ60dzLvhU2D7W/7Fdpzw5zqhi8E2RsWqKQ==
X-Received: by 2002:a05:6102:15c9:b0:5db:dd12:3d16 with SMTP id ada2fe7eead31-5e490d80fdfmr2719292137.6.1764950680312;
        Fri, 05 Dec 2025 08:04:40 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:f840:4916:e7c3:a857])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2231dfsm9660990f8f.26.2025.12.05.08.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 08:04:39 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
Date: Fri,  5 Dec 2025 17:04:37 +0100
Message-Id: <20251205160437.259125-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDExNyBTYWx0ZWRfX9zYwxXZqpFve
 PXOCg6F8kyTDwWSIpflVLrv7zbPkUP2hrAlJw52+aQ/PrkfWqvTyf9QAjzt/ard+O7a0p7jnajq
 H3wnnqDRSkF1pNMQd1aATyFEbqQjozyauo4HrbgpqSzwF/HYm4Rse4KNnDTWnYuaT7eDPIIBX98
 /DXxgn+YUyKM6RGeNFTDa/pkgyH3MGDW1wOEGBpyqotNCAEjAukvQtIcFI1ZSTY++WdJBRWWaBD
 OJc6udzu9sBzc7qe0r14TRjyalcxR+27CZSIMOqUXp3U9K1k+GhXh8T6aYnqn+5U9KM/eRgMA7h
 /fBZXnEuOgOHKClfTYvl9w1HXapSiTbalBFxJ54YzSj5jaJN2LXzPT1NA4I3c7gJlR/s1gFtCDm
 53JwqqKBO5IrHgx0/cXE7wnfG74FSQ==
X-Proofpoint-ORIG-GUID: CtbjTLHB-EmKGFS8kok6N33EJeAVUapt
X-Proofpoint-GUID: CtbjTLHB-EmKGFS8kok6N33EJeAVUapt
X-Authority-Analysis: v=2.4 cv=GtVPO01C c=1 sm=1 tr=0 ts=6933029a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=7wYnoen6nUP2Isxy0IEA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050117

Reorder runtime PM setup to ensure pm_runtime_forbid() is applied before
enabling runtime PM. This avoids possible early autosuspend and prevents
qusb2_phy_runtime_suspend() from being called before driver data is
initialized, which could otherwise lead to a NULL pointer dereference:

```
Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
[...]
CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
Workqueue: pm pm_runtime_work
pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
lr : pm_generic_runtime_suspend+0x2c/0x44
[...]
```

Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b5514a32ff8f..97bc3755a390 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -1093,13 +1093,14 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		or->hsdisc_trim.override = true;
 	}
 
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+
 	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
 	 */
+	pm_runtime_set_active(dev);
 	pm_runtime_forbid(dev);
+	pm_runtime_enable(dev);
 
 	generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
 	if (IS_ERR(generic_phy)) {
-- 
2.34.1


