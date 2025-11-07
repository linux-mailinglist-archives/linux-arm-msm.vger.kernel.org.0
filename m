Return-Path: <linux-arm-msm+bounces-80774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3CC3FFF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 13:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BD594E290F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 12:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3347B2C17B4;
	Fri,  7 Nov 2025 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g2ihpT5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6752F502BE;
	Fri,  7 Nov 2025 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762520058; cv=none; b=fy8g//1z6wScJuIT5JrI/lhoDFR1WbAF5GLjGG6hTF+g88vAipbhGgMts13kaBZSYCwxxPjIu0ooVhgmz0Z8WmdfDyZQE8WXD0w3vqoU3GMncC2FtZiGec2M8JToIjQR0DRi9bLD9XOWBIr76VvjVend7AnOrvHjZM9Apn3aclk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762520058; c=relaxed/simple;
	bh=3rBTFftEx9yZP0caOfMTuZ/B607GriXUCwwanemc1Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CnbvYhMAb8/pd6/KMIekXEU+dNVpsYH2a15173fIdSCQ8Vk0SP3atoMFZ7LWwRRrwBMrtHfAly6jPgtQ+540lHhQTKb3a0wprqvy6kski4dnIKcDfDi+NBt/Qr1azy0/K8Td7JDYHD11931/IhT6FNBWQM+NdZMfasQP1uT3hXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g2ihpT5L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B0Rw42878614;
	Fri, 7 Nov 2025 12:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+sqidDvvAIg
	6DJnB2CrMhAwtro3M0D/wEBD0FhheAWo=; b=g2ihpT5LoRItix1LQJ1aTRdAfHn
	sUQvZHue4Tix/0/xqQ/WjGtTJlkt3ibGCTzMcSH+N6ppqtywBmw5UoJsU1jyWmpU
	gq/5P5E/DH5jAsx5MsZnHvnfJapkz23g2fRCGA5oi1L/NBQ5n6tTHJo9LTcvz2dH
	zNOIcQM3LtaOLChhpvltT9hoQwnCgzU+34BA6RKzmIAzR6mF7QIP4MvggnT1/IQG
	OG+jKjlPphIIA5JwTnQKPxZ3k0+hdEsQk4hcR/2usk++AP+gyhA3HJ2uUchD7Dm0
	9ml/lXFAb0EQXiMgbNp6mKz5+xxvZjWhBCLGD0SsMilq4bZUAiwRZX8tKuw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fh1r97c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:54:12 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7CsAG1028624;
	Fri, 7 Nov 2025 12:54:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a5b9nesq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:54:10 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A7Cs9rV028619;
	Fri, 7 Nov 2025 12:54:09 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5A7Cs9mT028614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:54:09 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id A076A22C78; Fri,  7 Nov 2025 20:54:07 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v2 1/1] Bluetooth: btusb: add new custom firmwares
Date: Fri,  7 Nov 2025 20:54:05 +0800
Message-Id: <20251107125405.1632663-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251107125405.1632663-1-quic_shuaz@quicinc.com>
References: <20251107125405.1632663-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwNSBTYWx0ZWRfXy61vmH+Dyw1J
 UHigIkmHdF4A7gDyDYN8Uf8whDg3Asw9ulyKWk5utSklpgqWgs0YN8OIrr9q2P+2qJKRgEr+1Dn
 7SXBXosrDC7Fk3au4A5Kw++jiYPM7GEAM6RzO59+/Unx0lqYOq6+tmzgADSwJy6ckngnj3wxDEr
 pXCvykDXavrV5gAsWxAZnWjmYWDHScfTnxD5C0VT13ZvNd5GbSm6+LtlCW6b4i4celFEY8oAcrV
 9GqHXH6nh9DIzJE/RVHVmztznwG4LX7/Xfao3ZVoDsOKaq5uoIsw9uOdUdrdehTvfnVH+gsnehB
 YjhlfL+2UD3yrR8SBK/V6TPyPLxBiC3YBzQ9QJmJdyQ6KiS9FGYN0rBMivNHoSQPC9SsL3finzH
 FIBSlTAJUIWAZVtU1IXe3LJIAp0bdA==
X-Proofpoint-GUID: bEYlc5YOwrWmo9koraIIxAEja-p9lBIw
X-Proofpoint-ORIG-GUID: bEYlc5YOwrWmo9koraIIxAEja-p9lBIw
X-Authority-Analysis: v=2.4 cv=IcuKmGqa c=1 sm=1 tr=0 ts=690debf4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=HSaFlmFXjmI1jj9ufZ4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070105

The new platform uses the QCA2066 chip along with a new board ID, which
requires a dedicated firmware file to ensure proper initialization.
Without this entry, the driver cannot locate and load the correct
firmware, resulting in Bluetooth bring-up failure.

This patch adds a new entry to the firmware table for QCA2066 so that
the driver can correctly identify the board ID and load the appropriate
firmware from 'qca/QCA2066/' in the linux-firmware repository.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dcbff7641..7175e9b2d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3273,6 +3273,7 @@ static const struct qca_device_info qca_devices_table[] = {
 
 static const struct qca_custom_firmware qca_custom_btfws[] = {
 	{ 0x00130201, 0x030A, "QCA2066" },
+	{ 0x00130201, 0x030B, "QCA2066" },
 	{ },
 };
 
-- 
2.34.1


