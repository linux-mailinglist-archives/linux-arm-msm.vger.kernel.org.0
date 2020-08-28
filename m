Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11A92556E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 10:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgH1IwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 04:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgH1IwA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 04:52:00 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93666C06121B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 01:52:00 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id a13so192362vso.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 01:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGxtYBPD+M7A3hG5URJbggJEp30nXeyRj7o2sufbJFo=;
        b=pEQTNbxfgVk1crBVAAq+DT+XH/7KVlHeBnhnGKSSOvbxXPpIwuDBqYR53hNOAC6Hse
         YPt7arHE0Qe+MAO6wzg02ltymO59g/IEXt3CogEMy8VIxcGCHTeqco8Ib6KpUhQUFdQ/
         KhjkYwBCqLfobpLUp6J992Y4KWw5PqXHBkVAvR5B+WhPVug3pecRngevakYFK236jvBz
         tUYIPXYgWvKYSQC/u79M34kHmUJ4qcuPCigKSQSEVdT6TtIOqR9StLXkDO8gHNsnyrSo
         sd4U8T1zQ8xDIjphvO2E4lRAkRxbyPu09xqoA6BZvm1aEyt8aEsKNxa4QqKBgOxb8ut6
         vICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGxtYBPD+M7A3hG5URJbggJEp30nXeyRj7o2sufbJFo=;
        b=g50qdq9ctA0jlM5lWB5C1hic1Fdg0xybrYmMXDgBF8oaD/8uP8Cx54JsLnwFvbbTs9
         mI+mOfjB0D7e0bRtlHYCxTowOMXdY2D2LWzRVM5w1baHSkkc8+Z3rvAabzYP4JwaCH4/
         Tpl6qwcOYPZbL8ZriYRNkJJJPZBPpOKOJecS7D5NuhB+151DQRyZ3l+cu/UoMX7OwXYx
         fznMsO7mVbBps2pP9N7yRTPNquQ2wfLjd7T+dmJo0iTqoXbsN9WdHt4r5xOCTXPCyxRi
         Gp2T8r8MbO8Bj0YnXilmy+cQ5JpOrsjF18s+LAkDGPZBGYJkPjYCH9jcIdveYbZ2itBL
         n0tQ==
X-Gm-Message-State: AOAM533EC0+AHgZTUveim5hcveM4g+jpYELk3g4/4O3m31IOilmHeTMs
        BGJnFNkpYXqTN19CT3swOoJD3pAz37PsKpf6AoZK7A==
X-Google-Smtp-Source: ABdhPJzDb5J1o21hjT6N6rKSgFOYrBJEINonAqt8NbLnnHDhzE37j0/ZnvW7bk1wBrBdiEXQPASpOYIx8hw7Th7++6Y=
X-Received: by 2002:a67:f8ce:: with SMTP id c14mr199672vsp.14.1598604719736;
 Fri, 28 Aug 2020 01:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <1598541694-15694-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1598541694-15694-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 28 Aug 2020 10:51:23 +0200
Message-ID: <CAPDyKFqYD9WFTo4Qp0kvzZrOM0MNvY=krb3H_m6iAp=AGiRn+A@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: Enable restore_dll_config flag for sc7180 target
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Doug Anderson <dianders@chromium.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 Aug 2020 at 17:22, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> On sc7180 target, issues are observed with HS400 mode due to a
> hardware limitation. If sdcc clock is dynamically gated and ungated,
> the very next command is failing with command CRC/timeout errors.
>
> To mitigate this issue, DLL phase has to be restored whenever sdcc
> clock is gated dynamically. The restore_dll_config ensures this.
> Enabling this flag with this change. And simply re-using the sdm845
> target configuration for this flag.
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 5a33389037cd..d4c02884cca8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2151,6 +2151,7 @@ static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
>         {.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
>         {.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
>         {.compatible = "qcom,sm8250-sdhci", .data = &sm8250_sdhci_var},
> +       {.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
>         {},
>  };
>
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
>
