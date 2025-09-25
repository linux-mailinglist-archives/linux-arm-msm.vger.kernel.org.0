Return-Path: <linux-arm-msm+bounces-75170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864BBA0F11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 226C917ABC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E2827FB35;
	Thu, 25 Sep 2025 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpuWLfeB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9DA1E0DEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758822573; cv=none; b=ScLhLWOV3Hb83PTy+3Rf7oX9Ss9maJ30IsGeSSm8sxdwXcL4D5wiZDOBFDh1Q00UtyGRCbXk8jSzMFwY0WQIer6rIPB07uiPLJtuQYcdDI54N3FhYbLTjH2gw359ijThLJhrwcq5gkF/zrTtYf/bSjI2S3xILYDyK7q/1u0WM4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758822573; c=relaxed/simple;
	bh=LDbHK0/FODwoPzG7/m0+wIT8qiWGIpuWGRZkbCgfpzU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=JMPg7rtdAR/TqeFI1CyU16fHg7OdTTUlQcECmp0iT2QmdP31mucLGMTfhQGdr8UD39XTjRUKq8E+/DkP2flPyzYhiHMYxMvLwkFOnae4pqA+8MxCXxbgGMFNrAzjQafCo7FsutiNQdbt0/L3PQqyH4akGSHYTDDaa6cylN/L7EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpuWLfeB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9eDQQ017456
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gX9DRscpkhjxfgEzU7f3Ex
	PfamWLQ5MYLdcslTgFtyg=; b=hpuWLfeBO3GO6tW+8eAmrAhFvRUkck2AUx5qih
	lTU4jV7e1Zojpa2RnRdjOsz0B2na0HRGBFS6sieUTtn4FVtZOX5M35pdqmu7K4jI
	qmlMMN0ptSOoPHqs08uk8tHCVm5IiVt2mhNm6qlJgb5UOckJora3Ff0sSFDuDe5E
	yCshhGQyiK+6GECUFYSb/T47h/aPMDI6QzlYUBXtCBlN24H2uGQCmhNI5RFLrlnR
	Vf78c8eDW3BqtucvMqxC8eByexYZFsJ8J9sriALjrL08GndEHVdGZB1KYVi6ipP1
	e8GBKMxnI6Olz9XWNL0zwLNceucJ6BKE2brrsjlcTjRg8Hcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk2de6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:49:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4f87c691a7so1989011a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758822570; x=1759427370;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gX9DRscpkhjxfgEzU7f3ExPfamWLQ5MYLdcslTgFtyg=;
        b=m3TNWWH3y672JDTjJ6eWYn/ndIfk8vKiDrC1IC+HO9fuwd7+5fh8x9OBogcDJUGoKb
         MiCzQfCvebDCoqS3FKEAmDCY1piaoWKFQJtAiVictcMMzDqefHfmd3O1cvV5HSVR/Vme
         iuKXm04Iz7jojHbD83mPP6vqoEDLbtgYV42KOHzyny2ZmTRkpYOJ7leVFpWXKnOYZPbi
         gGBqFaebzZNhCXRw3xXKqwaIcUb71bZWRj80E11Dp8iM9g2yaNRBa6y7972twoMWjj4Q
         hKNWhGwDQhEyi4JwNinktjEiuv0mV0jV+paKSYy+zIb5A2LEQMgeDLzOvcMCxtINC06J
         JE1Q==
X-Gm-Message-State: AOJu0Yytg1tsfzmdIBILy4ro537DU6G8IOc4pq2bBpx0o3w5XvNLvc5g
	eoUJbwMWkahURKkNcL0p0Iu1QpEj5rNKoMDGbJ/+f4M+HEoWF8cozOxWKCPoD1ZWmiiTk+FdXgk
	RMCiAhBFLtRLfYgtmk3L9LdfLcvQLkvDIlF14nhjX7INDJodDMlrRiXRZOH7anbjqfT6HuwmwhP
	Ix
X-Gm-Gg: ASbGncvrtfwVAuTzh3k/GiPeOOyHYceTpK2cw8g39fc8Z2/bzV/8N0+SzjapI4psPX5
	p46Us0PIwqZl1vwHhIEdy+S3xGDah4ohGpXa8WCznix3zIIJbpKKUnmc3VS5amTCEocwGUZ+Lqf
	KHGraOIcTaIryjLEmkIJlnwJqPgjkU+KGRkV80S7nwJGf6tjtsuOpnuTht8Rn6Fw/f+O7Pfsd67
	mQtsdgG01GUwrb+YoQLi+aaPsZsg115IxySetSUMXbAAWgM7/MTmgjqfLA8RXSlbi2wzlN2AbeX
	ONjpyj7PCOtszeBuU9ILfXRLuqv9juaZYT5zkhA4sZ0ZZRfJHWQzXKaBu105gHXRUMyaO7C6of7
	fxdpgZXtKZ8YTPw==
X-Received: by 2002:a05:6a21:32a0:b0:2e5:c9ee:96fb with SMTP id adf61e73a8af0-2e7da1802e9mr4868610637.59.1758822570191;
        Thu, 25 Sep 2025 10:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg2DPinpmga8mmhZpvMDR+SEkL5C2TWcjGjEd3RIihfvAtnbRl78kmv6NcBhgLuffbNiaq0A==
X-Received: by 2002:a05:6a21:32a0:b0:2e5:c9ee:96fb with SMTP id adf61e73a8af0-2e7da1802e9mr4868589637.59.1758822569672;
        Thu, 25 Sep 2025 10:49:29 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53db8d2sm2702839a12.24.2025.09.25.10.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 10:49:29 -0700 (PDT)
Message-ID: <bc9e546e-d560-4088-a6ea-937009b8343e@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:49:27 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PULL]: Update firmware for Qualcomm AIC100
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bmzz88oh6zyNRQVEtA8X_C6S_25skbZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX6jhuOp6pKCdA
 BHN4LrzMXZGPnIsfoCthFFGTFZ8LKABGrEVCm/RvfF+v5wTKfs5rW2ouUl3yY5w14KMjoKUwdqH
 ymOCwnw//8BCl/g/I4PV/ZBmjUytt0QHUve2CMbTJ3HoHG8BI10nXbQQi3ZKbsJjfkNZEI1QFHe
 07zXF6SplUKDABa7O9AAfCUoa3Go1BMaYrWLhHZsbBvwtMfX71QV9O4/fsmnHlhHQ+YqNiPK5J6
 QK43/sOvuQUnw/LyPYXh7U2CjGocbDIvBM/rKnaW7NdDOclaVY9pG7zrSnGuwK7OW05Qysgie2n
 H7gnDB+ynZsqYr46kVPXP5WH96fXRGASLi8QJMU3Ja906AIR5CaB3LtJDVSQCkB2QMrWiTYVNMq
 Lo+wVvHm
X-Proofpoint-GUID: bmzz88oh6zyNRQVEtA8X_C6S_25skbZS
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d580ab cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=adjwM9f5GbUSincbSysA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

The following changes since commit 1269106c61a34b8f65d045c8045df880083bd3b1:

   Merge branch 'amd-staging' into 'main' (2025-09-24 13:46:33 +0000)

are available in the Git repository at:

   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_4

for you to fetch changes up to 19c12c41c84187a9fa1df1b58bb6f72a181ba620:

   qcom: Update aic100 firmware files (2025-09-25 11:38:38 -0600)

----------------------------------------------------------------
Jeff Hugo (1):
       qcom: Update aic100 firmware files

  qcom/aic100/fw1.bin  | Bin 2135752 -> 2180920 bytes
  qcom/aic100/fw10.bin | Bin 249439 -> 249439 bytes
  qcom/aic100/fw2.bin  | Bin 783512 -> 812184 bytes
  qcom/aic100/fw5.bin  | Bin 24576 -> 24576 bytes
  qcom/aic100/fw9.bin  | Bin 762704 -> 787280 bytes
  qcom/aic100/sbl.bin  | Bin 1048576 -> 1048576 bytes
  6 files changed, 0 insertions(+), 0 deletions(-)

