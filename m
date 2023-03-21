Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6824F6C2A7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 07:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjCUGfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 02:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjCUGfG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 02:35:06 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200AAE181
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 23:34:58 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso279188wmo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679380496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aeU98+5k4UNo0IIDP5TmbAbzIZvq5NwXU7mw30mcFh4=;
        b=my2o52HZ/sptlkDCPPrA12lnhy9kS2Xor6aihSPfCLGPAGYWnbaq5wsjIxLFRrx0Pb
         1VwwZQmHVeIj8h/l3dJ+WtznDT6vtKV9Z7SgFiboHZ0MHkQxnWHInQlme3CkswRXZ8LT
         39a/jWfDqoK4XjlyVVv2XnRL4BJLIM9OjhXrLFRsJSDuKWPYMfZkICKrhCPvJ3X9XyGZ
         Jm6VR/WURvQKeHHy4IfIOidTpGijPOqS2FYmkcqchrw3fxHn33FyWnK4lQ9DygAIU7c/
         eJbmffZoXUMSM+n0bbxErHrPoxcIOdeKQOKgyx1PieCXB0yxMmOLTHOeSjHwQmq05GoQ
         vX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeU98+5k4UNo0IIDP5TmbAbzIZvq5NwXU7mw30mcFh4=;
        b=HQFrbZaQru7VI/BeGQkA7KSL5PrR69SCBZcKVNxKIbFAn4p1DoPbjR7q+4iMH87TkS
         pEJqWWIWOxXipOUVxqnH9V7rs0CC0OFwKCOO8gignMaPO/DHbvM3h/STgM7Nplm36EjP
         vTi4dPhQps4AMIy+jc6Ik8r38M0SBsFZPeL5Aa8GZ+BuZ1aRRfCc3JPDycyWVSUz5Vf4
         A1aYglh5lLSmvNnqbcpxKI22P0RoHs2wpy8Gvtsp9HIzqZ42UKlLK+olQJxWTzoikGiD
         33vClswJ13hsocc25qT+SeW7Oq0DozlB2G2u7E55HluV3XKdanXm6Ga6AU/Nltdbqh9q
         eIXw==
X-Gm-Message-State: AO0yUKV6SZg9DYPi9XcOJ2WqmslczrmJQFedZ8ewZ5WaIZor+66igldV
        aLpfr29gVFXsm4CRiU7tbeenkuHhFxcmT0KlTPcFYw==
X-Google-Smtp-Source: AK7set+MTESzG510vY+KY7o33JEhtbA90pqbzZCqd1mGorBUpd1yfT2SUq/gLkeSmm1CWVVo0WzGsrlZxkxO34q3690=
X-Received: by 2002:a7b:c444:0:b0:3ed:779c:4063 with SMTP id
 l4-20020a7bc444000000b003ed779c4063mr453053wmi.8.1679380496252; Mon, 20 Mar
 2023 23:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230320071211.3005769-1-bhupesh.sharma@linaro.org>
 <20230320071211.3005769-2-bhupesh.sharma@linaro.org> <0a8fcd57-94dc-61e6-0ba0-b1591e05e6f2@linaro.org>
In-Reply-To: <0a8fcd57-94dc-61e6-0ba0-b1591e05e6f2@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 21 Mar 2023 12:04:45 +0530
Message-ID: <CAH=2Ntxj6RyEtrxCZmg6gKR_RSxX-wnkoEqjQ9CGQXM0zuATKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmaengine: qcom: bam_dma: Add support for BAM engine v1.7.4
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, vkoul@kernel.org,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Mar 2023 at 16:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 20.03.2023 08:12, Bhupesh Sharma wrote:
> > Qualcomm SoCs SM6115 and  QRB2290 support BAM engine version
> > v1.7.4.
> >
> > Add the support for the same in driver. Since the reg info of
> > this version is similar to version v1.7.0, so reuse the same.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  drivers/dma/qcom/bam_dma.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > index 1e47d27e1f81..153d189de7d2 100644
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> > @@ -1228,6 +1228,7 @@ static const struct of_device_id bam_of_match[] = {
> >       { .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
> >       { .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
> >       { .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
> > +     { .compatible = "qcom,bam-v1.7.4", .data = &bam_v1_7_reg_info },
> The compatible is meaningless as of today (it uses the exact same driver
> data as v1.7.0), so I'd say going with:
>
> compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>
> is what we want.

Ok, will send a v2.

Thanks.
