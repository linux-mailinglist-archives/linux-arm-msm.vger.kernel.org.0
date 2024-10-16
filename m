Return-Path: <linux-arm-msm+bounces-34592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EAA9A0BFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9422D1C22097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 13:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E126E209F29;
	Wed, 16 Oct 2024 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZNz30qwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A024207206;
	Wed, 16 Oct 2024 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086899; cv=none; b=rfVKhN20UM0FAA4sG9YKlB3Z+be/B5uDpehT553k1OzeT/qN+Gj+/rnxcB0hPmdDr7+Jp1BKZo65ji0zZvz1lPLGYhGsXXIEA7OH33e75h2hx20elBGCb9hPTW5BMZkE+EXrBdSw7BwSID307yaHzvRax42jGo20ueKc4OoyNsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086899; c=relaxed/simple;
	bh=fSUlvJD3BmavIiJtNWJGx1iFShCI1qod/q1MxnZ229o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UxBQRjVobempn6A0tvVWTmrodEi2ig4rZf+a2wFoH8Hz6+h96NmDvV24DXIs4hEiquAC3yhxh6/2+P/9UJbIc+oat4QQOMiZGrPdsxz9CQncAc4773O0B7inrHdRqXt0p7b9pmKMuE3twv6asi16tfzP+RtnXtZXRaBHciifGF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZNz30qwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Q88m026699;
	Wed, 16 Oct 2024 13:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3PlT2PvVcsTyb0hBqZtBOw6xm3CoyCRYJqy
	bxaeJp9o=; b=ZNz30qwTMP6iidvOVN/UrCwPaomfV2zNgz4+EZNh2tGuBPmytYE
	u3eq3ZWIlZT/X/neJDIqcBhxwxD20co8/bRPtDscx43LwE/LznEQmAGuLuSHLuyp
	8WFa64HgZ67qsbziQWAs6eVqL/Go048ZsxDAYBBhpVGjP3RlrN+43oCd4R9bJ6JD
	n/UuiPYAeoilZbWrq7IxF3z+iFpuCx+/mWxb9dtFVi63KjxtPGWaTT0639XdMSCc
	J6IdyJUFV1z8Mu0FZ1NZCh0pYjQ35p7neWvK07amgWRuWtbvGmu7ngjpot0osKUE
	nuvuuuMRx8IJI6fzyk3G7Ik/8CZmmUIXc4g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6hb8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 13:54:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49GDskmF004651;
	Wed, 16 Oct 2024 13:54:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6m6fag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 13:54:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49GDskcq004645;
	Wed, 16 Oct 2024 13:54:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49GDsjfN004643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 13:54:46 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id EB40D509; Wed, 16 Oct 2024 19:24:44 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        ath11k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Date: Wed, 16 Oct 2024 19:24:09 +0530
Message-Id: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>
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
X-Proofpoint-GUID: Bit6GI6rfTYYby7TsLjDRI24SYbGOIn-
X-Proofpoint-ORIG-GUID: Bit6GI6rfTYYby7TsLjDRI24SYbGOIn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160086

auto_boot flag ensures to take the firmware and boots it
up during the wpss remoteproc start.
wpss host driver would like to control the load and unload
of the firmware during the load and unload of the driver.
Hence, disable the "auto boot" for wpss.

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
Cc: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..05963d7924df 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1344,7 +1344,7 @@ static const struct adsp_data sc7280_wpss_resource = {
 	.crash_reason_smem = 626,
 	.firmware_name = "wpss.mdt",
 	.pas_id = 6,
-	.auto_boot = true,
+	.auto_boot = false,
 	.proxy_pd_names = (char*[]){
 		"cx",
 		"mx",
-- 
2.34.1


