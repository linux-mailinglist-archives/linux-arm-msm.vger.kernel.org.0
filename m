Return-Path: <linux-arm-msm+bounces-66777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C097AB12E9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 10:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E60DF1632F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 08:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C071E98FB;
	Sun, 27 Jul 2025 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I13M0/0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100071E5B78
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605113; cv=none; b=X9CW/oyOH1fGD0ZT8boY8SqiBlpe7l6GHaBrwmOuNnckCkLO0AwqGqtsMV0cnquLSI8qpJp+rs+Kw7K/mKNYtuq2jgOFLaPMHayH+cavcnfv2FgKaXDEfZSGbIbuxBgv1zKtfY+F6dJwkLMmTPSMBDGbHn9y1EEm6QsisY4O56s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605113; c=relaxed/simple;
	bh=NM5eUwufs9EQvxyH72fi6ouw9HbAH6xIggTFFBsajLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AYkjqYi5bseI6cdYLPerLhfS3rd3Fzes0giWieDmywGzYPB9S003Nz7VSJniFIXiSmKu4ZabMv5IOxzoUZihkGFTH6oTmMj9oNU2FzqfLHjSva72z8942EqtDDu72xx2LZCJ2s3DhA1N4D9U9JcAuDUG46rZGTGoEVmK4wIz3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I13M0/0y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R4LRKq006819
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AcwNi5jqAVS
	vH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=; b=I13M0/0yu7CcEcdijMsbuKAb+Io
	liLBfBX8mE9pIsxnm7cA0XPlRLmEtJKgEud1LHxD6v62CMdmIsjel1VMYlC+raJ/
	HhhM016Kns3opK9CfDrb+QcmdV9R/IdwmzAYiZ8rAE/dUEEwawZ9EZ+FpJK5bwLl
	Xkl1kFuG0sw6Bx0BZV94EmRRaDPdCbcvm2w1kU1NqcKIYUs7vkGyra0MdfouG4lL
	U5eXLuCM0LMZ3oX1x2isFDRP0yPvDF8x3325aCC0XBpUL3tg31ABHORIsid4nXtF
	C8imaHfccmHNLePZLJBvFLWLimbARJQMF6fngCwlzHQXh+/QGYrfnQkPxsg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85sv2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-240012b74dfso2693615ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 01:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605110; x=1754209910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcwNi5jqAVSvH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=;
        b=ZgvRRuZwtSCuHEQvrT1gaYN1JDeyP9LcDCaja8It0NQueMLzwfyqLnr5vnKfKZaDTu
         +9RMUOi4/+2DBbS+3z0yTMxTVQAXPOv6Xg2fdH+96qJEenqUUfJIv11vSHnsm5Q2njlx
         BTNWSsYjHln/JzwT+MRm80jbmSWqbQNemgLpUYiA8np3Iix/fHdN2WAcqFRjGofxxr5H
         dtxgKzpuWTrXsrpmlRwohW8uJdTgxebP/Ec9K9y4i8YE2Er4hWV2E+UeU3EkPYIZyQ33
         M6V7ZFHmDtqFFYuZuXcw576TQmOle2BmiT7cFze6afKd9Mtu1QL4gBGrpill3oa6EELM
         6UKA==
X-Gm-Message-State: AOJu0YxaH2racz0kOp645yzcskMKgLsUwslPmAGBuaORJK3vCoxuLQfu
	BIaAhfYUiMewuuu7auVaKTvoJPdEfW43JrEk6JO0gQv3KFUjpAfzCP0XQiEaRk3RK5SH7n5/xmU
	R+NOktd0S4w+6kBK3YyuBM6/9rFdz7ggkntmRRSO3DarHr+oKB8g2jBemSGqzkjWQdNZT
X-Gm-Gg: ASbGncs37DIYyn1wdH8XpX1sqQVOo5EBLgSwZgkobVLAZcZ8V8NY0nL6zv2LZRPku0H
	h89XTPUMEIgHfIwVS626w2Ga1h1M7UNNjoW26Lp+UMxtsSxjgYy5emOr8jt0uqw+sfFcXhjX4D/
	i2wfObQWZIm6MiBihIeD0cLhO04fDY+2FHdFc7AL6Ka0aJSynNiOU47M0NNAcRjtKHLBCn92pZJ
	FZ5OS2U5qlCXixeb1PWk1iNxU5UGgkBQXvqwBfsw4JTFnd2nmf/8GqNUd6oITapgO+puvXYianQ
	uRtZso1X0mAIYgOujWIlzq//RO6X8q5+R2Vhl+C2eJTnq8wM05/p2+E83yfBLBNKC3w6DvkINTd
	o
X-Received: by 2002:a17:902:c9c4:b0:240:9ff:d546 with SMTP id d9443c01a7336-24009ffd7f9mr10052465ad.6.1753605110183;
        Sun, 27 Jul 2025 01:31:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERPCA3gFX6YamqhgdGjO1m2DVjgSysrzz5AvHQkC6e/zWEA9GvZU/sr+aJlTkVRUIhwXmMMg==
X-Received: by 2002:a17:902:c9c4:b0:240:9ff:d546 with SMTP id d9443c01a7336-24009ffd7f9mr10052185ad.6.1753605109738;
        Sun, 27 Jul 2025 01:31:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401866c2c3sm2848645ad.30.2025.07.27.01.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:31:49 -0700 (PDT)
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
        kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Sun, 27 Jul 2025 14:01:15 +0530
Message-Id: <20250727083117.2415725-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA3MyBTYWx0ZWRfX6IJZXlijYLZt
 Tj7pDNcUOECF+TpMCzZrYEMX1Jds8NjSOl7UJPlPNj6i35l8YRRTleUaNq9uwnWUitRhhKKLz15
 iDwHL1hh+MrZ9QXYjZbSDSyDEJdrcUrTYwR1ouxHtduVOPhhZ/B22t1l85ox0jXt2mA1y0xNRHc
 HJBmXI732/r6dPH8IgYevoV/TjkMGezUb2oT87tsMjoVdPPAE+Nn3oRj17bMe2rRCBxxg+t4HNR
 +9AVkFyyYsNP+ilFDrkEZeqfhNEj9ZCBpMkZ/V5S2dlDyq3GOQ15fbRYxBY/s0snn+sbXHdhbBw
 RAtMXbs3zsla7rD8E17884/shJC17URAngn5HsuYEk0cxfH6sDDJrE9wAwWMsCBNgBX4NaFzMj7
 Jr8kpZ97hbISYpk5N15/l3aISMmPf1AY4GsuFb8fHY2GDZU0SD5ileHDEDnP4st96meAYxbt
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6885e3f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Jjn-4_SfM33dySwp1_gA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ajD6IDFrLfm-aBWh7UA96rrL70fiX1mj
X-Proofpoint-GUID: ajD6IDFrLfm-aBWh7UA96rrL70fiX1mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270073

On Qualcomm platforms such as QCS6490-RB3Gen2, the WSA883x speaker
amplifiers share the SD_N GPIO line between two speakers, thus
requires coordinated control when asserting the GPIO. Linux supports
shared GPIO handling via the "reset-gpios" property, which can be
used to specify either the powerdown or reset GPIOs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


