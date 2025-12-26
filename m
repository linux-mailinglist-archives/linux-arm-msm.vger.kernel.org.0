Return-Path: <linux-arm-msm+bounces-86635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E9CDE76D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 08:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA55300B801
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 07:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125FE313E23;
	Fri, 26 Dec 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eln1ycIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C739313E0C;
	Fri, 26 Dec 2025 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766735792; cv=none; b=fkaKMANDyUEmL4aytWGhdaiBHSukXx68ylhnr8/pUCZrZTqX+VpMdqMDLwbTc7xkd8mqsBO6fJ2xu4NToKkZCkBR3eug41C15J0XA/WbfD3ZuCKbf1OgMuaCWOzqLlFjEnSl/ajRGbF5TQR3zbxS6CGnAnvgqu7H+8HTW9Bxwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766735792; c=relaxed/simple;
	bh=xDlDPWQ0AkFg03vF5mJLiKHKtTnzqgC5g/v4BmWAhDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q45n+fi3CkptaobLOdJtY4ykQ+cRZCmUaRMhX/8Y7NEwoC/E9X1nYTf49YhYtTInFZrfOVdRZSz0e307NsCZPQhqFr29/6IUH6poaD85VhC3KYfvHMwMdshWeIuGGmzNBIgvfyCAgCOBxSpH0YUpE0ZzVWAtLfNiyATLj06LHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eln1ycIK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BPNtXaF3725440;
	Fri, 26 Dec 2025 07:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bLQ/iWGUlTWl49GNr6YVHOF80QyEaU2e05P
	JfwY8s+M=; b=eln1ycIKxHT4jn1S2fe3htC5QuXLB5ETRAVGvzOKYanLg4k9IrJ
	GMxk1B9h45N1k/V734gKao1YTW0vYTCj4cMNWELvhEXu/I6tQ8X+ikNgL0zBpRoT
	5mcvOBksWriIWrqP864EemC4m+dZIFPg3lLnAPwzWVxJbdJNYt65Zk9j/7XDOX/r
	C6rHY7XUA1Z+EwVFtkm4cXyp/BjH9fUJASfYdOQnakBJYCM0x6thxQWrf06V3+J9
	KHpY4nBgyh3VXxhSYU+WKT31/QeFbV8UmXMef6QDaMdvBvQlgTkpXEzzfUqy9gSI
	AxuPwMUnsRyy3x/L6iD/lehY2o6+5bldBzw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8v9f2k88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:56:26 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQ7uOTk019763;
	Fri, 26 Dec 2025 07:56:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b5mvmnycp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:56:24 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BQ7uNPG019756;
	Fri, 26 Dec 2025 07:56:23 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BQ7uNDY019754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:56:23 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 63E2B23A7F; Fri, 26 Dec 2025 15:56:22 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v4 0/1] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Fri, 26 Dec 2025 15:56:20 +0800
Message-Id: <20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: yZPo1cFtQcPlXRAQFd7gOmOW84LqlHRU
X-Proofpoint-ORIG-GUID: yZPo1cFtQcPlXRAQFd7gOmOW84LqlHRU
X-Authority-Analysis: v=2.4 cv=O8U0fR9W c=1 sm=1 tr=0 ts=694e3faa cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=mgfwxQ0KgOKdBDjuZTMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA3MiBTYWx0ZWRfX7ly2djDjymiC
 b0sA7LPJjg/pd4HqDweyMvT6wGMepa25B1mzfw7P1gsXx28xF00CBE+7Fu+3MoQMUyc2DyK3o6t
 w+Ns0jiLHHSbXZghXZOCVwa+MMWWOZPU2ZH31FtRTz1s6GmHOMW4UPDrxR0Ruvdlc6/Ga+pnZXF
 n/jALGFiL7F1wAO/+PLilUDGZEDzw7HdGgFYmFj9LUQ8SYC0//PLFFqb9IHtr+50dEeg6f/SdZd
 K9CAOTalDPJkPURDzeF+XAB98U/ur+RoBAiXNyqjORG4ReHHi24i1hYg0HUsBRyMFmQ19z9i6Eb
 L97qhr638ezZHrn/3duzgS5t5Q623V08OT0Y1fjoxsK7n5de9CQ7ly/8F31txXfvkOoa/mZq9vQ
 dh87YJtPFJs6skMYgtYny6QIkPkrxsg4c0yQbPwAgYDc5tNC+ceWnlQSQyFI1jIW0hoz0mZ8xqY
 g9XRmXxVkEkos72b4VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260072

Update WCN6855 firmware to use the new FW file and added a fallback mechanism.

changed v4:
- Remove the hook function and use the existing mechanism to
  handle cases where the firmware cannot be found.
- Link to v3
  https://lore.kernel.org/all/20251117021645.712753-1-shuai.zhang@oss.qualcomm.com/

changed v2:
- Remove CC satble
- Update commit
- add test steps and log
- Link to v2
  https://lore.kernel.org/all/20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com/

Changes v1:
- Add Fixes tag.
- Add comments in the commit and code to explain the reason for the changes.
- Link to v1
  https://lore.kernel.org/all/20251112074638.1592864-1-quic_shuaz@quicinc.com/

Shuai Zhang (1):
  Bluetooth: btqca: Add WCN6855 firmware priority selection feature

 drivers/bluetooth/btqca.c | 65 ++++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 25 deletions(-)

-- 
2.34.1


