Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A34D3A4AD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 23:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhFKV7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 17:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhFKV7o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 17:59:44 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B4FC061574;
        Fri, 11 Jun 2021 14:57:35 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id l3so10292321qvl.0;
        Fri, 11 Jun 2021 14:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/twGMyo5EO9GXJuIlNzACVg/yJN3yFBsRp8LJlEdtXM=;
        b=FwxcQHeM7PISTuZI0+UBbTk2U/Ifne6xvCN7lgf/mDl56VYpw0qec/8ladJtzEDxM9
         bpD2+kzR5F907VaTmef5z4kEacdOiqXp4QjZ44fx92tb9ix/Zhc+ADyXaB9AIK6ak+01
         VxStL9uURyzUzd8z+eI7S5GsneuptEOIREF0i7Rz3OVS2G6yZTixfCrCCLPdC8ut/g9x
         E3dhLuxxR3cgEU4JvsDCfc9D5gC9OeFOoYXs8s6ktMYGroj8EBmlotUkCyHghdrSIYh7
         AhhhZ1AmFudanKRhE2nOvprbVgJhmY1ElE6BGwlB0JxxWW01gWN2t18fsYla7gcxnJVT
         khLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/twGMyo5EO9GXJuIlNzACVg/yJN3yFBsRp8LJlEdtXM=;
        b=TSwTRJyzgyqMv3PamUtfxsWX0fCrT62dnP6Oc9n69koB/6XwUU1UV4L2fhRjrfSEOO
         QCjyRQpyyWZVtD+HUOC8fGLTLC2qNcqEK3Uf6axWmICFgqGvaafTQngyL8rK9LYr2eES
         PWBe6MbcLarW4luLP4GQDRNaqlnSoS30WZZvNUrm2nw9dQRgSKhL0OvSmmjU6Inbrdiw
         8lEAeVNHk9ziiYahNGcxQFvdROsWlYpDgl25LF9dG5I2510q4zexpU9Y6ePDWJy3KK14
         EdJymZqaQ0+OOMGW2srLbxoLUXsl3HAE+taiKVkMUkrC4cDyuxCFE9/2XiK6YaQ5xkNr
         yZSw==
X-Gm-Message-State: AOAM530lDm8bc5p5qoK00SfsSQhXs9z2X77IdnMflWvUlUUzZtJtHGpw
        2fxy5LK+Roz6koKVWwMrWmJOXfzJPG+H89N/shMOKOaTBWE79ohe
X-Google-Smtp-Source: ABdhPJxagl6eJfmc3DNGhjfpe4EHJxWxMWDcN9SWrXsF55lIrUza4fxVv/Huvq6tUo9g+Fa86e25TOEEvxvfKAiuImM=
X-Received: by 2002:ad4:4e2e:: with SMTP id dm14mr7005009qvb.33.1623448655003;
 Fri, 11 Jun 2021 14:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210611203301.101067-1-konrad.dybcio@somainline.org> <20210611203301.101067-2-konrad.dybcio@somainline.org>
In-Reply-To: <20210611203301.101067-2-konrad.dybcio@somainline.org>
From:   Marijn Suijten <marijns95@gmail.com>
Date:   Fri, 11 Jun 2021 23:57:24 +0200
Message-ID: <CANX-K3uHfV2dh8Ep1__atCgZ-VYxn4=9MkeR7zi40p0vLdF4Cg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for SONY Xperia 1 / 5
 (Kumano platform)
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Jun 2021 at 22:33, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
> Add support for SONY Xperia 1 and 5 smartphones, both based on the
> Qualcomm SM8150 chipset. There also exist 5G-capable versions of these
> devices, but they weren't sold much (if at all) outside Japan.
>
> The devices are affected by a scary UFS behaviour where sending a certain UFS
> command (which is worked around on downstream) renders the device unbootable,
> by effectively erasing the bootloader. Therefore UFS AND UFSPHY are strictly
> disabled for now.
>
> Downstream workaround:
> https://github.com/kholk/kernel/commit/2e7a9ee1c91a016baa0b826a7752ec45663a0561
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Thanks for working on this!

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
(On Bahamut)

- Marijn
