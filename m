Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D88C48C1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 20:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbfFQSiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 14:38:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42388 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfFQSiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 14:38:02 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so6140097pff.9;
        Mon, 17 Jun 2019 11:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ShYV+EbWvX524xQNClO0SMbhJ4ngTe/5gGFiTlAJkmg=;
        b=JGrHDxV5HntRdMyUpnXDZs9iUchZ6oVcamrM1EpziJuwBUfmiyGWpmNHZGnl+j+WLI
         b5aMoWSmW2RqMrCEO8mtRrKDMHGmkdse1ti5n2A6+wSxLYHYJNwcpiaJLgE6sqvhbxP5
         sUWIVlqE73d2Ed1B5sedzgea+ZVwFQpGu68HZPpfYlvg5F5+s6xEA9OMJ7D0Pz51DP2/
         ir68XjSxZFTEFZVPPfkX8ArhkVlpY3Kxmpod4xsGrQVjX0RuxfO/1096KdSmPiK2Tkgq
         UEMNLcH1rsQDiRvMhZC1NJUp7Fo0IA+vkuuK0MQ7H0zcyHTPn1n+0MnOVQ5Bal/LZzvd
         Ozkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ShYV+EbWvX524xQNClO0SMbhJ4ngTe/5gGFiTlAJkmg=;
        b=eTrfUMbTCjrBfUhU9M/yrt4W8EaqVxhfgAmrhgsKFFqEDifFHkN08tIij8VROsiDde
         P4lGFEnDixI/Msipw4B5SxzRsXh0nJR7Lzph5aEcRI07YQgZuPEWwryZS1yoFs5+WimJ
         +gMh8nsEe7sJeJbkkS31l8+enKwZV9VKON24T0TCWkxxiSVTN59punrkAdja0TqJvrDB
         X14jYiSbllE8Y0pBcT4cvvm6sfYN/nAfOi+CyYjIULgdGwUzpxVOUOk795TCN1BhszQx
         nNSHd9oEgk9T8XYqR7JukEZgPm9MoY47tJn1F2CQmXne+CBi++L11uivsaoZuIU+OQCI
         cb0A==
X-Gm-Message-State: APjAAAW8b/7y404QLIqJKz6CNiziNfDN7OmFQnQ2s3rAA0JohaLZ5umj
        +kf4gm44EhLwBCWYJ+zVQTs=
X-Google-Smtp-Source: APXvYqw3kis71scyqsC3QmWFa66mq2V/8JuTK+2CY3GG9ixnSDg98rsUY6U2LDpCExTt4fD1u9HtCA==
X-Received: by 2002:a17:90a:22c6:: with SMTP id s64mr230415pjc.5.1560796682298;
        Mon, 17 Jun 2019 11:38:02 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id i133sm8541348pfe.75.2019.06.17.11.38.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 11:38:01 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 3/5] arm64: dts: msm8998-mtp: Add pm8005_s1 regulator
Date:   Mon, 17 Jun 2019 11:37:58 -0700
Message-Id: <20190617183759.13605-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
References: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pm8005_s1 is VDD_GFX, and needs to be on to enable the GPU.
This should be hooked up to the GPU CPR, but we don't have support for that
yet, so until then, just turn on the regulator and keep it on so that we
can focus on basic GPU bringup.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index f09f3e03f708..108667ce4f31 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -27,6 +27,23 @@
 	status = "okay";
 };
 
+&pm8005_lsid1 {
+	pm8005-regulators {
+		compatible = "qcom,pm8005-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+
+		pm8005_s1: s1 { /* VDD_GFX supply */
+			regulator-min-microvolt = <524000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-enable-ramp-delay = <500>;
+
+			/* hack until we rig up the gpu consumer */
+			regulator-always-on;
+		};
+	};
+};
+
 &qusb2phy {
 	status = "okay";
 
-- 
2.17.1

