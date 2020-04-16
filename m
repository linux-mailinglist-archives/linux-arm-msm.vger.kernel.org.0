Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3D41AC0E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 14:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635134AbgDPMRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 08:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635207AbgDPMRB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 08:17:01 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC25C061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 05:17:01 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 184so2253024vsu.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rH9FNHKfAt+A1vHsUhr40PXb20A41+AkKVxM0KJ3IUA=;
        b=YUVqGmj/+GDGZBvHkZaAeyYUaCRpluZmazweWxd6ZTa1hCXJxkmgtRpeDTvGw5VNgw
         YENHKM8ub9JsSLNmhcXOjQxXDkG02vY9SW1cy5/5Y8B6DXqy11HiNhxWQRF74NPi98WC
         8hkPHF2sg8VzTIDNarYVAjdvoA5fGmKo0e+rdoHewmOZG1+42kAgfbhcrFUg8Z9kulkv
         q+rkXjNZV/6Ja/Ok6top274QmChv32s3aLm27Qrd+DaZFNI9ghZcBPRMgEpA7Up9fQUG
         nkrl9DjNvC02IDUfXElBurkhW6dU4Q4BXyQXbLoT+T7TxEhGqMSSjhOBRmrJvMVppIGc
         XOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rH9FNHKfAt+A1vHsUhr40PXb20A41+AkKVxM0KJ3IUA=;
        b=EmMVcaKz9tgiHMzK+GGZJHzHJ1t+/87x+heTQq4DrHmnGilRJlNiBbLpfUeImEMXZf
         qhbMmAJ8BNQkzMEHn0oJoIAmmWEL2/Wh7Aq0mVziZJ6tg40p89wStx9hf5rQ1LZ+Viou
         pv+y0JDA44p5jqijoOvQShK7GBIMzatYv2JLHWPQfrQgQKSf3OrXyNXtZ4qxqICFHe4U
         44z921zxHTg+gzKgnB/CGRk91rPvl2Jd86ykNrVPTR6P62gf9u8RTYhp8n9+KE5JJ+fc
         4G/QSMEDjjEOzsVq0IakgvXmuhIuhOD6KLYgSfNFo+Eq/yDQ+VCPzZ1D0h0wYadn565K
         4Utw==
X-Gm-Message-State: AGi0PubOMpwHiApG9tA/oPFpCYLqWIjF9I4J23pASWduiTezcECeZqDo
        eUkqgSg9zVXXiILJnbLE+eNUxd4IcFcPN38HaEKiyCsg
X-Google-Smtp-Source: APiQypKimtohzaeLEMo41Jq2vIhngmFgs5gR9SEFIMKBisOybswa7H7HDo9Cz25Xudtsu4/Cr3AMFl9xkeaY4PUinE0=
X-Received: by 2002:a67:f24b:: with SMTP id y11mr8636206vsm.165.1587039420609;
 Thu, 16 Apr 2020 05:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <1586706808-27337-1-git-send-email-vbadigan@codeaurora.org> <1586706808-27337-3-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1586706808-27337-3-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 16 Apr 2020 14:16:24 +0200
Message-ID: <CAPDyKFobBGDYMGmkpTcmKVrnT7MywM5=xaOx86f91ay6c7DUWw@mail.gmail.com>
Subject: Re: [PATCH V1 2/4] mmc: sdhci-msm: Enable MMC_CAP_NEED_RSP_BUSY host capability
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 12 Apr 2020 at 17:54, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> sdhci-msm controller requires the R1B response for commands that
> has this response associated with them.
>
> So enable MMC_CAP_NEED_RSP_BUSY capability.

I assume this potentially should be considered as fix and tagged for stable?

Another question, if there is there an upper limit of the busy timeout
in the HW (cmd->busy_timeout) or does the driver use a software
timeout that is adjustable?

Kind regards
Uffe

>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 013dcea..d826e9b 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2088,6 +2088,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         }
>
>         msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
> +       msm_host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>
>         pm_runtime_get_noresume(&pdev->dev);
>         pm_runtime_set_active(&pdev->dev);
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
