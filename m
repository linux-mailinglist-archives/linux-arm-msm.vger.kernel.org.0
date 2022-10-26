Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD7C60EB70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 00:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbiJZWSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 18:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiJZWSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 18:18:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3875F63E3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 15:18:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id o12so31769581lfq.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jqI46+e/77kTgH7h4PL7uKuCpH6Cjz4yNeCC9Ks3dc=;
        b=MAx9GoqJUSQhB9bUYYAAInmItHedCwfDzU+a4AbWRsIeK/Yc90GUigg1RMlpIdTisx
         mC4FlztFxd+wbVprYc/rwG8i1qM8Y+NnBwRdOv4HkLoF5IBFaptL9QGCipm79reH71Aj
         Y9bT4Uf/if6xXcCHZImJQqf7A78epbLOgSNMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jqI46+e/77kTgH7h4PL7uKuCpH6Cjz4yNeCC9Ks3dc=;
        b=Uf2JLR7nLEm2mNvwhQHqEvtS1lyODcTG6FCK0Ud8uAwkH/dghPaMNehqxZbptqVBSV
         GtvT7pA+vQ+rGI6J+tdLEvLX+uwLrd3jjwnJ+x81VW9dBLjFtJGzhUQPVuJCs27Qu4pm
         f+x4Zd03mMUQ5uBU6+8O1d5LiDF6sXG+zuak9h/qrSpOQXQidIH6HbzusojgFD6v/mgS
         V4e1rVw4PV7lYCQkjJye7lTzx3YJ2NCNUUcfzN+dQz5OcGi1AttOTCovESANm2qOa4Ww
         YAx3uGLh4YBtStZvixJR2WudC0trLEBSTsIlAt0OqUsGvD6iE/jhC0nlukhSLzyNjjqw
         oBPw==
X-Gm-Message-State: ACrzQf1AMLmXXiuKDDLneSq2cqa7OCubb1vl3Kt1zQPys08FsaGBQwXX
        2RP1sd75Gr3TONSJtBoaMlWjr5SO5JD7D+D4XbE4Xw==
X-Google-Smtp-Source: AMsMyM4NW2ATDJXFwKq7wuAg3X3McqDZmNzLYBOFH6QkeLPvXebMrquLMvO2T31xyTlgJ0snNV/KF5PqAsctW7ikaq4=
X-Received: by 2002:a05:6512:3dac:b0:4a4:8044:9c3 with SMTP id
 k44-20020a0565123dac00b004a4804409c3mr16238548lfv.145.1666822686108; Wed, 26
 Oct 2022 15:18:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Oct 2022 18:18:05 -0400
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpay0w6n6rtv+bsdcTvL4ijtEPBODo1=XJpUFNdaooTcg@mail.gmail.com>
References: <CAE-0n52xbZeJ66RaKwggeRB57fUAwjvxGxfFMKOKJMKVyFTe+w@mail.gmail.com>
 <CAPDyKFpay0w6n6rtv+bsdcTvL4ijtEPBODo1=XJpUFNdaooTcg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 26 Oct 2022 18:18:05 -0400
Message-ID: <CAE-0n52Bfe-7Fpawct=_3=miLBygR_-YXm1YPnhCWOwxFnjv7g@mail.gmail.com>
Subject: Re: clk: qcom: genpd lockdep warning in gdsc
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Yu Zhao <yuzhao@google.com>, linux-arm-msm@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya <quic_c_skakit@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviving this old thread because this commit has lead to a couple bugs
now.

Quoting Ulf Hansson (2022-06-22 03:26:52)
> On Fri, 17 Jun 2022 at 21:58, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Hi Bjorn and Dmitry,
> >
> > Yu reported a lockdep warning coming from the gdsc driver. It looks like
> > the runtime PM usage in gdsc.c is causing lockdep to see an AA deadlock
> > possibility with 'genpd->mlock'. I suspect this is because we have
> > commit 1b771839de05 ("clk: qcom: gdsc: enable optional power domain
> > support"), and that is now calling runtime PM code from within the genpd
> > code.

This commit has caused a deadlock at boot for Doug[1] and I see that the
camera driver on Google CoachZ and Wormdingler devices doesn't work
after resuming from suspend once this commit is applied. I'm leaning
towards sending a revert, because it seems to cause 3 issues while
removing the regulator hack that was in place to enable MMCX. This patch
is cleaning up the hack, but trading the hack for three more problems.

> I think genpd already has nested lock support, so the only
> > solution is to not use runtime PM from within genpd code and start
> > expressing genpd parent relationships in genpd itself?
>
> Not sure exactly what you mean here, but yes, expressing the
> parent/child domain relationship is always needed.
>
> Having gdsc_disable() to do runtime PM calls (gdsc_pm_runtime_put())
> seems awkward to me. Why is that needed, more exactly?

It seems like this is needed so that the gdsc_enable() and
gdsc_disable() calls can read/write the registers for the genpd, while
those registers live in some clk controller that needs either a
different clk (probably some AHB clk) or another genpd to be enabled. It
looks like for qcom,sm8250-dispcc it relies on MMCX gdsc (which is a
genpd). From a hardware view, the MDSS_GDSC provided by the display clk
controller is probably not a sub-domain of MMCX. Instead, we need to
have MMCX enabled so that we can access the registers for the MDSS GDSC.

My question is if it makes sense to simply describe that the GDSCs
provided by a device are sub-domains of whatever power domains are
listed in DT for that device? I think if we did that here for sm8250
dispcc, we wouldn't need to use runtime PM within the genpd code
assuming that the MMCX parent genpd is enabled before we attempt to
read/write the dispcc gdsc registers. Hopefully that is also done, i.e.
enabling parent domains before enabling child domains if the parent is
disabled.

Is this already being done with pm_genpd_add_subdomain() in
gdsc_register()? I see that we're attaching that to dispcc's struct
device::pm_domain, but I assume that is different from the MMCX genpd.
Maybe that is the problem here. Dmitry can you further describe the
problem being solved?

>
> > Or maybe genpd
> > needs to drop locks while calling down into gdsc_disable() and reacquire
> > them after that?
>
> Nope, that doesn't work. This internals of genpd relies on this
> behaviour, as it allows it to properly deal with power-on|off for
> parent/child domains, for example.

Ok.

[1] https://lore.kernel.org/r/20220922154354.2486595-1-dianders@chromium.org
