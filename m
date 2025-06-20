Return-Path: <linux-arm-msm+bounces-61881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E40D2AE18D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 12:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1F047AA561
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 10:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C901F130B;
	Fri, 20 Jun 2025 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQk4H/53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0B20F091
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415437; cv=none; b=NUSlFvhavu5WJ0ess37ZZImhSSsze/VN4PvUGbZk4CIfkXNb6l6fGLSSWfWe3mQ9NBVtf3VA6Dmn6wZjXPYBzMqF/I42qSLG/Lb5gsLtEJc/Qkx8vH00rrgVJ2tU0v6tajsAFEDoio5Pj7Qrc5Xt9wG78GmN6mVpoqp06XyhjjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415437; c=relaxed/simple;
	bh=sgC2Whj/3vbEMtngfmMQs476p3QnA1X+r6uPn3gJqi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hXZy6+WRCMj5hAx4LLUmws9nv9U9fQcpiLBMWK9zqBt42ehl8eP+CY2piUKB21xkazGQY1wIsCLuxlovux56X+uxBHb0MYcculeZWr7sA83bzf1+40SlRrqmDXJSNsSquYLEK5Vl9Q15Z3vMP9pMdXgxKzSuX5sRpORcRqzWpEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQk4H/53; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K9PQJq024412
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FbdfOeO0bVc+E5H6UtRtwG7+flUxUfZRFPi
	czgwcF5E=; b=AQk4H/53ukaLwBCaxJXHl4npS4D8ADrpNpOQP1P2Qa1DLDqW6/V
	dIt59WjYkF39/XIGD+zTUZ8gf3AY3Bf7UbQWhr0ndEEvmT4nGbz4dyvl3CmGOXKv
	H9cq5C2vLXUBLStG/Pa5OMyB8TbHmQBMOr9sDTYWzvROZo85jCu7wpuUq+eGU5M2
	I/05N2S9g9cdIo2NjqSa/VX25JEPZ/MYjDNNXHSPLyvBuQ/XVL4WTik4sUaw1O/4
	+NDP78Bq7vhE1QX2aUgajWDKdZEHrMQRbVpvECyIXZFiSRvh8p7PnCBAhzX87Ut9
	qSGqA/z88o5tIIU8g87hzPl6AGSoU1CPZkA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13ey67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:30:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-749177ad09fso74088b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 03:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415433; x=1751020233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbdfOeO0bVc+E5H6UtRtwG7+flUxUfZRFPiczgwcF5E=;
        b=dul92rSKh631YXcGSlfDgOIdRIoPOQYOsZmmYiEjfYDwaDqR7D+wVvcG/MXBGV70z6
         O+cP2q/7THrSsV9U+SEGrCPwLkSQg5brq8+UssnbJEhrhgSTNH4LWhcnRBR3ZnUMNP/U
         1TIL/iaSgOyW23Ebn7s8gXHYLbwia+rQYsa8uQBRDVVnieCTXlNJqzqDzBpBnTblkm7e
         MMS14+m/swMn9+1/vc85D81rqgzbCbFhhBF4D4MUyY+E0BZvAtYTb1oU+Beb8Bokl681
         q4L1eh6cihcOI81tpdH8eLQa+aWRbA0KDA/IvTNeZepqh54E4IP9T/CREamaeJVpkZUR
         ih+w==
X-Gm-Message-State: AOJu0YzLzm3XOzAHFQnq8+GN/PGl9SrK6oaJ15wqVfnDgJOgPaCSt3Kq
	dVJasB7ess9T9nX/TDLjzj0/NiWYFHKRsx/aAsUZlbTOXwIYkjIW0zUUvWrQWIXW3l069v+r9E8
	w4ClBTKHBjJ3v3/TUFTtc95H0FyoL4i/lFAYCDJvd90fqt9kSGPDoS+xryxOtDqtEvdHY
X-Gm-Gg: ASbGncuZ7QMK7nEcNzb/mu1ytYo0L+IN3cg+jsQ2oUkKBSOKH+B8n1YEzEmkrglM0V2
	wIcRMRcWhz+TAKg9xe2yl6oargzjj3ZXXh7R5G2mu01RbBWZw40+uxcweJr9GN9npHoUtWgoFC5
	W98OkX07puy3cj1VMcHbXTZsa9azLGjaS6wwW/UdgoExjeA7xPlNWqcyM9wdClGeX/h39kozKVt
	F8kxxYNaXgPxgFFToc6hRKDNSJunE5inG9xPmZ5gytklNhd7fik06eVIU1rEDEI1toDRoiSAGh6
	ua46Kz5S5tdThQHD5iAfU54okVBepIZzpWsTl1/oe8Q7U58Agvd2qUxWhww=
X-Received: by 2002:a05:6a00:1903:b0:746:3025:6576 with SMTP id d2e1a72fcca58-7490d7603cemr3495650b3a.14.1750415433208;
        Fri, 20 Jun 2025 03:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ/+4QqsS22JhshP0B6PhCXUoUSpqou6/RFBXaJnb7XCQOCglCYDgi5mhrBQ2/geb1J7USsg==
X-Received: by 2002:a05:6a00:1903:b0:746:3025:6576 with SMTP id d2e1a72fcca58-7490d7603cemr3495595b3a.14.1750415432767;
        Fri, 20 Jun 2025 03:30:32 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69f3e2sm1651347b3a.159.2025.06.20.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:30:32 -0700 (PDT)
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
Subject: [PATCH v1 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Fri, 20 Jun 2025 16:00:10 +0530
Message-Id: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6855384a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=_GLtVs1PZ0YSqw2nQxgA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: a45IPTrExSJDP4LUbKgipqN5lBidaO0X
X-Proofpoint-GUID: a45IPTrExSJDP4LUbKgipqN5lBidaO0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3NiBTYWx0ZWRfXxh8HvA7u++68
 mrgrx1Ooujx98ohqFZxyL4fy1nXdUnzigAA0HWVUPH3yGRH5VhbY2IeLwMq/GDrmc4FOMQIhJY8
 MGtHyGIINjMd4HE4vr3CCeAsBSjwhK0LYXW/8Ct4HcWomyc8D0X1Chlb/W0gbcoFGp39AKU6Arz
 tw1iGH9hQTMNBtDtg0GGXqqdZfMbrpSLsL6wVYlWMOybaIUtosv8dOvbcgV9seuAJvBJMiIcRc7
 l5Q/gSd6g99mzEgwI3dwnyWAdK1NVsCFwH/uhyrhRRyRt9qSf2YVvC9aTN9ikklLgwuxRaI0GRU
 qDAZ9uCOdqPvbZTNJ9Ei2F0A8mQlQjZlnr6tztNzy8wduma/w9AiUvQLzyG1rL0ikv4Lu6s43Dv
 l0wyxEmFNS061W2fFynVQCokaxKbOz15aGg3bsFRiUfDJ9uK08aZOj1SlLXVHpMiDIELiUhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=900 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200076

On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2
	- QCM6490-IDP

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 +++-
 sound/soc/codecs/wsa883x.c                    | 57 ++++++++++++++++---
 2 files changed, 58 insertions(+), 10 deletions(-)


base-commit: 2c923c845768a0f0e34b8161d70bc96525385782
-- 
2.34.1


