Return-Path: <linux-arm-msm+bounces-65572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4243BB09AF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 07:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0BCB4A19EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 05:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D52F1C7013;
	Fri, 18 Jul 2025 05:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzShy1Of"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96530208A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 05:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752817148; cv=none; b=jKFW+8EjLS1652BRtqXXzG1jY37gf/8Q06x1APM26jh+MTpHRBY9+bVdVUFntm4T/WKaepM6bgf9cI1N0TZrEmajpHW5rLk94z6wkofSR5DzY6LZmZpl+j9YKPgKJmX0UyF+vNn1TWAk2b5c6oPeioSGvvHuzKvd9PqAhbybDQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752817148; c=relaxed/simple;
	bh=3VRHSLbfFMV30+oHmvvg99voIwMBnQiupyrlI5aH2h8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QuNWuIBLrA9Zxgjv3mVPgljCDC76+s+N8qDuK2/mdu0LX89F0E1h/OivbFNN3qEoLKrtSfo+T8NaCbymayqtk+NQ2hm3DDGtPEfA2U9hW7+jXRmI7yiPs6LkLFdMnNP/GtBovvkJItND7HdIhtwmnuPNIQyyBTR8D+8jQoSjoGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzShy1Of; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJBxbI022268
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 05:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G1mpECc2DWmohZNB1xSF+YezHshSuAdDAe7
	QU653A4c=; b=lzShy1OfI7f6bvyZxXjSUWvF1eokn40YLVl3C86E2clgV7gAHQT
	Dv6IpcCLteB9ENMYBuOg/qczLMFwcqxSbJzigv+8j/pK6qZnRrHPgzE1WC7okr23
	MeQDPcRmIaiPYCmHpcLvlfN9uhDOv1X+7mpoFHypF4y0OnAo93/e9KdA1jLNtdYL
	PzJbHm39fudUBlF/ouwhHyReJ+BEre1UVRbCqIoWFS44e4kIwp7sWn3TCWQ2O57l
	rnn/z79Bk9QODlm3AYiGIVkmhX89YAVWcOVX7dQFzMwYFxNwmTCDtMwmKXIdtbHY
	G1eqE4pJzLG2IJQfx9j9Ebc7WCUhQ58VdTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsya8ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 05:39:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2365ab89b52so16212425ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 22:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817144; x=1753421944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1mpECc2DWmohZNB1xSF+YezHshSuAdDAe7QU653A4c=;
        b=J4BomHLXkZb5ivmJPuQPdp9/OKHz3JI76bBgWzSZdhioKHqDIVNYl0nXsGT+67wmkX
         Wt67t0eJzpGDkJkG4u/fZyYVuw9izthcHs2sJHu4QzpOFGlFdUwPHb+sVz1m98Ylo4+A
         y5EV/zfVEsFhwgBNfS8FwslcwBseEtly1Vw9Ka+cAQ2I5QhKZxIm4yHWPq+CnGvdsIO4
         hlx1XbHKYAkrxQVfFEa9d2Wzpb/LsALYCI14A5y5a5VWX1qPRZ+Ull8hxAx6K4l46Cq8
         vdLwqKrPculC6ixnLnwcgxtEPQRlKJiAWJChN611JysS3BXaNFYZeiMRqd/ty56EHMxN
         GObA==
X-Gm-Message-State: AOJu0YwBnt0DLw8JXb8CR7YovbzZaC/nbz0AXs7HPX6LI74yb9QlFZ2K
	BgIbIm7ZQmT7ffge5cxS2tL4O5kbZ9868tZNCbccEcxW5QTHfnCUVMw4UtjLi163eNg73WTluyd
	G4FmGvdOwYq7NHucog31qPlGNkgWANzDhshD9yPye9FO+BfgZy2qbXJAzUAiOpoZyQYfsFdnNMD
	DE
X-Gm-Gg: ASbGnctJXh7i/T9R+RMX3rPn7j/pGCwnGCkexg2bWAaS6HbnBZBJPURsQzhLAxlXyqN
	ObabWcwDmDunTWh6AlfRVCClhw27vrjp591xhNhY+DgtZjBdfHP7xFCVaoSHJDi1+FCSYsGiDE9
	DDDBTrOOfCwFZsMjTLYHS+GN/Bk0f359YTMwi2amwR5f5EzshVYlqLRiJo4CmWHrnJIDWl0gzJd
	HoIkQMX5h64HEk0Eaj7JIuifRlr3lMk2suTU4pUkA99Gwhpqw1mbwRPBuIZUteNU5Ygn8/oYsNq
	EOubNvvfV6fM+YJ0nbaJkkbVH7wR1yp8HwVa0uB7TaQUQQKOCYip6sNisLPL4zoqLtxM8XNceRg
	SEg==
X-Received: by 2002:a17:903:3d0d:b0:234:f4da:7eed with SMTP id d9443c01a7336-23e3b84f72emr25656795ad.44.1752817144252;
        Thu, 17 Jul 2025 22:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUgIQzh7Rce+Nz24SOwgDJNcyIJqreqf4m/9u80kOmZepuCO5O32Z9VbH3vpFrqTpTRPzxAg==
X-Received: by 2002:a17:903:3d0d:b0:234:f4da:7eed with SMTP id d9443c01a7336-23e3b84f72emr25656475ad.44.1752817143782;
        Thu, 17 Jul 2025 22:39:03 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe67f96sm536916a12.13.2025.07.17.22.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 22:39:03 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4] usb: dwc3: qcom: Remove extcon functionality from glue
Date: Fri, 18 Jul 2025 11:08:56 +0530
Message-Id: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA0MiBTYWx0ZWRfXzT9vly9jESh2
 tHK3C2YL+PEj3dGw0k4CLF+hyCWI5rafAdZb6yeuMEQkO6T0/nVObtsLmL+IGKF4WM+NyrMllcx
 oIMrccic0k2ACkOU4ipb6u9Su7Q8UIP1liZQYC9X0nwMPi5Yt3GePlRzdggurG7aOggI1RxS/Z/
 KkLSc4fajRvUS55t2WdnYXK9zxWzp2ClZrlj4CSAS8yhK/bFDkX0IQ7Yy9MLOX9cBQ9V7gDzFI+
 ZNFjWlrtTi7/1VgYDO97z4wIJG6F/Mm2nyRjg3fX9fsEq6C8m1Xlyc25XXW1vrH7YE52W+4oz7h
 Sk/5ptRynrl5GfhnoEWbR8c917gETD8YQ0I3NqwE2ENvaXOi7B/Yo9Lt+9/sUJ2S70qqpbAFZ07
 EV/1xyZUy65IL/eUc/JfQsM1BXvhd9w8ezW8EHzMOmbuOsFVNNMwUgESrE95MTCEdN8kG8jL
X-Proofpoint-GUID: bFvRSVFPb2mTJCeYbJetR1ZfQUBHLKnG
X-Proofpoint-ORIG-GUID: bFvRSVFPb2mTJCeYbJetR1ZfQUBHLKnG
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6879ddf9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HsaRtseu1FE5unmruSMA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180042

Deprecate usage of extcon functionality from the glue driver. Now
that the glue driver is a flattened implementation, all existing
DTs would eventually move to new bindings. While doing so let them
make use of role-switch/ typec frameworks to provide role data
rather than using extcon. None of the existing in-kernel extcon users
have moved to using new bindings yet, so this change doesn't affect
any existing users.

On upstream, summary of targets/platforms using extcon is as follows:

1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
effect on them.

2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
driver which relies on id/vbus gpios to inform role changes. This can be
transitioned to role switch based driver (usb-conn-gpio) while flattening
those platforms to move away from extcon and rely on role switching.

3. The one target that uses dwc3 controller and extcon and is not based
on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
This platform uses TI's Type-C Port controller chip to provide extcon. If
usb on this platform is being flattened, then effort should be put in to
define a usb-c-connector device in DT and make use of role switch in
TUSB320L driver.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v4:
Updated commit text to reflect the patch doesn't affect in-kernel users.
Removed RB tags from v3 since commit text is changed.

Link to v3:
https://lore.kernel.org/all/20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com/

 drivers/usb/dwc3/dwc3-qcom.c | 90 +-----------------------------------
 1 file changed, 1 insertion(+), 89 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ca7e1c02773a..a7eaefaeec4d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -11,7 +11,6 @@
 #include <linux/of_clk.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/extcon.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -79,11 +78,6 @@ struct dwc3_qcom {
 	struct dwc3_qcom_port	ports[DWC3_QCOM_MAX_PORTS];
 	u8			num_ports;
 
-	struct extcon_dev	*edev;
-	struct extcon_dev	*host_edev;
-	struct notifier_block	vbus_nb;
-	struct notifier_block	host_nb;
-
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
@@ -119,8 +113,7 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /*
  * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
- * validate that the in-core extcon support is functional, and drop extcon
- * handling from the glue
+ * validate that the in-core extcon support is functional
  */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
@@ -137,80 +130,6 @@ static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 	}
 }
 
-static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
-
-	/* enable vbus override for device mode */
-	dwc3_qcom_vbus_override_enable(qcom, event);
-	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
-
-	return NOTIFY_DONE;
-}
-
-static int dwc3_qcom_host_notifier(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
-
-	/* disable vbus override in host mode */
-	dwc3_qcom_vbus_override_enable(qcom, !event);
-	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
-
-	return NOTIFY_DONE;
-}
-
-static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
-{
-	struct device		*dev = qcom->dev;
-	struct extcon_dev	*host_edev;
-	int			ret;
-
-	if (!of_property_present(dev->of_node, "extcon"))
-		return 0;
-
-	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
-	if (IS_ERR(qcom->edev))
-		return dev_err_probe(dev, PTR_ERR(qcom->edev),
-				     "Failed to get extcon\n");
-
-	qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
-
-	qcom->host_edev = extcon_get_edev_by_phandle(dev, 1);
-	if (IS_ERR(qcom->host_edev))
-		qcom->host_edev = NULL;
-
-	ret = devm_extcon_register_notifier(dev, qcom->edev, EXTCON_USB,
-					    &qcom->vbus_nb);
-	if (ret < 0) {
-		dev_err(dev, "VBUS notifier register failed\n");
-		return ret;
-	}
-
-	if (qcom->host_edev)
-		host_edev = qcom->host_edev;
-	else
-		host_edev = qcom->edev;
-
-	qcom->host_nb.notifier_call = dwc3_qcom_host_notifier;
-	ret = devm_extcon_register_notifier(dev, host_edev, EXTCON_USB_HOST,
-					    &qcom->host_nb);
-	if (ret < 0) {
-		dev_err(dev, "Host notifier register failed\n");
-		return ret;
-	}
-
-	/* Update initial VBUS override based on extcon state */
-	if (extcon_get_state(qcom->edev, EXTCON_USB) ||
-	    !extcon_get_state(host_edev, EXTCON_USB_HOST))
-		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, true, qcom->edev);
-	else
-		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, false, qcom->edev);
-
-	return 0;
-}
-
 static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
 {
 	int ret;
@@ -737,11 +656,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (qcom->mode != USB_DR_MODE_HOST)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 
-	/* register extcon to override sw_vbus on Vbus change later */
-	ret = dwc3_qcom_register_extcon(qcom);
-	if (ret)
-		goto interconnect_exit;
-
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
@@ -749,8 +663,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
-interconnect_exit:
-	dwc3_qcom_interconnect_exit(qcom);
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
-- 
2.34.1


