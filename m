Return-Path: <linux-arm-msm+bounces-82935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D02A6C7C781
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 06:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A15354E2BE2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 05:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1CB2857C1;
	Sat, 22 Nov 2025 05:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dc3TXP21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThYE3Vsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA0C2C21F1
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787689; cv=none; b=pmz8wpshjHJwPbznf6wxHHrmy+7FR5UDDrX0stFzAupe1i20G1Ky7k0oH3n9wmXIM2cEeRiwmbJmfJQu0olUVo8yoer8+RzdbUEW2bEWpZ1+5fEcDvhExGDbe9U1eOA9I+V9dNJl6jkLKpmhpmv3uu/N7HwBJaTACb2we2UyciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787689; c=relaxed/simple;
	bh=LhJuKA2MQMHo9RRWRHBlEbIB6tUr7IjpiYBDNYGMC8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tQQ70Y2GWn2WaBI7A3CvY6iNz4+jW42M8hifpNZUJJmX7cnYKkIRK2SCgWwjid0Fbben1sWvWM9POzicq39RYYdWi4/+qN9g6XPNB2txo3iyZ3nXvwxXbHPH+o2SQhCjlCk14zWOktGZ2iIRMg4TICO7QcvubS3QmIH5dWGoaRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dc3TXP21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThYE3Vsg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4ZWu71762131
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ba/8yXeN/Cp
	a8rrPju5CylcOxI0VUEDX1A3sMcUJl3s=; b=Dc3TXP21NbkyvgV+PkzEpPOOK5n
	ecjVxDk2J7irzED2nzofIBlVuFNetNI8hqGdBDK8WilN4ROdz25F5RTJ7LCXpnmi
	UHm93cuZCdsG1U+gGi6UjiSGYZDRxzHSRdr/R5VUkUVtf6pwCFgBsNFwwunXR0mg
	BDpRT1vPRycwFrRkmvYjlRmTvYhlOMsIoydM3xkgRQ+oLzzMADOWd3OR28PC4Z4Y
	qIwD/i4vudY42v25U7IRTIc66DZiMCaZE0I1Y/kA/WU4pQVdnbAA3Gyv0Fv9Ic7F
	+kjidklRtR5kPoID2AxCa2NvLKA2zplic3MhAdbpi7PjmTFyzNlgC7iHr0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak691g1em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2982b47ce35so29721505ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787686; x=1764392486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba/8yXeN/Cpa8rrPju5CylcOxI0VUEDX1A3sMcUJl3s=;
        b=ThYE3Vsgt00g3fOgYyYqbWEZDMM6W5+pLl7uUwzf6RnjbBm0UbA7v0AOBk5gYu0Esm
         lH+VKHM4asWk3BsnWDqFjzFoq4jCIjhsVgxEYNYz2pObR6ySkL7wlXw2FhtTH7+b+g5o
         4/Z5v/C25QK1YIAqn1LP99iMxfQfGqGXWWx8s337Ha2+MTz/1KSjqJJbOYh05ki2b1SP
         EpgP5oySQUzM3dd9AHi8nkW7np/Jtvwf0f0O5mKywCkmg7M/7g/y0UQowwDLZjtGCP7F
         kO70vnCvFy2QSTLlZo8+0+LVy+hFjhlXOngsJfO1fN9x/Fjt5x+PuqHmo3j/wafXVFMf
         XZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787686; x=1764392486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ba/8yXeN/Cpa8rrPju5CylcOxI0VUEDX1A3sMcUJl3s=;
        b=Qp/g+sPxkDOda5D1rxQyO0HvGCahXDzedZh+aV4d2PVDxS0aeVFM9JCuUmcIKqShIH
         FqfhOoRSXS4eB9gh5Y43qIF/jFph7qDwIF7Uw10JX19r4BO25L9ZCuy17evkcIcrul0Z
         llFNEwcGj+QMxfzMm+Cv5nsQREUcRMD+agd1kT+grSb0yze0hKu3z4OMqNA3KhRpHmIc
         GNErfL0hbbmX35rde9nwzXnmcbPd//dDSSLkUnq/tGA9U+uKCgxZyzqLsL8drUlNxPaE
         HcvW/ORbGnuDP2evNSfA/poONsSW1Wtdn75BUel4LdEGYENWqJ1KP3Xw4jCg6zAYtqeY
         47HA==
X-Forwarded-Encrypted: i=1; AJvYcCVBnKTge6LRT6VZKlKCCfahHabEggdERl+mElUvJ7pDT9N4eQZ9o5cYURwU6mwiN/qSKMXITBC36QL+6wuP@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqAsIRTmZNA0qCO1WEQsRJ6tyFvBHsUiKJJA6GCm9l8M1YRYT
	iN4Qzql8zuhL5z/RKd3CnzOMMRsoQeAeqbF4e567NfKBnRHGrlKakvnolVUcvc9A7xHERZSZNen
	x4+TmRYGw6hNPMs7Es4q30JTfboF+v5/Z7vGKPgXwVcn+8UwVTcxbxiT/aHI8lcFgd/uV
X-Gm-Gg: ASbGncuUmnEimWK0l2MDuEZ4GGkmV2ZyIvySAUFYr29OB9VvI3sv2ffPkp1rOrHhWr2
	4N2dJmpCMt5nGyMzlOC17FXxGw5UyoXahXNL14BIPA8cV+T+NcKg9t07jb1SAXyE+2ljyBaB3up
	jtHKJs0mS3DlmW1Yw7Hwmz0s+G59Jk1IB8B72W/yN93WFoXPc26eOv4UC+TR/OgUky8i1SeEBhw
	Cy1QGdBKIGtuYYMKxm0l/DSZdxAnoLx+XgSQXNST9d3dso33JmyvFL2IbCpBXIbWH7jkV/yyce9
	nyLtpB9xb/QI7dZbSMutwPz1SyxJ4zxan6TEvqYfCmIpyUJxRkTyEAJhwyovVJNDnILIOZlohvL
	HvUmjAHJgzNflFgrrwBtCu1Vb4thEHCSpfLnF5Re9YyA=
X-Received: by 2002:a17:902:ce01:b0:295:557e:746a with SMTP id d9443c01a7336-29b6c3e375emr51588085ad.13.1763787686046;
        Fri, 21 Nov 2025 21:01:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZw33E42wJRtTKCTlFWOeZ0uPYN+DHueMghEVprymvWra29Qgc2v3IJ4BH37QAlsCh9kk2lA==
X-Received: by 2002:a17:902:ce01:b0:295:557e:746a with SMTP id d9443c01a7336-29b6c3e375emr51587825ad.13.1763787685517;
        Fri, 21 Nov 2025 21:01:25 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:25 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: [PATCH v1 08/12] i2c: qcom-geni: Isolate serial engine setup
Date: Sat, 22 Nov 2025 10:30:14 +0530
Message-Id: <20251122050018.283669-9-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Be3VE7t2 c=1 sm=1 tr=0 ts=692143a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eRlIPBYRqdTMzyAxtVEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Awad6ijZt8kTsqb1DnbJ1pBt5yYwy1Zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfXxCnu1yKy/BEX
 oyLfqOFsQqG+GViUdzzbCjdkTxGXu37xPd1z71hu1IUJ9kD81Jv/JVWLAWP2wfYMFOIT7wP8YhU
 IobsAuzzdDLCGeAKQERYslcMxAllYYlnbB1/0bo2+V0IYIkk74sINTUddtp3ciYfUMB+H9r7Z1m
 /RLoLenbGC23d5Ek2HmIaxLgWZzJDtjEUYc7JISzNXnll1LKs0Id+WZEP9aytR0ldCu6Zf2rTLz
 BFFyDhRcUc4DPjBF4yXKgzNqWrTE6PUYStXlq4TtZKob9r4l3Jdh8gfo4TaGwiwbDDerny5hneq
 lciz9VU2H13xugjhs4Bd+bSFpTL7cRI1sMVqROTX3rcV2jgDzk0EKW+fXBE93fzEoBU0bQcoakY
 n0OAO8ACrZ3+shoAMdJmeCpJGnnutg==
X-Proofpoint-GUID: Awad6ijZt8kTsqb1DnbJ1pBt5yYwy1Zd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511220037

Move serial engine configuration from probe to geni_i2c_init().

Relocating the serial engine setup to a dedicated initialization function
enhances code clarity and simplifies future modifications.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 148 ++++++++++++++---------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3a04016db2c3..4111afe2713e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -976,10 +976,75 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_init(struct geni_i2c_dev *gi2c)
+{
+	const struct geni_i2c_desc *desc = NULL;
+	u32 proto, tx_depth;
+	bool fifo_disable;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
+		return ret;
+	}
+
+	proto = geni_se_read_proto(&gi2c->se);
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
+		if (ret) {
+			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
+			goto err;
+		}
+	} else if (proto != GENI_SE_I2C) {
+		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
+		goto err;
+	}
+
+	desc = device_get_match_data(gi2c->se.dev);
+	if (desc && desc->no_dma_support)
+		fifo_disable = false;
+	else
+		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+
+	if (fifo_disable) {
+		/* FIFO is disabled, so we can only use GPI DMA */
+		gi2c->gpi_mode = true;
+		ret = setup_gpi_dma(gi2c);
+		if (ret)
+			goto err;
+
+		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
+	} else {
+		gi2c->gpi_mode = false;
+		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+
+		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
+		if (!tx_depth && desc)
+			tx_depth = desc->tx_fifo_depth;
+
+		if (!tx_depth) {
+			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
+					    "Invalid TX FIFO depth\n");
+			goto err;
+		}
+
+		gi2c->tx_wm = tx_depth - 1;
+		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
+		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
+				       PACKING_BYTES_PW, true, true, true);
+
+		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+	}
+
+err:
+	pm_runtime_put(gi2c->se.dev);
+	return ret;
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
-	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
 	const struct geni_i2c_desc *desc = NULL;
@@ -1059,79 +1124,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning on resources\n");
-		goto err_clk;
-	}
-	proto = geni_se_read_proto(&gi2c->se);
-	if (proto == GENI_SE_INVALID_PROTO) {
-		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
-		if (ret) {
-			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
-			goto err_resources;
-		}
-	} else if (proto != GENI_SE_I2C) {
-		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
-		goto err_resources;
-	}
-
-	if (desc && desc->no_dma_support)
-		fifo_disable = false;
-	else
-		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
-
-	if (fifo_disable) {
-		/* FIFO is disabled, so we can only use GPI DMA */
-		gi2c->gpi_mode = true;
-		ret = setup_gpi_dma(gi2c);
-		if (ret)
-			goto err_resources;
-
-		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
-	} else {
-		gi2c->gpi_mode = false;
-		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
-
-		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
-
-		if (!tx_depth) {
-			ret = dev_err_probe(dev, -EINVAL,
-					    "Invalid TX FIFO depth\n");
-			goto err_resources;
-		}
-
-		gi2c->tx_wm = tx_depth - 1;
-		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
-		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
-				       PACKING_BYTES_PW, true, true, true);
-
-		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
-	}
-
-	clk_disable_unprepare(gi2c->core_clk);
-	ret = geni_se_resources_off(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning off resources\n");
-		goto err_dma;
-	}
-
-	ret = geni_icc_disable(&gi2c->se);
-	if (ret)
-		goto err_dma;
-
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
 	pm_runtime_enable(gi2c->se.dev);
 
+	ret =  geni_i2c_init(gi2c);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "I2C init failed :%d\n", ret);
+		pm_runtime_disable(gi2c->se.dev);
+		goto err_dma;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
@@ -1143,13 +1148,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	return ret;
 
-err_resources:
-	geni_se_resources_off(&gi2c->se);
-err_clk:
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return ret;
-
 err_dma:
 	release_gpi_dma(gi2c);
 
-- 
2.34.1


