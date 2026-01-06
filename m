Return-Path: <linux-arm-msm+bounces-87583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0CECF6326
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 02:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 168C4300B02C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 01:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB98D313524;
	Tue,  6 Jan 2026 01:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJND170N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hI1V/Pcu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E592FC891
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 01:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767661294; cv=none; b=gqF5Spxm2XI9Wg7Of0vBULltct8Dnhggsxo47oM7v7Zm/t45psYbMmIVxeJQP31R4sIORzkiVALsb3drYIYZL+daPS1w7pgTKMJy0J02TkbWCVzTgwoADbY7DqzYgrXYKOnG9pkdcBVlLqkvTVeyYCNdFKV5SlwNi2gKy30ePn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767661294; c=relaxed/simple;
	bh=vGKw+wEv4m8AuXcSbM8ug5QUp/CDr75AFUCT++yOsvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OvirRZw6LxSHTq8Cpqf1kTyKQq8yvtlnE24bG13Efy96RCIFEctLMHaS5SlOMkn5AJJbrnUccx8dKP0cF/RG+HiNvISiTiocZ0i1mOr0JHoLn1+LaJJ2V3FxnhEtRcv4q/i7bFh249IgXM8ro22BG0hKybrrLLYbD0WvLxZIi/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJND170N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hI1V/Pcu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nMAo2943633
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 01:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toWGAj7SgswRPrjJQFNYvHcUGCLQpi1FqKeAVpzqbvU=; b=iJND170NW1tlBMQB
	HYoxumSS2BP8uillqDNEGwEiprL8Z7jNmZVPJApMFMAswdb9bJ5/1fFbcpSsYXM8
	Bqsy3M6n1ZGBsDyKJvrS9X2Kmt5VPPKKfi/6jeViftU15HfJ0cycqXdrXQHTw2k1
	KtTh5+2/44vamyxPnAyfJXVhEMmZabVmzQeAi1AdKzkHWnBfF3dYwlXbP2E1N3AU
	s3iVAyZUUpAD45jQieYRy+3SX6KdHNLSizY6ULzhaaCxQ3JaFittHSPyC3v762Fa
	PMw+Yj2Km5cWQ2XIReRVz9EZraWD5CGdVvxEnM9FUuEpnOoTj1Y62B/VSv1+WkqB
	AOazbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv01ewk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:01:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1fa4a1c18so113551685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661289; x=1768266089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toWGAj7SgswRPrjJQFNYvHcUGCLQpi1FqKeAVpzqbvU=;
        b=hI1V/Pcuney3KEUzHH7oey1/c2QYHF7gZxDAkxlbGx1Y65vx3UkNHuVzkF2i9ZYUoC
         sCN/hjSh75u0nTWPSkmy5qTBpckqewxP+ExuxQAXfvuLa8MtiRCKCwhTgQUPxHuZukwO
         jh74JYlxJB4X8b3VSdru6t0Z2BE/AZq5FwwNGrb4dM0PnXGSL/9sHzgIFvmFeC9gPcPI
         +5JfNc87uAAjdiEE5KZ5QCEXOpXu8fehQvRte2AXRpsz/Zq6uqj75laZe3cD81Pdv55R
         5VTS3Zh9brl0UR/jUt/pp1DurN0KbLattkza8+EBMKxEeQBC9m7bOOxe51yv/MC9NXEo
         T1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661289; x=1768266089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=toWGAj7SgswRPrjJQFNYvHcUGCLQpi1FqKeAVpzqbvU=;
        b=qLpTvNpfCnvgEbHMU0afR9fMvDdvO6se2loJXDra4+0pxL247p4EbF24JRzqION47X
         GvrBT97gSUVAswIABq02BarOw8x4RiY0ak1cbtGpikwf2GiOCPAgXcuJaj1JNKev4sIv
         F4OQ1f52DVrWXXDTG8bautO7U/Ide6ALTtayu+9NtQLgrSdu9q48z13/QRf12jSeNYCS
         t8zESGE4tkRBLsVL1YyoUmltBEB404I+rwTXk6aw80KLTvSptIVkQpTcm/FYExeYgBLl
         59m3q2QdjCxnj2NP5l4aXKeyZK9oHFxPU179YGgSX7WF4fkT5wNKzluUsKTOmdoE+xPq
         ECZA==
X-Gm-Message-State: AOJu0Yxxm0bEgqVUUz85vnUME7iblz2CXAFAhshG2H5lgAVdG6ifUyGa
	fvZKAZnhS7clWHfmiPDWqaOt8Bd1+bMIs9lRc1mEW1w4x2hD0jA1QCEH9kdwh2CE5079W69LGfj
	2cvCxWnQCCV5Jg2RZsA3rgRLfQ8gSzVIDHU7OrvEhykPlUjCmZ7IB3R6OpVjtndMma3kv
X-Gm-Gg: AY/fxX6HV/ewnFV3/+7vvJdqfjXwcPTT6tXxel1bBRpju3KavIciaS6whKZ9pTxPiqq
	cFwNzdi1eQo5VsTsfgt8Am1HkX5OzNf9xvZk91ewyEJYDhgmnCcRrEIOODL9g04Pyz71/zLSeVZ
	P5T3pajHi/17ZpuzYTLmRQL10Ol+1DQ16segjzq+egLNP2CjqitzxCbmiu2uU3MQ8X6RDk9tLZN
	IA0Wo/Evyggf8tJyrgwpsQStnCFWBiB4KSqwalQJNw6uee+IEyGhrWAe+yrBkwEH+yW4r3l/roS
	7M4rNAsVoE0x2NQNyXdjoa+10lLZlqpETc0uVt8emO0BZainKSsTZQDqLDAPTcd8kCJk2NPQbSz
	JpBURCrl7W/GcIbdQwLYUmhfwgDdebyoTrHQ2YUM5/QhSdfjdJ6IfeRxAq/ccBmvpxB8mPXcV5R
	xwdMxp5PEaJuEeQqNt45uXR1A=
X-Received: by 2002:ac8:7d06:0:b0:4ee:24fc:bea3 with SMTP id d75a77b69052e-4ffa770d84fmr20866071cf.35.1767661288597;
        Mon, 05 Jan 2026 17:01:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGRIkm3qB3iAMhjMsr9K7RBdmhsGoeWiJuR1zZQW9HRAWrshi4AJ0+6RJy7rL89ggSBiDVrw==
X-Received: by 2002:ac8:7d06:0:b0:4ee:24fc:bea3 with SMTP id d75a77b69052e-4ffa770d84fmr20865361cf.35.1767661287983;
        Mon, 05 Jan 2026 17:01:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:14 +0200
Subject: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4482;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vGKw+wEv4m8AuXcSbM8ug5QUp/CDr75AFUCT++yOsvs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7Z98G7nWfKXlYg2gNCIQMwgRzHPZzJbxVnJ
 z1q/ZSkHjaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1fEZB/4tvPMVzx1O9X5hVg4SC8qKvMxE3IAdsH/tCrsqATAl0+wRT2TyB9Hn7GAeWvGOctHu3iH
 Wz1nzZlcEEGfMaeWu5SwWMpltRfuQ30OmP73iSkLDJIyDkaYgNS18F1gFf+O6ny0yTUySKvTrcD
 yyXDgiHMM2btCQT/nwRoSHoTn9L8puSf+qIsWNnwNXcYhQ//We6KROhs35aw/OlL/hwOSrlP/S/
 5HwYUn/Y4mmzJ5Htk1E8M+w9R1szu/pRNZ3IJKY3GuKUB9KSiWfh873JV70NTtpLblRXY42mIM+
 v4EhUqx2idwTvvn1tfM66om+MAtEwG9gtY9dLCdkm/h9l9Pv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c5eea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JZG1H6jYz0umZupwJd8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: n0m3-YrgO8SyjXvZaYHeEB9rpsUNTh7i
X-Proofpoint-ORIG-GUID: n0m3-YrgO8SyjXvZaYHeEB9rpsUNTh7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX4wBBhjpr2s3N
 a38TfwhL27H+dVBPTfukMvAvKyOsUK8z0sHdVWuuowG24Xbp2DrDwX3z/kHuar9a+2/wsh20ZZs
 JmzTvEtdzOee0GTbyhL/41FId1xTQCJ94tgeueVb9QUPVrT/y5escz75MgEV/73mEO/jPMK1Vir
 T7HqIJG9lrdLTB2zU/K89fuzCGjgH6KtdkZdFEDST/RpIRUkm/gzwNagUlxCcgswFeS1r1+JD4d
 JXbFIbhQrZiuN849t43I56SCuskT6XIU06cPCvvLUcSWvjewUNLMGu6pZewfAtVYPqpLK10yG0s
 vkv6r9BRpz2+wjyoQFqT5euzRr9act8mV5AC7D+oDdUtxarrDah1Zhk6Mmbkn18QzkdkoHo50jZ
 C3gjin8vB0KR4iaQRBGQ8xx1fE7T02U4twsCCBRi7IzuXnMEjDLPbr/teUIDhLpG46DZcjYNTnA
 Vlo1pI/WSLA8LUoIvKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007

The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
voltages over internal rails. Implement support for using powersequencer
for this family of ATH10k devices in addition to using regulators.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 54 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/snoc.h |  2 ++
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b3f6424c17d3..3600c8eb19a3 100644
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
@@ -1762,7 +1779,38 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
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


