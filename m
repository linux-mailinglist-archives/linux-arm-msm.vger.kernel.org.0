Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA533B7B78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 04:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbhF3CW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 22:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbhF3CW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 22:22:27 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2985C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 19:19:58 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i8so1622420wrc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=PG5/J+SO2n+cg94gCD3DX5ddKn8LFLdn7n7a/3xcG20=;
        b=e6Ir0qVSFRD79WyNHySA/DWWE6IqoZvhDvBmzgx7102B7+ZMvjpFgaFoO5Nn09iNOQ
         OQDWmgPYl5MAfV0apnzhboQLGnch8k6JxB8vdobVwUglvk9/1CksPeKKojy6UNRz1W1M
         sWoLJYf74fREtXOeVK2NMycl+W7D+M1E/xHvODM+CRNczg/qE9KWDLHX1X08FYcXHKVp
         fj1ZkBiCl94cWiR6hUql9qHsTqZvfyA3YhWfjeOLWnFAh068OmsG5fqu6PKKjuoqtiFH
         NOKTDVGXbzJLOEQW8Gk+Ctmdgn+jprdjTSAqWyQkVnsovEutMXYKMbVZTasMSefwF6Pt
         gn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=PG5/J+SO2n+cg94gCD3DX5ddKn8LFLdn7n7a/3xcG20=;
        b=QiEh5hRCpAbCU71mfGzGEZYSmL1HQ19DUBA0BXzPkD60PH21n/fVq1be9aVDX95GqF
         bBaPscRiBQbFhjdZqozm9zatp35Nm4dy6w2e+yqbCqQm1m1DlevagaiByu7CIrHOIafW
         fu1TTbwom1YRnsApRBUdeyYW9HfouAPp+LVMTQir3IMqPG4vbZLmUL24YT2sRgxXKO2/
         XuFfRbdTBBVQQUFmzCwLQXSjVq/EZGTwQeBSkwZ1NUWaaItaa4vHHcapiu/dI81S1vgx
         4pQ8ZYBUS8CemGlRGlJeE/tngVvgT3p6TIX+8o9uZKaI/calz4iY93uBUXWd1QIco3Oq
         zVcg==
X-Gm-Message-State: AOAM532GhnOx4s3iPiz4xe28qatfTp4Culf4CEeiGPd7Rubi80RBjbfP
        cSzRWM9Mn9b7AhnsM4YiXkPIvYpfBUJkvQ==
X-Google-Smtp-Source: ABdhPJwwTM7EYb99pb6cG30rty/k412lovy4rhiVU/+q0aMTRFYTI7vZMd2H3bBASMJDA4iZVqrwpw==
X-Received: by 2002:a05:6000:5:: with SMTP id h5mr36620344wrx.216.1625019597448;
        Tue, 29 Jun 2021 19:19:57 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t9sm18952179wmq.14.2021.06.29.19.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 19:19:56 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and register
 role switch
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jack Pham <jackp@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org> <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
 <20210629200228.GE25299@jackp-linux.qualcomm.com> <YNuC0Njwr4B1Q1xZ@yoga>
 <0f112cf5-1f71-f189-5a3a-2ff4dbcaa8e8@linaro.org>
Message-ID: <d8902c0d-ae51-644d-f33b-19f452308097@linaro.org>
Date:   Wed, 30 Jun 2021 03:21:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0f112cf5-1f71-f189-5a3a-2ff4dbcaa8e8@linaro.org>
Content-Type: multipart/mixed;
 boundary="------------42AF9040477A4BAD376EE0FE"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a multi-part message in MIME format.
--------------42AF9040477A4BAD376EE0FE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/06/2021 22:57, Bryan O'Donoghue wrote:
> On 29/06/2021 21:30, Bjorn Andersson wrote:
>> I liked this, and it worked when I tested it, but iirc it suffered from
>> the problem that the core's probe may or may not have finished
>> successfully at the time that of_platform_populate() returns.
>>
>> But fixing this problem would save us quite a bit of headache.
> 
> OK.
> 
> I will take a look at resurrecting the old patches either fixing the 
> probe order - or perhaps using something like Wesley's role-switch to 
> have dwc3 core optionally trigger dwc3-qcom
> 
> Binding tcpm into &usb_1_dwc3 instead of &usb_1
> 
> ---
> bod

So here's a potential way forward. Not technically breaking my "no 
patches at 3am rule"

Basically we can fix the probe order problem if we have dwc3 drd call 
into dwc3-qcom.

In order to make that not be a problem for all non qcom platforms - use 
a function with weak binding in drd - which a wrapper - in this case the 
qcom wrapper can over ride..

---
bod

--------------42AF9040477A4BAD376EE0FE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-dwc3-Add-support-for-a-role-switch-notifier.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-usb-dwc3-Add-support-for-a-role-switch-notifier.patch"

From 329ffacea542163fe7ac798b77db7cb3599a65ac Mon Sep 17 00:00:00 2001
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Mar 2020 19:15:00 +0000
Subject: [PATCH 1/2] usb: dwc3: Add support for a role-switch notifier

Role-switching is a 1:1 mapping between a producer and a consumer. For DWC3
we have some vendor specific wrappers, notably the qcom wrapper that want
to toggle some PHY related bits on a USB role switch.

This patch adds a role-switch notifier to the dwc3 drd code. When the USB
role-switch set() routine runs, the notifier will fire passing the notified
mode to the consumer, thus allowing vendor specific fix-ups to toggle from
the role-switching events.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/core.h | 8 ++++++++
 drivers/usb/dwc3/drd.c  | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index dccdf13b5f9e..7f81ee3a9657 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -995,6 +995,7 @@ struct dwc3_scratchpad_array {
  * @role_sw: usb_role_switch handle
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
+ * @role_sw_nl: role switch notifier list
  * @usb_psy: pointer to power supply interface.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
@@ -1136,6 +1137,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	struct raw_notifier_head role_sw_nl;
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
@@ -1586,4 +1588,10 @@ static inline void dwc3_ulpi_exit(struct dwc3 *dwc)
 { }
 #endif
 
+#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
+void __weak
+dwc3_set_parent_role_switch_notifier(struct device *parent,
+				     struct raw_notifier_head *role_sw_nl) {}
+#endif
+
 #endif /* __DRIVERS_USB_DWC3_CORE_H */
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 8fcbac10510c..7ae09730a319 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -507,6 +507,8 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 	}
 
 	dwc3_set_mode(dwc, mode);
+	raw_notifier_call_chain(&dwc->role_sw_nl, mode, NULL);
+
 	return 0;
 }
 
@@ -563,6 +565,9 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
 
+	RAW_INIT_NOTIFIER_HEAD(&dwc->role_sw_nl);
+	dwc3_set_parent_role_switch_notifier(dwc->dev->parent,
+					     &dwc->role_sw_nl);
 	dwc3_set_mode(dwc, mode);
 	return 0;
 }
-- 
2.30.1


--------------42AF9040477A4BAD376EE0FE
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-usb-dwc3-qcom-Implement-VBUS-role-switch-notifier-ho.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-usb-dwc3-qcom-Implement-VBUS-role-switch-notifier-ho.pa";
 filename*1="tch"

From 9d2b50b448f7efd8b3891a2e8f52440794ed2958 Mon Sep 17 00:00:00 2001
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 30 Jun 2021 03:10:49 +0100
Subject: [PATCH 2/2] usb: dwc3: qcom: Implement VBUS role-switch notifier
 hooks

Implement dwc3_set_parent_role_switch_notifier() in dwc3-qcom allowing the
core drd code to call into the parent device when it has successfully setup
all necessary role-switching logic.

The qcom-dwc3 binding reuses the existing VBUS notifier for extcon
receiving notifications from the role-switch layer instead of extcon.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49e6ca94486d..1b5aa345d025 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	struct extcon_dev	*host_edev;
 	struct notifier_block	vbus_nb;
 	struct notifier_block	host_nb;
+	struct raw_notifier_head *role_sw_nl;
 
 	const struct dwc3_acpi_pdata *acpi_pdata;
 
@@ -154,6 +155,20 @@ static int dwc3_qcom_host_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
+void dwc3_set_parent_role_switch_notifier(struct device *dev,
+					  struct raw_notifier_head *role_sw_nl)
+{
+	struct platform_device *pdev = container_of(dev,
+						    struct platform_device, dev);
+	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+
+	qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
+	if (!raw_notifier_chain_register(role_sw_nl, &qcom->vbus_nb))
+		qcom->role_sw_nl = role_sw_nl;
+}
+#endif
+
 static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
 {
 	struct device		*dev = qcom->dev;
@@ -829,6 +844,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 interconnect_exit:
 	dwc3_qcom_interconnect_exit(qcom);
 depopulate:
+	if (qcom->role_sw_nl)
+		raw_notifier_chain_unregister(qcom->role_sw_nl, &qcom->vbus_nb);
 	if (np)
 		of_platform_depopulate(&pdev->dev);
 	else
@@ -850,6 +867,9 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
+	if (qcom->role_sw_nl)
+		raw_notifier_chain_unregister(qcom->role_sw_nl, &qcom->vbus_nb);
+
 	device_remove_software_node(&qcom->dwc3->dev);
 	of_platform_depopulate(dev);
 
-- 
2.30.1


--------------42AF9040477A4BAD376EE0FE--
