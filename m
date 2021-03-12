Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D7F3398A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 21:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbhCLUr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 15:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbhCLUrl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 15:47:41 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2609C061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 12:47:41 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso11298544pjd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 12:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CaKbe7bADOn54cyXzVoag8Ux2eG3O4D4Z7StlDGKIr8=;
        b=gmoPElK/vohvjAY6Up6aCMkeb7xmZBKAbBwsBSqF7ahsMjYFbh3ebnP+1NGClZbAU2
         1itqLBic+7831voqmaouTKH75xqLoHqocB2qRchifVmu+a1nfkH+3VvfuT5Wk8sup2LJ
         ficeaz4rTvQKZmrgipjnVBoR/nVs6qOWcsgn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CaKbe7bADOn54cyXzVoag8Ux2eG3O4D4Z7StlDGKIr8=;
        b=dDNeSwwVpY5cxYBv3FtzaLKkM6Zbe3fMEgB64idI6qMoCJ6G9If3pWWEmGmGThd/La
         a7WEk7XZg1Oo+O0bUcUCx15vSLGT/QctpmIDsavnmPXo6sLendog3lUotOKhoyzG07JV
         8Qc95IYntJmsThbfn4fMcz0BhouzqBLlez0t3pGLb2HOmuU8cVNREnh+ZVm5gRgzDPGA
         etCMZiqKScmkK2gs8KoROtrG33zRRJu33PKCb+aJ7peZY7Dx1hPIEbK40RDrrqr+aarN
         Ip1EKKwxJrnkoq/gQbwGe/bpaUn3+Uts/FWHPcQJdftxqCAwcihKhQrinCL3rPwe1rKZ
         6EbQ==
X-Gm-Message-State: AOAM532RAUV+/GpFGHr/c4cCgYjlQ4/KO+hFKUP68ao53shNwBAHcS0s
        bV/31Q0IVTFkGj4MCbV7uhu0D1fH+3VLxw==
X-Google-Smtp-Source: ABdhPJxF+dEafahhWIvMswiNKD/aT2IklzwVrJtgo+entaw/i9haJhxb3ohAYyGxu3bJZ5ZqPeogKQ==
X-Received: by 2002:a17:90a:af8a:: with SMTP id w10mr137519pjq.114.1615582061258;
        Fri, 12 Mar 2021 12:47:41 -0800 (PST)
Received: from localhost ([2620:15c:202:1:914f:6483:1dc:1bba])
        by smtp.gmail.com with UTF8SMTPSA id q19sm2053421pff.91.2021.03.12.12.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 12:47:40 -0800 (PST)
Date:   Fri, 12 Mar 2021 12:47:39 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
Message-ID: <YEvTa0+VC2XSO048@google.com>
References: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 11, 2021 at 04:10:29PM +0530, satya priya wrote:
> Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
> GPIOs, RTC and other PMIC infra modules for SC7280.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> This patch depends on base DT and board files for SC7280 to merge first
> https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
> 
>  arch/arm64/boot/dts/qcom/pm7325.dtsi  |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 104 ++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmr735a.dtsi |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi  |   8 +++
>  5 files changed, 292 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi

The subject 'arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280'
is a bit misleading, at least for the git history it would be clearer to
to split this into per-PMIC patches and one SC7280 patch.
