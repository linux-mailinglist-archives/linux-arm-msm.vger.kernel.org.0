Return-Path: <linux-arm-msm+bounces-65235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78DB075B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C458507C90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFC12F509C;
	Wed, 16 Jul 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9WP+4DC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5522F2C58
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669213; cv=none; b=Jmc7d2EIh96jqU3GGlRZDhk7hzYN62MPtFLxQaRr7adl8dhAZTVIW5Q5ikzHSW1YdAS2zInOvImLDH7dRr1JMXhrGTW+6N8duLFfsaNT66px8HAr7eihI2BohASSHv9nc7y5tppe1+Zp6UZz38Da/rCENMo47T25jNoLARogB18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669213; c=relaxed/simple;
	bh=js0Yh7zWjepjcGAJhsG6IlvWE80VSXdh9uM5B/1KfIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zo9AEnTSsNd3gALXjPYUmacHukQir12x35yEdFnDWYrhC0B2q0J/3PDa/Nfj1bK2XGwzxRBw3d+FX4fN2NLJYIDLSD5cNgsokyH91CEsTmYWSjgaiSdMtcGqiyApXadoBF3Hub5dvpBaA1f8ehyuVorSEpvWN5yV+a46GQ4oMNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9WP+4DC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G63Eea022730
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6dl8L70xm1HlStY566wq1OfeEIWB7ioldI4
	dZagkJzA=; b=X9WP+4DCcgGkip/bAqz8I0+P4m7UMaiz2rhRBxny0b8mahUe5xi
	TqcPlaT1oHCh1mVhM/+6vxuVPkVQxqw76myMjfEZ/PbBDd1gbYdjwKY8Iy5bDeNm
	HBQMTmFMXqDlqevTOrrf5ViIN3xncXr7M1Jk8RJgNSxDkSDJh9G1QvRrV/bhBIW/
	Gu1E0X2ECljAM7KrtSQWO1esMkLTTEpNeFa3HtH0DSd4oSwhNRm+GeW10giQVO/r
	ldQwjjIMR63+2L9iOcOlmDulj7v9ut+MLI0vNgXQN8GPva6p8vyi5KeqtywSUFEI
	ugOZmHbUR7iBgDKrHisWmZEGaa4WXTbuZAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrumk66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33d32c501so344936985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669209; x=1753274009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dl8L70xm1HlStY566wq1OfeEIWB7ioldI4dZagkJzA=;
        b=Cv7je2kw8cHCEmiX+X1Keu1HoZhIRsINTo8PotL3S0w2UykSwUYgB/+xzs6CqskDkO
         4RC/o21QHkWuvdv+sizSr7npu6kR29rmVok7FLT88rMPAylBzf3R1tioVtVxlrTxJbeh
         OSDHjowu9QYQPeplicGAE7sWS1i0Fuv7sTDFYn7U/FHf3afxWLwLWJkuhFvYHwURebP4
         DslCLaFV8HbDogMyLJjjzJfcvUOM55G+0XSNcbMNmk/dibpWsMIEzIeR73kA7LCuop65
         tSw6jYA6lYSWaalATMs75JkaCeiG/Rw9E0QaRKfQQjqtHg5nAqC8nf04ue76Gy3ca7at
         QvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdphOhziDVSF5i06QhII3tjUVcGAg2aZ+yxC+Pr2TKp5H24tpS0xKEi9uDrz/nAV17WWTd2S6uXzcpMSJn@vger.kernel.org
X-Gm-Message-State: AOJu0YxLUiD24cUK8gMk6JJfv0vTDNeqrx6j3UELkQu8H+hzPrL5Addo
	XZ1+3iz1g16aNJ05nx6Xq9j+zKPe5kRA4lRK0w2kOUltEmSAyD7EkyqXvBKJYquXdfoVwCS301l
	ofRbHaLfVokClfwqn7WAT3+R5bGf9qKfg4RaI39MhgEIpIh7GbvAJsTYYx/bgWNmk1Opq
X-Gm-Gg: ASbGncscwn+vsdxMpbPwQ9Mon5802u6jKyQIWL0TgutB5aN3Sj4mVZ0P52jfWDPa9Wo
	95y+5UPQpWQUwc18OVkqhEmN91hPJZAGDjpVYiHI6N1Ldq6CXUcKxcAU6ATb/lyt/u8QGnT461a
	6HIYaHMDr7shVwsKKXKtDRiykOy8pSMbEgWpJBJPLNcL12H1Pwh40fZd169N763Zw/jDt9dY+vG
	cGpo8nbDYAbPqjhZJNaKG9nVyJq38S8WDj17Muv6LnP46MEA5PvsnUO9Z5HS38G/m9s5aEX2r7D
	Qj5QH/CoyJZYfe6W2CZdKqny2M9IiP2+/SzLrEK7pzfqr9lnkP2RJg==
X-Received: by 2002:a05:620a:2681:b0:7e3:16b7:bf26 with SMTP id af79cd13be357-7e34334b831mr347069585a.4.1752669208856;
        Wed, 16 Jul 2025 05:33:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6xtwwfW8AddMhJZGFRGstSkga85qp3uQ6/xodWuP1paQp/Pn/v4wA1DQuvRudLT9g1U2RYw==
X-Received: by 2002:a05:620a:2681:b0:7e3:16b7:bf26 with SMTP id af79cd13be357-7e34334b831mr347063785a.4.1752669208186;
        Wed, 16 Jul 2025 05:33:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c739sm19453335e9.32.2025.07.16.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:33:27 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/5] ASoC: codecs: wcd93xxx: remove code duplication
Date: Wed, 16 Jul 2025 13:33:18 +0100
Message-ID: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UizZpx27FeYNBytZHxEleqOBs8nKw0Bp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDExMiBTYWx0ZWRfX25Ovd+2Vu8YK
 ptKi//XPWdYnTJkeIlOEYT/3UdGGMgJUQq/09sfnhWfspRBVXB0AGfL3SqHEvJjf4Kzpytpcbrb
 4dRc5O7I9SpO1plg9QI7MstRs0P/ejECxGmYVonAJ3xAibyhG4yV0SLuyV1FHwqG4WU5oVGET9c
 jovZXJImfFgxx7WfPIKhP5JJTwMu0xituk/gozTf69dFfmoZy2XWsp5GkgxydON6OZesRvC/CRk
 zSufP0CWySmi95tE7mWUEK+p2CQBJFe/RKzJDh6CzRTbk+kqRuhll7sbo/P/yLAg6p84Wir7xV6
 0ZNAkeDhK70X/OO+vUVdzhydkILmcTWHDsB5Tp2EpqJwhxpdnjXJK3f8sZpLUIndyk3j9m99D8b
 ULUvFsTJBxbilG7mWTXAN4jdnRBgnYqbW4S5okB0+TdyqklHTa8aj4mWYNmWl/f6xxC8paJM
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68779c1a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=OLL_FvSJAAAA:8 a=EUspDBNiAAAA:8 a=DXjLId-kC2nHtiOjzpQA:9
 a=sPFwb3Qtu_UA:10 a=kl_IBrakYWIA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-ORIG-GUID: UizZpx27FeYNBytZHxEleqOBs8nKw0Bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=545 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160112

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All the Qualcomm WCD codecs and WCD based codecs have lots of code in
common, resulting in lot of duplicate code.
This series is an attempt to clean some of this by moving the common
code to wcd-common library.

Currently I have done cleanups for 4 codecs wcd934x, wcd937x, wcd938x
and wcd939x, however any new Qualcomm codecs can avoid this duplication
by using the wcd-common library.

There is still a some code that is duplicate, but this is just a
starting point for such cleanups.

This patch depends on the other cleanup patch series 
("[PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup") that was sent few weeks
back: https://www.spinics.net/linux/fedora/linux-sound/msg25202.html

Am happy to merge both of them if it makes it things easy.

I have tested this on T14s, any testing is appreciated.

Srinivas Kandagatla (5):
  ASoC: codecs: wcd: add common helper for wcd codecs
  ASoC: codecs: wcd-common: move WCD_SDW_CH to common
  ASoC: codecs: wcd-common: move component ops to common
  ASoC: codecs: wcd939x: move to using dev_get_regmap
  ASoC: codecs: wcd-common: move status_update callback to common

 sound/soc/codecs/Kconfig       |   8 ++
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/wcd-common.c  | 139 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  46 +++++++++++
 sound/soc/codecs/wcd934x.c     |  82 ++++++-------------
 sound/soc/codecs/wcd937x-sdw.c |  61 ++-------------
 sound/soc/codecs/wcd937x.c     |  75 ++++--------------
 sound/soc/codecs/wcd937x.h     |  22 ++----
 sound/soc/codecs/wcd938x-sdw.c |  65 ++-------------
 sound/soc/codecs/wcd938x.c     |  89 ++++-----------------
 sound/soc/codecs/wcd938x.h     |  14 +---
 sound/soc/codecs/wcd939x-sdw.c |  84 ++------------------
 sound/soc/codecs/wcd939x.c     |  97 +++++------------------
 sound/soc/codecs/wcd939x.h     |  20 +----
 14 files changed, 303 insertions(+), 501 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-common.c
 create mode 100644 sound/soc/codecs/wcd-common.h

-- 
2.50.0


