Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D84320679D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388929AbgFWWss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388853AbgFWWsk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:40 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F296C061796;
        Tue, 23 Jun 2020 15:48:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g18so273632wrm.2;
        Tue, 23 Jun 2020 15:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SLkT6O/yw0FJtobFw0czbSMFMvRrtHerycDJkxiAn7k=;
        b=W/fnhBQqJFzqaDiCANOmjlBj4JDVuyeynUNZ8PIPzTLxaeZL1cdFLbCMcHUQPegfNb
         +Pu1FWoLbxMtJL32dXKfl7ktvxEJ7uXApDixOUoRYs/VyOJFblfqVUYTv/828BrTVVsi
         YRG2TYBzGNJ/E6+B3Pj0sctv68GtLhZD0TqFxj8evO3AwdPaLmrhK/6NvAQMLj9Ly5SY
         GgsIV8k+JI1dt9awf21QpXOxfWq/Qxzf4oi1TgLKV0ECuzzTLd/7bnT0tfg66dteOBMm
         ubDXLYo/sFhTQLOjxxUZX4sJsk9Fhq33nmofihtfB/wjUHvbL0dWsYj0KzZ+YDGGixfy
         tLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SLkT6O/yw0FJtobFw0czbSMFMvRrtHerycDJkxiAn7k=;
        b=JbURK1HLEJRqFByp8v1lMjy4yCH6Kj9jzpL7H5SeIbKd5/ielKckSr3CEJOAn5vGC5
         bz1Xsb9FLpS+MXkZb2Qc//YJ9gdqLke7OeaQzIV9R3HiWVPESf+RxeyCY6zRCOmHq1+5
         2/K3lOwcX2EJKxRHPkX8101o/xJRT7r1+/5l762h34JxmwgwBmSwIITkLHc+GThcdPvr
         B7+iSDU1JDNTZK/dVUE+7ciHKEikG+rE/p6zPc6nrhvkhauRZcCASU10GafYlFu5HRQA
         iaUcmJpNo7ADlkcaXdgQh6+ArPMXc36F3Om1xzEQ+PSseV6A/XdWQZWB/zncaIkgRDfc
         B6EA==
X-Gm-Message-State: AOAM530sD/5Bawa1r67V1gcPbh6QIeBiiMXsGIiDnH36tnqLdslqNAQD
        Iru5cAWZgQnrLhDPfNIVKHQ=
X-Google-Smtp-Source: ABdhPJwflIzohf5kxCWoQCRJ1ebtMcK3fFXUMnJOSu7GTLjAWrNuVQgbAQh5uJU+uNsQWCScC+FBdQ==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr13969412wrp.255.1592952518896;
        Tue, 23 Jun 2020 15:48:38 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:38 -0700 (PDT)
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
Subject: [PATCH v2 08/12] arm64: dts: qcom: msm8994: Add pmu node
Date:   Wed, 24 Jun 2020 00:48:07 +0200
Message-Id: <20200623224813.297077-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the CPU PMU to get perf support for hardware events.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 8af01ebe73f7..b3c01ebc5c67 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -154,6 +154,11 @@ memory {
 		reg = <0 0 0 0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.27.0

