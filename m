Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44956591344
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 17:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238720AbiHLPrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 11:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238686AbiHLPrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 11:47:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A188F95B
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 08:47:21 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id v3so1657131wrp.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=tpWip+BFdiEPdXC3B+X45lAS8MneZCGG5pkBJArRpus=;
        b=xFGfqPcq9RVhU91fTWEd+DpL83es+Dnx0kntT1mCYTa32SsJz5/porK8jskHO6fH1J
         rWVoLhz5B2+PDedAAbDsy+NugYq0qrqZrspnOUlvOqk6ps0LHP4UBi2Q6z1wVU19kV0A
         oCKogJ2WpohEI3f7A3izCjNH9/gTqqrEyG343Zclp7SrKvFxH6J2ilN/hpv7fNGLXDwv
         rCuI+h2tPFwynK/OQVVTVzxOXR3BnvFFmWcxDaTNXXO52GlhGPKqRN/0GBahwCK4bZXW
         Psp+r/cgT5kS9cpi/gv+5Bj9GMTgglG1tVK/HFdkxdAWnd5whxorzhIMUfnbleCLnlFh
         FHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=tpWip+BFdiEPdXC3B+X45lAS8MneZCGG5pkBJArRpus=;
        b=oZ0cWF8hsx2rPHCx1irmYxvhsdykY05NNnyCO16ktYo/mKYpX69tPgNcZn06OoEka5
         ZJbaVhFMnXvpmo6o2P4+CUdaIZ9WMfGFXMYwxv0cmAxq03JQ5ZtS18p/1gPVengt3rlM
         HBOxJf1UrGLcDr91e1Uh9A3omPJD+1eHEwUR043QCba8zinUNRRFHDnmheqZoTY+S1nu
         6iOxktiFuFAYCIj/1LlZMmWv8i6m05siZt1rCrO74GXDydaGsACh+uC3qpwFIzqKK1ev
         uBNAoXi2SbE5idLqGvQZAJSUj+IuuOdtaHnU9RuHFFN3RxTZzqE/u3NSIvgveQiLyhmD
         o1MQ==
X-Gm-Message-State: ACgBeo2l5mVwSpXtPQNm63Se/KebtA5zi4zN30gPChV7Zpcp1ugrcEG2
        m3xJL1wCvUDpghir9enRige5vg==
X-Google-Smtp-Source: AA6agR4WjhFzt4zhlKIdp0fiVZeF8Xua9VvxXyKi1X6mhoFMFcyL6Prj0NF3HtHYXyY5aIlVGfQ46w==
X-Received: by 2002:a05:6000:114b:b0:220:5ff2:b9dc with SMTP id d11-20020a056000114b00b002205ff2b9dcmr2567505wrx.297.1660319240022;
        Fri, 12 Aug 2022 08:47:20 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q15-20020adff94f000000b002238ea5750csm2854309wrr.72.2022.08.12.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 08:47:19 -0700 (PDT)
Date:   Fri, 12 Aug 2022 18:47:18 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFC] PM: domains: Reverse the order of performance and enabling
 ops
Message-ID: <YvZ2Bl3fg/pdMVVw@linaro.org>
References: <20220720110246.762939-1-abel.vesa@linaro.org>
 <CAPDyKFoh8UV=QC6RhOkc=FSvoeqF_UiWp97h0Qp8dniB=sS+8A@mail.gmail.com>
 <YuA0luCtQ1J+ExBi@linaro.org>
 <CAPDyKFo4tryzYQK=q6aPGxocmoq=duC2B1RMh1QoV_maVCApjA@mail.gmail.com>
 <20220729094646.xqlhfjzxo3gk4n27@linaro.org>
 <1355f1f6-d6c9-6d5f-9b5f-333084c6561b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1355f1f6-d6c9-6d5f-9b5f-333084c6561b@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-08-04 23:58:34, Dmitry Osipenko wrote:
> 29.07.2022 12:46, Abel Vesa пишет:
> >> I have looped in Dmitry and Thierry to see if they think the change
> >> should be fine for Tegra platforms too.
> >>
> > Good. But the tegra usecase uses only the ->set_performance and does not
> > use ->power_on and ->power_off for that specific PD. So I don't think
> > their usecase will be affected by the order reverse.
> > 
> 
> For Tegra it indeed shouldn't change anything.

Thanks Dmitry for confirming.
