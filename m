Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD4C378105
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 12:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhEJKRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 06:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhEJKRH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 06:17:07 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654F7C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 03:16:02 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so13931223otp.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 03:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+Np7LVkFO+k//t+gSpypT1AotQ2jFPBKtuFKkN/dtM=;
        b=NOf6KVcKkXUHmYGNaZrDIRDFjPrVj5hSBSXZvZ6wEKVbPppOn2XyuDHQUuZTnAguC5
         f7LWad8CNQcI+bL+p/MhoxbGj+OaAOMwgO81lXFFAObxwYeu3qzXFS3oU6Brn9L1Z43P
         HpvXBxBFBkT12DCd8P+1sp5V0TSXFCxlP9vnseywG++1JWvExhXsHSDk3e24v33mDoKj
         7RL0vqeD6sI5QDd85aCFRoCRyMcv/L6wS+B30LJ5VNltabcy5Ip7u2CPsQtI9nzagTtA
         hazeRxWpA/BdCmRIuXXxMoFT2X7NQR6BS+nt1jr+C+6AXERjbAMmy2b53nsX3xFpHKpu
         mIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+Np7LVkFO+k//t+gSpypT1AotQ2jFPBKtuFKkN/dtM=;
        b=R2EjKPpFh9cZtnvjcFekBJXzVyrNs+5GNmgnSXoBbFOwuendlbdSKSKzv/xVgs5Gq4
         HbPaGPM86hYO/fyv9ph0rb1G/SrVzeEllEr+EOlYu4BBHOFrJI6S/QhSUs4hOR51k00b
         uA4G+E9szu6Tvj82fm8UZkvFpuK2MHtZ0cdG+p7nC8o8zdwMmckojC3Ja4juU5YUY2x3
         vv7D1xEDFpn2UE4n5m25FAPXVLPMaq3YQzWUNpqeWoOFmbEmN6e7rzvHoOewCvIw2uOU
         9d8AV5SI57p2WRSpoP0wdBELJ4++zXfWS8KjwfdgLwUTHjh2ch6Blms18kg5W9bN1FjT
         9EQg==
X-Gm-Message-State: AOAM532ExO4c9ZCCAq8wwF/hKmmL+nf+GF1LnMMak4J/58OcNTIAW96Z
        T2FVSlKE6bsP85PDOdPlLzM0uPlqPprpccbh7XP0Dg==
X-Google-Smtp-Source: ABdhPJwhjiJoeOC7z4YX/ekzR8uqaJsU9pnO8oufk0ZHM5XWmCtb1cqAb1cMFEm6N5tKL9UB7Yqms7hAE7yVzz3HO3s=
X-Received: by 2002:a9d:1d01:: with SMTP id m1mr20879338otm.155.1620641761839;
 Mon, 10 May 2021 03:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210510070359.3837925-1-vkoul@kernel.org>
In-Reply-To: <20210510070359.3837925-1-vkoul@kernel.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 10 May 2021 15:45:50 +0530
Message-ID: <CAH=2NtxZ6pvhF1U5gKK06wDqKLexzANJxq98uENZMn098HmYPQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: use interconnect enums
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 May 2021 at 12:34, Vinod Koul <vkoul@kernel.org> wrote:
>
> Add interconnect enums instead of numbers now that interconnect is in
> mainline.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index ed0b51bc03ea..a8cd224a2f31 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -656,7 +656,7 @@ mpss: remoteproc@4080000 {
>                                         <&rpmhpd 12>;
>                         power-domain-names = "load_state", "cx", "mss";
>
> -                       interconnects = <&mc_virt 0 &mc_virt 1>;
> +                       interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
>
>                         memory-region = <&pil_modem_mem>;
>
> @@ -1063,7 +1063,7 @@ cdsp: remoteproc@98900000 {
>                                         <&rpmhpd 10>;
>                         power-domain-names = "load_state", "cx", "mxc";
>
> -                       interconnects = <&compute_noc 1 &mc_virt 1>;
> +                       interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
>
>                         memory-region = <&pil_cdsp_mem>;
>
> --
> 2.26.3

LGTM, so:
Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
