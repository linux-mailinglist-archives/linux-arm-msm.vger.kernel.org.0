Return-Path: <linux-arm-msm+bounces-80953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A271BC45D61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98AEB3AB295
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D678F30276E;
	Mon, 10 Nov 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKMlWElK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2roeJr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B97303C9A
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769485; cv=none; b=gTA2GrwmdOtkLwdLHPgy9nyuCvyP4NzMiuZETSCc+fnBMwoPLXEUFYjO1N885G8QcshtpnZDup55pJT38fday44i5YHQACgmQT5WswPvw5kBpDzrkgycujzwk9vP7RMicUVHE8X/w6JSVuqiF0ojRW0mfXnkVZX7Tj93Mrde2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769485; c=relaxed/simple;
	bh=3MmH4Bjr2SUYfSC06/7l2EMAWT7nvko2RgTS275ajH8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pKkD1Me9d5Hsn1+jZfRLrWPcJ/wn/1V+lkw/Bw62eO2hh4hh/66+T8FGihHpPOhZHR8qlz4hHjnRXiQR3jdT1pqOcLkEtq/tl0rJgWRPqvF3ocJvSesdwF2HpuPjvewcNJvdKgxVp1Bl9ulBq7NFuHjNYOrfpVw2IaVpyiB3B6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKMlWElK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2roeJr0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9Btss2868046
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aIUG23oGUUb
	tp71kThpqt2rbn6aDG8VBqhkN/pZK6V8=; b=MKMlWElK22F8zXCXPC9B3xV9S+e
	IejF/OmvyY4wJeCuUCpbePvtDu9wNg62dO51g7BaHO5Tgj1KFqGDDjnL2u01d2xi
	AHx2vXoXF69wfBgXDCrdH/anSXM2WynXKsMvezcz6S7g2ZLOVOsZb0fXlfdSWcBl
	jxDr2P7z5GL0K5eORgJVSA/F22OB5KUYDU2GqY0WAT0+sziLJU0IHcTLx+9Cl7yC
	190tMDnd3eyeHV/Wz7LHS5+r9kHF1+cBExNywIJ3+B7xZErQClRCDt1D1njz8Ryu
	TZkoNjerWPHrJn+qSarpj1wko3dd4hSlg9qqv4YbLRsan1ue+H3+Ss4lxmg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7607jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:11:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956cdcdc17so36811715ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762769483; x=1763374283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIUG23oGUUbtp71kThpqt2rbn6aDG8VBqhkN/pZK6V8=;
        b=C2roeJr0Vfy4mHL17UjSBssF4VTdLZ+m9pOLv71HWfZTbviStJxvcPaw9RHNU8JvPZ
         ZshVG/Haz7dGxe6GetFMf7Ol968H/dyDyjpFj/NBhSdVg6pHCYYsEI2V8AxDQTG2tcb6
         hC+ekANwnGbftl+kPNeWZe8Ct7lULZggKXjwx1doogAyPWCwlybOfhv0D9jfHIOQepLn
         m4vuOitZ3KoyMYlfxLfkYGrhyAipb/5ZHiKA/pbn4XDZZpe0NGK/Sl7Mtg1lAzd1Mgs4
         DB2O3eIbpWWNH6G3pAwC9LAmlhDlF7/utWpb98c6ucFyTi8tvB4xtJ7ZXC1nb7kKOKK5
         2eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769483; x=1763374283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIUG23oGUUbtp71kThpqt2rbn6aDG8VBqhkN/pZK6V8=;
        b=ZivkwQ4e+9efvbq4LHL2bMqAgnn+ybbe1BY61AObgKHGu5VrciPsyigcY3bsXmJQkh
         L8FGPq9TTxTcSPnwiwNkkmXWLAQR6i37ShJsS9B39J66Fml73hYbdmma3ju5CLjJwwKH
         w2HS2JAGAtCT+yMXlDhh6HhyJpxL7nNeUL1+/+thJF5/8YtS0hGqD7ZK3bfc7BrKqV5w
         zf+3vHnpqRzw+cKeQou50VawqWbW1xm2CS1NK54PLWcNtg/sPjM43WkwMwDotr/5ybK9
         chDxXh4UrRQzVMjXTv3hdwcioNVjn+JgyFdRWewHpjQt/yC6ZVdz2+u2vAk4XcNZq5/7
         FoDw==
X-Forwarded-Encrypted: i=1; AJvYcCVbzSVocNUiSQDsvedKt9d4jXn/OJZ0BSss+RX1JzwT4fsBhsqdNfntCTOrwi3vonr3MzgNXl4JrzprcEWd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fvFAZFKFMedEcil/n2UPhBEIiK2Tak2rsbJngDrVN8xUT4T8
	zFWEa5peOHIUcUhfZvPWtNjVzoRK4nONvzKtrsjli1w2e8a7mbr63twEAJEetMf+j85VQPM+i9r
	kCKOfMEoHSQeMJ3DbY5MMhttJOCcwsCv3PGe4hZW5wTrEeswlruB+zp1Toki0Z36Xe7Xl
X-Gm-Gg: ASbGncumbGrdrq4Cg/BTjIjqgjg7KEd90j14aCRdmJVcFsMObNyal9/VppPsAkHdDLm
	GlsuUwYurc0mKGOWG1NLUiQDhRL47nsorAQIrnkSWBsS1hmNnuIfRrlt2mdZAYoVCYQB7Sbko4X
	8DkKaP94nlqtXKJCHsApR9E9nrOhe1KK3Q6U2RSBpzc4ZeasLmyiGlTadh1vTbaBAiWAFvCzdbG
	9CuT7uvJcP/+6REFIv4VaK2AFCqxcXVfY3nIGoUcd3UJljklg8uhX6IO6M0ZbBXGuqr4PYNKC9O
	qtQqOewU7Prnu1jXUkGLfQ25chgXoD/WwoRqlEnlFLueGZgK8HJwlSoJdGDsuUEaAOA8vO1Dh7x
	mmxHGCAyE6xHXeUsSuA8xptC68lShmRMd
X-Received: by 2002:a17:902:daca:b0:295:6427:87e4 with SMTP id d9443c01a7336-297e56f6b25mr110161505ad.40.1762769482620;
        Mon, 10 Nov 2025 02:11:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvwo7tDFkckMB1RYRngONUauo8r5h6ctHx66OlgTqrthr8D3LxInO97cjEeA1eGQMxf+o6yQ==
X-Received: by 2002:a17:902:daca:b0:295:6427:87e4 with SMTP id d9443c01a7336-297e56f6b25mr110161045ad.40.1762769482041;
        Mon, 10 Nov 2025 02:11:22 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297f2d9c971sm60180395ad.55.2025.11.10.02.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:11:21 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial driver
Date: Mon, 10 Nov 2025 15:40:42 +0530
Message-Id: <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W1lkUmG0hFIiC4JDVcOaQ8x3XZBHYo-n
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=6911ba4b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TBRyIjXBjLUW-Ng_AUEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA4OCBTYWx0ZWRfXzmqwMYYC8Z7J
 kARZwPFZvCm4gqIRlAssvs1tu3BeaRWqx5DAq8ASgtUEqD9nMm9rjOC3i4vHTFMlO8d81qcLrlq
 7ert4+TumwOOoqEGBPSouoUgB6FmtY7PQdXhTKrOKWW1C9P2YlKCrzasu4ckPbyEQxbH1gwHxKW
 6pJCG4Bq3Q+oB0QHYzqcF1J+ekx1y5PgMSzE04z2JDO1lmF66/jscsaCcQkc/JU3FINC9EF3hAV
 QcDPxbXrEr2zxbQ2dd1LRKLVshZWUxrR8wFEd+nLfEKSUQpYV7ycn3FQENQGp/iEKoz5NKauEDl
 r/SaqxcTLH1TjiJcUwXZra66+5MUut/Eg93HOfY9lzJQZJrXq1bs8TOCbGFcC0BLvljmNhhqlw9
 y4lkIe4M6yYOvFYaSWvabo3f6GyHnQ==
X-Proofpoint-GUID: W1lkUmG0hFIiC4JDVcOaQ8x3XZBHYo-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100088

The GENI serial driver currently handles power resource management
through calls to the statically defined geni_serial_resources_on() and
geni_serial_resources_off() functions. This approach reduces modularity
and limits support for platforms with diverse power management
mechanisms, including resource managed by firmware.

Improve modularity and enable better integration with platform-specific
power management, introduce support for runtime PM. Use
pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
qcom_geni_serial_pm() callback to control resource power state
transitions based on UART power state changes.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 8058b839b26c..9c820302047c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1650,10 +1650,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 		old_state = UART_PM_STATE_OFF;
 
 	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		geni_serial_resources_on(uport);
+		pm_runtime_resume_and_get(uport->dev);
 	else if (new_state == UART_PM_STATE_OFF &&
 		 old_state == UART_PM_STATE_ON)
-		geni_serial_resources_off(uport);
+		pm_runtime_put_sync(uport->dev);
 
 }
 
@@ -1815,6 +1815,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	devm_pm_runtime_enable(port->se.dev);
+
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
 		return ret;
@@ -1846,6 +1848,22 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	uart_remove_one_port(drv, &port->uport);
 }
 
+static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
+{
+	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	struct uart_port *uport = &port->uport;
+
+	return geni_serial_resources_off(uport);
+}
+
+static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
+{
+	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	struct uart_port *uport = &port->uport;
+
+	return geni_serial_resources_on(uport);
+}
+
 static int qcom_geni_serial_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
@@ -1889,6 +1907,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
+			   qcom_geni_serial_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
 };
 
-- 
2.34.1


