Return-Path: <linux-arm-msm+bounces-56612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EF4AA7E94
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF491BA1117
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 05:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9F51A5B89;
	Sat,  3 May 2025 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6SH1/P5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1E11A23BA
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250340; cv=none; b=D2i2Gy85VbVX6dWYFTZ16yHghvcc8NXqksmFyb+Pm9r1m4TNAsKk/7FvzXIpFMCWVoQ1TnAkz2QTOadSbDfGem8DO+ULn1BJfQdfwuEZPXaMjxsrq+Ohn4bDzWR2Z4zfjH0ybopFL70IXYdAygR8krmlKLOoAXX7Hc1hcrfBs08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250340; c=relaxed/simple;
	bh=lxvekQGPDsOMYef1m807SVoHXf2uXvzLwYRmS9A6iAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mc7VKOEOA4X2QCitRHM7qA/6Z34HlHEwiaCyE2zw36d8YkjpFPc4Jyl+ZpXeIl97fyZF8frEAbGhvBeezJ40NsiyBgqgsrmVyIZjXGjvFKMe+t4Jj7tMce/69A4j11rr6OncD2lVyjQotebxiDruNafexxhHGtNE8zAFqdSC0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6SH1/P5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434plBQ020934
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 05:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLxjbqM9PSW7oEolDee1xiNk/Q1KHNR7QJsWA/AIg1k=; b=C6SH1/P5jRelggFM
	jH5mBWY0G8kLiH4Lnx2X8AD7OopyfOO5PolWhygJAYzaxUH4DX7p0iacv0e0wwnb
	0xWmdgaOqPgPxDFkNKJJBZl4vzt2sF1LFm2E+S56gPxKDxeRChoszrd6XfaKxJO+
	3uWqj5AAuJjp8E4arHEmne45TwLI8PMGxUk8L3cHb1vNS/m7kaOshak5zt5GUccR
	uVrpkchKgPu4bSBQhk4ZeRfQJZ7dP0FhaBMyyD63HG6PQTDAuqkHLXiWO96wbZKD
	NUNtKh77wmUPLQegxX8H9uti1zyvyXfIHDCm1rXNy07JQ7i5hJmjpQF1jbxp5Sge
	fW96sA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc58418-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 05:32:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476623ba226so48503831cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250337; x=1746855137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLxjbqM9PSW7oEolDee1xiNk/Q1KHNR7QJsWA/AIg1k=;
        b=Tu3/3Sr1XMpfud8eugptZSkfbBDh3Bs2d6duNeBZWFBFndaMnnI1Hc/TmBo7TcuYYb
         INsLD52cLivzM1jgx7GeyjS/nOLkeuMMcpHVw+drkx70zajW4Jn36t64zSVjPprEJbyG
         IDl7m6QYWRgr+aSUUWz08FzrmtRWC7drmETMRU//VttnPJAbcGysoVz8m0pILgj67CzL
         6r00EwjwCYdLJk9OqBinRsja8mbYgowa8ZpjbWyYCMI1KqYoFK0Q03TvIBLW8Sx61a0k
         wh7O8qyes1DDT9fScoQhnk+kTGnY+zfU2yuqsJFMLwf3UpvtyDvKYw0bzqMfj+BEuAVf
         YBcg==
X-Gm-Message-State: AOJu0YyK3qiZjAR3D22iYfii6hysxxPs9MlBmOVbZ01nJO3cVYzeR+T7
	I57SNJrPzofJnjoEvyKV63uKSNxPz+KSvgDVJfmYQcB1rd5+tDNeg5KhEKA5b74/9r6OkbhF/57
	Ywlw9ilND8GAn/UPG+TpwVJaINZjcQjXIbVR8eCrCCWIcE10PhYJyXj4Egy9nfAY/
X-Gm-Gg: ASbGncvTLkEfCToXHGwnjZrOdx6UVsH+gkwTSQptLp4NPX5xX8SPN0qxY7G9p21H90s
	K7nNvFxVuwnAEV8ZrMqKB7gTbtKgh5NuNlQwnDvHUkUfmwB2/RwX81sGwAlfqkJ03yEYBgjqImp
	YV87qnif5xsEFcv3wN1mjz35SmYdJ3CrzzUPVqUVZRxOyjo9mCdt15MBBgUG8z4mTci4P2mq3sS
	7FWMnsz4D5BOrForh2hPMnprRvuPL1jFKnn+r5NkUvX2KHYd5i7rOc7r8wTsSE6IaShgg84cM+f
	MsmPaJissi4e2N5jSdbgFE+A8MQpS7bSnovjmAUfdbzOmqm2MOaGiam9mDnUhFrPqtShSaD2egE
	tRDFK4iJ2uXo6dnIEo7hXovdL
X-Received: by 2002:ac8:5756:0:b0:48c:4512:568a with SMTP id d75a77b69052e-48d5b96cbdcmr24116561cf.2.1746250336824;
        Fri, 02 May 2025 22:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTs25BvVtFCFuCcyCdpmXaV7jb4YgOclzlqSXZmWEcq9CovXVDxtZt7lIGjGZ2T9NIbNewhA==
X-Received: by 2002:ac8:5756:0:b0:48c:4512:568a with SMTP id d75a77b69052e-48d5b96cbdcmr24116391cf.2.1746250336393;
        Fri, 02 May 2025 22:32:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 08:32:08 +0300
Subject: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lxvekQGPDsOMYef1m807SVoHXf2uXvzLwYRmS9A6iAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXZb6OKq+z//iyeZr/AmTBOABud1Az5/Ibx
 XbLDa4Nh5+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1dW1B/4/H8EvUOxYkySSbIaOqwGKUP8s76idmHDQ+SXplOVQ5t8vJ85UvryWnDddYDriqHjv6Mp
 yFR/5yRd/c/laBCtZRrm3wZY84JHjQr/iREwEHFng8Vb+vLE08XKQQRS7GalFCYxsa7qxuEWIpm
 qPaoSJqiVKfyfujGC8MEJCKtPikx05xkdp1SY4U2xRSH2WZWecGv1Sxb57PXy4ZUzvHJlPMmZ9s
 Ay1YA+qeDcIZ+2Bex0/JVyNCieEGnHceafd/nbTSJ+6IO2LG0Z+y/K58cUjaY1/6tZ29pm3GZ5+
 JwWH23qlxchhnAXcg5U1wtBN0LvTNdQ8G9nF0hsh71zVT2GE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: h3oFbKr1ce32B5-z_zBDv_rKIzl6QDnq
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6815aa62 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=04QupZ5m7bBPoSiWPbYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: h3oFbKr1ce32B5-z_zBDv_rKIzl6QDnq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfX4oizZkffGo0n
 YwtuXeA3qh0zSZv6Q9vhBQIx+KQmRmRsZl7q79FjvzWFemqqlWHCV7zwBw2HkwEbE0Ngl0SJQyG
 aDDbgNpivEKLGj2/o0MdoCpqL9Jlpy2YycShrH9lrLhjdVC4TfKD/CkR2bySaeNGcOCucT6weNk
 LT/GvizC81k8ndx4dcVOUcP1RWi2vDh9b6iDYsV9vfLEOtkamafPYtU/H7bejnpE4vdX9c433gR
 Dm2rwe6WWu6N2QAzX3QlWBEHe3I9H4+31aB/8ryHCNweLh+umQp1RF6gE66jexB6rdXPbkNhl1r
 em1qfeqNBgu1fLtYXdAg39lkOoldX5oipswRr1up/s+ikLeJ3bpxJsfc9WLdK5z+0fYIH6sU20r
 5Z3biWlEK12soyC5tF49h0B/iUzcI98d1VFutq5IXQZUlnzdSGLTCKUwlNCBvMhCGprj7HvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030044

In order to simplify cleanup actions, use devres-enabled version of
gpiochip_add_data().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = pctrl->irq;
 
-	ret = gpiochip_add_data(&pctrl->chip, pctrl);
+	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
 		return ret;
@@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 			dev_name(pctrl->dev), 0, 0, chip->ngpio);
 		if (ret) {
 			dev_err(pctrl->dev, "Failed to add pin range\n");
-			gpiochip_remove(&pctrl->chip);
 			return ret;
 		}
 	}
@@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
 
 void msm_pinctrl_remove(struct platform_device *pdev)
 {
-	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pctrl->chip);
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 

-- 
2.39.5


