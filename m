Return-Path: <linux-arm-msm+bounces-79368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848EFC190A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33AF246343C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D2131619C;
	Wed, 29 Oct 2025 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAkAxR4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvRxu55r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C8730C37D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725724; cv=none; b=dth43vYjo0h+gmhACne1UNEGdnFzV+TC4pl2iAZxWiTrCLg/cLy5GMRmt02j+6PwSfnPVv9mTgZu0l8GDvCT6vGFjidskjKy2KgDO34UbEprf4rEEmkcw2MA+5DfxG6H8kdHCnoQYOvRDHJprfhKoOBmnCYj5VHX2wK16HYKjv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725724; c=relaxed/simple;
	bh=7lqMr+ExKGqq9xEZz2RvPrwiybtbEXqKkTiHyGiKTbA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GtAkjXAuk1AUgdeuoj9hxhWFqKkCw8EIgvz/Ah3mqJtICIakLHD3hX3nKvVVbO54gnp04cgzisYWG3JMuXzdJTrLBBBcX6etrVmzUvU1m5IaCymLA6rPBO3NgKDg5wOhnItDpzvke4Z8sDJGQp1EVIFDD3V7kIQ19LM1ws5VXx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAkAxR4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvRxu55r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4ut6x3642908
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dzmTDrEk6TzniYpDlHIL+a
	ZTiwXopSsI7a4BrartT7Q=; b=HAkAxR4E2JUTXNMNxPOrmAV5eeGtrhWP4ZG5ck
	5YmyF/KAVUvqcEihKB9Y9siU1GCf1N07145IlwhSdPdQI1fLn+8Mxbmjc2tJK65V
	oP2O6R37HpHGqIBzex6AxB2fGizzHlH6snjk3PWo0PzAavacn2kBDxQ0nSvh+zLZ
	VeOok5QyRJGpAZe22nHfIby19lAQXTb5kpwIqXplA7dDjKEPYRq+zpHrC6plb5Gw
	YD2w9qDwu8flQTsW4EY2SnraMHeE7zE4Kh/WORS4DexHXB0MZkZobY3tJ8JSKoen
	bN7867IxOLbM6GP8BvCI7Yc5HNNUpyUgiSykhpcYeCihtn8A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hrmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:15:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6a33319cb6so4780258a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725721; x=1762330521; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dzmTDrEk6TzniYpDlHIL+aZTiwXopSsI7a4BrartT7Q=;
        b=BvRxu55rfYoYGlp0U2+5rRRw/q27TXGzltc0q0h1G7b5Ri2mx3oyOaPbOEUTB/rDAK
         jFF4QDBZbNdAq/XcvB5y/4PQophg/6BX9vXWOIF0HB/Vhz3m+VW6a1hkjGA+a/UDRpFS
         OpeFvLRwQy+Mz0a99G+HNHou45jGaJyclBus+5TpQsudC/3EBf0Sfl7UJZNNToWC07q9
         jFHuHXXQ7HWvBv9hrv1lBc3crLn+z9yV/RnGE0BW4VJIf4A5Pgy1RDLBEIpab+KUh8ml
         ObjprVVVEjiHIUJrlCC+0EaTuwXPsNy+1HfGouOnK8VaPapNcCrxzABou2kI5Dsa5nB9
         9vTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725721; x=1762330521;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzmTDrEk6TzniYpDlHIL+aZTiwXopSsI7a4BrartT7Q=;
        b=lAI9CLzFy8mMXz6f2azqdCQ4eoja0PC55KjOluBBILatnpIDCtD65d1sr3wJpDQiCV
         mF/43Pm/2ylD1p2tai/j6LzSzm/EQl6W4RzJqv4gbBqWgYcwhURv6srdSsRyXJOOk3B9
         GOjNUTw6fxS7ldCbIlgAC5mB9Vw+ZqeSGt78KsueLy653F9Fhu3BoIqWwPhI8SI6/YoU
         KJn+Agg12/J2D8JjwDZyuKpUvm0CZ8zWNgEdKELwfiPkTlWLdAjA/LYDYS+iz+VmV/Qt
         x5ITpRofw+D5vcSKoFIVMxn2F8lP9GBinvlS7D5NRNdEO27mxdL0xCziZt1q4/g6ZYG9
         oYfA==
X-Forwarded-Encrypted: i=1; AJvYcCWaIU10n/2g+fv2+HPS9WaoLdTzsvkAYCt/5eaqWcVJXoi8sx93U4X8dWlrk6MzXE0fblqhZXJvyentlYsb@vger.kernel.org
X-Gm-Message-State: AOJu0YzSDSWttJqoHbKkcPLVPIB3rRn+H0D1t1pljD4JV8f1/mtU2x3s
	O7vJJVc640cgrbPWsEKF2HArVlIEMIhZh0PAdZ8wUQUW88KCJFPm2Rg4xgKLwlHK6CIJke3thnF
	TPDPkruVI978p9VL5uM+InFFPWiwKNAP0j15NZfTB0Qvx5YIGe83mwryF4/sK2MN62WQx
X-Gm-Gg: ASbGncvSoaCk2kPQgP4vbkKGhNmAAzJS/+mYng7Hxr6TNQhRDFC1KLfySRgB29ohN0W
	uSLBRfZ+CC11H84hMyfutzfYAXDNNnIQFciGTUXDlc6RCa4n0tvLwDOK2xJ15fxlYbXWdrVjvsG
	UeUJ20uRCZRWmwrtFDVZw7SHUEtdzDAi5Qlj5+oti9s07NiJy8rDej0OiW716JdZvXHeNOEvDNE
	JkS1T2PrWfxirS1kWntVTiQfOPV8Uvq/mssbtr+oEYya3FDWRANvOpNRlJP52p3irc0WPFhrED1
	YNhcIHRJ/1ppTx5EQHTSHzELDxfJc+zdlkIlwSkcOFqym+Ck+xlq4VxvBbK1IeAuxLTv6mhpP/D
	Hn5BscjOvoijo6nx/CkebzZPif1RAyKlZRWZKf9U7nFqNwZgz3g==
X-Received: by 2002:a05:6a20:938c:b0:341:9db0:61f1 with SMTP id adf61e73a8af0-3465194f01dmr2704529637.16.1761725720523;
        Wed, 29 Oct 2025 01:15:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQtVLq5/xJzRFyBCjgvuxcMCuOzFErJQX4mo9DcKZOotudDkgHOtpKO2oS2LJYkzab+QcQow==
X-Received: by 2002:a05:6a20:938c:b0:341:9db0:61f1 with SMTP id adf61e73a8af0-3465194f01dmr2704491637.16.1761725720024;
        Wed, 29 Oct 2025 01:15:20 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bdb2dsm13187901a12.5.2025.10.29.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:15:19 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] dt-bindings: mailbox: qcom-ipcc: Add IPCC on
 Kaanapali and Glymur Platforms
Date: Wed, 29 Oct 2025 01:15:08 -0700
Message-Id: <20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3NAWkC/0WNQQ6CMBBFr0K6toSZgFJX3sOwaMsgjdLWjhIN4
 e4WNm4mecn7bxbBlByxOBeLSDQ7dsFnwEMh7Kj9jaTrMwussIEKW3n3UbporTyaGlo1nAAQRNZ
 josF99tS1y2w0kzRJeztugTzGTRsdv0L67g9n2OS9XSms/+0ZJMimV6SsaZTu60tgLp9v/bBhm
 sp8RLeu6w/VYKFqvgAAAA==
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725718; l=1310;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7lqMr+ExKGqq9xEZz2RvPrwiybtbEXqKkTiHyGiKTbA=;
 b=abWiMwO/4KlhmxW+qY01GZVoAUUQLSAl4T8evTZu/f0ZwwSbpeT8gY85aqW9jK8rKezJWYjW2
 45OYJ2pw0RDAUtYDemu1pdyCVCiu2tKqwwRUnlbjrzyqdWvuzkdmGMK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901cd19 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6bbmqYmGk2oNw1X70Q4A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bgwmhnpQTJBkrCs4A8LPoP3MWJz1FV4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OSBTYWx0ZWRfX9UnI9U9L+h3I
 ktqiogbI7fOqsly7lLOUI8BCYoXLGRP/dIJHoJZCtkE1CgIZNmn20qCG2AYa0jMZm6uoXKyrsyV
 9Rby6teziCu620Bzc5W++LUNp73FiA1nQ1H59nqfYigCrEc92EbHc+GBUhb3mziyTGKeSnAWp8R
 L6Rge3MF+b5iJynqh8m+0GvPFVO0HNSW21capYt/nJRUY/00m35WEwGPBgbcX3ZXb0OfK+q6bDH
 hHmjrMkbOuZdzpis4kbYuFWBiSrR5i/Bjp6WOPrj+h0vdcN6+ge3wI3vtMfxFflEKigv7V+xwsm
 ElXygkQHX+iCPHmOModnfQDmWiSQoD0R/TteKNvf4ex/Va8N9yRxpDBoUgToNTBklq0OC0XqL6d
 4+J/lKVgVb1XuyNmqeSS2mT7svKzuQ==
X-Proofpoint-GUID: bgwmhnpQTJBkrCs4A8LPoP3MWJz1FV4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290059

Add dt-bindings and header files for the Inter-Processor Communication
Controller on Kaanapali and Glymur platforms. As virtual physical mapping
logic is removed in new IPCC HW design. Physical client ID instead of
Virtual client ID is used.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Add separate header files for different platforms
- Merge binding and header file in one patch
- squash glymur ipcc change from: https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/T/#m186ef6ceb50936185d07b81e2d36228a5a361d34
- Link to v1: https://lore.kernel.org/r/20250924-knp-ipcc-v1-1-5d9e9cb59ad4@oss.qualcomm.com

---
Jingyi Wang (1):
      dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali Platform

Sibi Sankar (1):
      dt-bindings: mailbox: qcom: Add IPCC support for Glymur Platform

 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |  2 +
 include/dt-bindings/mailbox/qcom,glymur-ipcc.h     | 68 ++++++++++++++++++++++
 include/dt-bindings/mailbox/qcom,kaanapali-ipcc.h  | 58 ++++++++++++++++++
 3 files changed, 128 insertions(+)
---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251028-knp-ipcc-6b4189f71121

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


