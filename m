Return-Path: <linux-arm-msm+bounces-87027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5ACEAE8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 00:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0379A302531C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 23:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E32322B8F;
	Tue, 30 Dec 2025 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0/OoV1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lrf773ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6702F2910
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137789; cv=none; b=HPMJAwMPW+vvOwjWrT6oXzENigVh8msc9yGwfaX6/DJ6jV4AjsCEcJlKdX10mWdur16R5Hx8jZVWz7QbA/5PLPRew5ZaGYYUfqEEs2KeGHxay+UW+FptfIk8LKMTBeHMl8Hs2Kl+gMdhhjsA4IgQsT5lWErmKm9vmFaiaY7rGM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137789; c=relaxed/simple;
	bh=7QSioEYvGLnmvEenw/yHYmMfZ9Xg0f5fS8NTJWat/EI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9XI7/M9OdPy8Lm735XDVCh8mQJym0mImAq7M4sPiJBiXan684yn93BO55tzFcJOollAC6MrGkmR3AdD1fkLhCmv8W2NwpWuelEYewybbBMVg75a++DC1ILOYAimXokJ7nMSAnkvBveEX/kLQwAffdGVZlgw5Rdvc9iOb1WLrik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0/OoV1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lrf773ef; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BULnt18635606
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4CuQYcWJDm2WGHsZX04dpGhQA7HPPf+2qQrhA2V7ZQ=; b=o0/OoV1OThKPsxHz
	si//UThuoOCGVSMdE94/7+HwvXZCDVXhmqZnBBs2OGmVHCy+1F/ZooG3jXKK5YTt
	4Whur72cD/C2Kt2nxFlSvBnPwxlYCKFEhsLSzb/mE8bbu05Tt7ML695ApiNdk6OE
	a3asbtKS54AZWJfiVXbGO9OVPqZNeqsUoTPD1Mh1nUbVIwzTfwImwiGTV94C+Wh7
	ALdd6bHE/Wuwdmwa46G0u3myvVMSwLYsUTGFoaZsGApVuRX+vOmk+cr6Z+Ql4cco
	IYznBc2nfWWRPj2Lvl9Oj5L/EgdvqVX6o2gGcvlxHunIXz8lG+UpcEHc+QSduj75
	fEYwDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sgu2b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eff973c491so259534871cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 15:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137772; x=1767742572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4CuQYcWJDm2WGHsZX04dpGhQA7HPPf+2qQrhA2V7ZQ=;
        b=Lrf773efuYIpkGNnfqp6vYU2yha0poDjPYaY7kO7Y/8EA1jPCelsK5PG1Dm4wKSaxm
         dhZd0Bhks+oQZHA8MeAqYCFc+s65ilsQAiqjDCnOny0cv/kWp1Y7+b9RTVeD/4O/IY+c
         D5UbyS4qkH8LB7K7uFdwe1NvJ2RG6KJ7zV2HhOdtZ+71RW93BGGM6mW5D9Yq2lGYRUC9
         s+AWoeboyme9fsRcPLgKyVDz/9iARp6h8BuaixKAQVdm6P+hs5Y+GwZVjGqBihz/Fs7H
         7/LskoziO8lPQ/aFNNqybfi/x3js2JteUMBy7LtO8D+zRYY6tXQSDcIvm+rEBtX+baKp
         +6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137772; x=1767742572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T4CuQYcWJDm2WGHsZX04dpGhQA7HPPf+2qQrhA2V7ZQ=;
        b=dW+Hdc7U4UZvcxdI3pAOaxLWJaoBsfpTGTswbAXgPnk7anR3Z+k424utNW/Q2ecoJd
         UKt4Dn/l66OK05L9aDaBg3M6v5Qk4c0pK3PFwAwgxJNVcfVGcXmgQ2TLHXzUnX/eIWWn
         edGmJSs7rnewEwfmRqKi5ZY5yz7IU0K0GV7aT+R8FsO99d0N/gY2nm27f2DijjYQ3764
         VjAQlciGHKFOZPqGWzTwVCjsx6NBto/TqU1A3UtYpWDnmNOfhExKSaSNBKxR2xQXC0m2
         6ukekiE6lsTrPtRbnPvvqHZlmmWqVkIs5oEulAhaDw/FRaixAHaD0KAR6CTHVQacZMG5
         5M7g==
X-Gm-Message-State: AOJu0Yzm7YwSYD1PVEK43QQ7F098ffai322pixydpJLG8PBMtP0Eea4A
	scgzY60cAjEmXjhUBhZQrQJELGGDP1b59OnJbyeklX2dNIVM/Klp515VIhcWrVbsqsbQvgaHTEs
	+J50giMnAJL5enHylrz9cm6Vv6XQT1VaijP8lW6mAqS228F4LNfyJOUrvDo9rAx8dx/Nk
X-Gm-Gg: AY/fxX4ffTpJymu+PMyFwe7CEoAH3SHZteQLUMI7nKaBTti137gAIj6m6ke9qxEfzxi
	HRi106Sd7+Pg0v7yq9PKhcM7LO9vXuvHt0EDVD7PD1cAtjyGJRWQvXcbIkkI5orUQ/l2svVswxP
	ITvcX8VWmbjLze3Mj9Qgl6c6WQGTgUSSY+IUjyiFBn4RV3+TfcVeM0IPbfj6mdUJUZAeT3cG25o
	lyuJvLfMHBBeULuQTUfOXcrfpg24nI6rHlPVAw9lD/nF2lDUpgAxFSIV1pIn2ehLZ1dp8RUMH/g
	Mv9fTgLRM++RHBu3bUvHWe6La0wm/Umzp0dj/AULMRYtu4CgzTRJgOjEuwMp14Bd+YWXSbZ0tH9
	ZnZIuBIzV3xYUdU/XFNgw6MZW+2EjpcAABRJUJAcPuwOXe9+0kYGOkluLLjiVPuT+PhGjzSrL3z
	8go46u+GzMF2f20BlxI0z4bWk=
X-Received: by 2002:a05:622a:4d43:b0:4f1:b9e1:f08f with SMTP id d75a77b69052e-4f4abccef46mr678516971cf.5.1767137772384;
        Tue, 30 Dec 2025 15:36:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlDPU6Dqq5czWrRWiRVo3KDmDnZib/IbWQyj9oxLhrnXD3CT7PTTDOP/hBeaierKDJ77x3Ew==
X-Received: by 2002:a05:622a:4d43:b0:4f1:b9e1:f08f with SMTP id d75a77b69052e-4f4abccef46mr678516561cf.5.1767137771935;
        Tue, 30 Dec 2025 15:36:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:35:54 +0200
Subject: [PATCH 04/14] wifi: ath10k: snoc: support powering on the device
 via pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-4-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3870;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7QSioEYvGLnmvEenw/yHYmMfZ9Xg0f5fS8NTJWat/EI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHkHbyPI900A+jLy/7p42gbNUYAcF9OhJ9mB
 7CW85kKHn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh5AAKCRCLPIo+Aiko
 1dx4B/0VHR786H300VxW1pwdym1Ee/FczTpqsCvyGjuyZ8bo/+du7C/9JfjMuGXPzW5orBpXdfX
 hOX0pOrMszp9hBJ/O0L+ApDBodhZDfskjO14Fa/4vPTzOjGk3yQ60DjzecKwh4KnW7w2zf4LhZ1
 P7QFGFWi8b+9wIcDtqcB8/jWIqsNxoVgjtim4ECCrX435hc50mrsI1sfzAFLEKhWWbFlIxxNRbg
 0vAy+Nqp4uYoS9P3h5pnYO7sJks5sGJ1MlpbU/0x7M+TKO2rcS8hS03VvOOGg3hZ6j7oZWMX+cX
 Gsc1rgY1RWm4Dr3OTJF4rS/sr/flKCwZFonWYiO8K41KPg/E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX3yqNEqAoSPqf
 xH1nYRCbgE89qoI8za9p5iK4b3r7/BuXhMEKDZKSkNusoaQhG17OuFm4xtPaipvX81+Jyw74NR6
 5U16pbaQETJz4BkyFQVO1hy+9TJ2qay6LwMVzyrhbz6ooZru0d2gLuI4AYiwhmMsCSrL+sylgDq
 HpAkbUx8Wx3kyak3ASNi57Le1/oy6vxjS0zrWXraM1TntXKlCqWJkj0NtzOvC+qT4gpjLusUrG1
 FwK9VuUL+bPuXC7OEHTVJbDlFyDVy5eyxgTiTfsa2e0/oK/vyffIMUtaAwWJiCrFUmAFVyAmVie
 QCJRe3YXYtodWFXzc8f83JfIPCuvOc8P5I+tUoCbgamUg6c6P9H7/ghxN4QXK1pVyaXtRZEoZX9
 j1PL/M0pxTIX1qhsjxhSUi7576QntAnfmaE/BevwZo14CyzJa3Cuk8SpScqg5RiEgJHn0v0nkM7
 Zdr30+s6eCrEUhWwQUA==
X-Proofpoint-GUID: z9acqzJh_djJ1L_GKIpytgXYFuHSzd5f
X-Proofpoint-ORIG-GUID: z9acqzJh_djJ1L_GKIpytgXYFuHSzd5f
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=695461ed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Hs-j7k2oS4XMYd915dMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211

The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
voltages over internal rails. Implement support for using powersequencer
for this family of ATH10k devices in addition to using regulators.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 43 +++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.h |  2 ++
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b3f6424c17d3..919d4b0b87cd 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc/qcom_rproc.h>
 #include <linux/of_reserved_mem.h>
@@ -1023,9 +1024,15 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
 
+	if (ar_snoc->pwrseq) {
+		ret = pwrseq_power_on(ar_snoc->pwrseq);
+		if (ret)
+			return ret;
+	}
+
 	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
 	if (ret)
-		return ret;
+		goto pwrseq_off;
 
 	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
 	if (ret)
@@ -1035,18 +1042,28 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
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
@@ -1762,7 +1779,27 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_release_resource;
 	}
 
-	ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
+	/*
+	 * Backwards compatibility, ignore the defer error from pwrseq, if it
+	 * should be used, we will get an error from regulator get.
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
index d4bce1707696..eeaa1c009cb0 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -53,6 +53,7 @@ enum ath10k_snoc_flags {
 };
 
 struct clk_bulk_data;
+struct pwrseq_desc;
 struct regulator_bulk_data;
 
 struct ath10k_snoc {
@@ -73,6 +74,7 @@ struct ath10k_snoc {
 	struct ath10k_snoc_ce_irq ce_irqs[CE_COUNT_MAX];
 	struct ath10k_ce ce;
 	struct timer_list rx_post_retry;
+	struct pwrseq_desc *pwrseq;
 	struct regulator_bulk_data *vregs;
 	size_t num_vregs;
 	struct clk_bulk_data *clks;

-- 
2.47.3


