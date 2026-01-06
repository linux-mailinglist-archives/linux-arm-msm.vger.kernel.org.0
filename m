Return-Path: <linux-arm-msm+bounces-87581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F81CF632C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 02:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E32A303B474
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 01:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FAA28506B;
	Tue,  6 Jan 2026 01:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQmbv7Hm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtcZOgMY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38D287272
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 01:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767661287; cv=none; b=UapMtjRyLlnSEw5sqW060n6bOm/NP7ZDRfYumhpSPp5TdN1+vtauBtHcxT/2NcOQ1usjXc3bOEtQSmkaXE6DXsUyVjQCFQku0rOSJajpMotD8nh9WYT8QVcxW0EfOMGAUkMc5hR8uQu6U/yDAUfmG449RECe2sQIfgUcHuKzPHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767661287; c=relaxed/simple;
	bh=8ro0A6tVVAR8N1a3EJt6gZeL+nfKC2FamuLo+mTTcgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbveLBISaNPoak8BviJzurV2Ajjtqz5iuFCLjjWS7cnaztsrCBNXV9Dq01PtCSP1JHCXItVABaiONS9fP4wrLtLRZkQkB5/0/JXZeUTFLL937I4WZ0u9d5kwHFcIGtmJR2gxN50xCyuqUAmzaHFH8HetlEtxL+AF2To4jt7Azrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQmbv7Hm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtcZOgMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nXZs2746266
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 01:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SuVJjvlCTXRFYAFx0rLVTZXUOY4TgeWGafNaZ/GaNBM=; b=jQmbv7Hm6oM7Fh9T
	PsbD2BMkMvJs2UioXCo1W5VCFS3fhze52LW/etURrC386p5MtNw824OiW05k2eSF
	js5GvLofGI5vymuNSG5h8FU/VaeReoAAzJuzty5IG7MPEIZVDVyOvGhsChH6429a
	tcnA7x5TBFdUPdMDRDS1jguEFYsVnFlL4P529MEF07oazVQSz88Hvb7QwrdcXYD7
	cG3qnoxsQOg335m8ujGk6KDzsqfjYsFf8FQNcqx1sf4Gg/9bbwylSPq0ZbB0WHMq
	gnRwQJ/GMNjBeQomqRmoqmXfpGcaYTnnUy4LCjK4g43G+mYuKOiJ2MbH9P8hrlSp
	twXDLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgg9yscf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:01:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so60418971cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661283; x=1768266083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuVJjvlCTXRFYAFx0rLVTZXUOY4TgeWGafNaZ/GaNBM=;
        b=VtcZOgMYJexBwgPuQm5ab85OwzbavcQYaYgHl/xgZ8nCHwyO/nIPlFAQrl1NucM6Wx
         qOC2aCVSQVTySmVKQMk3jAhURiO7RV+oJwgs+dHLauZyh0S4K7v3e5chki+sgi4fLUSm
         Pmdc4dP2pE6gE5/iRkXkBeMlLgWNkYqs0bIPkzl0dHkzzIu/NNoy0vQao4JZMdGnFamk
         BYB5KTp0ZhkdbZeNAcT4X3E2ePt3eekK5NDKNl57uzZsqd9P76/PatisN30T892xxlXv
         vd2JM410Hr5kVTwpTH4w3B+CTyFta+mS4eHj+T1CeWtnNEa9nQTCMN/T/kE6I0r3XMpH
         KMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661283; x=1768266083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SuVJjvlCTXRFYAFx0rLVTZXUOY4TgeWGafNaZ/GaNBM=;
        b=vdH92dvUAJU9PkYHGEGLWhfAH1PTy+U0sp+OEJgWFXE680uS147GiTGFnj45E/r+JB
         tnT6UTuxeF8Q6Ijdr9Kgx6eV0r4Buhj5uXznVQLlpNraW5tvepZ8P/v2j5oDeLXTg0tc
         yXXCO4VuChvo5a6v5USTRe7omWFidwpkD174935DbMewIGSxNMVMtC+WdqkzJF4Veznv
         wfruogHfiwV9oKSpDVFzrix2wfLFeNJvkfxGkqjYtZ7DMNQrCapdiV08ytjoNp67wHPw
         LHXASpWebFDFqupZoWRN1B+0lm7roUTa3ZGIVMAJ++VXmLbDhGzNp3MQ8+LmV0cjq+Md
         yLQg==
X-Gm-Message-State: AOJu0YxkQ2BcaO7nfIlmwMJE2g8MCH94owGDr8aehCNKxlkJJ7L3P+Kj
	8o+0PyraU1F0e6bCfyWFfp3VXYz9DYRPWh7sXU9T+mJLX7ZbVhqdpxCyd4xqOfdZIvjF19MSIB4
	jrjvJbm8aCtdtKJNFf1OgXvtrMtYorrDap4WQerLrWC+dQXhL4lcAVenYDy1QDlhULAg7
X-Gm-Gg: AY/fxX5y+zmRYztqqsExVjy0fbqY4N7w3EeN8WFLnfk9iVHnkQjoZOB8rkj72rdNGr1
	9fvMBLrn4bMBUs7mGOskjJbvZI4aLBoYM6HtydtNHV+4XH+ucdiFBj8q+y82/M0lsdkVeKzhfD/
	HEMBY4VfYqYG84r6n9FWeBWIJnHCkhdfGQ2KoQpv7ZKBg1rJoa53uNF8GnAGAV57a6R6A0O6M8A
	Ks0pIxngOTa8epRWrN5pz9RbzGYhbkH3g/O+ZUOZVYSvSA2AQdHIZidZgsHVMJeWFafSLgkELmC
	jT5uk+KhtLK1YWncO+RtzoHds0yDFjDRbfj2Fp5m7zBaHBudh2d0AVLoCtoQ6HU3RuAPYbynS+q
	avWVRvvOQMpXa0A/bFms3yjYzZHjrbefoMwh7bssn6wIcYOYwbJJracqMRo8LBD0TUQ665nBxfb
	DPJ5VLk3us/WcR7MFVfGXX98I=
X-Received: by 2002:a05:622a:14d4:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4ffa84d5bd0mr14665291cf.24.1767661283407;
        Mon, 05 Jan 2026 17:01:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrZ1tIZiQ6ycHzI3EiYuZDUWEqWF7mMpIemTNtxXuHPb4jtHfXaJhVQFBU4f2EXJPRI/6qNg==
X-Received: by 2002:a05:622a:14d4:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4ffa84d5bd0mr14664681cf.24.1767661282972;
        Mon, 05 Jan 2026 17:01:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:12 +0200
Subject: [PATCH v2 02/14] Bluetooth: qca: enable pwrseq support for WCN39xx
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-2-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8ro0A6tVVAR8N1a3EJt6gZeL+nfKC2FamuLo+mTTcgM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7YIE+RgnOdF6j0+1WDplDzh9OEu7rZOc19L
 X/4QNNE9O6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2AAKCRCLPIo+Aiko
 1YXkCACC7NBtif8a2rH1Vkwu+aCXo1j7E9efr80epimwSe9+/TpA38HWBS8S9p5hLjd+LkneptH
 dTD1KFpwF9FhUb66xrLzboGL/Qu+AkHxaw2OEUxdQuBpW8dOcszVT43KfRGk4u7I10YMxMEb403
 0SXACEFtKg4FZafeHufsYLCBlPE5GpXBbwR2YLACyCFrt4lSmtlwTWmoC9IcVExx2vLzEYzSWO3
 G9HZIcJEbbfAf8bPovnN256QMeNiLd4sW5DgaoRtsbWHEKHLC8mowRF2iTN6mlHP7Ua/Zeh3GKT
 eMKVCkcXPzZXfPFenhs63JikBAY3tfp3eyMLslp+14pWjp0H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M89A6iws c=1 sm=1 tr=0 ts=695c5ee4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WNkeAZsnUospxCs8hJ4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX08PRMF741+KB
 04w5ZVo5BoyZCol+FjkZ240nXFETpyajPsYJjUimef1ObV/VMWAogDNpkj+32hq9rw++j3PSqop
 59YqOjGmwtU9EDx5K1eRNm8if75CD7VOskPdfHZnPpk/9ob2b5ppvk0b2HfqDZXB7PpfVZiIFSV
 pPn8/BtJ8zizMU9U9O2H+WpbsEzQYaGpMywQRxoGD/ry2Tw787hMmuLs+MktaTrRQoCFd+95wLu
 ox+d6ba7zLCEytAa4w54cdV9+FoshDfO8TdQwACRYjchm2WjMC7maySWkDZlkQ6d9RQuJsjDA4m
 7SQGAW+P8EY6Q6SLaRJhi7zCpj/stacizU0Z8xtP5smBhn8zjfGmcfgO0KAcq3rN9xIDLoGbbUE
 2zrWvaL9gZx9amJpUIytn8FHD8YRCxT5Ijo90i5yYAp2vRpdcf7L8nktA3IoENrNZEStYRAGqdd
 5FIwE49z6tNe0sVMoBQ==
X-Proofpoint-ORIG-GUID: Jz34e4HnlSiEhc2Yx-hCngaPJ-UdNl-8
X-Proofpoint-GUID: Jz34e4HnlSiEhc2Yx-hCngaPJ-UdNl-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007

The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
voltages over internal rails. Implement support for using powersequencer
for this family of QCA devices in addition to using regulators.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b54350317a43..d1402a344063 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2230,6 +2230,18 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 	power = qcadev->bt_power;
 
+	switch (soc_type) {
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
+		host_set_baudrate(hu, 2400);
+		qca_send_power_pulse(hu, false);
+		break;
+	default:
+		break;
+	}
+
 	if (power && power->pwrseq) {
 		pwrseq_power_off(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
@@ -2241,8 +2253,6 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
-		host_set_baudrate(hu, 2400);
-		qca_send_power_pulse(hu, false);
 		qca_regulator_disable(qcadev);
 		break;
 
@@ -2414,6 +2424,11 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	}
 
 	switch (qcadev->btsoc_type) {
+	case QCA_WCN3950:
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
 	case QCA_WCN6750:
@@ -2438,12 +2453,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			else
 				break;
 		}
-		fallthrough;
-	case QCA_WCN3950:
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
+
 		qcadev->bt_power->dev = &serdev->dev;
 		err = qca_init_regulators(qcadev->bt_power, data->vregs,
 					  data->num_vregs);

-- 
2.47.3


