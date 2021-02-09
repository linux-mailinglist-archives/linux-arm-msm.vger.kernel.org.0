Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC521315A1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 00:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbhBIXds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 18:33:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhBIX1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 18:27:24 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E121CC061797
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 15:25:51 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id 19so9755837qkc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j+KENCqVT3xEBN9jWpWj5W/wov2bH2B7mbSqAdvLEnc=;
        b=E06FqkNbS6YjEIrBEvpa+/LxqH3BaxtsOiiPsSr9cUgi3vaPpYUGU23whVfh02NTKO
         xXwed4icg4HbUnGCoei5LSmJeJ4LzdiJHzHfDpLWNtMCBkxquNSypqhs2WDca1EoZ7nx
         iNNFAPCxZ/KN9eKfrNEz+lmPUiWt44zqM2jJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j+KENCqVT3xEBN9jWpWj5W/wov2bH2B7mbSqAdvLEnc=;
        b=lWp0TY6Gl+96jll1FVop7gTpZqjbMuYTXiNP5nh37qGkzAEkLlFuTMTay4/7zr93UE
         XxuZop5jDAXlPYTFdrkGBnDBkgGIL6VXYrERCl7fkHT1KuMmSIRu/0nCFzBbz8phWMQT
         5VO4Lc0SurPGgYtGQ7pOvnrQ3uWja6aKjiy7fnry/2WcGZNBJt5QOdlX1P/XXpoTcd/k
         RDqIih+T2wHI1t4mQ/ZA/+n1vXfnA5JobBVWusnD3O7CfSs+iKpDxXqOK/BdxRCnOY/d
         H8YPtoEO9lvsfJ4LBtibb8RbuWOq0uDuIks4rKljsBx6DCiPZiShezUseU+foyIuhcnW
         ROQw==
X-Gm-Message-State: AOAM530gHBeNFXt6QVN+Z2M+GpuU8o1+hJjHj+yEOTO18Y92LM4RNjT4
        g88zMh1sB1/CmlpbguzfJ8NRvAk6Y4rFRQ==
X-Google-Smtp-Source: ABdhPJzfOIqcumV/8hoFv9s9RVwLBzrp7kRNo0Ff10XZg1EcBiK2vn51Kx9JFf08Mx85/+vf3DV2EQ==
X-Received: by 2002:a37:7d7:: with SMTP id 206mr647755qkh.485.1612913150788;
        Tue, 09 Feb 2021 15:25:50 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id b206sm181539qkg.97.2021.02.09.15.25.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 15:25:50 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id v5so166745ybi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:25:49 -0800 (PST)
X-Received: by 2002:a25:cf88:: with SMTP id f130mr329107ybg.476.1612913149547;
 Tue, 09 Feb 2021 15:25:49 -0800 (PST)
MIME-Version: 1.0
References: <20210209160946.29382-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210209160946.29382-1-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 9 Feb 2021 15:25:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UnYd5w83xkf0D+ND0nsVfX+RVnr=f=hyLg0j=ERDsXKQ@mail.gmail.com>
Message-ID: <CAD=FV=UnYd5w83xkf0D+ND0nsVfX+RVnr=f=hyLg0j=ERDsXKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845: Move reserved-memory to devices
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 9, 2021 at 8:09 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 216a74f0057c..2f44785d1af0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -153,36 +153,66 @@ panel_in_edp: endpoint {
>   * all modifications to the memory map (from sdm845.dtsi) in one place.
>   */
>
> -/*
> - * Our mpss_region is 8MB bigger than the default one and that conflicts
> - * with venus_mem and cdsp_mem.
> - *
> - * For venus_mem we'll delete and re-create at a different address.
> - *
> - * cdsp_mem isn't used on cheza right now so we won't bother re-creating it; but
> - * that also means we need to delete cdsp_pas.
> - */
> -/delete-node/ &venus_mem;
> -/delete-node/ &cdsp_mem;
> -/delete-node/ &cdsp_pas;

Note to self: on cheza we'll end up with "cdsp_pas" existing now, but
that _should_ be OK since it's disabled


> @@ -1321,6 +1359,7 @@ config {
>  };
>
>  &venus {
> +       memory-region = <&venus_mem>;
>         video-firmware {
>                 iommus = <&apps_smmu 0x10b2 0x0>;
>         };

slight nit: I think it looks ugly not to have a blank line between the
property and the sub-node.  ;-)


> @@ -766,8 +697,6 @@ adsp_pas: remoteproc-adsp {
>                 clocks = <&rpmhcc RPMH_CXO_CLK>;
>                 clock-names = "xo";
>
> -               memory-region = <&adsp_mem>;
> -

Note to self: we're losing the above on cheza, but that _should_ be OK
since the node is disabled anyway.

Probably not critical at this point, but it makes me wonder whether we
could remove adsp_mem on cheza...

---

So I only looked at the cheza and sdm845 changes and they look fine to
me and this seems like a good change overall.  I'm assuming that folks
who focus on the other boards will double-check your work there if
they care or just trust that everything is great.  ;-)

OK, I lied.  I took a quick glance.  In "sdm845-db845c" you maybe miss
adding the "memory-region" back to the WiFi?  Have you tried running
something like this before/after:

for f in sdm845*.dtb; do   dtc -I dtb -O dts --sort $f > $f.dts; done

You've gotta ignore phandle ID differences but otherwise it'll point
out things like this.


-Doug
