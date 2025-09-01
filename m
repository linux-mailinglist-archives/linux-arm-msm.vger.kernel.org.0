Return-Path: <linux-arm-msm+bounces-71355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24604B3DA71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 08:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91DC0165BB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 06:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8927F26562D;
	Mon,  1 Sep 2025 06:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeEv75nd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F105D25A2B5
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709906; cv=none; b=DhxqcS3SoSKcEwaqZSAEYr0AYPlVzT/YJxYnUN3zMC/SFrfHbV5w+Xdw1jAeA54beCjdUu56ExLSESMli1EX+Pr3ZDZ5gp2HiszN1P4LhuZVP8ZjLYFhx2MNBwB8JQBKD1OsP3nLO6uonxpBtM/DPw/F9qsUb4hbKWUGuLpYiVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709906; c=relaxed/simple;
	bh=ZRqDRcqJUID9wiPQfpPR1WcEMamloLO0sgtrKILAjZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q0i5tYa247YpNehVvFK2UX82lID5wVYqnrgU4GFmnqTc8pQAbZpx60G1vGnuDy4zscGIqx7eySXSeHvvKRo899yQcPjoA8aKrPUB7wiEEcDna94enWgvuQ83KNhdZYE6KyrzGHNpp6cVnTH9GbFea6i2Ut/4Si8+sFf5Pqvi3E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeEv75nd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VLvUAH011187
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 06:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLb5zfab531NYNRygT00FTgQk+urSL3aIgF+0s6ontE=; b=ZeEv75ndWYIPIdcP
	E/agYXZZYbvSkBnqiy3jcU84FG7VMCBsQKJFYt8MNzQwwpihzNg9H6xY7BR4iw0u
	T4Z5SUqoNwWOe29K5lY1aAl+Q6m47dIj5rxBe7zalIKdMDbkyNwYuG7rw3MWkx43
	/zFSQOB85IUlDL/4y0In1YFKTHkb3quSrOLZY6z3NhIWzVxKA5Kg3cyOF9PAgu53
	X51Rh5bIuX6cIBcJSIDMj0mGI+k8EyXgSL+U3r0jkwTX4Rj0Bd8hjym64mqlPUyb
	Qow1Gyb91VuNGM42Q3jKeXmzpyvipTJjCF58qfo/qQBV+bECK10ZAeDZRWbVUuy0
	y3lgrA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuuky8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 06:58:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4d48818a04so2044221a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 23:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709902; x=1757314702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLb5zfab531NYNRygT00FTgQk+urSL3aIgF+0s6ontE=;
        b=RS5yExB4rV6Z2pVN1oJADJYHmUEufryc6FJwaYZKlhOa6YP3nVgsPFjfOMpbYwHwn9
         9Xt38HfYF+hCe38YGvN4u7UTjsJFn0EhpqYxAY6O8Q7ddQaxwb6Z+/XTJztEOf2htoFL
         oTt7u2JbNF3FlAoBZ/4FaJC74Ov62uiOih5S0mfwNopcPwiUG/m0svN440kVY+J/U81k
         qfmNjG3IGzvajS7swJgsi35xrPCBSN+cPtOnHqViFLH+LauKbsL2CIdzEd2V+N3BwiOR
         0U0NqylXC/PVMD3M7molevANLHwTv2uJoBMRZ1ONA1pkOb/gPcQX8PfSxCR0mgmEgkG4
         51Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVkoOxskdXghGoYopnj2VnF2cM4xjrsieSU3b3AIwdTc6EGxNvoEkTZ9QoJQUfUhts+enjfC8TmdohUWczI@vger.kernel.org
X-Gm-Message-State: AOJu0YwNrIDObAbeb/ehBVeM7csawvdTledmNiwxfM667CfCL/bWQYIS
	6KItlN7i6EXuxmq2g4A7PLXIUmsmpjIa15QUYbvftZuR4QZYdnFT2OdhtDstbXzHqjdu3UIDbOf
	XxuMLAY7RIOBYCtns29v7n/XE8EeSGtWxSeXxBxpP7JbhcWcq+/FT1N85UyrtKmlP6DyKs9xe0V
	Y2Clo=
X-Gm-Gg: ASbGncskkIPiQ/PUYQrnBAt5x07mil8H8CYuCK01BJPMZc0WAyYrp1rv/0u+l9R6eXt
	5FH1FPkYlKjhz4MCU6VXm5+RgdOwb4D0wafE5ZjkbP174xs1is+IufJwzOU7iMqCcPsPK7ThNyh
	a9Ti8pdglUVcQ+JNdZDgi4V0GWBVYhfVT7AuOYEANXrX6LcGIybiN6ONE3l1yGZ3leTkDbhvd7b
	e5UFXTIf+mAIVz0ZJ2Nb9AN9txAW6DJY5ZnqbpEuDhjajwZkOWAsSWbhT0R5vyJmtg1UH6LR7b4
	1K67zROnroFhw9UxUOTJ5+1X/KMur+7o16dQ1F0IvwsEPHOuzz8hEdSz8210QVK5cIFsUOJtz4b
	t597UuLwS87fwXHjnI2r7zw==
X-Received: by 2002:a05:6a20:42a3:b0:243:755:58b0 with SMTP id adf61e73a8af0-243d6f3b622mr9331540637.49.1756709902486;
        Sun, 31 Aug 2025 23:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHanZiPxSU1v9cAUvVnD8utRjYhNL8IT8UfQ2s9CDwfXiE+kciYJzMhomhFdanaIJbCuctfPA==
X-Received: by 2002:a05:6a20:42a3:b0:243:755:58b0 with SMTP id adf61e73a8af0-243d6f3b622mr9331519637.49.1756709902058;
        Sun, 31 Aug 2025 23:58:22 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm8559358a12.51.2025.08.31.23.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:58:21 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Sun, 31 Aug 2025 23:58:15 -0700
Subject: [PATCH v4 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-itnoc-v4-3-f0fb0ef822a5@oss.qualcomm.com>
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
In-Reply-To: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756709897; l=1698;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ZRqDRcqJUID9wiPQfpPR1WcEMamloLO0sgtrKILAjZ4=;
 b=RoLU+Iza7O5TpoVvMZwc23uQWSolFpj4SfzRxppOcKkPY6mZ4URDE1xbKH8DIs3/Ssnphy84n
 Npq7139DM2lCGohtCNFwcX+JVdamp1E/bBCAR9t71gZwSWk7If4/s7j
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX/KFisMJ8ikd8
 JZh3aSY0sLvnkiGOA7eZg920Gzsf1bP2iCaODFXETwSr5rdL11oFf+NwaPR/a4aTHK3BsgNEVVU
 A0SktHWax1BAlOuNXAlG5l45QbzDYL+hSZhTJmHyolNDn0N8YZ3GtOG9jU2rhhmVHsaqxCYpXU7
 yn3H2DRPPpQqFrE57Nnk/HhctoddgZkiKTfR4uYKv8C7Y5PQ6vt4HicwBaFajCfzGHrGyZw9M8j
 XkZ86FrlMkajUubmkHEJKkTMvqgih13t1bpRFoxtFmB8nYR7fZ1pPhj7cHr+XlWDt4FkNJN0MZq
 742EvKP2q/VX66eg6PiQe/MrfP0/Ezxsil3cUIFwnsGU7cIMyj60TtyPa/7LIhTNa+WNjsQ7Eu/
 eviOjyTa
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b5440f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qearADheJa7ujHrKWl4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: DuGQXhoQM5iN5gtUJZV-jBXm_79hTAOM
X-Proofpoint-GUID: DuGQXhoQM5iN5gtUJZV-jBXm_79hTAOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

This patch adds runtime power management support for platform-based
CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
resume callbacks to manage the APB clock (`pclk`) during device runtime
transitions.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 5be882300d79bc0173aa6a19d7da1d48c4aaca9c..2c5370497076536bfa868f0d80db775ef242968b 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -301,6 +301,28 @@ static void itnoc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+#ifdef CONFIG_PM
+static int itnoc_runtime_suspend(struct device *dev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(drvdata->pclk);
+
+	return 0;
+}
+
+static int itnoc_runtime_resume(struct device *dev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(drvdata->pclk);
+}
+#endif
+
+static const struct dev_pm_ops itnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+};
+
 static const struct of_device_id itnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
 	{}
@@ -314,6 +336,7 @@ static struct platform_driver itnoc_driver = {
 		.name = "coresight-itnoc",
 		.of_match_table = itnoc_of_match,
 		.suppress_bind_attrs = true,
+		.pm = &itnoc_dev_pm_ops,
 	},
 };
 

-- 
2.34.1


