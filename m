Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6B868842C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 17:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbjBBQUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 11:20:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbjBBQTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 11:19:54 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48198233C3
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 08:19:52 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id k16so1833356wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 08:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIHAu8tErojOfd5QM6R7iQDgiVIIMil5Ve6NCJeQni8=;
        b=UN7676/ZYa6qNZqbxHWnomlCPvt7hGIGl21qZJjrxchrzk+SQrtErrzhQaz02tVt3+
         TZ3JoSbTtV1gkaZPt9Ke9tcej+bgffJkA8jumefl1J1hEn+Hi5kx6Rj1fu9L1AlAEoWW
         wuluiPdrcPjEKZ/C7K+i5lgIeJhYd41nDhK/v9t7kej/+HQlvu1Fz35VQp0S+sfvrWHz
         6VAOQQmefy64jNJAagkigbHn3r6zdkX86qijJ3p/TYM09Uhh6z3MqNhARqKmUQEqtBK+
         YvvWwnxieQH5L5Rvy+uvxXBdOPSjv3YBx80VcF9ueSLrUcqri9T8CkpCU2VxDeHjB9ib
         p1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIHAu8tErojOfd5QM6R7iQDgiVIIMil5Ve6NCJeQni8=;
        b=6912SExCG/u2BFx8JbYh523VhsyXt36iWs9ilAMkVRleIzIkhLMlz/LmvTny+0AxrN
         6iNmWvWD7iRCXBvEFVI4bFLOIbIOVJvmDdGLtGILGMlpCwgAe7OmlL0ZOdk5xAS5BW7y
         vpu8aEA5BQMaDrDrP0wO+WJsk8VNF0mf5Tg6OTriFjNg63KvmnDKHpvk1wGI+snD5kr+
         3SgzJYAtUWoajQN0J6763qn+NTb/+/u1gsEYuTwYVZUVt0rg//0B8TNuRs0OGchEjbNq
         YDCTV9QgZoort687x+P098KaOaVi1PSKwpDqyFNlyRvGX16WoCsQU8dNq41VDZEjq+fE
         SAhg==
X-Gm-Message-State: AO0yUKUnsEpm9mwazSgL6QQkSKTmafNwlToOsCC09wz09BS/MKUOpZvc
        rx54xXQpZ6GAC2kMEIzdF6M2gQ==
X-Google-Smtp-Source: AK7set9OK48HvsEFkcdF7CCyK2Suis+biRyvfw3q6OS34scf3NYBnCG/wg+M1/0iVMp6Rb7w3T53ng==
X-Received: by 2002:a05:600c:4f83:b0:3db:1a41:663a with SMTP id n3-20020a05600c4f8300b003db1a41663amr6641290wmq.20.1675354790833;
        Thu, 02 Feb 2023 08:19:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003dc521f336esm212416wmq.14.2023.02.02.08.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:19:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/13] arm64: dts: qcom: sc7180: add compatible fallback to mailbox
Date:   Thu,  2 Feb 2023 17:18:55 +0100
Message-Id: <20230202161856.385825-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
References: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
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

SC7180 mailbox is compatible with SDM845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ebfa21e9ed8a..61d99c02a290 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3407,7 +3407,8 @@ msi-controller@17a40000 {
 		};
 
 		apss_shared: mailbox@17c00000 {
-			compatible = "qcom,sc7180-apss-shared";
+			compatible = "qcom,sc7180-apss-shared",
+				     "qcom,sdm845-apss-shared";
 			reg = <0 0x17c00000 0 0x10000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

