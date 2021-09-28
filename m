Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D256D41BA96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 00:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243104AbhI1W4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 18:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243098AbhI1W4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 18:56:41 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E119C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 15:55:01 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id e16-20020a4ad250000000b002b5e1f1bc78so142647oos.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 15:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yf5AC4a9WzHG3UtpDr26xh38u+uwuy7Wr7B2Drr7Now=;
        b=bAtG2u74FnXlAGMw7JTpyUrnLriVVudX8RP8Oq65oacE6V85xxSTn9jiFud1EHnVOe
         N+ON29kYyLZ9Uj9X+AUWlxMoNUFODYCM0rPleF5lTG1zh2/Y0PkmIP8+1EPaJTLdHVfs
         e4RgnfbniYaIgdHzI/wnxW35AbuP6qt8bzY8bqyAfdtl7i0LIrmJ8RVvzDUB8l7Wydbv
         Z9sdMSwcgte5aUHRT1S1XNOGpA+2giNe98Y0ulI41fKIZTssOc4bq5Kj4CWBs1OmkyXZ
         eItbYjk8E2FFV3QV1avFc1Z2EBwtLERdgjclkobTHooWDeUBZIx+nsnKO2sR2kFaizYa
         7aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yf5AC4a9WzHG3UtpDr26xh38u+uwuy7Wr7B2Drr7Now=;
        b=b3njAApoJsG3RzOXOFkgfJdib4NW3ukvE0B+nvTEu2B+PK3Fjei3uRc1DRqAKxs822
         OW0gCvil01F1v8+BQRkUaK4nYyN7XdGuUfKabXTEtFYUSVbC9/AoKoK1HXfV8sQbMF6x
         oJ7s69wYqmOuSnN6cC1mvrvk4ISha5rGC7lUaGoaEKGoCp0m1mBuq6xPx/JqTMRn88xi
         IMMaUi3x8KrMd/RTqR9wFDkDKWH7cOPejW7dX+3BCDwYoYzua9/SCUB6/8I6dZV2u/Ua
         rU35a7Kxa64jJCNtG9ED0rN8GETxj+OacMrgIvuZA0FeoDUOFg5zqpCYVS3CZ569mr2c
         zp9w==
X-Gm-Message-State: AOAM531ywI0CMumDE7JKBVBcruvo3IwCZwm+hUPRyHwS8iGYYyLu4hyf
        WrEw7g+VLWEk+F/ajfO9VQ7w9wFC2Jf26A==
X-Google-Smtp-Source: ABdhPJxWwOVeRrzfb9PJ5n8KOc3wEM2tVA5wewGnMYxH/0j4wWUhqUG7g3G9Vw4uD+G5jGKoYt8GhA==
X-Received: by 2002:a4a:b58a:: with SMTP id t10mr7121650ooo.35.1632869700453;
        Tue, 28 Sep 2021 15:55:00 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k15sm79155ooh.41.2021.09.28.15.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 15:54:59 -0700 (PDT)
Date:   Tue, 28 Sep 2021 15:55:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        kernel@gpiccoli.net
Subject: Re: [PATCH] arm64: dts: qcom: db820c: Improve regulator voltage
 range and mark it as always-on
Message-ID: <YVOdZYM/VsmA+vXR@ripper>
References: <20210927163745.2066610-1-gpiccoli@igalia.com>
 <YVKFeqpe/sWj3h6K@builder.lan>
 <77a76065-d797-b59d-5570-d1b9606b79fb@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a76065-d797-b59d-5570-d1b9606b79fb@igalia.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Sep 14:54 PDT 2021, Guilherme G. Piccoli wrote:

> Bjorn, first of all, thanks a *lot* for your great/informative response!
> Much appreciated =)
> 
> I'll respond more inline, below:
> 
> 
> On 28/09/2021 00:01, Bjorn Andersson wrote:
> > 
> > The regulator range described in the datasheet and in the regulator
> > driver defines what the PMIC can do, the dts refines this to a range
> > that it suitable for this particular board. So it's expected to be more
> > narrow.
> > 
> > The problem with vdd_gfx is that we don't have anything voting for an
> > actual voltage, so you will either continue to run with whatever voltage
> > we got from the power-on state (or bootloader), or
> > regulator-min-microvolt. Until someone could come up with this support
> > 0.98V seems to have been picked as some good enough number...
> > 
> > 
> > The right thing would be to ensure that the voltage is scaled with the
> > GPU clock, presumably with some reference from gpu_opp_table. This can
> > perhaps be done using static voltages, but should in the long run be
> > done by votes against the performance states exposed by the CPR block
> > attached to the vdd_gfx - which will then ensure that the voltage level
> > is adjusted as needed on a per-device basis.
> > 
> 
> Very interesting...thanks for the details. Just confirming: CPR is Core
> Power Reduction, right?
> Found its (DTS) documentation at
> devicetree/bindings/power/avs/qcom,cpr.txt, I'll study more and also the
> driver counter-part.
> 

I expect that we should be able to add MSM8996 support on top of:
https://lore.kernel.org/linux-arm-msm/20210901155735.629282-1-angelogioacchino.delregno@somainline.org/

> 
> >> More than that, my experiment showed that this regulator must be set to
> >> always-on - this idea came from a commit in Linaro's tree, from Rajendra [2].
> > 
> > The regulator should be enabled whenever someone is voting for the
> > GPU_GX_GDSC power domain of mmcc. Question is why this isn't enough.
> > 
> 
> This is very interesting, I'll investigate more! I just tested and
> indeed, without that setting, the board reboots suddenly.
> 
> 
> >> With the voltage range updated plus set as always-on, the GPU is working
> >> correctly, in a stable fashion.
> >>
> > 
> > Could you perhaps check /sys/kernel/debug/regulator/regulator_summary to
> > see the voltage level you get for your VDD_GFX when it works?
> > 
> 
> Sure! This is the output:
> 
> VDD_GFX  1    1      0    fast  1000mV     0mA   350mV  1350mV
>    8c0000.clock-controller-vdd-gfx   0 0mA     0mV     0mV
> 
> So, 1000mV is enough it seems.
> 

980mV is quite close to 1000mV, but I guess if 1V is just barely enough
then 980mV might be too much.

> 
> > [...]
> > 
> > No need to apologize, the patch itself looks really good and nice to see
> > that you tested it on both v5.14 and linux-next!
> > 
> 
> Thank you =)
> 
> >>
> > status = "okay" is the default value, so unless you want to disable a
> > node in the dtsi by default, or override it to "okay" when it was
> > previously disabled, there's no need to provide "status" here.
> > 
> >> +
> > 
> > And this empty line is undesirable.
> > 
> > 
> > So to summarize, I do think there might be cases where your patch
> > lowers the GPU voltage from 0.98V to 0.35V, which would result in a sad
> > outcome. I think we should try to plug some voltages into gpu_opp_table,
> > but perhaps we need to look into CPR to figure out what those voltages
> > should be?
> > 
> 
> OK cool, removed the okay status, worked fine as you suggested.
> 
> Now, regarding this approach of plugging the voltages on gpu_opp, I can
> study more and try to come up with something. But it'll take some days
> at least - for now, do you think that'd be interesting to adjust the
> regulator voltage with min == 980mV and max == 1000mV? I tried here, and
> it worked!
> 

I don't know where 980mV comes from, so I don't know if 1V would be good
enough or if it just happens to work today.

I think if we could figure out how to wire up the gpu_opp_table to scale
the voltage, even statically (without CPR), that would be a good next
step.

Regards,
Bjorn

> Let me know your thoughts!
> Cheers,
> 
> 
> Guilherme
