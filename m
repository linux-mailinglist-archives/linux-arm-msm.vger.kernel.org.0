Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8D62549CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 17:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgH0PpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 11:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0PpH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 11:45:07 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5DFC06121B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:45:06 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id n12so1347544vkk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HdB0pPDBq5ZlSvrIwz1JATX0kjJ8iII0iAds3ECexio=;
        b=jySuFVeeNbfR2c8zFN2XhnZFz/Wi84T9HhLrjTppcXCO4HGJwh2J0jsBunahfcPJy9
         pL+NE+pzbJv77HHBDPaunvCXm1mDBE7bn5LNsLJBF9QYy9jlrJBPLKdvMLnF4Pe+eH6y
         Vi0Rc/SAcjS4gaT0/eKBgAGHG6eJJcNb0xq+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HdB0pPDBq5ZlSvrIwz1JATX0kjJ8iII0iAds3ECexio=;
        b=fDKWe+Oe4Z7t/Ud92B5mJkMJAKOCM5yJ19oFxqQNVTKLeUxBAGhnzoJdlRvrkiJwzn
         UlFZ3QlJ57HouatAKd1HDqhHC0NiQsBZRMdPPmloo2g+pbkBJnE7liMmPLNKGyVNHDjZ
         YTcpnrIW7Mdl7EpDZzAjLhBCitnx8WHasp9KR1RNqxAL1u3OjhFoWWejMpgJOJMWC3R1
         podf3mP9e0YMrNEUHaqFyIhJDbfiI50HtwMSCyQSXePiPQVy0CsAPXrKLVj+Mvl4Zzi9
         QxspjZWIXuUAU0qf3yiamrGmhcXqN6w8YzqCAsVyK2+gXPhpJJOpWMycPFyErAOAyUpl
         UkDw==
X-Gm-Message-State: AOAM533lfQPfVOF3JYBXtCJnYc9WYoQTArbc17el0lxkA2pSE0tISin1
        p0NjbDgR1hubEP39Px7zXU1X+m2GD9ffRw==
X-Google-Smtp-Source: ABdhPJwu1P0mJnW9/SDeRYYEkdaGpM4lgl9NX9vBxJoSyonN/C5MDeWbMP8f+NoN7erGmYPkmA4dhQ==
X-Received: by 2002:a1f:dd03:: with SMTP id u3mr12948431vkg.84.1598543105938;
        Thu, 27 Aug 2020 08:45:05 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id o16sm463431vkn.26.2020.08.27.08.45.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 08:45:05 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id g11so1804172ual.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:45:05 -0700 (PDT)
X-Received: by 2002:a9f:2b89:: with SMTP id y9mr12664378uai.0.1598543104976;
 Thu, 27 Aug 2020 08:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200827084102.1.I7a5f56b411071eeecae84b7e33981d39170ccf2a@changeid>
In-Reply-To: <20200827084102.1.I7a5f56b411071eeecae84b7e33981d39170ccf2a@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 Aug 2020 08:44:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4f_aUn2N91yCNXyjTJJkrCaGH-gk_pJeCDJHXPxh=nw@mail.gmail.com>
Message-ID: <CAD=FV=U4f_aUn2N91yCNXyjTJJkrCaGH-gk_pJeCDJHXPxh=nw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: We need to restore_dll_config for sc7180
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 27, 2020 at 8:41 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Although sc7180 is supposed to have a hardware fix that means that we
> don't have to restore the DLL config like we did with sdm845,
> apparently the hardware fix doesn't work in all cases.  Until it's
> understood under exactly which cases we the hardware fix malfunctions,
> let's go back to restoring the DLL config whenever we do runtime
> resume.  This is safe and gets things working again.
>
> NOTE: we don't need to introduce a whole new "struct
> sdhci_msm_variant_info" for sc7180 since it would be exactly the same
> as the sdm845 one.  We'll just refer to that one.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/mmc/host/sdhci-msm.c | 1 +
>  1 file changed, 1 insertion(+)

Sorry for the spam.  I was too busy debugging and preparing my other
patches and didn't realize that Veerabhadrarao was sending at the
exact same time.  Let's take that one, AKA:

https://lore.kernel.org/r/1598541694-15694-1-git-send-email-vbadigan@codeaurora.org

-Doug
