Return-Path: <linux-arm-msm+bounces-87018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5E5CEAE19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 00:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E86E303869E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 23:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46082E8B97;
	Tue, 30 Dec 2025 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6K48ciD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQwC64C7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEAB2E06D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137774; cv=none; b=PUpDd2IcxdssC6MeriR/t74THBkAvZQkFIr7FmWQ+6pDvJHFKtLbVnSNDiundmmTndsnau9JNau5CCs029HmwLDfD06ceRtG5HJyrh5Not+aEi0i+nZB8tQd+m/EwadO8F6gAuodZQ7uuCMRaMXw0ANGdGTK2jL4xiKW14tTl7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137774; c=relaxed/simple;
	bh=AG1LuEu35/QXARVDmQljJ6/X6wU6zxwBmWxtwK9pVwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTHgeIV9wC0/2pZolgFT9beJS+Day8ZDLjBFBhO5RNNgghbzDraMqD+RVv+jnU50d++6+F4Isgj69dy+bkyAKcFHeW8Y6cIKjfU+34bslzNqC01fo35Y5vh0uAE9pJFLyH/HBQMbHjX5gb02lZz78uIXMD97mW8gAkfdfGvin4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6K48ciD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQwC64C7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUF9lrY900395
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zzqm3vWt+G5X81VnTc/HMamR4mFoNc+f/SQq1irb68=; b=e6K48ciDEEdSVIk1
	V5URzU4EmIaNi+mTWu3/CM0TJ0FSs7gV/tn2Ua5J/MGr7ubda0KYd9jbWLZ3LhUC
	DIxsGwxjtbpxf6qnSRvRYW7tQyimoHG8nQCTMUc5BrFE4unSNsDFH3653SGPqhBD
	a1K4811xoS2DlJjyO0LU84S9Vc64qKW+jEgvjTd4iBIFFxa8B/E0IRFodDtMbYjE
	FY1xmPZ3xulWcRUYhzTP1wW4fT90lELBoqTgN/1+z2a9UolIvHL2300hJafBHFX3
	2Oau6tWOr7pkxmdKB4JpBOk/qlokuVLOQ+Y7zFVZTxvUXnEePHYi7nla/anAwKTq
	j0N1Xw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky26wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so128021836d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 15:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137770; x=1767742570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zzqm3vWt+G5X81VnTc/HMamR4mFoNc+f/SQq1irb68=;
        b=bQwC64C7KlAPJwBDNAjBspxhrQVNDNHo6y2rDpNhhMe5yqYzf5yk7sGxtptygna/CX
         zF8S7/Vv8YEtPeCYEySz0om+jKrkoYfTd3a/oG6YONMblC1DL8VPet1HDiH8N4sSpcgi
         BzYNd1diHcBAaK+mXdpIDjSor+zBh8PSQscIj0flBKVzgbzGXlP9LZSWZEmOY3SMbUjQ
         1jV+UhSeMu5rP23/tkTGBJkb8KbAX+4CtFveCkXIG3CyDaIPX3op+v4OrxxbaLKA4kRr
         tvmdRPkQXelkz7tryQqImM9gyvrvslhjoE/hoigb7l1qn8elw7vW3/rIGwAvZUdmQ++K
         GyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137770; x=1767742570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zzqm3vWt+G5X81VnTc/HMamR4mFoNc+f/SQq1irb68=;
        b=s8QsNFTHykZSto5qoPEJJ87B9QCMpFHuPd7HjY+RaABNcfrMTPfjAgk2wmVFt3K3WR
         iTt2ZGo2/EGKLpC1M+rz/7h3MuMPxsDIrPivECLXDs1xt31fyjdaCdRNPAoFhhduGgd9
         YAXQXv3O76aD4hjADWjJ63SO9fTpr0UrzOeYWLT+unZSOm0zaoxjHrXr84t40LCONRP0
         B4/uqWuAlX8oT4hSMwKttECIAwN9UHatHyCbwTDia1mLVFOQi/dT8dRXv6odQbLpWF6+
         FLj/CNzZMDBvj347p9bUka1BVghBABuU9eNLEq5WFySCj0LE1dwzfZQIubOmzuf4Py8I
         1ivw==
X-Gm-Message-State: AOJu0YyNdQNeZcjaZ98jjwu4k//B9FssGvQJoZ/Mojf//ZfeW2xbSCky
	cXwL/dWi4wk7H+p86xg2ZYHeLX93orvpcN1Psf6r2ipeul4YnXREsL4acVf2hlKT4Uh7ZH4iLCn
	lVn2fNd87vE1n9H+SvbxOilPGC/d7zgG6W+SQOgvGeQSNwReszrF5iltjFYiHe/om172X
X-Gm-Gg: AY/fxX6u0mky281riYf6JzHdPYLqLmM7azC5UARr3lCK3zkqbkBpVHZZIhGePDVh757
	vfxtZzhcEuCe7zRcE16gnO9jzR+OJvCXjjvdtKH49lH6T28IR8kYqmzeK7Nq0tOpcGZ8k7nSANt
	58PV70J18ZSfJZPsBdfOQo2RRP59XbmpcbXJUbt5V55ZsPSVheWf4npx916WsUXKiwQraAfi2PS
	Yvdso8Kq2JJKr+NWPy2/towz7JSckEL4j8XwdvyiIDBNiXRiOp7ZXTEE31ibRDl2S76/mFBR/wv
	4ZC4FRypjWXQ/tVi9lHu4b+m+IPOdvc0IcrVHcmjBl83trYamIt2h8lgty87VlVwn66QLI0Nr8g
	8TrwVCaNZS1MY5YUEYmnVQarojpzps+jGBu2isHSzF4Gi3G+aMNb7dxDnoLGS4c6C2rjgS8P8Iz
	KycZ9E3sh6aylU0ogXK+g2Wh0=
X-Received: by 2002:a05:6214:23cb:b0:880:4c15:599b with SMTP id 6a1803df08f44-88d81667282mr560504816d6.14.1767137770074;
        Tue, 30 Dec 2025 15:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdWALg7FWe8HnFIGfMzmshFveG7DXhOdt7rpEnzHy14H+14CgajaaMGSxFNnYetgNtZv2I/A==
X-Received: by 2002:a05:6214:23cb:b0:880:4c15:599b with SMTP id 6a1803df08f44-88d81667282mr560504496d6.14.1767137769569;
        Tue, 30 Dec 2025 15:36:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:52 +0200
Subject: [PATCH 02/14] Bluetooth: qca: enable pwrseq support for WCN39xx
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-2-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AG1LuEu35/QXARVDmQljJ6/X6wU6zxwBmWxtwK9pVwc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHjmoSFavXQi3JlRn+Z2QMO9Tk/0rtLaWUNv
 pHS4GewQyOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh4wAKCRCLPIo+Aiko
 1S++B/9RyP7SAXCM/MZIkkTS9QxNyh/wJ1yzA3IFsGEWaw0uinf2VvjekVO4joaHHPKkGhTVXDd
 8BOqELjg7HLDo5E1037L+ZFMPTHeJeTqMUid/ELoPcdLZzqFsN0icUg6ALx/Biexleanj6SfQLQ
 VI0jBlNA5Y0PD8nXFxMvT2d6TxwiDTXbl/iCXW3yVBSjbA4Dk/M2d3/seAshcy0Ci6TBPs99q2K
 NO0sLSXgMLMIJGTcl4+XgowZ7CpnomXgFJstjr695of/roCI/KEg0DV2hQ2eITfnhRuKG8x+zwd
 lKpcwSLnv4Ji+P4FuzzfBz0AVoluNcbIwH2ysn4q3yNZdf8r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX7OinE3YHjxIo
 jGuAi5ss+suz+qdgvAhgfaj2w+l13AypNMx1sZgim8kVVeew2i6xPJqK0gXwZHAAppREbKeeZvJ
 JkdMfXP6573OTo7ZRCjUu0Iwt1eNpBuieYej2OFcUhCFUbXbvcrvK/s+NG35X3eavX04UqCzhEn
 v9BYP/xRUEM3D/K57r185Tb7POJyoLJk735FJKVOnGMbAG7j4aruWLQrc8EwBVDZu1IYnQ9yGAI
 5zr1nJloCoBrfJF+ij/TTN2IesMq80NNMy2sMxhHneCFW3I+GarIfPoqSn+50/AfPMq4aTY7LTp
 wC4mHsz/1xWMZgAugrIJ1a6wN59O16lfIdiTPzqsch106F5pZ/iiC5pij7FShfIG79DOQRTwOKs
 f0Itwn17oIkQtG6WK34xFSHmNgFzKbv++qZrvfkzG2d0GBn78g+BvoxXXYcBHXXI+UUipLMlAPP
 CWZS1IMVs8o24qMa1EA==
X-Proofpoint-ORIG-GUID: Y9GB1YxIHRya54ohYLvQtMeC1-HdcNM-
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=695461eb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7G4NRjGX0UlV4bIyNksA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Y9GB1YxIHRya54ohYLvQtMeC1-HdcNM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300211

The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
voltages over internal rails. Implement support for using powersequencer
for this family of QCA devices in addition to using regulators.

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


