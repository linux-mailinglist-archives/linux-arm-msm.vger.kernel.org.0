Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CFD387B66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 16:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhEROlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 10:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbhEROlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 10:41:07 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EDFC06138D
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 07:39:49 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id z3so9955886oib.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zp3it5Zu0KA9JHtt+jDEOh0cwWAwW8S1nVYQo9cUI6g=;
        b=M+LBCcMHMPB69ojN8igqTaiE33ZRMpEcF1APy9OlgsLWEwTLhd++g9E5r/PdgPXEYk
         Sf+oWKImVvjttXeuquw1tqKq5sDT5hjJaJrr+UNwmVU4yyHWnKmjWyMw/MlpRuRujG3f
         OPz9XnatcZBy1chC6V/PUTr8885yi7PK0DlXuwh780MM5fxWeByS/rU5afx+k05h1jpm
         6Fcu7iuPNq3rkO4cA5dE3C1+aLyOA0g1mfkf0PgTpooOLOhwOnpmJucMbwAHPEXBoGUI
         M0YmbK1i3TawT2Kq/MdoI37cIF1l4xEwiO9riemaM2il88FrHe0Ly8xeiVsF219JVpb/
         6zcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zp3it5Zu0KA9JHtt+jDEOh0cwWAwW8S1nVYQo9cUI6g=;
        b=ZuzWWOrVNUUNcI7Jxw69uOWV2HP8+3dmXs3NVgpS+IgelFmcBs/vY9IiLYPmmHVs8y
         jmTQuN5dJGD3s57Ls7XFO8xihFzorkF4e4c2uSzkFVn47cMSDw+8p7SoNDDHeTdvWnfE
         2gffCRYB/uVHTkf5sMAXlTxg2LMB7FmJ6PJcu3xyk7cKguJKf9rS5OXRhSC3WYwtRa2L
         hjp/LvTGkaP9vrqJ+ZBW6K5tWr/yLc1tENIw8yPWIXASuzzoJSbb2cOanI1l+vnzEwt1
         Ju/Jk7DZTHwpk6UHT77t9hhAbUNzCf3W8k5odbPP+h03/e68q+pD5BvRkkGcIbQTXzzI
         mveg==
X-Gm-Message-State: AOAM533EGd7SaGMTC42xPTcj/PszCrvsvEb3FBvgsmD3fxvbYFl9V7BR
        qOthGv3DZxi1bvNtT1snhGDPynLmTKkuz1ZLeNnPHA==
X-Google-Smtp-Source: ABdhPJztinWXNYTl+kiATtOdsiKD/CaM/e4dVlbDyWrHV5TSscaWHVYcyb9gQYVDavq46dJM3FBF4Qd71vU3cs+rKMU=
X-Received: by 2002:a05:6808:f0b:: with SMTP id m11mr3641199oiw.12.1621348788489;
 Tue, 18 May 2021 07:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
 <20210505213731.538612-17-bhupesh.sharma@linaro.org> <d809f290-ed94-7e35-bc4d-bd695965fa04@linaro.org>
In-Reply-To: <d809f290-ed94-7e35-bc4d-bd695965fa04@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 18 May 2021 20:09:37 +0530
Message-ID: <CAH=2NtwS+WBbwbp1tftyMjOCWo9ORZfiZFRr+UNxKQLc9aUNcA@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] crypto: qce: Defer probe in case interconnect is
 not yet initialized
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thara,

On Mon, 10 May 2021 at 18:53, Thara Gopinath <thara.gopinath@linaro.org> wrote:
>
>
>
> On 5/5/21 5:37 PM, Bhupesh Sharma wrote:
> > On some Qualcomm parts the qce crypto driver needs the interconnect between
> > the crypto block and main memory to be initialized first before the crypto
> > registers can be accessed. So it makes sense to defer the qce crypto driver
> > probing in case the interconnect driver is not yet probed.
> >
> > This fixes the qce probe failure issues when both qce and
> > interconnect drivers are compiled as static part of the kernel.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   drivers/crypto/qce/core.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > index 3e742e9911fa..9915b184f780 100644
> > --- a/drivers/crypto/qce/core.c
> > +++ b/drivers/crypto/qce/core.c
> > @@ -222,6 +222,20 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >               return ret;
> >
> >       qce->mem_path = of_icc_get(qce->dev, "memory");
> > +
> > +     /* Check for NULL return path, which indicates
> > +      * interconnect API is disabled or the "interconnects"
> > +      * DT property is missing.
> > +      */
> > +     if (!qce->mem_path)
> > +             /* On some qcom parts, the qce crypto block needs interconnect
> > +              * paths to be configured before the registers can be accessed.
> > +              * Check here for the same.
> > +              */
> > +             if (!strcmp(of_id->compatible, "qcom,ipq6018-qce") ||
> > +                 !strcmp(of_id->compatible, "qcom,sdm845-qce"))
> > +                     return -EPROBE_DEFER;
> > +
>
> Hi Bhupesh,
>
> You don't need this here. of_icc_get returns -EPROBE_DEFER if the
> interconnect provider is not initialized yet.

Thanks for the review.

Yes, I finished testing all the possible combinations with qce, bam
dma and interconnect drivers compiled as modules v/s as static parts
of the kernel and we don't need this extra check for the interconnect
here. We should be fine with checking just the qce_dma_request()
return value and returning early in the qce probe() flow if no dma
channels are yet available from the bam dma driver.

I have made the changes in v3 and will post it for review shortly.

Regards,
Bhupesh
