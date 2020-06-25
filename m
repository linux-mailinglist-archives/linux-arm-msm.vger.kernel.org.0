Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD2F20A4B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403780AbgFYSVf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390692AbgFYSVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:34 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3521FC08C5C1;
        Thu, 25 Jun 2020 11:21:34 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id e15so4963281edr.2;
        Thu, 25 Jun 2020 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YaqwY05/r3k7x6kZ9wCj64JmBphdqzDzvJ/AelDNrH0=;
        b=PFxssf3RlXGeyJBJ+ECNkaj701sCM7ZBUFCmFMpl3rh12c9A4SbniZaMJhSoM1Mqz3
         BT60kk2A2gL6ffd7Fhc4K09HJTwOlK097dZXipX+Psj8TZkNjnVLibaXoU4uOA6y+rHr
         gnb0W5YGcu+IxPVKu2ly9wIlgGZroBX8qzgz45rF1zvU3mG7xGxeAU6XcHe4nntUfG/D
         bHrDi1mL5cvMqzazQOzUA54LtrPElrKPEqtSd3YfhEezkuz3Co/wGZ1fnjMT560oDO3g
         tABMh7Bi/xYyILxEDoDPG9wFKZUfDxdTAP0yd9ksqRpPadooepDXywf3qpGk/rx76Jty
         KAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YaqwY05/r3k7x6kZ9wCj64JmBphdqzDzvJ/AelDNrH0=;
        b=bWwtqEgr73wOFvdXVyJA2ml9KRC136jLsuQavvTxv3TtOYKLIxYKQKwuBjOTqR+c4o
         NsThL13vrf8X8oGMgKyoQM5MhdhhfRCJHtfshnTph9Un9xT/8Dh0aeMtT1fQA09chHPB
         SGQbJWuq6kvcTL9lRohNoLYNfY5x1WkAPVsgka1qPtR+3F2X/UDP553+aJuDE3geouq2
         vtCbAn+eb4zqMI4KxtsUPXJPL37io8FZxNnrUub8RTxdYo1pHrkIm+CvjkWwwaKpXuXV
         NXnJ3dQAyJE4HvCrh6gFf4F09dLyQQv3IiZk2+PPnInN8Db7HMhjt2oG4IJiymiU8ejv
         aypQ==
X-Gm-Message-State: AOAM532oaMsINTmcl5/xCO6tEqIjHPgoe40TrTaak2ogvQTyIjJpmi19
        u/0TQkNRrRkJdhRUj3qiVJg=
X-Google-Smtp-Source: ABdhPJzvKtAlaVB1h7Ydm7JEB71wudwpolP3OO85CN5rGm0JQluKxrmffqXe1sjsV8yiNK/FiCQR4w==
X-Received: by 2002:aa7:c50e:: with SMTP id o14mr4882629edq.168.1593109292964;
        Thu, 25 Jun 2020 11:21:32 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:32 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/13] arm64: dts: qcom: bullhead: Move UART pinctrl to SoC
Date:   Thu, 25 Jun 2020 20:21:08 +0200
Message-Id: <20200625182118.131476-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This pinout is common for every 8992-based device and
should therefore reside in the SoC device tree.

Also convert addresses into phandles.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts      | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 4f70681e730d..5969b5cfdc85 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -23,15 +23,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	soc {
-		serial@f991e000 {
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart2_default>;
-			pinctrl-1 = <&blsp1_uart2_sleep>;
-		};
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -48,6 +39,10 @@ ramoops@1ff00000 {
 	};
 };
 
+&blsp1_uart2 {
+	status = "okay";
+};
+
 &rpm_requests {
 	pm8994-regulators {
 		compatible = "qcom,rpm-pm8994-regulators";
-- 
2.27.0

