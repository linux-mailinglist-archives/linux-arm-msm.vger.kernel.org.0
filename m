Return-Path: <linux-arm-msm+bounces-53932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEFEA8523E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 05:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77EDD4A6D52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 03:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD2C27E1D4;
	Fri, 11 Apr 2025 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2Tg1jOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8512427D767
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343434; cv=none; b=elhcSlIOX0zVbXq2TaUbtIFIiMlXz7xXPmYAqLhLTPu2Ix+XCsdxNsSKzKn+RcTGekqDvYi1ukIhJ1SHTnJItMl5suLtYG6Im8mBLW2+nOnWnzETIFH5hnN4hXFEEDgQapwD0ciXAxO2FAjlPcVzCUUIFHxC5FEzivSEDcfjui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343434; c=relaxed/simple;
	bh=JvFdgODbjBbS+ZvrfFLarjzmj9NETKrOx4wtULiGSAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJoJ1wxEubdMz4ouBv7GzZGf25j3C3k16jUg1+4uHNUR52onWuwlHPTOzjOHMPNdfH/ExlxvOpAiQ3GbZBT5ElTbBtf1vfCAG2rJL5m3PvluBkZoTw9h1n2xKklcvSvXVImka+VNXUxV9FotwCxRcfJzTwdhKJ9bZhntEtiOHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2Tg1jOz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFtsD8000340
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSLMzHFcwgOEI1rXbDjysCvllpQroAwA/BFevvmuG/g=; b=m2Tg1jOz2zWQvPf9
	MDTG+F9qyDH0cGH/ms/QK6Txe7nx29GNdIMTM2yCLKivsW2thgTRuoQeY7Hw8Uf9
	SFjcs5Eex9MXGgRajDvt3Zyj+lxZpJc2y6oAdNn9Tqb54y1MJ5WPVc3RBwU+oxNw
	E0ayhxHcD2hz/6WuIMNpOQWQLhltlRl571KifGZ5JlYDi8r0KI/T8s3ecYk1qm3z
	AXMxbz4G4KvOlajIHHT4Cz4vK2+2bhQ/expZ50b1+J52aH/ajprM6QdsQefXwJjV
	3wdNhZMoVddS+Yrm5289oRV3Hu8sdpmVHyRwBPJgwpc+9/B+1VXVflZmAQ3YVY4Q
	G9keHg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkrvpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:50:30 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2c83a8ab786so1326486fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744343429; x=1744948229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSLMzHFcwgOEI1rXbDjysCvllpQroAwA/BFevvmuG/g=;
        b=ltro4yWaTichEBguW93h2D6LgbRz/Ow4x0TKjBYFf7M4IuYXMk8uO8tPCwSEfylCLB
         lbunD4hLckvDOMHt+y8fIJx2IKPgSS0ZZDT3FMam9SNpHrdFylRA/oBarAvxtgAa4Qh/
         GgDH/uBb+px9bloY/bDqk4i1GZdD9DqasC7Ka66jBoKfZNGE4MHaXZmljVauhkSTSYOf
         V5b3ApahJkOS1vFDS1dkjLHrOrtwpGYI3bJAsdgQ2ZX0ODajINiXg2mUJmC6JGwU1qxI
         F86l2uBekXwDjforu1gPwjSoPT9aSI2nH58+LGEb6ClT1in0qMeU3tS/U1YHqeEIJgIy
         Xo3Q==
X-Gm-Message-State: AOJu0YzxRFhOuKBjCX1a9xJ5Aoy/kzdkYXl3lZFFWhYwKb9a3iT9n71z
	a2XMLYuTxkl11dcJ3jmfRj56Z7ryZuwRhcqOiFkREyn6+PrzRVAy6A7PX/beKTscm/jDZsFwOed
	reG+/2zsyabSrfE9txsJuIjDs4K/k7dvCMT0Szm5aEA3p4V8ZNrOr6u28Duybc9mW
X-Gm-Gg: ASbGncvT31krtKV0Vftvpc0zt3W5exPHlGbqTPDf4i3wsoU25BPFditcsS9xuOG+9gw
	SjPMMD0btdV2qt8b61ROaW9rPsGyGm4meTADmflAaI+2t0kwP5OacCxi+ZR3GkVHi8SIb2vYc8D
	MsPG4Nd4hR/Q3Z0hiMoV45hBtCZtDPSQPI9sEGyKTRak7XzkG6SkqYJIl9hA/5hEQVhmjCdDnS1
	xcBlDH2tnfzPILTiQFL6LJqjFtxIEV999gw1BZiOCDlFZDkNTXIkmKtB2hAD6mxKE7Tus3MywJe
	vywF84SGqf1veWcXgkzH3aNURo+nAPto0w48HbK7S1ZSi2gPdXsvp+3uSuqsg9HH0aIx/EBqn16
	1CQlaYpfbzQc=
X-Received: by 2002:a05:6871:a406:b0:29e:6f32:6da1 with SMTP id 586e51a60fabf-2d0d5ef2360mr627998fac.31.1744343429342;
        Thu, 10 Apr 2025 20:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlQ5Qts3Lb+im3lqXm8gZVJFaLJjaEmOLRVqLdfs2JoQVX8YjKMatifna7YpZbd8VzKm1BKw==
X-Received: by 2002:a05:6871:a406:b0:29e:6f32:6da1 with SMTP id 586e51a60fabf-2d0d5ef2360mr627973fac.31.1744343428883;
        Thu, 10 Apr 2025 20:50:28 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969589basm958677fac.19.2025.04.10.20.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:50:28 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:50:17 -0500
Subject: [PATCH v6 6/6] usb: dwc3: qcom: Transition to flattened model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dwc3-refactor-v6-6-dc0d1b336135@oss.qualcomm.com>
References: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
In-Reply-To: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12567;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=JvFdgODbjBbS+ZvrfFLarjzmj9NETKrOx4wtULiGSAA=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn+JF9eHa3ioDQ9ZpBdgq83qklg1RMCYlVjUneV
 UEhw4Uv+1yJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/iRfRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXF+w//Z3MS8HtJShmjCcGq3htHOqqww0KJin0D7YbCI5s
 APCXkxwqXQlHtpGFHMKZ4bmlfJesj5ouU3odeyElQoB/gOhS4sQhmp+L/QNPXPGUGFGfWtxSi5e
 5boZAoFy0jQ26ljjWGhIBeRcbNRUGyeN8CstRZtskgOeqDny8zCs9UdhnnQb37stc1l5r20FLpA
 C+dXQI8l3p5Q9KM73Pc/1uACZySDP46SThcRdoc8g8JxGkNctZYW2nuF6LQdZcsIq5BnYeF8lbo
 zPl36gWI/YMDQVJqilcjklsh2LcAjk6KtKNs9BLQ9EasliaRo09S5GuSbXJhDoKdGpNrXWoLCsR
 +s8g3J1I/qyvmuzdLOgceozyFJRgt+kmc61bVH80phTitRpTgPPS77Kc4VWw/F+5GrvXlTv93ZO
 8lV4IxEe7AjTzHp6cTOGYXLIMYjgx4MHh6QWsOo8zwAcWamlB405IhdQT5h1GSkWxnxwubIRzhG
 eFGU84cnUwXZ2oQAUoz9w/Lyn0hSr1UxRjDQBVR/1ym+wBhqcKpBJcuoIB+L6yMu2SybSmTEoE4
 grNVPWpI2iOPWtF5mpsbOixg6rwch3IRxB4++gcX7PbHNCAt5xRcnTEa3OZGKuwnJlDvbZtxAax
 0emHpb0mFSpGEYIZlHz4bilWqQp7h0JwjESEkHCbQhs8=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: 9LP8WVHm75rJMCn2CfKYnV_htTWkYal7
X-Proofpoint-ORIG-GUID: 9LP8WVHm75rJMCn2CfKYnV_htTWkYal7
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f89186 cx=c_pps a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=oNyuIvTq0u59PHEm3sEA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110026

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
 drivers/usb/dwc3/dwc3-qcom.c | 168 +++++++++++++++++++++++--------------------
 1 file changed, 90 insertions(+), 78 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9d04c2457433bd6bcd96c445f59d7f2a3c6fdf24..59a3117b0f6b66949643f2b563fd6dc27c6a2fbf 100644
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
 
@@ -889,30 +866,65 @@ static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 
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
+#else
+#define dwc3_qcom_complete NULL
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
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);

-- 
2.49.0


