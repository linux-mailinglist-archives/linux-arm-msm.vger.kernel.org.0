Return-Path: <linux-arm-msm+bounces-60737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A132AD3195
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78862188D993
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D4C28C033;
	Tue, 10 Jun 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4ZgTby1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711CD28CF69
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546862; cv=none; b=a0405dijHeyCS+yzLK+ToOfbpIWtKWiWLYx1dH/WYAg1TshHJfp+CoSZ3E4zq9bzLi3lUzKt+gLt2Gg6OghCBE8QX8grZw1LqIBpQjzY/BlyLpzVeCGydSxJwZsZEsWP8UWstrhi/va71SfpmjjCrUAhFrfvXS2v15WWUJ4GitA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546862; c=relaxed/simple;
	bh=euV+fbYXNTbYMl4eJVb4KK0RriCHNxifXVblrf9rQ20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pj0ZTRCbeNgGmztesYLuQvZd9AJwvyHhoB7KZuKQzcPxEd1CH1R/j5V6Xj0CL3S/Q6C/SF6eUI6+bDx7O2ORwRCbGavsfkAAWKqN7UsI3VwB6vealxDi6xH9SfyOsAjQh2oKzj9QPHXcQKuXZWYLtcRb/G/CvprQv71XgMWF8ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4ZgTby1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6XvlW026905
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nk+S4I0TlH2
	z4qmWoHPeH+Psft3DzglIZdxip0XMeN4=; b=O4ZgTby1v4QYeaY5EhV/Dd34Wk1
	js7nNev59Imtwd6iJxpmJ8o/tRsBPGai++SeTGVR3cRX/s+7ZZY+QL+r+yclVOZM
	4AmS5Te677kWH8TEnpn42kVt8paOMzlGAzDpc5G+4z/5pX/uc2j+vX2irLhsVtub
	NFzf+1E2wbqiQesZyZnQ8eYDaRyuYBKo8lT6791ZBd8t9WYkgIUciXSoxpxccjCq
	4ZqtMur5b/w+Xf6sRjlGRwfFklPo8e5wY21xH97F6JvMQU+tA4oZo9IksN/cT0C0
	55OnPUMgYmvYDaG98bR5fPGYI7uGUnHlDFjwITYSYwG84r11oWy/q8M8PjQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4762tg26ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so7705288a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 02:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546858; x=1750151658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk+S4I0TlH2z4qmWoHPeH+Psft3DzglIZdxip0XMeN4=;
        b=ARCFcK89CZMaRoOVdvuNepyozEDWShC64GvwYCj50loUscmKEPo1KDqbWdI09/JGa3
         tIucOzvphjwLk2fv/1bBJOjDHziolRN9QgySNx6FePojjLfO9vp3NP5+ObeYPP0EzvXQ
         px7XafzvwcyBXkZN9XNx8G+k99OcI5cbNUhG2hHZhBswKy207LAKh17ELXWUpin/4oaJ
         SRj+mza6WLz/RJZ2+eU6wtpPBn3m0Yme5d86JDLB73Nu1XC9v4zrprZ9VadrTdyXIKpP
         5vd6MYuO2DO6qnu/+duw0aXJ8qrKGHb72FBvt3RC+qMD783Pr6kanrcyUfjRSCfoF60o
         Y7AA==
X-Gm-Message-State: AOJu0Yw6vHpIyyVKqtcdf3KiD2WBe0nTxRn4Q5P/GK5WNGmEjmWtW8vX
	/XO+5PHRyOu4wz7VtXkuW9pYlfERWUteMbczB70OVAokkeJwxqID9CdFwo+I1dSrYgEANzgfKw+
	QNOoqo5sQfu1G8Rn5Cuk4JIVmbbrue/Xpj74m750ALdgxKNGQkMfJdiKLRLPrceUgWblv
X-Gm-Gg: ASbGnctH346EynL6CgTKbQz/MZhW8d643VjN8mHYLlpPq9qVg+7oC7NC7ztmyG3oBE3
	xZE+Z5iF+A7ObxYl4QbpwNJQMQ78jbfgichwoRxFDtBQgfaQtLHcIvKrigg6RKrDnvNQE5eP5qB
	TWliM2XWhLSGgfmLDHvzIkXEZaWieyfe8F0T9wS7HJG8AMLW1TxTYaOWsYq/uEUG5LJbOUYKfLy
	vZywYDomstyR4BO0hPETkOuwP2lhMF2uVV/lRfaCy1nVYOKOhM2GAPXMHo8nPzhIJypGsdPdjtT
	oOsEFhry2vf5nAmDssHW+ohHemwvAk+deOsX8Nu/e2pFGPF3Hc9usTK6F/MN
X-Received: by 2002:a17:90b:3b92:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-313472ec763mr22830128a91.13.1749546857934;
        Tue, 10 Jun 2025 02:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELox5dA0ziiallWsp271HuMBN3cbaKKMWH6TLzvTwcc9o/ILNrURvqAD8FhsIAGvrwut4eEw==
X-Received: by 2002:a17:90b:3b92:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-313472ec763mr22830082a91.13.1749546857459;
        Tue, 10 Jun 2025 02:14:17 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc3e72sm6913550a91.31.2025.06.10.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:14:17 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 4/4] usb: dwc3: qcom: Remove extcon functionality from glue
Date: Tue, 10 Jun 2025 14:43:57 +0530
Message-Id: <20250610091357.2983085-5-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZPyz/t c=1 sm=1 tr=0 ts=6847f76b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HsaRtseu1FE5unmruSMA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfX3WDbK0vsFNqi
 QH5Ej3v+ED+dI/FYEI+pTyl8fkxzdrhGtjUsHz/42Bt5i3AfgbJQjT69DKdPfWV6sixjJTrk7EF
 0R3GLjhilI2wREAUpE4FyQNHq9ZSfKZr883zh1GimnSt82RZV7LCVMscd5L49ho/JJVwwaxGf/H
 mdS23zo1l6HyMRTFMi9OcdZCMBqqDn9WPtf1HcbrrEUSaK23I4pMDU9sc0tMjwlbd5db0tT/pBP
 +Xe4YRYaNVLdZ+CVa1xaKZJN2QmVIiOJTFmjz1g3x/KW4tciTXzBGDSJURLK4r4ZDAWIWhFGGWG
 Sd1y3/DVKJ+5knvSbSQZ94UvIJy96szLee3PGjtz0BCGgRh2vgj6bwWF00fmx6w68+FZJvgxWgn
 +K/Bs7jELNPTk+1eBXKTCJSmMrvAhJRUKFtlrbScbijs+h+IzXdCcbS0pqfDwoX9PTlWMfCS
X-Proofpoint-ORIG-GUID: oadkBcUOpLkRgHh_5xdM59uvV-wn91Yz
X-Proofpoint-GUID: oadkBcUOpLkRgHh_5xdM59uvV-wn91Yz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100070

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
 drivers/usb/dwc3/dwc3-qcom.c | 91 ------------------------------------
 1 file changed, 91 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 17bbd5a06c08..1a73a7797d41 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -79,11 +79,6 @@ struct dwc3_qcom {
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
@@ -125,11 +120,6 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-/*
- * TODO: Validate that the in-core extcon support is functional, and drop
- * extcon handling from the glue. Make in-core extcon invoke
- * dwc3_qcom_vbus_override_enable()
- */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
 	if (enable) {
@@ -145,80 +135,6 @@ static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
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
@@ -848,11 +764,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	/* register extcon to override sw_vbus on Vbus change later */
-	ret = dwc3_qcom_register_extcon(qcom);
-	if (ret)
-		goto interconnect_exit;
-
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
@@ -860,8 +771,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
-interconnect_exit:
-	dwc3_qcom_interconnect_exit(qcom);
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 unregister_notify:
-- 
2.34.1


