Return-Path: <linux-arm-msm+bounces-61943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D3AE2B0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C104618935EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 18:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F8D26FD91;
	Sat, 21 Jun 2025 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oA3Ww1VI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603226A0E7
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529660; cv=none; b=drl91VbPI+2L+bqhLz0fyFkIZv+qVii7HQA4Hn30OcsXoQbLH66rMNq39SMzP/xBsNuYjMRoR8n5DzJjNIjOL2uAD0DetRJZEiXqDjlbUoCT+mHR6HHuxY5aL7gTr050lnMJp00b6fQEFwlGQAON7SveA5wBOwzkoGJkcwJWuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529660; c=relaxed/simple;
	bh=dSQFGNWG/Zf26SyfOt589O9Vx61eV+28LRkpnswAKEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kdz83CFhIQa8iusSec7AXtYqEE35EaKxVZxioq840zp9UfE3iC78TYOZULhLWpuOaJrtsUWmV+YetO2wiUqicToqwOO0aeAJaQhGnMOcAQRhDppH3ldGviO1ZCDwFQssrb7MOLBU94edZcPd6AV0ycI4Vm0kV3BV+OId7S6dqkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oA3Ww1VI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LCM3uZ022400
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcQ/uB31Z3cDOfD3eWsCLPpsYTWEx+9S9C+nOkqBYN0=; b=oA3Ww1VIz1cpKZBe
	eTPM1nXYt16Hh2oYYoOKjy+sWt13kCla5iloWldXzSlUU5RnFFegMLiH0FxM/KVF
	8QTHeo4phR7rONv3mwUKY/nkhjG9xq8X3MUmp+GPy5pEAKQdYaHYu/2KyxIw/4Dn
	1If83H1hDgHpxClV84RvR3rIxctIjqpk5OwafT0U0YCPK5Y8MJ1krpHhgQm4qacE
	SqeGdeyWvr3ACHh4sCMHlsVh5gc3gtgD8MHKAtv+NWBHfZzm3Np1ExwBl+T0WKqF
	tWQckPZ1L1uDcYc5ZqvqMcd6N8aKsmzwJ9JFAqE1hy2CyKlU6tFk6jNpba4r+YG1
	E6pDyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds7s0km0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d400a4d4f2so238265685a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529655; x=1751134455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcQ/uB31Z3cDOfD3eWsCLPpsYTWEx+9S9C+nOkqBYN0=;
        b=OzPxgSau60jxmlQ86QPzt/5X2YQP1LRukoAbn8dW/5qJ6Y3RTioYugKiVblthhT3c3
         w+GoH+BS01nLxqZTUyrens9IVxkEvFdvzmXWynQSW9GWtnPIybaWTReIVymYwXdsjh2H
         p2pb51Q8AxBlNaZHNpsUr4o0BxSMngmzqb/6iKKbQMYdNHD7pz62kZmZJaXiEIxBsZdw
         ESUj1W33CoGjsx8/hB5XmU0+locW0nEwPXqBo5bcjBfEh6bH3/9iO+JMxmm0jRd6fIHr
         9Yiikix7oI0aVPjl6vubpN7b/qdXbhYLJ7u2+XnkMkZjBCfCm58GIvKEwteKCKleNw0F
         shDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXokv/A5/R23i37qsLImL7NnaSdlU12qnQpPdZtO33AfmLKQYuwI2nxQAXm0WeDtFTpwmFmjlPEwhNNJMoy@vger.kernel.org
X-Gm-Message-State: AOJu0YykkAUoQZmAGKwQMOxhZ7VWyxwD/fXbXEU8L08QkjG6pgGo1Gyx
	SltzLyGeUhA3ZsB5jnB7xqj85pq5UC76CrtFQU45d7AQjUxPqfiUqlSU0BuMFqYkGSl0TUSgcr8
	zkSO6dkpfHjq2MCLosR0DGxqaq9Uo1TMtTSTbQzk1HD85garTpKp+uQmsikB6RRB0jiY1
X-Gm-Gg: ASbGncunSxMYXOCadoHir6xYYWTBfk614NW2hTPeZLnFxyEbv5BdNerWBSJFmWVSs22
	iAtKwjXzm2qoUDmvX5wsuQAE3ktY342bwCcfa4aWnqgHXD9DVh9ZjOF6RpDTayrAXQaTnysruwX
	iN1uvOOhRhUwIN1Xe51cdhUYssrp9QPdCUBzDs5cZs6mIXi2qttwiLLYiCEesxizY9uSy8EYXiC
	sAzVLUmS3mWFm5W3OtfKPrbnybPowDQ3bU6dUcquhaErpuDVU4Xv0NWuCEyeBdIViANk2uJmLll
	J2GBQ+sy8Fa7HOljRSWtme5/f3HwrNtdeTGSv2LjhXuMiAbhghn8h7LNQF+ZjbDvyW7ANSQzQrZ
	chOt5y7/PJ6D4UHbBE/5DSMPbfgF90oa7G8I=
X-Received: by 2002:a05:620a:29d2:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7d3f98c77e6mr1102346885a.7.1750529655169;
        Sat, 21 Jun 2025 11:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9y42uVOGByHIC2CBh6Ap0nz7GpIfl5u/D03eThzuzRkDRz+TR/dzqSjl234RVIJ6r6Kel8Q==
X-Received: by 2002:a05:620a:29d2:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7d3f98c77e6mr1102343785a.7.1750529654719;
        Sat, 21 Jun 2025 11:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:56 +0300
Subject: [PATCH 1/8] usb: typec: ucsi: yoga-c630: fix error and remove
 paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-1-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSQFGNWG/Zf26SyfOt589O9Vx61eV+28LRkpnswAKEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZyR3x2JVzH9HD3TQI4ofjUDHoHGx3Andr9b
 pMKv6svuPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cgAKCRCLPIo+Aiko
 1dNyB/4xVhi2i3qRu/UXloyqlOmjwZXkfGnQKJA19/28sTSvZSmYqkUwVjPR+rlBYXeD5ri+W+z
 hpgtM7ZFzm8FtToy6XwR/eDi6EA0ruS5wNCJ7GzXmcaI7+YwjBIyK5UDMMx8RdQ7RTYxBJ0Olhw
 ISyiLrr3hhXrHUb/hiRDI4igTussRWtKuK9hMUQ/4IB+4Fj5uN4/NcgbUkMzp6PYInoxS4WrKmX
 xP2ji4GdYqxa2FPbejzIiysLYe/qmiu3ih/2P7g9sS0W2Y05BTcDO7ckpjrUAZ7QJqyQx3Rdin5
 yklMXFcRY3QBW6pBERSfc79DHn0vzzRalx9ozwzEj8aZyo4N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: z06ocvQ9Z9VAjo1Rgp57TILO87YaB9sQ
X-Authority-Analysis: v=2.4 cv=cIPgskeN c=1 sm=1 tr=0 ts=6856f678 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6GRmOlDtAtgjFoD-o_4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: z06ocvQ9Z9VAjo1Rgp57TILO87YaB9sQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX7YHd78SxPHmh
 oNecTmZMhtSkjXZUGXUHos8M0tDQ8OiN7kvXF7PLPDPZkjlgKX5L8rhHipko7NlVQSsS0LHm5tb
 9StaIOHfYkHqdoUI1NZ88d6PlHO0x7geJaNmzPG+//EX/pl4GtY4+37dB49/A6dTXITYjQFXfv5
 lexr5FYnKxgTlZjSOr2wLzBQiJDFsP6hrHfjKz1Cw3IiavHGW2bjgRLtn8Kxm98wSDFD/di3r3+
 QsK7LmaPv/RV1WM7ivXyDxwc4+oP1GzL1GRaS75Va1k0m1MfZ/QxCDWkr0Asd4wxO48It3jm8y4
 RW85+1ZNKxzoBXndD+Oq8HibpS8v6Tr9i2WKJ8C7RxjeVrBoC892ZxruQz+UqohDc08/2g/jDYg
 WY7+tKEWYpni1tz9TOwTnpmLZvKTZVV1BF/P7BcDyfkBnjUkNEnAbLQtlXmbVid2NcmlkT9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

Fix memory leak and call ucsi_destroy() from the driver's remove
function and probe's error path in order to remove debugfs files and
free the memory. Also call yoga_c630_ec_unregister_notify() in the
probe's error path.

Fixes: 2ea6d07efe53 ("usb: typec: ucsi: add Lenovo Yoga C630 glue driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index d33e3f2dd1d80f7b49d9c5e7355fb14a97c74dd5..47e8dd5b255b2b306dd9c3d6ac8c3b896954981a 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -133,17 +133,30 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
 
 	ret = yoga_c630_ec_register_notify(ec, &uec->nb);
 	if (ret)
-		return ret;
+		goto err_destroy;
+
+	ret = ucsi_register(uec->ucsi);
+	if (ret)
+		goto err_unregister;
+
+	return 0;
 
-	return ucsi_register(uec->ucsi);
+err_unregister:
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+
+err_destroy:
+	ucsi_destroy(uec->ucsi);
+
+	return ret;
 }
 
 static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
 {
 	struct yoga_c630_ucsi *uec = auxiliary_get_drvdata(adev);
 
-	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
 	ucsi_unregister(uec->ucsi);
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+	ucsi_destroy(uec->ucsi);
 }
 
 static const struct auxiliary_device_id yoga_c630_ucsi_id_table[] = {

-- 
2.39.5


