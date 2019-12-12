Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B98B11D726
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 20:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbfLLTgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 14:36:38 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44063 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730711AbfLLTgX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 14:36:23 -0500
Received: by mail-pg1-f196.google.com with SMTP id x7so18801pgl.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 11:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FfAfV2+dsySPHR+abNSiNfNBu7y5s9v7tjVQ+45n3gY=;
        b=QoBqMUOxLY4ED/l7B+oCFOBf+NC2F4Nt+Vsusi9OX/0Z5cklqBhkosiOz0t1NTT6gp
         KJj3yjG9QKCiHlK2WPEr1Nk2FhX+5887LtVji2BSaE+TfAkIkAN7H5i0vwt65vTJKbFP
         zHq8Ldkeecd1AoWRNu0rfpYuxV0v6Ozefm0ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FfAfV2+dsySPHR+abNSiNfNBu7y5s9v7tjVQ+45n3gY=;
        b=CW81Cjrez0LN+2x2Opp+D4uhM6immfg3543cohZ8lYfdMP1XXNmj0dItXd88tomxjo
         58vqF9GLujAN9ss7G65jc9qxEU3Ul3lIiMtV7DUQj5zqyeYvfSyDeNbd4QKp5z1KvmTL
         +3Z8JGjUga6hm7yOgr5+cz7zwrNgh3xOBrdPzv4tAQSNNNZC/zL/kveTZeohvh+ZH+2O
         Kq5TlQClbRQw7GCc3Sl1jqvFOnsloCHN8B2WxTDpzyRS/N/wB4nfp3FLXEefhzlIKx3G
         tXCzbZYkdxILDZwVcJ8Of+OAyPAbIh0ZO8tFguvwLqHMr7Pb4QxCleBuVHMrdEMwHNKq
         jgaw==
X-Gm-Message-State: APjAAAWDasupt/C9K5nzP81p+PGOmqXr00M3D+Bis1J03Jr+1AiwJtVf
        6o1Fe6CoV4w5uGgF6f0StMizI2cDUzp4Kw==
X-Google-Smtp-Source: APXvYqzCyM5fNIUXeHJH6Zo7kmXsKO386Rs5A2F6EB4wmrvUefzkPU4jf92aWkOKvZhLIhe1VWl6Lw==
X-Received: by 2002:a62:3784:: with SMTP id e126mr11735660pfa.228.1576179382933;
        Thu, 12 Dec 2019 11:36:22 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id m34sm7568302pgb.26.2019.12.12.11.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:36:22 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        mka@chromium.org, Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 6/7] arm64: dts: qcom: sc7180: Avoid "phy" for USB QMP PHY wrapper
Date:   Thu, 12 Dec 2019 11:35:42 -0800
Message-Id: <20191212113540.6.Iec10b23bb000186b36b8bacfb6789d8233de04a7@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212193544.80640-1-dianders@chromium.org>
References: <20191212193544.80640-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bindings for the QMP PHY are truly strange.  I believe (?) that
they may have originated because with PCIe each lane is treated as a
different PHY and the same PHY driver is used for a whole bunch of
things (incluidng PCIe).

In any case, now that we have "make dtbs_check", we find that having
the outer node named "phy" triggers the
"schemas/phy/phy-provider.yaml" schema, yelling about:

  phy@88e9000: '#phy-cells' is a required property

Let's call the outer node the "phy-wrapper" and the inner node the
"phy" to make dtbs_check happy.

Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 9766867abc88..c671f0719d42 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -992,7 +992,7 @@ usb_1_hsphy: phy@88e3000 {
 			nvmem-cells = <&qusb2p_hstx_trim>;
 		};
 
-		usb_1_qmpphy: phy@88e9000 {
+		usb_1_qmpphy: phy-wrapper@88e9000 {
 			compatible = "qcom,sc7180-qmp-usb3-phy";
 			reg = <0 0x088e9000 0 0x18c>,
 			      <0 0x088e8000 0 0x38>;
@@ -1013,7 +1013,7 @@ usb_1_qmpphy: phy@88e9000 {
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: lanes@88e9200 {
+			usb_1_ssphy: phy@88e9200 {
 				reg = <0 0x088e9200 0 0x128>,
 				      <0 0x088e9400 0 0x200>,
 				      <0 0x088e9c00 0 0x218>,
-- 
2.24.1.735.g03f4e72817-goog

