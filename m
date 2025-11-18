Return-Path: <linux-arm-msm+bounces-82240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE9AC68B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id E6DA32C93E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD0732ED56;
	Tue, 18 Nov 2025 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gic1KLzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E8E2F85B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460135; cv=none; b=EYfSL1DaRbF7UMjFCHRNLh9ZvtFFEtIfLXe0zjF7y8poXCZBI5ciQMjGRKHBND/0WZcztpY8zRnkueoqjbG0zVdFvXqQPvS3kXe5SCg85ipl37XLe9aHwZfJ+P7/m4TnAA06zdFcJbLWrr5iLAleHcxJgmG4Aied4mHNZCs0pX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460135; c=relaxed/simple;
	bh=eVwq/4gEkODxQjANnf8GBdaYp533e/tmmhRH3w6klWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=azjGz0iSvJMpzePhw3T7kQwk9mA5L0ftCsQG9xqacVdvR2ZFiWTvdxAc+YZlZkYKXmu0R3hnAJ0v9/gHlsjgd3tW3GKxj4DqwtR1rDGX/fWkQDs2OT6F3iEKU5di4wXWH4zJIvzg4IygVdZurhMddmcTba9TBVxZ7PHebQOaDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gic1KLzt reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rLMn2664745
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=29WbPMmZtHkdt1qZy72QL7b3tVBAUu8SaRr
	fvguze8o=; b=gic1KLzt88O5Ae71pzXC+/whLtANXH570MlpmLxYPiDYNuBfZQp
	q59fgELenUPmd5768ECPqT4DT7xo5PiRj0pK03OFtNAMzLcEGjY38Ouz7XTph39N
	CiwMJASV6hqNKPPW1S2fIux8l0FbljUpAduQOmiKKSN7YZqfNHMfL6JQ7NcpXPGk
	nAlTFmbTGAkri3WKaXMe/DFPUQeXdKo/CWaq6Kx8v3kNT517jQB1Rl+VJX3wvo38
	ALYVGR/XJ+eSs1jmRD0XNxEz3RX5TKG+6JbMI2AJVnAWe3E3rC/nLmZLZVMJxmFe
	ytX0nus0/EcMNAzpu2I+6GZFtcb9qxOt1+g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk810n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso5337330b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460131; x=1764064931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29WbPMmZtHkdt1qZy72QL7b3tVBAUu8SaRrfvguze8o=;
        b=GZAahI8k5ofcb5DrvMW/dOq4SwW0QUxOrTwjU+Axq5oQPWR03DG8k8j9ZWkD40I4+3
         QEe1dvMIBsXjYzeODcusCfZlr4Tu5ayh+nE6V17JE9zW1sH8o044wtBABndK5EtIoFKK
         R09VYbR2jX40mN3tyUmMG0tAXn3aCML1RE9NE+FWWPMYKUkOvxovkqT8UTtRhfI4xY9P
         2RYA91tGKyicKgg8iszPid3Yytz9NZ7eQKKTk4sy26dsPfgvlXXKBgbhH+SLeROYx+8W
         TFDIPWTNuj2UsZmDl5H3aHIeO488EXwLy/JsE7bAF+/+D39i6ZL+Rem2/Ma+E2Vhplrh
         aeTA==
X-Forwarded-Encrypted: i=1; AJvYcCUSQ18aqrFVyC+TXUMQolkvBqNUrIuzm/xhFCLP05GVI/IyuB3mnN7ULM6Di5mG7krMDW5wMytPcvGcFMQd@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZ93MKHfgA9ow6bSW3Zgi1To75qA7INkzAuqBXoxE5RSmRbBU
	VSjw9eniMOngbV2DIXEp1nYURy21ZpLLmxb6e4K7bRlDgN94W30xdf9RWH6BN/uaQjiEbRpf9IZ
	XL+ORrjs1mOMxMJ5w7nTLOZwiNCFdmkxLxP5bfe6zSr23j6k0QyG3EgqM03nelSxw/zOg
X-Gm-Gg: ASbGncuTFFpT+s0dZUt556HvB/p+ebio+9sTUg31HsuwaSZz5aUbwChYx4JF9S6p6jf
	/tolywTo47e3b+d1mPMSeiSTtBJr3zs5l87aZKQclnhljjPTqM0Azd06JUTph32Omo5ez5R/cJL
	SRd2yfT5TW+UF+gJ8/caFrvLq8zkRzkHUIPL1j2Wb1utD73D7/CkyLSlfNaShjgoYomp5kwecR+
	WOZSwEKOfAcxZWPFRU8i0fBkk6G0pwS1jXXZfXyHi/7dKaIGMYCvIVYJ2FNBRH9K5gbQhZoozHn
	sM1zOv+fT+xAFsa5HPPBmPZXvcJpQThExRikJu++YwNZIDfOvL9IEAwbfz+kA0H9bG0ZoGxodIa
	iksM=
X-Received: by 2002:a05:6a00:9508:b0:7b7:5dc5:75b8 with SMTP id d2e1a72fcca58-7ba3c66bff6mr18534017b3a.29.1763460131115;
        Tue, 18 Nov 2025 02:02:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETb/+Zba0ifp/N+rXlcAF1v3+Xzy/JH2PnjhndExG2SVkRHLUm5qIp3UI+fN5+vOwZYmzw3Q==
X-Received: by 2002:a05:6a00:9508:b0:7b7:5dc5:75b8 with SMTP id d2e1a72fcca58-7ba3c66bff6mr18533964b3a.29.1763460130535;
        Tue, 18 Nov 2025 02:02:10 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b9283sm16120030b3a.33.2025.11.18.02.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:02:09 -0800 (PST)
From: Ravi.Hothi.ravi.hothi@oss.qualcomm.com
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/2] ASoC: qcom: q6dsp-lpass-ports: Add support for extended sampling rates and PCM formats
Date: Tue, 18 Nov 2025 15:32:01 +0530
Message-Id: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -Z9NYYKQJ7tAhZ6RQSdFzY4rjU_-izc9
X-Proofpoint-GUID: -Z9NYYKQJ7tAhZ6RQSdFzY4rjU_-izc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3OSBTYWx0ZWRfXxLZ311yTBur8
 XXRMOy4v0DTb0KQSLhcP9g1jq7wS9gDc58dc/9fsh8I3VgakP7eVCZ5YQwcNf99xloT8FZvFEr2
 /RcvSjYPhjg3pelTyU5/jqXcO50+Dm64sM5ax40hIS2gQVBUl2HGfLZSW0yEC6F62ODZ03XTa3H
 ay9dXy5aNhdjR5kx7Vy5V+dYVDpWmS3Bz6DRzsryzZUGDLwLs2xBggoT3SVmdFfXFg3lvpHCp/i
 D9IDA+o2Erbq0MtXCjRPPirjwEAh58wcvIywpM+pXZLEABC4emWPc6cOKV6i4URvW8sA2fBvEUL
 XAtG99DIovk5198wlLAWnRdjt4wbocZ8jnT7qwFZAwtZq5WABN/Um/UXFkTp9dejsWoS7k5bi0n
 UulYlbjRUQMhZBNE9ymseedNO90jgA==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c4424 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=dGAPf8r0MKmh5P99Hx0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180079

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

This patch series enhances the Qualcomm q6dsp-lpass-ports driver to
improve audio flexibility and support high-resolution audio streams.

Introduces support for a wider range of PCM sampling rates,
from 8000 Hz up to 192000 Hz. This change improves compatibility with
diverse audio hardware and allows better configuration options for
different audio use cases.

Add the support for 32-bit PCM format (S32_LE) alongside the existing
16-bit and 24-bit formats. This enables handling of high-resolution
audio streams and improves audio quality for supported platforms.

These changes are incremental improvements aimed at making the driver
more versatile for modern audio requirements.

Ravi Hothi (2):
  ASoC: qcom: q6dsp-lpass-ports: Add support for multiple sampling rates
  ASoC: qcom: q6dsp-lpass-ports: Add support for 32-bit PCM format

 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 108 +++++++++++------------
 1 file changed, 52 insertions(+), 56 deletions(-)


base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
-- 
2.34.1


