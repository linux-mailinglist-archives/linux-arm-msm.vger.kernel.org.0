Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0911EED47
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 23:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgFDV06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 17:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgFDV06 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 17:26:58 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25763C08C5C0;
        Thu,  4 Jun 2020 14:26:58 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e2so7648784eje.13;
        Thu, 04 Jun 2020 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WE1oe2yB5oVKYeXtakXr0zKpVIUuuVPE1o8EvQmvAgo=;
        b=MOfa19HtKuS1dBbVo7y/trtcUwipqOZV+Kcw2wnnzCFXuRDwAZJWnmNidsfNqKrhkx
         u38R3tD071DTiHuqoTAvaOwm34eIju84ayw93sVyeF+bHFsTuUr7CpnQynd6uWNH655O
         8avch9SwhLtb3xl5M7p4Jc/npv2R+TqFxSaRxpBaMWW/vpHU8TwpaHnYJMl5XfrXoUih
         Bi+0tNXvYRlLXGuoGkNGhr1b9khG9vGFYjwWS3q0n1+7GwZYgLG6tE0j6l38Jp7pC7UX
         dw2mUn9Ba8Bj8cb3xS5HzNcjwkBin1TWA1GblANMc/W1lA7ijjzE10YTqyGs0DJOxoZM
         Ko5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WE1oe2yB5oVKYeXtakXr0zKpVIUuuVPE1o8EvQmvAgo=;
        b=Hc9D5RUqN1lXGTxmeCrZSJWoc01GJ5LU6D7HDrwD4lzScwpqMhJPi6QvCohYqyX0d1
         Ss4JLOmUT7btSFgUcIwg5339XTP2qEDIchR9QuyYTGdToGQugZPK2tJp8opy6xKj7Nbp
         gcM4PJytCEob14FHTLzsnkLIXi3Aj31Dz43KT/zY8neM3GuzSEVPmhgVmRmeTn/pBxOp
         G9nocxC3ussohNQzgwTfYSELYKdzS4udCkfbru/yDEPrLOXsbo0tT2IxRH7xTrO0ykwk
         ozbBjDVOWw6Kea4LwBBGb+sXW7vk3qg8b7bg6SlsHVGjbEbz+8onhglHCN9/f985s5bm
         mL7Q==
X-Gm-Message-State: AOAM532wLWm3BKLqoSC0Z400fD/CktROg1jokN6gC9WqfAKpoZetRuo4
        IhXEepj2rKrDiL92nf2vIrvxhVyC3TjhtHl348M=
X-Google-Smtp-Source: ABdhPJy16zksl6Je748Tu/2bB0Pl9iDll7SpFPWhZUcw7BNspDhhcW4cw9AdU0+h0JLBpdnXeoM3Pm/krMB8v+T7THo=
X-Received: by 2002:a17:906:3bd8:: with SMTP id v24mr5183395ejf.231.1591306016754;
 Thu, 04 Jun 2020 14:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200604205710.3167-1-jcrouse@codeaurora.org> <20200604205710.3167-7-jcrouse@codeaurora.org>
In-Reply-To: <20200604205710.3167-7-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 4 Jun 2020 14:27:21 -0700
Message-ID: <CAF6AEGt4N5+0h0fkrO7m6KD3VMXkdoFyhN5Nz72DcMjoHX6XWA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v7 6/6] arm6: dts: qcom: sm845: Set the
 compatible string for the GPU SMMU
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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

On Thu, Jun 4, 2020 at 1:57 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> split pagetables.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 8eb5a31346d2..8b15cd74e9ba 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3556,7 +3556,7 @@
>                 };
>
>                 adreno_smmu: iommu@5040000 {
> -                       compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> +                       compatible = "qcom,adreno-smmu", "qcom,smmu-v2";

Should this be something like:

   compatible = "qcom,adreno-smmu", "qcom,sdm845-smmu-v2", "qcom,smmu-v2";

so that new dtb still works with old kernel?

BR,
-R

>                         reg = <0 0x5040000 0 0x10000>;
>                         #iommu-cells = <1>;
>                         #global-interrupts = <2>;
> --
> 2.17.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
