Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970D26BA52D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 03:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbjCOCV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 22:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjCOCVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 22:21:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696EC21A35
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 19:20:44 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso2430096pjf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 19:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678846836;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okqg/9d6tFn55k+2DFuDNkPhMffbFQ6qTX/8piXTmeE=;
        b=SF1LaSsjZzq5bFpzrorDA49hc1WZZnkWrS30AyQsjnVY/w0BCe/6L5ocWppFKcPkUU
         wmMd/7cfcrFeJ4aWWjuWfsnR2cxUUacK+7ROixkbTAaVpfP32058bm2mno/OOBoIR0nj
         Z0rvMcpoit/ZLtfMf2fgFDU11/rBUKdxZH4/67mznj8HBdHZ0uaRwYZ6IEn2XWa2GQoQ
         U1Fzt+HCg3ge+yMvcQv78h20LQneA4CSs2XV0/7h14DvZIUCs5W50oR1K3/TPYecxvAj
         VKXDx1CI3nJdg2AsPnPas6s8zs0tn3ZwElHvp+gujzhU0I3TJMya375kKzPpyhOfSXfE
         sO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678846836;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okqg/9d6tFn55k+2DFuDNkPhMffbFQ6qTX/8piXTmeE=;
        b=knBUV8yxH1aoiyU79dJob6t2BLxwBF1osuSE0HrURepmks+D1VCpG22I8u53PTwS4+
         mSUA1grrfsINQeWkZkAq8OlGH3kLgHChjqpY3/xg3J7nNYzCS+VxbOT4z3IXIAkMKGpr
         UlsjtrL4BJtiWx7hk3OweqaaA1HU33qbJnXuoBdrkqq+lMWAI6xTLSb35DvJsobadnJN
         HThCTFJ0+T2sume+c5Qaqy3PgNY9RSMXldwT2pu14lCYQ21xhHUZB2IRQ7L7LNCVOYIU
         9qsncsbujfoBH3TsT3HUoVJFatfgrsI0SEJnsK4YvfV9sW3lZxV2fhzms5Vd1Hr4UhYJ
         pvRA==
X-Gm-Message-State: AO0yUKW6ZOvFbl2iVZfE5xoYOJuIIMRq0nYVV0oa7LlzZNloY8EocFtI
        n4BCPrwbKFYpoSPLbs+PAou6AHOpOn9q04MZvhs=
X-Google-Smtp-Source: AK7set/qRsFrRv65Pv6OxAVn61QPmRmFKPIDsiskevWw/dkF65b+IENNhAIpCZxadiSKtdk1aKmzlQ==
X-Received: by 2002:a17:90b:955:b0:23d:35d9:d065 with SMTP id dw21-20020a17090b095500b0023d35d9d065mr4152313pjb.48.1678846836237;
        Tue, 14 Mar 2023 19:20:36 -0700 (PDT)
Received: from T480 (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090a910300b00233b196fe30sm141859pjo.20.2023.03.14.19.20.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Mar 2023 19:20:35 -0700 (PDT)
Date:   Wed, 15 Mar 2023 10:20:26 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, marijn.suijten@somainline.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,qcm2290-tlmm: Allow
 input-enable
Message-ID: <20230315022025.GA22503@T480>
References: <20230314222705.2940258-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314222705.2940258-1-konrad.dybcio@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 14, 2023 at 11:27:05PM +0100, Konrad Dybcio wrote:
> Allow the common input-enable. This was missed with the
> initial submission.
> 
> Fixes: 5147022214db ("dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
