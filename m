Return-Path: <linux-arm-msm+bounces-67676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197FB1A191
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E9B7188A322
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 12:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1842325B2FC;
	Mon,  4 Aug 2025 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkzzhEWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042425B2E4
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311354; cv=none; b=rAQ3uC8Hsdgt505TxgGi/lLylrBV3miGH63fhcoT68XcheEPkG6QleLHvfsy13t5lLXw1LG/htBMxGNX4HZxkXCVB25LTnFk9mIrNHbTPeiI0Q+QHD0w0CYAl+Llg6RPh9Tah2Fo7grRAcqDKKEAETIYXY6yFAMfOiREvyuemxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311354; c=relaxed/simple;
	bh=5jNeAtqRlRHIfao+1ZBtyngNGOGyS2FzkafomVLdz1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fg39b6BI9GhxnduZ2wJpODfuebrfUu4v13m2gfuuFZnIYRDEVJzYAUTDLAUITda1tt+3Q9Xchj88qIwFBseeu0uQs38wAWV8n6XmI8lSbJDiXCX06nVV6oq72/VYXvPeNZYfuK8Bos3yY1AW+QySWhPBpIWbNB7avLsM1XUOf2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkzzhEWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574CFori022425
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 12:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qND7eaxsDP2YPzCmQqdenq
	TRv6C53QulbhoZonDQY3g=; b=QkzzhEWMpf04esR7GHNFhWVzSRpYXF/4m6wB8g
	Jamr0hpExVesI04EoauCvUwjcrLLx5KXuSQWRyL3p2up5pK/sewZsLYa7wTez9r6
	OD6keTtzWGGZZMp4CvbswLsqbaw2WU2cNKewB7ymLBY4UL/a2/witv0RPvnSCucb
	ur+TzNpLhOI+Loem6mJN2uaMIN4d52GGUXn62bvXxx5Ro3cQf6ioIGceFDMJBCod
	GqqlXi3uB/XrRUphQxl1uQWstwYACP7L75FaMmZeS0/dzLR77UuJDJZOIudc2Her
	9bpVVOokDEX4P6EyCMlP3cjd4vvF0SzjLpkOr2nPceb1BnSA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc4wxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 12:42:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2425364e0b2so20587765ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 05:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311351; x=1754916151;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qND7eaxsDP2YPzCmQqdenqTRv6C53QulbhoZonDQY3g=;
        b=nveRkHKJJxCoB96gAMM3IslWe/qK4y+DC6RYa0Oh2WAt5zcDAk+1pL0k1VLj9LDs3/
         7jMjzAvPEHQb2WBQ1ekgTdWkl6Zofaqs9NSLiGkV1hZ3tRRgs+q7JpKU5EbwiU9iUOgY
         190ZHlUasUmnGzfz6bDRQo0HTQ+mu8NcmlYVagedtV6W5Le3btkk8eksFB7exOtGogtk
         blwb9TjEDhIKqGZNExYyU5/dmluqOnvMjFHmOYYXsVBRhrqIKi5EBW4xfMZ6olRSJY7N
         TrAWk+R4fNaKorxMuBAEHbVS0/ZBR21DaTOAwT0ivQ6kA/anVmyoXPJlQF45/WkqsHCw
         Vncg==
X-Gm-Message-State: AOJu0YxDF3qDqyyEKMso28q3pHO3N0KC3lX/gHOCxCYW79FNZpx0X8H6
	uI7gB0X3AP1PZ5PVghGhFJt/mSLduLsOOnd3odTTFymmNBwL0BFX4XFlUoVqDNF5vhaAAqpP+qz
	03XgTgZBYLRFLql61VIpA4lhtpCGNAOfeTScnMuWMg5idTg333jHesCxnlRX+ZuhsNVaM
X-Gm-Gg: ASbGncusG07CcB4p7K04Msj6t/+aCNT0sMX/2aS3TOtuPV101DwlMUW6nqYZLRVHsnS
	UDU7k2X4RUyBe7kWHv12ayF4TSh6O67GeVONxbxOhxKeSz49UMVTU0w9LA+cSeHRJQfNk6GBTuC
	XR6ff1mkmHOkopcc6aTLMpBBVY53Exab7PasPqdR/8kRvqIAE7xpDmmgZwZNKfENI04aOCcW9xp
	s7U9RPTBkyd1Qo4ThJoogSdranF06Gtx/8MuM6pWRekyBvel3r7++UqCEMqMb8nYF4kei7VvyxL
	jW1CPoSVRht2R4inN7Ia9keFEhdqLjao478JtBrx+eJOvKGBwQBye7sBqfqflX1erfE=
X-Received: by 2002:a17:902:f68a:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24246f5af77mr145455375ad.22.1754311350804;
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG07rzuN1fGkVlEDwaXMjcJKT4QW5T0QWL8B3N6dJhvgGjnkR3R+HIt1As8+4jwK2M5o5BtGQ==
X-Received: by 2002:a17:902:f68a:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24246f5af77mr145454915ad.22.1754311350374;
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/3] EDITME: cover title for mdtloader-changes
Date: Mon, 04 Aug 2025 18:11:48 +0530
Message-Id: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyqkGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMT3dyUkpz8xJTUIl2IfLGuZWJyoqlpqkVymrG5ElBfQVFqWmYF2Mz
 o2NpaAFv6VxZjAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=840;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=zP+SLmOOtTIzO9h/zziRzrIH5ayjpiu27qhU5x3QZj4=;
 b=rX93wR4WgVYLlBcmB1rP7toMI/2qOHb6pLI8G7KQoJvGrWbEZfhFvr4DTzgeHlDFnC12NCLsJ
 n3B4pD+68yEAYtaMDGR+A80oiHxe30L8LX/YjdLYpSdQVaMP+ZMUXf1
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: cI2miMoaOSY6lqOfuZgtpdqkS2IkkrBT
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6890aab7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mWPGPCZChkjDq24jzmIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cI2miMoaOSY6lqOfuZgtpdqkS2IkkrBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfX5Hrvaf6xaEav
 +s8OEIW4Qc5Gxq6EQyymapEfSJT4R/Nn+iiu4RVgxkhZEyBpBG1J4FcjsqgnsiqOmcfYkZEbwex
 BDwhMjShsOxrfPzAH7fQAZQpJdGQfUXzsGY3TRgzUF5+LQxL5rqeokSQRYbMXdfYjWX0aGyO+po
 Z2PLRpuwp+7herB2zjwrn5Y7inGUO2nt5/S+01WWpZwT8TQ0OfUncR5FS+nuueAJ6pALH0AsNoj
 OioMWKpC5+QWckjh35ddJ2WgmKXdXK5G3VmhXsfhyC14rQXrD19TnesNXw0AmfV16CHvG6uqSSm
 Jx3TB3mH9qT4K7B26Ovssi78TdpX5Vl0zduP+9ljyccW6FpY5dc1Mo1y51MoVxrqIbZEjIljD/Y
 Qu98rgHaDGtILosMeQinqC18/p2c+qxFxPDxHHtTf6L76BLRInRjnMfD85PR3ZQ3ATbxy+Tq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=822 suspectscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069


---
Mukesh Ojha (3):
      soc: qcom: mdt_loader: Remove unused parameter
      soc: qcom: mdt_loader: Remove pas id parameter
      soc: qcom: mdt_loader: Fix check mdt_header_valid()

 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 22 ++++++++++------------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 21 insertions(+), 25 deletions(-)
---
base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
change-id: 20250804-mdtloader-changes-9aca55e8cf37

Best regards,
-- 
Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


