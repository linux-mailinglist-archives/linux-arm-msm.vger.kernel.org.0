Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0914120A483
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436491AbgFYSNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436484AbgFYSNe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:34 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4AAC08C5C1;
        Thu, 25 Jun 2020 11:13:34 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n24so6885646ejd.0;
        Thu, 25 Jun 2020 11:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A69JzujOnyhenXPlRXTW6BkPoGZ0iXxM/MOzTEanPgQ=;
        b=szKnzf4JeyEFCuQIM8rZDsezQZib8hlkuLWZJoB6g6wHJAeaeyqjyNoX968tR1kZaT
         6CkUkXc1piY7K/aglUyWLWGk19Ev3L03zfUiY5Nok7MwnOfJcTa3V5unPMP73lJza8z5
         45WBwjLF9qqt6R7Usw1KoRgqrzRMjzTsQY4u75mPZ0fB/Sb6Z3Aa+fZSI4PgEFGqhCoh
         PMj+VcKFUMFIoLpb3Oa7FB85rJi6u+8qssoZpIcD45N7KmeHdwSiuPdTrXCj9gbhK4pp
         jGTjIDcw/hI6v6+gYTiBcv7VJxFTB3GvuxIM5f2mpP+P89oDLT00bG/SFO7GXlArjuWI
         F8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A69JzujOnyhenXPlRXTW6BkPoGZ0iXxM/MOzTEanPgQ=;
        b=EB8xuzxUfZmxBkk95P+OOKP4D/zoHPZDS7FM26cKaTxklbzDzw40gI8mDaabKge4Pl
         bhyYWP37ksPQkyMCF2AhKrzypzWlPXBkpR3G0lhgyIE1u3+6uXrZ/QXW5cjKsPiL9QU+
         XmWxf8N1oTwXAWKo+J20M2r3n+lfm1y2jCIq/XFawxjJwWoZLIpmwBMPs53MDmj7vl9O
         iVt5Ep8KvVgX/iztG6pV8xnmdAfuxY60CYm/XLphZimxWOHnmfzVAvqaRh3pLnYqnvIF
         FFyeqgAVl28vHY5UlM336teQv2HxB5ZYZK/eiECpnN69hg4DNaH0kaoTvwyNFvzWAPsZ
         kpfA==
X-Gm-Message-State: AOAM533bOZrYslSfk+n6InuCb1CcgdMaZztQ5Ps09XNNCkRP1/iZRcYz
        Vodn76rnj6sHLp0twAuiT0U=
X-Google-Smtp-Source: ABdhPJzBpOBUOequNmBUOCVS2xIwj41rONRx7icQxe8vKRBqDr5gXKoOqQfbXVBb8qQBWcNlk6rgOg==
X-Received: by 2002:a17:907:20ee:: with SMTP id rh14mr30986932ejb.395.1593108812827;
        Thu, 25 Jun 2020 11:13:32 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:32 -0700 (PDT)
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
Subject: [PATCH v2 10/13] arm64: dts: msm8992: Add PSCI support.
Date:   Thu, 25 Jun 2020 20:12:58 +0200
Message-Id: <20200625181303.129874-11-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This SoC's firmware does not fully support the PSCI
spec, but it's good enough to bring the cores up.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index c4c9a108ae1e..bc3acc0cf9bf 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -135,6 +135,11 @@ pmu {
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "hvc";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.27.0

