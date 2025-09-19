Return-Path: <linux-arm-msm+bounces-74247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A96D9B8B29C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 22:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5437A018B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3322B22758F;
	Fri, 19 Sep 2025 20:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDwcBzy/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2F1FF7C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758312053; cv=none; b=aPLliFWcka0nkosByu61XzNyZNKLBS7wf91Gq9LANb3COLpSX6iVeXirqyJIVbcbNiBpX3htokhiOVjurCy9ENSJEFo7RtQ+tyvwRIV/M/41TKrEECuLPMz7zUvAxKozrh1v/LyOXDcVyXOdbZfWqbfpI8lwPPN2xKJ3LYXeoRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758312053; c=relaxed/simple;
	bh=Y76S3H0ehzYEkiTShzQV2y4R/Ceh13K7kF+3QkotxxA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fMRPwKucNfZW6sG/p6ZcbcsnAPo1hbvMAAImWMtuvphc6fPNeU4DRkdUBLLPqFiSnO6QPeig6pzjvWPSRmwK4n7SOBL2Njkp/WH7uLOlJP7qN7e75D+3bRID46Fw2h826IwR/LZNZLlFZWc9IHmC3BMf3yDNGaii165ZE7aq4sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDwcBzy/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JF9mi3017951
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lrJ12YoUugvWUqmVr6hysi
	rvr/khh90USYulSQ7t+GI=; b=GDwcBzy/8DPyn3GAN+bnfFnJq313KVtz0Vzkpz
	2FBe2MhAeFHXgJRP0nO4srw5AhN3lNg8qCM35ZH0ShtshoZyDPCXGcK1yqZCwK3D
	3Oo3jw59u6Ml0v9I/QFoR4R/in87eRkbTDeSJ5W3Y2WMSD33oIyyvZ2MHfj9Z+5a
	53AwMhDAiJVPw15tpIj9WsI/6HqY1/qUI47C6rXs0M3XZMdkAMnFKPVKiYZ027gF
	XfDFuZwJdfGTx7kwVPC6VURFI+Ov/oBGEeuEDaNZMMIbRYBgvD559W05zPC19vAu
	TEMUEgAuzDXScZqfYJsNoXeQhw3drBzF3La0Qz8rScUoaEIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982degant-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:00:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269880a7bd9so26869145ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 13:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758312049; x=1758916849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrJ12YoUugvWUqmVr6hysirvr/khh90USYulSQ7t+GI=;
        b=Hck21XLDF0EmVmMJHJwcCIik+rEhRBm8eba4vhmazujths5KlJjoR9d3RkVKNr0lqs
         rGQa0Vn145O1xdEGnPyTf+z9/YnbxtQ8byAFrmjtyO00cgtstcSJr+zTio64/4LvkWh8
         EUS/HpXx7bxTeUjgUlg1g0MPjo7eCzX58V9X6AT8IOlRmPiyEKoOmQ4mFS95X9y2fZRD
         BRDIq2YPDfj8+gxfFQc2r4CxQh5TX8bd19XWQxZBRbHBZBNcet0bloMLugiPQh/D0pf9
         JWy9OdC/wfq2swkCe8KXbdMOhBqZvPSkQppSVN9XcPc+cRk3hfM0TJcTschMcubn9ynB
         wr0w==
X-Forwarded-Encrypted: i=1; AJvYcCX4qNArxjJ/7cLd0vOLfZk57Na5t2EogPZmfuGFsLxV8JtGnPdCDVwSvXgHlpO5twe0nHUnYRJkezXz6Bke@vger.kernel.org
X-Gm-Message-State: AOJu0YxjpM9QtruaIc8xAPzeb03gYDEy5uAbuUUWawDlPZM7LA8wE8G5
	P9nySq719Qp1PkXbJTFBzs7mtMct9Vh/xDrJYcOXXO31L7QcGhHB5w9rt0S9OA15c9uufNQBF40
	KcqW/JhAV+KxIHhXxnXPAV2CIphG0LGID5WQ+BUa6R4CmYU2ZUj1hjOkXtRm271g0bImN
X-Gm-Gg: ASbGncuDN45YkWApUPERW7Gou4Be+k27fYzlv5W1IKihT9LxcT6skkECUukyRtHNNrg
	hUgiC49aYclAWTWcoMLgvFqrEj87RzGm1NPKdai5xiw7hFSPboHa5a9QXKx6JP4YQKn8w3Pu2zz
	YKm9DsyyznTo+kmbkRcVQhe5+iR96OzshijPBYLQ5KdRnHozLT5SJHyVFPNMZ8kEabTahlCtRy9
	5UtVz/xLauDQB3WP17+l+ZTLCeLUrxqsO640Np9/519O4/rxCDkWAh816mbrU5vqI/PN5dx3vnm
	OMP26qWJ0o4oMIY9R3sKTeImxMUNe6DmrawwOemB0vjZ2QndLnLbYwSzwiDJnAtVxZybin9uw3j
	PPPj5ucCHIUIkDvZJdb4dB5I8DQ==
X-Received: by 2002:a17:902:d506:b0:262:f626:d516 with SMTP id d9443c01a7336-269ba46b4famr60376095ad.20.1758312048377;
        Fri, 19 Sep 2025 13:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdJEKRDdX/cjLVv1z/Bkn+SWxxdXbX1futxoBqIMDifIWnOaxRgKGgcPzg5IGgznJ3Sen6Iw==
X-Received: by 2002:a17:902:d506:b0:262:f626:d516 with SMTP id d9443c01a7336-269ba46b4famr60375755ad.20.1758312047941;
        Fri, 19 Sep 2025 13:00:47 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm63053905ad.109.2025.09.19.13.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 13:00:47 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 0/3] drivers: spmi/pinctrl: Update SPMI & pinctrl drivers
 to support Glymur
Date: Sat, 20 Sep 2025 01:30:08 +0530
Message-Id: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEi2zWgC/x3MSw6DIBAA0KuYWXcSSin9XMV0oTLQSYqSIRIN8
 e6SLt/mVcgkTBneXQWhwpmXueF66WD6DnMgZNcMWum7emmF4bfHVTCnyFieGBIv6IQLCTr9cMq
 PN2usgRYkIc/bP+8/x3ECVSTK2mwAAAA=
X-Change-ID: 20250920-glymur-spmi-v8-gpio-driver-d27d0fb36464
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758312044; l=1348;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=Y76S3H0ehzYEkiTShzQV2y4R/Ceh13K7kF+3QkotxxA=;
 b=saHwtTpFiei/wrhs/SBwfJdkRmxXPq8tLdmHZBnsIQLMStEpt2mkFtvnUUXEOf4SwtcS1FK4Y
 laQviH6uDooCoxJA7Ipk2fRYxYulmkWrUADvpX+mT8FvLPk1rlyP2oN
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cdb672 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rjyjYzsXQ0sINxRBlfYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tz24kmVdRO-JEvUv0mrxeQY5dK-yMw7z
X-Proofpoint-ORIG-GUID: tz24kmVdRO-JEvUv0mrxeQY5dK-yMw7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX8Nw1aZIuCeCT
 Yoj+lzWOxTRYrCF9IhNMrWlFiay3YFRmKqHfBWOkOxjGr95q61ThZFiwrqM3lIua0g5veNWuEsc
 J9qwzTB5KkEFujoscQPlalFUxZkdoggi6hqxtEN8466Vtyv4B7LsTzvkeTn7po6HTE9YNXQB4Dv
 hz05T+15Scy8bBrKHVMJcAHZTlI2CN74MDdVSamTxD1s6+iZtXeCK7Y5d+1mZgmehG1K6C+4HMp
 XRyWKIxEEkDfrxDsS1ACWw/SS4ieiYev2bBkjrRsjEpaMCfZ2J4F5ORvIYRf1l+piMMJ377FfFE
 olsMGbi3UP+iKjOdxUh94JND4/pRrLbz1B9G1imZlaI0Sr0TpBr/KBFk0HfZ9uxdeDdMzs0RQ+F
 Ryia+1kk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

This series contains patches to update SPMI and PINCTRL drivers 
needed for supporting the PMICs present on the boards with
Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted
separately after the official announcement of the Glymur SoC.

NOTE: Related dt-bindings were posted some time ago can be found in 
below links.

SPMI v8 DT binding:
https://lore.kernel.org/all/20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com/

PINCTRL DT binding
https://lore.kernel.org/all/20250919140952.1057737-1-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Anjelique Melendez (1):
      pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 & PMH01XX PMICs support

David Collins (1):
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8

Subbaraman Narayanamurthy (1):
      pinctrl: qcom: spmi-gpio: add support for {LV_VIN2, MV_VIN3}_CLK subtypes

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c |   9 +
 drivers/spmi/spmi-pmic-arb.c             | 327 ++++++++++++++++++++++++++++---
 2 files changed, 306 insertions(+), 30 deletions(-)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250920-glymur-spmi-v8-gpio-driver-d27d0fb36464

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


