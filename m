Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFBB466183E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 19:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjAHSnn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 13:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236197AbjAHSnd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 13:43:33 -0500
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C44AD2DA;
        Sun,  8 Jan 2023 10:43:32 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id i16so3340623ilq.9;
        Sun, 08 Jan 2023 10:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD50xi9fZknikJjIV+JKMPWaGnv6b+TbBRRbjfRGr9k=;
        b=4rB8cfvjHAwOew3ToOMWByirkzb0BiIy1x2OvGKoaTvkAQt29BCxzCTda8/UOIM5vn
         uf0OPPNjbYhF9Oi877HjHRo1KBMnDSQZIfxAWK5/17tU8/aPfTNP/A1bcXTqt4DPB/wa
         /U8bTLBfawEl4f2k7ERdtEmIhK56a7kwT3zauy4sjsSDkQ3KNDdEa7lT14umPfhH0w3b
         I7/ILpFmOQWLLUQzf+aH/9owBZ/W1vQgy8RZFiYZFbckL+xiGsCI4h7YJpO3oZd8HgbP
         mSxKCXrqxa7OLXbWmiYzuTZcQRM0ttVR8QviDFO5WNi6vTKRL4EsbZgEfy5GwYipho8P
         gouw==
X-Gm-Message-State: AFqh2kq9qSqDctQom11l/kpWgGcAuacQlQrwdXPonBiCLbkL/AV8sI11
        0H0vHgU4PPL0IL8R6sW/Lw==
X-Google-Smtp-Source: AMrXdXtigg8TWWmcxVRw9ZytgonLlbU66WyJ01xA/88x9TkYCUrOGZ5tSR6YPDfYLYeRo1H6c51opw==
X-Received: by 2002:a92:1305:0:b0:30b:be3c:d003 with SMTP id 5-20020a921305000000b0030bbe3cd003mr43483563ilt.32.1673203411418;
        Sun, 08 Jan 2023 10:43:31 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id u9-20020a056e02080900b0030249f369f7sm2086676ilm.82.2023.01.08.10.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 10:43:31 -0800 (PST)
Received: (nullmailer pid 190334 invoked by uid 1000);
        Sun, 08 Jan 2023 18:42:55 -0000
Date:   Sun, 8 Jan 2023 12:42:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 03/16] dt-bindings: clock: qcom,gcc-sdx65: drop
 core_bi_pll_test_se
Message-ID: <167320337489.190265.18376907357931956656.robh@kernel.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
 <20221228185237.3111988-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228185237.3111988-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 28 Dec 2022 20:52:24 +0200, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml         | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
