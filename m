Return-Path: <linux-arm-msm+bounces-62845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB89AAEBCC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 18:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38CCE7AA2E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112BD298270;
	Fri, 27 Jun 2025 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNOefOJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9041C2EA165
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040219; cv=none; b=d1JjJzZS9RYfb7w0WrzXR46JOIjK4Em/hrTjqcu9pLlDNlBKz+5pLZnBZh0QMK5lB1OiNScCFVU15y+6kkSsM2RzV98DY8zr0LSALCt+EBvgzX0R0+VcDlOJQ7aGwvqhKFWdodFwOrFURrscgeVOk/vBccn4zeF4XIddv0NOHFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040219; c=relaxed/simple;
	bh=4wEMYSv4N2rZnceVjUCPrSSzWsR/641Cal7MXSo20jU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DX34tTEdXm6Q01W7X7Yh/eh7WV1In1wSI2OcKTwWD7gE4zFXPtEqBo1r2SKDzhi2pS0pvaGqaK2dG5GE832Ij0pBWJzMoL6+K6IsWI3CWMgeSO4zZsihMx0N8FXzsHiQ88+YJBpHNz/MQZLOaLz3ACQoPwp6e6nWCL8LiczOXQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNOefOJW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBRrcW007184
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JZtSXqN+9X1xMkysZFQM8Di5K9z4Tuo9pQ8
	FYb34fF0=; b=RNOefOJWBzLt9TAmc6uk55qI4zaVGaH+rOe7bWeBI9ph6oiTiol
	w+PI9dFFQuOxD5uKItic2x85+b3Wic7L47ZdR3mlDbQibEWtXwG64JTewhUr3kJk
	OgRgF5piq4lWaK/PwF8HU2vQvzI9JSx5HuR0L82GkTUqRnxQYVuPtZQ5RykuU6N3
	jUIJ39dHGGCaut4xIm3hYkmx+iVW1GWz1KPDrnMmPNpxsgl3TgyY4RoKvXxtmr+m
	AYn0AowArulJljXLctT4oKwJLXglWhZnyB1+cSY680nlrgaa8Oc3gDRY3Ei8QUR/
	Iat10htQy1U81KIiU1cxpaNDHxx6lokcsTQ==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60jda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:03:36 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df2e89fd03so517695ab.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 09:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040215; x=1751645015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZtSXqN+9X1xMkysZFQM8Di5K9z4Tuo9pQ8FYb34fF0=;
        b=e7oPlF8R9BUdnRNalUD65GiYRsYDrdjB+gItOdmZGRw/DpnlQhWmcqjmVWJOU+INW7
         Tqd1JjPQKp73PdeoyCJ6N3XgMd3tj0RkWnpg9I52BabZRhXkT4VKU8rYXAR5IkbY8Uz+
         +5RWtBai8OCsmoSwnkREdre7dBR9EkCbYLQXoY3SYnl7AImfNVyx24uWRh8CdOr9NTH1
         TxZnflqrqbdMOqbTv0uuNUxs0ekC1yCe80tH1PjW5pFnRSbUku03sZRqqr71/+ZOMSC/
         9drghRBIgMheXyDNCaWSfQsA/PwnU1InyCUQ1Z67URWAvg+HnmmRi/zPtUKDbL4HgvYK
         ww8g==
X-Forwarded-Encrypted: i=1; AJvYcCVbulkk5smwvWafdQrRfiKMgs2vcQGvi3NzOs+60Mg2p/8HOTlk760dkrsTqOQX5MGlHi/jaUIreiFWYh9K@vger.kernel.org
X-Gm-Message-State: AOJu0YxfN8VBgUMHzMbD9fRuog+1yccW9Wyl/W1LX1A8HQ/mnRytdyPK
	B/Hav0WU8025EpmnlmPq/V01M/ly5QqSzNZDieltfgZMD+XXtV5op6K4JQTm4HHeTN2MFylVnX2
	vszmZngEnst8lNMAbj0P7n0qVP88nI2laPooqNXCcT7uNi1aHDqwtMcp6NKI5xa6QRZUl
X-Gm-Gg: ASbGncuSNBVB8DDpysM+wY63utEx+CHhGSKYRlRVfiicu+31OKyYMVyFvCTn+Bc7KvT
	6op5drHcTlyy3i5OSxHWvTKm16UmYyJ+v2HRN6EMtX6l6Ob0mS//KqJduthifv7bYtrYwCCXgXM
	lxuvEMzADt3CxdrgE93/k4svhSPzUlbQ3OztdfW7coyTH+jGK9XWBx2uWE6CV9wrfI2qzRrQr7F
	C2txIZDyNrwW7lHz4guE0yKawd4VJm4SfUR2TyrD2vQlFwY51ZWPuyR+XBcFMFcO1xzL80IYcwP
	o7v2hamb0d+iuSrnI7xNWyvgBgAk846c2liEshANSgSQQmz8tNJDl6k=
X-Received: by 2002:a92:c26a:0:b0:3dd:bb7e:f1af with SMTP id e9e14a558f8ab-3df4acb6db6mr46155405ab.20.1751040215463;
        Fri, 27 Jun 2025 09:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvOitA3weiHvrHbYayYKUB7m2CvxSY++FtU/jT95HoUazgWL2L5IU4TEwOtFyreuzvrnPFeg==
X-Received: by 2002:a92:c26a:0:b0:3dd:bb7e:f1af with SMTP id e9e14a558f8ab-3df4acb6db6mr46154975ab.20.1751040214951;
        Fri, 27 Jun 2025 09:03:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a5asm3088200f8f.54.2025.06.27.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:03:34 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: update Qualcomm audio codec drivers list
Date: Fri, 27 Jun 2025 17:03:29 +0100
Message-ID: <20250627160329.442795-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3pj6Gv4qqEfX-Acazx825lrtLGxVTLdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMCBTYWx0ZWRfXz0ydwxzx12+j
 +qYYjiQyYGJW4Q5KQf0U5uqtH4QiCafZKzifNPusl52xfx1cjZliOK8QkmqiAa+Da8gw1nTJbva
 5/8pZSAuESozFIWJIfrlYEoMjwR3LdC7Me0C1OmrAg0F5xP2yoYzSUkBu7AGV3tkY0J6LQR/S6A
 VP6W7mcKvspt2TH/qBy6ipPPvPzH4JW57ukTIobeftL3lW5KVEY+92RqsZiVl3wQRoZbmMEUxwY
 crsw8VKWlnLIaMjE1v/IuB+59yGfAeN3liQHlFy7dm2zwiG3J0exGfCPsEVaRY2fljxtPY0k8J9
 BeXtggOdqS9kNKtk7FvVpQv7r2qhqENAb7ulKLpmTh6wV7odxrT+JObagV2IA7JR1ewgWAdSCe6
 cI8jdBUdq8NV9OLuCbAdGCTXAMjvU3c8H1+ReARcbgjnhWpZCtRoILQM8XHWgg2FgrHQ5qed
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685ec0d8 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jMfy5rlRwNJn2DxzEoUA:9
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-ORIG-GUID: 3pj6Gv4qqEfX-Acazx825lrtLGxVTLdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270130

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Some of the codec drivers like wcd939x are missing in the MAINTAINERS
which is resulting in incorrect list from get_maintainers script.
Fix this by using wildcard matching on both wcd93* and wsa88* codec and
bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 MAINTAINERS | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d635369a4f6c..0e0d7ee47816 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20216,21 +20216,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
 F:	Documentation/devicetree/bindings/sound/qcom,*
 F:	drivers/soc/qcom/apr.c
-F:	include/dt-bindings/sound/qcom,wcd9335.h
-F:	include/dt-bindings/sound/qcom,wcd934x.h
-F:	sound/soc/codecs/lpass-rx-macro.*
-F:	sound/soc/codecs/lpass-tx-macro.*
-F:	sound/soc/codecs/lpass-va-macro.c
-F:	sound/soc/codecs/lpass-wsa-macro.*
+F:	drivers/soundwire/qcom.c
+F:	include/dt-bindings/sound/qcom,wcd93*
+F:	sound/soc/codecs/lpass-*.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
 F:	sound/soc/codecs/msm8916-wcd-digital.c
 F:	sound/soc/codecs/wcd-clsh-v2.*
 F:	sound/soc/codecs/wcd-mbhc-v2.*
-F:	sound/soc/codecs/wcd9335.*
-F:	sound/soc/codecs/wcd934x.c
-F:	sound/soc/codecs/wsa881x.c
-F:	sound/soc/codecs/wsa883x.c
-F:	sound/soc/codecs/wsa884x.c
+F:	sound/soc/codecs/wcd93*.*
+F:	sound/soc/codecs/wsa88*.*
 F:	sound/soc/qcom/
 
 QCOM EMBEDDED USB DEBUGGER (EUD)
-- 
2.49.0


