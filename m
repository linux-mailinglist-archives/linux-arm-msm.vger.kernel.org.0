Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2499618F9C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 17:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgCWQcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 12:32:55 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:37306 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbgCWQcy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 12:32:54 -0400
Received: by mail-ua1-f66.google.com with SMTP id l18so1007403uak.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vX/pTxX5leUKI//FHes+EDjkWAmuKn+xAlsAhXDay5w=;
        b=c1CQI6r5AyGrK7N+JP44nrKbQ0k3r8F5dz6wSdikRKRG8IBAr591tkZHPW4rL5sQ0K
         FEIOrHYN/ryK4FWkhbMYudP9qub+iU9PP6IqV2AufntwMh0sDIrw8OhzUhO9h7+AEtcU
         bntwsCZo8mATCRdmMgeNj+YyBFYL6wTejiX5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vX/pTxX5leUKI//FHes+EDjkWAmuKn+xAlsAhXDay5w=;
        b=KZVzbDKHHJFGH8wmuTX35zMndH5UH96jOOTl+Xw0Bn5RKTWVRukRPOvY2eM0fulr2W
         W9QToqEEzoV0WF5uEnNWe2iBwdzBth4gHXNiCbnLEEj2miUO+3BjafjAnWKk1sD1yFFj
         XSpOjlzeZ6swpzSsMjGZKBY8ZvwhF1qiK8CkEjNB/8eBmIuZrryJox2MNFp8Ycq6daet
         ycPB1yNdh5zmnOEm0cgUOPrxggQWHDCgMiUdjHDdPbf3Bo9AGKwSGJkr5XJYt3VTg/h/
         KWx7YKtAq1kbaTwBIw0sqixW/XWWLbGqMtkWtQJ0VCiWEcF/2pCXMjiD4sTq2qdujXQU
         YPBA==
X-Gm-Message-State: ANhLgQ1gJdgzejw9V8fpQfpdCXHXn68JV9OafOsjUtWppBNwgEK0Ix2A
        U9sGkBvyorZIOqLu33NBOCG4GxjkYz0=
X-Google-Smtp-Source: ADFU+vus+SvkdM+N2rOegjsGXeSrd7T0wbPZxy80NFVHbxqAzDAs/2OYcJTgUYE6WzUmSSHYWqJVhA==
X-Received: by 2002:a9f:21aa:: with SMTP id 39mr14211570uac.138.1584981173490;
        Mon, 23 Mar 2020 09:32:53 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id g130sm40823vke.15.2020.03.23.09.32.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 09:32:51 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id 9so5191727uav.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 09:32:51 -0700 (PDT)
X-Received: by 2002:ab0:604f:: with SMTP id o15mr8911387ual.120.1584981170619;
 Mon, 23 Mar 2020 09:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200317133653.v2.1.I752ebdcfd5e8bf0de06d66e767b8974932b3620e@changeid>
 <20200323110756.GD26299@kadam>
In-Reply-To: <20200323110756.GD26299@kadam>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 23 Mar 2020 09:32:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcnAtA2WRoC-+R2yKC1OCsDOEDMXu5jKveOARhw4gmOg@mail.gmail.com>
Message-ID: <CAD=FV=WcnAtA2WRoC-+R2yKC1OCsDOEDMXu5jKveOARhw4gmOg@mail.gmail.com>
Subject: Re: [PATCH v2] spi: spi-geni-qcom: Speculative fix of "nobody cared"
 about interrupt
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, kbuild-all@lists.01.org,
        Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 23, 2020 at 4:08 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> 561de45f72bd5f Girish Mahadevan 2018-10-03  327                 ret = get_spi_clk_cfg(xfer->speed_hz, mas, &idx, &div);
> 561de45f72bd5f Girish Mahadevan 2018-10-03  328                 if (ret) {
> 561de45f72bd5f Girish Mahadevan 2018-10-03  329                         dev_err(mas->dev, "Err setting clks:%d\n", ret);
> 561de45f72bd5f Girish Mahadevan 2018-10-03  330                         return;
>
> Needs to drop the lock before returning.

Oops, thanks for catching.  I will wait before spinning a v3 until
there is some clarity about whether folks want to do something more
like Stephen suggested or whether I should continue with my strategy.
At the moment I'm still in favor of keeping w/ my strategy and seeing
if I can reduce the amount of time with interrupts disabled in
setup_fifo_xfer(), maybe just grabbing the lock around the start of
the transfer to keep the state machine in sync with the kickoff...

-Doug
