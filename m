Return-Path: <linux-arm-msm+bounces-89724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F4D3B485
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F7693035BF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5E232A3E7;
	Mon, 19 Jan 2026 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyeANskO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEVzqgzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9078C32A3FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842491; cv=none; b=KhWzeCh9+RtbIQLIwxlS8pZMiIIAAnFcgf70pb8nnTADRSyDii/DTLdYk5VKZBXnY06Ffwky1MpcHGBNdenlGGJ5bRY0VEDVgNoivmx3IQMneWUN02Zw5pz2pgw9ZvwUecTyrwPFzv/eNHO/DUp2spil5l3/1udcuyJzwDmI9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842491; c=relaxed/simple;
	bh=TngkZuAbDr5UJBjPXFExRZzr3EmJY7tCHVrw/IzceiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6KcVMIqZuKkd5O2RRCaawUgJGXbri07KaiIfC5Qf2ooqWfaZsUreExMLaH2JzTN3Nx6o2obWff4Zs0JTYuMB3hC/kminka38ScE0ivk/ohgkSMA255QCf5+6bzTmfp3VnA8zjExp3rc6zbc+a29Gb+T1NPMrjdTFJC/Wus7whg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyeANskO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEVzqgzL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDKfK1440811
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+CtHSvBIXD+GWDzkmgHnLc3U/47Ulr6j8JFJ4c1VOM=; b=WyeANskOrzN9I+2i
	7ysU0LR9udeXIWGbRTBitfi7PLzYIecTUx3JChBch+8KHRB4GmVImtKFnw1g8z/F
	JAwNFzJ2j5waNY45gdiBII5pP5zOzF+2oslIXhJzaDqVI9e2o18eLOGAnj/6sosO
	wuQ59XlrO2c1oV2H7v475JNzwdT5IkDXcyolcbVbL7/tZsvwkjzMuX1wRfuHMF47
	KdH7SjpcwJXrWUKarDkqmyhKaej6D3dsdjJcKQdr6Es+B8rlWTwPRFEdgWB6sVyM
	PoPJF3lF0TaUacpkXn806U48Be314BEj+d8sSgGUSUld+psWNVATi4r289XIFm8P
	sh9J2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskj3h0xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:08:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so15791085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842488; x=1769447288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+CtHSvBIXD+GWDzkmgHnLc3U/47Ulr6j8JFJ4c1VOM=;
        b=KEVzqgzLzGWrqzytyMgtSb/KVF7SjQXUW+wkPQCO6uO9qCKQBXed9g/K650Y/mgPjl
         1oOuJ2IT9f4jetg8smVoUg+JXeuSrAge05EzEM6zM8ITeSCJz9OugB6bk86grHcPlDPk
         t02GB0UObnqbCCTzXXdb836JZm7ICr2VWGtk8dVrCs4QPyVOXLZ2nbYGNvZ4wAJZP57O
         COkhwhPc+de2ZkDtIwPxCmYWUpjzTTnlwHleTXzW+RaxlSjo0Em/xp/fje2XlZGlKh6z
         WqOggOPm12x5LY5MJ6uG+cWvtCzywAvw8tdFzDR39Kboe1uo5jEzpiTBHVbwzsCLtAwY
         O4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842488; x=1769447288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+CtHSvBIXD+GWDzkmgHnLc3U/47Ulr6j8JFJ4c1VOM=;
        b=QsuBr01aA5pVd5ZzgPJfyu9OTEicOeArg0QSoXl4gtpMfzdLuOci/NcBSDqdT0sdwF
         1Xs6Qn2Y1YAQdwG2PT7qvZg3G1GlJ+nCVaevKJrF1enUSh/blxpT6KH/BO/keaIUAIxz
         92eVfmYjSVOy2rKaA019/YTUtAndn5loMZkIho1LWzmODWkoUU9S6ZIV2GkD0w0tVfrK
         MYtWuWlTuMp/SGBakHUUN+TK2gHJFPOZRzmzVVZZQnZeeqfp3PXUfls7GLdzyyZsagjZ
         i4IHV3/84npjvHW+eNnvqOeyIcazfJxfo97UjT+Yf/gtRgL4/2q7i7De+LjzFCA9dX+8
         sepQ==
X-Gm-Message-State: AOJu0Yy959ViK732hMtwOrQX5ZfQkWGTv63Us/C8CQktuSqgDnt5QmXb
	sw+DGFUQnUTEzczZDCzRxoe6nwyWqhz4OiTx7c6P5BGIMRJB+UTeyeWaMgMk6dvL7ET0K8R7JF/
	DhNyPDI0RjqHVetR0IoyiBjdt6vo4YN/DT+N4ka+sYTz1ekqjs5n5GfcdI76sKRcpnQx9
X-Gm-Gg: AY/fxX7dLEYZwzxtDpvq9ckO877yD45KnYn7V+BYVQU7kHiUHHRr80qwRu0zL2eGbbG
	W/YZZg3Mx/HVZyvNiCB1LW+RPTS8G7zk1fxe//yYdRmprOgnNCHB8bM+/W2YFqWCsbWqajyIg6p
	0tf8wtqkggvfG1yJj0xEBzpdgzRkoF10lZQU3iOEHPWyzf0H8trL6Fu4lUNWpgGP8dtCf8sU7Wl
	CqfnFPi9vf9MDiWE7DmI4EiOdO8IGsgcWT9tPN6glRqEtTZTFsjpgwQnAToT574rw/kUlbqLssP
	vJIfiUXn76cZay7r+1yA8Vvqxe4Bw9oOesSlNUntXBs+gMGBuzlHY3+uiX48ubu5O52xEippEEV
	nn0Tp5lKEeBtfd/lqEqPwXJBQRYwxLYOBqP7T8wzpp6wsiK8yGbWrbuKhnH+LHkjOasu2otRK7d
	5phZEO1V5mNhjxmn2xz9F6Eu4=
X-Received: by 2002:a05:620a:1911:b0:8c5:2032:3766 with SMTP id af79cd13be357-8c6a67099a9mr1629401085a.35.1768842487671;
        Mon, 19 Jan 2026 09:08:07 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8c5:2032:3766 with SMTP id af79cd13be357-8c6a67099a9mr1629394585a.35.1768842487011;
        Mon, 19 Jan 2026 09:08:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:07:57 +0200
Subject: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the device
 via pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
In-Reply-To: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4976;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TngkZuAbDr5UJBjPXFExRZzr3EmJY7tCHVrw/IzceiU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTtAas0TfVBZ0zgaGJXwyQrA0uQ6KpWcbxdI
 h2osmaT/XeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7QAKCRCLPIo+Aiko
 1ebQB/4o64wgCHd8jSj7Bz3CZ/+62x6a30IZawuIkYO3PivfZEHDbHoczj5oViXOUvo0FK9gpY+
 hykUvnNIU6bNL0iGUB4dDT+U3ZSIsqeNWAy9y3unwzTnNE1liGuOIlDPe2YMe3XPOPjJA8anID5
 JiLUCh+Vh7aQqH2I3JX7iezuUVscpFtGpDkQlxw9c5WofpRfrOFXlcITsLdaLimxyuGFOJC0W+3
 PAhC+dCvGuwkyD3zWsELpogZHWBhSlYHrwMgna5IoUK6nvyudXybtW7Q5/AgckAfHeYTCKpgLdM
 Cnvy2tBNGwS0HxWSaYMQSJbvTeW6EaFkBCb4KOnpwGwGh1XV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ds7Wylg4 c=1 sm=1 tr=0 ts=696e64f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=s7CvTC462Z5CboN7hzoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfXwNufh5VKJfL+
 IOY8p+ADCs1vF3hu4IR7SxUoyt7lYOBokQTqcNGA+z5eB6uyQyQaiTjPGgi3B5VtLbmeJoc+34L
 jkMBrYC6M5X5dRzivpO7/GAZAwIk+iuT/QmIMeDmqCIOTLKtbngBjFGpHo5kS4UWt38y3R2KRUj
 GiI8ccuZR6P3VqcL5EGu6DGTvsObFPPjcE1qcCrzxL0oBzfiuuoCmUIC3w3rP2PGSoBKp/D4hhB
 fCoGe7l4yp5VlMqTqM6BnH55t3sDE18qXoNmJnSBm9tTEtyru3nHxWsCfPCglLaXc+F1pEP9uAM
 KuRuWlhzOn9djOyJEG1+T5joyj0Wur969FKhchu34yI7pk4lH0Y8kBTNE21e18RKFsLbo1FTEmW
 SLbqTxm5Ena6MLETf37shN5j0NYle4FEEDYb2+C+L/PK+mDCnD6+d/NGTJyQM48GNTOFYGcrbWh
 RTIKAcWZnAjuH30rplw==
X-Proofpoint-ORIG-GUID: vtnmhLJjRO4nepm8voSHvQR7B19yCbZn
X-Proofpoint-GUID: vtnmhLJjRO4nepm8voSHvQR7B19yCbZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143

The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
voltages over internal rails. Implement support for using powersequencer
for this family of ATH10k devices in addition to using regulators.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 53 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b3f6424c17d3..f72f236fb9eb 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/bits.h>
@@ -11,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc/qcom_rproc.h>
 #include <linux/of_reserved_mem.h>
@@ -1023,10 +1025,14 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
 
-	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
+	ret = pwrseq_power_on(ar_snoc->pwrseq);
 	if (ret)
 		return ret;
 
+	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
+	if (ret)
+		goto pwrseq_off;
+
 	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
 	if (ret)
 		goto vreg_off;
@@ -1035,18 +1041,28 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 vreg_off:
 	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+pwrseq_off:
+	pwrseq_power_off(ar_snoc->pwrseq);
+
 	return ret;
 }
 
 static int ath10k_hw_power_off(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	int ret_seq = 0;
+	int ret_vreg;
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power off\n");
 
 	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
 
-	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+	ret_vreg = regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+
+	if (ar_snoc->pwrseq)
+		ret_seq = pwrseq_power_off(ar_snoc->pwrseq);
+
+	return ret_vreg ? : ret_seq;
 }
 
 static void ath10k_snoc_wlan_disable(struct ath10k *ar)
@@ -1762,7 +1778,38 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_release_resource;
 	}
 
-	ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
+	/*
+	 * devm_pwrseq_get() can return -EPROBE_DEFER in two cases:
+	 * - it is not supposed to be used
+	 * - it is supposed to be used, but the driver hasn't probed yet.
+	 *
+	 * There is no simple way to distinguish between these two cases, but:
+	 * - if it is not supposed to be used, then regulator_bulk_get() will
+	 *   return all regulators as expected, continuing the probe
+	 * - if it is supposed to be used, but wasn't probed yet, we will get
+	 *   -EPROBE_DEFER from regulator_bulk_get() too.
+	 *
+	 * For backwards compatibility with DTs specifying regulators directly
+	 * rather than using the PMU device, ignore the defer error from
+	 * pwrseq.
+	 */
+	ar_snoc->pwrseq = devm_pwrseq_get(&pdev->dev, "wlan");
+	if (IS_ERR(ar_snoc->pwrseq)) {
+		ret = PTR_ERR(ar_snoc->pwrseq);
+		ar_snoc->pwrseq = NULL;
+		if (ret != -EPROBE_DEFER)
+			goto err_free_irq;
+
+		ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
+	} else {
+		/*
+		 * The first regulator (vdd-0.8-cx-mx) is used to power on part
+		 * of the SoC rather than the PMU on WCN399x, the rest are
+		 * handled via pwrseq.
+		 */
+		ar_snoc->num_vregs = 1;
+	}
+
 	ar_snoc->vregs = devm_kcalloc(&pdev->dev, ar_snoc->num_vregs,
 				      sizeof(*ar_snoc->vregs), GFP_KERNEL);
 	if (!ar_snoc->vregs) {
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index d4bce1707696..1ecae34687c2 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _SNOC_H_
@@ -53,6 +54,7 @@ enum ath10k_snoc_flags {
 };
 
 struct clk_bulk_data;
+struct pwrseq_desc;
 struct regulator_bulk_data;
 
 struct ath10k_snoc {
@@ -73,6 +75,7 @@ struct ath10k_snoc {
 	struct ath10k_snoc_ce_irq ce_irqs[CE_COUNT_MAX];
 	struct ath10k_ce ce;
 	struct timer_list rx_post_retry;
+	struct pwrseq_desc *pwrseq;
 	struct regulator_bulk_data *vregs;
 	size_t num_vregs;
 	struct clk_bulk_data *clks;

-- 
2.47.3


