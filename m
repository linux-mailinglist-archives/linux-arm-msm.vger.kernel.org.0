Return-Path: <linux-arm-msm+bounces-52646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFFA732A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D091B17B92F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B160214813;
	Thu, 27 Mar 2025 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbT3GBFn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85667946F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079993; cv=none; b=r7hbVtpgX5JiJ/LK+/vOIKk+HicvUMTnxGdNA4c3kquPp6jPYo2nwL88EyJIXdbXXZkSY+30+WUnZAekkkdCFrIGO/i5FxJHRlYdOSaxLAEufiyJ5sAEX/2ATJV3nwp4qVUdedppf3VpMYXPzCrLf5LjsobTRR73+MnI6quPsXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079993; c=relaxed/simple;
	bh=9EtOz5caTVxdgsDnx5q6HonAsQ8MKzqR2Y605sNsvQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R/f9u/TbYMPTQxrAdi2DZhhPrhnxBiFdfml52Mg30opd1A5DMuErd16veCChqpxW2PvwWBZoRaMx3h7PjOUNxOHdABcLx11hpJhDzX8aCQNRjdyA7HyCMHtv6yE0eKMTWCCbY00jYaVG9L3y6DYxSCETC47fMQeRq+yDFiUwWuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbT3GBFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jK1L011024
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RmXdPQNwlnY89lmzeqzU/0CL6mj1O6uTRJj
	DbIABUoA=; b=fbT3GBFnoOzAPZGYbyKMVcKqkAaKHX+gwH0TP5TBpSKN7dRVrxm
	d34kVO0wmk5zZ63N3HNBXRVtKPs8nZQ6EdJpJhs3MD7dpOEKL1G36KKdG4mMo+TK
	QgZiBaCHqudD9Xb0E5PCtbb6x1cghs9dZ2IvfY6xblAU1qpG7FjuychqQfT8xfQJ
	6/OdM2jqipQVmYQ37/BnVReHADti/iXVar6XHhPbKhBuS5k9JbBtZRdeAlKEwl/b
	htMgGOrAT+fGZd4T3+mqcaE1plPCL0C51qBBvLmfNvzcULKdR4SQFTBOpvzHwnMu
	hK77S2AZPlA0lhkM58MSkwCFS0K9sFpGgsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqh5mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:53:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224364f2492so17846785ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 05:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079991; x=1743684791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmXdPQNwlnY89lmzeqzU/0CL6mj1O6uTRJjDbIABUoA=;
        b=SOz5+AJC6QK9uFc0N6jqQsVvhK3prH8IZWEQO6IRQyYU4Il3bZ3UXWvtKpaCwyhAwp
         Xdj+eSM3tRs9j3vUhb4Q3/ESBzYwmZWu6SfwfDz6AFxV+NexAnZ4IKSQzhRSM9qHchKH
         gYX/EnHCELJxzPYfPmLFH2TnYDS5KE17lVRDKsaRzOMnG3ulDOL9bKh+aGKx6qP5tpHm
         Hz7L/MnI2Vpu9WI+Pnv/RphrImz082IGfPy+AsWm7+YKpP2fzZjhW6ZXyWDK+eSFRByw
         C4TnRSmC7n2v044tERBVjWY0jHzioSswI5CPUOM2dyaY0wc8nsDvZ7ZGEH+NOVvh45Bi
         fS2g==
X-Forwarded-Encrypted: i=1; AJvYcCXD1njOXwPUSFhZROQSPEkp6Mul1BjiQ1N93nxTerLStI74Fma//kF7iqwQSfX0LLIDEJMDkX4io/WBbNk2@vger.kernel.org
X-Gm-Message-State: AOJu0YzkE/deRKQEvtXLwG1KsnfH5GCBO7U1iHxr3jCY6ktDZ72SL2n6
	FoifMDn9tTxoAeiooNQPxy2xe7gqbabYl6Z4lpQZTAWZnRR4W2N4SDMZ9MPROZhQluvaRkp/NLF
	BaoSI+ILMwtMeknaPcs/voEElmam1qApfWR6iFCW/FuL8urRQpjpwgt3HI68FKr+R
X-Gm-Gg: ASbGncvgE4xYLfVTO22B8Dhmool/N9bb2AhmxJlmCfdFscwdR6lG4Yi599ubFsMfqTD
	SbwDNrgDB/UGQEN9rQu7wDbXwP/YoA13XMklS/AVIKOanvdaYCn+wLFBmlXyml5jfCj2TPuSMqK
	VcoDk4fgsFVHzZpnHD45Bk02wpry+gDlmymARS4bdL8H29RZPlGXHJTSDHtt1pqZyr9gaCoCymn
	CdIOmD8+BOYDkfs/ejL0MfVfF/z/kRf2HKmLpLsPm2tZKwFjWrg39izD+ympXCLgu33DVuD5DF2
	5wZ2LbVBA8ihRn9t3YYw0NZxCtE4Gv1kJrgLd4ESjVJjXHo43RU=
X-Received: by 2002:a17:902:c951:b0:229:1619:ab58 with SMTP id d9443c01a7336-2291628f28bmr20716565ad.43.1743079990657;
        Thu, 27 Mar 2025 05:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzVymH3GRqRHqqQV+fxPEG4HA9j7ZymE7eJ5MzwjhA3P8fnFxCELAO8MhFXETiRhTnij1RSg==
X-Received: by 2002:a17:902:c951:b0:229:1619:ab58 with SMTP id d9443c01a7336-2291628f28bmr20716165ad.43.1743079990117;
        Thu, 27 Mar 2025 05:53:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:7062:5f5a:bf69:400d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45879sm127458025ad.65.2025.03.27.05.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:53:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: venus: Fix probe error handling
Date: Thu, 27 Mar 2025 13:53:04 +0100
Message-Id: <20250327125304.1090805-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oSNjla1AXj1sn9cglzIYk53zUH_1ZPfd
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e54a37 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=TreJGfwvmoV3RPO-XusA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: oSNjla1AXj1sn9cglzIYk53zUH_1ZPfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1011 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270089

Video device registering has been moved earlier in the probe function,
but the new order has not been propagated to error handling. This means
we can end with unreleased resources on error (e.g dangling video device
on missing firmware probe aborting).

Fixes: 08b1cf474b7f7 ("media: venus: core, venc, vdec: Fix probe dependency error")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index c4438e4b2d9b..103afda799ed 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -438,7 +438,7 @@ static int venus_probe(struct platform_device *pdev)
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		goto err_core_deinit;
+		goto err_hfi_destroy;
 
 	platform_set_drvdata(pdev, core);
 
@@ -476,24 +476,24 @@ static int venus_probe(struct platform_device *pdev)
 
 	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
 	if (ret)
-		goto err_venus_shutdown;
+		goto err_core_deinit;
 
 	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
 	if (ret)
-		goto err_venus_shutdown;
+		goto err_core_deinit;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
-		goto err_dev_unregister;
+		goto err_core_deinit;
 	}
 
 	venus_dbgfs_init(core);
 
 	return 0;
 
-err_dev_unregister:
-	v4l2_device_unregister(&core->v4l2_dev);
+err_core_deinit:
+	hfi_core_deinit(core, false);
 err_venus_shutdown:
 	venus_shutdown(core);
 err_firmware_deinit:
@@ -506,9 +506,9 @@ static int venus_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
+	v4l2_device_unregister(&core->v4l2_dev);
+err_hfi_destroy:
 	hfi_destroy(core);
-err_core_deinit:
-	hfi_core_deinit(core, false);
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(core);
-- 
2.34.1


