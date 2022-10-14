Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE495FEFCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Oct 2022 16:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiJNOHs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Oct 2022 10:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiJNOHh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Oct 2022 10:07:37 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0933E9861;
        Fri, 14 Oct 2022 07:07:22 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-136b5dd6655so5977462fac.3;
        Fri, 14 Oct 2022 07:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yyAUCq/XeIgOsn5nW4H0/zi1fPyOR16Z+9WtLfC5Vo=;
        b=rNpt59+czNjUAMgtv68cTmSl/wefLYRt6MyUZkOpWXXKu1iEKR/oMJHaJKqsrQ5fsL
         UM0Q4ZLZXT1/yefmSXx3udS5q24PuZwAGfVZKqX6Roy1ldSiACThz57E0TYNkh9qLZSY
         /tWOpPwOCguVCcdrjRcqwOX5u1B/ItrYT1sqNnkIHW+IUOQSWXtKRpMa3lNrozQUGRWc
         drEhQxQImciiw5S8+5bV9EJGesZo9Q2oEvP39uPP+Y6EJ7QbboBoRhShdO5T36TuWTkO
         j/h0DFEqtxvws/L/YmucVSoagOuTf1QKrSMDfmL2SZdm1BLYjeVRrYHLFoCVAJ5bbx0o
         mskA==
X-Gm-Message-State: ACrzQf3bPjB3Wnt7QXuVEWTn39hrTQLXKTOlcpPv1VX2UiI1UJvt8IHC
        qHOdkTz3etWH18TZv0tBJg==
X-Google-Smtp-Source: AMsMyM6o1zHniDWcovTDfOXfFp60qv41U2PCX8VKv1wcpj7BcPxz5mirIT0ybjjPvkw0bJE1KDZhwA==
X-Received: by 2002:a05:6870:5585:b0:136:8a4d:f131 with SMTP id n5-20020a056870558500b001368a4df131mr8796172oao.239.1665756434519;
        Fri, 14 Oct 2022 07:07:14 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v3-20020a0568301bc300b00661a05691fasm1182394ota.79.2022.10.14.07.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 07:07:14 -0700 (PDT)
Received: (nullmailer pid 1857839 invoked by uid 1000);
        Fri, 14 Oct 2022 14:07:14 -0000
Date:   Fri, 14 Oct 2022 09:07:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Yann Gautier <yann.gautier@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: arm,pl18x: Document
 interrupt-names is ignored
Message-ID: <166575643424.1857656.14810437673054950633.robh@kernel.org>
References: <20221013221242.218808-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013221242.218808-1-marex@denx.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 14 Oct 2022 00:12:40 +0200, Marek Vasut wrote:
> Due to inconsistency of existing DTs regarding the content of this IP
> interrupt-names DT property, document this such that interrupt-names
> is not used by this IP bindings.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Yann Gautier <yann.gautier@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Add deprecated:false to interrupts: description
> ---
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
