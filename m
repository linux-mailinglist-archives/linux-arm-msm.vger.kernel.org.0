Return-Path: <linux-arm-msm+bounces-56605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CADAA7DC4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 02:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E6C74A6166
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D8412B71;
	Sat,  3 May 2025 00:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fys8bcl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03465E56A
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 00:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746232910; cv=none; b=QkDUWkeXUmbI64R1Rt+QvMCiC3duyRO6Hjm5F1aPsIvSv8SYCo9hk/2vNeVfwSTSTYKnKw4U2mPACURvLOho8jCMcaIB+iz5f7CDSKHPZ1x+4BOOYpNmqHWj2Qri70dYVGW+LUbX8pgvDInhLDBFnstWZdBpqoebxfgFzcYIXPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746232910; c=relaxed/simple;
	bh=cZKzoyqoY7N34pp0epge8nAGtWJ5Lp3SZJtzdzdjcvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ug3llAgckIqEvSU4iGbKFlt0+FSDkLfCiMUP2OSowRCLTWNQDUdaQrmhCkQnFMYPY77zkhOaQpW39pidaMicL4fGc5nZGgTv6tN8PqLg69SJRlKmUJ0XQojMiq6H82naxHdLKO/ag70IMSrqatD5BbEXooG/FeYJO9ZGN3IYtn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fys8bcl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5430HR2I013342
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 00:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zexFTSyGgt2dJ/AMnsrfN4
	8UoyxFFEE4fgdHUg7YobU=; b=fys8bcl8fIp7KA+O32PyHq2JtGU14cxmMYZ4xN
	YKioSBrgdxbkQS9OH7EhMFKqUbnAuVtTJb1g/bGEz2H2BAuZZrOtzEMWgWWBPvnU
	u390xYhDuDoSSehlA2vMU99ug+BkepMxnm6uJ4jAA/O3IdE4sOqSAgaBUIa1ITKU
	FJL6o3G9yhaiip9Jd/si+Fombe2uFeIveAttv0/UEdVzyDLVFWh0rtpQ1aCnGqfv
	TdyUhogRaT1piuZLoFcARg04EjuJZdphOl29pb55E8KEm6iuf8NskGGg6Lnqjtaj
	u1imG9EGGSGEF6x9/zYXm0lPhIhHYoZWv8jx1a1o6A56anbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua1k9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:41:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47689968650so29067001cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 17:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746232907; x=1746837707;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zexFTSyGgt2dJ/AMnsrfN48UoyxFFEE4fgdHUg7YobU=;
        b=PVYY6pvVYarViPq4sfeXwLwdBfljOy+B+ztZxuDGmcr0/b+aPdrapNJxjMlxPjt89i
         pXgWVeeOJ/V3gONcq1x7tFKqw47gtsy/BjIGVI4ryFVmyYXXQWC2pL9904KOIauJhSkC
         VSBxbl/FJwyxcK+CS7FP1aSurPQ99zgv+WXn3VufDGo9JL7v7cLWkxDRCb2LHqWQdaoL
         A1luqKugYhSSdOnBD4b6OVDGGHuzl6PA2q9xjLOOxWBd/k1LKkBnRfIRlzjJcvgnLxhk
         NsrouLuCkkPoQ1vBLAHymPqMgFqeM5vb9Nz+xHJwTT2320qA7XfNpT29GD103k7euw6i
         9eWQ==
X-Gm-Message-State: AOJu0Yzx5hPcjZfSiGrTh8ughEWvXfUnR2Bf3bQ51ZcJdSaTIOTSisJZ
	DQKrLZfmY0oWRMedRNRIpEtnsDl9HmO+PhiapUd9/4MbNvmwVQt0EEFU40fYs1L4kajK51ft+WQ
	b+fG3Q9HBnPEHLH4A2VjOOv0wutVfqalx/qT14DMpOWCueQndsmA+Nrz7KAbtNlVT
X-Gm-Gg: ASbGnctbsFJOOfNcV5YNzS1SejbtWYJYIvjAuP3WCrnC6zMlKkLgYdxcScX8bAlWEdn
	h6ijDXfXPxK04pNSifZNCJo3uyGEPtVEGT2YqrVBw7tGpEECOytmeQuPHUWStswbDvDPcxbEgJT
	tsoqh2/N4mJg2UmKFxZba5HxpJXka6YbNGvfNa3+u5+uhjHKMf64NL72AfPij4CoXrXzdi/idFT
	xeOU+QcEEHyghzqEB51woUZSvUbyaX8kXZLRc5NtQZGdnY4bxxVuEIFuqmdd9kx9R7Kp9wtJ0k1
	/2WnCwffVG2fD6xNU5hUBND0Rr9OXLEY4+vUPf/eXciQBr0auUzEY7c6D7jBQSQoK6twLORQwRP
	BN+UVaBgUyWASPlKvXkjHOoNZ
X-Received: by 2002:a05:622a:4d8b:b0:476:90ea:8ee4 with SMTP id d75a77b69052e-48c32bc28f6mr90866491cf.32.1746232906739;
        Fri, 02 May 2025 17:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7ecc30BJA+9Dx4O2PmVKjj7HnCIZKZlWFDy70IW+m8VjDZnT+As04kBFqepzl7sWmZNnhPg==
X-Received: by 2002:a05:622a:4d8b:b0:476:90ea:8ee4 with SMTP id d75a77b69052e-48c32bc28f6mr90866191cf.32.1746232906399;
        Fri, 02 May 2025 17:41:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6b0asm551924e87.249.2025.05.02.17.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:41:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 03:41:43 +0300
Subject: [PATCH] dmaengine: qcom: bam_dma: keep remotely controlled units
 on during boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-bam-dma-reset-v1-1-266b6cecb844@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEZmFWgC/x3MQQqAIBBA0avIrBtQQ4OuEi1Mp5qFFhoRSHdPW
 r7F/xUKZaYCo6iQ6ebCR2pQnQC/u7QRcmgGLbWRRva4uIghOsxU6EI1WBt0UNqTh9acmVZ+/t8
 0v+8HG4v6oF8AAAA=
X-Change-ID: 20250503-bam-dma-reset-1766d2d12cec
To: Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cZKzoyqoY7N34pp0epge8nAGtWJ5Lp3SZJtzdzdjcvU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFWZHNxF/NqZ/oMAwyOsaLbJ64y6qBo00AnWJe
 ngMwguH6VuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBVmRwAKCRCLPIo+Aiko
 1ba5CACYaPErHkCfSuXCLhGYyXn2t3IdJzsUI05QV2QihSTAiEucd3//V/nGS1yyrJXRKXFdiAk
 Hh5ACwYoqHvwCceszI3Q/n4xM9YGlX7MLYHQ07rHJwD68Yr5t9MA75A5m2V4Y98PCqIq/E8Op4J
 fOn27jHuCvbqd2btAgcqGbHNhxCoSNdAG6r2ufdrNGGgdH0F3iRWDjB5DTByhKtOXcS3v3lAOZl
 7nWgSBSaZfA3nwJf8kSnfRPATOGP0HKV+Zy8pT8oMYUmwHzJbBL7H/35cSZR0j/bNjMgTb7wDdL
 bNnfZ7ZF9kmiTmWBr0HHZEL8Z3Wd3AmSuYehz6EbKl4E3rN0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HfMIcPmXNPj3yHLpoUKejpCl_L62vwWr
X-Proofpoint-ORIG-GUID: HfMIcPmXNPj3yHLpoUKejpCl_L62vwWr
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6815664b cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KvPR1SqjJM-xazvS2iAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAwMSBTYWx0ZWRfX/AqQ/TvHga9S t41hMgWRYaNkGZpGwouqPSrpm2DpKwn/wa2X9qSeXjOc2/ndXbWfqJocH9Pgbr6PaRZdcmzCN2h vmo3Eyf+dtQpfCYFD3emC4UpxA60WGcvL6/YTAW5BCXhN3eo27Do6V2GYImTcl/5TlT9dblXtRr
 C7WzBdg+wCBnzQLvwFddO/qldZ/2Ze0m2DhVmKtt7+CsHJ6mEVEtaAaADwUwKHyJPt5nRKlW6v9 UxwzwUdmbhZTZbh6tg0Y+GIDgCJ22S3dAeUZJs7f7xuzUnfS+xkMyP0ChhWMbVAryoehX/ZCvn3 wBgCPu5gpBgNXvbmQ8jFYJr8K6idCoLb1zIShce2jaueLwEfKuDPG7YxWP/Hysc/Ivn6kL9U3QH
 LQ8e4LOqUauzoINDjVwUkRwBonzfuq9nUBk9vyf9k0Pl2kMSf2I+x80Ev4ebiFgyOxbSiwx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030001

The commit 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM
underflow") made sure the BAM DMA device gets suspended, disabling the
bam_clk. However for remotely controlled BAM DMA devices the clock might
be disabled prematurely (e.g. in case of the earlycon this frequently
happens before UART driver is able to probe), which causes device reset.

Use sync_state callback to ensure that bam_clk stays on until all users
are probed (and are able to vote upon corresponding clocks).

Fixes: 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM underflow")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bbc3276992bb012a1b79937bdbd069fc01f75331..09ef450a9fb8e3efe6e664eb17caffb0bd337f84 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1367,6 +1367,9 @@ static int bam_dma_probe(struct platform_device *pdev)
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
+	if (bdev->controlled_remotely || bdev->powered_remotely)
+		pm_runtime_get_sync(&pdev->dev);
+
 	return 0;
 
 err_unregister_dma:
@@ -1414,6 +1417,16 @@ static void bam_dma_remove(struct platform_device *pdev)
 	clk_disable_unprepare(bdev->bamclk);
 }
 
+static void bam_dma_sync_state(struct device *dev)
+{
+	struct bam_device *bdev = dev_get_drvdata(dev);
+
+	if (bdev->controlled_remotely || bdev->powered_remotely) {
+		pm_runtime_mark_last_busy(bdev->dev);
+		pm_runtime_put_autosuspend(bdev->dev);
+	}
+}
+
 static int __maybe_unused bam_dma_runtime_suspend(struct device *dev)
 {
 	struct bam_device *bdev = dev_get_drvdata(dev);
@@ -1474,6 +1487,7 @@ static struct platform_driver bam_dma_driver = {
 		.name = "bam-dma-engine",
 		.pm = &bam_dma_pm_ops,
 		.of_match_table = bam_of_match,
+		.sync_state = bam_dma_sync_state,
 	},
 };
 

---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250503-bam-dma-reset-1766d2d12cec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


