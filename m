Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 598B617BA52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 11:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgCFKep (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 05:34:45 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:40836 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgCFKep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 05:34:45 -0500
Received: by mail-ua1-f65.google.com with SMTP id t20so506817uao.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 02:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GT0ntR2z9Q7DroDptCmU+j0smBwinzmlH6vDJL9WblE=;
        b=ZLULudkHvXV4ZvbyBv44o2dHue+GCPa6yYvaj0xzRg1d0/bVL4hPnnUTKze44/a3FH
         ntvxjbf16nm9HhFB8W5vw8AFVFc3obvUxgg7OfGwV1O8G0Jjz6Ry7ZbPbGbLY5kUWbNw
         3mL+Mr60zF9Xi0LmZma5hKELAjezG7cVcMPeBtNRvTxu1uJi4eT/9ohXb58IlPvPh6/O
         zX3y17rSqemcWGylhrV61IkDQEfO6fLJcc0VFI/mJSSoF6YQ9dD8PPeC5YwlymwsPNCs
         68mVTRf/7T3bdFbUIO+z5YVc7VzDqex5xqx+A1gRo64rNaMf/26KVgBRc/joFeoefa1v
         GlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GT0ntR2z9Q7DroDptCmU+j0smBwinzmlH6vDJL9WblE=;
        b=HcwRaq777fTx9P7QFk18iQcnehsv7J+DSfhFL2drgMwnCtju8IDPikhyt2/AZq8bep
         mlcxynUfWVlzKQ80x+YRVgnkfH2PfP5W2DKnkfOCsVkxDcHV1EKjJIyYLZz/IGAqqdlV
         ECuS17bcVNx47VzPjz8zHLLzWodo8bGQUGlXvlltZaLvDqRNvIp0XyV5C/WrccMFfZOt
         OQ28EnXsBqjcVgSHqD2aN7Xje+zzvObZKYNQld0fkKCu59OFfxTZqQBwqRtdzX75XBC+
         1IzqYC1hpvkCC6VUF1UbBuak4bf14yZf1/0JX5GLR7X7ZkIee2l1AxKkF3/H+9ob/PB9
         u+xA==
X-Gm-Message-State: ANhLgQ3IAGAm1lea2eefPLOPBdk6hFI2knPWzLgCX5w9MhNi+rsLrP0x
        KfoBlUGicQ/UuRJFg9rPTYvGjyR3XqBjSKPp9Dnntw==
X-Google-Smtp-Source: ADFU+vsccrpNmQoGmWKgd27yAiKL7MMj3EMEHiKF8xGAVUuUSDA4ognzPZOwSuNT4QQpNLci0+/3pMczEX5GkpQxeBc=
X-Received: by 2002:ab0:20a:: with SMTP id 10mr1213237uas.19.1583490884114;
 Fri, 06 Mar 2020 02:34:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583470026.git.nguyenb@codeaurora.org> <a4f22132015159005c41f7cce0b361b363c7b845.1583470026.git.nguyenb@codeaurora.org>
In-Reply-To: <a4f22132015159005c41f7cce0b361b363c7b845.1583470026.git.nguyenb@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 6 Mar 2020 11:34:08 +0100
Message-ID: <CAPDyKFreBQPCPxGM3+LZ5rzYW7e1kgm-e5Pgg26XXD76_Fe=TA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mmc: core: Add check for NULL pointer access
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Mar 2020 at 05:59, Bao D. Nguyen <nguyenb@codeaurora.org> wrote:
>
> If the SD card is removed, the mmc_card pointer can be set to NULL
> by the mmc_sd_remove() function. Check mmc_card pointer to avoid NULL
> pointer access.

As stated in the other replies, this is just a vague explanation to a
*potential* problem.

Please explain the details for how this problem can occur - or a way
to reproduce the problem.

Kind regards
Uffe

>
> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>  drivers/mmc/core/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 6b38c19..94441a0 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -666,6 +666,9 @@ void mmc_set_data_timeout(struct mmc_data *data, const struct mmc_card *card)
>  {
>         unsigned int mult;
>
> +       if (!card)
> +               return;
> +
>         /*
>          * SDIO cards only define an upper 1 s limit on access.
>          */
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
