Return-Path: <linux-arm-msm+bounces-71086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED81B3983C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBB0D46593E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D8A2ED866;
	Thu, 28 Aug 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQFP8bLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1F92EBB87
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756373253; cv=none; b=dAjYXVx0lPSW07m8YIpIIJlamUzbHPRJ5b10pD9opS+R547Yca1NlobFhl8M++NuZodmkg3TqHXJ07s63obD9VjYp/MrU06dB26Q0/Cs6jmVCJvzpgKlV5ImI2Xtknp5nL5bLtIfPWzYQeoCcpcsZTxwmA7oKy8fJiats3wDmv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756373253; c=relaxed/simple;
	bh=o+5/ACwsPDXaRMmwhSug61zH+Sv2mKJhHu/g8cXlGAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULk0B16QHnK61c8EqlamNX5F2ExcQVxfLcNKqMNjzWeNW0wrLypnQ4Lav/QsaxxQnNvCEPi6ZuoxvfTFMb5PuNwRLi3y6IpjucNtInysMRNaa8detAhX64dV0C61vaQ1zJA1S0hxZjzB28JCSXON+JQees9aTR07dd9zZCE4Xpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQFP8bLY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S51TEk029322
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nH0EHtfD2ZZRvR66YNRJIcjAqr2g05k6ZjcI9rf+mU0=; b=YQFP8bLYJBGUVngI
	78UxXhY31q1WO2r7e3T0XvbzBxIs3KkSOM7u099IAoY2SG59NJmX0GYSyHp9yEHl
	gAyaTPAPjk7BxTtQ0+dpK7JDlnbsv+Efom+keJcj3UMoKjL4SWeBbbtc8hgefd/Z
	aDAGkU4CY4EwpCBOfWA7U9xg1Pa8Xdxvz1dFawYUYnIi5MKwx921TtX3XFfJquww
	/cCJUQPPqad5zKHpsPFGqNpDA4DFJBqgfqAaDYavnDIHKFWDuuJTtwhZqTP0D0Fz
	jQ+CBC7qRz1yIHSWyTYqhozdOjzZxihHUyJIl1S/8UVPiiHaSF/c5XkSrQVCu/WL
	tWjcKA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2yvja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47174c65b0so1207978a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 02:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373250; x=1756978050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nH0EHtfD2ZZRvR66YNRJIcjAqr2g05k6ZjcI9rf+mU0=;
        b=jGSOq0Q2aPxdxtLR8VDqALzvA3FDtw7qDXxjaRhetpuoBEbkynBy+DDLlw7CwnCKnv
         1spYkDQvTKs1eS5rTAREODCDd3uiWaA6Sin02S4Mn/7LiHdt+EBwtCGs277HRREf9uNU
         73k5uFfbiyj1LSGphae7xvYr1tvD0A7u5lGGsAuMn0SqOaMgPF627aMXp+oNgKhjHMns
         0zrAaNcfTk/60FP7JJCMnyaFVrJBZEc8tFx+LG/qqPkDksADvyLbOHUvJsFlgaB2h3C8
         EfT+EZI95sJzPCyIHrY1oPdoTHf8xJcGrBo4LYE0QUCXlgieaBjwrCg1UhJvAdZU/MJe
         5Hfw==
X-Forwarded-Encrypted: i=1; AJvYcCX5BZeZAJWt7gOd4ufTnht0Fx8EP4hOtu6YfGWtejO6/6Ncn6NdYznayYAT8mj7Ufg2ioI1sxLtP1Zvz+Yo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4AyHwuhQXpaw1sWY40cu5hVnIawYMHP5QkIv/e+Eus1jzYQgb
	teCh0n0M8YxmQduLULtRvdMLeLNR5qQKfhS5+TbvG1jccj4sf9IzW3Kui2ALk6bJrWQ9BTp64h7
	1ySU/Ws5rLVIaFWXe0sOxUnpvMTPXbf8rTJqv/NqixXwcpVNJHZQRsdReEtHbkPGL0HIq
X-Gm-Gg: ASbGncsf8eHSdO+HiPC9RSAJG2hAITJxGG+wi9rsQoAJvZjirNpi6EFd/Weqzysok5I
	QtSqYnwZT5+cp/oEvjvVz9ScTKDZFbguWJlmYMm8uThVyf7aaK0mNbx+SWPk60aYutsLXWmljLS
	xfHb6k7cMojVTJXolYPURpfdWwLvTWB/67LnzsBeXtw8mCcpfOmS+iaH6i8xgEqmzYahr782Rr0
	928Bd75FjcSg2WZa3VYjD2lZzlr7EqRv715elmv4XYclTSbZC8qV9GcoLVD8KWofAJhRU/tHUr0
	CIcvV4sBYZFKGpDwfgkB/2rX4hCBjyWvq06Z7E49RAYCFd2oW9NLoLZ4Xr9cMVdOKAKtR7m4T3Z
	lLUR43hg9xs9kWpKn8IFyeQ==
X-Received: by 2002:a17:903:1a45:b0:246:ddd6:f8b9 with SMTP id d9443c01a7336-246ddd6fd04mr189901185ad.43.1756373250452;
        Thu, 28 Aug 2025 02:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRirl59ZqqwBenKh4YDCdNyXYQIOlCFbUMVk8c1xq8SkxEO/1u301M1/+O5byXT8KqSPmPOQ==
X-Received: by 2002:a17:903:1a45:b0:246:ddd6:f8b9 with SMTP id d9443c01a7336-246ddd6fd04mr189900935ad.43.1756373250023;
        Thu, 28 Aug 2025 02:27:30 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm92497015ad.136.2025.08.28.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:27:29 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 02:27:24 -0700
Subject: [PATCH v3 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-itnoc-v3-3-f1b55dea7a27@oss.qualcomm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
In-Reply-To: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756373245; l=1698;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=o+5/ACwsPDXaRMmwhSug61zH+Sv2mKJhHu/g8cXlGAs=;
 b=ilhqjytLS638zwMPR8kFJ/BYFsh+0ivhmo7Xklxsa8n4A7l49eb/ttMdW9+Ms3EmE4w7v4fuG
 ep3zeVkPCiaAko6vEjW7vzVFmKwBjdMqQjwMaWGaHyNIzMJygusBs0P
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b02103 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qearADheJa7ujHrKWl4A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6qUFGTjJwhhl
 S0byhj8NhfV0RHO8tx0eP224ZX0gYhDsmlPu+ukYZMdML+D4AlHvZJLee/iDA0caH8gxCdPmeeK
 GbKv+c095BFYcINDoYlRcEAY2iM8pCgXTHgQfhgC4k3bmbW4Kfa+/pLalknxkPF9eedXqbN2dHx
 NSVvZrKIUbUzOb+X+BbakWVBz6UZ1Kx/C0/rObaX1UNihkzFU29ks+XhDgSwbyQj9CPIu0PFG8X
 E5TnLJJ3EmsYIPtLKyAOdATwL9TvUiMp0SKZopIFS8hfzezffzrnTk/JbDwpVQeFXcwfu1or9YE
 tl4Q3ZC9Hm8+sA/W7GdZzph1bc/T2ax57ZULrKHC7WXK98m//O+hPDsbd9sa2Pr5FhXr4jEcsOO
 +bK5mJHT
X-Proofpoint-GUID: CdX3HjNLwP04d5nmmPWDZ5BEFXap9oMA
X-Proofpoint-ORIG-GUID: CdX3HjNLwP04d5nmmPWDZ5BEFXap9oMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

This patch adds runtime power management support for platform-based
CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
resume callbacks to manage the APB clock (`pclk`) during device runtime
transitions.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index ca96c3e66d683d6c1d1215b1b48d2f7b7f58d5b0..b744354b47c861370a247e1a6ce88563aa01c4aa 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -300,6 +300,28 @@ static void itnoc_remove(struct platform_device *pdev)
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
@@ -313,6 +335,7 @@ static struct platform_driver itnoc_driver = {
 		.name = "coresight-itnoc",
 		.of_match_table = itnoc_of_match,
 		.suppress_bind_attrs = true,
+		.pm = &itnoc_dev_pm_ops,
 	},
 };
 

-- 
2.34.1


