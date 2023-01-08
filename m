Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBFD661846
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 19:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbjAHSpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 13:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbjAHSpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 13:45:13 -0500
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FA1DFCD;
        Sun,  8 Jan 2023 10:45:12 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id v2so3536195ioe.4;
        Sun, 08 Jan 2023 10:45:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HulVE+WPw+5J2Kqv7gl35AkEhssFG+nyCoDOUQbsek=;
        b=iwkDgCw8of7Ghslo2pIRke4Bf7DiAYV9VV3GsPbVC2h2Wq4UtfdTHPl6m1yVnWswrb
         nBJlVcKYYdUmMLRKTtg60ElPHiCa+T3hUa6QxzBG+VQhxF6XXQUlWt9RVxrA0/SwLpJp
         +7mSbl953wOFxWgfSBDrY9WDlqxpydJd43V5X7nqqMXl/G/qKN4sBb9zkbmgVTc6oeGJ
         ApfkbKLq257DuNf51NlK3MPoCIsc7PiDO9MQcoUIIIPxhruFdnFDZdhWkgzPUP46ysPm
         3q0itOlF628V4hHnfLd2l85yPRlCvRJIRUvcB4Pp985g2Ze7MC+7RYrK5aIngX+35e6W
         1zxA==
X-Gm-Message-State: AFqh2kq0F2iuFWoLwehw68rW27mdopacqnc/h53Ey62wkRdbiiKJkA3l
        N4f1gXkYoD3sdwWI8FX0Wo3y5U0VBA==
X-Google-Smtp-Source: AMrXdXtZhMcZplFHfjLHE1STH44cfnIgdewbxdyg0rtSX5wZFtk/IM83DGRgK2wJg7FDkIWxq94+mA==
X-Received: by 2002:a5d:9d59:0:b0:6e2:ec15:fb69 with SMTP id k25-20020a5d9d59000000b006e2ec15fb69mr43847970iok.8.1673203511480;
        Sun, 08 Jan 2023 10:45:11 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id o13-20020a0566022e0d00b006bb5af55ddfsm2468389iow.19.2023.01.08.10.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 10:45:11 -0800 (PST)
Received: (nullmailer pid 192951 invoked by uid 1000);
        Sun, 08 Jan 2023 18:45:08 -0000
Date:   Sun, 8 Jan 2023 12:45:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 05/16] dt-bindings: clock: qcom,mmcc-msm8998: drop
 core_bi_pll_test_se
Message-ID: <167320350791.192896.9852680927358072163.robh@kernel.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
 <20221228185237.3111988-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228185237.3111988-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 28 Dec 2022 20:52:26 +0200, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
