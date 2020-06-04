Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7CC31EEDCB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 00:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgFDWiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 18:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbgFDWiG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 18:38:06 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CC6C08C5C0;
        Thu,  4 Jun 2020 15:38:05 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id l27so7864517ejc.1;
        Thu, 04 Jun 2020 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=J2WkUUsQWWdvfrqknuQ/1gKN6QCcS4GghlCaLSIsdOo=;
        b=RuyxW+laDxCnFYdR1DSXhWFe9hmsy8MmUSdRx7gfOV6BZ+PMG5eQgBYvvoBr0o1jP/
         CO6j6LmHfPfV+jhXz1DA4YWO6fcyXlNkdlDftOWUlHsR3EcW0Wh2XztTXzS1brB5I4gg
         9kqC0/qyII4ZCAECfmMt/etXcLCLHNHoEwIDP/+LeL2CDITbKaO+iHjyZ8vWUNXxeuqU
         fCP8+DEIM1lgadkYtB+ZzJGAZIBpVBzfIItCjBQlqAqDlsfb+ccx4dOpRjICJUq0n0Zo
         D5UO4Bjioy72L8N2YlHdnoShFWrJckHERD867Y15pK90KDu2HTUPl8J2x04GQMZxqEnx
         4VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=J2WkUUsQWWdvfrqknuQ/1gKN6QCcS4GghlCaLSIsdOo=;
        b=H/ucAbMxowtHsHLXn06vgDBTsi1MnJyW5EpqEZcx4w2nqEvbSptmqqz/rmjj7VpOjU
         ytaFu335oL+KwvVpsRkqm2jyef0a9X5vakzu8/4dP+OgXszI17+H3GVFq8sU5qONM7R6
         //aCuVuaJ2G52zC/VdFZ+9v8hnlX2XR5Tjwo/VslX0+Wwq3djZK55OEa6rWzek7bHJed
         BAamd6PyO3K221bC3POHwaxDczEAGLHhK5AMwtbOzv10/HqovPHIr9MTjfuXjKSM31cy
         Pn1d4svjp2ww07oJD7o7+sj+/owK4JSGcsnJEanJKMHMSq7Yo7izY3ygs/8nSErCD8++
         gZ/g==
X-Gm-Message-State: AOAM5331+v6Q6ftj/97hPwdD2n6vJBePFHdo8vxg1ApTjVtkkUgn0S5x
        V2GL/U/i6XNh+5cj0SsR8MP3tRXMDxaozwcwFkM=
X-Google-Smtp-Source: ABdhPJy8WeQEeGlX2fHb6Mjbksvzlj+mlQnkk4tVXm4iXU9l4tIyCo0wa1lKiM2g3B0MnY9NvJLP/hcUOZzCFijeBIE=
X-Received: by 2002:a17:906:7696:: with SMTP id o22mr5604826ejm.245.1591310284494;
 Thu, 04 Jun 2020 15:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200604205710.3167-1-jcrouse@codeaurora.org> <20200604205710.3167-7-jcrouse@codeaurora.org>
 <CAF6AEGt4N5+0h0fkrO7m6KD3VMXkdoFyhN5Nz72DcMjoHX6XWA@mail.gmail.com> <20200604220216.GA12322@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200604220216.GA12322@jcrouse1-lnx.qualcomm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 4 Jun 2020 15:38:28 -0700
Message-ID: <CAF6AEGssC5ZJKh3oMR6fFRJwZvWLy4YjE2anvq5sDmPB_ikv0Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v7 6/6] arm6: dts: qcom: sm845: Set the
 compatible string for the GPU SMMU
To:     Rob Clark <robdclark@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 4, 2020 at 3:02 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Thu, Jun 04, 2020 at 02:27:21PM -0700, Rob Clark wrote:
> > On Thu, Jun 4, 2020 at 1:57 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> > > split pagetables.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 8eb5a31346d2..8b15cd74e9ba 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -3556,7 +3556,7 @@
> > >                 };
> > >
> > >                 adreno_smmu: iommu@5040000 {
> > > -                       compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> > > +                       compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
> >
> > Should this be something like:
> >
> >    compatible = "qcom,adreno-smmu", "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> >
> > so that new dtb still works with old kernel?
>
> As far as I know qcom,sdm845-smmu-v2 never was actually used unless we were
> doing the parsing trick somewhere.

I *think* it has a use queued up for v5.8 for the
select-direct-mapping stuff?  I'm not 100% sure of the status of that
off the top of my head.

BR,
-R

> Jordan
>
> > >                         reg = <0 0x5040000 0 0x10000>;
> > >                         #iommu-cells = <1>;
> > >                         #global-interrupts = <2>;
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > Freedreno mailing list
> > > Freedreno@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/freedreno
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
