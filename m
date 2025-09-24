Return-Path: <linux-arm-msm+bounces-74623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFFB9AEF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9698D1B27F41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 16:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7D23148D9;
	Wed, 24 Sep 2025 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDoQF4iF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3E30CDB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733084; cv=none; b=mbY3p3/o2PkEA2woLPuOWhg7Qf1MWCP1e3MSx1F7nP3PQNoBdj948m4sHcz20BzAKpqKH5vIDa9OkvXJpvLEg64SbrsPlYA3SKbdMhF0kwyhdBqniF9Z8Re0jKGP6MJR/0MyRPA/bcFpxKQOjmXai5kE1ysEFrgAZms3h6FB2Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733084; c=relaxed/simple;
	bh=cfSBFwSjwoQmCQsFiqKfw8JSBHbIagNIApfS7uUEC/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ddp7oc+zr5dzLVjJoXyq3jTCsz73p+xMBJJxiVBxWIhRlxiAmjsbO8rmNyfC7Y45jF/jBJUjuOPRNKUXJ7DYhiI06vvSbcMjLl4IcL0LJP7LQMJHHUtPYA6b6Dd+gW0k8NZS/WtozWEJwsJjKmKJJYfmAt7efzgUiyxaJU++GVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDoQF4iF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODKWLO024010
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eWtPgG+KOFtNwSmjhrecLj
	9/bPWZBlTGHCrdFRicffE=; b=cDoQF4iFZeID/Lz0bQdFvy2um1Gnfai1XwUJkd
	hWpZIGpXx/Ja37WpG/Nwa+aGZmamXIvylUDwDz3tGYtcSkdl/Gl/89ksFbRsvZv1
	MQw7TsFF8fed3UetknP4QIpCr9TVeWQ9BILZT/yIlApz5aheoFtjyFS1vbboB9Eq
	HbPjtyXy7v8pC0gUpVto2C2rYr12QwcNPWT5jDYbirGSOpKkhOpG74Z9gwVQVSwm
	6Mr/1TNSaUlfyruFgrfyfNYdHKXnoQnD3plr9STC4wSUtLU79SdA+o+VVtbWdJvm
	foZV/j/wbBFTkOS4NW0wgSBu3plpegZqR8CwYrGeNVkX1rLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0c4m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244582bc5e4so97685ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 09:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733081; x=1759337881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWtPgG+KOFtNwSmjhrecLj9/bPWZBlTGHCrdFRicffE=;
        b=XKuUYIW7aS4Am0d8cT0zI9EPetyAqQVNcevFcj9mzrHziUuvhnAQHppJLEJKRvINmL
         9AgOEFYBmfKndOSLZktMFCQTmXQEz9vB+G5nwpEEaPJYfODaU37JE7gKHRO7o4834/By
         AQrCEvvsJzfD4dhvhCREdN4KO04RzJ/T8vl2eDc0DXoFSHekvxhDWKTHA7lRtDVFrQIK
         AdepGAn8Csae8YNVemYgXavjXPamg3AuYBrWfx4tNlmzMqIaZQC6cTiiG4m4GNSp8cbH
         RtH6MQrxRA3iZ+k4tIszy8rQ9+WShFLHtCKsXEsWvdW91y0KH+x4uGTNOkD2QuD1uhY0
         1tAw==
X-Gm-Message-State: AOJu0YyCY+ToIyUwPYyToGeup8xnihHm31IoZozkegQSa5rsmt2kMwGD
	IR/r07v4WkhUoY2AoYTg8g6aetKvvh9eaTlCSHBVqy3DWw9ZLIC+IjXXH4dNzWJj5oL8/6PtyNR
	Byp+wwZXKe6g5MwGV+Blo0xUHJ55Clz5q8Pay6jHUtAFRjx/ZtJ6MqvwlwG7m1CjnB6ZN
X-Gm-Gg: ASbGnctuNiG+rZ6Q5pExX8wjvEezH/6wJUxDCN4bT4Mou4pAo68ac8PeCCDSifxvVzc
	cGXhJFYukvlfEEUq/eO037y8/nqnGhwojLw5AN66oVq8OpNVR8kN0tcI6Qf1Y9GhbS5NSHTbAjz
	J7RvNHS1xQBjy7hgiRFNFC9JQcoM70MLKy5znZkMKsetXCWCVp+oBG5WTcU5+AbGD8JPt+GRbwY
	BuOmxl2LIecOWg6avKokfd/5eqO2rogKxGP4QcPZivKdL9TiidAb8NfFvUGHwkeNOGgxPOWdqtT
	VnjhlSW9q0KgGDBbjnK56MnkATyz3n5PEOeL/ng2JY+JSUat2tB1zgA3wyXfAClzhn8qU6+HSnX
	dMzH2mwOiyVh5dWJxWU1uTj5MiA==
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr4109595ad.22.1758733080623;
        Wed, 24 Sep 2025 09:58:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWZp/jrEz0lysruVEq/JdMwVzqihX1dhXJ5tU7EkYr5wM0PX0RonyN+rLKNBO7q8AmofqUVg==
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr4109275ad.22.1758733080164;
        Wed, 24 Sep 2025 09:58:00 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053078sm197415895ad.10.2025.09.24.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:57:59 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] spmi: spmi-pmic-arb: Add support for PMIC arbiter
 v8 for Glymur
Date: Wed, 24 Sep 2025 22:27:32 +0530
Message-Id: <20250924-glymur-spmi-v8-v2-0-202fc7a66a97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwi1GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3fScytzSIt3igtxM3TIL3TTDRFPzNBMLSwsjEyWgpoKi1LTMCrC
 B0bG1tQAWC7R6YAAAAA==
X-Change-ID: 20250924-glymur-spmi-v8-f1a57f489824
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758733076; l=1410;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=cfSBFwSjwoQmCQsFiqKfw8JSBHbIagNIApfS7uUEC/A=;
 b=lDwhFqEMR+CJTxvPgKeazeYLPyQAmXFBVgRkdtoanUmV1WyEYLVghRAWVXhsTffXq/EbTz0g+
 pa1dUSuv4TjAdj3QzKbAb8CRtcI5GTgxDd6MjEUetwiwU4aZzV/EgHK
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d42319 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xuEifUzSIGPJdBs7rF8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: GEEZMRNBzHW_MGkW6cS5JbQBNzJbHZ_1
X-Proofpoint-ORIG-GUID: GEEZMRNBzHW_MGkW6cS5JbQBNzJbHZ_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXzEz3h2gFlK+y
 5SY/WuaAsiA7PDcvbZXt5Vb0HqS4zO+74ryxRDWXrLpuy1i4jBPe2xnWVG1KFjQRKVMoiispTQZ
 H81mkYEsHTPDbsBBQtYAoC2ypb2in+DvoTYiDzt6ugSoY5IR0JPQXMUZhfrucfP6Hl7FfEVaQ/5
 8YtHIqpIbnHOOeu7SQSZdIXxD2GtuahMUUoxeaMGzamwR+f9ohbnHOrO6pkbHLDsxUH73ggCzJ/
 De1J9wsss3qw6yPx1hhof9V/rZ7xUjkDHJu+gQujwMA9J5jKR1JXDoxnN2Re//WWIvKxOUXVG3U
 COfPTwMPDuG7U70+YHiKrglaFaP+wYslIlVfHwiMSpM0AINfljA23RXNpUu93XyOJR1cRfrBy/S
 5rt7E7GF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

This patch series updates the SPMI dt-bindings and driver to add
support for PMIC arbiter v8, targeting Qualcomm's next-generation
compute SoC - Glymur.

SPMI PMIC Arbiter version 8 builds upon version 7 with support for
up to four SPMI buses.  To achieve this, the register map was
slightly rearranged.

Device tree changes are not included in this series and will be
posted separately following the official Glymur SoC announcement.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Changes in v2:
- Split into two series: SPMI (this series) and PINCTRL.
- Included the DT bindings in this series, previously posted separately.
- Fixed kernel robot reported issue by including bitfields.h.
- Link to v1: https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com/

---
David Collins (1):
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8

Jishnu Prakash (1):
      dt-bindings: spmi: add bindings for glymur-spmi-pmic-arb (arbiter v8)

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   | 158 ++++++++++
 drivers/spmi/spmi-pmic-arb.c                       | 328 +++++++++++++++++++--
 2 files changed, 456 insertions(+), 30 deletions(-)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250924-glymur-spmi-v8-f1a57f489824

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


