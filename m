Return-Path: <linux-arm-msm+bounces-87788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E166DCFC3C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 07:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB5263000E8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 06:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0345C28B415;
	Wed,  7 Jan 2026 06:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1T6H7cY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adwJKJcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7067028C849
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 06:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767768527; cv=none; b=SwJ4qNfG3NmX17PDkYtpRUDPd/wrkfHTujWeuwZRL0yyqBbSI2f3kfYsSYTQHT/L3ocgHnfMdy4ZlXGew0fftQgHTby9IKRGAVnT8fuur3Ms/r/KDtqULV3C2nzAkCzwtb+WCDA9TDr9FTpNK/rBKy9mOogSyCci29qkiJkCBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767768527; c=relaxed/simple;
	bh=pesAjfavjb5Yz48Nmc0KgZVkETybNrrExJnN9Nb9JeA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ep33C2+Ch97rQrIEIECItHQ+R3rhnFYk8zTno4k0iFr3Epuo2mastnc9bBzJzfoYK65tzXf79BitX3KR+RRcpKhUOmkHwEmKm1b0Cz09EHC+yEUBNGyOl7St+9sEC3rNdRJfsZTch9eaCh0yZcjdlV8pusj0L/aFM5sPX8CKzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1T6H7cY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adwJKJcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074GT0i805119
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 06:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4bnEylxTkLuKxt75YayPjSupmukY0oY6rK7
	ctJ7Yfyk=; b=Y1T6H7cYBO0pVgZv6/iJW8hbNJSvkWxokIm7l7hy7g/dkftRnWh
	c7K370x0wj5e3lrLycPot/BYlPh4bRJHlx512XXyp+hjOA/n1ZEtPMOuTTCv6tZF
	AWbIYKld7dtfj7A+Kfc7Wyk+tctJt0AqnS5qoJRV6DBxnLstm0Y6aQh4E+/+J7bY
	RanTwt0tibRhaHx0qT9eE46PYf42aYO27c1zX5CTjhSsIbRu0Ib6sgeROrgB8ckv
	W8dVQCneCz5S0uhaonOg4hkFw5l5GmQ9ec6TmGwik3V1+y5gyC+pHXJM3RODR7m+
	rcaltfz/+xKvdLxWtF9/4qYW2ASU2NHClHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh7t9hukx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 06:48:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f4822f77so37550455ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 22:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767768524; x=1768373324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bnEylxTkLuKxt75YayPjSupmukY0oY6rK7ctJ7Yfyk=;
        b=adwJKJcGV46uf3GQb4R86/Yoxmqzbaah9MH855KorpzohNXrn8A9rny+Etb+tVttMU
         fHDyjz8foMe7XZgabgSpvvSRJUD0Q/G6sazYxtljXoRtAxmfMt1Aq3nWq4P/oLQKdYXW
         dEBmm9mL5QAtRxn2l0Rlp1sSLO44ZvQku8SgwF7Y79XtEztWzv8JzIMLmqi24LLmqKTM
         zLOHMZ4CHiMp26dUsZh30hoV1d5/Q1l8gtBapNbjw7syYUgmtzwoVXI4TY1AD9GaJ2Tl
         VwX+QcuZjWEoM6X5bN/1mxladaJzHpLgOMDf0wamRqx8crvoG46zqRHJsOpVPILQVRWd
         kh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767768524; x=1768373324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bnEylxTkLuKxt75YayPjSupmukY0oY6rK7ctJ7Yfyk=;
        b=Ei7N4ZiyGTdrZBrqjYGsLKroGochgsKp9yD7emuOjD1RikQfZ4l4HVZPCLue+oJNbw
         uCCxzOtxv6sGl/FliaMQSdFsYWwH/iYTxcOV48drZvovmRZaMUETwK6ZOlk5kYIymyrd
         8+dEErzi1eYzP6q0ykwY++dgojp8kfnBDbykB/mkh/2SZGYNMphKTeSA7iMBIlt8luXa
         KUrsNVlhVSSQclxVTAOYezlXNcsaw0tJZqaAlpoaysyGWxCPP+EGbwl65n72CAvZHeB0
         ByFwbus0qgD9nowEsmMgVetP33NZdomRAZ7+gk4S89+lr6jDNMU5HLtRBvDCjgMK9GJ4
         92Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUl0QFwyiLQ3ALhX89iOYGNEQ7mVGoehSO2pP/0+YMyzk3iRivBirQ8ts/1X+/X/QESWK+atHwZtppUyyPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDd+8d8gfC7kmQVey5bLL9fhDAyggJnaDRpOIqOG/mOdvpiVw
	YJhu8rc7DUHaZbVBf+h8HROnQsSTs7bjWQo5tLns5wbYLhFI1e0+zyjX25zudftnAw1tXG8L8LQ
	aGVgCVIlV9wWCkJN3rZHtsOWBpo/YmtWGFaKEkC4xMuFK5qalZCWPKe7BzuJz6RxUCaRd
X-Gm-Gg: AY/fxX7AYIBcmeB8LTeGG96GTQZO7X0zEwxpPuLCYLVNUQXG6F9o4fKGm5zOG9QHzne
	8m+RIPGozdhRIxQqu5Q4+HuMCVSa6VEJY3ohDeqZB9Gmzsnr1fe2ahtl3lUn+aJjN/tVW9SjDHq
	5AQj2HCiEUZQ/FwuTgfj50+7gT16COwYInYnan7VRsBHvbDaVesuemsdSPs96EyPpktTIWV1A1W
	7lyJWLEnql9/LWwEhC5WnLCik/zNstdjzNRrJmwgRQeqOquU7dkidGHfferHoUfKn+d78fFOQmC
	BTCyfeY8MPZy9s0YKO+CiIv9bZEScP1loYkqU+B8TiqPVknBl2ou16r1iqC/7sb3sbC9F9pSud+
	/d+1u+qkIEsjBwwqlAkIG0jv5Xdh4jd6Ty+57XO+ujYM=
X-Received: by 2002:a17:903:90d:b0:2a1:3ee3:d00b with SMTP id d9443c01a7336-2a3ee43617fmr16424585ad.13.1767768524317;
        Tue, 06 Jan 2026 22:48:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJnyGcPH329JYVtNX5I7+iidPLzPe15TqpxTY0u7lIcQ9H0v7zQAVfgXxaKG7WhVN/L/3/jg==
X-Received: by 2002:a17:903:90d:b0:2a1:3ee3:d00b with SMTP id d9443c01a7336-2a3ee43617fmr16424365ad.13.1767768523733;
        Tue, 06 Jan 2026 22:48:43 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4796asm40390805ad.34.2026.01.06.22.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 22:48:43 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2 platform
Date: Wed,  7 Jan 2026 12:18:34 +0530
Message-Id: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fc4omzRmkR2wgxaLll11XDnIR7I4ULOn
X-Authority-Analysis: v=2.4 cv=QfRrf8bv c=1 sm=1 tr=0 ts=695e01cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZHrvK-t-B7cf9zsPnwYA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA1MyBTYWx0ZWRfX46qM4igWM/bs
 AK/I30QfuFyNGZKoHRtUlyki5Defd5GJHM4nUt1OOH5IHBHX5I8rfNA8F6nNH8abVT+L+BKzJ0T
 UMlHMFJwq6aRM95IVLWAf1zzf/ZQZFKxRukpbAxHUvxLSkmwqhgBTJHiaX9wqEIOqxlQqfzDmI9
 150Ed7dAMzxd2oBh0msrEEA0bitPurNQvmTf4nd5UHXgD7xir4vJss3VEptPV2KROQvJPjoyKeg
 VdSJ/wCKvqQOJ0H3wJtc2VUnSRMhE51oiBL4GSs47J4YxvD3W45w+IXnkMz3isiLUGctjiWimem
 +z1JtP2HamKKDbqg0HLyqBgrGQKIwBQlVOwWvUBuwlzumbvqt5fNyS3nOFPdWboTIrJduLvDvXP
 lCxjHGbYqxe4xv/dc4F9bCzW5H9FUSSwGiunXbHZ0tVmsbIoaAsFrDY6SGsaYxlc9b0Zq/Bg/L7
 D7NknNGDocVJqWvEWFw==
X-Proofpoint-ORIG-GUID: fc4omzRmkR2wgxaLll11XDnIR7I4ULOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070053

A regression in linux-next causes Bluetooth functionality to fail during
bootup on the RB2 platform, preventing proper BT initialization. However,
BT works correctly after bootup completes.

The issue occurs when runtime PM is enabled and uart_add_one_port() is
called before wakeup IRQ setup. The uart_add_one_port() call activates the
device through runtime PM, which configures GPIOs to their default state.
When wakeup IRQ registration happens afterward, it conflicts with these
GPIO settings, causing state corruption that breaks Bluetooth
functionality.

Fix this by moving runtime PM enablement and uart_add_one_port() after
wakeup IRQ registration, ensuring proper initialization order.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Closes:
https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6ce6528f5c10..46a9c71630d5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1888,12 +1888,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
-	devm_pm_runtime_enable(port->se.dev);
-
-	ret = uart_add_one_port(drv, uport);
-	if (ret)
-		goto error;
-
 	if (port->wakeup_irq > 0) {
 		device_init_wakeup(&pdev->dev, true);
 		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
@@ -1906,6 +1900,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		}
 	}
 
+	devm_pm_runtime_enable(port->se.dev);
+
+	ret = uart_add_one_port(drv, uport);
+	if (ret)
+		goto error;
+
 	return 0;
 
 error:

base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
-- 
2.34.1


