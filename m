Return-Path: <linux-arm-msm+bounces-88526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D452FD12074
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F529309D422
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6361834D4E1;
	Mon, 12 Jan 2026 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Deh3uicR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKlPxZVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44FA34C128
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214915; cv=none; b=FBVmXFkgPXuHZA8ao4nOjV4qmu97q3vvtqJboNCxBziu07Pw5H6nWrxUIqB5uwx7qChBl4hBmVkX43ATmYjyTiPp4us8+oIouOff4HY1soEeQtVzv/qrA2e3ELo/v0bJSmPJA8s3sJ4oI4hRAlrM/vBUnCSfigrKvg5oeFy5Lxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214915; c=relaxed/simple;
	bh=sd+Xljnfm0clwQKZjvueg2pzkap7XowUeh/WoLCloXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rB0P52Q2bDu0/J4McsncgisS2tIbZ7QeNziNh8h5zYgsVTereJydrvP7YY9g2tgzW6D8mN+9iWiC3dxywwohK++P0wLGLVsBCc3w8uJ74+W3nkhPw4OQYKWdOdAxXAD/iVqVg+cLcqzUHX+acvElIQfmAXyPP6Zcg0vinOj5+Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Deh3uicR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKlPxZVc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7Ogne555284
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yHj7LcjuyR7
	44fhCZ9TThkC8k2+KnabV2Ku2dES356o=; b=Deh3uicRFQLSACT59v/PjKASHc9
	YfffzKQzP2PGasG56JoK6OB0DZQG9y9WQmJguogbI7S9pj9rfgjpF4CcmYDg4dRE
	A1FdAbgaNS9s+dSYqJMi+VGOgXvPh1UoGn0ICAHcpux1tFfKpnK3GBRoWyNSaLps
	+0FCAiPoL4Kap6mnAXc3m/WJPcHbVWGQUMi9964XH/bcKMTCGSET2MW9nd2xMfMB
	2LDmFEIt48+mw4v39ZtQdAqUYObKX7BLxFVmst33OP+X/7JnJlt6vLfZc4m82qt9
	hQAThmfoT2qhdrY9W3Teb0aLQu4KxfhgSEfTIt2QVYxME+Ev8IYUUcdJG9w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0p66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f5381d17dso723855b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214912; x=1768819712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHj7LcjuyR744fhCZ9TThkC8k2+KnabV2Ku2dES356o=;
        b=dKlPxZVcLpn8yNmybcMIMVr9si9fhGGLm7Tr5eOt/xSlIIXVmnnvv7aRbRtlxanutX
         VFmI8cO4xmXYPQ/+CV5KARSCNd0aNnEXQjtIj5GhToxUBljYQXNIXM6+t9yZ09j7DF9P
         Wl4fBMO/zkLPZy+gVTrIb61ao/VUaHYjxoJKE+nM5NE72NIXljS6f8qpiALABQVHMDl3
         Df1DjzpDqMzU9QLNusWcyoMRKJHVomPrNIwYejCLaagQVMZbiZwEqVJA6tbL+s/UOQJV
         U+e/64uzlQ2Uf7Hh30U/biZq6VPF41AQ8DUAciAIWitfDLkE28652AMoXqQrU+nXUsGp
         ftpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214912; x=1768819712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yHj7LcjuyR744fhCZ9TThkC8k2+KnabV2Ku2dES356o=;
        b=jvnkj3i51AsC+jZwUK3JDykWLn++rF3I68mzW7t/rnhtcgdm6edud1Nudz2BJ8Q1tN
         pvF56zs6vMa4cRoRgTRhy8/AnU/h50vvAu93YA7eOvANaXf9VBdTbCd7fimBYqPTfaCG
         CZ9WH7bxm57t7ll9vjk+u9Ii9AwM29fdqlSsdGn0QY6Z4zhql4JcADckkCkdNKSNpcKf
         Dnn79yBnQCdyLZBMx8v02A+9ki/RlrOGuTtKaQQ8kMOL090jmjL/h6Z2+PmC0YVJ85OC
         JYHmFsvsBLyR2IWPINNesfo/ySH+DNx2EAevzX3ozNcAQgvvLJf2RypSzsEnGxAnOcg1
         U7cA==
X-Forwarded-Encrypted: i=1; AJvYcCX4HDF1nHKso8OVeeSaK+omIr1YWLnZL/fPyXkC5bNqC7/eU6otp1KSeNxdRoWeCoxHTorSh4cZrWJRQ7VY@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEnRykXU4qrNSvb1vksoZpVvY2cKQF3ak5F8wP6+tUzXfudrk
	V+8oa0NTSRgxb1b+uIXdV55NqbbSPIUF9CkaVr5qDtW1BhTRLvJzj+sjTYyP30cg7S6Meed3kyh
	pyCOM1EcRiWDWE4cxpDjHpd4ZamdzweRwU17wxnItfA+AuN5hcG3moPipGHxSxlr50yWo
X-Gm-Gg: AY/fxX6Z565US4e7mBbOwIxWcmFeSw7F+ZC7JFMkUmX0e4HwPtipuvxUgPAAwkMMrHX
	sEk6646oFvKZFjiX2dSq2537NRICaGL5/OA1RAdTs/ekTvul5/C/9Qo7xb63nE23trTPXHEiQXJ
	AuSlZXksFIV2qgPfIcLCiyBSZ34Rv0g1rS/6KQY800j+JTmTzS7FgprtLVkE+L44lKefwLbmXPq
	uWYTzfMmCYAAa6+xCR6nImF8rfix9bmiIozEI4FNmF/i7HlUOcLZ4t0doQ2VBRof8pef87xM1rh
	orwXmB2MJjS94O2s/xm8l7uiGR/DTWz6LoyeAsGALqU9RG/e+y/wVZmJA4q9kS1CjvqpR1EDs1r
	omRkJu1CPbdPTQkIJejghvqaCU2jyVPBDQu9vGsp3BC8=
X-Received: by 2002:a05:6a00:ac08:b0:7e8:4471:8e4 with SMTP id d2e1a72fcca58-81b7fbc8679mr14341474b3a.69.1768214911545;
        Mon, 12 Jan 2026 02:48:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDTPGU5slDB2kB8F/ynpy1LZeQQTfK5nYm0t3d2XETK87JyZOzn4TZMieDp9ZkH04X69aC2Q==
X-Received: by 2002:a05:6a00:ac08:b0:7e8:4471:8e4 with SMTP id d2e1a72fcca58-81b7fbc8679mr14341458b3a.69.1768214910941;
        Mon, 12 Jan 2026 02:48:30 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:30 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3 09/12] i2c: qcom-geni: Move resource initialization to separate function
Date: Mon, 12 Jan 2026 16:17:19 +0530
Message-Id: <20260112104722.591521-10-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX0xnmW96OuN58
 uwN6eO1eXCpcqev81cmAsoUsuzRXShkgSgTkKJ1Ukli5vn74g/qMaBGM8ChEVoKhk7NYh+/muT+
 ztF622l9lVZlxgfj2Zrfh3L2XPGNDlBim0MEzSyKM9SyH/PqO78yNxlxXKJYQejTuu3RejmZ5Az
 AMSN6ESQQuSddW21FdKAQOc3TnmT3Ygt4epSKsT3+AmsaqaMIFbZLrdvh1XNGCR+xLuL/9I+lg5
 jHSMVX8HAewSx9b6FiaKFy0Flf6I7+go3lWz9JB+4Yo4Ukb+naXQQvjO9gij5pH/acX/mCkbFvA
 9KwsZvCfHh8NHc+JtZikgjaMYlguuzZf6Thwf0v+gNbbEaE9G3dyn8LL1Vy/eIe48UHWMCm/oRW
 M4YmIcYj4IVNOI223QFuy4ZbiBHwJsGx0Z02hE1yo1oVTbTWwjVaka8oQNU12ZcsaQqzijWE8Sw
 dR3EPzugqhh+0uvEMgw==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964d180 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V89BwkbFsXdiYDgkWuoA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: GTaPdxC2i1laRRueH_lsP9M_X0mvcW8j
X-Proofpoint-ORIG-GUID: GTaPdxC2i1laRRueH_lsP9M_X0mvcW8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085

Refactor the resource initialization in geni_i2c_probe() by introducing
a new geni_i2c_resources_init() function and utilizing the common
geni_se_resources_init() framework and clock frequency mapping, making the
probe function cleaner.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
- Updated commit text.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 58c32ffbd150..a4b13022e508 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1042,6 +1042,23 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+{
+	int ret;
+
+	ret = geni_se_resources_init(&gi2c->se);
+	if (ret)
+		return ret;
+
+	ret = geni_i2c_clk_map_idx(gi2c);
+	if (ret)
+		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
+
+	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
+				  Bps_to_icc(gi2c->clk_freq_out));
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
@@ -1061,16 +1078,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	desc = device_get_match_data(&pdev->dev);
 
-	if (desc && desc->has_core_clk) {
-		gi2c->core_clk = devm_clk_get(dev, "core");
-		if (IS_ERR(gi2c->core_clk))
-			return PTR_ERR(gi2c->core_clk);
-	}
-
-	gi2c->se.clk = devm_clk_get(dev, "se");
-	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
-		return PTR_ERR(gi2c->se.clk);
-
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
 	if (ret) {
@@ -1085,16 +1092,15 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (gi2c->irq < 0)
 		return gi2c->irq;
 
-	ret = geni_i2c_clk_map_idx(gi2c);
-	if (ret)
-		return dev_err_probe(dev, ret, "Invalid clk frequency %d Hz\n",
-				     gi2c->clk_freq_out);
-
 	gi2c->adap.algo = &geni_i2c_algo;
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
+	ret = geni_i2c_resources_init(gi2c);
+	if (ret)
+		return ret;
+
 	/* Keep interrupts disabled initially to allow for low-power modes */
 	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
 			       dev_name(dev), gi2c);
@@ -1107,23 +1113,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
-	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");
-	if (ret)
-		return ret;
-	/*
-	 * Set the bus quota for core and cpu to a reasonable value for
-	 * register access.
-	 * Set quota for DDR based on bus speed.
-	 */
-	gi2c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
-	gi2c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-	if (!desc || desc->icc_ddr)
-		gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
-
-	ret = geni_icc_set_bw(&gi2c->se);
-	if (ret)
-		return ret;
-
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
-- 
2.34.1


