Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60D05163759
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 00:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgBRXiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 18:38:50 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:38834 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgBRXit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 18:38:49 -0500
Received: by mail-ua1-f66.google.com with SMTP id c7so8152181uaf.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 15:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=STt86kT4bIomqkWX7kK7v+xFHLMvCO0zF5ALqd2qVx8=;
        b=qEnT1vFyTK7eaXgmzlPUVdSAiKuY8xrrhI2Z2il5i3x7u9Z7eNdil1N1YK972yxMRU
         Pq78PZY4iyE1lERtE9Hg+RF6s4AqyI/aQwUvXJaSi/DX6ynP108DL6EM2AAM/m+Wlgto
         uVeV8DkZZosrpYDwWPGEed5Wpa5dYDqsSwV7iUsiWgK/dp0dhLryM2ZTaA6ZKxcMyV91
         iQaP5QHBD3eYnG0G1xEmbvx51wYfPBg3bTGCeLLx1XCmFelc4Ffn50OaJ16U1eyXIi5n
         BvDbb/QmBS9VRVql8KDQppgQ4hYqVLsmxksGE6ChdCphxutANv0fX0iRWPSvyS2E8kB1
         3Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=STt86kT4bIomqkWX7kK7v+xFHLMvCO0zF5ALqd2qVx8=;
        b=FbAqa0MYSgi/Pi7xTNRWeuA65edvjl1nsS/d+Mmc3e2U3JcG5ZSHlH4sVem3/aHVlb
         Y9n4tYGGmYO604LFp/5F/ZzF+QebgLtZx2a03F1XvYPVVU1zjUamC2Eqhs+YIFXTZ1TF
         nkS0td+9VoI1z6tz8Vncq0DyOk6iPU7GAhfR98L4/+KpupaxAGvln8vZgQplaWd5NVgM
         JbNVLVz3VSJ0gDoQ2HqXWz1z4unoiAmbRx/G26SB/fCtyAFi1DiH1zi1tzDSMgxKdorR
         mO3Q9Fo2qxU6qCCG8A8C/cjWNpX/KbCEdGx0EdN7kzPj1utfRuiR7HgSte+c2In0V21D
         sGqw==
X-Gm-Message-State: APjAAAUI8LswcresAlBsFQAUlWTTbvBaEsH07I8oXYa4MA3cqikCXlpo
        hKko9uadre83/VuP+Wzxzp1M1AevDl87yHnuCg9A/A==
X-Google-Smtp-Source: APXvYqw9nAEG4kehq3otvKosRpBxqlAYUQpULzm3ZrGhrEPplUrNSJAyvqsnKDebS1ASeoR3ujqz2wpKnBvfEneuHNE=
X-Received: by 2002:ab0:20a:: with SMTP id 10mr11762057uas.19.1582069128757;
 Tue, 18 Feb 2020 15:38:48 -0800 (PST)
MIME-Version: 1.0
References: <1581062518-11655-1-git-send-email-vbadigan@codeaurora.org> <1581077075-26011-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1581077075-26011-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 19 Feb 2020 00:38:12 +0100
Message-ID: <CAPDyKFo8eDAwE70FNhsiZ6mRRKi6gkx+VtmJ9SJ0mAWuVFjKzA@mail.gmail.com>
Subject: Re: [PATCH V2] mmc: sdhci-msm: Don't enable PWRSAVE_DLL for certain
 sdhc hosts
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 7 Feb 2020 at 13:05, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> From: Ritesh Harjani <riteshh@codeaurora.org>
>
> SDHC core with new 14lpp and later tech DLL should not enable
> PWRSAVE_DLL since such controller's internal gating cannot meet
> following MCLK requirement:
> When MCLK is gated OFF, it is not gated for less than 0.5us and MCLK
> must be switched on for at-least 1us before DATA starts coming.
>
> Adding support for this requirement.
>
> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Applied for next, thanks!

Kind regards
Uffe


> --
>
> Changes since V1:
>   Condition was not correct in V1, which is corrected in V2
>
> --
> ---
>  drivers/mmc/host/sdhci-msm.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..aa5b610 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -977,9 +977,21 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>                 goto out;
>         }
>
> -       config = readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec3);
> -       config |= CORE_PWRSAVE_DLL;
> -       writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec3);
> +       /*
> +        * Set CORE_PWRSAVE_DLL bit in CORE_VENDOR_SPEC3.
> +        * When MCLK is gated OFF, it is not gated for less than 0.5us
> +        * and MCLK must be switched on for at-least 1us before DATA
> +        * starts coming. Controllers with 14lpp and later tech DLL cannot
> +        * guarantee above requirement. So PWRSAVE_DLL should not be
> +        * turned on for host controllers using this DLL.
> +        */
> +       if (!msm_host->use_14lpp_dll_reset) {
> +               config = readl_relaxed(host->ioaddr +
> +                               msm_offset->core_vendor_spec3);
> +               config |= CORE_PWRSAVE_DLL;
> +               writel_relaxed(config, host->ioaddr +
> +                               msm_offset->core_vendor_spec3);
> +       }
>
>         /*
>          * Drain writebuffer to ensure above DLL calibration
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
