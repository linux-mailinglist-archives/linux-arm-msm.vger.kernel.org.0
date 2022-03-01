Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380264C9945
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 00:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbiCAXYt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 18:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiCAXYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 18:24:48 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9D62E6B4
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 15:24:06 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id e22so202578qvf.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 15:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OSsBX21NVNiSwRS2p6EfLvoeuH1E+LW1LIdRNsY4vkU=;
        b=Ip5F3z+EsQE2X2jhyvGPCg0qooxL0cLhLEUtWQuSVJHNZhjaSf3bznFF9q1y7urVuO
         ZqXiiVS2BCbCEpQ1PvYzPaP/grTWYp3cJrz2ltZy2W8SYhbAeqCmwTfinzoy0u75vCgR
         qo+psCbS9smznMQRHHGdHfAguKcFpH9uwGbgzrMGM3H/Y6xblVNU51dMvy0I0cmnQlMe
         V6m0y1F+dRZ8g+Gulcg+fuouJy7bsdp78c+wCa1NJULbnhwaIJr41/XSVDDz0VRByegz
         GPuwFYf5q4VbocMB+uX6slZmOa2AB/ceQ+MxV21JKC3Uhg3e8Zer8PTXc9RZAdBl3dIy
         KpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSsBX21NVNiSwRS2p6EfLvoeuH1E+LW1LIdRNsY4vkU=;
        b=zjiuTriWu1EOpoI9ZlC6G2ofy03+ik3z5c1z9CEjQL92EuL50rD7OwVt2WH1hxlyni
         UC+epsw0O1cW8z20NFNIXuUwE58S9RBZBUi2K7EDrHeGZV338l21VlgVP9T5Q/qnuRBP
         LZcSjgMghPsWRVMXuliIc9jXRE/nvSKzhanVUboEATaJoC8qc+51WOmXm+6/MKnKtkDX
         HSbnwfgD+8a9gZEaXqMZ22neoZpDsp+6OMo7gwGdRWiDjFziJebSixvFmwn8L3LdLLp/
         6BoxWSX8EejtPGx6eNCJAx4qXxDMRRlfjeb3k4SSPlzkh7Nad1n6WcAkHXJDllBeQIaQ
         ne/w==
X-Gm-Message-State: AOAM531di3EAeGcMOEqfenNperTy0n3JSIfDYiTuufD+lJW8I93vPbri
        L+4iXS/yAhhW5fIChL0KeLlUfiANY3Wmj0Q9j6/Vwg==
X-Google-Smtp-Source: ABdhPJxo6UiX3Xn1XQ6J/2PJeWZvf7DQmneQL+F9WZaIYeAoXL24XAGZpq5ExpvtMoKAaF7w482xqTsYXr7VK3rTP1A=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr18944909qvv.115.1646177045898; Tue, 01
 Mar 2022 15:24:05 -0800 (PST)
MIME-Version: 1.0
References: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org>
 <1644852547-10067-2-git-send-email-loic.poulain@linaro.org> <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
In-Reply-To: <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Mar 2022 02:23:54 +0300
Message-ID: <CAA8EJprnALcK8HObkNqkgW6t4gpLHf9LuS1-mEHJJqt6va=zxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: msm: disp: add yaml schemas for
 QCM2290 DPU bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 1 Mar 2022 at 20:35, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Feb 14, 2022 at 9:29 AM Loic Poulain <loic.poulain@linaro.org> wrote:
> >
> > QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> > like DPU display controller, DSI etc. Add YAML schema for DPU device
> > tree bindings
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: no change
> >  v3: no change (resent with reviewed-by + freedreno list)
> >
> >  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
>
> This is now failing in linux-next. Please fix or revert:

I can not reproduce it here, with the linux-next from 20220301 and
dtschema 2022.1

>
> Error: Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dts:81.3-82.1
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml]
> Error 1
>
> Rob



-- 
With best wishes
Dmitry
