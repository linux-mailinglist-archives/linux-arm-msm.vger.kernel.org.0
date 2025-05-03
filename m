Return-Path: <linux-arm-msm+bounces-56609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B853CAA7E8D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797C41BA04ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 05:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24E41990B7;
	Sat,  3 May 2025 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obhY5nRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206BA42A82
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 05:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250334; cv=none; b=TuJ+vZZi6zqsdRRwepIX9L6CASX0EoC50t4yU+uafmO8dWAw9iv4lulFxKSUNHn6mlrlq+xVA1Mf6IPTilvKnlN76FSxIL96nP3FFKSobBbNlKbIcPN+9V0tL1nNTQCWYPQai1FIO/WbFjMaHWyRImdvYE0MDqKranXeHnQBmxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250334; c=relaxed/simple;
	bh=JrCjArC0bzr5FFuhkLAmoTVoBHpDGiU0BzbLirzY1hM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K+QRTB9b+HcFNKXEDPX4/eRWVsJyTeJ6pRZLtPNIpaS9y9O4ktsQf/2s5+CNCzqFavlTnLHpbN0v1AYxRyAY2HANG2K0RlISuNHAB3ejZiv8MNn2jjdx87zSWzYsLcibVpq8cMDV1IxYyDZtkH3YypbxBgu4Zwgf/ZRBD6KdTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obhY5nRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5435Oqcj017860
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 05:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q3nDXSB/Fo7qumlTVFjSJM
	Bida7tzkzQifGisEtqZcw=; b=obhY5nRy9K1jM7Zg6ElsXwpMymtgDpqulOoqlf
	N/WHGaIGDYL8e4D91oNlsKD9REBQCQZaSrImfABWeRsH5Dx4zCF4R61mMIdWuQdI
	ASOn2zObsH5eZWXRNEQ8qd0oq3qqWhGh7sdmaHIXj/1CkNNO5xEoel3gEdU39thU
	0c0JznsnViGmfsnZ5BijCwgMhLMD7KSwCxoEIZ8QteiUPIBKlMq578oQiaQ1zn1b
	arYTO5DqQq8v3ioV0x7VAoy3EJPhATpmeuaFwzsJfaQ3HIBSRSwvxfjYdybqJCgb
	j5fE9tQ/ddwPcjRKGZwSlm49t85t2ihcsuhIY/4t611E6LPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakg1tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 05:32:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4767e6b4596so49702721cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250331; x=1746855131;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3nDXSB/Fo7qumlTVFjSJMBida7tzkzQifGisEtqZcw=;
        b=FnfJUs829EXVvWiUCXBKV2Q6fIKLhuEdPF+Q+LmPmJ5yb44Z9J9mw4/h/ZdDp80i4F
         WefTg3IK9G6jWsO7ADWjyhtTwE6EYba0HNppky//nys6aDPq7a71we7RBUptSFAyXav+
         iVSiQ/ulv6LIdfUNoUVVoJvf9UllQkbr+Ol62aYiRqTgOf0yT4EJDP/PqMfaVCi0KhH8
         pXl9CeD5S4XQnpPgH+CVF0hhTcXyDGVSozOLsacSntrgtXDDoQPP1fuplrbbZEPMn8Zq
         dXgJ5FBuJHjKUBhVaCQJxp3nBNNFFAyCztowzuOz9F629ZLgNSslvRk4HVv9jj+e1Fuv
         TJ3Q==
X-Gm-Message-State: AOJu0Ywz0LWYyVjSMiNFATz5q37GDnnurdRQDG1V1fz2uXa+V2YiDGYP
	uKyLqcFq9aHgBNf0gBTi/OMGl5l7H+FhNs+T3ACNtx3K/OocBfKmM87BsSLUhHfFlIsLhCPZJYs
	Rwc5RF1BQEAxtvvehK8I0QveK1IlF9D96bzVuRLvsWGL3oaxEawQpcvhVUaHBpnHg
X-Gm-Gg: ASbGncvC5lCvp5IvSKgFJpdLwhKLcSonKkpQc6BN+SkLjSv/YCLIiBReprxzDJ/bwYH
	TFQT0hVoZUCjbT2pW/gAxGNLXAzBOh2BhEqiohv8Ad52csc6Zu4HDRn4lqp9/fD/6tclgPKZm5w
	O7eM2OAklSAyOH7+fFMXMDjgZ/OE2cO1ebwtf7BCDHkhvpQ7OhjwrzJC1f+IJmtDQhIRqJf15wU
	Eg3Tk3TllO8arht6/URUCOJdqOJy1v7xX+iZOuWIz4lVtl7TCrIPNNnlXnNCMbEsIlFm9hKoDIx
	KgMmI+gtOdCUN09izmCWdYZnTPdL9VIynb4OZkUv4i1eMcKWKtSvgkhocfmIX9XjfsDHveEerYX
	h3/jpCZRg7xj7doVAF1uGGIOz
X-Received: by 2002:a05:622a:248d:b0:476:6b20:2cf3 with SMTP id d75a77b69052e-48c32ac7d08mr87015271cf.33.1746250330830;
        Fri, 02 May 2025 22:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwkD4VFYgZqh++qJ1hdBjNHyXm/KsDjgLE3d1OOhTEveS14qB/5yiIqfYnDcNQLb6X4GzP+A==
X-Received: by 2002:a05:622a:248d:b0:476:6b20:2cf3 with SMTP id d75a77b69052e-48c32ac7d08mr87014951cf.33.1746250330357;
        Fri, 02 May 2025 22:32:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] pinctrl: qcom: several fixes for the pinctrl-msm code
Date: Sat, 03 May 2025 08:32:05 +0300
Message-Id: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFaqFWgC/x2MQQqAMAzAviI9W5iVIfgV8aBbpwWdYxMRxL9bP
 CaQPFA4CxfoqwcyX1LkiApNXYFbp7gwilcGMmSNNS0mie7MG+5lxyA3zkQ2uI4nTw60SplV/8d
 hfN8P4wELvmEAAAA=
X-Change-ID: 20250503-pinctrl-msm-fix-b225fc7ead2c
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JrCjArC0bzr5FFuhkLAmoTVoBHpDGiU0BzbLirzY1hM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXh4/UJUC1gJg8vS5V54U5xFsk/5ULuz06t
 IiHdTeF9f6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1fCrCAChmY9npXN9et/ISZqhP5jTh2TPOyJiYp2wBbiUjcoKodg1RhEyTA+mV2BaZLhzaste95b
 TZhroBDFA8gUg6YhhJ7xK73orFbwH9MEkvMxhcepmgk1LZjRqFNSEz3ZdgRzACQBSMDtLfXxnej
 y5y8qZdNYW+P9E9tM+/Ietdpu5VCd9vg2wUvqwn/8HTIOMHyM14bjKHMmOrRrnaApZpPXTIoJoq
 GJwnLz81OwKE1qH7f7X6SB9tRY1ApCtfRKW7uq+Jylpi7AMSdLwFw+zjJFNCBOCEKFPsDtmSm3I
 l8jAcOrxEnp76xZ2clHeWTIpwQDcfm/Uaiq3K1/4WjK7vO8n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfXz40O731qWAvm
 bqZ1ayi9Bs0lSBaqaOoqzs84Ih8SHAxEkOxXmTUdMlCYRDiF2CD1EtpRicw9DL+id9Fc8z3FrQh
 iwP4Dq6VnoCwR1ij5gOSY3WWpBXBSRyEKLig8WMQicc+uWEs6FTP8pK+QvQmKCnZe0OPWVRi/qG
 +IbNvjKuTimQJWlfMgTkUM+uIjfHN38fUSj6pDcO/Iv1VoS7mO9Dcfm7J6Z41WSMESYxgd7ZCcU
 X3Cl2jAS5kaUoKjgDR0B02Ewi+IULqNy9/b6xtJZ6pyZ7A804sAobCea25FS9B80t7ShgMOp0AH
 eQPybwGTE9Mtn8t35GXd5aI5lrktDuZ3VMW9sZdf2chJYfCrUf980V+vMThTcYBvZbYkJ62NF39
 eWo6CHaZqOkQwGQIe5/OO2JL1At/GGjKPig6/IUZDSPaNhq0B2LhhUbueoHIUK21RgF0j+HO
X-Proofpoint-ORIG-GUID: kpLEdULF2tAKc7BxOSxSKiaiIqADSHF6
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6815aa5c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yL6wTZgN64zhq57P54QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: kpLEdULF2tAKc7BxOSxSKiaiIqADSHF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=628 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030044

Fix/rework several issues in the pinctrl-msm common code. The most
important fix is the one for the gpio-hog handling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      pinctrl: qcom: don't crash on enabling GPIO HOG pins
      pinctrl: qcom: switch to devm_register_sys_off_handler()
      pinctrl: qcom: switch to devm_gpiochip_add_data()
      pinctrl: qcom: drop msm_pinctrl_remove()

 drivers/pinctrl/qcom/pinctrl-apq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-apq8084.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq4019.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5332.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5424.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq6018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8074.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq9574.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9607.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9615.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm.c      | 41 ++++++++++++++++-----------------
 drivers/pinctrl/qcom/pinctrl-msm.h      |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8226.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8660.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8909.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8916.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8917.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8953.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8960.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8976.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8994.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8996.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8998.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8x74.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcm2290.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs404.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs615.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs8300.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sa8775p.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sar2130p.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7180.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7280.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8180x.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm660.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm670.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm845.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx55.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx65.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx75.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sm4450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6115.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6125.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6375.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm7150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8250.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8550.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8650.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8750.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-x1e80100.c |  1 -
 58 files changed, 20 insertions(+), 78 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250503-pinctrl-msm-fix-b225fc7ead2c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


