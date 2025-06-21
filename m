Return-Path: <linux-arm-msm+bounces-61954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C74AE2C15
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 22:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9007918913E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 19:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05D2270EDD;
	Sat, 21 Jun 2025 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJyQOu2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11781270EC3
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535783; cv=none; b=s63IBhmnuuTqAPtuR1ZiJU+gNk8UZq7MMEVOqbu1atUxwoEdQeM/4vnhLyw9/GjucdYKZaSQUcrXNZ/TyvjtUlVkGErvZChWiTmL5mngk5xzPaqT+Dix1iIonXwA6zOKyJOxpuVgJ9OKMzlnp5+FUOWQbENVrDDaLYccxlD0arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535783; c=relaxed/simple;
	bh=AYSfUnf3azSTwr8HS4a1h8tLgNaLSWarihAu5oMzWwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NaJ6uxLFN9guc4W+GAjE4Ur5x5fqKn+OQ0Fyi9mghsbE77MWEM1fVSe2jICxzW/7jAevV/iZFzo8/pAkoqjVy497yaDS3aaUnZc2+dmzCvelJdZiPwEoV3/2Ui8V4P/7wJAeNQyU20M28kUQMEVl4tCxJDRENKLpKcUMLIbmuQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJyQOu2u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LFwx6g001995
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=isn/W8cwEUUIzjTZ5KY4r2
	avohw6snmCFaBU6U7CMAw=; b=OJyQOu2u7vk3Xk11x0naIZPix1aiyCLDnraGMD
	84oXg2pCma6J6rn45lnCByCL/9xYK1dmUl171RkU0MjRUISgdAlt5hQ0do/F6reF
	HNIRtUzC3O8HEwGCr1ObMTW3aEMB5lV5lfActmDEG9+5+GHaeInUm+M82o7ajucD
	aX3YGqeGAKa0l8CjUvXbySRtnY+0F2yHdztHvKFMyC86rcdVZQQi3uANuiSSYm3I
	+V2VPEj6+koY8MI8sGZTXPzrNTTZOmv69Ziz2I/gPO6d69kaRq41Zwq4yefn0Ota
	EqmBu2ugNm01VqdCYSHQrK058dIVPQyoaVZs3VVm+5O2j5iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds1a8qwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d40185a630so288116685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 12:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535780; x=1751140580;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isn/W8cwEUUIzjTZ5KY4r2avohw6snmCFaBU6U7CMAw=;
        b=hE7u+J8Kn3/rv+27pYp5eWoKsZmUGYgfjoYCy5HkqDBeCB6Tk61Gur8p/rJo7yge2u
         XdZVM7Vsh5Xmd5KeLV1jE78eudLq8RNeaGSK8VORa/JkJ9ouLcjvI9eNOl1c34x5uSE4
         bANrAM9QvdM8WDjhGnH8BXzvD+8MWpJBOwH2zAron0repCFYYhkHdVJuKpsmu/ZgESCv
         X+Y4DfXaKvM6bwKNGSU8O1P/xC0DGGi78tDQuwTNFECqyJqODkUHT6vdi3WjSgt22geR
         s5+EZjuDA7/TyQn5NpBD4QsSgW3bw4IyR7pGudA0ENWUT0H3v1bNE9TiySi4BU4JDxfq
         yeGQ==
X-Gm-Message-State: AOJu0YwrmXQZSRQRmzQF+2PAXfsewt8/zRnyGOnUTb3DzJsNFZHuLLD1
	6IGSOAwNGsWvkoINZC4vvE9FM15NTFf5fFBRhX/4SbloJc7D7J4OA2hDea2QD7eckbYCORudbmh
	/4D02m/31lkTGpqaVlIpef0i4MtdFM5L5O6vQwUiPfe7Wq/6nc/pA0nXwAQyfYktQP5cQ
X-Gm-Gg: ASbGncujSFx4XHJ5fFJuwXNh86DgU5B9V+Q7t98MtXA9hX9ZLmuavEP36lE4gOgemnP
	YTMPKCXCaLDT/o1qbG67sDAEJH1n0fzLPrPphx+pC7QJnALPYiH8L33rtnIB6bA70eJt+Zs3hVW
	A/mDrsUSSBV0yU3TS1+zwX8Nez69J/Y5H8fs9KN/xB53k8Hevv0dZZ+rhEYoaxF0mlG7MJXJA6H
	WzMXx/swkeBmbBlwkvBDv6WuUBBBA4vWgVG9yqriADAFIO+VOgNzYBQFm6l5gw++3I+QXc7O/JH
	0Ws2VoIDnLuXsVEIKyFlFs/wKorj5fWZ2hFHU7Sd9Az385WOTs0y0GKWtaJPsxTN8aJIZJ2zkpW
	vx00AZFfnIUAwsvLzmZtNcLCvY0YyGTgRKIM=
X-Received: by 2002:a05:620a:2628:b0:7c9:253d:f226 with SMTP id af79cd13be357-7d3f99566c0mr1331360585a.51.1750535779673;
        Sat, 21 Jun 2025 12:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERP4dOfuvlZvRZ18Ykf0hcFojMw/oS/Z8vpeZuvTGzYmAPOx7N258o47CTz4ptG3mAjWaw6g==
X-Received: by 2002:a05:620a:2628:b0:7c9:253d:f226 with SMTP id af79cd13be357-7d3f99566c0mr1331358485a.51.1750535779318;
        Sat, 21 Jun 2025 12:56:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] firmware: qcom: enable UEFI variables on Lenovo
 Yoga C630
Date: Sat, 21 Jun 2025 22:56:09 +0300
Message-Id: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkOV2gC/3WOQQ6CMBREr0L+2iptrQRW3sOwKPCBJraV30owh
 LtbYe3yTWZeZoWAZDBAla1AOJtgvEsgThm0o3YDMtMlBpGLa14IxawnZFNAbL1lsihLKZuyLW4
 lpMmLsDfLrnvUiUcToqfPbp/5L/0jmjnjTCulpVKy4z3en8Zp8mdPA9TboSac3ulgPPzQ6IAsj
 a2JVeZwiRerQ0RK/e0LaUxyGtgAAAA=
X-Change-ID: 20240725-more-qseecom-379933b9c769
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AYSfUnf3azSTwr8HS4a1h8tLgNaLSWarihAu5oMzWwg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVw5hF9UX3mIRKDfBTebI3y2vQZ+9Im4ptracj
 DlHsCUzlnqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFcOYQAKCRCLPIo+Aiko
 1X6AB/0W1msrqbi3bGtJtcsiNmtWWnBnxE2Aaf8J5qbtuiA6Il41Eba1Ergn0bN46CKdeWtJHpB
 Rp/G9J9+K+XEFDwXSHLm0Ml4NAB6b1bqrlOJwr4P/8ZVNmHXYYzhqBYIvcJdtklLxqIjD+JUB9W
 4uwlpLnjfAYdN87CqDEyvdbMdoSMXpob344QNfXrEzpc+buuX1HQEsV71jipr65ky+C9hSjelfI
 s1Ucw4I2jZu+QVluFS0BQJZrLqvshBBChmVB07rH4wvuCkyQ88b3z9a6+B7oYX1vJSf2HIDHOE3
 sL8ERKUJm0e4A0pWyUYR96BO3smFJcd8efxivci+wHQCr47S
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Pej/hjhd c=1 sm=1 tr=0 ts=68570e65 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VEriS7FlDOdm1ho_yVcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: b3r7X3xWiJGl61csZHRnrNStsz2HS1WB
X-Proofpoint-ORIG-GUID: b3r7X3xWiJGl61csZHRnrNStsz2HS1WB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNyBTYWx0ZWRfX1L+IkzIv/U6w
 sxJdliBDh52XlRiURbmo5s/ii5gASiNaI6JZL7AqrRvh16zHc4XDhVC4thzFMOwNOXyjr2RtUOa
 jeCAPOeONvxjLJoWUntCZ4YLSD4fs/zP6sTjLL2wJBeQCV+9OqTC6/vhFDMZos7lzPQeCNwhEsI
 5MZ5JmJkvqWqNIz6X2MxMcgE2pfPgUTR83W72MtEbWAFw+qCcoZTxPFdgusj8XKsym96MSp4wOv
 tIm5/0EH3E+VZW3SJXtMZRWN+4zx2WFlh03BkiD/Wir5lTfEelfL5dd1Lmjgr278DT04ZcYqJEG
 R98G7tY/UUPfER9g79nGsC4Z25Znz5aAhQ3dipwZWMR5OdxnZuy+ATQFKAp3lQ6GV8pspJ5zEdG
 Z3dJcIJoCw6R9uF7UTl75l7pwa2w3OcMrBC7oAYB09g6rlk2hmg9KiRQPYZIne/kSDR48ffx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210127

Lenovo Yoga C630 is a WoA / WoS laptop, which uses a "standard" QSEECOM /
uefisecapp application in order to implement UEFI variables. However as
this platform has only one storage (UFS) shared between Linux and
SecureOS world, uefisecapp can not update variables directly. It
requires some additional steps in order to update variables, which are
not yet reverse engineered.

However even with the current driver it is possible to implement R/O
UEFI vars access, which e.g. lets the RTC driver to read RTC offset,
providing Linux with a correct time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added QSEECOM quirks in order to make UEFI vars r/o on C630.
- Added DT patch, specifying the use of UEFI vars for RTC offset.
- Link to v1: https://lore.kernel.org/r/20240725-more-qseecom-v1-1-a55a3553d1fe@linaro.org

---
Dmitry Baryshkov (4):
      firmware: qcom: scm: allow specifying quirks for QSEECOM implementations
      firmware: qcom: uefisecapp: add support for R/O UEFI vars
      firmware: qcom: enable QSEECOM on Lenovo Yoga C630
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix RTC offset info

 arch/arm64/boot/dts/qcom/pm8998.dtsi               |  2 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  4 +++
 drivers/firmware/qcom/qcom_qseecom.c               |  6 +++-
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    | 18 +++++++++++-
 drivers/firmware/qcom/qcom_scm.c                   | 32 ++++++++++++----------
 include/linux/firmware/qcom/qcom_qseecom.h         |  2 ++
 6 files changed, 47 insertions(+), 17 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20240725-more-qseecom-379933b9c769

Best regards,
-- 
With best wishes
Dmitry


