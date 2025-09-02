Return-Path: <linux-arm-msm+bounces-71634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE601B4060C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD1D17BC621
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537612E03E4;
	Tue,  2 Sep 2025 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BynYITuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB3A2DFA54
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821675; cv=none; b=J6/1uEB51nClAwc3l3E4No2qmOtLWMCZE7QiXCV2b+oZvJLoy+Wwkkrh+ZdVDi1xR8ffs/X5BeW5rTPQyeqxxYm1Q0m+fBAK9FveoWk25Q0DHgnQd+bpCr7kmN8wCmZgInPK6wxrkv0VMgF3TJg15bFbLCC2Z2JnF4VMxQQ5gSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821675; c=relaxed/simple;
	bh=ZCmYtXeOLiKF/8J7Ii2M8E18kXf+ruqiaITuaaqiq3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCFyb/OQDH7uRGuwA4UXtUcv/VOSGGaijsk3gKkcPCfef9BMye/3efV0V5xZDgICrSAtMXmT1DnRqgHbhcC+ennhp9WYnXPVRxJno2m3RNLI+2baEAkGaFeW6tI9RprZGDooRzrNyXx4Knlriqz6IqmSa+fQ6v8SJGfQ8Gjry3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BynYITuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B1OQM021747
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nmnJ45KeZoK
	mJHcfZsLs3+FV2VWNH0u9h4uDyk73m/k=; b=BynYITuIn6Os+8yQvZhtg4mBQ/a
	A4omgyulKqSCPbtJe2nWNr1z3Mm6yq/gpH38zH3qdxRFp8zY8aNOeQ3Uzinb+pZR
	ggccV3RLlJqmqC3YGhyAOo8Z0VLjE3CslNzCxWMOxHhPDtZfKrHZen6qZjj2bqjn
	ditn50QZJ+HdYsIbUprUIaTqvWwq8lKDz73iCKWXnsUIYFY5vDsV79hg8Iw4/87Z
	xHPMmTcvXV1SC8QkBnOaXAAjN/FT3x2JntCM+8nDt4x6FvH9H5k3hX0qHnlqqadD
	btS2kQgOtTIyooiia4GeE290vr81maV9ZgqoeaXKRd2Wuh49uhykaZabkwA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s03ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:01:13 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-74557e8cb79so1309503a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821671; x=1757426471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmnJ45KeZoKmJHcfZsLs3+FV2VWNH0u9h4uDyk73m/k=;
        b=qwifh8KNIyGNgl9a/l1Qae23NR4fADVVDQOpIV0qaSwoYCX240xRnZtbllGdCiiRO1
         xFQSvYn3zRGE6tzSUnhD5hvvyF97TQVuCQ4FePbDc4ww5NY9S4XY6d5J/Fe1xXDKwSBY
         46ueRPnIPnIUnXQzBdoG1bQqrVS3kXpP+5Ij3ExAtyeE4geo9heg6LCyDnMKXMmSzLIB
         Z5jbRd7Yaf0SVjdE38ruSU/GC+v1vr24BulcOxvvKVeM+46jB7FUDuFtpbgklW2stusH
         E+KIgta0YZjgUJnS804ZtueBwDl/RNm75cvYfbXmEoSmkMxGA5oPGftNAOUahRVDtmoZ
         sffQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDbSLZnGTzcljDeqrVebkRp3FB41bP6nmgsWd5iGjvTcrRELoxD9NsCM0BpEEHQa5x5Q6NMEnLJPjiE6+v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4jiHh3CbJxMzCslDve+NPh1thdc5qIYjher7XmJlF8TBvZAT3
	nxaMRSUeZyQNaBCAwG56WpaDkNRyL8UzDplsMvnGUYsupCTGLvJ47mZhvDiNL3ZbTqiJvaVD/rM
	rprle9vhdkqC06gLlgcizhYjRP2QjJCuiRfKkPPShmGKGAdGs4qp5Hz8cTqjrB42y1DS0
X-Gm-Gg: ASbGncv/LmNc9Kabfu1M+bwEIVnvozq+IaWPmdNR4Up+SNJNCQNsxUsXVYGp16IyGK5
	+8s/T1uItvTlRY96iwCd2LSTG5CL6aJIqa08TjN0yUeFwRJoJDRECpT3OyRlWm+3WOVfPCCX0xb
	Gvm377GriSkVfQTmZEKbXpx9MEwi7xw1eTiH/02y38gN/gMs/K1NUyMD3IDQH2aho5rGQo0Z7hY
	zrD8QItPVmDu8/4U9fhEZpCpVD7dyOj6QBo5zxlIXnOkam4RGkHFvuOVqXvvlTaPtu/ujQ6PPBX
	tlvCB/je9hBf7HtZfupwBRUqpf65kSmvfXg2OA8oVDWqasuM7ZsIOA==
X-Received: by 2002:a05:6830:630e:b0:744:f08d:15fc with SMTP id 46e09a7af769-74569ecf0fcmr6903320a34.34.1756821670750;
        Tue, 02 Sep 2025 07:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMw9YT5rkoNZ22kEloWpSq9TQIAdQv5X+Iy54NEzqWo60ZTF+TAlJf3AXt2PwZZsGYu12l/g==
X-Received: by 2002:a05:6830:630e:b0:744:f08d:15fc with SMTP id 46e09a7af769-74569ecf0fcmr6902363a34.34.1756821662010;
        Tue, 02 Sep 2025 07:01:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:01:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/6] ASoC: codecs: lpass-macro: add Codec version 2.9
Date: Tue,  2 Sep 2025 15:00:43 +0100
Message-ID: <20250902140044.54508-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXxJkDp3V5sHzG
 Z2inEo1MxP1i0G/3xG9OD/GkNm4AWw0X3wY6yCoKKMowxRXpMAvZsxZZLHpUqhI3FRK0yB2jife
 BqvRLQ9dse0F6fTTYEBefmPmuekf6Z0vRF8Ln//Si4pFe6DZ0iTh4+DRBCikMK2XqCkNppKlX6u
 jzt88PYPUez0YPagyFOgTUmYaQGdw4wUE18nOkUeHn8EtU4OUvhM35GoORvNihlC3pbPVK6rUX+
 j6fQYf1i40aPgb7DZGe/iUmsbsPAb9Athk9KKJhwC2S6cyZzEv1PkMMKhzpiD34x/JvxHyd/63G
 dwmR79qj5sbhlIHUvO0yQrx6IANjyZuLPx09yyAw2x3jpVvoxiMCN5pm25owQARsHuf6WlTD/Nu
 d8C2bek1
X-Proofpoint-GUID: 2sAoHya4_FUvFmsDCvoENGAHgiyUBEdO
X-Proofpoint-ORIG-GUID: 2sAoHya4_FUvFmsDCvoENGAHgiyUBEdO
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6f8a9 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5KERvJ6N5coBvBd-fXAA:9
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

Add support for lpass codec macro version 2.9, which is available in
Qualcomm Glymur SoCs.

Its compatible with 2.8 w.r.t register layouts.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 1 +
 sound/soc/codecs/lpass-va-macro.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index fb4b96cb2b23..10ad682019fa 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -29,6 +29,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_6,
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
+	LPASS_CODEC_VERSION_2_9,
 };
 
 struct lpass_macro {
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index a49551f3fb29..2e1b77973a3e 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1485,6 +1485,8 @@ static void va_macro_set_lpass_codec_version(struct va_macro *va)
 		version = LPASS_CODEC_VERSION_2_7;
 	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
 		version = LPASS_CODEC_VERSION_2_8;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x90 || core_id_2 == 0x91))
+		version = LPASS_CODEC_VERSION_2_9;
 
 	if (version == LPASS_CODEC_VERSION_UNKNOWN)
 		dev_warn(va->dev, "Unknown Codec version, ID: %02x / %02x / %02x\n",
-- 
2.50.0


