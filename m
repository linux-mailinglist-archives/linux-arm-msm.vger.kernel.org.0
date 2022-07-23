Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3874D57F1F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 00:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238833AbiGWWvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 18:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238955AbiGWWvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 18:51:15 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFE4B48F
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 15:51:08 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id i13so5903177qvo.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BAOo1NA3qgCfxsTFfm+zVGPSQVFnQtGnHSx0rocnrnU=;
        b=MMQOauFaojJGkcVP9QdLcUmoDYlTbLogC8QX5o4KxZo7ItqQdaSk+S6w9SbNWO4E6b
         6Q4+2ptNgX3j1Tx5Lk+/3dQr788a0bsfUhFmbmP+09ihAZ7lp1Pc7fVXpfY+LvRjoRRI
         AXJCQmDHbIChM0s3T7PtJzQxHImYCvXILwODP1708eAP6xKkS2M/TxBHoPBSSFtmyf4T
         gp0K+1iVY9vsTCdcDqO4srxFA4weJCVbybrwfZrqElSphaBMD3h1KdKVBmd10UnCGxyJ
         BF1+LHjAYOalD+5Qjey1Ke4NUUy2SkJ3s5LdklWCtkY4Lv4WKf4S+WCeAYVzmm6eo8Iu
         L3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BAOo1NA3qgCfxsTFfm+zVGPSQVFnQtGnHSx0rocnrnU=;
        b=3dZj0fF+CfR5KQW9WKhafxpcfnYv/UzwU6e0Zk40slGbqCE2l+gq3X+45zqSDZqNKk
         e/MDItL/UhBU3EOc2VGzpWW7R663dOHav1l2ePIxCvJpbjXCERwLjdN1S+4Ncwvq8myh
         84DBsuq2qBY1EeRntctteoknbgjRYwtwkcvpD1WAav4CUH+3x9n4Zw4ViFCquIlA55wz
         ie9NujE5xwX+kHJ/E42/+BVIheLZlDzAYCYXOHZx/tI5uCYq1V0fiU7zPDtbsYbfGzhP
         VL1JXcDD2pcgkMgWxvnJWOUx0UkM1a3BN1warkzobE/AQBbq5SOpWxPm3LnwwIxv1q3V
         mRDQ==
X-Gm-Message-State: AJIora/CXPtD81uNgSlMmLzY8Oo3tWJM6b+/vt0JRWgQrPKfGOzeIPpJ
        EMdr4BkVj0ZuenEmVDqx6VcnzGbQLA9iWa85lF9Ksw==
X-Google-Smtp-Source: AGRyM1tE8XkydD0KfX0J+3qtlgQefWbIakeg2/rt5DzUilWbS4qHU6sxaaBcSJqHEbcb9TRH8GVr/arx2gAm0IKt9gM=
X-Received: by 2002:ad4:5761:0:b0:473:7861:69d1 with SMTP id
 r1-20020ad45761000000b00473786169d1mr5486512qvx.73.1658616667990; Sat, 23 Jul
 2022 15:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org> <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org>
In-Reply-To: <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 24 Jul 2022 01:50:56 +0300
Message-ID: <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 23 Jul 2022 at 20:48, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/07/2022 11:09, Dmitry Baryshkov wrote:
> > Describing each compatible board in DT schema seems wrong to me. It
> > means that each new board is incompatible by default, until added to the DT
> > schema.

s/incompatible/non-valid/

>
> The bindings do not document something because it is or it is no
> compatible. They document the compatible. Your patch essentially removes
> the documentation, so there is no point in having compatibles in board
> at all...

I do not quite agree here. Please correct me if I'm wrong.
Schema defines which DT files are correct and which are not. Which
properties are required, which values are valid, etc. So far so good.
For the device nodes it declares (or is willing to declare) all
possible compatibility strings. There is a sensible number of on-chip
IP blocks, external chips, etc. Each and every new chip (or new IP
block) we are going to have a yaml file describing its usage. Perfect.
For the machine compatibility lists the arm,qcom schema declares which
machine compat strings are valid. And this looks like a problem. Now
for the DT to be fully valid against DT schema, we have to define its
machine compat string.
For each and every phone/sbc/evb we have to name it in schema. I think
this is an overkill. It feels like we are putting DT information
(mapping form machine compat to SoC) into the DT schema.
For qcs404 we already have a schema which uses three items: {},
qcom,qcs404-evb, qcom,qcs404. This sounds like a perfect idea to me.
We allow any board, created by Qualcomm, Google or any other random
vendor, named Foo, Bar or Baz, as long as it declares that it is
compatible with qcom,qcs404-evb.

To go even further. We now have the qrb5165-rb5.dts, declaring
compatible = "qcom,qrb5165-rb5", "qcom,sm8250".
If at some point I add a navigation/communication/whatever mezz on top
of it. It would make sense to use compatible =
"qcom,qrb5165-rb5-navi-comm", "qcom,qrb5165-rb5", "qcom,sm8250".
Adding this to the growing list inside arm,qcom.yaml sounds like a
nightmare. I can only hope that at some point JSON schema gains
postfixItems support (as proposed) to be able to change e.g.
arm,qcom.yaml to list just our qcom,something platforms as possible
postfixItems for the schema.

Regarding having compatibles in board files at all. I think that they
are somehow misused nowadays. Instead of declaring that the
Dragonboard 845c is compatible with "thundercomm,db845c",
"qcom,sdm845-sbc", "96boards,ce-board", "96boards,iot-board",
"qcom,sdm845", the DT file declares nearly useless
"thundercomm,db845c", "qcom,sdm845".

Thus, if we (mostly) use machine compatible array to just define
Vendor+device name and the underlying Qualcomm SoC, I propose to leave
just a sensible part (SoC) in DT schema, while allowing any string in
the first part.

> >Adding support for more and more devices would grow this file
> > indefinitely. Drop most of individual device-specific compatibility
> > strings leaving just list of platforms in place. All entries which
> > differ from two-item string array are left inplace.

-- 
With best wishes
Dmitry
