Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC45B6CD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 21:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbfIRTlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 15:41:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36316 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727648AbfIRTlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 15:41:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so1155202ljj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DUtNy6zmsY/nY12iTbVrTLFA5neR54fGcg9sdDNwfEY=;
        b=fVyFu7iCUvOtyuHv+Xj2YthhNrZOr4I5cNqzFjMxLMOPNrE71+G8H1jVo9wOMKgtTc
         TNIIlFcXqPJtyGWq7EIhgQ/QTvke2Pgso2evo8wAVJRrFT99b162lg4tZoUwvjLXnxF5
         bBF15QD8KKnIOevl3afUFS9klNlHkQ2aatRIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DUtNy6zmsY/nY12iTbVrTLFA5neR54fGcg9sdDNwfEY=;
        b=PTkTDm1eUvTS+MWXJ8HUm20on1qM3vYTkJ0G0nUJ66DE1kgLoQ7wYLlmB5iQnrybQI
         Y7gD0KVf7rdydRIKB95XXzonC/suFg4HgW5pkz4QpySWXp243qWp1nz0i0rMq19idh+X
         pvROfuLAXPUQlRacMsGIVSyJL9cvNOgRK68ULIDBRycC9/9q7yr8x7xXbFG82tNqP+RU
         EQaDx/6KxMBc2ezvyghBVFMZxJbHlCKvIe/3qzW6ND0ghufn85loogyNRapC9oEG1pNT
         NFBOuMHl3R8wAhyCs2Ig7xjZPOAjTeuYf1DJpV0nNdBFQY1UB+pYWcr5HpwHJZ0O/qVC
         2y5A==
X-Gm-Message-State: APjAAAW8diQczSg1gJ42fpddNw9tVCqjJ1GkgWxmUVjUQyLwq2RKWVff
        N83Na8lpCY69YMG1SJrDnyjEGA6mw20=
X-Google-Smtp-Source: APXvYqzbLDEUqp1RtYl2Su3cJmWU1zlKFSNHeAxq1hQuJdOhnebOyVpfDLBepQr0kS1NNyydksV7Rg==
X-Received: by 2002:a2e:9a17:: with SMTP id o23mr3069018lji.192.1568835690052;
        Wed, 18 Sep 2019 12:41:30 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id h7sm1199511ljc.39.2019.09.18.12.41.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2019 12:41:29 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id f5so1118304ljg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 12:41:28 -0700 (PDT)
X-Received: by 2002:a2e:9881:: with SMTP id b1mr3145788ljj.134.1568835688462;
 Wed, 18 Sep 2019 12:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190910160903.65694-1-swboyd@chromium.org> <20190910160903.65694-6-swboyd@chromium.org>
In-Reply-To: <20190910160903.65694-6-swboyd@chromium.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 18 Sep 2019 12:40:52 -0700
X-Gmail-Original-Message-ID: <CAE=gft6=4m79QX8Bca9izRUUkumio_YKBNY8aY=XPjj=WE_BYA@mail.gmail.com>
Message-ID: <CAE=gft6=4m79QX8Bca9izRUUkumio_YKBNY8aY=XPjj=WE_BYA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] soc: qcom: cmd-db: Map with read-only mappings
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 10, 2019 at 9:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The command DB is read-only already to the kernel because everything is
> const marked once we map it. Let's go one step further and try to map
> the memory as read-only in the page tables. This should make it harder
> for random code to corrupt the database and change the contents.
>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/cmd-db.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index 10a34d26b753..6365e8260282 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -240,7 +240,8 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
>  {
>         int ret = 0;
>
> -       cmd_db_header = devm_memremap_reserved_mem(&pdev->dev, MEMREMAP_WB);
> +       cmd_db_header = devm_memremap_reserved_mem(&pdev->dev,
> +                                                  MEMREMAP_RO | MEMREMAP_WB);

It seems weird to have both flags, like: "It's read-only, but if it
ever did get written to somehow, make it writeback".

>         if (IS_ERR(cmd_db_header)) {
>                 ret = PTR_ERR(cmd_db_header);
>                 cmd_db_header = NULL;
> --
> Sent by a computer through tubes
>
