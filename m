Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4201A5782C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 14:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbiGRMvx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 08:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234520AbiGRMvw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 08:51:52 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1477222AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 05:51:51 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a10so13461428ljj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OJXhbwSqMRATHVRajJolwvgYLJ2CSrmgUASy2N9nxn8=;
        b=mqmAkpdliFx1VG4eVEkqivQ0O5+4lFFFY6ty+unhLqXCJd+T2+xPCH/MP/2yp37gCn
         DUvLrM+auHbrDLN7eNYRRDRma9wrZkzYakm/1lB2UqljPpO4uncp72NdAFdXXZSoZk4D
         LCz4M6BHiFr5j/Q5TOsiGo5GDC0dHwnBv88pfuGZQK/+iUb64N0W8B9O8sgpht772JUm
         482uB14eVYQYCoNrShwliyCX0ReprSHm9dVVkoPIeLI47lPM3rudeUT9fhfnb1gdCd+I
         90R/qQI4U0rzdQ6NztPYUFnMeSUlTqSo1lZ5MXs4w+U869QB3lgG+DHHqWwQceAh6Ruz
         UajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OJXhbwSqMRATHVRajJolwvgYLJ2CSrmgUASy2N9nxn8=;
        b=hkXN08IR2zB0sH4TDV56pRvbIuQe04IxwTh2jwYXQHQsT+knZQptisYcuYVBdZUNyA
         oCSHQxy1lo60+S8F7vKMMkdbkhHI24Qnc5ZzG5BE3N681A0qEVFmAK5hXVVnb6Ss8Vac
         Sst43le4Gb2uQsfFAiYnMZQOIlzAztU+SKo5zbYIBsOmsSHkQpKh7dqL6erhJEKkcvCk
         uEeAM21hvaDtXLtiCI0Lh/i0aNc9Kq3uBd8CbWu60pdqH76gBrsBCb4z1SZ1MiWcFDgr
         OftuLS+NeH780VuAfd21SWNnCgjoAmSbVkQ9yrm81xViWOSz7BeTO2Mim3e11PIOoNIo
         qiUw==
X-Gm-Message-State: AJIora+cADOooTN3Rvi9tkZBnzZVi4HBlwrAgB3Ku7Y/LgCxhbZX0+qi
        18j+++7bPeRB5BskTU0IN6V4BeulQctyaMxOa0g7Ew==
X-Google-Smtp-Source: AGRyM1vCGpXByC4iMeBNORjehfb1nd7xOZbX1LOKXrEjLaS4H1ppLA2vxAfTsdoR7d0IDMEgaopM9fKiNux+UCagSPE=
X-Received: by 2002:a2e:968c:0:b0:25d:b5b1:9c8c with SMTP id
 q12-20020a2e968c000000b0025db5b19c8cmr2865910lji.300.1658148710042; Mon, 18
 Jul 2022 05:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220514215424.1007718-1-bhupesh.sharma@linaro.org>
 <20220514215424.1007718-7-bhupesh.sharma@linaro.org> <Yr4psYiCCbi15RMe@builder.lan>
 <772dc5d2-c3b2-685b-3a38-b86e8877424a@linaro.org>
In-Reply-To: <772dc5d2-c3b2-685b-3a38-b86e8877424a@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 18 Jul 2022 14:51:13 +0200
Message-ID: <CAPDyKFpUpvHWMZmU0RxLAoFQG7RzOnqvTQPQBOm0s5MkkMHChw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: ipq8074: Fix 'max-frequency'
 value for sdhci node
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Jul 2022 at 10:47, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> On 7/1/22 4:24 AM, Bjorn Andersson wrote:
> > On Sat 14 May 16:54 CDT 2022, Bhupesh Sharma wrote:
> >
> >> Since the Qualcomm sdhci-msm device-tree binding has been converted
> >> to yaml format, 'make dtbs_check' reports issues with
> >> 'max-frequency' value for ipq8074 sdhci node:
> >>
> >>   arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: mmc@7824900:
> >>    max-frequency:0:0: 384000000 is greater than the maximum of 200000000
> >>
> >> Fix the same.
> >>
> >> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> >> index ab2a1e7955b5..b2d71af9b419 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> >> @@ -388,7 +388,7 @@ sdhc_1: mmc@7824900 {
> >>                               <&gcc GCC_SDCC1_APPS_CLK>,
> >>                               <&xo>;
> >>                      clock-names = "iface", "core", "xo";
> >> -                    max-frequency = <384000000>;
> >> +                    max-frequency = <200000000>;
> > This might match the binding, but someone put 384000000 there for a
> > reason. Perhaps the binding needs to be updated instead?
>
> I was waiting for getting access to ipq8074 reference manual / documentation.
> I double-checked and it seems SDCC1 on this SoC does support a max frequency
> of 384 MHz which is strange as the SDCC2 supports 200 MHz as max frequency
> instead.

I guess it depends on what the property is being used for from the mmc
host driver perspective. So, to answer the question, we probably need
to look at the code in the host driver to best understand what to do
here.

>
> Also the eMMC and MMC controllers on other SoCs (i.MX etx( usually support only
> a max frequency of 200 MHz, so may be we need an exceptional addition to the
> binding documentation here.
>
> @Ulf - what's your view on updating the binding documentation here? I can
> send a v3 accordingly.

The point with the property is to let host controllers specify whether
there is an upper limit of the frequency that it can support. No
matter what, the mmc core will not use a frequency greater than stated
by the eMMC/SD/SDIO specs.

For eMMC, 200MHz is the maximum frequency.

For SD/SDIO cards, the SDR104 mode has 208MHz. So it seems like we
need an update to the binding, no matter what. :-)

I have no strong opinions around this, but perhaps just raising the
limit of the binding to cover the qcom case makes best sense.

Kind regards
Uffe
