Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542E53EADCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 02:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbhHMAQi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 20:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhHMAQh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 20:16:37 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015D3C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 17:16:11 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id c2-20020a0568303482b029048bcf4c6bd9so10064763otu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=JOTNUTQtU5ZZqRjDa2leuDXvXu+UguId06UQDSUoMaY=;
        b=U34dVhVaT3zF39gkIHSPg+32QxpezmxMHXTM4kxM96GTjtRmBW82CpPdmpJYB7o89D
         Z1oYR+gbPbBvLkLJ2aCXIvuVV4IJyfsqoVGxna3m7XTeVXZMPGQV1fGnU3Vvw+1Op7wj
         WoFd/sfxE/7/s4ifnBnipPEtoyujIf5CmQ4hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=JOTNUTQtU5ZZqRjDa2leuDXvXu+UguId06UQDSUoMaY=;
        b=eIsUkW6Iqpuf8dEZwpk6cnnhc86z2nU+OvBNrK/aR+HurgtJ9ozVWQJ59WvSyL0q1p
         /Wld5ErFX6qQNW5ugdwr4XsAlfXIxGDJBv4Dc2iO+cM17cP9q8RyvFm3m62r8T3RS+ZZ
         J2hcG5nun1ff3i7HPUzgjmolZD0ozz42JA8R6Eok/+eNNMCb3zZMiBx4992rNGiF5dTs
         GNFDgTDGJQ1Prib3o7jxwhnb4ARZh6RDWISNcqtP/H8TWAJiHMYhNkb6rS8GDDmLcl6O
         wjx/UFt7Ct5sia2rBK60DuENW3lJ6gGzTtNleiVSKP9E5bodeKqgKP+U3n6rYcWSROyI
         gmGQ==
X-Gm-Message-State: AOAM531tSW5B3qH4Fob+/Lfw3qRkzDmK+blj5lQPqwCGS5PaNG/J8wlr
        WvI9lIsT6udTf/EUv/JBpdAzG/FU0Tw+3met319pkA==
X-Google-Smtp-Source: ABdhPJyGw6k5PFLsnsOyl7Kmiduldcnpb0fSaQSLgzTNUwqyZFiIfuf7jf/HDXtWRziaY1h9dXsGZoCKmV6WwauiFbA=
X-Received: by 2002:a9d:69cd:: with SMTP id v13mr5461893oto.34.1628813771273;
 Thu, 12 Aug 2021 17:16:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Aug 2021 17:16:10 -0700
MIME-Version: 1.0
In-Reply-To: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 12 Aug 2021 17:16:10 -0700
Message-ID: <CAE-0n52PzadMxB_4h2DGJGLO++Bu_PCSsxS8NHe+cuhv=Mw0sA@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: qcom: Add download mode support for QTI platforms
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-08-12 02:17:39)
> Collecting ramdumps on QTI platforms mainly require two things,
> SDI (System Debug Image) enabled firmware and kernel support to
> configure download mode cookies and SDI settings. Ramdumps can
> be collected once the system enters the download mode. To enter
> download mode, magic values or cookies need to be set in IMEM
> which is used by firmware to decide to enter download mode or not.
> Download mode cookies remain the same across targets and SDI disable
> register needs to be set or SDI needs to be disabled in case of normal
> reboot since ramdumps are supposed to be for crash debugging and
> not for every reboot. This series adds the kernel support required
> to enter download mode.

I don't recall if we discussed this on the list, but I'd really prefer
that we don't make kernel changes to support this beyond implementing
PSCI SYSTEM_RESET2 support and then some sort of vendor specific (or if
ARM is willing to update the spec then ARM specific) reset command on
panic reboot paths. The idea is to set the cookie in the bootloader
before the kernel is booted, then any insta-reboots/watchdogs would go
into download mode, no special init code required to lay down the cookie
or clear it on normal reboot. The normal reboot PSCI call would clear
the cookie in the firmware, in case something goes wrong after the
kernel hands off control to PSCI, and then panics that want to go into
download mode would make the SYSTEM_RESET2 reboot call into PSCI that
sets the cookie.

Maybe it could be a linux specific psci number or maybe we could
configure the reboot call in the psci node to be this specific number so
that it can be different based on the firmware implementation if
consolidating around a single number doesn't work. Either way, that all
seems manageable and we can keep these cookie details out of the kernel
and the reboot/panic paths.

>
> Currently this series doesn't add support for android targets where
> a couple of SCM calls are required to set/unset the download mode
> cookies and SDI configuration but can be easily added gradually to
> the same driver, so as of now only chrome platforms are supported
> and tested.
>
> Sai Prakash Ranjan (3):
>   soc: qcom: Add download mode support
>   dt-bindings: msm: Add QTI download mode support binding
>   arm64: dts: qcom: sc7180: Add IMEM, pil info and download mode region
>
>  .../bindings/arm/msm/qcom,dload-mode.yaml     |  53 ++++++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          |  21 +++
>  drivers/soc/qcom/Kconfig                      |  10 ++
>  drivers/soc/qcom/Makefile                     |   1 +
>  drivers/soc/qcom/download_mode.c              | 152 ++++++++++++++++++
>  6 files changed, 244 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
>  create mode 100644 drivers/soc/qcom/download_mode.c
