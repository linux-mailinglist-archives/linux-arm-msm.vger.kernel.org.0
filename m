Return-Path: <linux-arm-msm+bounces-74786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E725AB9CB5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8342C17A1B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBE82BEFF3;
	Wed, 24 Sep 2025 23:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6F5zZiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9B286418
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757609; cv=none; b=bETENUXHqfV+CG9iAYRSO/roh7Ii8ngTAu9RjuInJfYHRQDXj0OxpfZ4ynO88il5yUOK+5oimiR2a+bocjUl2xnxqvnBI3mOTLUAJXl/JCm+t3reglB8gUPCz56x67KDUJWUEn/KgZi7SR8trMvOv8SMBmbJAoNV28+TwEn3qc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757609; c=relaxed/simple;
	bh=lMi6BW9EoNcBf/bnUbCRXu9uKYzn+3W1WkDNAjJlCn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCfVVXsnDbPT82faAR6dy5gWKGcuvIorz/k5dyTk66CQJ/2kdXyzwi6B/VV4fJD7t3/k8096+4AaogFtl/GbEQufGQcljsyAOBGto5n4LTwS2Rl+hQMrojkPNAwXObxercOVT7PfiBpz4nUhsXKXtJUdhrOFvpzU/1ri20gqEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6F5zZiS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODkrem001919
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+QcUnwPoU8KIc/SQDuBGNhNOG1Bw7UbC8jOgEUWCMo=; b=N6F5zZiSIkqJzRWt
	A/LaRsykqpstVZ3XsPrMX08CDVxWYvkcjnguA0vWFJrDRkyQE48m13UT13mz72o2
	HYCH9bt+SZDcPGiInpjRNY8M3JqmNqhJo+zi+FsmTpvG2GAxGvt95YidwrBRBJ+A
	o+fgVxmIYwinETNk9aeNG0CU4xpBsjfnz+PBrSctMzcNJE2s+LubSZNigpQ5nA+5
	cBQWakdfRK6IeC5SyCWj1IY7s0uTF9cEOINHqGaoFUJJB5xWYYcquojlfWtoPe+P
	IYC3vrF0QNjnnQpRQf+RkYIMbuZdfWAND8cy85aDO+7Rc1zZBIwOrcmU/XMZ0hHI
	Fnq91A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p3c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso6461745ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757605; x=1759362405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+QcUnwPoU8KIc/SQDuBGNhNOG1Bw7UbC8jOgEUWCMo=;
        b=PVdcP6KkaU4J7dIsakdkCXKYrlVLKaUj2EhF41DzyJ/ogEcwbgfku+rhzmoIln+/yn
         tsBtuGpM1YdO64lxUneY1ckewZdB0zNZKYDcjfEb85RhvvrTrfu/cEqJTkNlex7n9M1c
         sjPOfEmJtbiubG/1+FfpdFCSX2oUR0zUhJQb6yGSJzTJtpahNO9NjrrxTSUvNxDqDK0k
         IKbbSorOV1vPreXPE+pEdkUK6edZhij3+9okVXkhMIWl3vQrto5+V4oNXbXVDnvwF9Wv
         O3FoJVRskO//GWC/2Z+PhvO2Wyb5NSo6GNFU15/WJph6hcy2lxSI3yhICsUO5PQNWXRE
         xuvw==
X-Forwarded-Encrypted: i=1; AJvYcCX8IuI6A5w3WPpQbYlMHEcdyhM9HaHWfcpVjBpTObHbMuwxyLADZxiqX4bLfeZqjb9bju192j6D8lVhSE9G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3hUKWQuc34vyo9OzjYbTsRxmy9UAs9ob7JiD0SJ5MAyNdAn+Y
	fTgD8BV03+zAEhe4xXN3CmGxOdLIrnG8JA31m5IWOZtMmSN/Qk1/OUMJ3TB2bZpxmV6vXOEGh+I
	dS5VE0QLtpukBnzo9jCF6CsPjlfMNIZIM3+LAL7qxHKJ/fgeGR3Lej3RZNAZYvunpvX+V
X-Gm-Gg: ASbGncvVn2rbKiO/OZOyuB8Xa00f1GSMvDzlDWKtDLszFL7qFiZp9m50Grml36UYknH
	d+vCmedvO2nnNKiF2raszVW6jnwPkHVge9c4qhFjGIlRfVTG9FBY6bSNkky3QC8BeWxV27f+PmB
	dyi5HaVlt3ynNqCB354zotKhwEQ9VQBqnm59OHfzFgI6bwO6mihN4SZDLMaePldLojjvXxBbOm9
	/G2/njdGyvMvUUL1C/9Z6gkdhEIkExWvg1YRWi2o4GOvKGJV1DAyS7wYfFhQT7RJupO8F0kRQn1
	0WfEIcattxHqioNVOTj1buIB5oQPyuGkzaNBv5et1TXWqSl83jmJQ1TcbG3Mc5eoi2xhXdHkzDy
	e8nD7nEthFgHzeQs=
X-Received: by 2002:a17:903:2b0c:b0:275:6baa:d9 with SMTP id d9443c01a7336-27ed4a56b08mr14021395ad.40.1758757605300;
        Wed, 24 Sep 2025 16:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsZkCilV3B1P9UXHL4Cpdv9AoCXLxr71gZLjA1+Y/7WWXoQtNBIflcG5OnRE5Cpm3vDOfvAg==
X-Received: by 2002:a17:903:2b0c:b0:275:6baa:d9 with SMTP id d9443c01a7336-27ed4a56b08mr14021195ad.40.1758757604846;
        Wed, 24 Sep 2025 16:46:44 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69959e1sm4318405ad.103.2025.09.24.16.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:46:44 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:46:37 -0700
Subject: [PATCH 2/2] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-fastrpc-v1-2-4b40f8bfce1d@oss.qualcomm.com>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
In-Reply-To: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757601; l=3165;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eD8yAx/YuKqA7+Hjy0aKSPReaieqfN7YL0zc+4CHM6c=;
 b=/zkxGlXtFzMJUQCd4c/1ySUM3PnK4HaXPCbz5JL74xjuvqJyZ9b1hM66HPlL8U0UGPZM0ezj7
 sofz7Cx6pHwBOjEujFDJaS7Pr1KskcN0mvAxmFk9s//g0LjiHrtrW5W
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: nejUzuRS-Eoys7QSrmr2cVsrZf5q46HT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX1Otx40FNXwfb
 7nzabavG7wfUp7yFvOLuY79T0A6vslLMjxFgslpMpZOLfnc8PYjapMLgIWmyGtkaz8+cqqVwNBw
 RGPrzTM3vdfw9/d50zgUc1omidv96MTL5b9GBULtJjIW+tfDnEgJ/mOmioegU/XUzAAzJgT3tMZ
 EEnLrZYcraqMZL8cGKm72cv3WrdCPzLhKsvimebodD9vcnR0ShN7fqz5zQ54llmzCZgKcMwD3Hm
 DPmt7fySddOeD0Y6SfNxVTJgvjBoZccnIIVT7vKMCDimNWGVkssMogEaUWiw8Fvyexo+6mpmrgw
 aUepFdRtH1rAwNa43FoJciAtiGVJypAVf6+Dyyqyju56hgLnP1VgQm9QpULBHrWEI7BxSaDSGk7
 YTGcoBd6
X-Proofpoint-ORIG-GUID: nejUzuRS-Eoys7QSrmr2cVsrZf5q46HT
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d482e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=v5czcFVHhVNKnq2DKJgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>

DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access. This is being upgraded to
34-bit PA + 4-bit SID due to a hardware revision in CDSP for
Kaanapali SoC, which expands the DMA addressable range.
Update DMA mask configuration in the driver to support CDSP on
Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
it to 34-bit based on CDSP and SoC-specific compatible string.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index db396241b8ce..e019163eb265 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -275,6 +275,7 @@ struct fastrpc_session_ctx {
 	bool used;
 	bool valid;
 	u32 sid_pos;
+	u32 pa_bits;
 };
 
 struct fastrpc_channel_ctx {
@@ -2179,9 +2180,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
+	sess->pa_bits = cctx->dma_mask;
 	/* Configure where sid will be prepended to pa */
-	sess->sid_pos =
-		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);
+	sess->sid_pos = (cctx->iova_format ? SID_POS_IN_IOVA : sess->pa_bits);
 
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
@@ -2198,9 +2199,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 		}
 	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
-	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
+	rc = dma_set_mask(dev, DMA_BIT_MASK(sess->pa_bits));
 	if (rc) {
-		dev_err(dev, "32-bit DMA enable failed\n");
+		dev_err(dev, "%u-bit DMA enable failed\n", sess->pa_bits);
 		return rc;
 	}
 
@@ -2287,10 +2288,12 @@ static int fastrpc_get_domain_id(const char *domain)
 
 struct fastrpc_soc_data {
 	u32 dsp_iova_format;
+	u32 cdsp_dma_mask;
 };
 
 static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.dsp_iova_format = 1,
+	.cdsp_dma_mask = 34,
 };
 
 static const struct of_device_id qcom_soc_match_table[] = {
@@ -2310,6 +2313,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	const struct of_device_id *match;
 	const struct fastrpc_soc_data *soc_data = NULL;
 	u32 iova_format = 0;
+	u32 ubs = DSP_DEFAULT_BUS_WIDTH;
 
 	root = of_find_node_by_path("/");
 	if (!root)
@@ -2322,6 +2326,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	} else {
 		soc_data = match->data;
 		iova_format = soc_data->dsp_iova_format;
+		ubs = soc_data->cdsp_dma_mask;
 	}
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
@@ -2404,6 +2409,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 	/* determine where sid needs to be prepended to pa based on iova_format */
 	data->iova_format = iova_format;
+	data->dma_mask = (domain_id == CDSP_DOMAIN_ID ? ubs : DSP_DEFAULT_BUS_WIDTH);
 	kref_init(&data->refcount);
 
 	dev_set_drvdata(&rpdev->dev, data);

-- 
2.25.1


