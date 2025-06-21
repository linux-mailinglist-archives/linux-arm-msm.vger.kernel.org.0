Return-Path: <linux-arm-msm+bounces-61947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC9AE2B14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB5B67A6A01
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 18:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA740271445;
	Sat, 21 Jun 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSGak9gr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05C27057D
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529664; cv=none; b=YuCJLyh7zwKsewuFzYM4Le6bBBrYfepuwXzIpdgJIlkyS6kRtRXptVANX2jKQtFxZPTk/nkAeU+iOqOS25qF4jV918/h/C5S25sdFvln99om1ipewAFEuagvnHRINAt6vlUbSgTt7KkQY7nsyx8qjmGGYJJ+W2r85Hf2AAxQnJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529664; c=relaxed/simple;
	bh=MULVME50ezTJwjsRCNi4oguat38TlOEQQoYSE9mtnJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCiEDoiCN9qEtZs60VjjZeo7G0h4ZwNF3qOcjWHb9+W1G+OH7J+2j3co1j4OxRqJM6Kk2EB4oicgp15y77R/X7Wm/bhP6soOkdjhUNOqksfgJW1c7Gh8vE8V+kRnC61i4PeOTE1vADdcwYhXZT0If1/HXJLAZ8eQWtLGY/Y6EFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSGak9gr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LHtPMc027650
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDHxHk18JOqx0nTuxFkbc1Jn6lI5tYF4hSfLOq+sH78=; b=KSGak9grsqFsME1A
	yyM4ChOU28J95059wf5iJPt+T2ar1UFjU28a2Pjo50OyytORfCs2uQwtRQgXXp1N
	RPvYi7vwdTZm8zDrvft6pUjWh6jDM025/O+n/daWJ2e94U0jZqFtoF2bMqsLnblU
	BxnRgjoyfBdwXdyNwdl5tIJGmVWeYl/Mpqglw7gBhJNe8/4gsbVSOT4QefIRIlEr
	OWibeAVRjb9fBr6rP7pEnbONpgpUcsieucu9J+6e4/PyqqkTQ1smrhzV5raIhdt5
	tpU3Ixl5gNuDCiM6b2ayjQb6YhDD3zc7GljxN6B30Ze6uazUK9gTgXWFYHpbpVfw
	sRY3IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dung8dv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d38f565974so489172385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529661; x=1751134461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDHxHk18JOqx0nTuxFkbc1Jn6lI5tYF4hSfLOq+sH78=;
        b=U9R3KqmaYu7BrMIiRKo5Ffs1piM9veNMq3odjnhj8SscjOSWmvZhOguSqXLg3wsEv4
         +NqV6gvGPEe7kqh1SzZKt+XVB/IsQiGezp9GUMSKy6M8VvCdV3CzPfnC70uhyhDnN2Eu
         SanP4m9YvTWG4j809trypk2FcNQ8GxpZtOf93TmnUC5bNhGHag9SUtb7Ip/vxEZATLCg
         zmdGVaQiERz9ofzdTH5ekgUhuBRUj5EUNwaYpbcLKHgHEx1X6Hq0DH58Amb6boeqYvPj
         R0yqQS8Dm5REIb8ZZQRmWJx7UgabRm91st2lCD2ZPa7hP+RUry13KKzaMAsmFXf7N4D0
         VZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCWbqWMsuMeq0Mm/iYILNeCUhrjQRMnf3Oj6iMuuTrPPya2+WicK7Zf0zZkQztUk+KyB7LvMdSTawWRACGKN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi0chc0Ws9fCgp84Za/qu3VmC9DZwrRNLNLLOyyJF5lKgActjp
	fNkHXtvGinKe5kiTZm0lHjLIjJCIKiSz/19pEv9EY6VhFKgi7A/ORAnwO0s98G0gywqO45xq7nS
	0xkNcXCfbSn3/mjEpUUb+AJnmNRPbLm0h15VcpsxQ9Fb6w3cQkdIQL+3Y8QZaYoS4hH83
X-Gm-Gg: ASbGncvedcPCeZovE29nQVhXfMHp4+cezC1cwuxAUxsqmWkBJZGQiBkanlwgM8hTOah
	BBDEB5zeLgCpgkmUKhbs9AfBS5Zwg17yvtxhjAuoYikenGz3nSd0Zxlqidagq8Km00QyCuUGfT4
	6iSCapr9MdHysi96aThShIT9pX7JikBYv8lJb5bUaUxgATrWGdjYfjnIL4X9C3cpUUtqB/X7ZUt
	Zmdn15Gr5LHX1FS6z9c4X8irepyF4AFOfLDGtRA0IgyTVDUqoOe9LnXtCm2CNqx55BxoZz3dYmA
	3y7ShQLgy/SeJrxxokR/Qvof+pYxz6a7qTKoMCEUIREcr06dxvCgl9F900ncE8FTMXNbLuNWexQ
	IKfP8iBPKlwSG/W0nurR4bwIIvIy8dkxRAn0=
X-Received: by 2002:a05:620a:2b94:b0:7ce:ea9d:5967 with SMTP id af79cd13be357-7d3fc02d9b9mr965399185a.15.1750529661110;
        Sat, 21 Jun 2025 11:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIIGisK+ntmvZYvKQNh3iR3tO+luthxByBUMIc+I29rTikd3A4VMB6uu9xiBW8m3JmQts4UQ==
X-Received: by 2002:a05:620a:2b94:b0:7ce:ea9d:5967 with SMTP id af79cd13be357-7d3fc02d9b9mr965395985a.15.1750529660725;
        Sat, 21 Jun 2025 11:14:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:13:00 +0300
Subject: [PATCH 5/8] usb: typec: ucsi: yoga-c630: fake AltModes for port 0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-5-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MULVME50ezTJwjsRCNi4oguat38TlOEQQoYSE9mtnJs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzPdJRglsGaRqUfmMC4gZNM1SYbEIfH7lW0
 sJ6e5L770qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1dh9B/4rga50gzKHMm+2fHIeEu00WRUMyq4GwbB1ytQ6p+PNsDp2JbPXQP9HsbuZkv4wPVoUxgZ
 h+bexTXZNS16WHt2JwBN3ry/jNsH0vVya3DTydbC1p1oFelUBZnCfupLGUkf9Ct10VpOL41DT8h
 LcP75iKMyulsPwUZHADhMATecht3g2CFz7xEZ9+itC2PParDxJz+VkO+vij2T1g8EpDASdh0dqC
 ZbUv72bKypU7loxxS7RyNmlU3uBVVnn2TFZwpi1Nkr0Dv8rIHgz+F2nIPaQO6zrauD9ejya/CE5
 y4SYpTpr124VkpeI60dW2gprY07SDz46Xl3SPya7JfN/bvKX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: zLj8W7p5PHRNW5O3EszNX4C-b31tePFi
X-Authority-Analysis: v=2.4 cv=N5kpF39B c=1 sm=1 tr=0 ts=6856f67e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=O-xtLUNLgrTPA20joi0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX7mQnIxjovs2O
 cU3W51wKl+eF6sw6s92ad4ebzLybD7bv5dZB2PHIwUOrifOoRFJdh/8FMok55SXpFefduJst7Us
 l+POjqGm4KnqmOkaP4pOs37FVne+lendmVDOCxT+6a4OwdyTI3KI1hKGXpvdMt6rjVA5I9QpSk6
 X1hqyqQ4Jsca/FjS3xn813tcCkZk71IzGP5BMdZS/9s0n0cmpOfddHkRYcHqPKKyPR82phHyNaY
 95VeJotdjnHG4JeI+KnvUGQCEnpSWTjd5VqRIX0cQ6kL2YkI4bv+81LT7HCpUxKqPqEaOscv4Nb
 u4Y73EyLr7uv9B/vAXzGKWSjIVo8QxhMDt/faY5oSoiPtIy53z1Gjb/vmhOPvdv3WE2fZZryrIB
 HvZnRgce+T2XbA6DlAPHa8BgUguK/QHAVT9bGrKGNIlJ/b1zm1lQVmIso8q5JzrrysL17THr
X-Proofpoint-GUID: zLj8W7p5PHRNW5O3EszNX4C-b31tePFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

EC firmware provides information about partner AltModes and handles the
DisplayPort AltMode internally, however it doesn't report AltModes of
the port to the host. Fake the DP AltMode for port0 in order to let
Linux bind displayport AltMode driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.h           |  1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index d02f6a3e2f50a4044eb3f22276931017cc624532..b711e1ecc3785eeb34e407e58df939f2d29bdb38 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -50,6 +50,7 @@ struct dentry;
 /* Command Status and Connector Change Indication (CCI) bits */
 #define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
 #define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
+#define UCSI_SET_CCI_LENGTH(_c_)	((_c_) << 8)
 #define UCSI_CCI_NOT_SUPPORTED		BIT(25)
 #define UCSI_CCI_CANCEL_COMPLETE	BIT(26)
 #define UCSI_CCI_RESET_COMPLETE		BIT(27)
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 2005f64ebfe43ca2bcada2231ff99c578fdce877..506faf31b6e3a056e067f2bb69f5e9e5ea40e514 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -76,6 +76,28 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 				       u32 *cci,
 				       void *data, size_t size)
 {
+	int ret;
+
+	/*
+	 * EC doesn't return connector's DP mode even though it is supported.
+	 * Fake it.
+	 */
+	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
+	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 1 &&
+	    UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_CON &&
+	    UCSI_ALTMODE_OFFSET(command) == 0) {
+		static const struct ucsi_altmode alt = {
+			.svid = USB_TYPEC_DP_SID,
+			.mid = USB_TYPEC_DP_MODE,
+		};
+
+		dev_dbg(ucsi->dev, "faking DP altmode for con1\n");
+		memset(data, 0, size);
+		memcpy(data, &alt, min(sizeof(alt), size));
+		*cci = UCSI_CCI_COMMAND_COMPLETE | UCSI_SET_CCI_LENGTH(sizeof(alt));
+		return 0;
+	}
+
 	/*
 	 * EC can return AltModes present on CON1 (port0, right) for CON2
 	 * (port1, left) too. Ignore all requests going to CON2 (it doesn't

-- 
2.39.5


