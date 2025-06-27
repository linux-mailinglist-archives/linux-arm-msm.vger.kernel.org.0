Return-Path: <linux-arm-msm+bounces-62839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90841AEBC6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12DE41C238B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4042EA14A;
	Fri, 27 Jun 2025 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joCX8u5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C82E9EBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039500; cv=none; b=HOEL5TFQSjUMqtKuEhEyZIJBGOciMlyNUXl4XzKJPe89LJO6U3nOCAX0AyazXziOp4A8GpWooin7fNnVZrbMaDK9lRddgcM3RUyyZ5DNnpuCUxK+vH8i0EWfMN/JaEk2TOoqHDJL6YD5jXnosJD9SP6dAGzcMImUrSNq0vi7YPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039500; c=relaxed/simple;
	bh=5hD/cXUbagplk3UVhcm2A2EqQSEIHADTEb57WitDj/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYC41EwSMUzrGSJeODBI9dIdHPOKdg7ZKw0hfml7PIe77Qcfz+jAN5UjP4PSPTYBcJ3sR6CRhThT57s3fLnOGzydLXiGPzyCDRaPTWIPZ3t9rUw8Phj7MML3NT26bWEqhQuR0RKQPENzY2D772/JKYJb8XoBnuOomgWnsL5sfaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joCX8u5O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCFxmY032644
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OVY990Jukt4echo3RExNnA9BOKm7fyhFlYx
	ouIGS2vU=; b=joCX8u5Ox4s3iYKTy220awF9UlwYq7mZJAzoEjecIBvrTODCDZa
	Y0brMQybHXtJmLbSY5zjnzKSsd7Ty0Wrx+uQGkWdr0l/df53ZIEA0Q1d8zMdLQ1m
	iTevFgEhKCOCMkuQcLmmAUZEBaNy6zj+c8/eEE1WLDjDdGiYFaHngRp0lMnrz5vz
	TEDuQcuY+5Z8YpPXXykfWcFYLCDssKxOnAuvyaCcUd1/HZD/AqCsijKIXQN3zVi5
	XxeNkql/yp688IZ1Zr2dzY9FKk674sAwtyKFZjDGpNu7MEdm+LWeP2Olwx8vTYNi
	ngoeAW/dqlWRCVgn2KdkPLh6iEQTrw+NrDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdhcjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38fe2eff2so344464585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039496; x=1751644296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVY990Jukt4echo3RExNnA9BOKm7fyhFlYxouIGS2vU=;
        b=asBKEIWktj+XeTqsakLChXE0bbpGUxaWmdjNYZOaDZlR/ymK1y2Qqy+YAGUa3xKTew
         IR8vZlGsbecvf0wy4zegPtlL/QtrGqE4F7VKyPbb2FgYt+6IJEsutFsES0taAdy91gK4
         Lfs2HLRKVAWXRDS2yW6uatG+L706bZdGa7AC3r0dPRuBXzFoy0BTdo56HNxSaREwLnet
         PrBWAMzpPNTSBRCE7r35/9Ih/lcTYdXwV9yWn8Ntnn8uP9TJ+YpOHZhv/kPoOQ/nVGFl
         HykOqJszK6XM2MCAs59we1WTsC2baNaOm+Q420w9lFmu4aBNwtr668TmuuUcriOGJo9v
         9Rjg==
X-Forwarded-Encrypted: i=1; AJvYcCVh3fE9NaRElT6utXdtYGTq5AzhMhtMDjk8eWuRdXkaFOLgYvfhyMSL7CQDYjvyFhOX12uf0F4tMeXXYiRJ@vger.kernel.org
X-Gm-Message-State: AOJu0YznhHH1cKdQq/4jmtY4cENbhPnnqqBrG6yYMyiBT5KbCWaCxKCf
	qQQBKhn0T6VLOIGhzGThOFCmgAQyXenxtuD4MqTXtOM7TemVZNgvf0YPBt5XbGOO80i1y29zIaZ
	XQz8CCoIHDdIGqUFemOniaseRzRNoyRHZLwrWMmyGth0G9M0+AHn+Uav5vX1VzZg25saX
X-Gm-Gg: ASbGncsI1ANAWZruTqBr9zqtkQkNCs0jgTnalVuznVMb3ZCcroQf91SMmAc/BN5WCYK
	vUkN1xYwtir46ng6elpEj9pSpEi0b0qrzhjd+qEfcnzaR5qsZme5It4ulwBhQKbGCxpEDcOhc3w
	rGTqi9U/PNqXIjsbC7RA2S5dD8arftH3TREcMnIZrY6v+7yUzgKP8tCuOczKLdWExc9odzwvk3z
	nWan0NnUh4zOEpfFwBmAIJXrZgEky4gBKgWUXTu3Ke8BK3GEvbHVJ10GPfkV1eGpsBRXjaJkrT/
	73mVF1yXSWyqHzG+/Hv/QZjKVjpTndldNaxhRHefnEUdp2OWi43nDfo=
X-Received: by 2002:a05:620a:1723:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d4439b744bmr582492885a.50.1751039496147;
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ3ebcyYFds6UbAx+BvNEutdtfVQuzxIsWg5tnkn1hy8H8wtGUG+i3Ja19Fih2KXpJLlElNQ==
X-Received: by 2002:a05:620a:1723:b0:7d3:8472:7f9f with SMTP id af79cd13be357-7d4439b744bmr582486385a.50.1751039495492;
        Fri, 27 Jun 2025 08:51:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:35 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
Date: Fri, 27 Jun 2025 16:50:59 +0100
Message-ID: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685ebe09 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Ja3qRCn7lQV6jF_xop4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX4z5+H3IEZ63W
 lEj51N4rInBshbB0QIxX09EJ9EQI2gdwNbDHN4fpZn9ITsqvkOIXZrHW7aw+EZE6ALPs5/H9LD/
 ax6z6f5BhJd2eSrFsIyoQueKK5kxtW6xMitGcI99ZKOijW1BMMMLlTB+oMIGBZJ7FaB8Re+OQ8e
 WfXPYBVUh//WJME5m6OjbqPSfjUnGH7vObg+Wv4TrfNwjThdCXLngnyViDXZWe+0ETUmu4r68Qp
 qptDjShxujE5KCnM6P77fMnVDeDzAlzoStWJt4Y3y41MCGim3ECQHPHi0hHeAgNhXVdnRmFlV5d
 LtDtUpjkbNtRGR9nfZ8IaRmW2snnmEgyqJ2cKCWGTIFrIkTb18Vv+JCo4viFbzk9BpT8wb5ulJP
 78z1B7VKy1czmVW9oemetgRl00jR8fA70aRJYegqbsPzIMB648/VMWAMpYag4g/Fr/kE4bVI
X-Proofpoint-GUID: xm8oArhjfWe7pthkhuDav-fxoqXOP24R
X-Proofpoint-ORIG-GUID: xm8oArhjfWe7pthkhuDav-fxoqXOP24R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=677 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All these 3 codecs have been duplicating two of the soundwire
functions. Noticed another new driver starting to do the same, its time
to make some helpers so that we do not duplicate these functions.

I have added two helpers of_sdw_find_device_by_node() and
sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.

Srinivas Kandagatla (4):
  soundwire: bus: add of_sdw_find_device_by_node helper
  soundwire: bus: add sdw_slave_get_current_bank helper
  ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
  ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper

 drivers/soundwire/bus.c        |  7 +++++++
 drivers/soundwire/slave.c      |  6 ++++++
 include/linux/soundwire/sdw.h  | 17 +++++++++++++++++
 sound/soc/codecs/wcd937x-sdw.c |  6 ------
 sound/soc/codecs/wcd937x.c     |  4 ++--
 sound/soc/codecs/wcd937x.h     |  2 --
 sound/soc/codecs/wcd938x-sdw.c | 17 -----------------
 sound/soc/codecs/wcd938x.c     |  7 +++----
 sound/soc/codecs/wcd938x.h     | 13 -------------
 sound/soc/codecs/wcd939x-sdw.c | 13 -------------
 sound/soc/codecs/wcd939x.c     |  6 +++---
 sound/soc/codecs/wcd939x.h     | 13 -------------
 12 files changed, 38 insertions(+), 73 deletions(-)

-- 
2.49.0


