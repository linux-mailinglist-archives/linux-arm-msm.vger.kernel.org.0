Return-Path: <linux-arm-msm+bounces-73661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144CCB59274
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEEA6322DEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 09:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EBF29AB1D;
	Tue, 16 Sep 2025 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZMzOkBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1E2877C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015618; cv=none; b=ug+mmBC6yBKzWhv464RlS42JfJFBp/IggayHzqiYkBTWMw8iDpQmkdsE5w6/1gk6W6et28+N3/a/IJUNMHO3c4UKSw3xt2oZbqsSmv0wkBP5EJTijbreU/OZsixSZpDLq1iH0pda/9BDOB9ViQ4X+jUfsM9GP/BAKzGtaIFbCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015618; c=relaxed/simple;
	bh=/AN0edio5MaldEncQLvD0kSKxTKUGpgRttz9iXUqZxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ofI9DiQCW+il1k65srDa+iN3YHX5hPnZCcnSv8t+ziL8g36Y4LhxjI2fCfo+kueTI65vGnGnclxjKFzduJK7+n/7aiecpmNbAZnn2ZCF9VXEAEwiW5pd2X4dK2waQV1DNVbIrGtzPu9Mr3bMpwhlXXy4ocHaaTFz9u+UbfAR7DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZMzOkBu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3plA6005612
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SdbaG+qQMcuHskGeXqpUq0AHk1Ukw/1hxqZ
	/MRYhBG0=; b=EZMzOkBufAGzt8zUKa+ntj9/CVAth93d+7cckdcF8ZTiDToWPuG
	CscdwL+BVXtjmkPH0VohXQCskDnrtjelQBRHsrha1Cs9tEyIWYdcx+bvt/YTwIo7
	Tin5+4pB3Oc2wxQuRsMZGrJn5YRJgZJo5guCmcoihIMAXTLOOx/MRnR0qS4yReuS
	GNvFAdqE4tox4iHAJajKJfi/VtG4Dr7Fcs9QIJxiHMeP6B2Lj7yzjU2DyoCOseku
	2q/AqJ50zm6NYDacIUl5AOgoIBShsjEGQO0bAEL9WMkQLLMO9OKdDSGTTHU0NvPx
	9DnReY10lUbGmEO7gucYkowJ2aJP7ilAylA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58a11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:40:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-25d7c72e163so80468745ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015615; x=1758620415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdbaG+qQMcuHskGeXqpUq0AHk1Ukw/1hxqZ/MRYhBG0=;
        b=Yv0Wrkd2Y7viUCM3UXeYQAvTglWgRvLIK92kPY9DC8NvI/dZy+wyDMnfwZSP5PdamV
         7MEku+/TdqoyrUfGn4L5yOiJ51S7tcwI7FNWz0uQ4Xu4aOnpaTQ2u/KVRGrXsaQg+M5t
         eo9gnjMS+nn/bbSvVkgedVtKy9VIRhirMq5/IEkEPU4AfDiRsIofKLv8k3fP5o50cUk1
         +pjxxb+DLeWvoHUDLstg1e0OKLxMvEoqsrmmClE/cOoofenhGzBTnzm36Ee4MWpfMEqY
         7Wj0M4m2h4vidDpct69dUGU0ahhYuJCjYqKMp/eok63Sf3NoOD5rdUKDu2k97p2VmzQS
         Y/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR+DzPoDV4IVvzImOL6X+2OH7RqjWCl3ikbAl7O5MtcZceIvdXWrjd22lxohkpSeM/uhEvWwIeufBmG45/@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+KKRBA4lRs8L+a9oFrIyj4N83qPIN4/KJ6Xv7duwDDfRZvHJ
	QJCoUK0o2M5RQDP71+UjYqyYIcvRDZghuopEd43EA+kg1f2qLj1UmxmoECsX1nuC5JQrG/UPKeQ
	Z0jrrTrdZq5zwZ94f+V7qTE/+LtMH1xmyBuoRkLIJgHlHl0pkBVXX4FJPicGxkqkRUn1s
X-Gm-Gg: ASbGncsWWp1ksUed2PTaSEjMMm79DVxMiK5B9saAChD1GNYzffGzVKKOeGN19r4ssdH
	0NYQHmz3KemHbyMZyZQlqpAJceYw6aDoGR2abtKOajev91fzT8GCnBu63SRJZ3ovCl91rQtZo23
	HZpZYY8gdu8WkI35yoYnguc14Gly4wyrt67gkskA5yLnmAZ0E+B+Pi366z/Gx2TkLvZnSNI1x+Y
	djquMFdPmBSMkgr9pAh1DA/j3QnrSRv0xw6z63++N9SxDFRde92aMZRaSq+Y8KyazXViBalhyGm
	hrv21xO3HmEYSEg26GDNAVQmDd/bUzfN+7QW0atpds5VeEjN2R15jOhOo8bAE78R0jPA+s32Lg=
	=
X-Received: by 2002:a17:903:3c2d:b0:25c:b543:2da7 with SMTP id d9443c01a7336-25d2528c254mr178027465ad.9.1758015615264;
        Tue, 16 Sep 2025 02:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3iRujT5RyN/Y70BYxNaVIMPtLsc7G5+gxIL9VhuL7Lh/nsZi48blzFd7jfvLmyl8MB9cHzg==
X-Received: by 2002:a17:903:3c2d:b0:25c:b543:2da7 with SMTP id d9443c01a7336-25d2528c254mr178027315ad.9.1758015614822;
        Tue, 16 Sep 2025 02:40:14 -0700 (PDT)
Received: from hu-anupkulk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2663f633893sm55434465ad.119.2025.09.16.02.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:40:14 -0700 (PDT)
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, quic_ptalari@quicinc.com,
        bryan.odonoghue@linaro.org, quic_zongjian@quicinc.com,
        anup.kulkarni@oss.qualcomm.com, quic_jseerapu@quicinc.com,
        quic_vdadhani@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        stable@vger.kernel.org
Subject: [PATCH v1] tty: serial: qcom_geni_serial: Fix error handling for RS485 mode
Date: Tue, 16 Sep 2025 15:09:57 +0530
Message-Id: <20250916093957.4058328-1-anup.kulkarni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rMyhoVoPuMHXcQ8AH7j7uCqNnBLfgbD3
X-Proofpoint-ORIG-GUID: rMyhoVoPuMHXcQ8AH7j7uCqNnBLfgbD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX3dm7/P2jFesj
 47sejt1gf8RkEopNWxIHa8NUHW9Z+A5HFYOBuhPet9BU0aNsTtcYfzrRdeogS7N/KiJ7ll6u5nd
 zOot+hGVuNk6OHfRTJ+Axj3cTCdwJl2piTWkT9gWARthnMkrNaCMuPGs4tgaTTs+8Z7wDkbbidr
 hTJ2e2UynIh4Pv0DbwrhuBO2lVhgVGTEo9j8Cu6AIUaVTpG/+xtfctlG60WIcR47REWM6jWBBF8
 fpBHwebnC58qvNyuh9J22rnr9dNtmCorYo1EM/CtuvWn5aNQUgG0BlwTss2rIafHLM8IneNJFvG
 +TCS8emnN2OlrxlW8EP5Cf3O0AMCFkP9/MBFbThk3eg0YFLB0+LTC8Y6QpQ7q5NYNQqi7k/cy8P
 UHTGtq/C
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c93080 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZXCm3_ECWB7Dsui8_W4A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

If uart_get_rs485() fails, the driver returns without detaching
the PM domain list.

Fix the error handling path in uart_get_rs485_mode() to ensure the
PM domain list is detached before exiting.

Fixes: 86fa39dd6fb7 ("serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9c7b1cea7cfe..0fc0f215b85c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1928,7 +1928,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 	ret = uart_get_rs485_mode(uport);
 	if (ret)
-		return ret;
+		goto error;
 
 	devm_pm_runtime_enable(port->se.dev);
 
-- 
2.34.1


