Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31EC442067
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 20:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbhKATCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 15:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbhKATCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 15:02:33 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D6EC079784
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 11:59:12 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id a9so7494332pgg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 11:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BD1QsMY1zCUqv9br05N6l/EKmY3X2SxhgDpOAJhSwOg=;
        b=QPo0fLjV+jATSuaG4z7d8hBSW8RLlY0fKLsiIJmeEcwNnIaOhVSkbc6tymWO6B/t4l
         I33lEIk9z8XOsPVpQdeoep+FjLeTrkYLFoi/7QriEnA8KqIgMmyfh8eCzmNLqzKEvbkM
         tEb3FcUyt31GKnlkmRM561dj75yfy5Mu1S7P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BD1QsMY1zCUqv9br05N6l/EKmY3X2SxhgDpOAJhSwOg=;
        b=1vtaUQl85nXwWwYK4gtJyFUIuVC3VA7f4auqcAsVRlDBaiKDFh6NvdZQD19IFCckw0
         VU4u6YQCOMwG+zxvqVTdocRVMkSCXs+07+RfvlKtmwmRiOtDUPfTZNs0dvh0Kpanjupv
         f1UtC3ki5dUy8VZs1R/8K4vFhGyFJtU7s1FF0lYFw/3jndhFMhNb5Hf+sqtHZBjiU66P
         zepE3k9EHH+iQ/lhkff1kJM4Xi1DZQTpjrsBfKb0Hn13VQnUGPrwcuRF1//SrDb8X56K
         7ah/dImSg9/Gov/l9PaojoCCSHo5lBYxvXEne0ILn3FzV+2fPzzQzvtQkU61Rf02zXgL
         BHpg==
X-Gm-Message-State: AOAM533YqHigfVmBoHRl0z1mYTNaFz3IjPS0QRsw4Ko06wbBlFLsIPGf
        elD+NoaTr53ibtvCwg2cNBUmjw==
X-Google-Smtp-Source: ABdhPJx4ocrPcehkVYoTHEsKFEMRDkN4/T8e7Q6rfuqdhfiqd1F4S4rzBJnlsgJ8GjUvqChmMSEBUA==
X-Received: by 2002:a63:af07:: with SMTP id w7mr23594572pge.202.1635793152067;
        Mon, 01 Nov 2021 11:59:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6278:520b:a2e1:4ece])
        by smtp.gmail.com with UTF8SMTPSA id ml24sm191160pjb.16.2021.11.01.11.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 11:59:11 -0700 (PDT)
Date:   Mon, 1 Nov 2021 11:59:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH v9 1/5] usb: host: xhci: plat: Add suspend quirk for dwc3
 controller
Message-ID: <YYA4/rjSN/QvIM+w@google.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

On Mon, Nov 01, 2021 at 01:23:40PM +0530, Sandeep Maheswaram wrote:
> During suspend check if any wakeup capable devices are connected to the
> controller (directly or through hubs), and set the wakeup capable property
> for xhci plat device.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  drivers/usb/host/xhci-plat.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c1edcc9..7ab272b 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -431,6 +431,14 @@ static int xhci_plat_remove(struct platform_device *dev)
>  	return 0;
>  }
>  
> +static void xhci_dwc3_suspend_quirk(struct usb_hcd *hcd, struct device *dev)
> +{
> +	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +		device_set_wakeup_capable(dev, true);
> +	else
> +		device_set_wakeup_capable(dev, false);

IIUC wakeup capability is typically a static property that reflects the
actual hardware (or firmware) support for wakeup. In that sense it doesn't
seem a good idea to change it dynamically at suspend time, depending on
what is connected to the bus. I understand though that the odd split
of the dwc3 driver makes it hard to do things properly ...

Earlier in this discussion Felipe suggested to add a function like
device_children_wakeup_capable(), to avoid having to call
usb_wakeup_enabled_descendants() from the dwc3 drivers.

Below is an initial implementation for device_children_wakeup_capable(),
could you try if calling it from dwc3_suspend/resume_common() and
dwc3_qcom_suspend() would work instead of relying on the wakeup
capability?

Thanks

Matthias

From 97c838334045ed67c3943f8e035ac70acd12b89b Mon Sep 17 00:00:00 2001
From: Matthias Kaehlcke <mka@chromium.org>
Date: Mon, 1 Nov 2021 11:37:19 -0700
Subject: [PATCH] PM / wakeup: Add device_children_wakeup_capable()

Add device_children_wakeup_capable() which checks whether the device itself
or one if its descendants is wakeup capable.

Change-Id: Ib359eb5ac8650ddf9889c7d1f77707f50777fe99
Suggested-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/base/power/wakeup.c | 17 +++++++++++++++++
 include/linux/pm_wakeup.h   |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index 9c0932603642..2aee7fa8230f 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -483,6 +483,23 @@ int device_set_wakeup_enable(struct device *dev, bool enable)
 }
 EXPORT_SYMBOL_GPL(device_set_wakeup_enable);
 
+static int __device_children_wakeup_capable(struct device *dev, void *dummy)
+{
+	return device_may_wakeup(dev) ||
+		device_for_each_child(dev, NULL, __device_children_wakeup_capable);
+}
+
+/**
+ * device_children_wakeup_capable - Check whether a device or one of its descendants is
+ *                                  wakeup capable.
+ * @dev: Device to handle.
+ */
+bool device_children_wakeup_capable(struct device *dev)
+{
+	return __device_children_wakeup_capable(dev, NULL);
+}
+EXPORT_SYMBOL_GPL(device_children_wakeup_capable);
+
 /**
  * wakeup_source_not_registered - validate the given wakeup source.
  * @ws: Wakeup source to be validated.
diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
index 661efa029c96..a0ca42aac6d6 100644
--- a/include/linux/pm_wakeup.h
+++ b/include/linux/pm_wakeup.h
@@ -97,6 +97,7 @@ extern int device_wakeup_disable(struct device *dev);
 extern void device_set_wakeup_capable(struct device *dev, bool capable);
 extern int device_init_wakeup(struct device *dev, bool val);
 extern int device_set_wakeup_enable(struct device *dev, bool enable);
+extern bool device_children_wakeup_capable(struct device *dev);
 extern void __pm_stay_awake(struct wakeup_source *ws);
 extern void pm_stay_awake(struct device *dev);
 extern void __pm_relax(struct wakeup_source *ws);
@@ -167,6 +168,11 @@ static inline bool device_may_wakeup(struct device *dev)
 
 static inline void device_set_wakeup_path(struct device *dev) {}
 
+static inline bool device_children_wakeup_capable(struct device *dev)
+{
+	return false;
+}
+
 static inline void __pm_stay_awake(struct wakeup_source *ws) {}
 
 static inline void pm_stay_awake(struct device *dev) {}
