Return-Path: <linux-arm-msm+bounces-80773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500DC3FFF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 13:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 431E73B4CE7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 12:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61502BE048;
	Fri,  7 Nov 2025 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GBVsjpWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675AD288C3D;
	Fri,  7 Nov 2025 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762520057; cv=none; b=kSVh58iGkEzaNNwSOL9Kg4oGBCAp+BBKcUd6fi0gEzT0SwDlUpR2MXzSZJHjip67bWf8L8RudwrpHVCmRbk7JUFcdSRbZzN3I03BA0+sQDH1yLZBa3079/NSaVppMmNyirM5cgDi3qVYFJPBZHa47R8o1w2AznJkQZs4YxB1VUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762520057; c=relaxed/simple;
	bh=k9EEVswMFqJRut4kEtTYv6JgOZb2c0VDD1VhmxGG4sw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NtZ1glNgoD1exZQ+yHxrKkI3b5xaV/Xx6YheasRpRWay3giaElPXyoK13ROT8UYjsW+7V6Bvh+1SPyzpM1JqSKKm+oxQbQxzaZltSnWfG4JSIbgp3F7Fvy7TBJGQ9i9hbiRpLfj+gwlm9NJOAvYK7AzNBaEGVxA/SeYBrrd6Cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GBVsjpWT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7CVKV5584077;
	Fri, 7 Nov 2025 12:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z5p/PsAfcCWJ8LmVCSFKaFCCjmN+3ZdiDc1
	RIjcMzEg=; b=GBVsjpWTh4Qcd53QS//ljZwGtyTZNhgAE6pgBmDZa63d3rIBiXd
	VSkTCKorQ1ZuPWZjcrRFd4Mt757n1zciNTeGZqstwYEfsIE3t3Du2MOSGgyPbcxI
	wZtdSQSGWZTCJ6cXUGDXqik+oh3ajodMoxcdvrvOp5YC+nToU+c45xC+mMKRaJTX
	DMuA6cCX6dUvlQHtmmL4C3x5c9P77KwsaGWyFNrz5TMPT6vO0Tfzi9PhqdLR1+ks
	r9yoATmmAtDq4TfKANp8TFjUzJFQPPiiLRYf5hEUxKqoVCk3Sm+OuubHgw3lL264
	kYJORgxp+ghn5spZwqv5Akd+0KGhZm+bRjQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktk3ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:54:12 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7CsAZx015077;
	Fri, 7 Nov 2025 12:54:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a5b9n7hj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:54:10 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A7Cs9DH015068;
	Fri, 7 Nov 2025 12:54:09 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5A7Cs9rL015064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:54:09 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 9E93E22CA9; Fri,  7 Nov 2025 20:54:07 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v2 0/1] Bluetooth: btusb: add new custom firmwares
Date: Fri,  7 Nov 2025 20:54:04 +0800
Message-Id: <20251107125405.1632663-1-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690debf4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=kD27Cg0GW0L-Zw9_jswA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: AP_Jpci6ruY239yw0sq2f2ZW-PHuuHfn
X-Proofpoint-GUID: AP_Jpci6ruY239yw0sq2f2ZW-PHuuHfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwNSBTYWx0ZWRfX4C6V52howYkW
 vEHpgARcw6d55Uvjpgf1ZzAFlk/iIaf+faRH5irejgmU9sw1tjy8U/DQx4mRVZGXcWeqSNDfKYq
 7p7Jmt4lfWoQsroBcMN/+YVaQD6Aav0JOdUnSplmDNSkvRnvQIClvVkytPFGAw3JaZXhel1OC/Z
 la484ccRl5+8FSgmRxm3gClMhVsr6ctH0LuHVUvf7w0hv1ChDF/d+jhRyWDWHc6xDrGgcmtbxmJ
 hHzBVEJ7jk6kRSgS5pxReo+GA0/kHJLKek9ZipV8/7Nb9c5SijqpPJ9LEyq2DvrA3nNhVIpgZ3o
 DGA4rF+E8340//2+AGNShG9TXGp0UVOs8k3ZwAR0WgTfamhr+ziLUvoalLrWFdo37rQ6qBTAIa0
 tGnrTl8jwxARWR2zEoi+9LrGSookOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070105

add new custom firmwares

Please refer to the link for information about the qcs2066 folder.

a3f9f6dd047a ("Bluetooth: btusb: QCA: Support downloading custom-made firmwares")

Changes for v2
- Add a more detailed description of the patch.
- remove CC stable
- V1 link
  https://lore.kernel.org/all/20251107021345.2759890-1-quic_shuaz@quicinc.com/

Shuai Zhang (1):
  Bluetooth: btusb: add new custom firmwares

 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.34.1


