Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3A96C6EF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 18:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbjCWRbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 13:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbjCWRb1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 13:31:27 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC8A2B9D9
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:23 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id q102so7630176pjq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoRlfx7CbmqnP3zURzbR63MNq645Q0jdEhms+74MeYc=;
        b=kAbV/I/7xnERMCRUryA9uRdH+3r0Gbql1oICa8dpLQkpw3nzC30aFv0O2WVZhad+Rg
         z/5TPz2pe2fz4w0QwV2aTcCxsSSCzZRWT4Rb7+IXKwSWE25W9HVRgq2ygsxETUMA6Yeu
         1bfWQmuHyrMczCGKRaLFy9bXJTz805huHOKHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoRlfx7CbmqnP3zURzbR63MNq645Q0jdEhms+74MeYc=;
        b=yfRm7ZaQ5rWwcdceGgPerQVEjDmeylfK+j5p5mzWYxxKpBmftEiyKCZVZDwxBd5TZ1
         oXx5McD5e3LFXwzwoeGUpdz3yImibsf4ij0+grwyTSfxcvX7Eysf0iwFknu/ld0xjyvo
         87OD5c9NH0UGtYMx3oivP+qgtpDKcBsOmd7v0mqPD0424FZLLLZHIAVnDEWnRzHWW6tO
         FkSF0m4wQqI7j+Y4/476OhC1rL3nCL6fulm6J//nGtIjwcRcJjOlUxMaSom05Pp76ZA0
         CGIZpd8A2t5opBGLIlpFN9AT/UTYGmaoI7h1nwXrzsI0dMNllNqRFptMQlI5+N1PmEFT
         HHYg==
X-Gm-Message-State: AO0yUKXhncfK7I+kFuniax/40UKUk9a9g23vnIhxD6jxyFh9HBFr0ERd
        IiQLa7WYsjNvOutwHdopr39yDA==
X-Google-Smtp-Source: AK7set+wKfX/T8HiiMPPsgLGNmM1PcdDUUn5hrO5kvSgLUVSymrEOe8m2EhrenDZ8jrFoHqrR+7FrA==
X-Received: by 2002:a05:6a20:33a8:b0:d4:c605:4512 with SMTP id f40-20020a056a2033a800b000d4c6054512mr318424pzd.30.1679592683296;
        Thu, 23 Mar 2023 10:31:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] dt-bindings: pinctrl: qcom: tlmm should use output-disable, not input-enable
Date:   Thu, 23 Mar 2023 10:30:10 -0700
Message-Id: <20230323102605.6.I291ce0ba2c6ea80b341659c4f75a567a76dd7ca6@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230323173019.3706069-1-dianders@chromium.org>
References: <20230323173019.3706069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As evidenced by the Qualcomm TLMM Linux driver, the TLMM IP block in
Qualcomm SoCs has a bit to enable/disable the output for a pin that's
configured as a GPIO but _not_ a bit to enable/disable an input
buffer. Current device trees that are specifying "input-enable" for
pins managed by TLMM are either doing so needlessly or are using it to
mean "output-disable".

Presumably the current convention of using "input-enable" to mean
"output-disable" stems from the fact that "output-disable" is a "new"
property from 2017. It was introduced in commit 425562429d4f
("pinctrl: generic: Add output-enable property"). The "input-enable"
handling in Qualcomm drivers is from 2015 introduced in commit
407f5e392f9c ("pinctrl: qcom: handle input-enable pinconf property").

Given that there's no other use for "input-enable" for TLMM, we can
still handle old device trees in code, but let's encourage people to
move to the proper / documented property by updating the bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index cb5ba1bd6f8d..5a815c199642 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -75,7 +75,8 @@ $defs:
       bias-pull-down: true
       bias-pull-up: true
       bias-disable: true
-      input-enable: true
+      input-enable: false
+      output-disable: true
       output-high: true
       output-low: true
 
-- 
2.40.0.348.gf938b09366-goog

