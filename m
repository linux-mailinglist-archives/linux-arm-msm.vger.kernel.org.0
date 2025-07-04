Return-Path: <linux-arm-msm+bounces-63696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B52AF9238
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 14:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91DF17660B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 12:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DF02D63E9;
	Fri,  4 Jul 2025 12:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/zRL8B7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406E02C15AB
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631161; cv=none; b=V+zk0uNN2RPgNlTxsOeZuepMSrPKmH1asUGrzbETOmozMH1Qwc2xDAjMiBDmmItpFS7pKQXnNytogC6pRxKvOciWiKQ/yklsYprxy4NfMJCB8/GASTKBkJQeiH8VK6LrrCja8Dg1VLr4hcRrETy/3LI+E/KABfBUy28StqSsPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631161; c=relaxed/simple;
	bh=eY/8mPA3OuIFqBWX1Dtb3n86syoF0oEJrMuduR3BVvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTVhKBN8d8RIQ4+mVaPnM9NvMoPFfuHpwgQzVqICvP0IqBEYDh5TpdgKBG35OdKntPnClJmKKeqtNDJYfWRfFZrEZQXW/Ht7ibEr3vxCLpD/HHz5P0asO7Yx1f7mD4ZaHMCR1afJBZr83EvOHZXSx7fwu7gQ4XQxQbXFDiz3XOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/zRL8B7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648lKWS025163
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 12:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P0ScYG836X0AMGgN04TcZ7toMg9xkq9JLx6
	2TK+uUEw=; b=H/zRL8B7njti7/MZ0kNxAs30Vfm1CqTQdADUdyq1nhk/yT8e3n1
	wYLlC/wPR6hhYgEAqEhW2Kc4dHYwo/piOhkZh01aXoFrymyllApGtO8XVi/nJEp7
	hKn/cQCoO5xRRa+gacLRnx+QIdDrDvTnAZO+BPy0cZwb+/ZQ18/JbWHQ9ynsjQrA
	rVSCUx5pK72tvpHe4FKFvr1Tn8Cmzm2kiG9KlJFw0dSVkrSkgnfKCv/aUWI+0dfJ
	fm9PtR3uq2wznLnDnjBuIznnK/lEKJpobV3UFzFOxXFZJ+yCJuul07z8JBdox+Tr
	3F8LV9Dh/oAnptEZlsiLGhjcO+OUTbEVkeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650y08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 12:12:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399065d55so107452285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 05:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631157; x=1752235957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0ScYG836X0AMGgN04TcZ7toMg9xkq9JLx62TK+uUEw=;
        b=xHUGvOglynU1M15YX6CFoyMOFC85iKBrE+fhhMggObxkL6xkAdtag1YdYOJTWa0e8S
         m1aQdhTvUFpqkCmnWAmv5b0Z+ROBAZQAYMXCyLyUDHTvxfSMyFwIYMwnyo1ftAIxfmSS
         FWavkAgngdN7RYiRPRNoL2Q6kE6ON5Tn/yGcuI/isXpfEr79rkL+mvmnJdbwY8Dzm8bt
         bgfWNplQIe2RsysYHHA92c1w5qHW2lY+IKP7drOE6ZYgiKT+slhndWAACLaqDUazA0aP
         K/0DIpePKtPj74cdKZl20w0PvWP9402cVsTj9Mr3W202Fa9SSIYCeQ8/NqN1Eh0cJ6Vy
         X7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtcHmXjWvT8et0YSFJWdKCRXn3nVdBt/Y0X0/tBFB11L/EklyGvxra1rs8ouMy3r8Qs2UInDB/iMmuomt0@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/1nxvEyLZgC2FH5iPHmcsOtiXrYutNmCSqDYBoDg0sGYaJHP
	/flTcjJIF6TNlVzjg9cJ4LBpA+ADDSofcWbfZfdWPXEVwv2N74v427MBF4SVV/WslqzHEc3NmN6
	52iKEnv/+9TYoKlC+1yFHopj62ryATk5ihVZzPIElLWG2Stz2FFVbHdy8e8W3BmGt+sSy
X-Gm-Gg: ASbGnct0H5j7Kxg+Kj2Cwl7uF9g+HE8MXdtIraSai3nQShchXhrPT3JC6qP06w2mBEG
	biLMV2fGRyoYbe7ToRPcdjDPf5pfAknuq4vIdzD8JrsN9B9VuLT94YyxlQTUazpG+p9GCCuEte1
	TKgMjIrAOlrNNt+4dv+MHLoGI0S4QgKaambABQ3N8gjIhv3hz/7SNzxCR4ERP+DyCD5ppR4f1Vi
	pVCAzKBRc2B6oydhmnvCV6FGDub1Eib4FqLOjY9TyeQ7ntv8sJgJ5mjybt15ukrf7+lkeb/UjLE
	ZhIQ+ReFCRypswMcym74Cn90adeAEUc7wLNr+d40v99qSOQMNOcYYOg=
X-Received: by 2002:a05:620a:1a08:b0:7c9:55b2:c3a with SMTP id af79cd13be357-7d5ddb1d7fbmr312462385a.11.1751631157105;
        Fri, 04 Jul 2025 05:12:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Eg7B1FvZwpHU9t+neYQcsyfuDsXo/Nr59/Yr3Dx+yEtIQ5oCFC0zImUbON+UT2wj7aHy0A==
X-Received: by 2002:a05:620a:1a08:b0:7c9:55b2:c3a with SMTP id af79cd13be357-7d5ddb1d7fbmr312458085a.11.1751631156676;
        Fri, 04 Jul 2025 05:12:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:35 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup
Date: Fri,  4 Jul 2025 13:12:14 +0100
Message-ID: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867c536 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ja3qRCn7lQV6jF_xop4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfX/vAh2TBLWPCT
 JuSzIJhNj3qiO8Yq3CTYO3yFulrvbjx5uFnqMjL1h2fTCosoYLrVNP15eA/OKY5xpxM085VnR5I
 udllqyndX7T65MY8Qz2GT2FXJ6D9D4jd5ZpMsi4cfyaUyx0M96XA+ryviqww6CS2J0cEG3bvcve
 sCNQKvBFSl4J8YH2NLULXY8gY/6FA+ydmL+SxrLS1VRKbOE6t5O52Rz+SIfiionqwXm7HINpNgT
 RIAfBYtEXomkjTA2mTAFo+eCoGB3DYIS/vR5JU9H7M6J5UBBBlLxN7xKh8JzxPSvY5IU9/bEcH9
 HCteHoZt+Qd3BnHgtxVubMxj+bCp5Y2wvKGRUO7Q3m3pYmyei9ssE9lJcTsEACKIVDKY3htaBxK
 lBfuBm6Bgrps49KupZMx3l0abKXk6MHYKq+OP75nI2g6WTEE31OWvjZ7oTRyZQ9ZzAmZ9BR2
X-Proofpoint-GUID: GZPTtyk34rRrT_wJETx4Cont5IpeJI5g
X-Proofpoint-ORIG-GUID: GZPTtyk34rRrT_wJETx4Cont5IpeJI5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=680
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All these 3 codecs have been duplicating two of the soundwire
functions. Noticed another new driver starting to do the same, its time
to make some helpers so that we do not duplicate these functions.

I have added two helpers of_sdw_find_device_by_node() and
sdw_slave_get_current_bank() in soundwire layer for the codecs to use them.

Changes since v1:
	- updated sdw_slave_get_current_bank do error checks on read

Srinivas Kandagatla (4):
  soundwire: bus: add of_sdw_find_device_by_node helper
  soundwire: bus: add sdw_slave_get_current_bank helper
  ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
  ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper

 drivers/soundwire/bus.c        | 12 ++++++++++++
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
 12 files changed, 43 insertions(+), 73 deletions(-)

-- 
2.49.0


