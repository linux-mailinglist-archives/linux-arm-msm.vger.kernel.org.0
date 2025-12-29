Return-Path: <linux-arm-msm+bounces-86779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E475CE5F3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E95A3009FCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 05:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568DA2D0C64;
	Mon, 29 Dec 2025 04:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlUozORT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMqXMeyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E0277016
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984187; cv=none; b=KjRH1NnJo0NNNl+4CG7DY3gEk3K+uD+X8WOdrWbZ2we4rJ8LPZtqkxEGN6+aiNm856j1KXLJ68UZEyf33XJcq/gjwDMHabWB+xpQPC60r5IKDIN0llBd/TJg0yshNrURX4fWn7KwcsVEdvlTTmODu+fn7Zpbln0KMocDgr/zJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984187; c=relaxed/simple;
	bh=YIHYMofa7MM1n5uKKT/qVy70UWWioCFNHYGxbHnXI7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N2CXzNjK396zRzpRFDpVIZUCO406slp3wptRmKMdNxla93662ZhLTmMsauFlH0js3NK5jjFwwYrC3VrpbDo3yjKzBw9kN6APBSKwZwfekfYqVQhDd5EWBBlXOp59fUzAAI5FIZIfU3SoVTkZqv15Gcl3xVVRrwJTfaAGloPuCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlUozORT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMqXMeyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNujJD003811
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jQcAcBkjL0G
	3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=; b=KlUozORT+mV6bkf2/dncVjRouhK
	lHYaXcQYphzBLlHZr6MAWj7287qyj76f1BIYXBm2XWED0QJpxFSVyP1IuCsFs79o
	qHqK4onMIX6cIZtn3tT3wLZBEf8H/E+L8N2tqBs4NCQ8lpGTYrcnT9qHjhvcr9Y1
	dDQij3IcYk/jvqXfLLTEGtf9q/8WWJpO89dsIaodpec4MZXnrOtLsjMRwE5W9VMu
	POQHo10sgx+ZpSFGgN1BGKyH5SH7etk0abapdxIJxpTf5ltaLWQEpZCKshZWx1p3
	v+AFz3h08zJtwiKJ3WMya06gg5uJn7UESbKEWbRmIaxC4+gYACsEZAdzuyw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsbcug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b80de683efso16709323b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 20:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984184; x=1767588984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQcAcBkjL0G3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=;
        b=EMqXMeyZnMTJGbwcckwnQpxSboyVHBi4tJ28NRx6JKByg29ONnoWAVXDuJTf3uUpKR
         LKXRU8KtBrXG7LfGxYurtYi2C+65EpjFnWcoOVZLkaADX1R/XOcoX4N7V4gweanO+Wtd
         FORCav7v1o0wYthE9j9pbKph/VJWmdHUiFjnX9bESWTlma9VfiTJlBmfoZecez1yj6mT
         LAbSf9B1CiUoIfHIoHPnFAURRV5iXFaommJWq7JsZnUEImU9hN+RBdsOmrWRUmPZ/7kV
         NTFLFWPhSaL92DnV/FGTbCSTJt7XRy3SefM938AkJaQxzopO68BIkmKgC5nOkmvXe2Pu
         hpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984184; x=1767588984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jQcAcBkjL0G3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=;
        b=gPDGcmqEj48SCTdl+UxxJCoqlL0+xgZHs3yUhAjVTZ/LaHfq2+wWIslNw67Vx1Cc6B
         AU0kWUw2cppFAL7zntUBvAKgJFKO/JosaiEmNelWqMjeSgt9ZalGmu6s9i3MDdEpg4yj
         jQdiBxoHsjhJzhbggkSV8ouA4GzDbgqsdD1rYtQqmkUxb4Nzw6wQ3OIve/U52ELEtXkF
         X1g9g2hod58VHbPmWmh9cZOjhFMoLlFlU9XXyQhcwLCcCxt7u9JMTBxUqIrGj8g5Dei4
         CcDpwE7cTM5eLOGOCMAz4vjsA1wtyXoF8M1m17PdlcmF3PIzYJbpuQLzvcuDmrq/77Bg
         F5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7X7Kk6snwXrxLJSchrYOCbiL8w0KKmXmOOE7kPvpSYG1CLLIwmScHl0DCwJr0/q8ChwU2vBTkXvHjcXSm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+YPKpncpwi23Hq/BP+nIDTEC1fGYxpe8dUcDBR0bSIkGWeRj
	1vq2Usf0sWws0s3KZYczEPTA6IFDr1TcIMJh3Sxb1BXp9AHc3w004yg3qaPNRyVvep3PWrpI4w1
	nRcQO/zNtAXR8tP5Yk37OSRk2KnVtx2/81XoQXIXSjb6Zl/UNzKLYZYlZhw4nPnrLLhpv
X-Gm-Gg: AY/fxX44bd6ZxsNrOR9S5qUaOzSuxleDvhOn3BNno072zZZui5bfg3wyeNUP2BJofjk
	VYou8Tw3c1KBSlBZY2MLb5dlG10mwJj8ZLfJbrT4VPE6sQ3nIa2RvPD9tLeev16om27ij2XrpPm
	50aBBzzYImViRGpUj4CIHH55ArJ4qvnrm1E0l56iQnpEOK/cP1FDAqpSo6RlPagiJSGjPBnV4Aw
	0NST3GABFArmBAMLdsrV3k2wVhfS3J5/PJf+gctC6RQOCUQde/kcflvQsupfVBmXVqkctFsCcD8
	lFbpTVYsIV6wI/Q3ds9dDH0y1zwA3JfNSgRHofFAqPhdZ8n+YiUePucLMUsIiQ4nZ6Yo97hP5fD
	toifam/8frvQVF2VtUrN+c5kBkAsuj/XVKOr02nmtUcw=
X-Received: by 2002:a05:6a00:808c:b0:7e8:450c:61b5 with SMTP id d2e1a72fcca58-7ff6607b7e7mr25052042b3a.37.1766984183567;
        Sun, 28 Dec 2025 20:56:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2Im2N5utl57u5unWBSgURqzOVdOWAS9FpqgH0c6WfdB4d8UmoshJqLGq4PSmYCtSzhPUoPg==
X-Received: by 2002:a05:6a00:808c:b0:7e8:450c:61b5 with SMTP id d2e1a72fcca58-7ff6607b7e7mr25052010b3a.37.1766984182790;
        Sun, 28 Dec 2025 20:56:22 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:56:22 -0800 (PST)
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
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
Date: Mon, 29 Dec 2025 10:24:46 +0530
Message-Id: <20251229045446.3227667-13-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QLTstQJaKq-plhnazLDOo0MGFaFsc_yu
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=695209f8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zgZzUwpPmSg69XYvEVoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: QLTstQJaKq-plhnazLDOo0MGFaFsc_yu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX/AO7uR8qJ/Gk
 ec9exk0+l0huVrQPnE1NsJjOvulqo/E1PeEGpGpjGPTpJasP0i/W5KByYcgAptHsxnMpIpqto7L
 Y2m9/+k7gJmjSuEdK6m4iBOPKUhUepul6oe9P0nsrv7Tnlr17m8zf9BcuAzI6reGFK7Ysu3sF6i
 X8L6U/PDSlUXNF2AVZ/A7E3Br07TWkAdB2b9JmEkqIPn6eJMyMUigE7ZTi5P8qpgxfCoIc7FM16
 bPAJ84/Lvo0q427svLW6AB+wnBs/RXPnqYG9pf+xsXRxnDFZ9RhXfRcZhhcELj8J3udpDm42FU5
 7TOWRkJO+QWrIUO/AcRS9QroV1nI3B4oMueBMguV4uQQ2dvpGAWhbNyNtTwadz+VTRfh+enu46Z
 Llu0IRTNfGvjIdIQYIw2RvQHKoOs8Hkpm01xppZ9EV8W9qULmLEx/UeoNo6KLZMtbKkhh2aa/Lv
 s0car/eohRySZIpjdGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290042

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
V1->v2:
From kernel test robot:
- Initialized ret to "0" in resume/suspend callbacks.

Bjorn:
- Used seperate APIs for the resouces enable/disable.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 1c9356e13b97..72457b98f155 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -82,6 +82,10 @@ struct geni_i2c_desc {
 	char *icc_ddr;
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
 };
 
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
@@ -203,8 +207,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
+static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
@@ -217,6 +222,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	return 0;
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -908,7 +914,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	qcom_geni_i2c_conf(gi2c);
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret)
+		return ret;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
@@ -1041,8 +1049,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+static int geni_i2c_resources_init(struct geni_se *se)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	int ret;
 
 	ret = geni_se_resources_init(&gi2c->se);
@@ -1095,7 +1104,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
-	ret = geni_i2c_resources_init(gi2c);
+	ret = gi2c->dev_data->resources_init(&gi2c->se);
 	if (ret)
 		return ret;
 
@@ -1154,15 +1163,17 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
 
-	ret = geni_se_resources_deactivate(&gi2c->se);
-	if (ret) {
-		enable_irq(gi2c->irq);
-		return ret;
+	if (gi2c->dev_data->power_off) {
+		ret = gi2c->dev_data->power_off(&gi2c->se);
+		if (ret) {
+			enable_irq(gi2c->irq);
+			return ret;
+		}
 	}
 
 	gi2c->suspended = 1;
@@ -1171,12 +1182,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_se_resources_activate(&gi2c->se);
-	if (ret)
-		return ret;
+	if (gi2c->dev_data->power_on) {
+		ret = gi2c->dev_data->power_on(&gi2c->se);
+		if (ret)
+			return ret;
+	}
 
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
@@ -1215,6 +1228,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 
 static const struct geni_i2c_desc geni_i2c = {
 	.icc_ddr = "qup-memory",
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_i2c_desc i2c_master_hub = {
@@ -1222,11 +1239,21 @@ static const struct geni_i2c_desc i2c_master_hub = {
 	.icc_ddr = NULL,
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_i2c_desc sa8255p_geni_i2c = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
+	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
-- 
2.34.1


