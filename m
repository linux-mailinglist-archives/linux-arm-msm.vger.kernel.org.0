Return-Path: <linux-arm-msm+bounces-87069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D388DCEB7FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82735303AEB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 07:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B83231282F;
	Wed, 31 Dec 2025 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmPrJFz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC0931158A;
	Wed, 31 Dec 2025 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767167921; cv=none; b=uZawrst8cDYzIUsZmiL34UKo+J33q6VVsZSIRi6PhA6iRpheHuV4dX6opmLaH3rrXLOt4meZBZ7yxqRVaT6lxHTP7bQJLZEc4KX5HwwZBJOSOh4f2Qho4Wrxdx+HCtRPm6h0ki3oaQFbZjfdX7h8w+S8GwXVGOvoQ2oPSKiiLaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767167921; c=relaxed/simple;
	bh=CVvpF6z0r+yOa4cVP6ihF2+GaNV0HiUxkHipTyvUnCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hrYKR+w4u/ZWUZ079RmlQV+x/ma4hOK9Z7icJ19uvyxBRvbxw4sAjgamEKCvu9ZJNbi41bdd0wSNX3wHxhfX6+6mJ9VVUG+wIRjD3ky9YiHrRapzm+XbyboSo1mdE8BqofzZK7qE+sDoerPMxuvTxjg5Wx+6eeO74z4fRDPevSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmPrJFz/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV4pAR81430889;
	Wed, 31 Dec 2025 07:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bjQomBQ49ENAkWYecE10FPvpLPoFK/fSdhq
	q7xhzk9U=; b=KmPrJFz/Mk5mXRTnUrzzyBPxpJhMOciyZi5rJGqbWUfgf4W+Lra
	jJxPrE6XlDs9aJ5/KPB8UdneAMpdpnZX6XRjCCAb8BBbFVgrGXoMIO+4G0hZFW3X
	TB/pcgLRmKvXB0E5ev+/EQYjZJKLFvaT04NtEXyVPq+XykokWpI2TarQvMTOXH2g
	vAOhSOixuaKpwU9sy0JiC4m5AyEWmkwmKHRiMnDNFamgi3CSO0EfefRLGyx8trHW
	GVUQOmXQMi4bqStZEkPrwFhwMEOpEHiR+rxUBOaE1646XsfGNJRxjYe1Tda/jjqS
	bOZEqMwKc7bdmp/ml92/kYYoT2qBFaBr6gw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcw5e0aam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BV7wTDb023886;
	Wed, 31 Dec 2025 07:58:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ba8hm6q0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:29 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BV7wTHE023867;
	Wed, 31 Dec 2025 07:58:29 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BV7wS55023862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 07:58:29 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 1AB0523490; Wed, 31 Dec 2025 15:58:28 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v5 0/2] Bluetooth: btqca: move WCN7850 WA and add WCN6855 firmware priority selection feature
Date: Wed, 31 Dec 2025 15:58:15 +0800
Message-Id: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA2NyBTYWx0ZWRfX+YcPriRhhHkf
 DVqhZ6AMMVKPJaKea42WREdpUOaQ0PVXulg4wuL47VqN71lBoQ6OFoiAtpRFAowSrcILNLpKJ8p
 uuzomLvfC536obbSLhKVlTu37a7oXCLGq4jYON8hWcZQUK/MpR1TwkDrWPO9INUfkK2FpSo4pPR
 rSfAQk5uH0Kg32EniXAr0oPErsCaKpECA2R63FPQX+Z8DvfFz1j3cDkZPCBlR6/se3eM4Y+ZA7s
 nBxrkpjPvEoa/wrJkdmYyy3c7+3By7DM7HTORgUwiri4T7IRKSdk5VSNYqgTsRtbUhtQgzFJ5JA
 16fp93x9PtGWW+vRHbOmPAfrJk81tiBoTAyV25Pe6QbXcr0Tf5D+kBdmamXs6djWed3Jv8MQM86
 Fk2HoIVTDkdadKFZJMPUZr5eeC0G8WxJvTe1Tjy27fm+dAz9WHmSRjDrAhjnanHN/ERrkf7EpXI
 FFhrcJp+QcvLNArRSXg==
X-Proofpoint-GUID: GRAL127eBHiLDt6YLLdcC0CxPbc1fcCM
X-Proofpoint-ORIG-GUID: GRAL127eBHiLDt6YLLdcC0CxPbc1fcCM
X-Authority-Analysis: v=2.4 cv=Mdxhep/f c=1 sm=1 tr=0 ts=6954d7a7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=3rVLPgN0mCaywZWmVPYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310067

patch1: Move WCN7850 workaround to the caller
patch2: Update WCN6855 firmware to use the new FW file and added a fallback mechanism.

Changes v5
- Separate move WCN7850 and add WCN6855 fw name commit.
- remove WCN7850 unuseless condition.
- Link to v4:
  https://lore.kernel.org/all/20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com/

Changed v4:
- move WCN7850 WA to the caller.
  handle cases where the firmware cannot be found.
- Link to v3
  https://lore.kernel.org/all/20251117021645.712753-1-shuai.zhang@oss.qualcomm.com/

changed v3:
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

Shuai Zhang (2):
  Bluetooth: btqca: move WCN7850 workaround to the caller
  Bluetooth: btqca: Add WCN6855 firmware priority selection feature

 drivers/bluetooth/btqca.c | 66 ++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 25 deletions(-)

-- 
2.34.1


