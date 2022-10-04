Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C47605F4AA8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 23:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiJDVF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 17:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiJDVFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 17:05:24 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C44C67CBF
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 14:05:19 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id y205so3942397yby.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=LFbusFL82p6QahGy3NX4jAVtz3A0XmveDtr6G/KTqd0=;
        b=JkVbrqS1fCmbwyPOifxNkAE37DIVc3BHc6D8OO2GbfkFc6K+QHevzWx6hGWZlLrlFw
         /zCBm9AN0c45J6hpY43I+OBZhbnsgFzEiY7tV5QxdbGR2hBns3KAwSXsA6TbgOLdfV/p
         BpuWH4j2b2gTHtlvEnczc7jLw1AOWcOco9Dd1l6lYYPQG7wr0EPDAw16sXSMosZSYEEC
         XvYi7kR5wOIjPAs2B5QW4HIz/H0LCm/JgPesS7vL2iZjhy4AjrselOar60FngjA/NWbt
         SIer4n8n0sZbfoW89u0aZw35IkSGAUa2ebLFMJmTadWF28keloCVaWKnDZy4UxOoCLsA
         QoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LFbusFL82p6QahGy3NX4jAVtz3A0XmveDtr6G/KTqd0=;
        b=d7WgsNVwjR/iTPKrA1ZoMcFrbedAyBqZ90rLOrQbpItyqrc3f+H+55Pl4DExhAfLJ4
         S/OYu4Ja3VVKsCaisSjeWGktxA+zL1fF6HxFB7DwWkkvBgvjoGfaX7/tslyLIrNR4LrQ
         5psHGqstXwUYjzkQdYHNgEk6z+kLkxdVoKX9bQ1TFcIOIkGvR0bpf89q5yvMEQH2Y7CR
         CBnE04+fKaQVTOuSktVB3DvxhSRxC0AwuDUJD4johQj5FqKnQYdAaEG27/1yWCxHZQin
         hmuE8JJWIRl+9GpcC4uFJpkSkzIGKIZjWp9MqSRpijeuLixFB+R4xq79nZ6EvHkfqwJp
         qxIA==
X-Gm-Message-State: ACrzQf3z7QYPPbp0ty5reZZ6JEIucAB2gmawqAXOMU+t034c/uruRQUJ
        mlLLq3GN94+OMDPVD3ElmYyMPKPyp9id7kXbYM3Yqw==
X-Google-Smtp-Source: AMsMyM7RnNbgz4d0o/g87+paVdolLxaOczBPWCjWjD0Yxo3BRMWskfkg+Ndq7Hy7pTl3puLN7LW63NWnAv1bZ+WjW8o=
X-Received: by 2002:a5b:c:0:b0:6bd:f84c:b63e with SMTP id a12-20020a5b000c000000b006bdf84cb63emr8989664ybp.275.1664917518783;
 Tue, 04 Oct 2022 14:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030641.29354-1-quic_molvera@quicinc.com>
 <20221001030641.29354-2-quic_molvera@quicinc.com> <09f5d364-320e-9ecc-2c2b-68066c61f802@linaro.org>
 <e9c44e3b-b29f-0f47-b822-da0f4f2264cc@quicinc.com> <CAA8EJprE-mOOH8VF3m8TRb+0q=3_8NpvzdEAugabDaDbq6FMVQ@mail.gmail.com>
 <9664a623-3c58-49e8-1b9a-69335d844448@linaro.org> <CAA8EJprQoCQzr2x0JA9_b3MDE=oOTODyHD23debEL1MCE1mWBA@mail.gmail.com>
 <095742cb-61cc-af5d-848c-48b2ea5528ea@quicinc.com>
In-Reply-To: <095742cb-61cc-af5d-848c-48b2ea5528ea@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 5 Oct 2022 00:05:07 +0300
Message-ID: <CAA8EJpoqKCj4tyX-617YJH5zqkR_C=1LVMeLXcCxZFgOPjRZ=g@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: firmware: scm: Add QDU1000/QRU1000 compatibles
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 4 Oct 2022 at 18:52, Melody Olvera <quic_molvera@quicinc.com> wrote=
:
>
>
> On 10/4/2022 2:36 AM, Dmitry Baryshkov wrote:
> > On Tue, 4 Oct 2022 at 09:53, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 04/10/2022 00:14, Dmitry Baryshkov wrote:
> >>> On Tue, 4 Oct 2022 at 01:02, Melody Olvera <quic_molvera@quicinc.com>=
 wrote:
> >>>>
> >>>> On 10/1/2022 4:25 AM, Krzysztof Kozlowski wrote:
> >>>>> On 01/10/2022 05:06, Melody Olvera wrote:
> >>>>>> Add compatibles for scm driver for QDU1000 and QRU1000 platforms.
> >>>>>>
> >>>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >>>>>> ---
> >>>>>>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
> >>>>>>  1 file changed, 2 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.y=
aml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> >>>>>> index c5b76c9f7ad0..b47a5dda3c3e 100644
> >>>>>> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> >>>>>> @@ -51,6 +51,8 @@ properties:
> >>>>>>            - qcom,scm-sm8250
> >>>>>>            - qcom,scm-sm8350
> >>>>>>            - qcom,scm-sm8450
> >>>>>> +          - qcom,scm-qdu1000
> >>>>>> +          - qcom,scm-qru1000
> >>> I think after seeing all the patchsets it's time to ask the following
> >>> question. Do we really need a duplicate compatibility families:
> >>> qdu1000 vs qru1000? I'd suggest using a single set of compatibile
> >>> strings in most of the cases.
> >>> Settle down onto a single name (qdu,qru, qdru, whatever) and define
> >>> distinct compat strings only when there is an actual difference?
> >>>
> >>> E.g .we don't have separate compatible strings for all the sda660,
> >>> apq8096, etc. unless this is required by the corresponding hardware
> >>> block not being compatible with corresponding sdm or msm counterpart.
> >>>
> >> I am not that fluent in Qualcomm naming, so let me ask - what are the
> >> differences between QDU and QRU?
> >>
> >> For compatible (and/or similar) devices the general recommendation is =
to
> >> have specific compatibles followed by fallback. Even if devices are
> >> very, very, very similar, usually the recommendation still stays.
> > Well, true. But in some cases we handle this by using a single set of
> > compatibles. Consider e.g. sa8155 vs sm8150 (sa8155 overrides just few
> > compats that differ). Or qrb5165 vs sm8250 (there is no separate
> > qrb5165.dtsi). APQ8096 (#include "msm8996.dtsi"). Etc.
> >
> > I'd say this really depends on the actual difference between qru and qd=
u.
>
> To add some clarification, there's pretty little functional difference be=
tween the QDU (Distributed Unit) and the QRU (Radio Unit); they're largely =
the same SoC from the kernel's standpoint. I wasn't sure if it made more se=
nse to separate the compat strings or mash them together (using qdru to spe=
cify that it applies to both), so I kept separate compat strings in case th=
ere was a separate RU/DU use case down the line and also to avoid some conf=
usion (I guess that didn't work though). It makes the most sense in my mind=
 to just use the qdru compat string for the things that apply to both SoCs =
(which is most of what's submitted currently) and then we can do qdu/qru sp=
ecific override strings for more specific drivers.

Unless Krzysztof or Bjorn have other opinion, I'd suggest adding a
single compat string, It might be qcom,qdru1000-foo or just
qcom,qdu1000-foo (with having a separate qcom,qru1000-foo where
applicable). But the final decision is from Rob, Krzysztof and Bjorn.

--=20
With best wishes
Dmitry
