Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4E2A50B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 14:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbfFXMvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 08:51:43 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38395 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728373AbfFXMvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 08:51:43 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so13239407wmj.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2019 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=V3PN7+Kr/tucktHOq459ffhVuFT8vFVeNdn3CWQcOqs=;
        b=TvXMMqynMJ9F3R8PSllCw3D53Zv+6ul3QP1YWFwld//r+zWK/6tW2Cg1h4EEU5f2az
         na4AjvEKtFLrIPOSdpBSAGuAgvhEeRkZ7S/iQlwZ1vFDkqqgfvOZ+FLpkHVwgj6nC7pU
         nuL/7FbuLNJ514VttRDd9EvuasI4d1R7u+5vz0gEjKWjANT2gVGfOcxe07DIG2e7w+q0
         4o8hgviHyZN9wIXbr63XDzpmLEvB8p+ffPJiRKyr6ci7o2jM3nEg5OmlvOOCnwXvMzW+
         /tK/hki6IwlCPeqrFvT6/a+BbGyewJWs561wIY77L7lA1zWMJhdGlyjVbT5eCwlcSOPF
         +A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=V3PN7+Kr/tucktHOq459ffhVuFT8vFVeNdn3CWQcOqs=;
        b=pk19dzShelqCaBgjZ0f8tjziMWh6juckhl+jgjoIAEOL83SUYnSCAZDjOYk51WMgX0
         MEx4H/3c9pVUVHamVjDQQSUIqAGfqMbxNmPFTd3RFxyRZ3WX1Qx5elHc09jaP1Qn6awi
         2jcFBBX7Pym6sqZsq6NfRR7SCBNhqrmb1MthmRZrcOV8rfBBfLi8REBk/Xna80PCGn/V
         TbPb9sd51sjkV9se2Ntx/7P1XtfO1r47rxlePvU1h8TWIrsdz8MEkCwmw/Pdj+udtOMO
         a3QJH3Aa992XT+FIKclZY9jMwCHmgS5s8sce1ExNTCLgeFTI96KMsnhxcBs4hthOEHQ+
         nj1Q==
X-Gm-Message-State: APjAAAV2l+ftei1kLZlv4ykqANmr89xcN69Ulkho8j2PgMu0OX999QIg
        uM0Gms1LkUQxaDWoM3ZxP6QWlg==
X-Google-Smtp-Source: APXvYqzSzSl6fHZHf0Jw53i1jb2T7E8JBP2SWlv/T63vVd+AKTU/rUYev6uqlIbbsKy+8FkpZfvlqQ==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr15115318wmk.36.1561380701751;
        Mon, 24 Jun 2019 05:51:41 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id 203sm7917884wmc.30.2019.06.24.05.51.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 05:51:40 -0700 (PDT)
Date:   Mon, 24 Jun 2019 13:51:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Fix CONFIG preprocessor guard
Message-ID: <20190624125126.GF4699@dell>
References: <20190621202043.95967-1-natechancellor@gmail.com>
 <CAKwvOdnP+XMn4BMHRcFeO=TCLxjhKk5NBrpmSyZnsAtwFj+gTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnP+XMn4BMHRcFeO=TCLxjhKk5NBrpmSyZnsAtwFj+gTw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 21 Jun 2019, Nick Desaulniers wrote:

> On Fri, Jun 21, 2019 at 1:21 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Clang warns when CONFIG_ACPI is unset:
> >
> >  drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: 'CONFIG_ACPI' is
> >  not defined, evaluates to 0 [-Wundef]
> >  #if CONFIG_ACPI
> >      ^
> >  1 warning generated.
> >
> > Use ifdef instead of if to resolve this.
> >
> > Fixes: a229105d7a1e ("pinctrl: qcom: sdm845: Provide ACPI support")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/569
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Thanks for the patch.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Interesting.  Thanks for fixing.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
