Return-Path: <linux-arm-msm+bounces-44962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A086A1003E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1EF03A7A33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E51C23A0F9;
	Tue, 14 Jan 2025 05:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSVd4DAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAF924635E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831184; cv=none; b=aR6OR3J9JUIonPItlEXs9+gBVfd8mFycehOzNa5wwhDHRg9cv3alSoCedYawDmU4E7v2mOgFi3VtLg/vXovLv1RJSQ3SB+w3q/QRHkTCw8jdUZPoMHi5TyHMXZkTZ68v1ebeS3jBUNaGupRumYzJVRdAlgIItgJZT3HavZt2xjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831184; c=relaxed/simple;
	bh=XMhUGa9jASilaYKmAqPhGJDF9Z/4W7QRLCZ3ziNou6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSJx3w9ewgPFEzl5EB7sZk4casU5RKMUZ8FahPMlb4g4O0vfWm7SPS6OkckWGRg6lxONgMMVGVNre/rRMvcZHPCf3B9Jtph/mV1dUIedq4B/IIjYH8e5LpOgeBUlg8E7wg29FYrPcZRO8BK6h3Sr0UFfrPYqLEPOfbAs0NlgA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSVd4DAs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E24LcS010277
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+pBckYQT8kiWYR+JN/p8P4x1oQKu26Ua1lLR/Lpzog=; b=QSVd4DAsKdwYaYgf
	3vvU5PHmgkLUkNimXdrG1zL2dsOXFhz6GoRAAExKjWVItfRD3G2eH7Qx0SgYz4A7
	Yet++oGsXDB30qyWpWFuAZKV/moRfDx8586fUlkjiUnpdSekmssF/eBf/JeO4q7Z
	FaMWqmb3GDPa6u8OfQXP9Y0RC95GfdfdKNvxgAO2jTrfDhGtn25FTBsUduoRjEpI
	hMS6oT5I5l5GMmtUAdCtd1tFewNhs87Rhlefw/+TPTK8dE+ncfYfwQnqq19WYl3b
	4u8Ll/XqRvI1KUZKViWv5YudWZnP48xI/Tf4jUZr/lhw3PIwtvqR6lm2Z9zBG8Ly
	IpiQWw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445eterbmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:20 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-29e61ef3897so3565362fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831164; x=1737435964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+pBckYQT8kiWYR+JN/p8P4x1oQKu26Ua1lLR/Lpzog=;
        b=XL9UNMAu+22IbZN5guEvMMO01PTiTvBZQVtI5n9bBHnC9LOOkd4X9AnDtkbLNQkj43
         b9MgeTVYQfNzbXHTeCgHwFZAnFsJX556wxfE6MDR01fuT7nkaSxlgev/tK+4YLXvo0aS
         YN2erYgm54S5Ea6iH7kFeJNR8I2zuqWyLcr4kmekNO97rs6o0F8fcYy1d4d+qwkPxGHO
         +iRQ21pXRL+u2dklynSmXIsU+qFnLrCF/FRezretB9MfHfxi/xjXxupxRjBPPNeCLwzs
         HHxZIDmVFVQjHpyNBT3XSWPVlLBWhXgVzFejk1HI4lkPKgrAVGL8mnz2dJck/jcbM4P0
         goWw==
X-Gm-Message-State: AOJu0YxWBsJATtj8n1o8Gf2ju95JUSn2Ls49EUUxaDcNERHO0BikimBQ
	Iq1D7e+S3x6bfBrsi6hTtqVKJgsFfYHLqRQMdu4u5Izg4th7vv4X+rTDb5KM+NnUDbGHNopQo0y
	fKC9j0DvatI8Arya5bMkJtvhpKzv7sDQokXpWoN9zl/2pVOlyfyylzliT/iOc2Gzh
X-Gm-Gg: ASbGncvqyWMx+rAf2V/gZlW/TYVMvRBqj0i3v/qS779JE+RHGmBE3uzXEp7F2hdf0PZ
	vlXDJdw4WfIMV6rj1/l7l3gFN1EybRVf/Y59tj0SKV/L3WUihfQCnWYNEtT2+TNSx4gpUBvnKjt
	yzoADOBSnwmlJ4sh7zeM8e9lgCxNR9aYVdGcI4mowSRhJja5OWi1dus3TfEbPlvViLuwa/IApec
	NSBHvzsskQSYJ0R3inOh19rtHBn+Vp7Ox/LOPyGSmZ33RIx6lgKk7A5lQgITme2xRf/ZDaFkZ62
	AqPk6uKp+y6jnngJmUl7kpibJuJau+3dX1oij5xFlgi5+zLulDHwscS3
X-Received: by 2002:a05:6820:1745:b0:5f2:ae23:767 with SMTP id 006d021491bc7-5f73070b54emr12596455eaf.0.1736831163824;
        Mon, 13 Jan 2025 21:06:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbssb+eGXtilc3CQwmUCInY0FJo024TV9q9MgOQ1o2yh8BjC4LvpO8WQxaIXj/9OPLVL5LDQ==
X-Received: by 2002:a05:6820:1745:b0:5f2:ae23:767 with SMTP id 006d021491bc7-5f73070b54emr12596444eaf.0.1736831163517;
        Mon, 13 Jan 2025 21:06:03 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:06:03 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:43 -0800
Subject: [PATCH v3 10/12] usb: dwc3: qcom: Don't rely on drvdata during
 probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-10-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=XMhUGa9jASilaYKmAqPhGJDF9Z/4W7QRLCZ3ziNou6Y=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIV5pP9H4VjRY3SSghjy9khuqpLriBrkV5Mk
 c3mImvjAoCJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWiIxAA3ix6QgOfLXqse2uIvzzXX+PnesgNISy7rEC4vRx
 IJ+ja8hGVH3KEXq75BzF5HIUnVcO4fZNXgPKJeujbboK0MNEg47Rexnjr2K2Jd0yvexT+9t3axr
 GZoCF3ZeeWixsL3xl4bxF0ii4AN5Cnz13zCVeGaMDSh1AMMJUZ8q84jUG55FQiJ7/ZmTsP8bt+I
 6JwlogNEv1FqsvRGEftz3jmkRF8HAz7m0VW9MDY0IgsX8VtBX3MNMvjXK6g8ZhXBF7iktQZLaYY
 NcTvDwz1H0roZ87gXrUMttokFuynDWnhie3KDaenMKqZRlzqHEJGJv8JQLPhJNhXsb9IyOnk2QM
 7rW7IZtgxae+KTr0Y1JfquJ+l+FOQBdfbXm5kvrp2irW4Zt8CzqD3oEzmuJUFO42/JqQEpIqS27
 1qd3uuWlOTIcwJbm250B0owWg12wul45gPA0C3TIpxzW2Bb+hhx26jmOnXv3ij6SWTin3zwzzj/
 R7sHoCpOjvyI1tydlTcKdPl3ZkKcyLvOAB5PQKKtMdvRkDXgYhZdGMBnwU0D5ikWA7MRujqWFJx
 4NQ1QcopQdfWyYN1XalT6ubUvOVmc0wPLzcpIeNefv5e45UaqSsRBEpK8Yeo52TelEG8Heduc3/
 TVet5aqRZx5IM/tUNkpe6vO7Do7atDcvoa05Z86VFxGI=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: DfGvje8ZjcNyeI0Gb_VrBsqygizml2AT
X-Proofpoint-GUID: DfGvje8ZjcNyeI0Gb_VrBsqygizml2AT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140040

With the upcoming transition to a model where DWC3 core and glue operate
on a single struct device the drvdata datatype will change to be owned
by the core.

The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
glue context around before the core is allocated.

Remove this problem, and clean up the code, by passing the dwc3_qcom
struct around during probe, instead of acquiring it from the drvdata.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 58683bb672e9..50b1da845113 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -547,9 +547,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 	return ret;
 }
 
-static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
+static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
+				    struct platform_device *pdev,
+				    int port_index, bool is_multiport)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	const char *irq_name;
 	int irq;
 	int ret;
@@ -634,9 +635,8 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	return DWC3_QCOM_MAX_PORTS;
 }
 
-static int dwc3_qcom_setup_irq(struct platform_device *pdev)
+static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	bool is_multiport;
 	int ret;
 	int i;
@@ -645,7 +645,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	is_multiport = (qcom->num_ports > 1);
 
 	for (i = 0; i < qcom->num_ports; i++) {
-		ret = dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
+		ret = dwc3_qcom_setup_port_irq(qcom, pdev, i, is_multiport);
 		if (ret)
 			return ret;
 	}
@@ -700,9 +700,8 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_of_register_core(struct platform_device *pdev)
+static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	int			ret;
@@ -778,7 +777,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	ret = dwc3_qcom_setup_irq(pdev);
+	ret = dwc3_qcom_setup_irq(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
 		goto clk_disable;
@@ -793,7 +792,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(pdev);
+	ret = dwc3_qcom_of_register_core(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
 		goto clk_disable;

-- 
2.45.2


