Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6AC73A02F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 13:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjFVL5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 07:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbjFVL5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 07:57:54 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74B11738
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 04:57:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so2366217e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 04:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687435071; x=1690027071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phgyiyd8NbrxCJu24dU6XdDa1Tp6brfneR4jmAIEZFk=;
        b=Ky6+3kj7p1NGvyDHXfF6QwkVm4eKnR1VRxBzDU26dbzn4AIKa9SOlFdrBd4l1wesqC
         CtoA3RkyAkh4dXKUM93UrfYA7uEVw7fDHWsUrZ5ye4a6kMMJfvEdYd4GC9AreQvVIPdm
         Tmhi1SaAoxpxQd5CkkLSV9P0lYgxw6ecrtAQKo7B1nAo48m/DaNSFSIgmdpMiT2Kw2nG
         6Q4pT0B4MyvbIkLxgvcPmmlccy0nD2M7UuJ9sUwoO5KNnk6ePwvyV+vfGMQd49ppgjmO
         EU6LX8XtwVDtUuoIx3nntRT6OXnKDEdRnrKbwV0lsj3Llmm/r2xJ7eJ4afUPK8AO+B9l
         zQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435071; x=1690027071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phgyiyd8NbrxCJu24dU6XdDa1Tp6brfneR4jmAIEZFk=;
        b=ibMdFdiyYzbeKD2I8GbHw98+UGvypSlFnQqoYjmq0ZDBRXZDr5Vnpie6BxW6f4YHT0
         NM1iaexMS0ckp2bMp6n0IoSkrMJHr5WoS1SndzGogFjlzNzGLBgZrLei7RXoq/t3i5K8
         SVJTz4iQ09YRNThpJIglutKCFaBV71+T4uEc5LTMJ9EUFvUFu6zb7VDvyvYz8fI3D1A5
         FJjoWmcl87VWp7/pGWdQRSXbIJopt6J2Nsc36vSfQtF6NAVLk71rzlPH+/CrOka6LNlQ
         Hl0tQiMofAIr9/KKir7xiamp4FOWpP6EdSvPweSEg9+FkSu/kIZEFfIzP/LrJ02RBDIM
         B6pA==
X-Gm-Message-State: AC+VfDznwASjr69faxBrJ4Pi3IyFvc9Udnpk8o3DKROdH8PuoUeFkpcD
        jCXwkfA5MGDydEwVTM3wdoxeLPBOLvUVwMf34r4=
X-Google-Smtp-Source: ACHHUZ6poKDsLFlQD1HpmPD4PKyctd7a/nkkBbNQ7Rfv9ZgP68A0QIMU05Nf4HH7hmzf7nDa/sPpGg==
X-Received: by 2002:ac2:4db7:0:b0:4f8:5f19:4b49 with SMTP id h23-20020ac24db7000000b004f85f194b49mr9152682lfe.64.1687435071042;
        Thu, 22 Jun 2023 04:57:51 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id eq21-20020a056512489500b004f4c3feb9fbsm1099235lfb.61.2023.06.22.04.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:57:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 22 Jun 2023 13:57:42 +0200
Subject: [PATCH 2/9] dt-bindings: clock: qcom,mmcc: Add GPLL0_DIV for
 MSM8998
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v1-2-5b7a0d6e98b1@linaro.org>
References: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687435067; l=1020;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=L1ZmGJhvE+3c4nyhdd/kuy9sgSYN3qso+d9Gf0E28bg=;
 b=Kx7DZaLLz3cEJIXbp9mivyGMd4PNbgP5zWk35jXwsFRj7JGiT5rkci4Mf9psBo5lRJH9qd3Dl
 NgyA+ZH+KzZA+VuUP5rl+iMpX/+FvhQS8WcWc9r37M83UHbTEKujbRe
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We've not been consuming that clock for no apparent reason. Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 422f5776a771..67e1eae0bbd0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -297,6 +297,7 @@ allOf:
             - description: HDMI phy PLL clock
             - description: DisplayPort phy PLL link clock
             - description: DisplayPort phy PLL vco clock
+            - description: Global PLL 0 DIV clock
 
         clock-names:
           items:
@@ -309,6 +310,7 @@ allOf:
             - const: hdmipll
             - const: dplink
             - const: dpvco
+            - const: gpll0_div
 
   - if:
       properties:

-- 
2.41.0

