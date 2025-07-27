Return-Path: <linux-arm-msm+bounces-66778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA066B12E9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 10:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6E747ADB2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 08:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2691E1E16;
	Sun, 27 Jul 2025 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQblERF6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3344B1DE3DC
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605114; cv=none; b=lPjHiLVbUpAunDYxLoJNLgXlcPx6EbjPrHjhguW9BPd0jYOQnBGvlO1izPyCbxpeiLHAvSbS6hMjjh5UCUV19gY5urpeHGCL85gQU2FRiQTceawP7RioTwpdTHtpyH/HgEZoWF0gy/6I/NNHzf5rlqMPx6l5MNQIfGLlI0cPTYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605114; c=relaxed/simple;
	bh=mOh9JSF12KAgNeLKrysjhxC4RG1o5eujRw6xxWhT4tc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eLy6XBuQwzb1V86juYHFKeziInEbz6q859+s5wP5InHuMRayDCS5Ns8/726aVO+DuEZScgsXTao/9Lzg2QD/Ui6Rogsn4p44Pp4JBY4Pg2PPIwcQcu6uq5CYbFr0JR4VLe9R5qZMjj8pzfpeEDjueThoWdDSsjtWoYO0EkfHFRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQblERF6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R5agwP001553
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UkkP+2zoex5kty2tl/9eEmLK71LbBAa/yiJ
	a2uZkD3s=; b=cQblERF6eM4d3QW3HnNX+BbnCrxZ1QbkggD7Ruw88RdJKXlGG1O
	jQ/as5ItS8lrVe4iMPtqOF9g1aWDdDo7EcsVAFfflWudQzLTz43j72+uz2ABYuOi
	c9mTtQQJR7mG5ZlrmNtNiLfBT591Jvkg/jM3ZcFQSRmAlWzBZHjRgvSTvhEkNZTG
	jf+MBF+GxhFa7LHgXEk3qBwUIXp3W4Muve6BHKeWXKi6D4F0B9W40O2AyHvtzbZF
	GpHFcXSAOxFOeBTtRwx4+xvx0cSvJg+S7nP/pS0m3ZBJm0EuK/dIkNUC5n+3qZ9k
	dRSSnWz2CwDb8bKauoFXEkpWhHsT07kc8RA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qd9su23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 08:31:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d66fa6so34050525ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 01:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605105; x=1754209905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkkP+2zoex5kty2tl/9eEmLK71LbBAa/yiJa2uZkD3s=;
        b=O4Qya2T+GePGZaT66Qxof9FN7WnNwTfAoPvtTk5AEY5mZSWhLKRjUbdOGsVr/DUxIy
         OwRpO+oGHL4CuuydHbO8iIp+egABVT3024LZHe4fXss0Mc6rm3R5KcGHIVxdbgsT+BYY
         uY2Wf5JxwY3xyceuZhWEGF1fCvgDfz2AOtV5RpFd7PtttfMdgDahT2XCzBtdbJf2XlIc
         7yAKql5+p81sa0zNIKukqzg1YGrFHfLWJgOcXCZuyXl6uGRcja1QL2KWO7VGYECLgINN
         245gg1bofD8kTHFkgZC7qIgDcyL7dydT1yuADBH9UUapqQHT4XbtuugX33GrAxgSEAhV
         CO+w==
X-Gm-Message-State: AOJu0Ywl2h/HW7vvSYgMA3Bd8KkQdYLAartPS0jAXoAabzRBswrzRelU
	qKkxNsualMlo24ZzDkw0vkWKUz5pgwThWcVuxSamBlqE+f+J+IlVCK+bwFf5cQHhz/pFkUz+ZFg
	44+m3KRoSKvcGVmKJzubE5wmeSYk4jT8jeWxq3eM24W8UTbRXL9jzKYeceSCKVJp2fNIC
X-Gm-Gg: ASbGnctnPHHjdK4+IwfcVgP2xtg3GnenkOYWOYi/Ff8cTn+GaSgBeO70QOS3LoU+YuB
	Dn0qZF0Saa51svIo0TyXg2f1nMYtLx6D6BNR8UPGQ73Y/gT51rdWs3Qre0WvjkB9OuhSUk8NNdu
	JFV8OMKpK0LNuwzZKuP7456+K2BkGLcq3BTKfmymLERKVvw72/4vCFUFcHsepovT3bbs0xv+TH3
	Gi9t7yPRAy0H3RjIfbUGGyta3NOCo3/y/rA2X9NxKZgNT3C4IsfaMgpjILEnWZzHiEcqtTj3M+a
	a0qosf+yess7qGNbX4jAQYAvAzEQfLm6Lf6cZn3IS9w8eRI8+ijGds+imRXpveZhB8rWgLns3EB
	u
X-Received: by 2002:a17:903:46c8:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23fb308523emr119243925ad.21.1753605105121;
        Sun, 27 Jul 2025 01:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalG+mHbRKTRUIQDZWr2gEWXxh0RMJdEPGdsr5c2OukHXnD+E8VZ1SQE45YkaP4nrQTj3/Yw==
X-Received: by 2002:a17:903:46c8:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23fb308523emr119243535ad.21.1753605104705;
        Sun, 27 Jul 2025 01:31:44 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401866c2c3sm2848645ad.30.2025.07.27.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:31:44 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Handle shared reset GPIO for WSA883x speakers
Date: Sun, 27 Jul 2025 14:01:14 +0530
Message-Id: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -FVcd7EhA7kUF4qCiy4hRH0pJ8KDgluj
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6885e3f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4I2HGNnryxoGv6TmyWEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: -FVcd7EhA7kUF4qCiy4hRH0pJ8KDgluj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA3MyBTYWx0ZWRfX7Ne0guGusJD+
 p9JDnN1ScT43pAxWAuLH17LgIm3XUl6lk3OBHTbnwxeFqKTxnAo9grGlFGn+paqj+ix8x+49yu1
 h4Jjdnx5SPZfWl2Vs/YlqvONukpumOC/K3QYwU2LUlpFg4sYC8D9JR0Nz1rKIwRhObqTS+IOLCi
 M5tkGPh7loIRnimHGvcQZZ+c60pDcKmiY0A7a57jOWC/JVeQAsuTCvagF+BhJcuQl66vN/EM8tt
 tRT+3G3Snja6OYkirF22C5PbhsC6QagcdICo9K77JoJs8rt4db82yr5jmnXnd38xhIlWRzgvpFn
 tU7GXfba//bhuYdMaL2dWKPFzIy6zkqDjkb+yzoC5a+saQUsKokQNklDnui5z3H+vffaSXEgArb
 TKMz6bv4V4eFmxBe1N4m0pRRYGhk5qEU3JnDJqtmawZhU24H9OuprBGpc2lajz6i7qWGTtpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=748 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270073

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Add devm action to safely disable regulator on device removal to
prevent potential warnings from _regulator_put() during device
removal

Tested on:
	- QCS6490-RB3Gen2

changes in [v3]:
	- Created separate patch for devm action to safely disable
	  regulator.
	- cleanup the v2-0002 patch.
	- Link to V2: https://lore.kernel.org/linux-sound/20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Addressed the review comments from Krzysztof, Dmitry, Philipp.
	- Used devm_reset_control_get_optional_shared_deasserted() api.
	- created deasserts/asserts functions to handle reset gpios.
	- Register devm action to safely disable the regulator on device removal.
	- Link to V1: https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/	

Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Add devm action to safely disable regulator on
    device removal
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 ++-
 sound/soc/codecs/wsa883x.c                    | 93 ++++++++++++++-----
 2 files changed, 81 insertions(+), 23 deletions(-)


base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
-- 
2.34.1


