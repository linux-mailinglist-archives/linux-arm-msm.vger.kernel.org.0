Return-Path: <linux-arm-msm+bounces-70366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75BB315C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 532D03AD7C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29D32F6168;
	Fri, 22 Aug 2025 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iD/8nneb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B06F1FE47B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859773; cv=none; b=t2PvM2t3n6cL1Dz3mCbuw0FZwjMoOqeSkItXHkSrvlgl0Ozg1mnLypDGqhd27tKZraYujFQ/k78UV9/X6dJUmnv2JwaNxh000GISBnSQHwF3tjHiRqMagwRcNQPKBr0w0Vc2RBuGUYe0XzbG81G6OnaYwMO4+NYOYK2MVk8KVc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859773; c=relaxed/simple;
	bh=5fIDqUXD7VH3UjC4CJNLxMKxI+lpq+RhyAKwbCwSPLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvDv/0OPpmHAXaqa2bOfohFUTanPhTFjvcTdNo+e72Q2IArK8Sbgd3lBjN82ZynIwe8B2q+to7lyv9DQh0fAGVj3F4wga7gHhGqAV3WQ3RJttne/r4UvEnuq8Cj01W4Du1NtScdF+fuz3ThD81cnYOyhsp+G6S+YZHiMY7mjg7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iD/8nneb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UNi8001102
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qRbHDqa0iBJlBes/7NLPxU6bvmCGkVDi6QR
	TTiOXynE=; b=iD/8nnebEC5S0WNQySDbG9AZFvsvYK2nGds3/Gs4DFdrOLuWiNb
	eJje1PbS0MePv70TEFRpK9NTHsEgUy6B0dZxaEqkZ2Sf0Y8YP3VFyqMBQ0DDFggu
	9+4DVr24khC7+E7l7tJlENBn8dWZ91ZLDw7FlZqvXOeK42DcJC8FrNQ7lf9ZLcPw
	wsabwiUBv7PCk1R8WLQRU+upl3FI+scpfCq4Uw/+tscY7PrOSs4faXo4cxnz04uS
	5Jn9CW7eBa2qvdQRqg4feIwXStcxvkHRIaj0sL0uIlnrOs0Yq1xM7KTDvWLRqWUS
	iobEc7KS5mVc5dcnPFh1d40Xf55KaKkwOjw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298xwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9eb2ec70so2490266d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859770; x=1756464570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRbHDqa0iBJlBes/7NLPxU6bvmCGkVDi6QRTTiOXynE=;
        b=Y77lmnijQD4lbjd27DCIBhVsLu8sUv3kH7wIF4jYqSeZUMAU5mi6fkZ74Ahe2eBf6u
         ZGNf9XWZuu+PMxutKGAUL/nGT6enhXI+SsZt2kmueDza8UVZbQtf244JVYOfwFtVogr3
         3Rplo3Ws3NHsF5mW/mxdIe/R4M746oe5PnhdaBDniDRjFgSORrPxdXuu0kqbscY252gM
         aLfzCcUVnTpGBatIN6oteQQAK4O6S12/r39veKhbizaG2Kx8gP/ahFy2CyjMfjk2YAPK
         DpG94BcxoXSviyFCBOjSmtdfgkgDzWjh+1/R6/MmCvSsJqmMc3RbxIhBWgd3eOCY+8B8
         uhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS+7DHv6hb4/SEr17HGLMEnmexSzjgzylxaR4bYj5L4RFK0A2gTAM1j5J+eoJkX5degUETTv/S6CQO26hH@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyHJD8FUntYZnnw0bkp+oi0pC/Y9r/xg19YGXjF+8lCDcj4Zt
	uky/xLHBp0bH0Od9xRCXk0iuPzI+nPJAZ6dUhojcnJE0WxCltOwu5fLQrF4/UzSnZemGQe4fLjL
	ohyQlbhmyraXtjdCfnujj6xhADaWfw2O0AhOzDO676LI0e+aT7vXfmm0bW9nl451LzN3w
X-Gm-Gg: ASbGncurx+yzff7GqGWhBtRBviNtVvmknH+w3BGlwpn0LkBksOYBedbN6s1xN+Hjs2P
	IGYTRW1OPwR7mZOBXSIx48Rd3d/OQkw5yQCymB/xvA2NFNF9MYm6Y2wN6JjfNDK8FCCrVGbRm0T
	YnIqi2DF/hwMUd1apwXQYXGOD11TYoofJxuKoHAQQYtSmw7D+Hpj43WRSriNUBG1vGUE97HR5md
	ktlZfcD1TT+Ywb2bCBtQriUqZcXNZlqQYkqIQGeF8W4ah+qKk1d/AYOnk3NBp52wNRmU/4MkDPX
	Ve50N6pXDFJg89oC5cemm4Zjwf70A8oQQVu7zPcAjR1V15IhHDrXeQ==
X-Received: by 2002:a05:6214:2a4b:b0:70b:a4d2:3687 with SMTP id 6a1803df08f44-70d972c386amr32858296d6.21.1755859770292;
        Fri, 22 Aug 2025 03:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFbCYwBV0hsfVBII7n6usWQ+8TYKIMX2RYMa4Bcpz9aak8ip2JM33O0NwdgVIs7Yh1wuYysw==
X-Received: by 2002:a05:6214:2a4b:b0:70b:a4d2:3687 with SMTP id 6a1803df08f44-70d972c386amr32857996d6.21.1755859769774;
        Fri, 22 Aug 2025 03:49:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/8] ASoC: codecs: wcd93xxx: remove code duplication
Date: Fri, 22 Aug 2025 11:49:19 +0100
Message-ID: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PsnhLtz2ARWsEh6tljjMnEaJB4Q1Z2gj
X-Proofpoint-ORIG-GUID: PsnhLtz2ARWsEh6tljjMnEaJB4Q1Z2gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5i/cyhZUn4/u
 H8p8eD8+UX8pOZhptadeQ+DLRM0HTnWmF4TjEQMnfP+kSkRbh4TO9w/pKPueYiK2TOOD/aqAmOa
 1BbE0+ByEH8ToToJuqVUMZ1QEtzDKDxHmOYldsZvLFkqiXjDsVfhSh50RQA8g5Nja0u+HA+H3+/
 oXUk6XmrtAh7f4hBPXSmVRdp/oTtoBnBOMj5ZkfrCBSZuTI7kU2mulc2/a1D+z1fnIlf8tZMCBG
 TZRYdbAYz0V9zfMWPcwhjqpLEHTzOZAa8zU67R6IxbIqV4bZdsan70Ag1iHpDByU87Ko81D9UBS
 EtV8xzkETVBBJPgx2g/9nUhjHyF6NU4fdG3Dko21Me+RwQOJSzRMx/R+6nvytFTE6Q+PIlavChZ
 RPDeVub3vTUAFBjnRkPYcz6gxpQgHQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a84b3b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=OLL_FvSJAAAA:8 a=DXjLId-kC2nHtiOjzpQA:9 a=sPFwb3Qtu_UA:10
 a=kl_IBrakYWIA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

All the Qualcomm WCD codecs and WCD based codecs have lots of code in
common, resulting in lot of duplicate code.
This series is an attempt to clean some of this by moving the common
code to wcd-common library.

Currently I have done cleanups for 4 codecs wcd934x, wcd937x, wcd938x
and wcd939x, however any new Qualcomm codecs can avoid this duplication
by using the wcd-common library.

There is still lot of code that is duplicate, but this is just a
starting point for such cleanups.

This patch depends on the other cleanup patch series 
("[PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup") that was sent few weeks
back: https://www.spinics.net/linux/fedora/linux-sound/msg25202.html

Am happy to merge both of them if it makes it things easy.

I have tested this on T14s, any testing is appreciated.

Changes since v1:
	- add new patches to remove usage of dev_get_regmap
	- add fix to wcd937x for comp soundwire ports

Srinivas Kandagatla (8):
  ASoC: codecs: wcd937x: set the comp soundwire port correctly
  ASoC: codecs: wcd: add common helper for wcd codecs
  ASoC: codecs: wcd-common: move WCD_SDW_CH to common
  ASoC: codecs: wcd-common: move component ops to common
  ASoC: codecs: wcd939x: get regmap directly
  ASoC: codecs: wcd-common: move status_update callback to common
  ASoC: codecs: wcd938x: get regmap directly
  ASoC: codecs: wcd937x: get regmap directly

 sound/soc/codecs/Kconfig       |   8 ++
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/wcd-common.c  | 139 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  46 +++++++++++
 sound/soc/codecs/wcd934x.c     |  82 ++++++-------------
 sound/soc/codecs/wcd937x-sdw.c |  61 ++-------------
 sound/soc/codecs/wcd937x.c     |  81 +++++--------------
 sound/soc/codecs/wcd937x.h     |  22 ++----
 sound/soc/codecs/wcd938x-sdw.c |  65 ++-------------
 sound/soc/codecs/wcd938x.c     |  91 +++++----------------
 sound/soc/codecs/wcd938x.h     |  14 +---
 sound/soc/codecs/wcd939x-sdw.c |  84 ++------------------
 sound/soc/codecs/wcd939x.c     |  97 +++++------------------
 sound/soc/codecs/wcd939x.h     |  20 +----
 14 files changed, 307 insertions(+), 505 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-common.c
 create mode 100644 sound/soc/codecs/wcd-common.h

-- 
2.50.0


