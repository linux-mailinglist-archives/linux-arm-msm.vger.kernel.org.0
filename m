Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2F43F55C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 04:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbhHXCUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 22:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233759AbhHXCUM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 22:20:12 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FD5C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 19:19:28 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id 7so17003110pfl.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 19:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=SAYfyHfKtEIZUA145VWKAPDNQgImJMaU3dtgNUZKT2M=;
        b=bzltG0ACe6O5otAzfzo149Fyy+9jQuYkdpMBDOsQBI6oFyGX563Qe1j7ECEGld4L0R
         ZLjTIN7WECTa/lXMapRT1N971z/p5UvrsYz7AaNeZ36MiiBiMzRDoJqp68qQJbzDgrfO
         zzNIoiCzUtREbgb7JUnSUjP67fPUvK5t6GpI+g0YofB1IcGmkYyO/WiCOsdg/AckNSml
         F8a1ayCCAl7jGuUD16Hsdv+J6NJ2PdRKfrqyPMRBRvCzdGqqG4LUHmPJ8ymhbYlIzTnU
         2GOkU/fpWIuOLHk7p4v5b7D2frCi+eI99ABp3UtEA7LbP8Gn53CayrzRyb2yGOJGa5+l
         n+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SAYfyHfKtEIZUA145VWKAPDNQgImJMaU3dtgNUZKT2M=;
        b=jbyo054J/fFT2tYpJveHWzIYXBEi5dpEK9LfwDfHGqEbn26Nb4RfucEmMzUSgmHG0R
         HQn/ohvv0UReydm56gnHgXxThoASgKuqIKXQlyQr3emH3FjvYLknZb4rPPB0vSm+QCmX
         i9Wuc1JEzl3bUGm5+6JL+NYOJJSJSdWNTZV1BLHE96LKdpzg0wVwDD3N3korsMdJcd9T
         HC4wilAgwXER8togbgc89yPOFrzUj8yPZ4NhB0Rf0D+LrIi26NaiVyeRkeoFiW/MDQaP
         o0ml//OJAP6ZjsE/f4R+Vo/9ddcxT6COt6C+ejTyC1e3ocm34w2xOePq1vJZSSIlDpy/
         kf6g==
X-Gm-Message-State: AOAM5301pMhzhBzz7TspIVblyXLC1k5hKz7r5fTaqbATA0RpFI7ZNfy0
        Ol+x86mUFMrCV4lYlvfX/0/VNQ==
X-Google-Smtp-Source: ABdhPJx9a7n9WfBw4x3JMROREY8974jeXERbzJ2CFcFAIL4WaSscmhQNA9OrD7o+lj/j0OzHlrQ/AQ==
X-Received: by 2002:a63:5f94:: with SMTP id t142mr1064973pgb.166.1629771567958;
        Mon, 23 Aug 2021 19:19:27 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id x4sm499231pjq.20.2021.08.23.19.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 19:19:27 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] arm64: dts: qcom: pm660: Add reboot mode support
Date:   Tue, 24 Aug 2021 10:19:18 +0800
Message-Id: <20210824021918.17271-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It turns out that the pm660 PON is a GEN2 device.  Update the compatible
to "qcom,pm8998-pon" and add reboot mode support, so that devices can be
rebooted into bootloader and recovery mode.  Tested on Xiaomi Redmi Note
7 phone.

While at it, drop the unnecessary newline between 'compatible' and 'reg'
property.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index e847d7209afc..d0ef8a1675e2 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -49,9 +49,10 @@
 		};
 
 		pon: pon@800 {
-			compatible = "qcom,pm8916-pon";
-
+			compatible = "qcom,pm8998-pon";
 			reg = <0x800>;
+			mode-bootloader = <0x2>;
+			mode-recovery = <0x1>;
 
 			pwrkey {
 				compatible = "qcom,pm8941-pwrkey";
-- 
2.17.1

