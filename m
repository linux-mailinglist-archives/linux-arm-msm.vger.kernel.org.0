Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297FA2421C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 23:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgHKVRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 17:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgHKVRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 17:17:11 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BD4C061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:17:10 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id s29so1756425uae.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2BG7YFgc3xmLmgJtfXAfxYxZdUYNfvRF7uBrIdBJOZI=;
        b=MnJEPmUXAhyAuhSs5WSnq12nq2fZhQVfRdLJq41xeZ5tIkmBvs19n3/rrZy4dJeTq/
         Hr2BSIgCS1jVawdeO9VFLOdTRY/rbv4HfKugrQwlxLCf8MhTQf9E6ckjXbcJo5mgFAqt
         EkNQ+Mt42h3Qy4XjFEI98lnv+39Lw1FIELg10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BG7YFgc3xmLmgJtfXAfxYxZdUYNfvRF7uBrIdBJOZI=;
        b=lajpzz5uojnOVjhh8sH04J7NcubTZwThKesAqHWv+k38nC9dBmpFuZhEUFKdAMW8K3
         Secz2/W2gPuWPCP32XsMxVsYM+lxcLkA5wXMKtVvX6ZewzZp2jNcyFBGP72Znh+Jxvxf
         nRVYXtlFccgDPIob/91FYxTJc1RtV3vBC/2Fo6s47ME6J1He5NCs/Ya5FSWmH30iBakx
         nQizHXLMUNf83C5BAFUZXQHGl5sUFShjgUjBwtUbeRD7epuUaeKgcxNtW29/3fMklsrM
         EgBhpRmnKg3B6Q/QWuemRDSA4vH/Bu6TyEQ+IMIJs/wlonD8cDjQWKRqbpNJRriIv3IP
         sm+w==
X-Gm-Message-State: AOAM531rSP+gjcb7pLC5QR6cE8MoV7sJqfDbU3KQJa8SgpYOTOhcRTtc
        JVHisasoM46n5GVwVitwJSIG3HSM/44=
X-Google-Smtp-Source: ABdhPJz0hwjhrcMhSyhlYfdiYZ15eoCi9apBqutbTa6WPM3AlGianKCxF3UfoCO3MrYBBPyff4HhiQ==
X-Received: by 2002:ab0:14c8:: with SMTP id f8mr1686238uae.23.1597180629501;
        Tue, 11 Aug 2020 14:17:09 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id l84sm28578vkl.36.2020.08.11.14.17.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 14:17:08 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id o184so45920vsc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:17:08 -0700 (PDT)
X-Received: by 2002:a67:d714:: with SMTP id p20mr26650661vsj.119.1597180627917;
 Tue, 11 Aug 2020 14:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200811190252.10559-1-sibis@codeaurora.org> <20200811190252.10559-2-sibis@codeaurora.org>
In-Reply-To: <20200811190252.10559-2-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 11 Aug 2020 14:16:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uo2LaMbT4nTbcFs2t0noCm_PzBi+TNPZ6HTBe8WraQBg@mail.gmail.com>
Message-ID: <CAD=FV=Uo2LaMbT4nTbcFs2t0noCm_PzBi+TNPZ6HTBe8WraQBg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: qcom: aoss: Use GENPD_FLAG_SUSPEND_ON flag
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "Brown, Len" <len.brown@intel.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 11, 2020 at 12:03 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> All the power domains exposed as part of AOSS QMP driver require to stay
> powered on for suspend. They are powered on when the remote processors
> boots up and powered off on remote processor crash/shutdown. Mark the
> power domains with GENPD_FLAG_SUSPEND_ON to model this behavior.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index ed2c687c16b31..5a5b4bf928147 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -366,6 +366,7 @@ static int qmp_pd_add(struct qmp *qmp)
>                 res[i].pd.name = sdm845_resources[i];
>                 res[i].pd.power_on = qmp_pd_power_on;
>                 res[i].pd.power_off = qmp_pd_power_off;
> +               res[i].pd.flags = GENPD_FLAG_SUSPEND_ON;

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

This makes my patch [1] unnecessary.

[1] https://lore.kernel.org/r/20200805091141.1.I86b3faaecb0d82997b599b1300f879606c71e116@changeid

-Doug
