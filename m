Return-Path: <linux-arm-msm+bounces-87979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E1CD00F4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 05:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5AAE30019C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 04:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1F422A1E1;
	Thu,  8 Jan 2026 04:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onlxjerQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXxyPJme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42754218AAB
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 04:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767845418; cv=none; b=Ha4sKcP/9TEmOBuU/h9U5pwmhAJJEcetkfjBWb1nvfQd1NdW1ASyPPGXCk67pyEZmVCXTeNeiPTIpL8I5+AFc8f9o9ETSHv9qibyd7srOoMNaeT1z1V7noHZC3CrVDzpb6yHmExgZajasYkVAVQuBuRGS1E0V2PHmxufyZTW1M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767845418; c=relaxed/simple;
	bh=XFhoZ5x5fstnRn03ZJ3LWbpq39XK196e/qLVYWM+ZaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lIgoRCGHcL7b2GSvKKWX8/TVKV8uJb600WuH5ibVgezYd7Sy6VhcGHWbeZAECRyhuUrXX0RrXpkg/kQlnqvC4wrpR3EinpOUDlZ36R0GZ8HiA9qyQ62O2VUINFyMSb7OElQTCkyKU3I/adrSQNO2UzkxO1qoOgihiMIhWEWqutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onlxjerQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXxyPJme; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60817ndq4049328
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 04:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FNaXqbbK1giRl6p9hVlDrl1OgCWpM3KoyXR
	PC9Jmvj0=; b=onlxjerQIFWeAk7ZPHyRZ7FxnNZ8jN4DJtOFUexuTscN6M3TEoj
	M331VNhnAAIUF4PDJhADBWpU0h2VeJ4kA4oLj7S7o47fM5vUB61J/Ir76hsHEHmL
	FlVGAKilu2mel0C885IPgA2RapHV3UikD8WRY8Pe1AA3FF/kWF8uXpYT5obABWPX
	GkF99330a9b4K53uFPXIPbGmLJ2BWiCbCxWUPiEIkJlltVGBbln/ry/szWssrhwB
	nGiOpqhxVvSbwPksi7eNCm72VL53sozHR3gyKKxNd5Ec3E7bed6Zm2JeUS8q/tY4
	mVWU2aFhGxL6oVXP668Z1c+Ud9mm57JuF4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8gh63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 04:10:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7f89d880668so2686730b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 20:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767845416; x=1768450216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNaXqbbK1giRl6p9hVlDrl1OgCWpM3KoyXRPC9Jmvj0=;
        b=EXxyPJmeEPaLEC4SzpVVm1Ejbe0EXTCZA23gfCsIX96vC77w4S68NrPCbSWh1vD35R
         fk5EM72rKXVh4yNgc6wSSBlzXbaPMosztQs/gne6DG+ivx400Iv7Vj4hA/VUjbb7ywX8
         SpktpLpEHBlkLpPpa18jpN+DGzRP2KZ89PWli8559T2JfxTxpWvCaL9DHTY2/1P4Fatj
         hBurhYdI/3ifP9o0lnnX1wDfXGER2rKlgq8jrRDCYBcnw3meTRWEhb3WSo2rPF0/bp6G
         otWopL8jTxS0OQ3N01biSiVyRP1Hvl0JGUiqGcMAE6r8kRqb0LGbq+r6olxFt/3TYAtH
         a+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767845416; x=1768450216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNaXqbbK1giRl6p9hVlDrl1OgCWpM3KoyXRPC9Jmvj0=;
        b=XnST5ZCfmjWrP0ZUH+ZaHeqKupsjpjSpIBT8gs272VUieD4Ui0bLsRFjQTQbXHziQf
         /qwbhVcQVgnLl91slcD/vgDucEdgNeWXGhNF8kYp8YptXLYYz6GWCAEB8pNYGjoPQ1O2
         AWiQgiFNLhWUSSW6HAMfeXM2D3BR86FhMl9s+CJNx6e+jNzzY+7ADNysQAYZb41IP3Sk
         fd23npT3dDL+pV7gHUeK/KeDClDeAL1dTeyY6DNxKZWJ1khQDCnsGHF7PGjOhGD2zBkB
         ZM2aAZ3cwsQf2z5Db9hjJr/0XIjZEg4E4CDSVeGp56TeMUSsbcQ4jnhwx4n/ehmiIjRK
         8+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOwgvLdDeFQf82W69iIMwYHMXqK4RRdIbOZUOiHvrZeLa5H+26hWyAH3q8dFHhVqiaRUAGWyP72Gh4g4+y@vger.kernel.org
X-Gm-Message-State: AOJu0YyWX/KQKuoWmLmqUBEPg2KUXKpJ6ZTPTDgoMOyFHHeJumK5UCyU
	dImNHKlKOd6y+U/XFl1m41ggXwEZvUBs3h3f4m6//DCvjKlZUg6Dy1X/t/L+M6Rf7q/3n2qYyAa
	K7aDRSSJakM5InGXG4xm+bsSs1kQlm7JxX6d6iBTN1yNfE8myHJCiC30un4jZyYNxqtkj
X-Gm-Gg: AY/fxX78Nb7pJwef5k1zRI6xx1LDvWJl8fZhGtudrC3ClTTXOubMPn3CwdGp74SW1Cl
	pOVSPoaO2XEWOyp+lU4HI9oHPYUWGsYe/r0C5kQN2ui3Kss8GPa9xHuyw8YJX1e6kWjj1h49lmY
	01m/tnzfRwPpvGiC+KXvq3vyVQZC6yl08pJQzmLqSQ8SfJfZjnWVav7LdJgKeGTPvh/MU0+yVtZ
	OJ7hwtwavgeVpWE+IPo0yzHhTqAzLfyzbxO5tYhmUaVHpoOFQ2926jGQTKJx+NY9EfWyHTYZL3d
	hm9a+KuoKD7vIb7QqDlOPYa3G5RFMR85xg0qDHK3EoUExjI11iG1ATFfNoyHcU0/GVNw2qt4lIY
	5RrP2+6bgcEb58B1YlabdCqJy5qAtiX+DvAzyb2UkfmQ=
X-Received: by 2002:a05:6a00:4097:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-81b7d8629ecmr4663794b3a.14.1767845415666;
        Wed, 07 Jan 2026 20:10:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsIsj4G1RlZDDwzB00zO0+YeLjBmdALSvffZ0JT8wd8df+o3ycOmGhKJrOwI2gH0oVv2Z2Tw==
X-Received: by 2002:a05:6a00:4097:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-81b7d8629ecmr4663773b3a.14.1767845415048;
        Wed, 07 Jan 2026 20:10:15 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f88casm6201921b3a.34.2026.01.07.20.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 20:10:14 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3] serial: qcom_geni: Fix BT failure regression on RB2 platform
Date: Thu,  8 Jan 2026 09:40:06 +0530
Message-Id: <20260108041006.1874757-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f2e28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-jOfXJ57FaXOfPmQh3oA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: K1dekWfgWaJcUk021V9_RosaXP8B5cPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAyNCBTYWx0ZWRfX/zDezLmsIwaa
 Mwqvvb5tvH8KVTecJWwYIQk9CAiY49UUkB/dZhdwRnTdC8gC/ftI5de/VLXRqrFqOszNhgibHQR
 AP7sQz4Trs/AMHQdKylzy1yBVNdrfBsxSuwWK1Xkm88peSfhXuyZ7/kU/sfNv5vIOt9MOzeOlE3
 x5yl6pVZSqwX26yVVay/YFXK5cqp1mjL8IJSFLASn7vEx8fvRZccPTRMZrKkIz0j0LjRRD0Q8Vm
 n/wbR9IrCd4RYaw1MVNEBXkh4mpwS4stEUNrYe+d10/0DPY+D083yRDiEEUUDw7Rl/7ksQS109W
 1LsY1R5mPtPYiWr90JtV707En8Oa40CBGqQvpnUZ+c833PxZ8wmz9pCfXbgYmEC1EMtorZtLCCJ
 wfhIrkpziCiTq65MXMfBSiNexadruNP1UFLGwtLr7Kp84FNOLmcWSKszLC+U3x4fBFAPZAfFDzA
 8VD1ulyXAg/uGC84F4g==
X-Proofpoint-GUID: K1dekWfgWaJcUk021V9_RosaXP8B5cPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080024

Commit 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial
driver") caused BT init to fail during bootup on the RB2 platform,
preventing proper BT initialization. However, BT works correctly after
bootup completes.

The issue occurs when runtime PM is enabled and uart_add_one_port() is
called before wakeup IRQ setup. The uart_add_one_port() call activates
the device through runtime PM, which configures GPIOs to the "qup_x"
pinmux function during runtime resume. When wakeup IRQ registration
happens afterward using dev_pm_set_dedicated_wake_irq(), these GPIOs
are reset back to the "gpio" pinmux function, which impacts the RX GPIO
and leads to Bluetooth failures.

Fix this by ensuring wakeup IRQ setup is completed before calling
uart_add_one_port() to prevent the pinmux function conflict.

Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2 -> v3
- Updated TAGs order.
- Removed uart_remove_one_port() in error case of wakeup registration.

v1 -> v2
- Updated commit text.
- Added Tested-by in commit text
---
 drivers/tty/serial/qcom_geni_serial.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6ce6528f5c10..e6b0a55f0cfb 100644
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
@@ -1901,11 +1895,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
 			ida_free(&port_ida, uport->line);
-			uart_remove_one_port(drv, uport);
 			goto error;
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


