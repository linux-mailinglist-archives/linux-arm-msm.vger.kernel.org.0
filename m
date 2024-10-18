Return-Path: <linux-arm-msm+bounces-34937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6019A3C95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C9EDB29B20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FFB20101C;
	Fri, 18 Oct 2024 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AZac7GHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A5202F7B;
	Fri, 18 Oct 2024 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249181; cv=none; b=Z745F8vFG393bQkXmvcYAq67SLnWBQMIRKFBHlJjvIr9UdbB9pfXPCQqI9PW366hMSNCj5RB0u+sT0Ltbh5TIkxhj8E39hGYWobT2pa+0X93U7eIMdU6yDN/tjKmv6Bs81O0i1bt4N7KrVh6ApmUpM/SBscXvVi/AllyC0MY+78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249181; c=relaxed/simple;
	bh=ZMpBNiw5IFWbIs+kBZ27ODsoiXYLkkM+3z4SHvgR+0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cy725Y/ADxqwuU3zQ13QMoKzpMwAnXuqlxIhsuV8Us/4BU6SY0UDe0aQ321ZjmlTduletu8lq+b8F32LzVJ6Skb/ix4BcQRU8p136K5b12ocYJmnuDBqc2yxZMXHAfCU7oohq/lRxGbSQQrEPAQtdYIjbzCcXbz06Qh2Arfq6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AZac7GHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I33Xf1007760;
	Fri, 18 Oct 2024 10:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mhCSdLki5ucZFmOT4Be6yQk4SMPL7p3Nk63
	dhKclx1I=; b=AZac7GHZ5qs5m9LskqNb8uMa1EniRbzHMyukY6iEMaGHo+yDkar
	fA13UkXFakBlNgIS267pVeTKkbq0xIl3XqH3QSDBAVGwOy1kbgeKXovm3Xg8g5kY
	gB3eYi+kJZ5bzHj+4W82Y0M/1q2F4evHjMTQv1fFWMy1/YD8LrqZu6alK0BeK1IL
	OP4ElDBDIU/+G4yIaxN0OT63Rm7eb4SIJsxXMO3R/FKpmIsmGiLeZ6LDLm9C1bQz
	mK4iaoD9Mqc0uL1Jg3mDoGMe9p5lvMBvyp4f4nCgUXAiXV0BOOOifACtq/jc2xcg
	r5J8QE2a3luahrUirbKc7W7Geq33s0Bxoww==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc4w1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:59:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IAxR01001938;
	Fri, 18 Oct 2024 10:59:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6mr178-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:59:27 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49IAxQ7Z001933;
	Fri, 18 Oct 2024 10:59:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49IAxQrJ001931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:59:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id B776F509; Fri, 18 Oct 2024 16:29:25 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
        dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        kvalo@kernel.org, Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Date: Fri, 18 Oct 2024 16:29:11 +0530
Message-Id: <20241018105911.165415-1-quic_bpothuno@quicinc.com>
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
X-Proofpoint-GUID: nojQCBI8kMDn8Wbtci0ST9Ocdx1nlO0v
X-Proofpoint-ORIG-GUID: nojQCBI8kMDn8Wbtci0ST9Ocdx1nlO0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180070

Currently, the rproc "atomic_t power" variable is incremented during:
a. WPSS rproc auto boot.
b. AHB power on for ath11k.

During AHB power off (rmmod ath11k_ahb.ko), rproc_shutdown fails
to unload the WPSS firmware because the rproc->power value is '2',
causing the atomic_dec_and_test(&rproc->power) condition to fail.

Consequently, during AHB power on (insmod ath11k_ahb.ko),
QMI_WLANFW_HOST_CAP_REQ_V01 fails due to the host and firmware QMI
states being out of sync.

Fixes: 300ed425dfa9 ("remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS")
Cc: stable@vger.kernel.org
Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
v2: updated commit text.
    added Fixes/cc:stable tags.

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


