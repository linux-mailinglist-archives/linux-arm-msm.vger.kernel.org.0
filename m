Return-Path: <linux-arm-msm+bounces-61942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64238AE2B05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B59613A1D77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 18:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7F326A0E3;
	Sat, 21 Jun 2025 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATLg8MMT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A9188907
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529657; cv=none; b=Lq6bC23sK0L0Sak3WdQj4ObZCEnfZnREnX0QazU8j7yuRg7z01ABuZrxcWRf6zcmwZ8JIOju5+dq7U/g8dsW+OZdKytrnuREB6nLWZYYJeVdEAjjLREetqBX9jQWsJn/+G6/GYMytsP3lpQVDJktA8T5IZfOMUM3YcQy0dfkAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529657; c=relaxed/simple;
	bh=NC+6CTFgMLHdg6+g9HBcQz357cKtQj1mOKzQB55FZWY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OSODQsGuud3LIV4njt5j1Rr/U0xKHNcdxCcRMYnFpQYjKQeNHtbQWMLbvWSXLbWZ3HnO7Mqt0I6qDxqcqoTgFpJPk6fLdXauEDEGtUoXtfZWAOp4nUWfCn1myBTvQkUaReSNa+qnejcMsivVrlLrspSP7L3yT1Ts8Ht9TQUzRO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATLg8MMT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LI66Oi015394
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hAdBnAWfYHpwDRvHbFjfO3
	Wq7C/rufDq65LmjSJW3fQ=; b=ATLg8MMTVIUMiJHrj7DwfuaTtO5ROoueIRdoXj
	/TFIlcvjfkY5+xwXKPSOX61R9iY6+3mfMP56dvleeSMNU+Jt50Aa/XKpW0olKy/H
	XY/C7tW64cXHxjaxnOnOQ4Po8tCkukn4KTEYWTb2CmsdmqjUGt4SVmmQ0z+HKisC
	8erR5ByCjAZIguCZStnab58WEhK+sdEx7tJtsdwyW83L8Ill6zOnHzu0tONZqwXD
	VZsT/IJbQ+n6K4/y3uKI2Pa4cZ8m/hTlkTLP11nElhgsXO+jGkrkTgt6U5loWduM
	kw8J3nHJnOoe1Db6OllVNRy3cVbtKNq1k9DZRlLqKy/RI07g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e1qgr08b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3f0958112so420020185a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529654; x=1751134454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAdBnAWfYHpwDRvHbFjfO3Wq7C/rufDq65LmjSJW3fQ=;
        b=T3nAOVdIPesD6bmsKHvpmLwOdpKAMhcsUGXNnGESMn8UFKvm4N9KvLP+MRCbv1Mhkw
         ZBcmBucRQ1pq651GrmqFCCAevn4VbhhdQ4HAfA+LDAZSURQ7MJ1V/ubETfD8HrVYN8Bp
         WCwbxm1G3rX5xR1LwtXj361M3x1JRCiLJLknZEhqDRNLU6siUkhWZhMcbvplfV+a6WGQ
         jozhfs9B7AZEFDQyuMM6kyx4IugMBI+uaLnl1BB43XxsjVl3IURBV2EiaxCCeAJPKiUD
         I2ZmaBh83SG8Inpfd4dcWQCvYJuHVcaGBKJeQjj4+HUEFkKwfg3WsEJcsQmxoOzoXppj
         t43g==
X-Forwarded-Encrypted: i=1; AJvYcCURl2hHzVLYGEuny3SRGg1zSHD7+jCfQ63GWsx9K6ZzrcZ3uGoQUapbm7xZj0h4nnSupTQspPevdx1etGTU@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdGjkOB7h5n47U4e7MJcEYvl3/2nBGB0uaJBouXQ3TiS6Ys1Q
	PWWrxfmSQ6QQeVScEQJSrjxyoeMv+wiIcul6yIpcm1DnHVL5uocypbfhyd9dHhWS5aWuuwnOlRR
	SFAtdER4QRpQoJaJt0xDTZvieI9uc8pjTk6p1mzJmoT8fS9TaFQAAiKwgTbHMLbSPzaL4
X-Gm-Gg: ASbGncsXUVnv9QTwgI76RznoPDEyBGI0pqkWW97EjojNLCYfhtYb3okFI39WJSKMDtv
	+BsaBCeHiP8cgaNox7d6IykoGIzIGtghl3j+Ib5E/qJ8f0J+DlkzGrBZqtqFc8bTKcqKkFO1bIV
	3mfSWSzTahCwR4nNXU7cjPSlSYp9KM9fvdg6oYIuQyTC17PL4uz8UGjSxsrsWhBf/94fcZqZut5
	X0i7ys+oxjrYoPGYZYKQybvnkt2Q0JxpPWe05FqvDOh6y8jpXbLQ8bqcBN/nkTILdhPEjjTftWj
	OmxGwtD1x656M4yAbHptnkHLPkutvRW4nwqmyuasWbw1mS7DhxrCHODgB7aAnMY74J1H60u4s2o
	q85tnQC5eWehiM9BFDm5WY9dXgz4ACqEWVOw=
X-Received: by 2002:a05:620a:f10:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7d3f9915ea6mr894898685a.29.1750529653752;
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh/g8hREMqWKz0vNE/ALaXmeIFavld/Ji1sFTgDR73nzP4ito7bDNyvb0IHP/cPqQq22K+EQ==
X-Received: by 2002:a05:620a:f10:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7d3f9915ea6mr894895785a.29.1750529653328;
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] usb: typec: ucsi: yoga-c630: enable DisplayPort
 support
Date: Sat, 21 Jun 2025 21:12:55 +0300
Message-Id: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACf2VmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyND3WQzYwPd0uTiTN00Q1NTg6TEZNNkQ3MloPqCotS0zAqwWdGxtbU
 AdcC+uVsAAAA=
X-Change-ID: 20250621-c630-ucsi-f1550bac5c17
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NC+6CTFgMLHdg6+g9HBcQz357cKtQj1mOKzQB55FZWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZy5+91uni4dIEvWlsETyokE+iLrZe3p2SWk
 r2J2MUuLPGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cgAKCRCLPIo+Aiko
 1ZFSB/sGqadIrErakavmv4ZFhj5lCWmrgf2rD3td8keECibDmPBJBiL6pHfkwduDARAEGUEUA45
 Fwe4X6zv5j/But4gkNkVk7W7wn7fWvtJ0yAA8psRi5Yrq48sHosoaTxKJYopz02YAtP763lvulb
 3drpzCTQog63ygqEMtuxFH3b96LzVW4dq1NVAMp7RuMDcAw1W2SFKifx7AMtwPrrZ2o2Y3NPOmk
 EgI5LPccSfiwPhEqNF8m1/kWfC30xCRw8qBTn/EK2fFts05xBr9C41ZeWGLgp56NSIrsX1tzGFG
 dhFLG4mHfjtsF0hTaoIRA3KWUcP31Tf4MTrh6Xx5RtrjTnNb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Fw3-te4rXzwdF_P2ooawnbGFmnM3gcpl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX1lgyDB/wvezY
 4zNdggGtF6JSHa+GRO68MJPOCKvigdUn+5g6WCyXSVY7LBY7ya1MUNcW9kMoEhOM2MYxYuPOKAB
 ijA83WwIGXvYIY707dZnFDzuzj3dW07AECQReQ+GRue1SzifHi/bHnvCGAsBg88HHpZxq+U/AG0
 ds8oC7o+US5cYsLjJ3n8AfT2gARZMBMe9smpoAvEM3hWVzkl/8I0Cv8B4HeW2GU6itjQuH9mUwI
 UJPmxphttYJSnHuldP8O/f8G7A6DXbgqr6M+gLm3U/szyxa4b6CcW7mfdQUet5RcruL34GR1z8s
 sesbsVRqTssFGmipaDHM/68+ueGXLw3mpbCrauhR4rDR85DdQuqH8g1DK2h2ZxsmsU+sO4AKAiA
 cbkTRJDZOP7Zu3tLqPKUXroYInhHWTc/bjfvHMvRtIX9GDeMKoPrWZdCyiMDGmZ6x7Qsot4w
X-Authority-Analysis: v=2.4 cv=UetRSLSN c=1 sm=1 tr=0 ts=6856f676 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LFE4Rb7r-JuClWV4lGUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Fw3-te4rXzwdF_P2ooawnbGFmnM3gcpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=613 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

On Lenovo Yoga C630 laptop the EC implements UCSI support. However in
order to properly handle DisplayPort AltMode events it requires
additional support. Implement several workarounds, fixing issues with
AltMode UCSI commands and also handle out-of-bound DisplayPort hotplug
events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      usb: typec: ucsi: yoga-c630: fix error and remove paths
      usb: typec: ucsi: add recipient arg to update_altmodes() callback
      usb: typec: ucsi: yoga-c630: remove duplicate AltModes
      usb: typec: ucsi: yoga-c630: remove extra AltModes for port 1
      usb: typec: ucsi: yoga-c630: fake AltModes for port 0
      usb: typec: ucsi: yoga-c630: correct response for GET_CURRENT_CAM
      usb: typec: ucsi: yoga-c630: handle USB / HPD messages to set port orientation
      usb: typec: ucsi: yoga-c630: register DRM HPD bridge

 drivers/usb/typec/ucsi/Kconfig          |   1 +
 drivers/usb/typec/ucsi/ucsi.c           |   5 +-
 drivers/usb/typec/ucsi/ucsi.h           |   4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |   4 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 176 +++++++++++++++++++++++++++++++-
 5 files changed, 182 insertions(+), 8 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250621-c630-ucsi-f1550bac5c17

Best regards,
-- 
With best wishes
Dmitry


