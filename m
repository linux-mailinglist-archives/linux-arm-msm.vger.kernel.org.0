Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8435D44BC03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 08:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhKJHSi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 02:18:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhKJHSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 02:18:38 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EA6C061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 23:15:51 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso2600486otj.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 23:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=VRWwS7SDUq5/u0qH+G+eAJsIAtMU46qnSif9RsXhd4E=;
        b=YsBKj5LEICDTIGHcmEWeDCXKxIriw2YxwNBb8j81RUjEyRw5P1IYipbqLCyTnjSBSq
         xLDxcqkDY6e+HCTZAxbtiTyibuLQ0ZrGlcPTXdOLyFrt/kGfpHuyWpMXZuBJY0+UGJRP
         O7y6O3yNYcSv/3fXd+L4/HfEbb7BEMhRU/A+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=VRWwS7SDUq5/u0qH+G+eAJsIAtMU46qnSif9RsXhd4E=;
        b=8NA8zGz1Y0aI6CWl8PdS5+oh3nZ8gb4JX3nTP8j2O69kFm9ZZ1TzNJXTuaRIS1R6+N
         aTXjZhlJwi7JIugc/DwfykA/bphFXlapqDLL++E/m0xikTnoGKPOJEAXu9wseHvz8KYO
         0VMoiDdKl+sPWUs/JyfnkvjJhl//5b0JaF9JfumLI6YsZ5W8nus3/8TD7ouxNtwROydu
         i/AJ3yohzallJSs+2E12azctf8TABaQetAtefrbny1+pV82vENEvZ3g2izQRIhWNqp0x
         rs6CbEKJYDkQy2Pgi3ORW8FhtTBFoifxxbMTOQXZQZh1dOOCDqYNCmuNyu/600HL8gTD
         hv4A==
X-Gm-Message-State: AOAM533NwiFnnZ90rSoTlf7gQdqpKcPt+jI6oQ/BOlOvZjiJvHKT41sy
        XN5sTogFRBzd/33zLnM/GM+/iVQvYdbYYUmHZ8dU3A==
X-Google-Smtp-Source: ABdhPJxgCgtZP3pi/X0Y2M2umWbuDvR7EtcUTfJQgGJtJs8gpv2QSoWMUURg7Tjl3uIwoWiqKw5X5LbeHwYCGSrjXxo=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr11128835otl.126.1636528550416;
 Tue, 09 Nov 2021 23:15:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Nov 2021 07:15:50 +0000
MIME-Version: 1.0
In-Reply-To: <4d03c636193f64907c8dacb17fa71ed05fd5f60c.1636220582.git.christophe.jaillet@wanadoo.fr>
References: <4d03c636193f64907c8dacb17fa71ed05fd5f60c.1636220582.git.christophe.jaillet@wanadoo.fr>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 10 Nov 2021 07:15:49 +0000
Message-ID: <CAE-0n53JEwvFT9k19GZ46GooqQpkb=_hMz6GJu_zuHxDwfbAxA@mail.gmail.com>
Subject: Re: [PATCH] PCI: qcom: Fix an error handling path in 'qcom_pcie_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        kw@linux.com, lorenzo.pieralisi@arm.com, pmaliset@codeaurora.org,
        robh@kernel.org, svarbanov@mm-sol.com
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Christophe JAILLET (2021-11-06 10:44:52)
> If 'of_device_get_match_data()' fails, previous 'pm_runtime_get_sync()/
> pm_runtime_enable()' should be undone.
>
> To fix it, the easiest is to move this block of code before the memory
> allocations and the pm_runtime_xxx calls.
>
> Fixes: b89ff410253d ("PCI: qcom: Replace ops with struct pcie_cfg in pcie match data")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
