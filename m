Return-Path: <linux-arm-msm+bounces-42918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C537F9F8C8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E4361684A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0AA1990BA;
	Fri, 20 Dec 2024 06:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oQ7a5feR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C699819F436;
	Fri, 20 Dec 2024 06:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675566; cv=none; b=NGfqB1KHIpVm9zmJ0NILmSnIZxryKN/QolXLF1wrVxU9ziIo2j2oLZe4Z4I89XpSa5m6PmfyCeG08qc/74hXlF42QXyjWUhanJz3PzkPfjieH/zmsxybghdiwg07UKOYzHPQEdxqb1dVBr1o3/gxmB5qDTPbWgQTaJXGWVun8EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675566; c=relaxed/simple;
	bh=B0ypnI9/MIGMB296zfia2QKOpfgiAYmwpdySSAQ/yCc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xh37w1Vm0DjbTaFKFM2TLxmMrgYjIVOERYJd6HbmoMuZ1xdQ4y6XZMdV+VBZxNDBWFDwbgNM9IhA4Iv7xehT+1qtR4WJvz9Zl4sUjXbD4gxE7P4UJ5nszddILjviiLQM8M0rnA0voQf1+od1K68KCObPfyT0adQfVcm9c1cJdhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oQ7a5feR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5jupg012404;
	Fri, 20 Dec 2024 06:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TiaJVVDXXBmo9GKVqpoGQWaR
	v2/hiVCCLa59jbXalwc=; b=oQ7a5feRshrvnZnX16qJm+vhPnu9QxukqV0FZ2gB
	N0X30WNiPmQ/XBACturxh7gD5ZjcrihrIoovtqOy2qKrwH/gp9XJS/GFO3NB7gUz
	TnHnSe3DWr0kDNnZmfyCkqOIbTpWjtT9MOKZ392oEezT5HjHXbpc51acUxXzOcd/
	LI5ws20t2Irj8HQVveI3EGKhRe2Q7jN9e+4c451KzjFyM9bKX8OhHhGmPJ4nUAYH
	w33IMlGT/bqauOFROTDbVURWt1B1sJH7n1ba18wHDHEPR3r41SAtrvYY+/KNd44x
	RHKPFWj/jLebhn60q1PcW95aqf+m5LI2y0Y8HIneiqoGkw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2qgg2c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:19:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK6JHSv018955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:19:17 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 22:19:14 -0800
From: ANANDU KRISHNAN E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 2/2] misc: fastrpc: Add meaningful labels for exit paths
Date: Fri, 20 Dec 2024 11:48:54 +0530
Message-ID: <20241220061854.24428-3-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241220061854.24428-1-quic_anane@quicinc.com>
References: <20241220061854.24428-1-quic_anane@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QyCTCEh5THJXwbsF8QqjRNP1xkBYdwui
X-Proofpoint-GUID: QyCTCEh5THJXwbsF8QqjRNP1xkBYdwui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200051

In fastrpc_rpmsg_probe function, exit path labels are not intuitive.
It does not metion what the goto does or why the goto exists. Rename
goto labels to make it more intuitive and to align with labels of
other functions.

Signed-off-by: ANANDU KRISHNAN E <quic_anane@quicinc.com>
---
 drivers/misc/fastrpc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ff144f0aa337..fe0e40a06b8a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2311,7 +2311,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		rmem = of_reserved_mem_lookup(rmem_node);
 		if (!rmem) {
 			err = -EINVAL;
-			goto fdev_error;
+			goto err_free_data;
 		}
 
 		src_perms = BIT(QCOM_SCM_VMID_HLOS);
@@ -2332,7 +2332,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
 		if (err)
-			goto fdev_error;
+			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
 	case CDSP1_DOMAIN_ID:
@@ -2340,15 +2340,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
 		if (err)
-			goto fdev_error;
+			goto err_free_data;
 
 		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
 		if (err)
-			goto populate_error;
+			goto err_deregister_fdev;
 		break;
 	default:
 		err = -EINVAL;
-		goto fdev_error;
+		goto err_free_data;
 	}
 
 	kref_init(&data->refcount);
@@ -2365,17 +2365,17 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
 	if (err)
-		goto populate_error;
+		goto err_deregister_fdev;
 
 	return 0;
 
-populate_error:
+err_deregister_fdev:
 	if (data->fdevice)
 		misc_deregister(&data->fdevice->miscdev);
 	if (data->secure_fdevice)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
-fdev_error:
+err_free_data:
 	kfree(data);
 	return err;
 }
-- 
2.17.1


