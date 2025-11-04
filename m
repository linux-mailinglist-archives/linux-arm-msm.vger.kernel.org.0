Return-Path: <linux-arm-msm+bounces-80277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F714C30B80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 12:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86F284E5892
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 11:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2132E6CAE;
	Tue,  4 Nov 2025 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B+bal31w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58BE2E62DC;
	Tue,  4 Nov 2025 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762255547; cv=none; b=Anjr2mIgStmyP2a1p6g51EcJd/iSqbEYXsr4JM/XLQsZOn7QZrjHWzU/msbh+DH1t0Q7nkQwDfOEuC+5orgYEwG9Zb4rmK+uxvqNOyoMIMw/u+kr2jWHKuwyjUvpq1qAUVePYvg7X2k95mZw1DhJZPRQJIhEqc7REk7FaZ16p7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762255547; c=relaxed/simple;
	bh=o7OcLfxnqWKM6nf/xV6GCKnnI7gRSA9ZAJzw9qA9RPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nhHerE+5NWcfj3kTu7vM2maUY3abHZxWZwEOVg+O0JnpHc8gGJqVcG/lAIHk8lvbBWSfih7P87A+5RvEy56thZg1W4O6xvQcORW5+CrNf80Sipw4RtBiStNUf4WnF+HvA+ZWeoN0j2ASPhBh75n+JbsdlIauMv96gxIaEzduGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B+bal31w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A48g6Wj1583601;
	Tue, 4 Nov 2025 11:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Tmbpmw0leFsTLjRv4pX4d3hLIlitQH8RGV
	A2axkfmw=; b=B+bal31w7FsWuNCbadU35An/zxhsA8tP36P96hmtMWvI+WOzhqD
	IQ9YmqvmDJbNRGa7ja7M3vdFm5iNGxwOUwVmVnGCy7Yu3yVHHWzr+6EO5WB+Axzk
	H6vElWFgfjpB6WFb1WdsaRX9EZHv8xMxaMhBVjuXRSm0l2Y9+y+Nua8z6G+Jmbae
	FW/o4WKt5EgBfr+4cMlUpNHVzkMXHvixt/ZTU0WkkpodEcA52VFarLg5iv3a/mj8
	6BuMbjONgkjEL/sVSxpsIBb/OJgadom0/fjQQmLs3KvuiF//eQlcLraavguu6gok
	bTVY5PAzNtjQIr9U1ZgP2ODULXXcb4QNYJw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjs8jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:25:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4BPd92025224;
	Tue, 4 Nov 2025 11:25:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a5b9mrepj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:25:39 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A4BPdEL025218;
	Tue, 4 Nov 2025 11:25:39 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5A4BPdp1025217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:25:39 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 10269231FA; Tue,  4 Nov 2025 19:25:38 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 0/1] Bluetooth: btusb: add default nvm file
Date: Tue,  4 Nov 2025 19:24:40 +0800
Message-Id: <20251104112441.2667316-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-GUID: t8N4P9DFSmLZbLylEMIm1yt_w1SV6N4m
X-Proofpoint-ORIG-GUID: t8N4P9DFSmLZbLylEMIm1yt_w1SV6N4m
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=6909e2b6 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=NJOSBjy7WMVMZ8b8f7cA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA5NCBTYWx0ZWRfX6bFmFXgIIIpp
 Isx8kaoh8gFjHNP5O2CMf08y2/Oe8mKT41pavxVfnk4axNNxrPiGOxCr2/+kJucC/syFEDNW97W
 OLWT1v4Gqc81REjrrG0h2Rfs1SWSxYRFYualew2r7pxWYynicj29woPSCPTA+QQMK073txp2pPd
 1RgRQQjBvK6ACEkp1ct5Dt9n2Lso7LZ4abnrYl2H6rT1xcqfuXxoMnLZb5UoG199jWNMozd/Ff5
 FG5QJvV2BX+vOIto2DdiIGq3R1YXIlqLf4gJNI37Htm65g1VhNM28NfmUUdnzc2muMYL0br18b/
 4Xy4DIe/UfKpKAhkQGgn93vH2K7UtZz9epw6T3CHe4rwIXplY0Ph1Bbd6fnWtoCDYekoLPO0SO+
 +a9XBicfbq7KQRpMJcvUEWorH7eAcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040094

this patch adds support for default NVM file

Changes v3:
- Remove rery, modify btusb_setup_qca_load_nvm, and add board_id to enable the use of the default NVM file.
- Link to v2
  https://lore.kernel.org/all/20251029022955.827475-2-quic_shuaz@quicinc.com/

Changes v2:
- Add log for failed default nvm file request.
- Added Cc: stable@vger.kernel.org to comply with stable kernel rules.
- Link to v1:
  https://lore.kernel.org/all/20251028120550.2225434-1-quic_shuaz@quicinc.com/

Shuai Zhang (1):
  Bluetooth: btusb: add default nvm file

 drivers/bluetooth/btusb.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

-- 
2.34.1


