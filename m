Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82975F37D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 23:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiJCVd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 17:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiJCVdB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 17:33:01 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D995A2C3
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 14:28:16 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id j7so14610408ybb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=P7mjKGtMyc8QawunwNOx/A+TWkA77AQ+DO5P8txIJ90=;
        b=aSJDF7n+TRMIJMAaOW5TszpIiy8U/gx5tCIza5mQbhBNWTRKKb3uX6gXbhMe52NS2o
         U0JVrHCCRN3GPmMhkUqTHlqgic3M1stTJUOsfnqd9fQdO70+gIap9tYU64boLYh69QDc
         Kx8hSKcKZoQkKtdzDBgD3Lihd1qf8yiOrg+pOXIPV8SonPKL1Tsb+K7mBPvFcHHK4782
         A82iETH4uivtKeOkmtq3NGEMBlEAAlAAA7r6pVZnEibgqXOBgghfWjlKhAxCP91ayR/2
         Dcw2px61IfgXldxOWpaeeI2RJEueFU5Yp236BnN7erQb8YwFUWJerAlVh9djUqzsDO4M
         7bOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=P7mjKGtMyc8QawunwNOx/A+TWkA77AQ+DO5P8txIJ90=;
        b=iPKH5s0UYLvsWEDs9ezXGcY68OdwlZUa2GPKiaeeIIyrgw5UmM4hVKiSZFZatmz5FM
         1bpL8uamtR9iMf74EG6xVQKRL0tG43ZqYNvz7i0kGoUxbyEgkBEASXSKB8y6szOVW2fl
         JyQqn0zTiy3OOiJlG0cwsxdi0QXx2blmhxctGhaDo6XfOs8nhZGG6wTDaP3yOWf+y+lN
         rTQkkhPWkciifmTKAbJxAPecEwGKcsDo0YegNhDJ635IvNW6dFsF3mpS97AZdH1FYz0I
         BwVOj1J4xkh+XH93tbfg3Phjzepjy88TUExO6h6GdPt1xpdkOUKKzNSxlubbLXSgJpsL
         mQPA==
X-Gm-Message-State: ACrzQf3zGia4O6sVM11LzymH3K23SY26xDEulM7KeNu7F4DcyStUCgJI
        X85sVQfZskBzu+SyuPTNhCdW7L8aceOr6mpkyJr4kQ==
X-Google-Smtp-Source: AMsMyM4+WxrW8hJRzq2wDvB2clRV2zMS0NN/gRQOtDuK/4njBtSNHxXn7I3cZF9EUn4l24J8n20r3hzxvvF74STaXrI=
X-Received: by 2002:a25:af13:0:b0:6ae:3166:1aee with SMTP id
 a19-20020a25af13000000b006ae31661aeemr21805283ybh.288.1664832495123; Mon, 03
 Oct 2022 14:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
 <d1a26c97-75db-5d09-4c4f-77ed4fed1683@linaro.org> <CAA8EJpoUtfWFR315jiC8PzPQydM9kT3kQYeqyOav-P9=qZKO2w@mail.gmail.com>
 <4658c7bc-b26f-d22b-73ea-9deb7d29f90f@linaro.org> <20221003171714.GA2462016-robh@kernel.org>
 <c1e79572-e5d0-079f-76db-c9e8d4edbcd3@linaro.org>
In-Reply-To: <c1e79572-e5d0-079f-76db-c9e8d4edbcd3@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Oct 2022 00:28:04 +0300
Message-ID: <CAA8EJpo6J4kTh6UFXM2jBNbwoxqdUY3TrP8y=S5ONucr+3qZ=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 3 Oct 2022 at 20:32, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/10/2022 19:17, Rob Herring wrote:
> > On Mon, Oct 03, 2022 at 08:46:09AM +0200, Krzysztof Kozlowski wrote:
> >> On 02/10/2022 15:46, Dmitry Baryshkov wrote:
> >>>>> +    enum:
> >>>>> +      - ssbi
> >>>>> +      - ssbi2
> >>>>> +      - pmic-arbiter
> >>>>> +
> >>>>> +  pmic:
> >>>>> +    type: object
> >>>>
> >>>> This is quite unspecific... Can we make it a ref to some PMICs schemas?
> >>>
> >>> Yes, I thought about listing all compats, but probably a $ref:
> >>> ../mfd/qcom-pm8xxx.yaml# makes more sense.
> >>
> >> Then full path - /schemas/mfd/qcom-....
> >
> > While effectively it's always a QCom PMIC, this is a bus binding, so
> > shouldn't it just be 'additionalProperties: { type: object }' without
> > any reference to the type of device?
>
> If we treat it as generic bus, then maybe also "pmic" is not
> appropriate. What if other devices are connected?

It's a 1:1 bus, so SSBI host can be connected to a single IC. This bus
is not used in new designs (it got replaced with SPMI). All existing
devices use SSBI to connect to PMIC. So I think it is safe to assume
that the only ssbi child is a PMIC.

>
> Bindings were saying it is Qualcomm SoC specific bus, so I don't think
> we can have here anything else than Qualcomm PMIC.
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry
