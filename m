Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054696D464E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 15:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbjDCN5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 09:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbjDCN5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 09:57:08 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AD935BB
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 06:57:00 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id cf7so34865107ybb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680530219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kODDV0eo3KG9JXNPcuqS6MOsNNtWM4OP9fbwHqcpwiQ=;
        b=xHUjq7ju37k6tq0qw/NJnEhO/E0QYa4VXV7FpPEvNXjrW6cFMfFxcxvNo/PyZ7/lyH
         8ezNFxusnuEhdlyfG7gSaAs7fnih9cOr+oykAdwJizv3gr+oz7QvquI01cF6MV31EHtm
         pbsIypIYfeUTpRUCTEI5aldkZXJBsO0Hw8qvvye8H5IyEFFWGRgO7aDIuZ3UeiSoD5Uk
         b/kQwkZ8Bz3WT2+7gBcapCpzQh5WH2NpaS9u4bb4B1rUpdwgBCPORp9ZWueW5TCzUhSC
         XvTLsfy/OJAEDkRndDEd5ehqBMyNW9UAYbAsTbJKAf2mkrnduhxq9q3CRpiPvLt5T0Jp
         nyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680530219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kODDV0eo3KG9JXNPcuqS6MOsNNtWM4OP9fbwHqcpwiQ=;
        b=Te/D//nhciJPeLo9Pvay+fm5T9d/2A8aE5NZm8Pwaobw3/mnb1krEsncu3R4gar4iK
         /BaLEbeQRHU2VknhR/u6csZpG4y1QR3iRD887mL/clGmXfvBNy9jhHXqTGLdDTBQ4L8z
         KuwY79ri+XdWfJhLgFvF2RsVCrpWQVWvMDF8r//Ivpp2HtAf+/hwGywaaLuxXRPl2gKT
         ndAbzh5hw12WI406Hn6Eo3CGYxxsIH4Dl/pUkiXYz6Bhu2SJWCPmBQakHZsk85mnparu
         d0SVsl+MzsBMDY7CI2M59TgN2Jj8tfUJflarVvY+oD65dru8S+yqoas0+KPmhxhY3yCw
         +wBQ==
X-Gm-Message-State: AAQBX9dly0PoC1DNXu8/otWnYe+PxrUP8BDIZvw7or9uzwrgNaAYFSSk
        wooKK32cWTFKJn1ziyz8BqhKndKsR4pa59Oi9dqYJA==
X-Google-Smtp-Source: AKy350a+6yKOvU2Vx0VJFi9PvEVqKu2yKBdZt9WnARJ7DiP1tc2RnQX+840XSZBpIbNH93jnzswOJLu2PkbS20/tOYw=
X-Received: by 2002:a25:3104:0:b0:b86:92c0:6433 with SMTP id
 x4-20020a253104000000b00b8692c06433mr3281190ybx.9.1680530219692; Mon, 03 Apr
 2023 06:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
 <20230401220810.3563708-22-dmitry.baryshkov@linaro.org> <af18b9a3-2960-8fbb-0d19-ee7d3b3f89ab@linaro.org>
 <b33337de-1a09-aa72-7f1f-fabf85ddcd9d@linaro.org> <CAA8EJprnv0uqEq=uJ8z+Az-izwk-kscXiELVqrP9BPBFQpJE4A@mail.gmail.com>
 <46658cbb-fff5-e98b-fdad-88fa683a9c75@linaro.org>
In-Reply-To: <46658cbb-fff5-e98b-fdad-88fa683a9c75@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 3 Apr 2023 16:56:48 +0300
Message-ID: <CAA8EJpp+YP8aHzm33qXp=cb0iaFGuKgnrUo27dOKuBU0R1GSYg@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] arch: arm64: dts: qcom: pm8150: support SID
 greater that 9
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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

On Mon, 3 Apr 2023 at 15:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/04/2023 13:45, Dmitry Baryshkov wrote:
> >> Konrad
> >>>> +
> >>>>  #undef PMIC_SID
> >>>>  #undef PMIC_SID1
> >>>>  #undef PMIC_LABEL
> >>>
> >>> Same comment as for previous patches - all undefs must be gone.
> >
> > This means that we can not include two copies of the same PMIC (which
> > do have on both platforms).
>
> Consider spi15 and spi16:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sm8250.dtsi?h=v6.3-rc5&id=7e364e56293bb98cae1b55fd835f5991c4e96e7d#n1045
>
> Do you see it written as #include "qcom-sm8250-spi.dtsi" with
> parametrizing the reg/unit address, interrupts etc?
>
> No. Neither PMIC should be. It is not a special device.

I think there should be balance. PMICs are complex structures.
Possibly schema will help here once it is in a more enforced mode.


-- 
With best wishes
Dmitry
