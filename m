Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C356A8587
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 16:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCBPrd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 10:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjCBPrd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 10:47:33 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BE0474CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 07:47:29 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id o12so69272218edb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677772048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqKWlu4oafIDXkVsoZON4g5bm9TG0oS+avsiFLrIa3Q=;
        b=dI3OZkhzR51j0QCnviAzJ9aE0wGV6BZvCMMRbDsHnW9+P7rZpVWshptUoWtBAezIMv
         M1bD9kbBeGnvJsVAZuRII/g7VSMEiJwtYPMSC+QXEpoahldjS4eMhBnRWr97eMyzSdGI
         bpXcnCXa7LT/+VvCcMXkMC6EGOVF7Y3ZDEsSD4JZ+QUFFt5GmGBWABMUZ4ps5fw+y0iS
         vb5Z/HmtH8p1SvyltnudBktW4pyzQMQHuqiSyDGZ0dFODOAYssdzWf0SHeegf5ZAFKn9
         p8iIXiB/CmDLLmL2Lt9yN/3oAS7E7DXN+Lpf4eBEhEo8XMg3V0XakMxhkew1R9awU+X7
         tC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677772048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqKWlu4oafIDXkVsoZON4g5bm9TG0oS+avsiFLrIa3Q=;
        b=ze262xoXCtj6XxDmsJDjIHf/ZiM/iI1N0hdWjQx3vrILVBB24wig7VHvglvRLubpPo
         8NVQ3Vr5kcOesXvnBmMsHkHqH6HjBLOIw/mrtl/ejDYwrszifTvIyPQrTp0y5pNGHgJq
         w0h9HQ3Vak6HmW4J/utjswsXi2jJeQZjgxxiTq6xoiqnZGKGbBD+E5NXXzIxTM6QQcUX
         FH2VCc1w3bJ2SfgQ87nNbQnEVHkXMu73JcQ4KcppZHmttNOYJkClGUPLIWyZRJ+vSawr
         YmZ8+Dz3mSyoRpd/qKYMWUWHDcVYgRRnvOfDpnhBfzXqiWkeGaceSYZzAaygl/57gXWT
         T1Lw==
X-Gm-Message-State: AO0yUKWiYeywKCXWnUwOLRvqPEAPSsTp0SYnJKeqZo2HN4ULPYI/C5OI
        Iko41lluhekvVgiI06D8nq0iIQ==
X-Google-Smtp-Source: AK7set9/EL5xiW42z57i/oU9/T0u9AToZFmXQSD3kl1JB7H8E5wlu3l7bUoHaceJZ+Cd3P92WWxE5g==
X-Received: by 2002:aa7:cc0e:0:b0:4af:6c25:ed6a with SMTP id q14-20020aa7cc0e000000b004af6c25ed6amr9969049edt.3.1677772048193;
        Thu, 02 Mar 2023 07:47:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u2-20020a50eac2000000b0049e1f167956sm9987edp.9.2023.03.02.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 07:47:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8550: fix LPASS pinctrl slew base address
Date:   Thu,  2 Mar 2023 16:47:24 +0100
Message-Id: <20230302154724.856062-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The second LPASS pin controller IO address is supposed to be the MCC
range which contains the slew rate registers.  The Linux driver then
accesses slew rate register with hard-coded offset (0xa000).  However
the DTS contained the address of slew rate register as the second IO
address, thus any reads were effectively pass the memory space and lead
to "Internal error: synchronous external aborts" when applying pin
configuration.

Fixes: 6de7f9c34358 ("arm64: dts: qcom: sm8550: add GPR and LPASS pin controller")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for current cycle - v6.3-rc1.
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 1dea055a6815..6296eb7adecd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2001,7 +2001,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 		lpass_tlmm: pinctrl@6e80000 {
 			compatible = "qcom,sm8550-lpass-lpi-pinctrl";
 			reg = <0 0x06e80000 0 0x20000>,
-			      <0 0x0725a000 0 0x10000>;
+			      <0 0x07250000 0 0x10000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 23>;
-- 
2.34.1

