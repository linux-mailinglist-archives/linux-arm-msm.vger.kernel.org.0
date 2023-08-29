Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F39878CC5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 20:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjH2SrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 14:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234761AbjH2Sqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 14:46:35 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C28119A
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 11:46:32 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7484cfdc11so4572938276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693334791; x=1693939591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+ED0KXs67DGrmo6iXaWzPAJQDmbnXsYGdJFbasrMdI=;
        b=ClWjzcAfjYvtZ8nl+s7yeWbc+hc5FJFSCfsmTr8wmd/zVGplocRb++tAmdLjdsc9zc
         nfs6Ak/RS7XX2cggg/o75ialkDJwSUmqpoE0jlMeh3HrLPdu5cp3G0lkpB0XGMYE3XOC
         s5Z3wGgOcqeZVH4rZ4Z18ix/VHAoHldddAp34xZc28soOqMULHblq4fl9sVDsgxIZLN1
         UQWTMxiRjLNSy54jTnOGWiDCUivs75yf4KiJWzQlLbqvLyuPzW4fmCFix5ea17knoMq4
         7Ov+viFXw9Qeb7kfTlBZ45jKJGGg1ngVZixWXIuhHigS6SN/T5lzODHIBbHBip0x5fcC
         2OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693334791; x=1693939591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+ED0KXs67DGrmo6iXaWzPAJQDmbnXsYGdJFbasrMdI=;
        b=PZp2j7ZgCRrrL9YuCQvdaVi7mjckPqFkdVcvTm/FPN/DzMDcu/uwWFgdYc6EsUGKNN
         RfX1OEVLMFVpF9xea2FedX+H0L/LVKi0T0izmlhR1Kf/AS1gZIbkQMx7IhDmy2W0rFZ4
         H17VCDzP6uKcqDi35BamOlzyaf5YeUdnGD5oBCSxJaQHtQYEXB4fPAzDajzj720zzI2c
         nMKLJq5a+bxk6RpuVH8kWQnwq3o9W9HFKd4uv2cblB5QGxjmo+JkBclZnUz30i+J2vht
         BYt/65rGTTY/v0Vloleh4I245F/zphJLL75KGsRHZzK9Anf8d3yExGDLRPd4wOV8eVr2
         FuFA==
X-Gm-Message-State: AOJu0Yxw+wUWRffmtMUA/QxUTB93XB/pV40ed6oPORMKbtzbOGLowWoM
        iC9lTF5gZWM+DgKBIHGgtJ1OHjoEmsiZN9pQasCJGQ==
X-Google-Smtp-Source: AGHT+IF7Q+2ONedva5BlExE5dN6mOQYTGK+793vpj6L4wQkNIymKBXWY+28Y72O3M02h08fxfWekTJ3xhcGsPQoR0RA=
X-Received: by 2002:a25:d10a:0:b0:d62:b91b:10e3 with SMTP id
 i10-20020a25d10a000000b00d62b91b10e3mr30257956ybg.48.1693334791365; Tue, 29
 Aug 2023 11:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230829135818.2219438-1-quic_ipkumar@quicinc.com>
 <20230829135818.2219438-5-quic_ipkumar@quicinc.com> <169331975886.2142011.7345682428392154402.robh@kernel.org>
 <17e2413b-6d06-a113-e35b-30cc078a6e83@linaro.org>
In-Reply-To: <17e2413b-6d06-a113-e35b-30cc078a6e83@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Aug 2023 21:46:20 +0300
Message-ID: <CAA8EJppNGs0UVhBJq_+RFt8pALEk0tEoKfUo1AxzbSu82A5_HA@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: phy: qcom,uniphy: Add ipq5332 USB3 SS UNIPHY
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kishon@kernel.org, robert.marko@sartura.hr, robh+dt@kernel.org,
        geert+renesas@glider.be, peng.fan@nxp.com,
        konrad.dybcio@linaro.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, will@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        quic_varada@quicinc.com, vkoul@kernel.org, nfraprado@collabora.com,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, quic_wcheng@quicinc.com,
        rafal@milecki.pl, gregkh@linuxfoundation.org,
        luka.perkov@sartura.hr, andersson@kernel.org, arnd@arndb.de,
        linux-usb@vger.kernel.org, agross@kernel.org,
        catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Aug 2023 at 20:09, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/08/2023 16:35, Rob Herring wrote:
> >
> > On Tue, 29 Aug 2023 19:28:13 +0530, Praveenkumar I wrote:
> >> Add ipq5332 USB3 SS UNIPHY support.
> >>
> >> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> >> ---
> >>  .../devicetree/bindings/phy/qcom,uniphy.yaml  | 117 +++++++++++++++++-
> >>  1 file changed, 114 insertions(+), 3 deletions(-)
> >>
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > In file included from Documentation/devicetree/bindings/phy/qcom,uniphy.example.dts:45:
> > ./scripts/dtc/include-prefixes/dt-bindings/clock/qcom,ipq5332-gcc.h:19: warning: "GCC_BLSP1_AHB_CLK" redefined
> >    19 | #define GCC_BLSP1_AHB_CLK                               10
> >       |
>
> So the only patch which actually needed dependency information did not
> have it. All other patches have something, even defconfig (!). Confusing.

Much simpler. This patch adds a second example to the schema. Both
examples include something-gcc.h. As both examples end up in the same
example.dts file, second include conflicts with the first one.

-- 
With best wishes
Dmitry
