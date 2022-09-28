Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F3F5EDF49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 16:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbiI1O4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 10:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234310AbiI1O43 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 10:56:29 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177C29B86C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:56:13 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b6so14604305ljr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=WD80FrVdvy3Avi4/+rEs2QAN7n7JbPi4VTfpdv+hG/M=;
        b=dM7LSPe2Kl9eYwv5S6vYy1q/f3+nyBfzky4fq4MGyceP/DKe0isHliv1943SNArxOe
         iRg9vIn7JJpvZVMK656df40iymHXkuM+Opu2pQmNpQWjNOVf46xYfDzDhWWPz9HJBgpn
         A8bmiBSnbJz7jyfc7zPaJiMvt51emYU1Mx2GW/5dCoGyLCSGLQKGBKu8unA53ZiPqvbM
         NG4xupmyRRDhjDK5OEiJbHtjKJCTon04P8x0/iE0E2BCOwfOvtw/keTOMrD+/haZlmzs
         480sTYvd7FylEzgZY2ZzFxnTbhQaBf2BLM+VwQLLF6f/BWPSESVnqDrhVGHRe/g6vH7q
         J9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=WD80FrVdvy3Avi4/+rEs2QAN7n7JbPi4VTfpdv+hG/M=;
        b=l/Y6kKHrzCB2Oc0DexYfY6uINqFwEKe5bZpkSjnvt2z5AlYhzdfeQpWQl74g4Bm8dF
         agt/zk/DsNzbD8QjYBzzM3V11U1goYn41cAmDEfJsjMgc2aKVVZ9AouoFeOFnzr6sA/e
         VUveKtQAvpOyVeVeiVrNC1HCOHMuXJGg4/9Pjqc0hgZpLNA3qJlSIy3jTh7vaDUR2C62
         t6or51vdKfQiuO51AXtT1xgCyLtv2zXEK2gZub3SSo8qu0TlkI3RIBW2KFRRI1x5f8hv
         eAqMvwDyWOET7wprZ9fTQ4LwHM0jpiUadTRS5kBmwB9bndrXNAilIZUvGJWJBAp1LR6r
         KoMQ==
X-Gm-Message-State: ACrzQf3fZP9jSoXL+ivEgPteprRBRyAo8IpniqvZRlnP2Mg3lnBX86dg
        RmXTlOgNRzvbJ4clAd1WuT5Dvg==
X-Google-Smtp-Source: AMsMyM78t54OBnJwecOi+K74O3HJ6iZUklhvHR9j8ZzUIW/X7apmgvgZ4hUazq8Uftd6Hhs0G7Q/ug==
X-Received: by 2002:a05:651c:146:b0:26d:9eb6:7f35 with SMTP id c6-20020a05651c014600b0026d9eb67f35mr5538134ljd.311.1664376970823;
        Wed, 28 Sep 2022 07:56:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651238a600b0048b256bb005sm498094lft.49.2022.09.28.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:56:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/3] clk: qcom: gcc-msm8939: several small fixes
Date:   Wed, 28 Sep 2022 17:56:06 +0300
Message-Id: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Apply several small fixes used for other Qualcomm clock drivers:
- Use ARRAY_SIZE and parent_hws where applicable in gcc-msm8939 driver
- Move gcc-msm8939 schema from gcc-other to gcc-msm8916 to declare the
  clocks/clock-names used by this platform.

Dmitry Baryshkov (3):
  dt-bindings: clock: move qcom,gcc-msm8939 to qcom,gcc-msm8916.yaml
  clk: qcom: gcc-msm8939: use parent_hws where possible
  clk: qcom: gcc-msm8939: use ARRAY_SIZE instead of specifying
    num_parents

 .../bindings/clock/qcom,gcc-msm8916.yaml      |  11 +-
 .../bindings/clock/qcom,gcc-other.yaml        |   3 -
 drivers/clk/qcom/gcc-msm8939.c                | 552 +++++++++---------
 3 files changed, 284 insertions(+), 282 deletions(-)

-- 
2.35.1

