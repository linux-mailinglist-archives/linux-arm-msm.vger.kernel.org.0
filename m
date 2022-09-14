Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3FE5B82CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 10:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiINISX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 04:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiINISU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 04:18:20 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840A25757B
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 01:18:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id o2so21782660lfc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cqlKYYIAKLvsbLj53oR9k582UP5q4RYbtnJSev6cErM=;
        b=Ui29HLS6JX+VL10Nk/QmkazWJs5eqmCGy+EBD5rEqHVWeVDY3jR9jnyTTuenZuP2gN
         FfPaJZMuM7YJ1D0xETS6nq8V/OY9q1tQplruaQC+VqZALHUq9Wm6IUFzNH6lmCcBBMW5
         zj7Diql+6Qg5vdW1ZlxOm5ult7ZN/0TK+kJUskBpshhHyft8pRA6qHqMqGKkrbiXdMDv
         mwoMwHbtjmmwQOWEE8BKiW1rVRGGup1odxYpRa2dRAHrhLmIPCErDuRQjaCOOwGPoLMF
         GddEz6AWWuFqrgMsiJhvNbRul3sp8Pv6YYliW+VOr4jIOGbg9uqvRHF5QROpDJLYtjOO
         zIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cqlKYYIAKLvsbLj53oR9k582UP5q4RYbtnJSev6cErM=;
        b=4ML/KVyKsABKmrPe77XaxC7JcQwTidpVbcMff6iOdujWemjP5R/pB/0ZqOfg+3HqUZ
         ePDLvAuC9lUugbSB8SgK3uFkJCLTSgDrC2DGwsSnfLOSjL3Cv5tyl0mu5pyUrM7EBTk7
         Kmv9G1bc9+IoD8QMot87XjMqRzM/oO/b44OcGkVHaYJUxdKbHPpgyvXFWhYEnPqBb+Dw
         cJtPhfBvBTTAjJqada6466TnHCayi2XzRB/QlLohuXvBpmFr1YxirOAG4HJeLSKTaCeI
         I0ZQR3MqXQfSzBo787DsKTvUQKMaBe1LONIs+j3VqH7QnRlchoH4/TBPQ9IDIV/EZku3
         Q0UQ==
X-Gm-Message-State: ACgBeo0xtAfJYF/7i7Awka2FWG9gh6hG2f4R2Fgfu5ok+p0I2bPAavme
        fc15Ka0Bv/3Duks7d/6PkCSnzcnPGPGbKg==
X-Google-Smtp-Source: AA6agR6P7OpDqTPgN/zl2efEUWG/+XDiPW89d9J9OrHDj0WdFOiF+xS/Sp/rMXTZe8SY7JSdBDn1XQ==
X-Received: by 2002:ac2:4c4b:0:b0:499:3234:64fd with SMTP id o11-20020ac24c4b000000b00499323464fdmr7562363lfk.190.1663143497876;
        Wed, 14 Sep 2022 01:18:17 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n21-20020a05651203f500b004972b0bb426sm2267909lfq.257.2022.09.14.01.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:18:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] clk: qcom: gcc-msm8660: use parent_hws/_data instead of parent_names
Date:   Wed, 14 Sep 2022 10:18:13 +0200
Message-Id: <20220914081813.350628-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909105136.3733919-4-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-4-dmitry.baryshkov@linaro.org>
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

> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names. Use parent_hws where possible to refer parent
> clocks directly, skipping the lookup.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
