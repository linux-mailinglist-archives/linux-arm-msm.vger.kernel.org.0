Return-Path: <linux-arm-msm+bounces-87694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF65CF8AD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 15:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B126E30F3C17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BCC3358D1;
	Tue,  6 Jan 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVILRhxJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GthBDPoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C633554D
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706829; cv=none; b=QCEd/tXIGTtMm8VdCKGBETpNxinsi6IxQdYxjvwlskP/7Cte05yV2QEeFaT25+24eX2qbLxlaYL/YGndECZZFfFAIO3n/I52dlKCBM9BGaaLCla8L0sMdLhjTw9TB+KXRCtHrpJHsaCvBkRApL5QT17iLXwIfCSoEMhxJYXzY8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706829; c=relaxed/simple;
	bh=n/olLfZ4nDPE0Fc/nYoIgrhjqAFOMhm0RkBbmAj4e+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AK/wex6lXmCugHpJQW7K1tHAmcoN56sS1RqWRxaGhtONXWXfdy6QNOeR6eWKbP9pWHyewrFHsKeAneQ1IrqkwX92s4l9kYmHMCpZbfba5cQ06wocYHW2UBmAQYZGLiDNsmk32IiTQWS/R3Yh4ccBiAYhYtSdDlKD5sGHEEnzgJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVILRhxJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GthBDPoD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069WZDQ4091260
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 13:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaxEWXLeS4I
	QAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=; b=QVILRhxJ802/Iu/rZuFMWlsVIik
	x6sytcaj7queG6ZfRC+C6ltFHLlI+FjSq+juO26LSyyINlStscr5J+BY6gD41yGi
	azueXlSwXweuQfbE4/M3ScIIOvYaz8DuLuTmw1t5CRuPlp2qp6gBGtBd5/t2IXgd
	0u7m+qQx2KHOpH+R3G9o4aiTdrFTNb2Pm7hEwvXBzJKSr2rE2eD5QBoR2vWuZEhA
	FWM7EaAjjwROh4XSNAEJlHNxuiFw0Ph3kQrbX2NK/GugOahe261DeqsGFVhWI+R7
	R8s70pZfn6B/FX7/MEugBn1jYJUQpISbgmx0w64H7kz0+9RQE+zX4V4OsaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun8mnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 13:40:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a090819ed1so8516835ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767706826; x=1768311626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaxEWXLeS4IQAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=;
        b=GthBDPoD8aM2K32Eu09O+xaWE0Lcad4hHrqqetD6ckaM73iJ7/mLPUII1YLpEqPpRw
         jbSsz+VGvIayHqvpNW5RitQ7ezeqZ5ilaBkOu/5Mhwmpl47WuTreUFMQeElQkWr3ZoiC
         OSoTRf9LmqWpLjW013E9FifIXKEWW/HlkZRSY5zBHbT2QtfvXmvBKOnkWD1izc5J1YRh
         l28B2i/lmO+s+fI6o8Y91n7XTB5oYiBTwEHoxf7izSsgNJyIIAwu/TqL4OeGFMzdDVpT
         b1CtDL1eH1tb4C1htAjVyPaRMwek4mAvnhkseAoza3BKKFQKOl9yJ2UMG6PTKS1eF94H
         3yUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706826; x=1768311626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YaxEWXLeS4IQAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=;
        b=jpYJaSkc3RTMh6OKNweKklSxp/84JPfgpGty5tvNz43FLHde2dhtKKrIYoWeC9uJvc
         Avy8kostEOk7o3CWCzDEqIuy11pZ6jQe5THgcBHLL5UaFqrzmzi12pGm15191NbIy9r3
         L4w79uqVL2ib2lzyLPw1IIyqeuKf1x7HpNKTaCa1McKNNH4gGveMxJy82iX6+nxTqJuO
         rii1G7+CaLO5/f7cpmGWSa3k+WbdN2AO/gSddj/+/uwlh2C4k3Txqecoy0ljojTWrPW0
         yGnCSRJDxykseKCCmKRBTaeRPFbgphsgjGuOv57A2h/jtkxD3TO2hCq2dpEywJoj9j77
         6HUQ==
X-Gm-Message-State: AOJu0Yyi719WvfXMXjG6RybFMGSbPimzK+Z0Z4iB8dnKhkkK2SDFzQ4k
	7TpUkAz3JY2d4Qv9VAcvn72RVq4sV48iSNoyGECxnCutdqbwvP9BQzdsTfQD186yIb+TmHMBEOa
	IemjUfRzgmtw8sYhnwZbbk6SPBdZuTrSux7+0ZZh7RrsEDKdkmnL9glHGP/Lon0qe/ucg
X-Gm-Gg: AY/fxX4Gd0wA75Y+U7r41spQ5EWBjhur48CdS2PtpXy9CRmO2XUHBnWbY+OoYntRTSQ
	cge5IFs/gd8oRx8WyjvuCimi0WwOkeVws+F4JhRmZ8PG186TBwIu10BQs1/NE3Mf486ks5AQfQG
	X2pID8QRQyQmiQYVrebO6W4P6cNZ5ijuTemMxarX8zorPBpXnNhz/dZG87XypXSrZyNx04fzo58
	M9oOsFLpriCdMhhDyUnneHbwagGiRr1Gr1KmkZ41FuTY0DdtasEKDVdoauyR5gh/qCLKcoxrKH3
	qvzh2bYMirfFT4WJx0GmIui4lQLJmSbCcbsasuKzGC9u9DvaAwFRpcmhhgmfx6nV/CwW3OfGbIM
	hWl0/jhET4tWYZHW2iNSM+XN29Yzg14GsO7nKg4nz
X-Received: by 2002:a17:903:198c:b0:2a0:9028:11af with SMTP id d9443c01a7336-2a3e2d3af69mr30779625ad.59.1767706825602;
        Tue, 06 Jan 2026 05:40:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEieAkNkfzs8koh6Bg3dTEFf/GMuiBcAv0H5vh5UdFiILgR30s04bnX1DVzy3oeidl5YUx4Dg==
X-Received: by 2002:a17:903:198c:b0:2a0:9028:11af with SMTP id d9443c01a7336-2a3e2d3af69mr30779385ad.59.1767706824996;
        Tue, 06 Jan 2026 05:40:24 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7856sm24112515ad.68.2026.01.06.05.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:40:24 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V4 1/4] MAINTAINERS: broaden UFS Qualcomm binding file pattern
Date: Tue,  6 Jan 2026 19:10:05 +0530
Message-Id: <20260106134008.1969090-2-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExOCBTYWx0ZWRfXy9HdOdFUKvK2
 SBUpWE8C/59PZC6xyT/2uZIf5kX9u0LJJYS5zSujBPj6UvQ8sDD4uYl5+gZmjox8FyqlQjZk94Y
 WO5zWM8toLpoUsEan5EVfU8OHT+7WxJmrDm+yIluGsU/ML0Vska2Zs1EUEH9xYD4P55vURSxTMD
 oWNt0v7sVV5B5mwFypuxjQDlzR3PZ77nSfYofHWumaxOCxYFYUeoJ1XDaduFMCtK3ST4aJTFKdW
 7n4X7TA2P8zguXOzRemXTxempTVBiWRHSvBXlrGBydxGX9HKWwZduRcG2pecRRW34N6QrRM2ZQr
 pxfCtr7lsGft8coayPycXdf9OSTN1UHDCenZx2Y484JRW7F2TNXua47XlEvEHaQ7zSIpvT0YN2a
 9d87S6Slglw7Ch/ZfV1g8mJi1H6AKyUZ4famf9eOrwKotpZq0fy7hLybLllSjsKqJnx/icZaYod
 ypyloBd6TMjNP3sncJg==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d10ca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=52jqHT57hFt4fz_33zkA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: cHpOCKb1WQnGN6ZNmi_Airyf_Qtj7Er5
X-Proofpoint-ORIG-GUID: cHpOCKb1WQnGN6ZNmi_Airyf_Qtj7Er5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060118

Update the file pattern for UFS Qualcomm devicetree bindings to match
all files under `Documentation/devicetree/bindings/ufs/qcom*` instead
of only `qcom,ufs.yaml`. This ensures maintainers are correctly
notified for any related binding changes.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dbf349fc1ed..70c43fc74401 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26842,7 +26842,7 @@ M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	linux-scsi@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+F:	Documentation/devicetree/bindings/ufs/qcom*
 F:	drivers/ufs/host/ufs-qcom*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER RENESAS HOOKS
-- 
2.34.1


