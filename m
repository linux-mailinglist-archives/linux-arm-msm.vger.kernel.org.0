Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C0420A48E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436513AbgFYSN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407069AbgFYSNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:32 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857F0C08C5C1;
        Thu, 25 Jun 2020 11:13:31 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id l12so6828540ejn.10;
        Thu, 25 Jun 2020 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/mdCv9AcSwvn1xJCdZahbAIWOnw7ZszwaJLHBjtLMCw=;
        b=O4sr0o7iKJjER1cg5Z9cjEYGPFXfor0Na5/b3Tci+fdZy+s83omN4hujU99hlxYtXx
         Ct1Z+BUQjk4wzvnLjUek6AuvoZEYVcfTmTYkSAFce68BVEERGSZh2QB9vCOM0kZAucoK
         ylpfBBt/XKzt3nyZUJG9JOsj3dhMlFpJ58717ds82VEpvQH2964MmDBOSUxZiGDC45qr
         wGAf3bk7AsxHPfFaEWk4o+5wsGD9K2E0RAzHKcadZnqaSJVEN5l4CKYjwQ5R+OTXOdef
         KI4ShmBSudc21XABGFk7j0GaGhQxCGLpDsd01kjvAx950vp+3ps4+zfZikW15o1h3mEe
         fO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/mdCv9AcSwvn1xJCdZahbAIWOnw7ZszwaJLHBjtLMCw=;
        b=hp1c2s+QteLa4RiWKaaCF2LA+rlKk4b1d0yEIVpJdK2nwDqzE7tm5wx0JaerQN0VpS
         bmgVinPdmuFRYHhbgxHQGL+40FMGwPBCLCrMK0SUqobsep+jAivgkbL4uishJDy6D8Jr
         1RXPV0rb00WSFL27XheuMweP5JWPdSy/8XzQevD5Tt2a/xqlJ84OuIc4ss/rwQ2NwKIJ
         rpezhrxU2N5vo/6xTEgz7unLudo5YddnLPbdD634tuKMqVpquAsWAUPIz6snN6Hw9IcU
         23KVE31VP962UTWLkFf7nJMl92zPWGjRLJC34YgxxCbtFc5Tb1xWKYXMXdXZ4oud24l4
         x+Cg==
X-Gm-Message-State: AOAM533sdmdM9UBV9NUUx3/g8AWwLVqLPJAIsrjov3JtXM2+udKa9zRp
        B60LJza+hDDLkmtmZsVbYOA=
X-Google-Smtp-Source: ABdhPJzGhZC4PJgtvWmcTt9l6HMu8biB2dpppct5bxPGSolWyS2E/qfhD0lgDe3WTxfVtHRTRecy5g==
X-Received: by 2002:a17:906:cc0e:: with SMTP id ml14mr16933281ejb.432.1593108810205;
        Thu, 25 Jun 2020 11:13:30 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:29 -0700 (PDT)
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
Subject: [PATCH v2 09/13] arm64: dts: msm8992: Add PMU node
Date:   Thu, 25 Jun 2020 20:12:57 +0200
Message-Id: <20200625181303.129874-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the PMU so we can get proper perf event support on this SoC.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index e8b801813f14..c4c9a108ae1e 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -130,6 +130,11 @@ memory {
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

