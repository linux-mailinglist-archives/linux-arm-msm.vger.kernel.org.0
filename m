Return-Path: <linux-arm-msm+bounces-64741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3CFB0354F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D622D1896861
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 04:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13F81F5838;
	Mon, 14 Jul 2025 04:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/Kjhy3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF23012CDBE
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752468437; cv=none; b=gR8kpEK1ZTYx7EWKRe3vJjNH9AzcbwQ/NFnhbTcnIH4Je2ELlxlNJNcPhRgYORGOO8kLNuLJ5OH68Kx9npngWayqaqTRpCmnUIT9Xbq+M3DDgcmiH9pcnzFZ3Cmbiy9o1z94zZxs4M4GN370scLQtPZ9qL9RF59FKpv0pdjNkj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752468437; c=relaxed/simple;
	bh=MIpQ5Q0VIvo+JU7aGA6BR/cFkK3jmGi9K39tdTwVBLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OO1ppe8SuMwV/evBVSouAXUfjNV6SpFZ4EZ2+4r+gaLhUpsXiDxcyniWrsoQtz6FeDPLpUtJonXIRo5DuDQzRetJT2CPlRI9Xiu6JUi4TlUMtPl9G9JzBdvNjbw62EkTS7vMmL2HIiFueuN4hcynrXb2kiwLUQeyJL/m9mWfxAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/Kjhy3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E1EDNN022513
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SMotp43FosdZ2W0txBdCz1GbIq+fsqM3Dsb
	xm8sifnc=; b=X/Kjhy3AVPBxVQ+MENVKG3xIYwt4yuQe38mZOgwRYcni+DeDjOq
	7XgGu0REyv9IDc4IqtaUQSjoGtSElunY+QLhm3liVyOJrS9cu4Jp35nF2h67MAi1
	cgeMe9Yv/t2a2VV832pCT81ybjvAa7G+X+o8ETmYU+j8O5gZZ8owZ1q90OneMbEP
	ayUD2B6gzZfNmRmoJF9no5Hxik9mrNggyp9swJg6fjzFdDuBWlZSwwQsLFPyAWr+
	2j6g4OTz9atxg0En9Zs2GeTz3xDQoDFqSYTy324HVkalfpJlyJJB0N1yVV1YAsYD
	zpIdhce3RHGlBwNiOLm8WubeAVO2I1uvM+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxau8yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:47:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2382607509fso22954305ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 21:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752468432; x=1753073232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMotp43FosdZ2W0txBdCz1GbIq+fsqM3Dsbxm8sifnc=;
        b=fnGZqv45JXoAufuYnT4cj0JL+5LJObU/2aXaV76DuYWulk1uefkxYnnO2gDRufxh83
         pXdIDJTnmc5ltTmwzIj1XoOe4RTewWrYsIHLaxiDoBTyx0T+Iti2FyuOUGv+vNylMJ49
         mHpYDOvQid0RHkHo9JGU/TMf9soxKf8SWhwZDLroku3s298LmF0+7ik3UevVCyrsZ9Jh
         5IK3Mv61Llk4fxzRBTNhIpQ4ItqN8zPThgRUafDgs0DdyDbhHQebhEJkdmK0UyG5PPsA
         9g2L4SsJdCv7830IUiOOrfHWt00UkqG9QYANXgvJGAdyr52LmLf44RzbhMKG0P4E8zkV
         z3mw==
X-Gm-Message-State: AOJu0YyffI2ONP15c+4kKAq2hkUHMUZu7iWmOTQMvCE1ydIiekrxutiC
	fADvDJTf+7IkbdY1RhYMJHqRL1HE89cd3aeGVQBQruu+UfFcdYg/PDNdCc2zmIQKRWTf07cjAdf
	88RyACLLeufQcUsBpZd8I133V05VLXRG9Ld3wJO1ibmlJLxCD/Ho/+lPpSAOvGtbL0/mG
X-Gm-Gg: ASbGncvB0CyI9RV0XUp9NhKh/m1NXWfIt6DhWoRkA5HK42XRC+YRjSg0ccfagVi7yxQ
	0qGT53q/p6hPZ6zWkhCzFs0oYa8P3yiBK95esCAmBV9kpGQnTSFHPLTB1w2MDwsX76muVK1/HiC
	OPCc4pCXarji3MjOGDtPvtFWfz+zz+EwRy99SGHaQ4u2jkD6I7D3LnBxxjLenriGTDdPYOuBcNn
	Wi54+tVnPDzWjawwSKhjTvV5K+sclM3yP1NtsFM32/r19qph8H0n+iSSGxHoQwdb8n3oI/Yijdl
	aEFsLgUYHs9fjCpJbglFX+ubRRn89tUOmmS3bI/fipnzNautGYpsxRhs3B+NvTzQZEioAM5hWWO
	KZg==
X-Received: by 2002:a17:902:c407:b0:235:f298:cbbe with SMTP id d9443c01a7336-23dede387d6mr180694465ad.12.1752468432255;
        Sun, 13 Jul 2025 21:47:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/chjcZA9pDzqtEq6QhkNj4Ah8vf7hGn9SFCFAv1D5BS5L27T8vry5begaHNsu51w5tceLag==
X-Received: by 2002:a17:902:c407:b0:235:f298:cbbe with SMTP id d9443c01a7336-23dede387d6mr180694075ad.12.1752468431808;
        Sun, 13 Jul 2025 21:47:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4323df7sm84017235ad.134.2025.07.13.21.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 21:47:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
Date: Mon, 14 Jul 2025 10:17:02 +0530
Message-Id: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TF82LyjHGr69x2lrQ54EBDoFhhxr0gjU
X-Proofpoint-ORIG-GUID: TF82LyjHGr69x2lrQ54EBDoFhhxr0gjU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAyNSBTYWx0ZWRfX/9gqe46p3NXF
 Jcqnf+dsWq5lPLxkCLOt9N3F1TlVq117tqT/qHEcv3OumWlpVKw3tuNOf7tYzoVouSF/JEafRrS
 Tae+ek5ngPZKJ1EDL+KSg7TuPtDbd+OJOWc65g2T1Cz4CQNRbfLqAX6ug2rlz7NQqJMmsTx6r+o
 1WNox4dgg1IMaob2aVMjVz8WBsTD7/fKyowQzW9ucJgSyu/eMmNq53S1sch4gUGkWp9rLkzIvUe
 5z+HgNG7CP4J3NXOrl65e2ZHjNnGbMo6PRVVpT7U5hVautLVubfXjjogsF2qtjtmGiyW9K5w4fD
 sqLWP0wWcuez1Qr/0eQ2g6BaFh2pLzW8h+alJl2yqjhPP+pjW/TIYL3nqSaEH/F2k+JyJQB3sz7
 bXYnnuvT8jsiSVNc4pBaGZs7pLwRAUd5/umx6+L7PZgRZusMnagmaEjaNfw+a/gzHFNyE5nz
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68748bd1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HsaRtseu1FE5unmruSMA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140025

Deprecate usage of extcon functionality from the glue driver. Now
that the glue driver is a flattened implementation, all existing
DTs would eventually move to new bindings. While doing so let them
make use of role-switch/ typec frameworks to provide role data
rather than using extcon.

On upstream, summary of targets/platforms using extcon is as follows:

1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
effect on them.

2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
driver which relies on id/vbus gpios to inform role changes. This can be
transitioned to role switch based driver (usb-conn-gpio) while flattening
those platforms to move away from extcon and rely on role
switching.

3. The one target that uses dwc3 controller and extcon and is not based
on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
This platform uses TI chip to provide extcon. If usb on this platform is
being flattneed, then effort should be put in to define a usb-c-connector
device in DT and make use of role switch functionality in TUSB320L driver.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v3:
This change was 4rth patch in [1]. It was suggested to make this as the
first patch of the series. Since this is independent of role switch
patches, sending this out separately. Removed RB Tag of Dmitry since the
patch has been changed.

[1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/

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


