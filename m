Return-Path: <linux-arm-msm+bounces-48057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74401A362F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 17:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C46447A4830
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546F72676FB;
	Fri, 14 Feb 2025 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fGnZ+ia0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0062676DF;
	Fri, 14 Feb 2025 16:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739550096; cv=none; b=GsBTMpIh330zfk9F2wyVH0VKCAvRoYIH1jzgUvJnGkozI73cMe2DOJZa1FieoTe91ictdNUDMLtBX8fAegphODhuVWePbG9wlKaOMfKosjIweOGmchTPHaH74STROVYKseGDXHqiy4PXpvs19pUFo+L9I6YsuLA2ZW+ChL9vgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739550096; c=relaxed/simple;
	bh=QYfIoDbJrIRX9j2H5Pus9J971+iWbQMyEVxZ+TzQtko=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iJmyTmlQS/Bhf1RIDeWJmXRSTuhhRbLmMzmOuDsPKci+/5+ilA6nh0Yqht1wBJ6j70OEtoeVrd6uunaRXaotqKPomApA4hcJkMEFGrJNykcWR/tbo0vWsYKOOBFP/vh7sZlAFm4LdDisl+q/aJOsDTZxUYJ8tIQ3RFqzrtxWrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fGnZ+ia0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EA1V65002177;
	Fri, 14 Feb 2025 16:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NVnm+AUzb+AsgjEH/WbmgG
	A4MAY/gS8zfiTbRA1f2wM=; b=fGnZ+ia02qfcPVHbBkg++vD9Zi7K77fR7BLTUG
	fW10rudP8Ckm8ngjql7P6BjyoSJlZlra/GSkWqYiVFKPwM96k0zDu0TB+jO9MLw7
	6t9SK3Gk0eCnFNedyzIDQ2MxSmHwui6RJjJZflVLydHwJBFguTf94s6AtsdvHfY9
	uQlaFUc1BObi18folgmvUgp8DE0lEpF7IEICWoKka3M5xFp3eh4ynbpvQ7BgQ1JE
	h/XgakERtmGpsmNE0VUpUKDNmqvT/LQO7KjVHODfL5HXImDdrIkGvgd8ZVJfNB7a
	iZlj/gYIDXHd6z1NotjiyLV5fu9qhoVlZL5h1iCsrY2wkR5Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w4dh81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 16:21:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EGLOiG007290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 16:21:24 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 08:21:23 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
        <quic_thanson@quicinc.com>, <dan.carpenter@linaro.org>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <mhi@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
Date: Fri, 14 Feb 2025 09:21:09 -0700
Message-ID: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Otn26q5AMZMaRI2PVtlu4xW01uAzvm2D
X-Proofpoint-ORIG-GUID: Otn26q5AMZMaRI2PVtlu4xW01uAzvm2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140116

If mhi_fw_load_handler() bails out early because the EE is not capable
of loading firmware, we may reference fw_load_type in cleanup which is
uninitialized at this point. The cleanup code checks fw_load_type as a
proxy for knowing if fbc_image was allocated and needs to be freed, but
we can directly test for that. This avoids the possible uninitialized
access and appears to be clearer code.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/host/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index c8e48f621a8c..efa3b6dddf4d 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -608,7 +608,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	return;
 
 error_ready_state:
-	if (fw_load_type == MHI_FW_LOAD_FBC) {
+	if (mhi_cntrl->fbc_image) {
 		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 		mhi_cntrl->fbc_image = NULL;
 	}
-- 
2.34.1


