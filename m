Return-Path: <linux-arm-msm+bounces-85821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8318CCF51E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B4A43007256
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7933090E8;
	Fri, 19 Dec 2025 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T61wVVoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzdTy3d/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B026CE2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138924; cv=none; b=azGvlCY1BJ0HTkZ8X400pfZwPKUbGRddKp5sZR4VVdxQn6nOBbSCfLtsGi3PFYJpmHVE5r8MkUMN6Hh2p1RO0LeXQ1MmGrieWNtut3/I4XBK2OvUO6/d6rtVopx/519wXDFPnD5YUa+mZqFSes8Xiwxu835/SY3pskOrTCuLFhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138924; c=relaxed/simple;
	bh=FnVBtOe0OnnBy34d5WsqwWSUvkeiYQ93/vJc1qwp/2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBxL+c8a9ztIeFt7LpWGDol3JcdsZpjM1vZUv2zaJOgjgZtNQViaDeDnMekxx0ZEyIthcUB+KwN82AOAI5v4r5fknZrQDhnnXuty4dsudzMHVgfavB//OlnwHOBLajvBa+N+FpGOUsLfeCng3PqZ8JcbXOBTfiyBLvLjEIZx25A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T61wVVoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzdTy3d/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c2K9091065
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=T61wVVoEF547vU/m
	/4wzOx1e+sZFk7oSZAq4Et9N6dQJ3zOtTBbDrpTFNSqb3pvrosLMx5bfbPzER6tc
	cw27Um1x+yOFJA/KD3aE4m1vSqbwOrkuWvbiB24iYAqgkYZxnPF2ANDL582qTs7X
	9GmBkDbxLWd58jyGUFnaHKz9NuV539sDf2Ug3q7o8dHHmVXql3ZfcPWcITajD69B
	pQj26GyYXes4PQjVYE0q7F55MrFkJykSRDJkN/Eb5beacNOQfmDE+SfjcfhOShVq
	7TPbMIrFdVND45Z4dIVWrIKyDoquPCH94tNLsx0EKRcanEw2DcgNgkyuf8B8uoR1
	0gmzfw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ea82e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f35dcb9d4fso51517541cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138920; x=1766743720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=BzdTy3d/iO5E8K/yywLH5MYQK2g/aKPBaOyauRLK5I/rH1EP/M72keAB6affn2nQht
         56pt7W4H9Wqfe0C13kPE4bBRuAqrvD+PjzPIVoVZw/3dbmnltvN87rLvmhY73UPefmPr
         t0biJL+wSwF7aAWPRrxOP36vZJ74gSC8OuS8dXWzIVGaN/fEVLu+8STQ6C/89RMubO2o
         2W4UpdHruBbQKbDmwPFTmBJLbdFmrUehMZV53h0mai1PnFvuZxAuwIk1sWMECMvzMHgd
         ACGBjTGxcDHwRo3nLwq6DCemr3hLNZ6sauKsfW24DTqjJMhekbWohp/K3UqCvzNXwaEL
         FM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138920; x=1766743720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=sGq+e7a+JKJAfRg75WlaeV3i6e7kfaUi/8dCAG+m6WB/dCWJj8xI6cJHd5KTv9mnHc
         cBCC/lwNP1L1YCf//aPG6C7KWCwzACv0hpn5RFE6O4MRxApsR3Oo8+J1TvmYkZW+yoLP
         7aVkreRyGKPBaUbk4H9Ivl2Xz1keME7xhTADkfRrdAUOB3NxRgqeRerdotiS0EqdiKco
         29sL6EgahVgkciLojbsmswuL5lSuUkG+J3KQn6WAAcpbFFQH14cHgkhWc5CPgeQxCI4e
         AOugrI5n8l2go90XjfzSC66uHHlwD+F/LjP8zCMcL578X32FIeg0xGWHMjlI7eUDSxEL
         eQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr6zA2V9nxCW4LSAAVSVhHLBrooLL9/1+AbHr5vr5qEq7DbJEYimXu8O4oiiQWbWfgxF2bwuK7aIUk7ewh@vger.kernel.org
X-Gm-Message-State: AOJu0YxTb3Mhdo6pa2YEgOBwk/IzN0ogJi0t59QobYG4H6+DqOVz8LYb
	uBLZt5XHp+AYjszR1gn3qe3TPmS/wh6EqhB+vEEeNZpEYJZVRuMXQge3VgvqyoUGfJmJd5fBuTg
	XvI9EXiJDJ8NACQ2lfaPHJUabzrs/WU6rY/TyGRESUV1nOqq9vWLQNVRXqraPXw5nUOh7
X-Gm-Gg: AY/fxX7c2WVzvUECnUWIaBawZaFiSX5NKP1vDXj5ApOM7exs/LA4FpP/B36vAhkrhne
	dvBQ/BMW8ugk71kaWpKFim/FvPVV9kR3/BLfXOvMR7P8NAf1B7NiIs/1IN0mtjC+KcCnpErCZYU
	tBxBA5HSQSSaDfCcSKAxMn72H+keneX5DlSRJzHfGtcpno8kBloQQGWssKGp42x10/5otAODQQE
	cv+/s5UUBLUXFb7eizS+2D+L+XRng1eFqoGNHT0cNNjqtRMmFi8FuBPGtNoNJmnfDJNIH97y6K+
	qwOLINUiGdiZJKlFm3P/XpIF6TJ4Qh2BLcBng0+fpHVhLHJYWGKOoOur10W+G6HTkVM2NilinMV
	KpBTuVjrkb0FZ9udLZkAjh3W3Evhwo2viiy8KCA==
X-Received: by 2002:ac8:5d10:0:b0:4ed:64c1:16ec with SMTP id d75a77b69052e-4f4abcd2a4fmr31730071cf.23.1766138919783;
        Fri, 19 Dec 2025 02:08:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8evzCuL8bcIFiYtwnbQ/Fn0Agh9kHBYubQBpio18ThoiXkcAeiVzR8M+80D4wHn1z4oYyWA==
X-Received: by 2002:ac8:5d10:0:b0:4ed:64c1:16ec with SMTP id d75a77b69052e-4f4abcd2a4fmr31729791cf.23.1766138919351;
        Fri, 19 Dec 2025 02:08:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:48 +0100
Subject: [PATCH v10 09/12] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-9-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQV6J8jitsCsTQ5/OCwoTR5WiYjuWzbdVisp
 7XbUnPmV1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFQAKCRAFnS7L/zaE
 w7a6D/9U3orOciDL694kuvhMWVRO2YzSkzD6x/t3Ztw2vC3h4+TiTwQEF+992n9vFsjkpatfTL2
 K/FtjcWUAZ+xr3iLRhMrdRtid2SV0A6gtP5USRTjoyouHgap+p3JGs7OKq+q6l65BjTJg5vzlV6
 06/ZWAnswsVPU518NSdHmcEq1hOKvcOxgowU64ok6ZvjqepcruKfTJT5uPLA48z1IhTs1A/bAE4
 icRNm6iUQ5OmBbFCvJszbQ/w4ijaSd40+i2ag/I5n4G5y3XRNzO4Fu2eZOwVPr87yfDRU6qKcuD
 ZHHOYqm9Jo6Gfl1G0dvM/ZXtP66DqAoNJN7aaaCHtDhApBnNTc7MTquaHp853P0rO+HLDmekALP
 7tj6E/jJnjVzJfEgpZu3G8Vf21O1ph+tjq9hth1EOIDIImmNtF2V0paGsTELJZYff0jAQjffAql
 RisGP/ZPauZRYeo7HW9WEkTVrdmKA1wYjzJENcYdFTAuPLyIl9WmJIWDJIeCHCEkGfZRBIoEc8d
 S14UzHCwiw3YOAtj4sEvhRtxFcNPBmSQM0L7Vg8s0sEzHddoOG6LmXM69RgZYLURpQkbiDZlIcj
 KrCWJ4gYv0nrXbJHVBD6+kbZfYUXY5hBQQt3UOGbV/oU3iA/aJgykcsI+TQm7saK2Ce9cpHPnBG
 YPGM3dadzHnJmCA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX1LHbZQdafS9A
 anX6pdGvJwDNrXYcu116D1G8XlEWh0p6nUQjZx8fGXudlbE33t6DHpSO5+qictXSy0IMNIje5H8
 2mPJxU0/+QZ7mBblM8aLZgX23LkcFPkMqFkiJlh1E17eo9s87kmTFE2QgttjuiKaOh7Zioxjn+K
 LJjsxF+rvW30dhn6QHcXj7NeFhSPzXfu6rE6vXOpS+94DnaMOpaCVbkeaClIJJGoh/WMJvErBdG
 JEsvd3FSGMShDz0oZUb0L5iYHuOdHIO46WEeOXKaSyTWd0/ChsL+U+J8sInF7AdCf3VypJ0M1Xe
 KIB5ikenLJuYtNTWx1dDsxTdQ6jvl9G6ujLIIT6hUdYQXWz9m5IOn//ZX6m2TXY52r4TNauMjBI
 1ZsSrDpjiQ4RrZIiRt7Dej8Gdiqmumd9t8+UjEkbnxct0/MNlLykTOSXgi26F7lJEKb9nkgrGIq
 BQO28C1hEuk6HGnehkg==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69452428 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HHMRxszd9-5hYn3B2se9uXAXtVglkywH
X-Proofpoint-GUID: HHMRxszd9-5hYn3B2se9uXAXtVglkywH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 25 +++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b7bcd0c420c45caf8b29e5455e0f384fd5c5616..2667fcd67fee826a44080da8f88a3e2abbb9b2cf 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,10 +185,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -198,7 +207,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -244,7 +253,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


