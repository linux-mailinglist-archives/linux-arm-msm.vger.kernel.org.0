Return-Path: <linux-arm-msm+bounces-82012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F668C6213D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 03:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3EBBB35F47A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 02:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4602923EA94;
	Mon, 17 Nov 2025 02:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRBtisrl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964CA8F4A;
	Mon, 17 Nov 2025 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763345820; cv=none; b=TcHlY74OsJ6XwaeQS/0cGVGvoC6MBxHBbCbxuZ4NZbIp7nkLrdSSTbb1VHNn0ktuNbylQyt+Ih8cJGcy6qFCK+I0SPkFToEtbYt9/uEmMIJ+ZFZoaPty0neI0U3qKCeuU8UsOxfELhPq4gAqa5YwxCO0EcvNaXZkvCnjLkdOK2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763345820; c=relaxed/simple;
	bh=MMo+jgPtLTswivlBM114wIb2/mXzt7OCx96fJaDfvXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AIlc86bC44n/7c/Gqdt9PLbJ2VjEp3wb0NpFNf1TwuEt+goMAnnJZjmFqaheaSfav+vEqrbjt3inL8/D698exlAyDtNRWi6htuPmuUBH7UTB3TXSk2Ya8Ken9aWRAbNAAaNoehz786jx82zzyIhEVakZbBus2HjsMa5oFZya0ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRBtisrl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGJboOT1717586;
	Mon, 17 Nov 2025 02:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bw3Otc0mIgw69DMPRsfrrwDudVtHSOc1+wf
	6md+QLUA=; b=HRBtisrlV+2kAS7OjV3EZQKJntxfkLkO/Ryrgfgv59xElRRjOD/
	Ma5bPoAJhLmF1DAsSI22rvABT2oM9jBI+4UZP94e2j6xRd1y/gzB6L0+Rpzq+kUQ
	lU6wReFjoT4pXKx5VmRCqk2UYl12V6yrekY1wtr/F6feoUGS0G/x89YMNQaHutiw
	LZ4X9AWLB7tAIgc7CyI6VX4mYQsxAjRFqqoLbSzMy2BhHK26nZ/tukG4r0QBooU9
	tTrYrKjI/JHZdtXYu/bxZtHL8JYMgzkGjFWDnOEz8FM2/4sPJuEGwDkDWHd9lv3b
	tDLsMAFq4I4I2ZjG45CoBnnYQiRmUAJ37kw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejmyu19e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:16:53 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH2EBeE014823;
	Mon, 17 Nov 2025 02:16:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aejkm5jk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:16:51 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AH2GpqM016800;
	Mon, 17 Nov 2025 02:16:51 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AH2GoXN016794
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 02:16:51 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id E925523499; Mon, 17 Nov 2025 10:16:49 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v3 0/1] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Mon, 17 Nov 2025 10:16:44 +0800
Message-Id: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAxNyBTYWx0ZWRfX/DUNk+t6F7t4
 gg4mOlyeEXxCFy6hKVLO5d8y86He78/vXUb4RHJLObKHSFdWEsAA4vLFTX0egLxVCWYqi2r9Qp/
 eH7ywjFR6CwjQid/j3hPm/boveChN8nhqtsWlzFyRIAFLszNuwiLoK2WblWhIn6szVMpnZul1nd
 qOH5gqe3nzphsDIRmXGTEwpkPTMwqk+8iowXscjqfb6UZtRcWdUhmr138lrv7klM/YySQX/0tA7
 h0cNGDlN0KgwU04RaT70T7EgMIXjiDyNeqonb0Lrk4GSpwTVtyI24Ie8NT8RaS0VKadLW64+M03
 5Wt7W/FGFZ01+dnTIjj5rc8kuVnletTAGAAUwW3cKGpFJ/Y1+NsEAO0kvd61rPgBKnp2OeSRRho
 7jP64pxG3J6dYYacgqgYDYrg3rx/ag==
X-Authority-Analysis: v=2.4 cv=BPK+bVQG c=1 sm=1 tr=0 ts=691a8595 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=042h51yfOyDqjzMtcBEA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: oeOqUGVAtTRDC05OTiLDwONnJhwWEHFk
X-Proofpoint-GUID: oeOqUGVAtTRDC05OTiLDwONnJhwWEHFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170017

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


