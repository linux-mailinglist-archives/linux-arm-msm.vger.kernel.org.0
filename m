Return-Path: <linux-arm-msm+bounces-54290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABFA89136
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 03:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EADD67A485B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC7B21577D;
	Tue, 15 Apr 2025 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtPP1+fX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D120AF9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744680127; cv=none; b=EIlICX3zoiuIif9fFHecS/Rpz8/4JWW753+zCi/ZtkM3UuTVuDYSntPDBI0o5diH776z883/HxcQXAgpgsYMe9iRh6wITkYgy/FF36V3Bk5UoLsSCzlsmeUabLir6Bw4FWjBClNHrWrdo0enoji/cICGFhhp96fF26XRCl8G5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744680127; c=relaxed/simple;
	bh=+5/A3HpALBqUAQtH4uLB07biQeduLnRFjvrsKfrOt7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5+qhOWZb4FnZYdwtZ4DYElSi9ICEx6z0mj3TxNQiB8324QIgMN3IxveVAhSkjtfVJe3sV6qoJQEwcNDjSrvFdtAmKlakrERnPFY8OJcunxeffvnaYVzT3iBUJKw5/+JSMvZKG8fDknqCVEcNW9A1urS1uCo/nGRG5AXInNAxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtPP1+fX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15RlL020394
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8hD0tWfGMXHgoXT9lMggKnO35G/qy70wvPbpWnT1Cg=; b=YtPP1+fXhpjHUZvI
	KR2Y+MfSWGhL8u7hx1fLmEbNLR/MUzeUdCelhBsko2KEIEA4cH3K5cQxtfV/Uww8
	xDLYYuduDWbphTuDZ7/+KrGQHu6KD+qR49NB90c0xYJCj9VZ4627lFA9mO7dW4Dk
	zid7wyplTC/mbQFNyZvg1bgHlI0mw/nfiJF+vO0wpeMLiRfBDX/KO8ASegzBQlvD
	nhXQklgIu6zXCEobndABd4eb3deXBeN0bUv2NYh6AAlbsNxSd+cwajFBzWncGqeZ
	JhfrLx2N5Q/NFtkSjW9QD0KUTMJxqm5Pj9u8SwI3+x7eIzbin2sUzR9+lk/Y27gg
	0uqeXA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgje8kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:03 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2c2b9ab3829so3576850fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 18:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744680123; x=1745284923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8hD0tWfGMXHgoXT9lMggKnO35G/qy70wvPbpWnT1Cg=;
        b=GjEJ7S19sEFqVxAbef331hD6638Rw7LaoFeeKtytFzbi8SuRLrJ73Nb5o0Y7TrMnKM
         5BZO+F+Ef2jnPWgDv7SacM6P0Y7vhFgF0EeyX1QFDtl/KbbbvCBpJWVkQ61bcd367HgM
         6dH8ADk6IKscGdxZ1erT3WQC3jTAz6/qy4XL/cOYOdRpJZ1SF5Q0YQuDzN191q3nkh3H
         TKMbWx63bSlWHSZGqIGj3sSoiDcZ7SkTjHt1E9hZjUoSnQ0UpLVe/unWoXNsWcMK/oqQ
         zf4fAC+qqSAUjDNLYUG3mqvyV64/uy+/8GtSTbk/em9542+9qaCwc6rRxcIbDLpxBC/F
         QXUw==
X-Gm-Message-State: AOJu0Yx2tRFVhhRxOVEFIF+LeJ5pQEMoWzH8jFBMOoztHxXUopSkPlxe
	r+370tYOQlaRAakYE6AFOTrRGgdT9zntYJr6u3x22EdkHtS8sEFMaW9MsnI6jDXl4NpyiHpJQan
	XIhS0gRKGlxBQ0hsPoQFJ+lUe8l/utjj4xpBpZlzvtKPlOEdM7o7IHS7n5HcqVvfj
X-Gm-Gg: ASbGncs51PEf7HWaXO42VwKWdoRKJgQe7eTiBGrsg1ZJEXbQBBxGq66XMq6hE/4sJTO
	7ObwTgjtjZeG0UNDgadkEbqB+71SG5WQKK3gN08a0UVZ55zhex7Dm36UV8wlfebiFUcgwwO1dI2
	eI/WApoPa5cSArP0uu8CYUdQt6Dc1nec1YAhA1+7GQpVETge79zCFTyXUWT408gigHrNKuFwKJX
	Y7PNMR6ijzyCHnWXyVK+aYXRCgFLdN/BZdlFKxgzK3wDhhj9aYuu6cD6UQwj5aebboQP8Ksv1K8
	zToFSIaMc3ovoYDTeYmK7To5GzwDeetA2Zc7ZXxeV8Js3ZyIBtTVC0Ag8hW0ztfsL9LCVC3qcjk
	5JhFqmJSNnMU=
X-Received: by 2002:a05:6870:fe91:b0:2c2:27c8:5864 with SMTP id 586e51a60fabf-2d0d5cd3d12mr9204951fac.14.1744680122757;
        Mon, 14 Apr 2025 18:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt2OTe4yLk4/T2nST8NPOD1d6U+n5GJsu0PPBBDYnEgc1PKdGDKH+qmKiRE9MBUlNHR5+gaQ==
X-Received: by 2002:a05:6870:fe91:b0:2c2:27c8:5864 with SMTP id 586e51a60fabf-2d0d5cd3d12mr9204937fac.14.1744680122380;
        Mon, 14 Apr 2025 18:22:02 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0968e090esm2652538fac.6.2025.04.14.18.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 18:22:01 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 20:21:55 -0500
Subject: [PATCH v7 6/6] usb: dwc3: qcom: Transition to flattened model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-dwc3-refactor-v7-6-f015b358722d@oss.qualcomm.com>
References: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
In-Reply-To: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12897;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=+5/A3HpALBqUAQtH4uLB07biQeduLnRFjvrsKfrOt7k=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn/bSz5y5w1gPobsvKUJ40FnOw54slF2LYjUVSU
 drbh5xHMu2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/20sxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUEUg//bXM292MMxde0G9NuhMvzOkpJWOj2ISHYw7/CflP
 DqPIWya/5HUc1XKcIIbq6KH1Y7eC8ZSFQUJQWl5HbhlAjvAbZgFpvEuQ0RJpOHIxfxm4nTFYXaP
 v/BXmyTBDmRd7mn3o09D6/UKt/57bnLuXBToT5HtoeUaf6VU2S1n/LkaN+rEoRf922j5MCGIbKW
 mXfLxBtlWb/+tAehmCkqeLVrK/+eVW1zfIm+KrePybBJqerq7TH1izom8WlElL0mP9UP6ZTk0Of
 U/xtF9mdlb3/60aF0iPWKZEnUA1ePdBpXGRwRzUOHhM4Cc6cztG03hLJ1bfQUatMGk4cJX3tBM3
 OlF4i3ddOsipcRxqjScPXsOO8KgAKQVIbgIJ6Seob3n/K+K8AcPV1CNghGN8lEDq9/lPnf1W7vh
 yVHnnc7Mfu5/Y4DOkLidDuDwaFFzL2eyESG/CTS529D7rqg6JtfZYUr3QqxDsArRkyxcONgCmqO
 WzD+1Cyhz22EF1UUy86esTnZ4vsIkHP55+SUn4mMW/Gb5E+nwrkd3R72zd1fP39EgcjqGv0y6O1
 cW1XEpMVK+Psjsn4PjTv32LWo5Qw0lnADs08sboCBb5PNAblhEbDJtHpIxr0vHgsDRar71V6Gqs
 euLyqLvTizqOcr5Ihr95u3uwwk2RHTLdbrbUE1o6UuOg=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: uktNlega34odPl72oBg72eUxfpcZ8xkU
X-Proofpoint-ORIG-GUID: uktNlega34odPl72oBg72eUxfpcZ8xkU
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fdb4bb cx=c_pps a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=jIQo8A4GAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oNyuIvTq0u59PHEm3sEA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150005

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

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 177 ++++++++++++++++++++++++-------------------
 1 file changed, 99 insertions(+), 78 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9d04c2457433bd6bcd96c445f59d7f2a3c6fdf24..d512002e1e88da9523ff82454e653bac55c1409d 100644
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
@@ -842,12 +816,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 static void dwc3_qcom_remove(struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
-	struct device *dev = &pdev->dev;
+	struct dwc3 *dwc = platform_get_drvdata(pdev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int i;
 
-	of_platform_depopulate(&pdev->dev);
-	platform_device_put(qcom->dwc3);
+	dwc3_core_remove(&qcom->dwc);
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -857,17 +830,20 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 
 	dwc3_qcom_interconnect_exit(qcom);
 	reset_control_assert(qcom->resets);
-
-	pm_runtime_allow(dev);
-	pm_runtime_disable(dev);
 }
 
-static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
+#ifdef CONFIG_PM_SLEEP
+static int dwc3_qcom_pm_suspend(struct device *dev)
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
@@ -877,9 +853,10 @@ static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
+static int dwc3_qcom_pm_resume(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
@@ -889,30 +866,74 @@ static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 
 	qcom->pm_suspended = false;
 
+	ret = dwc3_pm_resume(&qcom->dwc);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-static int __maybe_unused dwc3_qcom_runtime_suspend(struct device *dev)
+static void dwc3_qcom_complete(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+
+	dwc3_pm_complete(dwc);
+}
+
+static int dwc3_qcom_prepare(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+
+	return dwc3_pm_prepare(dwc);
+}
+#else
+#define dwc3_qcom_complete NULL
+#define dwc3_qcom_prepare NULL
+#endif /* CONFIG_PM_SLEEP */
+
+#ifdef CONFIG_PM
+static int dwc3_qcom_runtime_suspend(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	int ret;
+
+	ret = dwc3_runtime_suspend(&qcom->dwc);
+	if (ret)
+		return ret;
 
 	return dwc3_qcom_suspend(qcom, true);
 }
 
-static int __maybe_unused dwc3_qcom_runtime_resume(struct device *dev)
+static int dwc3_qcom_runtime_resume(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	int ret;
 
-	return dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, true);
+	if (ret)
+		return ret;
+
+	return dwc3_runtime_resume(&qcom->dwc);
+}
+
+static int dwc3_qcom_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
 }
+#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(dwc3_qcom_pm_suspend, dwc3_qcom_pm_resume)
 	SET_RUNTIME_PM_OPS(dwc3_qcom_runtime_suspend, dwc3_qcom_runtime_resume,
-			   NULL)
+			   dwc3_qcom_runtime_idle)
+	.complete = dwc3_qcom_complete,
+	.prepare = dwc3_qcom_prepare,
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);

-- 
2.49.0


