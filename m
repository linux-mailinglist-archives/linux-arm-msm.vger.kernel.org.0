Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44F3B66184D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 19:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234069AbjAHSpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 13:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjAHSpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 13:45:39 -0500
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB983192;
        Sun,  8 Jan 2023 10:45:38 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id m15so3875036ilq.2;
        Sun, 08 Jan 2023 10:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9G3YdJgL+I3ZsjFeBcOACBeFhOmVH78mROAeZKHJrg=;
        b=nwjaNN5MRQ/VvGB/BpcqhRH0EOEWCiED2gn8MXJin/rt19DCGPGwbL93sA0xqAYBTT
         qwaBzjZTLFA7HjQ+ocnpbtVvMMN/SFTQCQOOCQ9XH2tMYjrJgw4wRmF4onyTCThWj6U1
         OvZsZAwGFERDnGcJgsoqqTyg59TZxWPKqJO3oetsg8I36VoyBMnfn7yyvp1tnoeuF9YC
         2C383rQKewi4gkp3UXjRpWlX1txVhxEDeY3Vha0+IZnmhMoIUwFQBfVc7k+QEKSqctw3
         4GAhkSC1PlUEMOl6xEzKtTpljBcrLt2Bfe7dRSQQ7/4vNPXPkyiNv4YW0ZN7zVsxgwGw
         i4+w==
X-Gm-Message-State: AFqh2kqefRe0D9OGum74GYtmzDKEOP27ZZ7l+ZZfIwfvp5iJx8FxBVlS
        o+nflGQ7Xt6G1CgVLsK1mA==
X-Google-Smtp-Source: AMrXdXtsvvkjNI7tDsDcpErIdRLmdbyWKQb0PVSOrbXFw8UsDWcTaxp156jQeJ/7h91xNvcj9mSbbA==
X-Received: by 2002:a05:6e02:cc3:b0:30d:98a8:7d46 with SMTP id c3-20020a056e020cc300b0030d98a87d46mr3831674ilj.22.1673203537898;
        Sun, 08 Jan 2023 10:45:37 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id q13-20020a02a98d000000b0038a6d03db70sm2122210jam.34.2023.01.08.10.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 10:45:37 -0800 (PST)
Received: (nullmailer pid 193638 invoked by uid 1000);
        Sun, 08 Jan 2023 18:45:34 -0000
Date:   Sun, 8 Jan 2023 12:45:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 07/16] dt-bindings: clock: qcom: gcc-sm8450: drop test
 clock
Message-ID: <167320353407.193586.2014028665195116441.robh@kernel.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
 <20221228185237.3111988-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228185237.3111988-8-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 28 Dec 2022 20:52:28 +0200, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-sm8450.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
