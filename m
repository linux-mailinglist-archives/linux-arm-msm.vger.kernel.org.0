Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEF2856691F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 13:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiGEL1k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 07:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiGEL1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 07:27:39 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C60816591
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 04:27:38 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m18so1553657lfg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9yfF0YMZuGdIUaeaIcdHJhmNd2KjDyr8ca/ezXZsSiY=;
        b=IWJ8xO11ZpUqp0ARZq9MQI9IBp6jZeCGHc6iWeuxaDolpDMTIjLwIRg5/6Nvfdzs8C
         jRyWegJQ6aXCchLAQqgAYHc4aM8e9XZEqjd9abxb8smVcHB/YD7jxxQJtXVPaVxNsO2x
         JrekMFHwoNGgYA+aOa0IzhUhs0nE9E0z3sdWUyj+ITMijUEEG5iHERv58M3eUmGFYsis
         Fw9WkSHhkJGYkw20Juvf4USguY1afO9EeO+ccdzGlVoaJ8zmvCR7ws0wFnOqSWJAdIel
         nh4zNcK0ljhCJ8ZwHAvA6onMI0gXJjKYTQ3vOwXvHM9YcanEtd07CDT4BKmjpgLqZpW7
         F7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9yfF0YMZuGdIUaeaIcdHJhmNd2KjDyr8ca/ezXZsSiY=;
        b=xVImtDCVAQDW7TSLWn63knRD45oDnLcwLmm3Lc6MQiXiC7S1iiYHQFJoIcMw0FRRsa
         ck179622SwY/KH5f9X+R7hprUaXqSdwWeQRTzxiVOPHwZbtN5jiiN2Ljid/yReKGO3dv
         0gZRYcZjOZiZZuC8Lp9/I1OKRVDkQNVgrgFktj/ChEpQKwQEmEIw4PioiMwCaNwWht9n
         EEz+iW3IG2l5FRZ5NGM0tw3OQAS8ktddRNvQ3koXL0A83NTO7dllU3+G01y3ZVF2qudZ
         14qxgsjj3b/TCMiYikkMilfLsqWRWwKn/q7olvMZ2wZhUaZYV5EK9E5xFMuONpwcl4pI
         9+hA==
X-Gm-Message-State: AJIora86HB+b0FBRhw+L2G7wVmTBy9oBigAylbWArTGJJf3HmgvBmOZO
        poUaGneJzinWOLCSPNnNJBoLlg==
X-Google-Smtp-Source: AGRyM1uUfcTic8dA6QTz5v+XBTyHmEyOvTUf0MzRKix0Ie613UbOQj7vsSS50wOycHnL9ceBXKG3UQ==
X-Received: by 2002:ac2:5f84:0:b0:483:6dca:bc69 with SMTP id r4-20020ac25f84000000b004836dcabc69mr2050375lfe.301.1657020455426;
        Tue, 05 Jul 2022 04:27:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b0025a736f5a41sm5525449ljn.9.2022.07.05.04.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:27:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: clock: update qcom,mmcc bindings for MSM8996
Date:   Tue,  5 Jul 2022 14:27:32 +0300
Message-Id: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a split of binding patches from [1]. When sending the original
series I missed adding DT maintainers to the CC list, so while all the
DTS changes were accepted by Bjorn, the dt-bindings were not reviewed
(and were not taken in).

Changes since v1:
 - Moved the first condition block (clocks/clock-names requirement)
   under the allOf (requested by Krzysztof).

[1] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (2):
  dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
  dt-bindings: clock: qcom,mmcc: define clocks/clock-names for MSM8996

 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 178 ++++++++++++++----
 1 file changed, 146 insertions(+), 32 deletions(-)

-- 
2.35.1

