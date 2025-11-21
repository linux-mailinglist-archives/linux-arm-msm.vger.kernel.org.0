Return-Path: <linux-arm-msm+bounces-82766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB16C77499
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 05:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D511E4E774E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 04:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFAC2F360C;
	Fri, 21 Nov 2025 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX0ikQWm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTbJtVeH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF002F25F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763700233; cv=none; b=sQHbEutpfbhYZfTgHBJacTr2teWZ8ZS70mzDhyIGY5jpbLoarAphy+ax2dpMmoHDfHgYBkwDaTgwwoYx7fVg4FZ8AM+iqhqUPVnoDgozNyvg4tfKw1WUJZP6j0q3573vX+SmQiNcdkZVjHCEM4saSyT4B6XQNC/gCwlLPHH0l6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763700233; c=relaxed/simple;
	bh=pnSQRgTAcT4d/8xmiBgrRJu6er1Xy3AhKk+QhB5IefA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQUYOmdODbeaYbNVJQQctCfxWYoo8mruUO2p7ApYYWYuajwIRgT3fJ5YUbiidRWybJ3uSHDSGR02FvOmXjDxF4O9u3S9zijCTDGbjYwbX9XTg1Cfz30k3jbFzjAMKlYfbsvuya+eB/o4/dEOOjR9oSM7czR1PL1/9yg28OXLZSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX0ikQWm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTbJtVeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKKAYBE1337448
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=; b=CX0ikQWmCtFPHrIx
	Vzs3qCg4JDATVRF/RkD9HqU597qyeELPS615nyUReo62/4YHTk6oe3ENZLmGVzMS
	BnyLTsxlhgA4d0VwnWL04Gu6O5bsruJVJNk+jD18ZFaj7FWuYyJfVicrgC02IHm9
	vyKRpUneaV2DdvzNoQwCf2NeGbkGPsMTiG+2D/TKpi1gS/ms1TB7RWyBiaDd8htz
	r1TiOzpYOFsgU2yh3rBdg2kvtMfsAnQRlsLqU8QcUdAkgllT9zn4naQaxBGF8/nO
	6YzvkQjngznif3cB38QKGsvWJMVxLFf1A8hsDLoygFnS6ZLEKUnEnze0CUL7blaS
	9TI2Ew==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj5y7t1xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:43:48 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-3d1b82f5880so2647290fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 20:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763700228; x=1764305028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=;
        b=XTbJtVeHz8hGV1l1hKn2u37qn6tG9b/LNEVF8CYIodRYGc43PoPAUZkuMGeCvNcFGD
         u0jVNbWmPXyU2jvHG5pb5Mr4id1aiteVxdq51e8z9CijqlwxAL5zgybHjXTf5qgqNQ1d
         t25RfBItSwcM1t1XTZjXLFehFBZ7a4wAJLxEuAlZ4n2H31ZLvCiX26/Zzhk1xyllocBS
         qQv80zECSEikfWdn33WWOimS/la4Cpk48j6rbuauE40s4s+369FT1LE4cDgii8kMxPwa
         UXla6GCsZ69AjvEI6UQ/RemIqA8Q2XGlm+Le63pFkcXpuloc/istRDG1yijf6CgKlbKa
         Wk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763700228; x=1764305028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFkqrJMXLTrSpGrWLHnZ1o+c2GoxdqOgiKNQ4mPlB8M=;
        b=mg2C9pmq6CXt3fOm9AvHBJ/75CbWpdo46RAkpRCs2Cu3E1GT3nZkfLrZaYLCfVmRUc
         vnFXnftbVsl10bheHypFzQZcNNUq3EHAQPncj8BfZ4+ySsVAmPx/D4Qj6rYcq+8C8D3G
         tE6bwh9GbcUZBRHTa0So4MUvFR7MzCNkVkfHQBB7+9RRJfLgIHqIcjSfxqZ0vEpl8CLw
         TZnlfleCCr3aGTSh43HcL45LF+aIi2zDJtp+b5v/KY7BtzibCcUZsRJBhIxI7iaOIM8/
         e2m9yBolKDmuY3xGnAFL+urVOKlgNi7CQ0Bt9rcw6GDX+PNqVytAQg7po7FCdsW6hxIA
         Zhrw==
X-Gm-Message-State: AOJu0YyGJnE6GOFxV3roGamWitivZjGP6g8J5E0mujBMH/0QaX08652w
	3Ft5mA/KmIjfH/fNwo1zTO8BSpOUTo23lZB8XklD8CJHO0+5poBUkqiobHjhys6wXDkXdbakugC
	i4CfZjs4ulfnjXk2H8eJX9n0ihKLmWxEoLfQ1VPpt3E3uyfg729QpHLQbq+FjyO1Sfb6n
X-Gm-Gg: ASbGnctfIRCwK378R6vaolEWThNaPQxy0vOMyrT4m6v6YW2RYNOZMUgyX8xiTV0K2lR
	lpbqyX9tPD+ad2WMDjRB6QqzQnRVpwtQUhJ8xsuqLvMafQG23e8zATT6Wb60wGK4Q8RQlJwajLs
	o7AtYKYo+r2KPYgZ92sb2Mzmwr/39XQb0+JmYtCL7BRB00mF+rOooPxpMbVg4hMHdBPdKMR90M5
	4aiU92ko4N/cBuwn0pZaDgIDhuUJRXDTMy/POw3EGgkDbopc23EmB39gwI6KtHYjTb2KjDyZc5Z
	1uYk0xv2z3LTeblcBbzvSQQXC/f+0akbWbQM4YIJTk+WHVrP0ex8USbaqVsQfDsIMNy1KOtS7lD
	1A2mLDXRc7ndy3GYQ3b3r3AzEmnNmUeS79c9QaxTshkehDhWZW6WR2Hne5jBp+Rqm
X-Received: by 2002:a05:6870:96a3:b0:3e8:54bc:3801 with SMTP id 586e51a60fabf-3ecbbdc0bfamr536182fac.17.1763700227740;
        Thu, 20 Nov 2025 20:43:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnxa9SAvOiXcnOMGGSYQgKH+ShYhcqGkoUVTldgZ5FD4Dk6DHFDxLeHHZtksWbQ8Gu4lwvNg==
X-Received: by 2002:a05:6870:96a3:b0:3e8:54bc:3801 with SMTP id 586e51a60fabf-3ecbbdc0bfamr536166fac.17.1763700227398;
        Thu, 20 Nov 2025 20:43:47 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ec9dc2185dsm2198927fac.13.2025.11.20.20.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 20:43:46 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 20:43:14 -0800
Subject: [PATCH v7 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-add-support-for-camss-on-kaanapali-v7-2-de27f9a67ce6@oss.qualcomm.com>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
In-Reply-To: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=QMxlhwLL c=1 sm=1 tr=0 ts=691fee04 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: puMdhjYkRU9ll2YVE5Q5BXved0ik6RTQ
X-Proofpoint-ORIG-GUID: puMdhjYkRU9ll2YVE5Q5BXved0ik6RTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAzNCBTYWx0ZWRfX/EBNoROXFgi8
 hKRP+VkbRT6idBnEfm8DY9Ta7p5KgGyj/EWiLYXKVXQFmOCVGuAAIuOyZm9T0+N2XPq0tx7ChT9
 8JDjsGbKcfcaT2sjfTGGQcFrjQN8B7gR6gBd6sfZ5FnRv199lHhH5LWLqzavK/rKQjBmzoJjX1u
 EIStO0mDFlNb8y/EJrkOV39rHErO4uy1U0zYL4hYUTy+O0MZwYRQtj/g5atBotjU1m9/fFIFAHv
 hM+4pN7YkgdnAXdUqqpWf6Dg3qKTm+Q8SApoq+1V7TVD1XhFOb/b8K36OMTubrm23DgteXs/y7+
 TwE+kfMbFJaVnAbZsL80nLSaK2Li6ukrV6nMWp6cOVaGE3P9LynfebAu/xLQQC9wUmcqcNt907A
 s0HAKk+W8i2xO21ejRD16iRCtxiMbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210034

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..658d9c9183d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 901f84efaf7d..876cd2a64cbe 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -90,6 +90,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


