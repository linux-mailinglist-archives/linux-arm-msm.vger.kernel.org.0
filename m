Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 692C819CC79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 23:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731783AbgDBVjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 17:39:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44889 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729549AbgDBVjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 17:39:22 -0400
Received: by mail-wr1-f65.google.com with SMTP id m17so5982204wrw.11;
        Thu, 02 Apr 2020 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OA8flzRmQncqENw/jnCzgwT3+26RLddE5UjILgqgsE4=;
        b=eT0LV6TgcgJm+DZJburRzEYwkFyzpCGlMmoumt6PWmM3BId0R9Pv4MQfcLHg2MBfWJ
         dcRvNq+BRBXZofY41aCBEND+HjRlQzbSoWKrAPNGLzLLhfjyPCCDGH3VFWc4vCSGeZ2I
         D9eAsMTl97FmMJiDveInl8wpDOWEnGPTw9poSIvUpEinaAlDn4tJs974Or+AINJVvxZk
         3VH2+EfhxyQaXsYpmCJE1DZ+hp58cQiM03hrifWQUSCbU1Dw+cFZxHWlOwQtrjqLK6NM
         yzqtIaFxbv1BEuerQRPTYNkSIBNWZZq/UhdIpYwdQ9uZyi54SufKE/RQwJWrbJlTkTrz
         oPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OA8flzRmQncqENw/jnCzgwT3+26RLddE5UjILgqgsE4=;
        b=URF6OI50ZlPfL9/lLDjZmU+Ulc63ExdjBIUuR0YDdRZgm7UPqyJ5tmkg9LxfyIgY17
         zQdLiPgBhK6F+PzOgJT03UnV/t8UGxJUVNkJPnbF+ki/pkO33UPQ3KHnwq/H0UUbx0sT
         JrPe65xDeByH+cDQjztHYEw+eWjDgmIYcIDlaYaWXnXfjByrRTOUSlLih2BedmMatCjD
         hlVHCfKGh089N5Sbg8cKbMA0h+1kDXZfTX0IBmpaYhKQaPASMu/yOH2K19zDf3Ck9bU0
         R81KO6Ldjgffz82t0Vd2kNhPRnoy5SMZYxckjzs6bM+kpstYbBjmwt6O+RlsGmP48pji
         ji/A==
X-Gm-Message-State: AGi0PuZZZ2RYw+Omp+g46QdcQbVowceBJS/FEAObePBEPX/DAa2JA6z/
        4QoMoiT/BpnkYhGrzwlaqc0H1AzXCPAm10PNLiA=
X-Google-Smtp-Source: APiQypJuTFrgRQAeVmtbnKPn1dgb35LqrQlb2cAktYsh516o9IjqYj4O3qFlEtrd3ltgtSYzQHXrBASKQt/2YWYWn9o=
X-Received: by 2002:adf:e90b:: with SMTP id f11mr5417665wrm.65.1585863560277;
 Thu, 02 Apr 2020 14:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org> <1583747589-17267-4-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1583747589-17267-4-git-send-email-sanm@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 2 Apr 2020 14:39:08 -0700
Message-ID: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 9, 2020 at 2:54 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
> @@ -774,8 +774,8 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>                 .compatible     = "qcom,msm8998-qusb2-phy",
>                 .data           = &msm8998_phy_cfg,
>         }, {
> -               .compatible     = "qcom,sdm845-qusb2-phy",
> -               .data           = &sdm845_phy_cfg,
> +               .compatible     = "qcom,qusb2-v2-phy",
> +               .data           = &qusb2_v2_phy_cfg,
>         },
>         { },
>  };

Just as a heads up, Yongqin (cc'ed) reported this patch (now upstream)
seems to be causing trouble on the db845c.

It seems like its removing support for the "qcom,sdm845-qusb2-phy"
compatible string, which is documented:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml#n23

and already in use:
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845.dtsi#n2389

Should this instead have been an addition of the "qcom,qusb2-v2-phy",
line instead of replacing "qcom,sdm845-qusb2-phy"?

thanks
-john
