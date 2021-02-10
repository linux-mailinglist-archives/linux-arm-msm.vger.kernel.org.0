Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9903316A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 16:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhBJPfB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 10:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbhBJPe4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 10:34:56 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C455CC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 07:34:15 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id l3so2453767oii.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 07:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MXfRWUyZgepnR1r9PiUciTWov6CyYOp3E5FTbZ1uEAI=;
        b=OD6sTezXJduV7aURsFKIT2HZzDpUk5VFc67uLHqepYSHolZZ1YuStVhW1/fybfZEZv
         tIsSfRtFPLbiKjAAFHRvJ8PWTZLm1vtXrcbGetgL2X/QGn0Dp6K9uEXnjzNabrfV1Qe/
         8MJMvoTl40NyTb2dHD5bTNWUMSMzzckyE0T0YfRLQqTtVKIzjQaaMsbwkZLXt3iU7cqm
         AkcPfqOngj+nUSNkovcogTGJErAaucfs8lO4bS2NwPr8Hr9duqZY27mhvzylH26Nkj/U
         w5vBvnpbv++1PnZgg/fjp0GC80Zms5z6E0vDOi8MvojQTpsQdTUvuyb0F64lsJQcXvrs
         w9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MXfRWUyZgepnR1r9PiUciTWov6CyYOp3E5FTbZ1uEAI=;
        b=Lv5kkYDZPeM2kdSC8vYs3HfM3ekA+XNh6DbaTrytM4sSXBHJb3NZnb/Yzb5e8lXGFA
         2cAbrStzwvFdA4Iq4bgXRqEkuPWGtfIrZSpmYWEywv0t4Jbe0E4CiNItXPUg/ev3CetA
         Dj2Iqus4Ki0S98JKbduX0gJ2b7uUSCK+baTDILVqr4aKk0uYQLOacExNIWsrqhWmYaw0
         ProzD10ZdsaGm0cyGtpZRHtI2w5uGEih9ScfiMb+xPqr52c6nnykK+gJOCYlxrbKDcyU
         lGzyuprLrrnQ/pd7MTn7Kp489N3pPn0HuXAKERrh8ePeHLRBeBvl3Dv7iaLZ/nBkvoiP
         L65w==
X-Gm-Message-State: AOAM533aED95YsYUHalXH6/WylbiZs7HGd7re8dD9iPexzoQzFPwEhfR
        O+l+sQdEYE8x5fuZVck4S3rAJg==
X-Google-Smtp-Source: ABdhPJzIu4CrcctLfb2pimzGY/4u4NROvKWd9VwI38sYOAkzkepQnlLSmhNWrUMVw8wMMYbChZYqsA==
X-Received: by 2002:aca:3b06:: with SMTP id i6mr2455073oia.81.1612971255169;
        Wed, 10 Feb 2021 07:34:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k32sm436045otc.74.2021.02.10.07.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 07:34:14 -0800 (PST)
Date:   Wed, 10 Feb 2021 09:34:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sm8250: split spi pinctrl config
Message-ID: <YCP89ODkUCLYg1Tj@builder.lan>
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
 <20210209202849.1148569-2-dmitry.baryshkov@linaro.org>
 <CAD=FV=WHfro-egVV7HH0ZC-1Q_jR2uN+Y0wXGEHXkt8Xjvwz-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WHfro-egVV7HH0ZC-1Q_jR2uN+Y0wXGEHXkt8Xjvwz-w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Feb 17:57 CST 2021, Doug Anderson wrote:

> Hi,
> 
> On Tue, Feb 9, 2021 at 12:29 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > As discussed on linux-arm-msm list, start splitting sm8250 pinctrl
> > settings into generic and board-specific parts. The first part to
> > receive such treatment is the spi, so split spi pinconf to the board
> > device tree.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |   5 +
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi     | 300 +++++------------------
> >  2 files changed, 65 insertions(+), 240 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > index 2f0528d01299..787da8ccba54 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > @@ -815,6 +815,11 @@ &pm8150_rtc {
> >         status = "okay";
> >  };
> >
> > +&qup_spi0_default {
> > +       drive-strength = <6>;
> > +       bias-disable;
> > +};
> > +
> 
> Optional nit that I personally prefer that all of the pinctrl stuff be
> grouped together (with separate sorting) at the bottom of board device
> tree files.  To me it's weird to mix them with peripheral enables.
> 

I share this preference, but let's figure out how to document these
"guidelines" and take that as a separate change.

Regards,
Bjorn

> Reviewed-by: Douglas Anderson <dianders@chromium.org>
