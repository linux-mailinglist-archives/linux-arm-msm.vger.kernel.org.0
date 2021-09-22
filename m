Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1575D415156
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 22:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237626AbhIVUZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 16:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbhIVUZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 16:25:04 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E72C061574;
        Wed, 22 Sep 2021 13:23:34 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id c20so4047882qtb.2;
        Wed, 22 Sep 2021 13:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuP0Z9/IKWNDlCkHNfLhchAqddONVQf+DBqSBzYLQwo=;
        b=fqEbUcQxkB3WtgyTGMDM4atSbsf+kBhx9C2Y3qC5CuZQ+nSJe96KS5jvVja/neJOlX
         gnt39zjp2fI4JfjqpeVdubftUzhGS41DG9H8DUBk7Sq3G/SUeU3NTHpAAlpWhXh1wiXl
         4V+G37IC6tOgXfwSO+tP4yPBeguRbQLdiBPAZu1et6njOxv4bj4rAn7E2wa4/3bBZYV/
         618ME9oShAfy9md6q9TIWl2KLoFqenVNWu9s/Z8gRLN8ykSe7YF+G65jKyup7UqThjMz
         zb5kAzdShjqKlKkKkZyt4RwANSn8z+OT0xNSFgJb0BY3OdE/3L1D2ZYztKbXsYE9p79u
         NcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuP0Z9/IKWNDlCkHNfLhchAqddONVQf+DBqSBzYLQwo=;
        b=p9uw5jsL2kc+2+8BimRPpJ3c0wPDTDWFNd9CpMKI0cxgK6JeAVv2CICVV2L5/iTgNr
         bOS+giwq7uypoz1OrZgHPA+422SYbm6rTNKiD/gFhNuPLRBlYxtYx3wvobzaEyyUuxjJ
         4Bz/VlAgKiHzcxjZBukJwLqEtWwgIFl1q04JbzT36tdcXfPM48nvvnKkFDG5BVCrdD1l
         xcOmKtxb7N5XXGCdAC4cq3s1ExQjMwSXyDkOJJAcZA+zgq20CLLprg2imA12LUEUXHfE
         ZC0LUlot1ZxcEzB1lr5bXa5IowYezylurMczH2IL3lssfrPiMZmL0UhQYPYGcNBvsADf
         Iaag==
X-Gm-Message-State: AOAM532ZrHWYiGB1TrKabj+KPQuJYlgOX1KzE1Nnaab2i6Wq8YYKVcyu
        U2ig/v0CeDErAR+mmVBMjLurkI7IDYQJlKAZQO0=
X-Google-Smtp-Source: ABdhPJypw3BzTxDq/yJX9w0aSJqC0rKUqetMW3sG1RNDeOg1qM2ErzRe1pNBkpEtzxwPrsZooRaWqUkT3kMQpLhHey0=
X-Received: by 2002:a05:622a:180c:: with SMTP id t12mr1259090qtc.304.1632342213236;
 Wed, 22 Sep 2021 13:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210902214708.1776690-1-robimarko@gmail.com> <YUf3aKn78+41Cb/G@builder.lan>
 <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com> <632a7d28c23a8497d35ea009bfe89883@codeaurora.org>
In-Reply-To: <632a7d28c23a8497d35ea009bfe89883@codeaurora.org>
From:   Robert Marko <robimarko@gmail.com>
Date:   Wed, 22 Sep 2021 22:23:22 +0200
Message-ID: <CAOX2RU5+jeXiqz8oss8Sd-BWa059uAv5xu=7nx_YF4RYpG2S6w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Sept 2021 at 08:24, Kathiravan T <kathirav@codeaurora.org> wrote:
>
> On 2021-09-20 14:55, Robert Marko wrote:
> > On Mon, 20 Sept 2021 at 04:52, Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> >>
> >> On Thu 02 Sep 16:47 CDT 2021, Robert Marko wrote:
> >>
> >> > IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
> >> > supported by the kernel add the required DT nodes.
> >> >
> >> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> >>
> >> Thanks for your patch Robert.
> >>
> >> > ---
> >> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 28 +++++++++++++++++++++++++++
> >> >  1 file changed, 28 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> >> > index a620ac0d0b19..83e9243046aa 100644
> >> > --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> >> > +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> >> > @@ -82,6 +82,29 @@ scm {
> >> >               };
> >> >       };
> >> >
> >> > +     reserved-memory {
> >> > +             #address-cells = <2>;
> >> > +             #size-cells = <2>;
> >> > +             ranges;
> >> > +
> >> > +             smem_region: memory@4ab00000 {
> >> > +                     no-map;
> >> > +                     reg = <0x0 0x4ab00000 0x0 0x00100000>;
> >> > +             };
> >> > +     };
> >> > +
> >> > +     tcsr_mutex: hwlock {
> >> > +             compatible = "qcom,tcsr-mutex";
> >> > +             syscon = <&tcsr_mutex_regs 0 0x80>;
> >>
> >> Since it's not okay to have a lone "syscon" and I didn't think it was
> >> worth coming up with a binding for the TCSR mutex "syscon" I rewrote
> >> the
> >> binding a while back. As such qcom,tcsr-mutex should now live in /soc
> >> directly.
> >>
> >> So can you please respin accordingly?
> >
> > Sure, can you just confirm that the:
> > reg = <0x01905000 0x8000>;
> >
> > Is the whole TCSR range as I don't have docs?
>
> Robert,
>
> TCSR_MUTEX block starts from 0x01905000 and has size 0x20000 (128KB)

Thanks, Kathiravan,
TSCR mutex with MMIO reg under it works, but there is some weird probe
ordering issue.

For whatever reason, SMEM will get probed only after MTD does and this
will cause issues
if SMEM parser is used as it will return -EPROBE_DEFER but the MTD
core does not really
handle it correctly and causes the device to reboot after failed parsing.

Now, I have no idea why does this variant which uses MMIO regmap probe
so much later?

Regards,
Robert


>
> Thanks,
> Kathiravan T.
>
> >
> > Regards,
> > Robert
> >>
> >> Thanks,
> >> Bjorn
> >>
> >> > +             #hwlock-cells = <1>;
> >> > +     };
> >> > +
> >> > +     smem {
> >> > +             compatible = "qcom,smem";
> >> > +             memory-region = <&smem_region>;
> >> > +             hwlocks = <&tcsr_mutex 0>;
> >> > +     };
> >> > +
> >> >       soc: soc {
> >> >               #address-cells = <0x1>;
> >> >               #size-cells = <0x1>;
> >> > @@ -293,6 +316,11 @@ gcc: gcc@1800000 {
> >> >                       #reset-cells = <0x1>;
> >> >               };
> >> >
> >> > +             tcsr_mutex_regs: syscon@1905000 {
> >> > +                     compatible = "syscon";
> >> > +                     reg = <0x01905000 0x8000>;
> >> > +             };
> >> > +
> >> >               sdhc_1: sdhci@7824900 {
> >> >                       compatible = "qcom,sdhci-msm-v4";
> >> >                       reg = <0x7824900 0x500>, <0x7824000 0x800>;
> >> > --
> >> > 2.31.1
> >> >
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member of Code Aurora Forum, hosted by The Linux Foundation
