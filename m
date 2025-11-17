Return-Path: <linux-arm-msm+bounces-82010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DCFC6211E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 03:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 405F335EEA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 02:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28FD24466C;
	Mon, 17 Nov 2025 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3ulAuqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DFA2459FD;
	Mon, 17 Nov 2025 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763345705; cv=none; b=EHm3xPM+U5cPZ3NhOsh0ko9tCRH+u0jRTueTQEc7kIpKS2iZ5bKfizugJwJyyVUT+TGbmhsw/2GlYDwFMgHYrMAbl+kjBcYiOksIJOcTNp6xBnN89RH51pczV/JQ4rcL2dDnpAboIvl7i37tzXGUABarr2wMZOxw9bLrvHz6WeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763345705; c=relaxed/simple;
	bh=MMo+jgPtLTswivlBM114wIb2/mXzt7OCx96fJaDfvXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UISWskA4oiomc41eoV4Rz4X1v1vgdtL6U5QBan+aua0HLpdmcm23ZP11c+1t3WwYL3wglZRTJpmVtjf/KK4p4HYn444UFoWXfi0ZdbJXND+GFUDqU5ADvbkPESalyOfhkJ8C6Fjf7SyAaVy6MIeF2Joo9m4ZC+Q8EUOtel6UPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3ulAuqj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGLWWOO1956132;
	Mon, 17 Nov 2025 02:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bw3Otc0mIgw69DMPRsfrrwDudVtHSOc1+wf
	6md+QLUA=; b=b3ulAuqj5wUniYH+b+s+3NmbNil7rz2Eb21IpeZ3wUB5dLdiDTH
	ASFJRFQst+Jw6PXXI6zOEsGpG1X46K3lSy8o6z6NRFPN48+XaJFnC4IK8YzxGjhZ
	teXuu3NNQtRcb1CIMSGYPEF7oIHg4CcAudtZru/KhfD5zHpoemv8FugDacn1GT50
	ru2GMjnthqIy398qeW+z+JU2j8yVveYUexcQyYB/hMZdW3eI9JvcQV9YrfT/fSDp
	pjZ0radn2MlQizqgeUpN1Y97tSGhJMroKkUb7nzHnXIFTRfTh8XdA86ZzPKv2+oU
	sbmXiVUDT/k3edylRMgIAd4+SH0HyIfdU8Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0b15u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:14:59 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH2EueX026316;
	Mon, 17 Nov 2025 02:14:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4aejkkwn4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:14:56 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AH2Eu47026306;
	Mon, 17 Nov 2025 02:14:56 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AH2EtaL026303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:14:56 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 0EFAF23963; Mon, 17 Nov 2025 10:14:55 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH v3 0/1] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Mon, 17 Nov 2025 10:14:28 +0800
Message-Id: <20251117021429.711611-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jRStRLa9gcgi4iPcQ0VAmGZJQYHPpx7H
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=691a8523 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=042h51yfOyDqjzMtcBEA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: jRStRLa9gcgi4iPcQ0VAmGZJQYHPpx7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAxNiBTYWx0ZWRfX0q1XysM3tHpx
 zdrmc7LYHM4mKGIa5m0UVe/iQaXRNbkzBGio45myMVarkTtLDyGisCqyltHa3Muyh5v7TQtLBt+
 DzHWCj7RvIaQYTkGSF0IZ6BMc7LED2auFZWLZB4AIoiTD6+QQpNC4zgZBsKzGGe3d/RW0Unr/oi
 KOc2Gc77EVl/sTpQVMeyfBoEIzDyy84tZm5Dbm/1xaZVUrJY0QU1Knk2kAZ9MenqLrOE4tJyLoq
 xC+pp9BwhE832JjN/FfqeOm9xxUX47SwLhfUmrzFleGQDUB9ewdLO5/gR3RkhRzxYLASZkFVLLL
 UjKzF8sl4BVxDle8HWcHF1/z/dCapy/+/hdCS7zlW9AdfsHN8Eq+9PUVESmY0YtMSCK4iKs5fBn
 Wdm0FE2JlSwJ6phB9nRkGIfWPC3lVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170016

Update WCN6855 firmware to use the new FW file and added a fallback mechanism.

changed v2:
- Remove CC satble
- Update commit
- add test steps and log
- Link to v2
  https://lore.kernel.org/all/20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com/

Changes v2:
- Add Fixes tag.
- Add comments in the commit and code to explain the reason for the changes.
- Link to v1
  https://lore.kernel.org/all/20251112074638.1592864-1-quic_shuaz@quicinc.com/

Shuai Zhang (1):
  Bluetooth: btqca: Add WCN6855 firmware priority selection feature

 drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1


