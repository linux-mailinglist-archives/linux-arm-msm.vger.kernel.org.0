Return-Path: <linux-arm-msm+bounces-88804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6FBD19BAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8097430783F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84CD3806D5;
	Tue, 13 Jan 2026 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I5XqZBAx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PldEIMmH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB912D94B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316420; cv=none; b=ubQiXVCCYIuBgzvyP1NRUxfFScXjvwfTtu/uzVb699oCunLolHgQ1YFAAAVxeJJAt2D8dld883abcYe/m9NOv63A68y2ZyyiyXlxWWOOCyqyeZVltOrFsh62cHEzRb8x86mRNZzOY5K6PPIuX04aXy1eqBtv/S2MpWBI4lzormw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316420; c=relaxed/simple;
	bh=wHYSQWFpKAXSCaCDvCBh3+6t1leViMbzmOqfEsLqGh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GXkNXpeBe4+gh7EjoebR6sYsXB4N7yejwv/InGD0MvILzgj/DzrzaSKa2vl6flYCb6ZzU+I8u6Mla3ElZfAiHCP3WygD8E6eZJN+7t8N5U5Z1pPNQn1Dqh/IGc7+vXT4wJ4azlZUMjKPb8XIbxXN2D7v8SW7tsv1DHmugkr1J28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5XqZBAx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PldEIMmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCEekk3638021
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BqSkX7A3ZV7PeLylb6HKgQ
	M32O22heA+Abd2BxbqiOA=; b=I5XqZBAxdVEPdSG3GPyOEnkv/rtmSfjWmuKAOt
	YyggP3H72i80RhTTT0kcDNtM7DNf6M98HtIyTSM1ELepyy5TVVy9FdXCVodlgRx5
	1TbJXAvff0tl3I4nIwjo80NXUNP/cFZNn81WpadbxER56thhSXtrg/7i9MQDlDM6
	Pi3E8Txr363SkklX8khDym6r9k6vlu1EUlr//bEOTB9tKIznmMXXkgIYeyftWhx/
	o4vQhG40kMEVyrFKxr+yPzsvsB/WGrSLI9O2jk4VQ/FxdcIFt8k/ZE20qiwYq8ii
	QFskzb3SH7hwergCeLPTpu2vWk1kZae8M3t2EeR1axUVtWAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c1qj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:00:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1d8f56e24so2006085885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768316417; x=1768921217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BqSkX7A3ZV7PeLylb6HKgQM32O22heA+Abd2BxbqiOA=;
        b=PldEIMmHGQYqAgFPmWeBtzWELjnaDG/IVLcETZYw/cQAePrhrzyS6tv75SKHikR7Zk
         +AyFidstTlw69dA8E0E4+VD4h14rbLs8RefwhxTDFNSRDkXlI0l8x70CynaWV4F4iKD7
         932GAWgbH7cgv0DSHIyquPwGiQJF7HsWyrXU2xyIdAdhKlx9sXfvLGI5ZtvPHylw2rw9
         N3jNUjWPSYIVq9sTewzwN5BTRAgOZrThx/wUPYGynsL1Kt9YYNHiIrG0UpiNspClg2zG
         YerTfPkpyVpDiPS3113UWt//ZCn/ATxsHIQX8zFC2XCzghOlY9ipYhOaWejaMod3M9m6
         Famw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316417; x=1768921217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqSkX7A3ZV7PeLylb6HKgQM32O22heA+Abd2BxbqiOA=;
        b=s1wNtHZ6tBE1IS8LrPpEe55I2r9KM/Qz/jXZ6mKqtFtDGKdk2rWEqxt7/RkmAbJUGO
         oxz+mqz4X3A2YEO6quj06XkYXfBZ2Z5CMv88C138kn9v6hbQy4lmHrz1s0X/MmW7+2/h
         qohmkI4tMt/39z7/WSeaUoI3ZseGsMnD14N7KISrWUSaSuK8Jt5cn0umy1zH2o+etGB2
         PYgctxm0ZaMrvVDQc8H4XpLF1fiKH9gmvin6AZp1cmspoaOTXJOa2pRgaaAl3DmoF6lr
         YXjpDUON4nSXT2K2tTqqMlWnnFo4VFUEm0Kbr5V8PvmPj/myT6/3XzJcAr9sxzbNzQqA
         1JNw==
X-Forwarded-Encrypted: i=1; AJvYcCUBQJGuk0Xz8TTsSwgvlcT8AQkDZLEb9K3eLryG4w41oJErT1iHqyS3PqotD7DkDm44rZfHhOKPwYlvb7h0@vger.kernel.org
X-Gm-Message-State: AOJu0YwLH14S+LWLmDNmaYTe4fswDGjMLWPg6vCXk4aNafD3TkjSKTE3
	Lwn+h0KDx2f/9sfuMEG8r9k68vlMrqJIwn6Jpe6l0slc36qduKwMrTTMRD/JpHkTYNrYJwnZVJa
	2BKsyQ6ydy3vYe1anJQQ4LuWbP0YU0D/tG37pJThmrU7Z+ghqdCkedF0tKyGw8QiqVd1d
X-Gm-Gg: AY/fxX5Ers7ZOtrQ9RxweE2UK0sY5CGk7XyUNWXSNUWnlWhXn/p3cfMaexm2pz6mZ84
	hOUmBOzE7nnR+SL/08QWF89sTh/YdhVEdz4qYzR3UqbbFTWKA+Z58qXF7pDHcvvenEf92ROSLZV
	Cbh79YKcEa9gXXJfcEz972294QkfnjsfxkIWx/cScXbWnuVLzdCyclMOewn4WEaxbEStSSeQS/Q
	d9jyOoU/Gl6YkM2FLcjjIeee42LaL7BPByA0xokG6orZ7clFMbnr7dPMXPEuPf4RPXVrnyEjNX/
	xGLIEjWZxBKlqn6Fv0S4uMT273XYytpEGS315QkCi9A3+UbKBlC3X5vlPCz/ELfe1kDoNYpPXiz
	3a8jdC82mES6zQ2ydBw==
X-Received: by 2002:a05:620a:44c4:b0:89e:b0bd:ced9 with SMTP id af79cd13be357-8c3893dc972mr2902677985a.43.1768316415471;
        Tue, 13 Jan 2026 07:00:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrKGMIFcm3Frz//e2QhG5Ndyntn+OQ+9byv0Z0HtuvTmROLhQk2k+SsS9TByZH/dIxeZOPqA==
X-Received: by 2002:a05:620a:44c4:b0:89e:b0bd:ced9 with SMTP id af79cd13be357-8c3893dc972mr2902665985a.43.1768316414550;
        Tue, 13 Jan 2026 07:00:14 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3831sm2317392366b.44.2026.01.13.07.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:00:13 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFT v2 0/2] arm64: dts: qcom: glymur: Enable SoC-wise
 display and eDP panel on CRD
Date: Tue, 13 Jan 2026 17:00:04 +0200
Message-Id: <20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVdZmkC/52Py26DMBBFfyXyuoP8EEnoKqt+QJVdxMKxB+IKM
 Hhs1Cji32tId5VaqRvLY12fM/fBCINDYq+7Bws4O3J+yIN82TFz00OL4GyemeRyzwWvwEaCyfg
 e2u7epwAmWNDWAtoRuGp4vmN1KDnLhDFg4z43+oW9v51Z/XykdP1AE1fuGrs5ij7ctx1msYWzr
 uSVLH/VzQI45KRSFpURKE+dG3TwhQ8tq5enK+CUcqv4vUWPRHprlUtunYT6IVkFia5AaRx9iKt
 IQnW0e6uOB9twcfJExZR0lz/1RT7WGv9Fqz/Q9bJ8AcnEuSOnAQAA
X-Change-ID: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wHYSQWFpKAXSCaCDvCBh3+6t1leViMbzmOqfEsLqGh4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpZl35p3oyWdUhNEuPTH+Cl/KNqsyh2XU3v3qvB
 WWzN4sYE9yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaWZd+QAKCRAbX0TJAJUV
 VjBzD/99SmA48ffBezaksUwYHqqEJGZ3KxOqV2y5ZAUwywSqrhomQzVaxaszN3gdY5Jyh/xHWIO
 2dltilLdpHzUFWewUw2cncGsWymqe72ZKV2GQbpfmu9YpGMPx6utTEyI9kShYQvXq296aun1mCx
 zOHhC2/NOMUGDiAE+zdiVJoGFGKjBYnOvXMSXZt03nJJZLD+bq33SAGFEVQ5bfNu9i69ZZk2Tj7
 NSzb+dHg5Vt1PiNjYYPsN2iP7hT/n+UULW6VgQAvErdf0LYPS1T6sR9fLtD1dYT9O0RuH3D8c4h
 Hr745pNAicAuZSkjAuQwGXRrCWDYydcPN0bZcs9rd49VsnumazdGpqnLb9NsGFA/ULVtNZEixn8
 685FfoODZm6dZ60wTJHebcDUCQ6sV4yb5w2JNvKMjVqHe2Rj9QlneK06cLMF3tFKKaGMXv/yT1g
 k9HH9kQmaufRMrovCSifbTBiaxn+aPsMBnguuRMPuUKABOmA5UKhVQtGvtFx+Xq+accKzD5UgKD
 W0dpCVtw9egw1JjLOHsdOO85zBDXgLvziieM9Gi/bc56Y8pI79UI4wZ5X6mNcFVnoyuKaydsFNB
 jEVx7pAW0+/ODwHHpvcg0b/fH+ROJ5q5M/Q3eDG3mMDQERwdfNrkCZe5ncq4lA6+nlM2niJ0rld
 IgAQsbHK8ByaN7w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNiBTYWx0ZWRfX7h6wBf5wxGHj
 K2tOstA5EWq6gwUc7awVxbrs9SFzWQLlddE5KWATE6Gnugq/3dctrwuudVNScWjVhNSU5gOY2Dg
 mml8LRg0ptDEf9OleWOo6l8YZ3+gQQUeGybToUa2LNCwlLcFsKdtgDaJnWQAGGEmafQoHH7PICZ
 JE6H/4gVxtwP6zWsWkgF2R1jtsE6gFtjYR29kiJYd5vuas21Eu6S6l5oinei1VwCtO9+UnCn/Tp
 WaRVYhbQFVIdkfGpFWoZxnTfwX1lLKVc0jW/FkSP74ugMCP3qL51V6PMddr/VGMgnS5wJq8ypd/
 3T47dDnCmLdqfeTxiRvFvI81DvrxbGIk2D/ogxJHWprfVYASaX8Yx0mUY+doLHD75tGo+PGum3Q
 3B7xVPvzlgTSKZMrBHiUSn5bNjLhSbw5PnuA9FtX+KLE8xHxm4xrwibSNgLrVUQLiPn5H8GfPQ2
 I/JpxmMMW8fPtCDB4fw==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69665e02 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hyus_tY6DbtroK8RAlQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TqYO0IzYLjYNuqOdA3haWw8t0KRx1L2U
X-Proofpoint-ORIG-GUID: TqYO0IzYLjYNuqOdA3haWw8t0KRx1L2U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130126

Start by describing the MDSS (Mobile Display SubSystem), the MDP
(Mobile Display Processor) and the 4 DisplayPort controllers it brings,
then describe the PHY used for eDP and tie up the PHY provided clocks
to the Display clock controller.

Do all this in order to enable the eDP panel the CRD comes with.

Sent as an RFT since it was only boot-tested on a remote-only accessible
device.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Add missing PIXEL1 clock to DPs [0-2]
- Use the same opp table for all DPs and drop the dedicated ones.
- Drop the extra compatible from DP1.
- Changed compatible for the panel to samsung,atna60cl08, as that is the
  actual model.
- Link to v1: https://patch.msgid.link/20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: glymur: Describe display related nodes
      arm64: dts: qcom: glymur-crd: Enable eDP display support

 arch/arm64/boot/dts/qcom/glymur-crd.dts |  71 ++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 431 +++++++++++++++++++++++++++++++-
 2 files changed, 494 insertions(+), 8 deletions(-)
---
base-commit: 3e2780072bcc3990571a46bb90be9eddf905db1c
change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
prerequisite-message-id: 20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 84f68e52002da3c44523b7823bbcb660a6040961
prerequisite-patch-id: c6297ae9d3914bd294228ca0882fb7852b7e5e49
prerequisite-message-id: 20260113-dts-qcom-glymur-add-usb-support-v1-3-98d6d387df01@oss.qualcomm.com
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 84f68e52002da3c44523b7823bbcb660a6040961
prerequisite-patch-id: c6297ae9d3914bd294228ca0882fb7852b7e5e49

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


