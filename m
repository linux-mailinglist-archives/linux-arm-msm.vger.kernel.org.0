Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10E54FE397
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 16:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354962AbiDLOVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 10:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353448AbiDLOVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 10:21:37 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1352B47AF4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 07:19:19 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id o16so18374760ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mQyhcpmuoxubOTeJc5FbJZSd/FqD2XuPIEYRCS1ggmw=;
        b=ydG+eEZexNQfagzFvxoj4FD97ilHqxwQqCPkORhS5G/hJ0xwxgXdQZbamWtyEwi1aC
         yOU7dgTfSLJUpRDyR7IedOV/kpj2RKsfEAJ8VnhCk/vmebRcBHjnQLmFARBt/57VbpZ6
         qple/wrZ7mV6dOki1hZPjlcMd9FDcXZJZb/ezzjKTbhtX4FgmdlT2hXEHu0MFk06qI2d
         m52WMMuSoMEwDIcuSIgVH/BUaCF+fKMFc0PDyiVrrqD+nPWzCIjCRhQSewtovaVV/Dah
         mxt41+nsFKqD4mCj75quu7rgmMmUfuScOGJC8LF8reSmu0cAZAd8u6SxxV4h/PbHNT3j
         fmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mQyhcpmuoxubOTeJc5FbJZSd/FqD2XuPIEYRCS1ggmw=;
        b=uPXK2RcazJ9HDhypPTRK1PLOYSuvLe5r3PQRWaHj5jtYR018pfYD46NDXRbVNdX4r1
         bs9cseLAPNA9ncMTz5CURcSDlktLqZ3y34MNnnYNYt1TOBRDqnPVj3oG5+0vPCcd/IDq
         SjLFgUptB4VbYWU3VnRDwmofpJIO28bu+g9zMUYQk6oO7tyP/eiBsFQuYUIfHz05wpC4
         O4kdEL95xRL3aJ6nLeOH/wLY4UL4eME+NNEkrnqD0vFc9/3Mm6VsuW8pk6M0JavuPUsi
         H0ckAYfxjq4d2vLAWpl7+ASNwwoBOMYdqnwlMvMb5HQQaV2agZdADgsy9hdB/tHAxirf
         tltw==
X-Gm-Message-State: AOAM533VQODkRH/A88+47mBnNck0+XKY7T/vpvmmdnuIbEu9mDeeD42r
        Jg2XvctOmwz0XK/i7ka2AZaZtBkIl+uqNL56PQ7NxQ==
X-Google-Smtp-Source: ABdhPJybcpvxTKB+Nbs/AV1PA14+uH0q480UoHl1NeG/zKAVRWlPeSSnikUgTyII0O0N9vSECYon0Eo8hlDT0BXQCos=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr23873129ljq.300.1649773157120; Tue, 12
 Apr 2022 07:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <1649759528-15125-1-git-send-email-quic_c_sbhanu@quicinc.com> <1649759528-15125-2-git-send-email-quic_c_sbhanu@quicinc.com>
In-Reply-To: <1649759528-15125-2-git-send-email-quic_c_sbhanu@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Apr 2022 16:18:40 +0200
Message-ID: <CAPDyKFrJDVBdyu4=0dXaBs8FhsF5jvcLKGgfjjbB-rVztxmgqg@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: mmc: sdhci-msm: Add gcc resets strings
To:     Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sartgarg@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sayalil@quicinc.com,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Bhupesh

On Tue, 12 Apr 2022 at 12:33, Shaik Sajida Bhanu
<quic_c_sbhanu@quicinc.com> wrote:
>
> Add gcc hardware reset supported strings for qcom-sdhci controller.
>
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>

As stated earlier, I would really like to see the binding being
converted to the yaml format first. It seems like Bhupesh is working
on the conversion [1].

Kind regards
Uffe

[1]
https://www.spinics.net/lists/linux-arm-msm/msg107809.html


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 6216ed7..9f02461 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -76,6 +76,7 @@ Optional Properties:
>                 "cpu-sdhc".
>                 Please refer to Documentation/devicetree/bindings/
>                 interconnect/ for more details.
> +- resets: Phandle and reset specifier for the device's reset.
>
>  Example:
>
> @@ -98,6 +99,8 @@ Example:
>                                 <&qnoc MASTER_CPU_ID &qnoc SLAVE_SDCC_ID>;
>                 interconnect-names = "sdhc-ddr","cpu-sdhc";
>
> +               resets = <&gcc GCC_SDCC1_BCR>;
> +
>                 qcom,dll-config = <0x000f642c>;
>                 qcom,ddr-config = <0x80040868>;
>         };
> @@ -118,6 +121,8 @@ Example:
>                 clocks = <&gcc GCC_SDCC2_APPS_CLK>, <&gcc GCC_SDCC2_AHB_CLK>;
>                 clock-names = "core", "iface";
>
> +               resets = <&gcc GCC_SDCC2_BCR>;
> +
>                 qcom,dll-config = <0x0007642c>;
>                 qcom,ddr-config = <0x80040868>;
>         };
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
