Return-Path: <linux-arm-msm+bounces-44960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78471A10033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 353ED3A43D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B6624333A;
	Tue, 14 Jan 2025 05:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSJ9/9GG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD58237A3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831178; cv=none; b=tfG8jocbGIJcmTGq/nTGRarmrW7bVTyGkUR/xwg35dyYbmo2u+dhxXhyDRA1+VOuuJ/BswkVCy2kH4GU7bt9F99Oj0Bl5NGIuBwRaRxNYjSXcbQG19tOZzhP8CGgvD54u44V8MOGMCI++9OinVZDPOr2CzamNg4phAHOyEQvq0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831178; c=relaxed/simple;
	bh=jlR6+ARwM/Lr0teTiCl1CKnctX2uH9kwYJiHn4/8YKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9xVuxgPxjJ/sJk+zJ+Pmg6o6Ao9MjV0pDj9if80bos3lZlpoSSwyyhZKzvDzq+U/i7pPFNaDdYxE3e8H1pGNabdJIIdKPqgyU5TQyNX2QMHGDQSVJWdnlcjJFbQbtrb22ogyEASe8sMBGvApHjc26DjrZXd+JmhrQrYPz/BQEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSJ9/9GG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DJLZl7002853
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVofHqa/Meq48kmXydox7fcxL/v6GrgcWjFrX0DvEHE=; b=DSJ9/9GGoaSIOZom
	E2qWTn23GWKiPwTT1EG41yhWugpnWdK76D55Ly/8jiB3K60x3xTtv1vEP3guZaox
	7k4jmqe1JDhA821imkFOp0aCBd08TN8W0Rln7aT4Rjz4LdnhDUzAK+LIdmy1eL7I
	26n14HNcHZCDUKmfWJfny298cY03J31q0XL1zwGdTIPgnhST0t/JTsEbz8yc9Pz0
	2gFwauz9lT3QzJe63bYbXgxxVvvd3rR2i8EQJIELoMXwPXpBhpB0ccimwBGEdZHr
	ZCtBNuCRFj6gWB3isdh1ey7MltKWSfpqPRcr3ML2Z1UJ4UQpghRX4aY97S3/a31n
	4zuZlg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458ww92eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:14 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5f368647450so3782661eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:06:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831165; x=1737435965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVofHqa/Meq48kmXydox7fcxL/v6GrgcWjFrX0DvEHE=;
        b=jIc9vgubHFoipiSue+yMXjEGrdN2r9zlJPk7hGrvsJweswlEIavAFS1ACUxZLjJJaP
         HlT14FFbzYJkZcutV3WGl+GL3cFrsvxUIk+xX/wunYd3eYjqTL8YzxyfOacGWyqyqZOf
         G5mgK00DBnK5UWu/UbN7dyMXs8mDPRBls2EZcUkc1D4f/NY2C/z8kgUgjvNa+YLixwa2
         5sUm6XGfHLpohqvjUOcOWVIKp5on/qqajOWis2SReX+ncbJu/w0n9yTXUMjtCnvPtvUM
         8eZU7CMNFpMa1so+DZlVnFZbNUyIqlPz4GkhQadOm9eFn2LF+yeKJ9i8E0v78dkDk1CH
         0dtg==
X-Gm-Message-State: AOJu0YwDb+iWs3pVHhkJ88GGBvGzOAKGxGvg6xNOmxmfOYYl4qiiaO4c
	o0Egjt8LHYw/KKhIrCGixtF2iWNb5ul7xq8KZc2NL1dqmiyw3hv1TdyCk+sYObxr2ZHH/8iHisg
	aR0GpKbjuginjUtOXPaCFRJbffO/F0q7BcK+OrFwfu/dMlG8UjvsD0qerre72w2Sv
X-Gm-Gg: ASbGncthkPOqGHZiizW+hM4iPTFIBQK8S4HI5ZCmB3Gsjjv1AS9896tLLWjtbFFem0j
	CyqjGmCb0dLL9LdZQylx6qHBwrxfQa83RZdLwR887SgG1WTnk5Zq6xAF+09VXR2J9r9JEswn17w
	RnVGTina+A6radOnnjI33dsLFEya0X04krFJcqtFp8yZcHJxfW8dLT9AS8EehwXsOjrPunBw00R
	VYjzMthAuY2sBfcSou12cJHC++k0msxuTJBLPOl1BwF90m9vTv93I0MuSqflwlVBiZPVC8wc+9U
	c9imXmk/hb1VAcCDNQRrOIZi2J0Ze/KKm40LAiVGzY0x6cJdK7eDCLv7
X-Received: by 2002:a4a:b18c:0:b0:5f7:339c:27a3 with SMTP id 006d021491bc7-5f7339c2a17mr10442484eaf.2.1736831165096;
        Mon, 13 Jan 2025 21:06:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqwl+eWCMyO3CPeK27lGBS3soliNfv/oFDlsvsyLoUOt2edrVJrjKWfLPHuUuRhDEwv+gaWQ==
X-Received: by 2002:a4a:b18c:0:b0:5f7:339c:27a3 with SMTP id 006d021491bc7-5f7339c2a17mr10442472eaf.2.1736831164686;
        Mon, 13 Jan 2025 21:06:04 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:06:04 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:44 -0800
Subject: [PATCH v3 11/12] usb: dwc3: qcom: Transition to flattened model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-11-d1722075df7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12227;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=jlR6+ARwM/Lr0teTiCl1CKnctX2uH9kwYJiHn4/8YKg=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVF8ZS6KvJ35selAj1vSpjlZm3Yeq9BWchE
 bCGp6PFz96JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXySxAArHI/3Zvmt0ED3fxHD4ZMqHAT0B3JgArgbUgZRjE
 4Y3nZaS85rWC5dvHXyLDraiWhb0QRR98qJJ0syGjbLN4+MYjX+BZyvnPjfBGHSEN+CHyXqBXEuM
 OR2zb/k8luHfhX6cghWBNusirfXcrHQ74wnv2PECTk1KQtbnuQ3fx0JCxJcVsMEgxaesV4g680T
 2wAc8ueRWvVhTqDSXodcmGwWkPaS/zPMneRGBcbcBsTvxVfDXtbvwLxYa090scSvrj+md9NxdoV
 mxA6lR0iOGfhrg9M+jQsyJ690Xzo1Rf0UCZefuRbhLm0lGx9P+AK1x34JG3MPEEig2SfDoY4/Dz
 p0KfOwXC9yXM4OFyW6Z8ElMxbkECBXfc5VAQl1d45RJHQrpZpvaTHFtNUzqBzFS8tORuX+7ssos
 +EbMuX6arRYPaVQM+IhLrJXGdU/4E/VSZ69ck97nL2wdZnxL46+4KWGQKtahDK8nPqgMG3v0vXr
 jIfo3zuq7WODv6TanIEFbYm05Bq/+4k2WOKYN+BAXuyzwptwtf+tmDKzAIAeN8nGRkreViUelDb
 EoVe2CdiuKXcOKOipttVacU/lOsgaX58XiodEXqP2Ssv5tKj9VzCzfD0O7FOkCA6NqZt8VyRYyf
 XmaLpKUslNELRTmrhxy2B/0bieZOyi99pF8dsqR9RIqA=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: cWcUF_g_MZY-owrfsYAbNb0TLAJH9Bz6
X-Proofpoint-ORIG-GUID: cWcUF_g_MZY-owrfsYAbNb0TLAJH9Bz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140040

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

To handle backwards compatibility, and to remove the two-device model,
of_nodes of the old compatible are converted to the new one, early
during probe.

This happens in the event that a DWC3 core child node is present, the
content of the reg and interrupt properties of this node are merged into
the shared properties, all remaining properties are copied and the core
node is dropped. Effectively transitioning the node from qcom,dwc3 to
qcom,snps-dwc3.

As the dwc3-qcom driver is migrated to support (and only support) the
qcom,snps-dwc3 binding, the kill-switch in the dwc3-flattening overlay
code is removed.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 .../of/overlays/dwc3-flattening/dwc3-flattening.c  |   3 -
 drivers/usb/dwc3/dwc3-qcom.c                       | 136 ++++++++++-----------
 2 files changed, 66 insertions(+), 73 deletions(-)

diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
index 07f90360c04d..44bc97ac53c0 100644
--- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
@@ -1500,9 +1500,6 @@ static int dwc3_flattening_init(void)
 	int overlay_ovcs;
 	int ret;
 
-	/* TODO: Remove kill-switch as dwc3-qcom is migrated to qcom,snps-dwc */
-	return 0;
-
 	match = of_match_node(dwc3_flatten_of_match, of_root);
 	if (!match)
 		return 0;
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 50b1da845113..df1ee6961c9e 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -14,7 +14,8 @@
 #include <linux/kernel.h>
 #include <linux/extcon.h>
 #include <linux/interconnect.h>
-#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
@@ -23,6 +24,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
 #include "core.h"
+#include "glue.h"
 
 /* USB QSCRATCH Hardware registers */
 #define QSCRATCH_HS_PHY_CTRL			0x10
@@ -73,7 +75,7 @@ struct dwc3_qcom_port {
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
-	struct platform_device	*dwc3;
+	struct dwc3		dwc;
 	struct clk		**clks;
 	int			num_clocks;
 	struct reset_control	*resets;
@@ -92,6 +94,8 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 };
 
+#define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
+
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -260,7 +264,7 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
 		goto put_path_ddr;
 	}
 
-	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
+	max_speed = usb_get_maximum_speed(qcom->dwc.dev);
 	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN) {
 		ret = icc_set_bw(qcom->icc_path_ddr,
 				USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
@@ -303,25 +307,14 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
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
@@ -498,7 +491,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 {
 	struct dwc3_qcom *qcom = data;
-	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc3);
+	struct dwc3 *dwc = &qcom->dwc;
 
 	/* If pm_suspended then let pm_resume take care of resuming h/w */
 	if (qcom->pm_suspended)
@@ -700,40 +693,13 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
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
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
+	struct resource		res;
+	struct resource		*r;
 	int			ret, i;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
@@ -742,7 +708,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (!qcom)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, qcom);
 	qcom->dev = &pdev->dev;
 
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
@@ -771,8 +736,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
@@ -792,17 +764,18 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(qcom, pdev);
-	if (ret) {
-		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
+	qcom->dwc.dev = dev;
+	ret = dwc3_init(&qcom->dwc, &res, true);
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
@@ -815,20 +788,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
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
+	dwc3_uninit(&qcom->dwc);
 clk_disable:
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -842,13 +810,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 static void dwc3_qcom_remove(struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	struct dwc3 *dwc = platform_get_drvdata(pdev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	struct device *dev = &pdev->dev;
 	int i;
 
-	of_platform_depopulate(&pdev->dev);
-	platform_device_put(qcom->dwc3);
-
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
 		clk_put(qcom->clks[i]);
@@ -864,10 +830,15 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 
 static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
+	ret = dwc3_suspend(&qcom->dwc);
+	if (ret)
+		return ret;
+
 	ret = dwc3_qcom_suspend(qcom, wakeup);
 	if (ret)
 		return ret;
@@ -879,7 +850,8 @@ static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 
 static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
@@ -889,31 +861,55 @@ static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 
 	qcom->pm_suspended = false;
 
+	ret = dwc3_resume(&qcom->dwc);
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
+	dwc3_complete(dwc);
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
-	{ .compatible = "qcom,dwc3" },
+	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);

-- 
2.45.2


