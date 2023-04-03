Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C976D43C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 13:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbjDCLpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 07:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbjDCLpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 07:45:40 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549E01FF1
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 04:45:39 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-536af432ee5so546901767b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 04:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680522338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uGxargPxeRdnNwy0FwVLw41erxiwEyqlu4LT7E6akLc=;
        b=IXNqHfXlLzrRxOSf535TQir890GxL9oUCWY2gmSYTt1GKuKwb2OysuPVZl92sT8epf
         /iTv/iPYu4oOQA1Sb48Xm9whf5Z3tO2/zkjkV5rlIJQ6ZmpMoZkBP8DmlAzvmSWmFg16
         +BquKCm1SbzxJ+MFG0WDSfXU438RgmZMf3VBeWbaypmAkB3ePxhn1VCs7RKZsd90r8ho
         L6y0JRiD1DJ0C3dRCgZndETwqJ/D2PYrgL/+gSIgqrqzFWMdOt0Q2x9iX6jkaO7LKCTp
         WmwQi4aK8LXss9LO/ZYem4Qp70SbcpRL/4O+w/G6mfDegOO/+hdjgOpn98d0LeAAHgaM
         IThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680522338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGxargPxeRdnNwy0FwVLw41erxiwEyqlu4LT7E6akLc=;
        b=rxL6gy/tPXIth4KGusohPCEzuT8ULA48gwfKZqhL081aZuqgZ6CHgaRBWcW6Sy+Cz0
         RvF7RUka0BluBSVE/uxFm+ms3y1p+wNTSttCIExSbQXnJeHlk2qukeNwv9rCSQfZDNmI
         I0s5A1DhBRfzRu4JtztEIp2W7Ut1Pd3XdRfEd8N99lApLPNHHEsDi56uQ5OabrYvg7qo
         fBY+f/7gDJ1unjWr/5VNYjKZr68/F0y+qK/rbNlPS+O89PRVCn8Sv5jWXtW6gPAIFpo/
         FUlA9kTLgqlkaATc9g3IRguJznJMs5pdY2eAUelnz9MyybIyO1dtBz7TBtRXDBAEhI9o
         9Yrg==
X-Gm-Message-State: AAQBX9fQzx8xao0sz2cJIr0uWXa6TkeDsbkr//mqAczbjEOL+166HmhH
        XLrczjUo4zt0a73V4gXvK9EnPqwFss8yj36/257eqQ==
X-Google-Smtp-Source: AKy350Y8KrnH8NZ4U0QVcuLXlkgCDbdNpAcwqaYCcnGW+ubyRUomfWChMMT03cttsY72nIzYs0Ftm9s2rhd9IbGpCfU=
X-Received: by 2002:a81:441e:0:b0:546:3252:385d with SMTP id
 r30-20020a81441e000000b005463252385dmr8828689ywa.5.1680522338473; Mon, 03 Apr
 2023 04:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
 <20230401220810.3563708-22-dmitry.baryshkov@linaro.org> <af18b9a3-2960-8fbb-0d19-ee7d3b3f89ab@linaro.org>
 <b33337de-1a09-aa72-7f1f-fabf85ddcd9d@linaro.org>
In-Reply-To: <b33337de-1a09-aa72-7f1f-fabf85ddcd9d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 3 Apr 2023 14:45:27 +0300
Message-ID: <CAA8EJprnv0uqEq=uJ8z+Az-izwk-kscXiELVqrP9BPBFQpJE4A@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] arch: arm64: dts: qcom: pm8150: support SID
 greater that 9
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 3 Apr 2023 at 13:35, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 2.04.2023 11:51, Krzysztof Kozlowski wrote:
> > On 02/04/2023 00:08, Dmitry Baryshkov wrote:
> >> Supporting SIDs greater than 9 required additional handling in order to
> >> properly generatae hex values. Apply this customization to pm8150.dtsi.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>  arch/arm64/boot/dts/qcom/pm8150.dtsi          | 16 ++++++++--------
> >>  arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi |  6 ++++++
> >>  arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi |  6 ++++++
> >>  3 files changed, 20 insertions(+), 8 deletions(-)
> >>
> >
> >> diff --git a/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi b/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
> >> index 83a2bada48ff..f3743ef3aa13 100644
> >> --- a/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
> >> @@ -11,6 +11,12 @@
> >>
> >>  #undef NODE
> >>
> >> +#undef HEX
> >> +#undef _HEX
> >> +
> >> +#undef PMIC_SID_HEX
> >> +#undef PMIC_SID1_HEX
> All decimal numbers can be represented as hex numbers..
> Is there any point to keeping them separate?

Yes, to have pmic@c rather than pmic@12 for USID = 12 = 0xc.

>
> Konrad
> >> +
> >>  #undef PMIC_SID
> >>  #undef PMIC_SID1
> >>  #undef PMIC_LABEL
> >
> > Same comment as for previous patches - all undefs must be gone.

This means that we can not include two copies of the same PMIC (which
do have on both platforms).

> >
> > Maybe I should not have acked all these changes customized SID ("include
> > sid into defines") because it looks like it opened can of worms.

I think this can of worms is still better than imperfect duplication.


-- 
With best wishes
Dmitry
