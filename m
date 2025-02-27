Return-Path: <linux-arm-msm+bounces-49578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB553A46FF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 01:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24D916E40F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 00:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC2E137750;
	Thu, 27 Feb 2025 00:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9sUzF7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD917C77
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615116; cv=none; b=q0rqG0wz7cuYQrWC08tR4fV0QFOcGisLfm+wG/lUEqN0yPDCKQif3tBFEGO7DSoV+vy+hNguD/jfSX8O5SxIxRm0VPvu41jtO3l1GcdP+Mb7vRW+VPMyQtwJsv8xvN1TN8lwWDdi2IqeWSfKNg2wPPlMKEQUPVEfnUgBgSTLepA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615116; c=relaxed/simple;
	bh=KgorRMYeXfmBlN3TG9gPoCwE8xu1HNu35qYk/aakkpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADaPxdPEf/rhROvpaRz2OqFfTDWNdehNv6RijfFTrznusOY/dbjb+fSqc/DKks2DLOcT4HFlfIyY0SczFYiQiSw1DF5hqvqvoGRerc/SbJm1jneDRmkoNYgn6GG8Efio0rqYcy0iOiJ5RtYSYP3IFWgt3ofUh55EDuTTUtBAYaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9sUzF7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QKCwRZ001130
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EHku4COqLSS7IJRemxzqqTYLSKg3b1Wo5rUYOTIWqk=; b=X9sUzF7afnuISUW4
	3tV7dq/C77Phhd3XJ2c59ska+iq7zXb4qN4s0bXKIMAdSYpl6PR/DXwrOa5zzH1u
	9c7ah3o0sAYQVyyVsz14+WcvRfrtlIslmgFQhfouF/Dr9JlSE70BI0XIZzQs1aQr
	SLj1dUkVd7ODh1Ua+RgktQ1qYc8SFimpsSenl5PuwKC6UhJXxmID6On/yv/A+15D
	pDi4N4nstg3t9LyjVmzuuymKvwpu1C5dLYqBLSbcZbkcUrZoRnK0lcJQANAWs/cC
	61nNe4HkvkgNkHdNp6e5bd/YceiGrH5Kl+qVhdRb0TnCBJ/TF7OoMk426tJ6dEU8
	ZtZgYg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9bqbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:11:53 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3f41be6ae50so292650b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 16:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740615112; x=1741219912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EHku4COqLSS7IJRemxzqqTYLSKg3b1Wo5rUYOTIWqk=;
        b=NljQDshj2a5AaTU/7vgfzD0via+oOMKlkbR6flZqlRrue6pTDcqfVV2NV5yBY766LN
         SWPXxla1tE+Z9LxFHxnGaXViklQQt9Cj1AefdBqwTkXohPx5lFnyol9lc9ZL3IWPSTEc
         oCau+LYo6BLKURtZoa3BSgoHdeMsksTUUasxVkSJrQem5MC0YnzfUHB9fk2gAYnSsPaa
         WWdvwmjNU/EKpSAd72VuYctUpoVfMHQB8C6OyfrJRfV1z2Q+nG29IowfO4WQ5E5BveAu
         nivCilGaG7y2WMWBIBksxc6mb2wgYlUIj3XSbJ/A7NWNN/wGaZoqYrinv8yGZaDLPdYx
         JZ+Q==
X-Gm-Message-State: AOJu0Yw2yCYgtDqd4yAEeVGs0mMe0daA00Po5wQa0QBbsa2k/l4ceb+T
	0pedsnJAdCSOT3CQtOsv7h5Y/Yv8yHDMaOaE8HSOUtiXOGudkgtJiMHLKeSaV+UUN00zXtTAGeU
	IFkzYUk0863ydflzu0nCuhXw4gOI1K+uzedsoeI8z0AUsr9qxqCKMt8+z9Yiz58CAnv4IMG8o
X-Gm-Gg: ASbGncuiWne8Kf5gQG+QfamgGqGz2NVl4GVzEcOkyMCFgtcB7oCJDT7NRaraWC2lykP
	I1dj0/2as8Xqgq2koHjGKiIgNGNt10vVNAf9SYc8tN+9eTQqS2fOarzGqrYGUJ+ipbR63Lt/Cpk
	csxoc3FOip7ytIm8avGc+g6mgtAjJ1NXLwumBNT6Occ83nXObg+WHx5j0XipCJEZiCrwefjVUdZ
	BKFfH2z+chUZiedLEKM4wtoxRpV2w6rLx4YH+rhhatTC4Pxo4NIYItVbWR1nr6wgByIi9LvGVSR
	mOWVMiN2szb+mA3nr7fN1TXQO53cgqIgZQVLtAHg95n2Bhn+dpCoGx4LzLHuzVos+jN/tP/VBJG
	1PXKNoHiMAFSG5r4=
X-Received: by 2002:a05:6808:3507:b0:3f4:1879:2af6 with SMTP id 5614622812f47-3f425c0a825mr12950241b6e.34.1740615112216;
        Wed, 26 Feb 2025 16:11:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYyWforakDsfP6Ccc0h2wwXtypBZ/iJf68rRAL9DRTdguQaObti+g32f3/TVVA1pHp2B7fMg==
X-Received: by 2002:a05:6808:3507:b0:3f4:1879:2af6 with SMTP id 5614622812f47-3f425c0a825mr12950231b6e.34.1740615111841;
        Wed, 26 Feb 2025 16:11:51 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f5507c40c6sm33988b6e.45.2025.02.26.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 16:11:51 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 16:17:53 -0800
Subject: [PATCH v4 6/7] usb: dwc3: qcom: Transition to flattened model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-dwc3-refactor-v4-6-4415e7111e49@oss.qualcomm.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
In-Reply-To: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11411;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=KgorRMYeXfmBlN3TG9gPoCwE8xu1HNu35qYk/aakkpk=;
 b=kA0DAAgBCx85Pw2ZrcUByyZiAGe/rzigwDYC9/4ZNZvaj0odxr8Vdz9GGRT8IWWg2s0I0+lK9
 4kCSQQAAQgAMxYhBAXeA8xfNepPCWbVJQsfOT8Nma3FBQJnv684FRxhbmRlcnNzb25Aa2VybmVs
 Lm9yZwAKCRALHzk/DZmtxYCCD/0X3U5jInVt8RluV7Nx8W6HaJ3B0cvce3R4XErbXLeh8pUaq54
 tkZfncMi3GMVwhqjXOviPdsDtiV8QuDzHHzZYGWYoROhZpBHsfpcEF7XTcOT34LjwroUnNV1sX8
 /KMLbg4WoQVMCQmgStbnryPHFJQc4rr/3e1HMVROkKPnz3LWLUj30u4eCntwRjXNg4VenAQN4J6
 b6RFfuxuKlirdoKGs73lX8D0sDwQQO30B3vvdQfxGTKVissDzAtlzqee/McgYzgvPxk1V74nHxa
 f7fkTQ1sF0uUabJxScI9JlHBf0TYemUMCdLaUqPCFEt5tydaiqVMdGozLNZmS6ZhNjIC2hQci1z
 HllY0rEpKcymv+loHZ5c6vd+eLQMGt4CBSjxpfBF0vcqce20kT87YNVT+5YyeYoRX/XvXksmkmM
 JTceQCP80TCJGHKTudAxCHYCHzAJ73PgrRyEWpX5xcIdAMKGhR5hRd8pPGelikiWWhuPVTnr4Pf
 sxgMkyoK1D2GVoYWmf0JAW07nb7dAt7K7NclV2gvmA1BtNcfENbrNjkkwhFPqG3pf1xLWuQ/D2d
 J6SulTbq47v+bfHwGQY2Ts6wv9VdsmguecJEnkK3veU+9OlmVuQ0oKRvzELa6DmfkqzLnR4vC7O
 fhJhE0StI4IHRuxiCvqmSLr10+Po+9rJUvQ==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: Y_euB343gFom4KKF68pA_YED-YsbYJlv
X-Proofpoint-ORIG-GUID: Y_euB343gFom4KKF68pA_YED-YsbYJlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_07,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270000

The USB IP-block found in most Qualcomm platforms is modelled in the
Linux kernel as 3 different independent device drivers, but as shown by
the already existing layering violations in the Qualcomm glue driver
they can not be operated independently.

With the current implementation, the glue driver registers the core and
has no way to know when this is done. As a result, e.g. the suspend
callbacks needs to guard against NULL pointer dereferences when trying
to peek into the struct dwc3 found in the drvdata of the child.
Even with these checks, there are no way to fully protect ourselves from
the race conditions that occur if the DWC3 is unbound.

Missing from the upstream Qualcomm USB support is handling of role
switching, in which the glue needs to be notified upon DRD mode changes.
Several attempts has been made through the years to register callbacks
etc, but they always fall short when it comes to handling of the core's
probe deferral on resources etc.

Moving to a model where the DWC3 core is instantiated in a synchronous
fashion avoids above described race conditions.

It is however not feasible to do so without also flattening the
DeviceTree binding, as assumptions are made in the DWC3 core and
frameworks used that the device's associated of_node will the that of
the core. Furthermore, the DeviceTree binding is a direct
representation of the Linux driver model, and doesn't necessarily
describe "the USB IP-block".

The Qualcomm DWC3 glue driver is therefor transitioned to initialize and
operate the DWC3 within the one device context, in synchronous fashion.

To provide a limited time backwards compatibility, a snapshot of the
driver is retained in a previous commit. As such no care is taken in the
dwc3-qcom driver for the qcom,dwc3 backwards compatibility.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 138 +++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9d04c2457433..63e60f15ceaa 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -4,7 +4,6 @@
  * Inspired by dwc3-of-simple.c
  */
 
-#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/clk.h>
@@ -14,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/extcon.h>
 #include <linux/interconnect.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
@@ -23,6 +21,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
 #include "core.h"
+#include "glue.h"
 
 /* USB QSCRATCH Hardware registers */
 #define QSCRATCH_HS_PHY_CTRL			0x10
@@ -73,7 +72,7 @@ struct dwc3_qcom_port {
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
-	struct platform_device	*dwc3;
+	struct dwc3		dwc;
 	struct clk		**clks;
 	int			num_clocks;
 	struct reset_control	*resets;
@@ -92,6 +91,8 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 };
 
+#define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
+
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -260,7 +261,7 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
 		goto put_path_ddr;
 	}
 
-	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
+	max_speed = usb_get_maximum_speed(qcom->dwc.dev);
 	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN) {
 		ret = icc_set_bw(qcom->icc_path_ddr,
 				USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
@@ -303,25 +304,14 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
 /* Only usable in contexts where the role can not change. */
 static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
 {
-	struct dwc3 *dwc;
-
-	/*
-	 * FIXME: Fix this layering violation.
-	 */
-	dwc = platform_get_drvdata(qcom->dwc3);
-
-	/* Core driver may not have probed yet. */
-	if (!dwc)
-		return false;
-
-	return dwc->xhci;
+	return qcom->dwc.xhci;
 }
 
 static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
 {
-	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 	struct usb_device *udev;
 	struct usb_hcd __maybe_unused *hcd;
+	struct dwc3 *dwc = &qcom->dwc;
 
 	/*
 	 * FIXME: Fix this layering violation.
@@ -498,7 +488,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 {
 	struct dwc3_qcom *qcom = data;
-	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc3);
+	struct dwc3 *dwc = &qcom->dwc;
 
 	/* If pm_suspended then let pm_resume take care of resuming h/w */
 	if (qcom->pm_suspended)
@@ -700,40 +690,14 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
-{
-	struct device_node	*np = pdev->dev.of_node;
-	struct device		*dev = &pdev->dev;
-	int			ret;
-
-	struct device_node *dwc3_np __free(device_node) = of_get_compatible_child(np,
-										  "snps,dwc3");
-	if (!dwc3_np) {
-		dev_err(dev, "failed to find dwc3 core child\n");
-		return -ENODEV;
-	}
-
-	ret = of_platform_populate(np, NULL, NULL, dev);
-	if (ret) {
-		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-		return ret;
-	}
-
-	qcom->dwc3 = of_find_device_by_node(dwc3_np);
-	if (!qcom->dwc3) {
-		ret = -ENODEV;
-		dev_err(dev, "failed to get dwc3 platform device\n");
-		of_platform_depopulate(dev);
-	}
-
-	return ret;
-}
-
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
+	struct dwc3_probe_data	probe_data = {};
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
+	struct resource		res;
+	struct resource		*r;
 	int			ret, i;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
@@ -742,7 +706,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (!qcom)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, qcom);
 	qcom->dev = &pdev->dev;
 
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
@@ -771,8 +734,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto reset_assert;
 	}
 
-	qcom->qscratch_base = devm_platform_ioremap_resource(pdev, 0);
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r)
+		goto clk_disable;
+	res = *r;
+	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
+
+	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
 	if (IS_ERR(qcom->qscratch_base)) {
+		dev_err(dev, "failed to map qscratch region: %pe\n", qcom->qscratch_base);
 		ret = PTR_ERR(qcom->qscratch_base);
 		goto clk_disable;
 	}
@@ -792,17 +762,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(qcom, pdev);
-	if (ret) {
-		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
+	qcom->dwc.dev = dev;
+	probe_data.dwc = &qcom->dwc;
+	probe_data.res = &res;
+	probe_data.ignore_clocks_and_resets = true;
+	ret = dwc3_core_probe(&probe_data);
+	if (ret)  {
+		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
 		goto clk_disable;
 	}
 
 	ret = dwc3_qcom_interconnect_init(qcom);
 	if (ret)
-		goto depopulate;
+		goto remove_core;
 
-	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
+	qcom->mode = usb_get_dr_mode(dev);
 
 	/* enable vbus override for device mode */
 	if (qcom->mode != USB_DR_MODE_HOST)
@@ -815,20 +789,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
-	device_init_wakeup(&qcom->dwc3->dev, wakeup_source);
 
 	qcom->is_suspended = false;
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-	pm_runtime_forbid(dev);
 
 	return 0;
 
 interconnect_exit:
 	dwc3_qcom_interconnect_exit(qcom);
-depopulate:
-	of_platform_depopulate(&pdev->dev);
-	platform_device_put(qcom->dwc3);
+remove_core:
+	dwc3_core_remove(&qcom->dwc);
 clk_disable:
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -842,12 +811,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 static void dwc3_qcom_remove(struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	struct dwc3 *dwc = platform_get_drvdata(pdev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	struct device *dev = &pdev->dev;
 	int i;
 
-	of_platform_depopulate(&pdev->dev);
-	platform_device_put(qcom->dwc3);
+	dwc3_core_remove(&qcom->dwc);
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -864,10 +833,15 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 
 static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
+	ret = dwc3_pm_suspend(&qcom->dwc);
+	if (ret)
+		return ret;
+
 	ret = dwc3_qcom_suspend(qcom, wakeup);
 	if (ret)
 		return ret;
@@ -879,7 +853,8 @@ static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 
 static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
@@ -889,30 +864,55 @@ static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 
 	qcom->pm_suspended = false;
 
+	ret = dwc3_pm_resume(&qcom->dwc);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
 static int __maybe_unused dwc3_qcom_runtime_suspend(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	int ret;
+
+	ret = dwc3_runtime_suspend(&qcom->dwc);
+	if (ret)
+		return ret;
 
 	return dwc3_qcom_suspend(qcom, true);
 }
 
+static void __maybe_unused dwc3_qcom_complete(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+
+	dwc3_pm_complete(dwc);
+}
+
 static int __maybe_unused dwc3_qcom_runtime_resume(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	int ret;
+
+	ret = dwc3_qcom_resume(qcom, true);
+	if (ret)
+		return ret;
 
-	return dwc3_qcom_resume(qcom, true);
+	return dwc3_runtime_resume(&qcom->dwc);
 }
 
 static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(dwc3_qcom_pm_suspend, dwc3_qcom_pm_resume)
 	SET_RUNTIME_PM_OPS(dwc3_qcom_runtime_suspend, dwc3_qcom_runtime_resume,
 			   NULL)
+	.complete = dwc3_qcom_complete,
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);

-- 
2.45.2


