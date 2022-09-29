Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3B45F0009
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 00:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiI2WWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 18:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiI2WWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 18:22:33 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3728612BD90;
        Thu, 29 Sep 2022 15:22:33 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-131f1494dc2so556533fac.7;
        Thu, 29 Sep 2022 15:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ahVPXxQAVfA26dQ9CQePI8B2LqZP5xo7qpGwH3+hchE=;
        b=rDoUEqBBrXkE6Qdf/oLP/EohR3nTI/uu4Ae9AsNxoSI7TVOmALqps4uiakvPFcfNIZ
         53s/ulAzlDw/6jHIge+O5xjezQfhPK1WyNS/72FlncDwLHMiw5KQm/Y97qZQCGMzbJ99
         nefJvcCi+UIlUWxjFTqZXSkL1CF5BGS4CwNXkmrc+mv3w1uetKPDmCWg39pwPUXwHwm8
         HC65n9YngR8cyR4kRwChETxIHA+SYjfcTi4UjMnc1I4lt1rbEvMEhoEotVIWbwWiSkDL
         EkLtpWYG9AV/oPhmLHnrlsJ3cxCWxBc6hKamo4ovvEjNHNfzbPJ3JpcxOa6nGtS7TCS1
         hr9g==
X-Gm-Message-State: ACrzQf3x9aDQglvKFEFRSo3hwpqvUKFehEevPHeFiWJhjb8fm4hyxKT8
        IU3kNQ+1dSgniy3zR62IiQ==
X-Google-Smtp-Source: AMsMyM7Tk757Ax+icdPGty0geMIIxcUYEzJsyLCvhhGeeDR8An5xEJGKEz0Qou16YLLsyyWqzFchSg==
X-Received: by 2002:a05:6870:d6a6:b0:127:ef52:75db with SMTP id z38-20020a056870d6a600b00127ef5275dbmr10212704oap.232.1664490152456;
        Thu, 29 Sep 2022 15:22:32 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r16-20020a056870439000b00127ba61535fsm263979oah.15.2022.09.29.15.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 15:22:32 -0700 (PDT)
Received: (nullmailer pid 2871452 invoked by uid 1000);
        Thu, 29 Sep 2022 22:22:31 -0000
Date:   Thu, 29 Sep 2022 17:22:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,gcc-ipq8064: add pll4 to
 used clocks
Message-ID: <166449015068.2871387.15544318962714747375.robh@kernel.org>
References: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
 <20220927113826.246241-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927113826.246241-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Sep 2022 14:38:24 +0300, Dmitry Baryshkov wrote:
> On IPQ8064 (and related platforms) the GCC uses PLL4 clock provided by
> the LCC clock controller. Mention this in the bindings.
> 
> To remain compatible with older bindings, make it optional, as the
> driver will fallback to getting the `pll4' clock from the system clocks
> list.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-ipq8064.yaml      | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
