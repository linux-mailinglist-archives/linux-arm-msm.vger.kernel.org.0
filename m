Return-Path: <linux-arm-msm+bounces-69717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D8BB2BE6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CEB916CF71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17253451D3;
	Tue, 19 Aug 2025 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2fpEWDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE5320393
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597728; cv=none; b=Qwy+FXxX1+ZXF+LWAAVIFwHQnnZf+mKY2vM6Ve7peZzH3zYHH1HGrAr3zKa+0m2NBxGjWDBux95pbC39L/gQUhKdi0luH8htcklkdTHTNm6DvRrUYKPj9LHUEQ2u58oCdacBPC0TSWXrKw72QlxqsXufY9ZpMNaC8y/xEb7yQys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597728; c=relaxed/simple;
	bh=mQUBUhTJIkEVd17LK62zreRv2cywfgL18mzSnA6eK8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYpVFOGN9zFSo7+NgT96/vp8ldeqrvCLP88HQMpiUR/hs4bp/hdozhErL2NvOupu/Fgp4jui1fX8ywm7TvTW2VG4oOWfP7CaLL7znUtIIlcOGKOkdTH8LwHHLt10Lf1eK6eGM6FKU0N46N8L7jzjpKh8vZDWF9XE6JnAhOy9plA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2fpEWDz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90gtr005675
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyLYEil3TgY
	GIEbJLbRwKXtE0JhM9xLvHblciK6/Lyo=; b=H2fpEWDzCMGPpdzHOA+QGz7T/Cl
	gujKUvvQjXE43GZnfZwqcEByV0fU0MQwmmrcBDjFKInUlI4DwFRCDKHFV5qEL8LR
	yDjzVlQXpC6YtIoahF9Y57Iy+WVGO2GAljNKF0yZ6QNM++X1MkrcymcYlsgvUio2
	BTvrb75ZIsX+Sexdu66Ak8tC3GZ1oa9rcWSnuVEr4ZFJgJWG5ox2qY1zbnmy4vdA
	sLPmFvQv1KSc7VfOfmey+qInSswYWE7e5/6qi5uZqd36rZhiEbKFrOCE3o731XdR
	+VX7nWQD6rsQqK67JEpedjuPFpux8ms6IhSPR+AJMw74iKHjzmMsaROsB7Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh0783nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70ba7aa13dbso93417316d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597725; x=1756202525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyLYEil3TgYGIEbJLbRwKXtE0JhM9xLvHblciK6/Lyo=;
        b=imi77CUmLPLl8ajaV9w3gzjAzCFIwTUrxCrsULeF5aOOqrDsnz2qHGDB/c/+gC15zi
         KSfBT+vA5XuK2KthKnHVlEFQYHPt/uEFelb/G026r6JxhNevhJlO67Kln8afcUQNKM0g
         DbURSCVvpuRiH1vhKqnd2Ps1G5hwKXxD/WqWjbnDpune0nAjo/wIiKX1yxaR+UnqvaJl
         4OD9xptmNCuXlMXMsInzJoBYLO485KV67jEpuL8JMH2XKyx+/jgCaht93YduXrASwKqW
         dmqL+VKrXzTbGl0PLD8/3bj8og7EcvLKHDH+yDdVSDlzHuX3nq49jQCOVJnO4XBWm55n
         YmGw==
X-Forwarded-Encrypted: i=1; AJvYcCVoHxpKIaUMWGjBF1ELrfcxoDqtGzhZaBRhiJRjK8/aOesBYQGJyJCfAJoeuRbQcUbwAEIusEz/cBLUvL9P@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9gY63LHRMxwtbarSjI34hdBC0Oq+KjFu++tlY7u8LnMbLY3mA
	5BfEyURM9YEvjn8JprIdSnFICkFsXZs+bsAn0sJAa2TDkLRylL8K6BTfdLlMI03NYoJFHEj/hP3
	SyVmKKONvl9EdGMDJCdyNnJgGQP/8MXfWvPc0E4Wgc5LadVUc7/6aMptru6oQ7L0RZ1Lc
X-Gm-Gg: ASbGncuJQYSTiI1R2q83P2IJk7D7JWWYJHqo4+ngWkil/27ZmXjZElYkKDY4h6/9VQN
	fRjBhKiWhzQuDpv08Qn1lsz4RvFroTXnN+GqowH9N+hrcKrg5IirrKuTbXzoiOgIULeb4NfyVBG
	vnacBBkQFoNihgJfwg3nWXNKrmWqJPnp3yA771ZcSFEvt6vGcGfM2POqWTwiPCt6jHYBXBdxV7C
	X9uuEc9PJzu0NSoRQPErVJ3yoY5igC4MaUVjooElWiwe0Qw8SAV0Lv2dvnl2cZUVIURODabkyI5
	dVserhtTapPv+lHpzJXmwxXudoKvU2KTUnyT6wq/R2lAWkoDukpScA==
X-Received: by 2002:a05:6214:2a4b:b0:709:e4bd:e3c7 with SMTP id 6a1803df08f44-70c35c7f293mr20655116d6.50.1755597725041;
        Tue, 19 Aug 2025 03:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlef5fvYHbEQw5uwMBXPbV5Fx40atId1n2DDJ0PYdtFl7HGNhvHUTYV91uOxgGjKr9W2eTfg==
X-Received: by 2002:a05:6214:2a4b:b0:709:e4bd:e3c7 with SMTP id 6a1803df08f44-70c35c7f293mr20654606d6.50.1755597724513;
        Tue, 19 Aug 2025 03:02:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:04 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
Date: Tue, 19 Aug 2025 11:01:49 +0100
Message-ID: <20250819100151.1294047-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8Dqm8bjY8BzA_dqodq8gxBMtUGq0QcQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXxS2VBKvF1Ld6
 QKYLcnpXwZK6HcBMTO12gJIfGLgLF/aNbj4QkTLHSjMJxuX7SYWXFbdO92R6QHd9Pkag1OcAEwE
 PZiy+IUB6w1DJYdEhof5sf6yZqR/rkaLYX5UElkDFFLryqP2d/x6mZUyimMT0leiaBiSab3lMqi
 lqdIsyUpn44zpx8pdpKHhwcxpd7B/YEoQE9ur2zyLxJTtYQr9XV3iuO5vKvn7roBxr5WtQtmgGK
 HmquPgjM7J9C7ZUUAyjbjApUjFkhpl5Lg4KgzidmDpVAwW7bOw6tZjIS/kH0AH9gv3rsAj9kYZn
 AchN2xPKSv/j9WGmqDt5ivkvpQc3EFoZAFnlzDjGZbEuugvRZOSv1xEVXz7DKQVpuqpkSpzMuQ6
 5Ylyj10R
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a44b9e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2ggkzc9sqBovd5WwaRoA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8Dqm8bjY8BzA_dqodq8gxBMtUGq0QcQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Fix spelling mistakes in I2S_INTF_TYPE defines.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..efc918452e2a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -462,8 +462,8 @@ struct param_id_i2s_intf_cfg {
 } __packed;
 
 #define I2S_INTF_TYPE_PRIMARY		0
-#define I2S_INTF_TYPE_SECOINDARY	1
-#define I2S_INTF_TYPE_TERTINARY		2
+#define I2S_INTF_TYPE_SECONDARY		1
+#define I2S_INTF_TYPE_TERTIARY		2
 #define I2S_INTF_TYPE_QUATERNARY	3
 #define I2S_INTF_TYPE_QUINARY		4
 #define I2S_SD0				1
-- 
2.50.0


