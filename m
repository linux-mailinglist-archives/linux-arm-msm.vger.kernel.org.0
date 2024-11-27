Return-Path: <linux-arm-msm+bounces-39241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1A9DA120
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 04:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E759B24647
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 03:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2803A288B5;
	Wed, 27 Nov 2024 03:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mV4eMxIS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCBD2907;
	Wed, 27 Nov 2024 03:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732678230; cv=none; b=FthB71UCapJJybj3Z18lRgDBQfNvNNTeq+w5v20w9jleCbNaE25HdPIlav7UsSHhUlti+yZStVTcDcnjgFD+ZKh8/rSWsKiTgjnl7XTlYf6lHQ44KJBx33IpX31PNxZHEZUnSjzv7MO/a/st2WVayJQfte4WYxc4i60JtuzspsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732678230; c=relaxed/simple;
	bh=kAoUKD6I9Idt9A7gBnC+EIuGZjgnMDBWAWNSrbzJe48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nHg+4ZvBRhqh2WZ0ACYo589I61GH8LZNqRu27y0erSlyDrmmtdMgX876amv76RIVGuTKjKWEoUeCiiJ+Ix8qKc2AvZFOkL5nZZfHb1cen7zNR3P3FZkRJdvRAeeec9o6ibIvrhR3kjmbexhm6bY64nvA5kBwh8hfG0i3TUTgLqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mV4eMxIS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLNpo002279;
	Wed, 27 Nov 2024 03:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H/ZqM4m6sxQEHNM7Z0bOJ7ATOmXavcpjuro
	rZKZnNiE=; b=mV4eMxISw4EKNqMHEoHQg3bXWq7QiyOOeUM/Lq6Tk/YXOKnIesr
	/JkJv5roHwTO0GkYykkhrYervrbaigRyhiRqf7m2mByL2wsTtjLSRIkIW8/FBmH5
	3CxeWTGYrxjyAwXvPsktl7NDPf/2/DvRtjLbx0BQPIO5ydkB35+vPBc20hSHYXaH
	+22cf+Q3cQzMO9vaQg8oQWEXVy1lehenqxA2Zbu2SXlXoica0pybBdiZUhf5AoJW
	nNLQAHfk+gGdpZ2o/sDnq3x7hPoPZZHejLf1Fek7E5fACz1j5574kbG/pJCzfqc1
	iV7/WGf371u5Yaou6QWnxjTbGTPk9SKM2KA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336cft7mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 03:30:25 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR3UMxj015635;
	Wed, 27 Nov 2024 03:30:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 43384kk8nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 03:30:22 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AR3UMqm015630;
	Wed, 27 Nov 2024 03:30:22 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AR3ULrV015629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 03:30:22 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 07F2C18BF; Wed, 27 Nov 2024 11:18:34 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_tingweiz@quicinc.com, quic_zhgao@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH v1] mmc: sdhci-msm: Enable aggressive PM
Date: Wed, 27 Nov 2024 11:17:08 +0800
Message-Id: <20241127031708.2343727-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-GUID: ONVPp5CovT5fwPcWP_OjEzHflgxIIyRJ
X-Proofpoint-ORIG-GUID: ONVPp5CovT5fwPcWP_OjEzHflgxIIyRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=969 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270027

The sdhci-msm driver supports the device in both RUNNING
and IDLE states, when eMMC/SD are not reading or writing,
eMMC/SD are in IDLE state, the power management module
will suspend the device(power off and reduce frequency,
etc.), putting the device into a low-power mode. But the
current sdhci-msm driver cannot put device enter into
low-power mode.

Enable aggressive PM capability to support runtime PM
functionality, allowing the eMMC/SD card to enter
lowe-power mode.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e00208535bd1..e3444d223513 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2627,6 +2627,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	}
 
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
+	msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
 
 	/* Set the timeout value to max possible */
 	host->max_timeout_count = 0xF;
-- 
2.34.1


