Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FBC46C205
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 18:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240148AbhLGRrh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 12:47:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235019AbhLGRrg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 12:47:36 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B80C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 09:44:06 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so2478327pja.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 09:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bKVPunnAxyXz+rHlZKIN2IVzism2juiwgT6PKshCozU=;
        b=g08A0M2bPh+rgy8MOJtpx32VGr1fMqLdHLNLt6aSdjaPt15hbIcTQFk/bW4I3pLqq6
         3bncPVm4iyI579KugmfCswYGs3j/OsFo6Z7aT/IPaE/DN2mciknvfG/p5lcVESiKOPc5
         vdQKnIIWxJtTYmUaUoxBERd33b+vCDz6aBk+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bKVPunnAxyXz+rHlZKIN2IVzism2juiwgT6PKshCozU=;
        b=ImmFNxOftdIgFczsT8Z4b7L1wyBAj6X9HYd/M6ZlJCK756E7U6Ml8Rl3CAK5iq8/Wm
         AU7CD3XMNZsoKjkqJd2I9UPvqLgKuScTpPmWcvVLCgGg736sx9kBB2oWBXHC/qOsYlJQ
         Y0pl9HghfLvKdn87XFvGUj6Ab25Xb3vRAIEyFbeJ6nt07jc/MLVyDk7EjhEkZB2VRgc3
         +ZN+5pR2SqSElZNgoVjOgviwEBRtNi9vAI03JPan2CclGVssVHxvFE+70BlsN5WP+wWP
         yE3XNUK5x0wBmIJ/fKJYWgx45rmWH/lC06bg8H6XDf9sf7V58lj1+4GXytDJrqqmQ9pa
         q6hw==
X-Gm-Message-State: AOAM5301svak7RPQoWS3wQazYKzK8lcRuD6cRFv8HkfdMmnOQxcujfG1
        3/d1Tiy2JAfTTsHIx7lRSl1e9g==
X-Google-Smtp-Source: ABdhPJxJ31RcYOHwb6V87S7NxBD3mUEpOroWbvBAHYX1ZOU7pjTezVaWt/LZIWNtR5BxxWkOMrCVBA==
X-Received: by 2002:a17:90a:1b63:: with SMTP id q90mr567550pjq.126.1638899046073;
        Tue, 07 Dec 2021 09:44:06 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:a783:e7e8:acf6:96a5])
        by smtp.gmail.com with ESMTPSA id z14sm334890pfh.60.2021.12.07.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 09:44:05 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, swboyd@chromium.org,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>, robdclark@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] Revert "usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default"
Date:   Tue,  7 Dec 2021 09:43:41 -0800
Message-Id: <20211207094327.1.Ie3cde3443039342e2963262a4c3ac36dc2c08b30@changeid>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit cefdd52fa0455c0555c30927386ee466a108b060.

On sc7180-trogdor class devices with 'fw_devlink=permissive' and KASAN
enabled, you'll see a Use-After-Free reported at bootup.

The root of the problem is that dwc3_qcom_of_register_core() is adding
a devm-allocated "tx-fifo-resize" property to its device tree node
using of_add_property().

The issue is that of_add_property() makes a _permanent_ addition to
the device tree that lasts until reboot. That means allocating memory
for the property using "devm" managed memory is a terrible idea since
that memory will be freed upon probe deferral or device unbinding.

Let's revert the patch since the system is still functional without
it. The fact that of_add_property() makes a permanent change is extra
fodder for those folks who were aruging that the device tree isn't
really the right way to pass information between parts of the
driver. It is an exercise left to the reader to submit a patch
re-adding the new feature in a way that makes everyone happier.

Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This is an alternative to the patch ("usb: dwc3: dwc3-qcom: Avoid
use-after-free when USB defers or unbinds") [1]. During the review of
my patch fixing the use-after-free it was proposed that it would be
better to revert the broken patch and it would be up to folks who
cared about it to re-submit it without the problems.

[1] https://lore.kernel.org/r/20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid

 drivers/usb/dwc3/dwc3-qcom.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9abbd01028c5..3cb01cdd02c2 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -649,7 +649,6 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
 	struct device		*dev = &pdev->dev;
-	struct property		*prop;
 	int			ret;
 
 	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
@@ -658,20 +657,6 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
-	if (!prop) {
-		ret = -ENOMEM;
-		dev_err(dev, "unable to allocate memory for property\n");
-		goto node_put;
-	}
-
-	prop->name = "tx-fifo-resize";
-	ret = of_add_property(dwc3_np, prop);
-	if (ret) {
-		dev_err(dev, "unable to add property\n");
-		goto node_put;
-	}
-
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-- 
2.34.1.400.ga245620fadb-goog

