Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D18A5A80A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 16:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiHaOxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 10:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiHaOxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 10:53:08 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A445C9917
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 07:53:07 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id nc14so23976458ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 07:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3SBHDQAodprZxU58N6fxxm9XMEGZF1r8qJ0Wxzeitls=;
        b=V3wivMLpqCGUfOvErwvyzMGDMB3actPkoJXjB9x+5QdBvqm1czGegZ67hUVOoXcOJp
         aV3bW0fiY5lgbhj0nESLHHfiLaosxh/WZORVW3dAdHzsGuCDNZZOCddyyR/erM5pSLuc
         B8clr5tOPV87ktHrDNy3qTqsxctKihiE8SXYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3SBHDQAodprZxU58N6fxxm9XMEGZF1r8qJ0Wxzeitls=;
        b=cNRudolng3FjxfytW4WVXI+u6F7wgtRCOTu3gb3DxX/M8LVTdSgAaq0EcTbM5I03h0
         /ddIAu0XlCjNFPVHvgm1Fva96gNJBgK4luYgeYPcu3haLJRS+jY6iqnFP43bs+WkZcDP
         GW8IA84pd0yoCQ7AsSF90ZaAccOtQOF3lWwtuCLp7aLimwfL9S1rZI7k5Es0C7uUiQ7N
         ObEB5g1vQ44Ik6Q/DXMzqTI86ZxaI+HSTgtLmiUYAtKM2k9TKWKaD5q2kt9VNemaKbKS
         rNgBb8EdAg9ZQZFNSDTd+ZvhDUgMIf6k0Eah4mvXGpKcTCBO7kfpOs61d+JIKI1z5MzF
         l55A==
X-Gm-Message-State: ACgBeo28LR0F4hhphjn5e37sADM8nSvaCtHyFWQRtrlkN3RbmPwDWuSf
        okXFcnwKQI1X7V7ySv1FxOjaYDkGV2ppP6Xl
X-Google-Smtp-Source: AA6agR7wjGT9sE6n/0LL6YBl/KgwE0STv4OzjWdBqfuq9GdFyzSIADmow4zJWxJDs/w1A6Uv2NHgGA==
X-Received: by 2002:a17:907:16a9:b0:742:7a6:b17e with SMTP id hc41-20020a17090716a900b0074207a6b17emr6932023ejc.108.1661957585823;
        Wed, 31 Aug 2022 07:53:05 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709061dcc00b0073dc8d0eabesm7338110ejh.15.2022.08.31.07.53.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 07:53:04 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id e13so17706756wrm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 07:53:04 -0700 (PDT)
X-Received: by 2002:a05:6000:15c6:b0:226:f246:6e70 with SMTP id
 y6-20020a05600015c600b00226f2466e70mr177095wry.617.1661957584434; Wed, 31 Aug
 2022 07:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220829164952.2672848-1-dianders@chromium.org> <Yw8EE/ESDUnIRf8P@hovoldconsulting.com>
In-Reply-To: <Yw8EE/ESDUnIRf8P@hovoldconsulting.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 Aug 2022 07:52:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJz2hjvsUhsjBPt9nmm3X62oTdAqMeSFABYJietPPzWw@mail.gmail.com>
Message-ID: <CAD=FV=VJz2hjvsUhsjBPt9nmm3X62oTdAqMeSFABYJietPPzWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: Fix broken regulator spec on
 RPMH boards
To:     Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 30, 2022 at 11:47 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Aug 29, 2022 at 09:49:46AM -0700, Douglas Anderson wrote:
> > Prior to commit efb0cb50c427 ("regulator: qcom-rpmh: Implement
> > get_optimum_mode(), not set_load()") several boards were able to
> > change their regulator mode even though they had nothing listed in
> > "regulator-allowed-modes". After that commit (and fixes [1]) we'll be
> > stuck at the initial mode. Discussion of this (again, see [1]) has
> > resulted in the decision that the old dts files were wrong and should
> > be fixed to fully restore old functionality.
> >
> > This series attempts to fix everyone. I've kept each board in a
> > separate patch to make stable / backports work easier.
>
> Should you also update the bindings so that this can be caught during
> devicetree validation? That is, to always require
> "regulator-allowed-modes" when "regulator-allow-set-load" is specified.

Yeah, it's probably a good idea. I'm happy to review a patch that does
that. I'm already quite a few patches deep of submitting random
cleanups because someone mentioned it in a code review. ;-) That's
actually how I got in this mess to begin with. The RPMH change was in
response to a request in a different code review. ...and that came
about in a code review that was posted in response to a comment about
how awkward setting regulator loads was... Need to get back to my day
job.

In any case, I think these dts patches are ready to land now.


> Perhaps at least for RPMh as it seemed you found some cases were this
> wasn't currently needed (even if that sounded like an Linux-specific
> implementation detail).

I think you're talking about the RPM vs. RPMH difference? It's
actually not Linux specific. In RPM the API to the "hardware"
(actually a remote processor) is to pass the load. In RPMH the API to
the hardware is to pass a mode. This is why RPMH has
"regulator-allowed-modes" and "regulator-initial-mode". Both RPM and
RPMH have "regulator-allow-set-load" though...

-Doug
