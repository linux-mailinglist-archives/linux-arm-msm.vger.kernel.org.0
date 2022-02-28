Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9A94C7A76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 21:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiB1Ucs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 15:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiB1Uco (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 15:32:44 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F1613D46
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 12:31:59 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id k2so14358189oia.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 12:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=utrIpj5sGwbA9Y5s37XmpLzhGxUfS2xneQil5soYPOM=;
        b=IJNTXhb8vKmca/sPG/5vUyGbk6U/5uSV4ApOSAlXFGmNSwgyan6DeTxcgzJiHwa6sp
         NypjgIHkmQkkzpgLJ9502B4A1aijO507ETnJHHwo03ypRd85V0mZcil/a3UZYUEZMIdx
         12FZxG2zLO9hKIqOHOOlAT2X8dgcls4RMqIe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=utrIpj5sGwbA9Y5s37XmpLzhGxUfS2xneQil5soYPOM=;
        b=GfUzMFEuamIdunb4iTrTNi4dlut0/XVT61sAhRJeKoy3RX8Q4y8W80ctZGh+YmZUVP
         C0sIsOdBaMFgbdkn5I4asqT6mO2L964aROnji+ppKoZmhEtczBA11jDwSL/qrQw6vbX1
         fOBozLWjDh6a7Rv0GORmfm42CgeddL3F/vnCusAU5Ph/5693HXsD/57Eqh6Ta3HwKpgD
         23yMesmZNCttPBoJIPCUEWhwnwo1A2Tne1ofVwPSyb7TbSDHNlmh+kfZMDys9s/Ql7kF
         qD18f33haILCvFrTtUy0Hcm50hYqXTz6EZyKuBlbyZ6t9x/u7wG98/aD89wmyLm1SozM
         tKtA==
X-Gm-Message-State: AOAM530Vjv4XxfTxbve+51duj3DzxpgPd1gB+WzbEnaYn40M6ir9LOel
        IIlDwUOWUFXo0roAiFUhvfXMdE31ozyQpSWZsMVd5g==
X-Google-Smtp-Source: ABdhPJxT2qNwI+x+MXRZ6vklFHt8jMreYUaB/MnFw7ql9KToFLQdHvgZr3G6P8pADPUBa+ZL0D2JlyDA+u4ZmUk0Cxk=
X-Received: by 2002:a05:6808:1a28:b0:2d7:3c61:e0d6 with SMTP id
 bk40-20020a0568081a2800b002d73c61e0d6mr12145538oib.32.1646080318805; Mon, 28
 Feb 2022 12:31:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 12:31:58 -0800
MIME-Version: 1.0
In-Reply-To: <05780d0a-bc9c-3a81-2676-ea92453d7303@quicinc.com>
References: <1645182064-15843-1-git-send-email-quic_c_skakit@quicinc.com>
 <1645182064-15843-2-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n51X=LJMjDb9KS0rqQDqLR5srzxCOJCRS4oJgPSXbvaSiQ@mail.gmail.com> <05780d0a-bc9c-3a81-2676-ea92453d7303@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 28 Feb 2022 12:31:58 -0800
Message-ID: <CAE-0n517usy-DDEg+r1Q6oeer0i5bBiAqTugxf3GPcW+2gtQ9A@mail.gmail.com>
Subject: Re: [PATCH V7 1/5] dt-bindings: mfd: pm8008: Add pm8008 regulators
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya Kakitapalli <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya Kakitapalli (Temp) (2022-02-28 06:14:56)
>
> On 2/19/2022 7:09 AM, Stephen Boyd wrote:
> > Quoting Satya Priya (2022-02-18 03:00:59)
> >> Add regulators and their supply nodes. Add separate compatible
> >> "qcom,pm8008-regulators" to differentiate between pm8008 infra
> >> and pm8008 regulators mfd devices.
> >>
> >> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> >> ---
> > Is the register layout compatible with SPMI regulators? The gpio node
> > seems to be fully compatible and the same driver probes there for SPMI
> > and i2c, so I wonder why we can't extend the existing SPMI gpio and
> > regulator bindings to have the new compatible strings for pm8008. Is
> > anything really different, or do we have the same device talking i2c
> > instead of SPMI now? Possibly it's exposing the different hardware
> > blocks inside the PMIC at different i2c addresses. It looks like the i2c
> > address is 0x8 and then there's 16-bits of address space inside the i2c
> > device to do things. 0x9 is the i2c address for the regulators and then
> > each ldo is at some offset in there?
>
>
> The register layout is not compatible with spmi regulators, I see some
> differences w.r.t VOLTAGE_CTL, EN_CTL, MODE_CTL registers. Also, there
> is no headroom related stuff in the spmi driver.

It sounds like minor differences and/or improvements to the existing
SPMI regulator hardware.

> >>           interrupt-parent = <&tlmm>;
> >>           interrupts = <32 IRQ_TYPE_EDGE_RISING>;
> > I still fail to see what this part of the diff has to do with
> > regulators. Can it be split off to a different patch with a clear
> > description of why interrupt-controller and #interrupt-cells is no
> > longer required for qcom,pm8008?
>
>
> This diff has nothing to do with regulators, I removed it to avoid yaml
> errors during dtbs check.
>
> I'll move this to a separate patch.

Ok, thanks!
