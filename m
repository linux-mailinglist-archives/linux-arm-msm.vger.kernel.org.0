Return-Path: <linux-arm-msm+bounces-61882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771FAE18DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 12:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E83BD4A5927
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 10:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1053286432;
	Fri, 20 Jun 2025 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaVgOEKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605D42857DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415441; cv=none; b=lhfZEpIhN9BtUHadlwLgD6ojOtIxohdhf9BDZnaQ6d+TlGuGsLp8y73QmV+rR2gl49B+63EUKlwntAmGQbnz9kKDYq7TFQB6eMpJBmIifHmBJ8KZ7uq2QVJKSaGE7GnZF8Whdjb3VcKcI4RcwS24j3EaAv1+oIzXU3I3vQRh81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415441; c=relaxed/simple;
	bh=FACaevhjabj+99RoTiQQq1b2jCviQK1t6Im1KybJtjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lu9gbV2rBk4MoH5vGdsfYGlQwmwfDyXS9A26jaOSo6XU+a3SAwi9zqdhivKT1+ogitttMcOQ7rX4864V/wWDalGzfZYVwgnTVu5mtBh6fcLh7Ha2lpvr0nVA8JDmbDT5+oSZ4o9B951cVbuqqkZhDNNwoz1jGHG7jqZ0ehKmvJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaVgOEKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K8XaZX025415
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D4WuNA6VbsB
	h8tPmc7Kh2HUVGz6QFTY4VzYqj8L1/+k=; b=gaVgOEKHZoPuF83f2WXzGvAqQnB
	vlQWW1Xv8ZtbT0YxCQdC/ZmvWPWdCmdHBnq+n5T2RGd7pfoybSLDissfsmtRuE4R
	+ydx8Ml+bxF7+k4TrwvsKnO2I/R10mIk5R/qf8jNHjJpi1KPl9l3S0MSX0AA8+a8
	hDR5Cl2qaN/MNIgkBG975tg8FkEPp+ekc168h6Ytri0QMRDgu+uS6A7l60UCQN9u
	oSp9r25oZnauUhg7RWwonko++1GixvXLouiHAWR7TTJdaSrgWundwsM5HKH5QNDM
	65R8MAzx7uv82FZdN03IF7sC2ppX4K8C5LSozBHpfiDomFeIjIZFl02JXAw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13ey6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31831b0335so2056266a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 03:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415438; x=1751020238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4WuNA6VbsBh8tPmc7Kh2HUVGz6QFTY4VzYqj8L1/+k=;
        b=nK0eWYLrxhzkfr5ybix40Lea72uyAabtp2nlNn6nEbMN50fH4NJmAApgB3Dxq/Yj4q
         +t6JX5n+HiK5117MdZgb+K+CiIQJu5uE2nkQFdjsgTkj1NbfACxrodAcHJXg1xd9QGFw
         xljp8yEpLyNxxD5BBCAgL9THC66LQfpmtimf0Rb7LbxEGdrvtz3vTKFrtG71k9LXoWLi
         QTyUa0RqP5tFP7ST7wCX8izbWio+wB2Y9l4F6SO3CjXcjJ/NzEW7EDgk6kM7Jrsp6FxP
         Gs9CYEvt/k/Q6QpeK1p2kk/+NTBRZOcM0IoB8d7E3RW6KV2mtoXT8+MxQsbtmA7Ly9/4
         kc9w==
X-Gm-Message-State: AOJu0YynEJGR4mwDyoGX30mLO6xuOyK6HhvwmVCO1nFEcSPBONfs5YGb
	xOd66JPOOYUkKMNTQjR+zoThTSJTe072zFLoQSfevts12vZ/QFc8SDpM4P43/5a0crG/Y33DUR8
	8xJT2/KUx4MCHj4FjvsBwHmSipGa/pdOhKqYnttzJ4rPKSz1KrRVbkeqtCVoPP3Rtn4Wg
X-Gm-Gg: ASbGnct4lsIH0sKUxQw6m/60FlfOr+wCNaS6sLmMQM5i18wOyk93+djILDdqBXnF8X8
	X9xNmY6WB+LLcRytzMHFZE5SDfyZvAdGsX2jNj9WCQ+vqlBhg15iCxCyu/gWmGy0ys+w9n6bn9h
	b99eKqWhlv2erqPsQZUZqpNQmuC5e3SPvGwwReOKibuulT21JWq+1Wp6lKF1xt7Z3N1Psog7qiM
	tTx24GuEMxYPKUGd5xUh8k8sKEQ3Ksk5qrm+qFiJ+7b+q1bbUKPezjW/cWNDLCH9l4X+AtRcDev
	YjFQga2k9V/B3AAdsUCsWD0IV9ovw7YI0EvjLn7HG9ZakmvNMNTo+88XC0U=
X-Received: by 2002:a05:6a20:7350:b0:21f:ebfd:def2 with SMTP id adf61e73a8af0-22026e4f496mr3560305637.10.1750415438504;
        Fri, 20 Jun 2025 03:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsRepHQERqynj9bksMS2WBRfE9QQUxy9vlASK1Gx1FVkJz/k4AGWV4kq6UMQPyMo0LynP3AA==
X-Received: by 2002:a05:6a20:7350:b0:21f:ebfd:def2 with SMTP id adf61e73a8af0-22026e4f496mr3560253637.10.1750415438066;
        Fri, 20 Jun 2025 03:30:38 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69f3e2sm1651347b3a.159.2025.06.20.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:30:37 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Fri, 20 Jun 2025 16:00:11 +0530
Message-Id: <20250620103012.360794-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6855384f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WN4HfKPq_xmDaqbUiLYA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 9kMrCqimZD3g0TtxcXk8D5iXi7EyWpi3
X-Proofpoint-GUID: 9kMrCqimZD3g0TtxcXk8D5iXi7EyWpi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3NiBTYWx0ZWRfX+zzhn4xOagYv
 3crg0C4Kw1mZ2Yst1G45NBoRjXx/k2hrRTovh2BBayUhyOPtIfx6+3PgpNDtlABffW+AtQ6IftY
 RFHM4N6AER0H66fgRmlTiqaG23sjKfOC8B/BFS7Nd/OLFNdVCGy74zFIO3p5DvVFra1pQg9Hhdh
 9PpNBEmyScxk0CEagmQLlzCZFnsBD+xwjc1Z6xqRhGMXEdwBCMPbURkplYGkxX7cQGl95cyIHMl
 ivjydq/llszzYylpJD83bV1rSqG+K/1byLnhh528ZmdqjZizLT80AeNa7aJdk7iNXwNTr56KT33
 ko5KtrO5QWntpbNvW7htB6UyFgJ/nldOy7ldTa6FOWljwUK+SAQyvJr6AD8Mh4AesNsRBAJzRcq
 uEBI1P1XkZVKtPJnPdvpPCdmZrTvUxJb7P34pB90FlEZLpXgmB6JUJJL2sIpJbnS7y/1/p64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200076

On Qualcomm platforms, like QCS6490-RB3Gen2 and QCM6490-IDP, the
WSA884x speakers share SD_N GPIOs between two speakers, thus
a coordinated assertion is needed.  Linux supports handling shared
GPIO lines through "reset-gpios"property, thus allow specifying
either powerdown or reset GPIOs (these are the same).

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,wsa883x.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 14d312f9c345..098f1df62c8c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -29,6 +29,10 @@ properties:
     description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   vdd-supply:
     description: VDD Supply for the Codec
 
@@ -50,10 +54,15 @@ required:
   - compatible
   - reg
   - vdd-supply
-  - powerdown-gpios
   - "#thermal-sensor-cells"
   - "#sound-dai-cells"
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


