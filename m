Return-Path: <linux-arm-msm+bounces-77545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6FABE2BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41F8119C6228
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD38328638;
	Thu, 16 Oct 2025 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KM35PjRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68FC328601
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610178; cv=none; b=kVs/rPkbSSHz2EbMaNjkoLVdARoLjoB4LthC5Tqch3tyjaxFt6ZO/1SF7q8/LZpG7CqEnJwihEzQlndRE7o/CDymrMTh4w0rxdbQbFDkztGrJcqPtsVJA8PGJMkEEOP7gzlO2Fm7mnMSLpqEQRMZ8dOyYwLJepqceI+HIx3mk6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610178; c=relaxed/simple;
	bh=I9VswCZxjcOq69ij3zBWOQIB67DabNCkSG+J/cCx0JY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cwbvssScMcn86PVBSVbx3H2gXzNi7DAtQPr0P507X67B6whOF5ExXqFO/Cx21U6j+4d59dMz3Egt5NdFRJYOQuIOblRBUsvVbGPH0hCUWI3aYLVHfLT1dR6FdvBTz79OORkYwhWezDsK6sA6rnDMUi3N1yWLNBl8QzaCxomxmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KM35PjRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7ownt004306
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hDoIxXS0NZAzvm9AzoX+o8
	wdS79L/6mlJ9xQBMQLOEU=; b=KM35PjRC2NMMPdWw/9/LFM+8aL+o8DoD/77ogw
	NqJ2eqoBK69bPPYu/dEgCa1VyzXPg2dtetV+1/kZdaI2jyifzkMDnHlrrJPqypaY
	rUpXhON5b1YEAg4L3+mZ14yuvbHwaEeotfp87f08g0xifkDhNl0grWuH/iWYW+i9
	8K6S/zpbdp5xiToOYRMIEpbCAdhxDfYNj4GGBIRM64Axm8VCreIIh23nBg8m8lBy
	dxL556sevyKsrP3/DCQZItfEsDGVTq3XhxFUaJyToUjC8+H45KGP/3duc/T892j8
	rt6AQP208EFdIqt7kosymt9rJbwYOWpBXk82IIL6q+Ctt/YQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8fygh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:22:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78efb3e2738so17371386d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 03:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760610174; x=1761214974;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDoIxXS0NZAzvm9AzoX+o8wdS79L/6mlJ9xQBMQLOEU=;
        b=hbvUTTm3osM7eSkoCfU4O4lk91Hg7xn0kGW37ONWih0408J39KJczR+caQsblOIpFJ
         glVdGxgKdE4bsdVkDhrEK2j3qlJbKM1pn6U+V/zlAw47Izhvxk881E3Efjc2gdDmMEak
         WV63ZnJ4bjHqLJZtkIN9cARI2SLEdfsBYV/tdKcxDOgyvuXym6NaTl3FT/0zJ8G9Q/3C
         X6jPaWYccEsqnDMBwXsUd8J3GXufXRImsKZy37PLF67rcXbOOGIb586WLu2gDpmUvwaG
         IHd4SJ8w8sgF2NVsl8yVxx4IjgtfSqpRMo7vo2tlB/Th9e8WP4nuSoUAo3/dh1K3D25U
         Halw==
X-Forwarded-Encrypted: i=1; AJvYcCXOICj9/np9fd8JOte9c+QV2nvPhlc3NJCrBObRi1K6RnS+b+ZCn5XSL5cD6HXIsAy0LALF7peLJrD06NcT@vger.kernel.org
X-Gm-Message-State: AOJu0YzodmlEweGv5sIHVVgiG1LKCuD75CY72x756EIeuFIbECFnSyFr
	jZ/8ahVhZHhGsAF4N3VNTZ6Yd3wcYS1JwDOKX3FO5TiC3uqEJA2hF2+Iq82nPYybnqa+8cskXNj
	a92VGsjF4/RpEkG9ASSq6PDLRxpYKhYg7n07HXABuHbrlcVULUBXRulvCe3HoK0YzZd3EqxwX3Z
	TIHSk=
X-Gm-Gg: ASbGnctCfu6XRufXZ70ZuePJPP/RGOb4I0bC5ObOkzkAyjIwr5dq6jjJM6vn1PvX6Xe
	JQN2sCH60IXJKEefDueeZvRmAY9aX/GNzDfFHL+wxCJRXO7LXpLUr6eQO8yGy7Nbpwdg5q40Fnt
	zPLRFBtd8rYB5XLFnksqYLxYVGpUN0DEyb+ooTolqEjnMIh/esjPMD1TX03W5jXIl4V8LI3i5gI
	V3S1NgZYtG6zR0qEjHfnLsxkvvmjXGJhL9ietQgjUuQgeG3n6tAG/R6Zs5VMtjVetFPinCIR4Vs
	QxRUvjYM5cvapIL39EB6YqC8FDKaqAn0CPLh1d8BQcQxr8ZvJM161amtaBNZu3yXMSu9rPYEbZ0
	qP+UmZPQxe5brGihDl1RuooNgNFZ2Pzv8sQDxvi9IP3hUxYZMa5DmeHf21xNuIo2udQ==
X-Received: by 2002:ad4:5f4b:0:b0:809:aa63:1c34 with SMTP id 6a1803df08f44-87b2efa8496mr424424766d6.32.1760610174293;
        Thu, 16 Oct 2025 03:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6d6oYLYeAIExz8iIXHij6zsjbOQRta+Z1UCL3YKsFUr27c+K/XPIglf22UQsocFsJpABHiw==
X-Received: by 2002:ad4:5f4b:0:b0:809:aa63:1c34 with SMTP id 6a1803df08f44-87b2efa8496mr424424346d6.32.1760610173829;
        Thu, 16 Oct 2025 03:22:53 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b3ff9sm36777576d6.56.2025.10.16.03.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:22:53 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/3] media: qcom: camss: Add sm6150 camss support
Date: Thu, 16 Oct 2025 18:22:42 +0800
Message-Id: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHLH8GgC/x3MQQqAIBBA0avIrBMcQcGuEi3MppqFFg5EIN09a
 fkW/zcQqkwCo2pQ6Wbhs3TgoCAdseykee0Ga6xDg15L9uiMTjGL6LigTy4kazBAT65KGz//bpr
 f9wMDOqAiXgAAAA==
X-Change-ID: 20251016-sm6150-camss-ab16c59c2019
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760610168; l=1565;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=I9VswCZxjcOq69ij3zBWOQIB67DabNCkSG+J/cCx0JY=;
 b=g9B5EyS1GxW0yAwaD0Z6+w85dCqr5D+Ua30ZzHq3BG9VwHlg/ZBx090hFoQzMueW+8yiO/VHX
 WCpcaeqihkdD878/RkHqCzeqBRWtRg3nQFVZ5CzVxKhtC62V0d2V2tw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: rum-Wt7Bfge1hMF8uLRRF-iH7C9EP1hf
X-Proofpoint-ORIG-GUID: rum-Wt7Bfge1hMF8uLRRF-iH7C9EP1hf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX1PicJP4VW8Bm
 QuC7mB5tvs3Q9Z9BJ5ZFwgOlE7YxkYvZi9wkOKQY4yLvZ39k7b+XvJs6JSSqLePxFakcW059QrN
 IVUVywh5JRhVan9obIov+DFIYfhPlez1vPzdyk6zESZKRHV8JP/rbky7FLMyf0V2FtCQuxn7iRY
 MeG5Z8hIgkHzo/ggm4scuF0s7Jvhqg9D8+bzs9CoKjYqHW5uEXKoAvGiqKmfE0vN1dggpm5PTcy
 nNnd9MkY6IHP9gx9v+TVKqSzJMCuOLerWuG+TwqOtJaESz/fthzuL/gIYAOzEjdLiHUx3O3EuI0
 JiAazsoMtdmfBMhtnANpMhLI5SWWIaPpjX9OcEweG7BDZxrk53dcRZu47mbWJEDUyUfkhNEY94T
 sNugKLugfsIHHfm60BcnoYHyeNIu3w==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f0c77f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vb9n8AilU_5XW5ZOngoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

SM6150 is a Qualcomm flagship SoC. This series adds support to
the CSIPHY, CSID, VFE/RDI interfaces in SM6150.

SM6150 provides

- 2 x VFE, 3 RDI per VFE
- 1 x VFE Lite, 4 RDI per VFE
- 2 x CSID
- 1 x CSID Lite
- 3 x CSI PHY

Tested on Talos EVK board.

Tested with following commands:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

---
Wenmeng Liu (3):
      media: dt-bindings: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss
      arm64: dts: qcom: sm6150: Add camss node

 .../bindings/media/qcom,sm6150-camss.yaml          | 283 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 121 +++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 186 ++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 595 insertions(+)
---
base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
change-id: 20251016-sm6150-camss-ab16c59c2019

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


