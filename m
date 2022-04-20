Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829AC508548
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 11:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377383AbiDTKA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 06:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377403AbiDTKAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 06:00:21 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2763ED21
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 02:57:36 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id q129so1460098oif.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xtLUEzPeV0tow6IIeX5RE4U5Io5bh+mYl/Jcol0SuNQ=;
        b=kk88lTGpFTLg11Qn22PMTPob9b4OwfpBr+jg8m5Q2R4H7KYnUxQ+tXqvp2J8KkeCBK
         Uj+tOovnRJhF3i6nSH7KhH9Y7nD+XcDmgKm3QMgdZXoLU3mclrZNRfpEiG/PZSoFUPuh
         DQUeHblz4zVmRokFue5TW9XhrbLJEnKY/AkEONTeQ2xoeQhGXVoqYWMUGQwb9ihUueyU
         E2TcFek5XeVm7wmEguS3Q6u4ZhpgpSn5VilAQZe3T5KqvPHwM927kzBC42+1qEXdE9PT
         WQcOR7ESdjoJQ360wnJNt/C72kMEeUxH73aocEvXrWCxwX531mtSBaATFjIsgpdKAOF9
         ug+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xtLUEzPeV0tow6IIeX5RE4U5Io5bh+mYl/Jcol0SuNQ=;
        b=OyoBmih97v4JcSVHGzS+U4fFebHnKRTZY2HcArf2FLNPSLE0guPhSNQDxfHohtj3O6
         d0n1N03RfHJreyvQEVL8AC3K2ShdLzgNKMdMy+Yv5hqkSuzRJ1aHCWKYXXk+UAVRTa/i
         fh+sNvDP+9nbkGBf6VvOnnenNEc7MMYjwLNmdaug+Llg58ZPVP/y7w2Ud/bCrm7IziHq
         ZLNjGD74cFh8gRmRZobBGLW8FiiyIzfhtKW0quUtAQQ1sdFWX72rtjFv/2rKZJjTa1Vm
         felP6FfP3don9mg+WpowiKu8evanQu2748yRAUsLoV1mvFap448tpSx3q3uDK/dnAlhc
         ctxA==
X-Gm-Message-State: AOAM531z7ajtiLajB/C+fnAdQX7B3vmvJffRcb9xFFfYCivDWL9/crHY
        UpjKGB/7rnz7L4Tx7bmUZvVOveI8ZpHvdhXo57L50A==
X-Google-Smtp-Source: ABdhPJxaDD5GwbBlHvwLykrnSnFpNHAykS4Zg8AMoRLLwxTrDX7Z7InuNESKj5Ki0F14ogoWudSXsIUQHg/WXzVQYD8=
X-Received: by 2002:a05:6808:e8c:b0:322:4b82:d33d with SMTP id
 k12-20020a0568080e8c00b003224b82d33dmr1250229oil.21.1650448655554; Wed, 20
 Apr 2022 02:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org> <737d44a9-56ba-846e-24ad-36b2da52d2d7@linaro.org>
 <CABymUCOAKvZXZKYtvunjn=K9mpZmAd4x3WTXH571k5BsBH6CEA@mail.gmail.com> <0cb490f4-3df8-7fc8-277f-070e0133f5db@linaro.org>
In-Reply-To: <0cb490f4-3df8-7fc8-277f-070e0133f5db@linaro.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Wed, 20 Apr 2022 17:57:23 +0800
Message-ID: <CABymUCN_N_yKuuF0zdwZ_jfd-UsfSt-HY5O4PjZ_sNmYGQ2UJw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, benl@squareup.com, jwillcox@squareup.com,
        jgates@squareup.com, mchen@squareup.com, zac@squareup.com,
        Leo Yan <leo.yan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> >>
> >> Generic node names, no underscores in node names. This applies everywhere.
> >>
> >>> +                     compatible = "qcom,qfprom";
> >>> +                     reg = <0x00058000 0x1000>;
> >>> +                     #address-cells = <1>;
> >>> +                     #size-cells = <1>;
> >>> +                     cpr_efuse_init_voltage1: ivoltage1@dc {
> >>
> >> s/ivoltageX/voltage/
> >
> > How about cpr_efuse_init_voltage_dc? There are 3
> > cpr_efuse_init_voltage* node here.
>
> The node names should be generic, so this should be maybe even just
> "efuse"? Feel free to add some prefix to it, so "init-voltage-efuse",
> but no underscores and no suffixes in such case (but "init-voltage2-efuse").

The nodes are referenced by other node, such as below case. So I have
to name them,
underscore is the best separator. While I have 3 init_voltage related
nodes to name.
What's the name you suggest for them?

arch/arm/boot/dts/qcom-apq8084.dtsi: nvmem-cells = <&tsens_calib>,
<&tsens_backup>;

Regards,
Jun
