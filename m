Return-Path: <linux-arm-msm+bounces-51816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27BA67CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 20:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 022554212B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85ABB1DED64;
	Tue, 18 Mar 2025 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6LUS1h2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701E5213E62
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324721; cv=none; b=myi4nCQx0r2y3XGPtFO4KFoKN9wfmlOC4skFFvglufQFNCaLIlD+jWnGYDXSdYg4bU+I/nbfADGxMxrmNmLGqSHCH8Zf9H+kL57mnFqmPWlonrLDSuE3neMUTSYJ0a5VmhjUa2a5Xj3W3cbwoaUqdF9cfeuLs2B2qsPW5J6pW+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324721; c=relaxed/simple;
	bh=eQkqYxpWSanYKxPhcGDRdC42rK/h4DBAcc6ryt80h+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciOzhy09MziDaYVqNnv0850hF1G/99CR0HdIqr//6RuNZCQ58dBh/EkBhC4AAtpPMceqHZ1RYCZEkdvt9WT2uWdu1B+mHsEZ9GOqu/ZJLx25XBMGSoj3LZSYLtcvFxbNOUO74OyBSBzcuZL2c3QoPRnf/OgekO7ExjA3cUgApTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6LUS1h2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAkXZO022110
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 19:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKt7fy4k+zqCf24blu7hfnZkf8U4C+xUpHuJMgA8+D0=; b=d6LUS1h2tAhJOwmt
	xjbjgDuiIKtVs8vf0n+10D/QQJy7xDWkbCXg3kgI0I1yHmYarN+UfOc95bbimK5p
	t1rUtAhDwv/KhgJo5Od4RxIH0wQd1Q6WDUTZwh2C2ePF/RoKIBvBkHQLlcxg10NK
	8JtC51wDUyk6psHoLmjyO8MYpS1y2n0e8hAyFBrFP0gVsYXRkVdd5XhxUYcuYgTB
	6/2QlhDZwn6Ehu3XPRtn0TRungtEnbNo7ihipnYbdqd+4y7dG/CrbCFptWfkKbWa
	1AWDEJ90WM5ztGNpdY0VMhjv82jBGtRK0r0gTi1DwdGbQBwmorN/9bP9WgYI0QMw
	/RNx3w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx2wwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 19:05:18 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3f84fe7b63dso5596997b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324717; x=1742929517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKt7fy4k+zqCf24blu7hfnZkf8U4C+xUpHuJMgA8+D0=;
        b=K/cHH399kA19HOhOHWlWGw/ry0FER8fGkF5mzuU8fY7nmMnEs/Y1sN82CJSTkn1R1v
         zijd9HDNQ7iWEzENQd5orKlvnrOm7u1zH/hqEzEucNLYyiqy1acicez7C6TTIR9Gx5bJ
         jzf4DKlPXOGeIz3hsNGBVLtIQ/AIN2V1xEw8DcPvownQP1TuvYpjslSREG5v0H7k0dnF
         FfFhV9A3TFwg3sRkDtp5//un8vh6J6shnKUtgniV/fsRP1pGn6s2Ks1uWQKLLy0nh4Ug
         K2yr7/l2s5Fs2LNwdnEirS9myqGRppQOw0CFwFK7Y5WEFgwlxn1oOCmk5JMkgbNf7oan
         qAPQ==
X-Gm-Message-State: AOJu0YxvZgpM37Pa1HTQCNZ0f+18DL19b37D8lQTkdDn0SdTVNK8hzUl
	WHRKJ4SyTKrDxGsBgFfzYqYztf4SfWh3JvhNix1anU8nQlxcTXxQ2siCLuLPVQzoHuYr9fW0OrM
	6VY0ThcklMjnPdogB7cMeSD9zpQyHRzkQEsEsdM8QD3+TdiwUqChxFUYGziQ4vSY4
X-Gm-Gg: ASbGncvO266jOqAHbySlE0dtQzEZNLBYRQoA07/XRlL154WzufLHFggO1OUSGxXVNIv
	F/07xtIzyD0bQtRKu2NyybISodXNTChLYyKF3r+CTxRtAHTb7SulbLb6jOkFDSLbOkh54NMJmPB
	gbKiNpCbr8ZTz35VsuncCblIf3xODH0WZOh16s2ClhYh6hwZcSj4Iuiyf3L8s3hqw0Uw0cHoOKL
	XU/YalfUyRMFWPB29CGs6lpOIHTYhFqSLA8naDb6GyAV0df89QTp6HLfIbcK0dqWsML+KMOWYiB
	f6GmmNBKJxpNb8Qt1C9gbmMzHGCA1LaAFDWPcf1XsDSY0fcVWSscoP9ifbt5HVJqbcTMKwU4FB3
	jiFFYP4Jpl99wgOA=
X-Received: by 2002:a05:6808:211c:b0:3fb:174f:821d with SMTP id 5614622812f47-3fea18d164bmr3175574b6e.35.1742324717543;
        Tue, 18 Mar 2025 12:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0oPFytHnSwWiWEyE0i6Zq6g46JKWsbktjeJE5tWF7seB8gkd1dk4wmLOs9B2mofGvogFQdw==
X-Received: by 2002:a05:6808:211c:b0:3fb:174f:821d with SMTP id 5614622812f47-3fea18d164bmr3175542b6e.35.1742324717114;
        Tue, 18 Mar 2025 12:05:17 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b065sm2264273b6e.4.2025.03.18.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 12:05:16 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 14:05:06 -0500
Subject: [PATCH v5 6/7] usb: dwc3: qcom: Transition to flattened model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-dwc3-refactor-v5-6-90ea6e5b3ba4@oss.qualcomm.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11907;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=eQkqYxpWSanYKxPhcGDRdC42rK/h4DBAcc6ryt80h+Q=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn2cPkM9LBwJ0OMl5jBRqXpXuOP/YHLHmJTmOnf
 CWHXL21zOmJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ9nD5BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcW0Rg/+LnBSuBQQG0u1ou9Yxw5vpTTiExzPmRVCQ1dcdJI
 BWZamNmWSd9Ecx/G/RDQ1ORbOrK/xdqPbmWzags4F2Apg9lVvvSiRzmLBMyOS/YRkv67033m+de
 nnzsLwdfaOPwVi6F/RDl9NHLQFTfwIg6nqbZYD3iq8KOmbHZIfs/M3+cTMGLExwKRqzBh0N4U1b
 AP+nGRsQ3FumxoZX2t7soCe20L/HCJ6r9lFoJRFGJfL00svKfxcmJv8kKIM0tKxu5IYjOHqpan9
 p88ekMJK1v4Ux6NNhIfCkvLdFRomSefCA05IrK10oLgkoaSfBb/r1yRoGheJD8UAImdDyISiBhs
 8kqp7pzcL3wSwoRALEl4nYyn2iINUmSwokGdyfcJ2cK4gCq6xPqN1DEuC7ODpLc8AjIM6p+xKOt
 0UOh9m9eKZcQorO1Ouqccc2tNoBOrGLQzPrM+Iu67bdocqA5QQZI4nbM49yQmUYhAT2qxPnGVxZ
 c1Cq/UMqA0K1O1HVHxoHnewJpIivdxdYGYSFdR0CrcAgY5ve5ILMNgPSFAkH0XdTyc5fCjI0iUb
 aGbx253jM5YwwOGFX28K0lPqEW9/vXlYiPAMPC1IEdwZV5FaAf1gx5yuFeOzU0GXlncjjf3TiTa
 OhrmEJD9S1x2RCS9infPMMYUcYmvui7m6boGm1uNCNVc=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: _u5RrzUd2BO18WQzfGF7-r1nS2Gk6Rgu
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67d9c3ee cx=c_pps a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Rmjymn6LDx49BAQaV_MA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: _u5RrzUd2BO18WQzfGF7-r1nS2Gk6Rgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180137

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
 drivers/usb/dwc3/dwc3-qcom.c | 143 ++++++++++++++++++++++---------------------
 1 file changed, 74 insertions(+), 69 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9d04c2457433bd6bcd96c445f59d7f2a3c6fdf24..49ad3fc8df33a354c7ab7cb0fbc47e47419fe689 100644
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
@@ -116,6 +117,11 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
+/*
+ * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
+ * validate that the in-core extcon support is functional, and drop extcon
+ * handling from the glue
+ */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
 	if (enable) {
@@ -260,7 +266,7 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
 		goto put_path_ddr;
 	}
 
-	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
+	max_speed = usb_get_maximum_speed(qcom->dwc.dev);
 	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN) {
 		ret = icc_set_bw(qcom->icc_path_ddr,
 				USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
@@ -303,25 +309,14 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
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
@@ -498,7 +493,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 {
 	struct dwc3_qcom *qcom = data;
-	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc3);
+	struct dwc3 *dwc = &qcom->dwc;
 
 	/* If pm_suspended then let pm_resume take care of resuming h/w */
 	if (qcom->pm_suspended)
@@ -700,40 +695,14 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
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
@@ -742,7 +711,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (!qcom)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, qcom);
 	qcom->dev = &pdev->dev;
 
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
@@ -771,8 +739,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
@@ -792,17 +767,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
@@ -815,20 +794,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
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
@@ -842,12 +816,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
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
@@ -864,10 +838,15 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 
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
@@ -879,7 +858,8 @@ static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 
 static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
@@ -889,30 +869,55 @@ static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 
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
2.48.1


