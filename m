Return-Path: <linux-arm-msm+bounces-60796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A9AD39AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 315873ABD90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23911246BC7;
	Tue, 10 Jun 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3FtDsyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7EF228C8D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563131; cv=none; b=WnMNMk5Z17FavyZeHWQxmQEHdWTL4uNXIrtLsUuQ95CBuQPbAF6iUbk/2r6tKRe6WtyW/TniSGCFreOIZSWJ1ALkiY5cexcVmINS+cXa2rHyL3P5jBifgM4S6SRkdTKCdtGRG4lK/m0U7Htx+65A/uqwBxUfX88aPpChYGSNbOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563131; c=relaxed/simple;
	bh=dv3Hvk9p48gd7VFAefP+8+Vtb7cmVN0Z2O9TcNsN42s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ABG4AVq/2zVH7L7ZnB7/7gCUb14nHqLaszqJzNB0SepEcV61WKabePCw/ugLi1AzdTd1jPFzTTnAihmFHtqFKdDjRJStfQUfrRi/9aFlfGs/O8YER9WPPoEP/AWkRHWB0MXHrjJH5/wXMaQUOPFAbFIjeqteXdIggvMyBOiOhck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3FtDsyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8s08Y019787
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xH2KQv7sgrK758uLs/6IyR
	Mr+4xC8wLvLt9nlR+5ejE=; b=N3FtDsytXAVpxCWCKXP2+Q5k5L9my8aJNzN5Ht
	CPm3XspNcY9tcYLDtcLcRto8wBwmv0iwNhs/T7QzQ1dVpJOaO4A0V+VAHQ/AaGov
	F3gtYW9fkhJGu476Igvd5in7fzEO4zMAz1BIVhRtCGRNVWUIPTAbIqZugJmfb1BS
	7hlEX0mWkQQzdbkuxWC63YodLi4t6fQylCEMkPcCHbR7URu8FMLMWJso49Os5jQb
	WHd77RMMYvCejL60RvVynfvE+SmjVn91l96mYo4phST1/NqypRhvl5ZQStdraFfI
	xHfVsl9yjcgPYHADV2y2BDUoUVSBIaUTdMmuD41cR7SzX3EA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv9j6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7391d68617cso4806039b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 06:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563127; x=1750167927;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH2KQv7sgrK758uLs/6IyRMr+4xC8wLvLt9nlR+5ejE=;
        b=HsRa950j+dXn1r3CX+itXODMF0l1pqbTTWeXFvn+zB+Nx/fVV/4jI4IhfuwOBJlLrt
         7v1nJHBIqtBhyK6cCC29lVU93Q1LIvhLWvx/WbMLgr+VG5fBoFHxV93CWT8jsGX4n5Z8
         90aR6ae6NBP9cTRIuFr2jzVVNjFSClr2YKw79j3hfS55eMr78JbjDBRKJHvDjFUsoT/v
         95IfIspCq2+T6KIhje2m+vz9E89e/t/2euPQzVh7MZE3fOmFI6spK2j3DAKbP/2Ac1Ab
         drh//rMH90Ua/qNVXfPRNafSd5Awsm1UXkr+H3KUYvC1QFOZ8wuwnxWa+6A2wup5jNrT
         OPaQ==
X-Gm-Message-State: AOJu0Yx6LJlalLB2YxdQb3Dw+dnwyyDRPaOzukBtNTqcuoSX+0TaAQjS
	mPJvdUVASly9l8Q+n++uqrf33bDJGWODWqC6ppOGd3G/dgirgtJVKgayCwuNVNET5rXlxJtijPo
	IGlTTJp9CAUmVKh/tSX3dSucfGtucr84Ec0EIdlYg1uWXajFuI9TTx178D974Va6X2fNm
X-Gm-Gg: ASbGncsoIJ5/Hws7tvr4LFzpCxmJqE1KgCB+OwXkLKVtY4ZNWaXd0B/r8UofIKFbWa7
	4UnFPijmIO80dOmiTt7UAHO++Ae4oiJ4RfF3nXjuD2Risqye31kk+n+SmC6fSmVho0hsWRppsOC
	c/fb+O9bNsTvHWo5boRRTH41OTOv4O99aDAPO0zBkyPGbZLV/mzoe4v3pOO7ett9P7rNqepxEm1
	D/PU1WOsSBNm7LKYWGAqmZ44zeZ1nisI4KL4DylZOKzomqnGvOGqPw8dCiNbFooII+YE129oRmD
	yot6cn2cLIpRtsDQFojJk87R79Oe++OUdqRrAkg3ZcShC0x7/NWhITCVIe5lhMtHKfuwCp9bFXB
	fy5798rdeVt6lScLq5Mf39NWPLXQWIURyZdEOKGVMdTeWyyDgOXqRhHeUqQ==
X-Received: by 2002:a05:6a21:6d92:b0:215:d64d:412e with SMTP id adf61e73a8af0-21f7698b308mr5987088637.20.1749563127491;
        Tue, 10 Jun 2025 06:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGcARb34ssWxbNot4ia6+tBWBCtiJuSosdEn5XdfGATdAMmEq5BIaiIvEbLrX9hwPwFyDoGA==
X-Received: by 2002:a05:6a21:6d92:b0:215:d64d:412e with SMTP id adf61e73a8af0-21f7698b308mr5987045637.20.1749563127072;
        Tue, 10 Jun 2025 06:45:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Tue, 10 Jun 2025 19:15:16 +0530
Message-Id: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOw2SGgC/x2MQQqAIBAAvxJ7TtgEE/pKREiutRcNNyqQ/p51G
 ZjDTAGhzCQwNAUynSycYhXTNrBsLq6k2FcHjdpg36G6/DFnEvroJEVlnXGBLGq0Bmq2Zwp8/8t
 xep4XajbhiGIAAAA=
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=2858;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=dv3Hvk9p48gd7VFAefP+8+Vtb7cmVN0Z2O9TcNsN42s=;
 b=tHyhZgb3CmEiZAspeTy/FvdJvh94GQqCLJKDhTNqSiLazj13Eavw/gBp8apubAnx0OAA7Inxr
 Dj7buW9eM+FCyecTz0aKWzbwrYVQE/nZw4Je/oCi+HXeN6kUfdhU4HK
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 6Vumu-7GTilwHJBJ87b_T31ot2p5LWFr
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684836f8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-Vf3EJXieAsgESLsksMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 6Vumu-7GTilwHJBJ87b_T31ot2p5LWFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX8MRuNIg2npAw
 LzYl9ZC2SxOKRqgHi1ZJJ1tqdUQtsxkkOkUHtQR7RCKl0nTAnga6fNHM5Wjt+xLNbUEm0CWdqwq
 LB4xKrGwpUS6D2QAM70TAf6c81qVgEvHG+oYZgL3iLI7Qpn0tI8yt2MfhOLib3RsoD7VUOExytj
 3tovsxQIRj1uMuXyDGpQYLZlIfF5arTuSVy4g4uNSViIa8KmFv6kT6y+yr40fSfIJhKlY0JF37v
 Q85n9kAFXsLVPjkG9KHOT2ALORaOKEpZn8NnLpJqNYa/k8KONms+x5muFLmhIDOYRGJnTt9hGz8
 s+r+K1dDlov1X3ntXpHMLBtv/ctpRt7uFYIXzvM4gp1ZiOuXVcFUXTN+8q0LHXY3vM760SSbjCy
 Kol5paYZjL7ypKAxEIy97T8Lec5OT6PTrmZGsZMiqm3YeFaB5Z//fxwYOkL7OqjnOoBANWCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     | 20 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 10 +++++
 drivers/watchdog/qcom-wdt.c                        | 43 +++++++++++++++++++++-
 4 files changed, 72 insertions(+), 2 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


