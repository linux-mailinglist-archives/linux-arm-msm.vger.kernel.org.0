Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53B5296352
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 19:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898629AbgJVRFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 13:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506115AbgJVRFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 13:05:54 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFE7C0613CE;
        Thu, 22 Oct 2020 10:05:52 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h7so3367762wre.4;
        Thu, 22 Oct 2020 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z7oGAPp6/f/o/GnSDvAmlFbMJqJzLiKP1b/+U/w2NxM=;
        b=I/RTqDeq889KZoWWoiIoZdFkpNZoexL/wHj4rVUH6M8Np4RLKtkpKMTlU4sDN6LSBX
         4VnVDbzdLnl5+aTWP1Mr519DzVZx4nYhX8FUKRCD2NfVD6vObPja/cT8IEYq5K4ypmxB
         Kewgq+hond+XfUeMWa+NPLUmoTOLLiLHHrE9rOXszRpwXQMTg1OfARioltxqSdQwCSWn
         cbFhMliQ+DBXzokf2J9dPXRYLtYACVAfbaOlTQsL6FZvoLn/0e5ZR+o+RFbzjF4q/TaF
         8jr7AikoqWh8w2gc+3nGlieT/ZXJlfXvIR6Fud5eVZjSq8dzfPglvRC+j4poIyJoCDGx
         761Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7oGAPp6/f/o/GnSDvAmlFbMJqJzLiKP1b/+U/w2NxM=;
        b=FPs6MtoltFni42AkL+BlmIwcXC4thFOR8ThvnqcJGe6IUlXDSBepRivMGSMfuEc2+P
         pCNuiffr0RXnWawusW9Bu2Yt3cPQgS/7tDgfeRqL0g4ESTcjtVoWgitU8bCSy4lKGPdB
         8tV2wLyIt/T/+QPSfNeTKru0qbK/RbB+JTamWoHrXbKvO2mX2Q8vBJOhZm2ofWKYfdKu
         /6MusvKUdwvRj/tcQy0cXOtYGuminZ/XUpzhj+k1IXqbl0S7RCu+SPe3JuVNhyYgD+Mu
         QBc6N8uJwLSNfQ+niZX8VOq2tE7I1heuNESym+tpoxZxHnTCuRHhm/mOUjPBhmsjj4k8
         xlvw==
X-Gm-Message-State: AOAM5319NBGn0ZbjEw2Ngu9iRQJx/JQh+zoIr+m7bGRejbGMthWpUB7e
        c977OYNgMnhR8C3egmD1ZZuR1i8n0XaQ6HMAXjCLqF1M3uHOfQ==
X-Google-Smtp-Source: ABdhPJz5TzlFP1WOZHAuIP58EpofyOo5ss4knUxAOx7yfS1w8lmI3hPO5XVIYXiglDuhg8Qhpm6zUbL7Ti0mFuwgZyk=
X-Received: by 2002:a5d:4987:: with SMTP id r7mr3543732wrq.327.1603386350438;
 Thu, 22 Oct 2020 10:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201022163810.429737-1-robdclark@gmail.com>
In-Reply-To: <20201022163810.429737-1-robdclark@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 22 Oct 2020 10:05:39 -0700
Message-ID: <CAF6AEGtbotkb2p9xd+BBWThxje1XRazv4ch5QUanJGGKctAa-w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix number of interconnect cells
To:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc:     Rob Clark <robdclark@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 22, 2020 at 9:36 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Looks like thru some sort of mid-air collision, updating the # of
> interconnect cells for the display was missed.
>
> Fixes: e23b1220a2460 ("arm64: dts: qcom: sc7180: Increase the number of interconnect cells")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Georgi pointed out that Doug already sent this patch:

https://lore.kernel.org/linux-arm-msm/20201001141838.1.I08054d1d976eed64ffa1b0e21d568e0dc6040b54@changeid/


> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6678f1e8e3958..a02776ce77a10 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2811,7 +2811,7 @@ mdss: mdss@ae00000 {
>                         interrupt-controller;
>                         #interrupt-cells = <1>;
>
> -                       interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +                       interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
>                         interconnect-names = "mdp0-mem";
>
>                         iommus = <&apps_smmu 0x800 0x2>;
> --
> 2.26.2
>
