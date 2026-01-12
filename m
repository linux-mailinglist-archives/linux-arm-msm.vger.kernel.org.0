Return-Path: <linux-arm-msm+bounces-88612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D47FBD14D73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E761300CEC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 19:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CEA3112DB;
	Mon, 12 Jan 2026 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8xAR0Kn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gghVYMfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2551D3128D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244520; cv=none; b=agjyQu3cl/iBpuKnRy5wDAeiqjmMVesqu6O9fMGtM1i92MvdqzudL/OcyH3alVbW3A9qgI+K3jjsy9DOp71zUK270AFKeeyTeZPIfYw/hiR/ChX5h1bEozMPNDBgL4QagyVI2+eyRrzV74myiD1nvSB18MIhnHorrWVjba6+j1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244520; c=relaxed/simple;
	bh=pfeLOwuV5tNEGHquY+BElAmY8n4IFgbScPUapFuaNyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRqGt9Vv6gRTtrAUGVZgz4ee6xPmbzLObD3Xy7oD4T3tgMbID+dFPNKfaCXrJKPfjlSKebBgZOyZlf6n9DNy5v5sLWqxempS863Phnzu7XEF2IE4t9g8FLvaUUj+1vDZKnBF8L0JmmyEvBVRSo9OOKPzHRcLpQjfyIDVcJWckhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8xAR0Kn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gghVYMfC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CHfPKt2284741
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uPDjxnyIvH6
	EuQa8qYzLtg8+o6G0UI+SqbdnqVH1a/A=; b=j8xAR0KnlQbuR+kAFXJJdgxvQLO
	3xF97ZVby5/Ki1VwyrZHjp/WnNNShU43ykYNqQJ233v9LzzoF8spllzL3PAJYHfX
	Wn9W84LmWOJYM8LyDW84AlsUUyTg3RKmicxzmI0k6nLGHkN0F8vE0OG2a5z97twT
	DsQpUmxMpnfu08WD2SyNln/jr9Y6hnu1YatpWzb7Qp6tftGTIpFtR63Kbz6Jow+k
	a04UA+cvGXKyJLl8GDODLS5kjn8KbW3JlldRpUGVOHSd4XMCLKta4nMZt+JbYc5u
	i5MP4W2MaZ3vIvz80690mlxsOodqpXQ/Y7ik4HNs0LlOhQRpEBkZzCJxyLA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hhma9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 19:01:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f8e6a5de4so67738905ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768244516; x=1768849316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPDjxnyIvH6EuQa8qYzLtg8+o6G0UI+SqbdnqVH1a/A=;
        b=gghVYMfCDqQPRz69+S7Gx24q9WkkfyFowlpccMKo8Ctn/uC2OLfiP9dC6jklj62rsL
         oBB7hdNlkpWg/8RoMhrP8n3UifK6LludSJQac9KjprMvuWRn0oLEuguADAyn75qneKwz
         S/J7M8jrCna8MULs2dzixHZkGFIibqQwU6dx1dN+O73AQrvZCMZmVESUUDyVvMvO0WE1
         YSON6WCK/LBqmPst9yqS1Xc4FVTP6TkgOqENRHw74YMguSsF3R6CW2neuyyD7R5LbXjS
         lCN2rpBaVdSRaXM2u+DZJCk0t0b5zyqwJaM49qEmprtb8SHKCkUUBucMLAe9t+qTpcq1
         CGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244516; x=1768849316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uPDjxnyIvH6EuQa8qYzLtg8+o6G0UI+SqbdnqVH1a/A=;
        b=cliHnHOIWx3UvNO+8j1+/wXVHMH6gTKnv9tgjnFUwgSpmmlQV32iYEf7B8t59Bx4L1
         kr8kYk7LqrbJXDLB2/6cCE+wlKfoxxj4VyOKaHQCedCA/462I6GFnCyxcQurKuTmzTjd
         nh6xrDPM0EoveH/t98UkMjxeonmy4J9YovWtGMl3jafMnmXHo6gOmlZpA21LLDqkvh81
         oGcRGQj3pxGTLcjKDYDKBf9xf+610IGF2RZ0Nxx9KQ/AAJkVEYo/0GuSpGDLjUxMbXDX
         kTxglYxxVZmfjSClthaRXozVVafgTmsbs2Ah59WXm24v0vSWYESgMpEEBY2XSJhqAAQS
         3PRw==
X-Forwarded-Encrypted: i=1; AJvYcCUG0jkKqFPr8TBUr1YGs4yVNPNB1zeKpKMIoB+BbluLZ+IZNXRSkmM9MPOaHylPRjeEvUHxl1aJzLycTjga@vger.kernel.org
X-Gm-Message-State: AOJu0YzRt/xhPvdODoae7kKagTY299MJb2lbelTO+oruGdsBPJ0vLlYe
	Geo7svRuXQ/+IDSDTLh/KYWZE0Zn50QXcVcxNiTEOLaCPcCdBCcgpBvd4T3vRPe67eJYyMGgDhJ
	Q7poTa+37Muz6hS9SNo8MVhkcvK7IvdIYPDg+VGJDpe4IUo883czuXwAnK6IiPtVxuDe8
X-Gm-Gg: AY/fxX56254ohls/juXl/eZoELyYssI2Kx2DAMsYrxJyPO1sOM4a7iUb7H5zt1UYVJ8
	0VGh4sDuvJCAUgn+brv9cyz+cgHJYoX/f+x8emq+s+hE/4hsaaCgVYs0s22YeqiqzNI9NRzxEwx
	c2YuV0lNvvfXwx1HUsJKcEHXOwOVvhgnx9r6ckxzNfbhjKKM0pthYyQJClFjo3nTGn1eFBMAwdo
	CVY9Ah2WlfSUUpmFKfLfQc4c4JrScTmwifSIxcfv2IzPN3AIQ8qmf9D4VlCfoWiZeLk4bmBpB4b
	abq4wCMlVtCwGHEaxaQqybVWPy47L75BoOwDK3b59tB2xNy9FtCohhNk1q0zzPAwBTqarDvezgB
	CYyts45vGmkaix5vPOw8ycKuh++C60920omlb2JK7PxI=
X-Received: by 2002:a17:903:37c3:b0:29f:2734:6ffb with SMTP id d9443c01a7336-2a3ee434de2mr165519565ad.22.1768244515350;
        Mon, 12 Jan 2026 11:01:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwEXg2WbEK0kcjSo9QlXVzcQp789a1loIB7VqV7j6g3wpJFM++BTLFba+1EthzjPpfOZoS3Q==
X-Received: by 2002:a17:903:37c3:b0:29f:2734:6ffb with SMTP id d9443c01a7336-2a3ee434de2mr165519135ad.22.1768244514744;
        Mon, 12 Jan 2026 11:01:54 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8888sm180120595ad.76.2026.01.12.11.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:01:54 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <quic_ptalari@quicinc.com>
Subject: [PATCH v1 2/4] spi: qcom-geni: Use geni_se_resources_init() for resource initialization
Date: Tue, 13 Jan 2026 00:31:32 +0530
Message-Id: <20260112190134.1526646-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112190134.1526646-1-praveen.talari@oss.qualcomm.com>
References: <20260112190134.1526646-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AdpWPVDCdJR9ylJ_aiebtvVSTlXoQ_IC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE1NyBTYWx0ZWRfX+v5oUiJYjkxL
 IPtMWCRgy2ZH1F2knhSBYM/GKGUAMD8eIKdRnphXzp9eLenJIg7sju1HlLvbLHGEgTuCvqpU2jz
 wT+aWJ3v1ilOR5LiM5/fT4c6TjR7m3rdYHrLYuwb08iiQ6e4IQCxwCuQH66VIafkd6dcLvzAhCZ
 /TIbfMexsqeNphmff3R9LmRPQeoiUMUK4U7CTs2IrocA7LoaUFl4ZIvwpm5192DUO25cKWQoDtr
 MHZesJBkj0+Bm1AVYGb2HADZE5U+YKp/FHA0N/0MFWGnHABEqt4nDg5DtX18I2XOwZbeOvmsY82
 0E0NK2U+1HLO0/omeoYICaoktJ1I65/S5D2eZD/FEbccFDnjEANJmHIv+DS9ZNYSAW0TzXY5cyh
 oPC5TIHSVCeCKLsSgwqxydHtSfKm2nTjoYLx41w9/msOt2v51oYgNWg6sN9Tr94s5OP958jkCGO
 F+Jl/f2MioWPa5GgKmA==
X-Proofpoint-ORIG-GUID: AdpWPVDCdJR9ylJ_aiebtvVSTlXoQ_IC
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=69654524 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=TXo2QnZ9t29hVJcr6pMA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120157

From: Praveen Talari <quic_ptalari@quicinc.com>

Replace resources initialization such as clocks, ICC path and OPP with the
common geni_se_resources_init() function to avoid code duplication across
all drivers.

The geni_se_resources_init() function handles all these resources
internally, reducing code duplication and ensuring consistent resource
management across GENI SE drivers.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
 drivers/spi/spi-geni-qcom.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 5cca356cb673..7d047ae9c874 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1014,7 +1014,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	struct spi_controller *spi;
 	struct spi_geni_master *mas;
 	void __iomem *base;
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
@@ -1029,10 +1028,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk = devm_clk_get(dev, "se");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	spi = devm_spi_alloc_host(dev, sizeof(*mas));
 	if (!spi)
 		return -ENOMEM;
@@ -1044,17 +1039,10 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.dev = dev;
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
-	mas->se.clk = clk;
 
-	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
+	ret = geni_se_resources_init(&mas->se);
 	if (ret)
 		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
 
 	spi->bus_num = -1;
 	spi->dev.of_node = dev->of_node;
@@ -1078,10 +1066,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
-	ret = geni_icc_get(&mas->se, NULL);
-	if (ret)
-		return ret;
-
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
 	ret = devm_pm_runtime_enable(dev);
@@ -1091,14 +1075,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (device_property_read_bool(&pdev->dev, "spi-slave"))
 		spi->target = true;
 
-	/* Set the bus quota to a reasonable value for register access */
-	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
-	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-
-	ret = geni_icc_set_bw(&mas->se);
-	if (ret)
-		return ret;
-
 	ret = spi_geni_init(mas);
 	if (ret)
 		return ret;
-- 
2.34.1


