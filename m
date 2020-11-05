Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93152A803A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 14:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730873AbgKEN7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 08:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730853AbgKEN7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 08:59:41 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BC8C0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 05:59:40 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id s30so2436734lfc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 05:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qCrN31ShCh5kklAu2ybIlh671dbzV48lSFSfynZtC2g=;
        b=j6KSBm+wjUlygW1EdRVrx0blw6jsHzSB5/CgOkXRCqH/NcuFNb1htk1kDeF80U3QJK
         vSCEymduhh7Cley52uGQ6m4mfhRuSTyUdCQDwWmLU5QZLFNcN2hrsebkrNkSx34mTibg
         zog7uZxwmycHyHzro0eilsHPofHCjZWg83ydatCFTyFmWNEa82wIXlMxaykBLwYggeR5
         jdNsg5wwO1mjk7gc3QWwrO5R8Qo4l1uSQlIBi0Gvz+ShWTDfIRWIi553lxvFpf3m7FNN
         8N8uZXEzZLkKXcxNNrwLh94zQrE1bCPTIPgp/6JYcIGmbvoasQ6+0Z0x8STUwF+7QCqX
         Xr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qCrN31ShCh5kklAu2ybIlh671dbzV48lSFSfynZtC2g=;
        b=NRBB68gg2MCfLjiwTOyD9YDKNS9TbaQtETp6rXqczdxYHjK/r2lp+ynwYK/wcG0O3o
         5Mb3O3bHSCiKBtf//mixf3P9cKpfpyAIYGxZ+NqoaC5mujN4ds5e1kJ7qb+Xpm5/zkIP
         lIHrvVM4fmirvI+wRLldA2UUpbLAckz+lEPGADDXPucEfRUQljM/9Eg0+fXYEsjhXUMK
         X94HwKtBIFMzZCejFT35mkDamw/GLlI9/rR/pFRjx68F2xZtivqbwba2RkiQJRr+UYv7
         nOuZdIUu4Aq66BWG5NcZ4NuMKpQ57zVpR8Iz7In0toDhpegnamcDYQUidXR5wvRX7fJl
         LwLA==
X-Gm-Message-State: AOAM531lw6DA/oM47mLfu4TlN3fFvb4pA2/Pmr06tyhmj4kf0Ny6CB6t
        6mtL1JObLquTdZa+wpAlm4BFlBZpkxnSiqDCYY4IxQ==
X-Google-Smtp-Source: ABdhPJw61W8PpYTmFeXsj72HbktXi8an2Ur5ijYtczp7vaWIvD5508dx6WXNwKxjaYVfl864h4lBwtpaJA4elHNr3dw=
X-Received: by 2002:a05:6512:3225:: with SMTP id f5mr992749lfe.441.1604584778531;
 Thu, 05 Nov 2020 05:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20201028043642.1141723-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201028043642.1141723-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 14:59:27 +0100
Message-ID: <CACRpkdaBbdC5_6y=w5eL-jJ_Mk+toKWy8kj9t-UWx02wNfjo+g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm8250: Specify PDC map
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 28, 2020 at 5:36 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Specify the PDC mapping for SM8250, so that gpio interrupts are
> propertly mapped to the wakeup IRQs of the PDC.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for next (v5.11).

If this is urgent and needs to go into fixes, just provide me
a Fixes: tag and I will move it to the fixes branch.

Yours,
Linus Walleij
