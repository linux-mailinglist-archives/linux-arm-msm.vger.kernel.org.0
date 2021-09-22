Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6858B41533F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 00:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238236AbhIVWTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 18:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234970AbhIVWTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 18:19:50 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0798C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:18:19 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so5720105otb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rBQLrqQ+KVrMj7fI2R/owDobCXRWVkWx/vRkv7LGFv0=;
        b=AFhy04WiYMhTL2ya7NSlhkdl4XJYIDnrrjCxOnvCwBFEUxoSxxtonPBPLvy1yVWZ4b
         wOOGsFDKesuntaE1ScrL6JyGr4mDgf/BR2lQYDKBYU7vbDkHsSqll0Ml6O56xSHchHRL
         uU9YhzW/rGle7VmlurGCb0yCwxA/ZU4sY6GppoayQ0hFLKuSNWziWmCxMxfRVSml4Iah
         hPt1AaGN/cd402CSMyiLyHeOplWn7e0ikkJDNcZHuI0Bc464TrULAWmCqXXDLuKZFFv/
         mj/lXQR8NYR6gxvYJDVX03DMFVjY2wGb8d8Qs4ZD+7nOQpHV7IHS4SKW6T4Wy6Zltld1
         OqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rBQLrqQ+KVrMj7fI2R/owDobCXRWVkWx/vRkv7LGFv0=;
        b=kvOZOt61uap6Vz35m9iSBS5Y0+sxK6/I8T2Jd4Esh/Tbs8N0EHmZyogJJGbCTp3xHh
         xRQwZvECGQUgLjY5hepMjBmqlyb8Ezz0rcsQ9aC016N7l56HXP4DpKtN+pmt9vy+rIkJ
         fKI/V0ZaLkd+0IQtO0KYeXTfY36tbKz2qEHZ9Oqf5LcxRvUB5HiKyQW/q9K1aHNmEKlW
         b3OiFDoYDgfvLAsp2/apRmagR42/FMnVol7K+BsKp5gVBx+KDE1OiPcH18azKBwVFFj7
         QCGvLdktcO5qoYR4eI34encyFO/xWJ+vk7bbyjtNaSBnNopJQig166M8KE4nvsYkfGbK
         i6oQ==
X-Gm-Message-State: AOAM532jkX/R36ZUOZXD16h0SDJ+YPF8SUQbqRX7Z8ev/XdiGCvZmVfz
        5mVMdgNo3C6db7pSRPrgONgWWg==
X-Google-Smtp-Source: ABdhPJy+4BXIDvwRt9LTmAgaXrtG7A3sWrl0VnQlfW9eRWJs9w89u7AZX7jEgp95UZrOL/CJwQMmzA==
X-Received: by 2002:a05:6830:40ca:: with SMTP id h10mr1317634otu.187.1632349098826;
        Wed, 22 Sep 2021 15:18:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r23sm784159otu.54.2021.09.22.15.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:18:18 -0700 (PDT)
Date:   Wed, 22 Sep 2021 17:18:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robimarko@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kathiravan T <kathirav@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
Message-ID: <YUurqDL/S15RziCQ@builder.lan>
References: <20210902214708.1776690-1-robimarko@gmail.com>
 <YUf3aKn78+41Cb/G@builder.lan>
 <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
 <632a7d28c23a8497d35ea009bfe89883@codeaurora.org>
 <CAOX2RU5+jeXiqz8oss8Sd-BWa059uAv5xu=7nx_YF4RYpG2S6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOX2RU5+jeXiqz8oss8Sd-BWa059uAv5xu=7nx_YF4RYpG2S6w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Sep 15:23 CDT 2021, Robert Marko wrote:

> On Tue, 21 Sept 2021 at 08:24, Kathiravan T <kathirav@codeaurora.org> wrote:
> >
> > On 2021-09-20 14:55, Robert Marko wrote:
> > > On Mon, 20 Sept 2021 at 04:52, Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > >>
> > >> On Thu 02 Sep 16:47 CDT 2021, Robert Marko wrote:
> > >>
> > >> > IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
> > >> > supported by the kernel add the required DT nodes.
> > >> >
> > >> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > >>
> > >> Thanks for your patch Robert.
> > >>
> > >> > ---
> > >> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 28 +++++++++++++++++++++++++++
> > >> >  1 file changed, 28 insertions(+)
> > >> >
> > >> > diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > >> > index a620ac0d0b19..83e9243046aa 100644
> > >> > --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > >> > +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > >> > @@ -82,6 +82,29 @@ scm {
> > >> >               };
> > >> >       };
> > >> >
> > >> > +     reserved-memory {
> > >> > +             #address-cells = <2>;
> > >> > +             #size-cells = <2>;
> > >> > +             ranges;
> > >> > +
> > >> > +             smem_region: memory@4ab00000 {
> > >> > +                     no-map;
> > >> > +                     reg = <0x0 0x4ab00000 0x0 0x00100000>;
> > >> > +             };
> > >> > +     };
> > >> > +
> > >> > +     tcsr_mutex: hwlock {
> > >> > +             compatible = "qcom,tcsr-mutex";
> > >> > +             syscon = <&tcsr_mutex_regs 0 0x80>;
> > >>
> > >> Since it's not okay to have a lone "syscon" and I didn't think it was
> > >> worth coming up with a binding for the TCSR mutex "syscon" I rewrote
> > >> the
> > >> binding a while back. As such qcom,tcsr-mutex should now live in /soc
> > >> directly.
> > >>
> > >> So can you please respin accordingly?
> > >
> > > Sure, can you just confirm that the:
> > > reg = <0x01905000 0x8000>;
> > >
> > > Is the whole TCSR range as I don't have docs?
> >
> > Robert,
> >
> > TCSR_MUTEX block starts from 0x01905000 and has size 0x20000 (128KB)
> 
> Thanks, Kathiravan,
> TSCR mutex with MMIO reg under it works, but there is some weird probe
> ordering issue.
> 
> For whatever reason, SMEM will get probed only after MTD does and this
> will cause issues
> if SMEM parser is used as it will return -EPROBE_DEFER but the MTD
> core does not really
> handle it correctly and causes the device to reboot after failed parsing.
> 
> Now, I have no idea why does this variant which uses MMIO regmap probe
> so much later?
> 

Mani, do you have any input related to the probe deferral of the SMEM
partition parser, because SMEM not yet probed?

Thanks,
Bjorn
