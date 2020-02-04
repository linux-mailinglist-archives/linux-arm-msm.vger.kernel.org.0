Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D884C1520E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 20:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgBDTOZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 14:14:25 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41771 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727542AbgBDTOZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 14:14:25 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so19823861ljc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xr0ABtZ2DkqqEMCgDeVZ+5kKZ+ttSxGzoRZ9d91wwmc=;
        b=Scz3T627yE0T1ugx7bHnYWhVoRntUUtHlMZ/6w7/ZnS8GhxiZFF98xPek3uyw3TGq3
         kK+omwOTaa3adO6c11xb5lChggWabb0seE/qgnlBnRzWlpCBd2xLvh8aI7Dbfp4ezdnI
         6NIq57R7SHS96cvsv+KfLnyuIRReuLWMvFcKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xr0ABtZ2DkqqEMCgDeVZ+5kKZ+ttSxGzoRZ9d91wwmc=;
        b=oad12pNMBGoj44qQUO2iP2sfBy42/DucvYs5XaE7RUlab7hR87WhcNqvxd/ktBAR2f
         sYiZKhm/b6ynrpKnQNredJ0DjPqmyXlrUbEmXbhieuF2M5eSAavyQE9ZpRB0v0fR7b6j
         ZPaZ0sYuArNawGjiPhEqsRmh+yglx3dMFm6LVgBmWj+lwq+wVKcTIW1lKtvtMCIT21fP
         qSvC/xVsA0VbXOPuSFj7pDLZUN5M7naBxhrJs7QNtfY+co1jxPjG9e/oCA2NvItSiDrn
         DR/cfWOxogfZhsAk0+soXtRieHpFVr/vjw7iqqx95hjfFdFXo+CtVnKRQIMOJ1pIopie
         AX1A==
X-Gm-Message-State: APjAAAUYg3tLFbBs1V68GXa8fx9N+z2mMHLdYEgpy29X0vsw2zA2fcqg
        40ONmGm2Syw2+uxy+mcmwryj63FiDmE=
X-Google-Smtp-Source: APXvYqzn7ngjHTJngkb68JSOUNdTDQqA4Zs2RTFPMwofIlR7aJlWtHOmIRN5LOI48PfEIzv11wEwbA==
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr18066107ljk.228.1580843661199;
        Tue, 04 Feb 2020 11:14:21 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id r9sm12781342lfc.72.2020.02.04.11.14.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 11:14:20 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id x14so19767559ljd.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:14:20 -0800 (PST)
X-Received: by 2002:a2e:3e10:: with SMTP id l16mr17840298lja.286.1580843659748;
 Tue, 04 Feb 2020 11:14:19 -0800 (PST)
MIME-Version: 1.0
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org> <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
In-Reply-To: <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Feb 2020 11:13:43 -0800
X-Gmail-Original-Message-ID: <CAE=gft4DAe_ck+j88O274-2MgeES9aA1qi8C4ruk0Mdf-FsMog@mail.gmail.com>
Message-ID: <CAE=gft4DAe_ck+j88O274-2MgeES9aA1qi8C4ruk0Mdf-FsMog@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] arm64: dts: sdm845: Add interconnect properties
 for USB
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-usb@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Chandana,

On Tue, Sep 17, 2019 at 4:11 AM Chandana Kishori Chiluveru
<cchiluve@codeaurora.org> wrote:
>
> Populate USB DT nodes with interconnect properties.
>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..e4885f3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1837,6 +1837,12 @@
>
>                         resets = <&gcc GCC_USB30_PRIM_BCR>;
>
> +                       interconnects = <&rsc_hlos MASTER_USB3_0
> +                                        &rsc_hlos SLAVE_EBI1>,
> +                                       <&rsc_hlos MASTER_APPSS_PROC
> +                                        &rsc_hlos SLAVE_USB3_0>;

You'll be racing with David's series here to split rsc_hlos out into more nodes:
https://patchwork.kernel.org/patch/11326603/

Do you want to just base yours on top of his and list it as a dependency?
