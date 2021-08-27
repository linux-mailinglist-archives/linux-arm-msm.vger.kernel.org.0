Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF3E3F9BDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 17:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245193AbhH0Pn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 11:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245124AbhH0Pn7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 11:43:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516F1C061796
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 08:43:10 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bt14so14780124ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oZPGVp92VaS3dLowjetEls763eL/Q9YUNevyNpL1JuM=;
        b=i5Kxex2KDW8eLSLlwjXmG/+a/FmluMZPNPJFNSy66Tvt+wf9rhzjE8Pd48qZNMetaz
         G09WE9Q+ms2dF/pP64j3VS3pgUqxMZJqwenYV6987xndMpo/wRdrQ5RokRCSR+fbndIA
         95ikxf0WSuo4QZUM3T/MxuGC5GmEPfkDQR37HoHMO6FDWY97/V5zqj91aj6nJLRpsjpN
         duMqcaQ8DmktwD0Kd/WOByzmlEn0pwa4E0UM7u5Rv7+gQjgG5tCtfy0VbwLinKf4Ep6B
         jzMojJLxZ1QV7IVI6oaR4xlZmRDobHWTOpPWXkCDFrmZv7nxhciY71NYbSo7+esAgCKn
         1V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oZPGVp92VaS3dLowjetEls763eL/Q9YUNevyNpL1JuM=;
        b=rpM3VADGsci7AWXY9K0rxqDwMCANBUqLyyHdjdChVEW1MySNHWfRNrJtUZjcXi6amX
         HxiOgf0B6LC0pSNWBt0ncccusZK7wh4vACNPHTiWt4gIyMwyGuAeUHVmhTvpKCt5/mm0
         wld5jbCwwe5AU07tl/VODSincem8XRbVKJVl4c48JvNQOKGsAcreeckVyVZvyMLPEh1s
         v4X0lwlwTYSOwobn+wasFFvS9GyLQrNcXTrsGVi9KiyiMZPrFLsJybOkV90qIohEbNeS
         /Awvl1O2DUcEFvmRhOQ2unmgxia794AFr54fzGw512y6dm1iXpxOGoJMVPinu+Gt/Xdc
         XTWA==
X-Gm-Message-State: AOAM531dv2ABFeoHgsjUIPthrjd7jFuLABDtkiBrMgYczR/0SlrxbIOt
        s1fqdYmFLh8/CQJtOG50x+uA5c3ea+UToumx0wLmVQ==
X-Google-Smtp-Source: ABdhPJyH36GOAC0XBuOQ2fDNT72ll8GhA/IBuvrzOLPOcb/QCzQFNY/p11kajRzZ3QRbsaXgiQXkzZVqanSS1R/qstM=
X-Received: by 2002:a17:906:fa10:: with SMTP id lo16mr10680576ejb.342.1630078988646;
 Fri, 27 Aug 2021 08:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210622203759.566716-1-iskren.chernev@gmail.com> <20210622203759.566716-2-iskren.chernev@gmail.com>
In-Reply-To: <20210622203759.566716-2-iskren.chernev@gmail.com>
From:   Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date:   Fri, 27 Aug 2021 17:42:58 +0200
Message-ID: <CAP71WjxRpdoN9MMTH2Y2Xgc==tC2jWfm7X0_A1CrzZ40N_rg8Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mailbox: qcom: Add support for sm4125 sm6115 APCS IPC
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 22, 2021 at 10:38 PM Iskren Chernev
<iskren.chernev@gmail.com> wrote:
>
> SM4125 and SM6115, codename bengal, have APCS mailbox setup similar to
> msm8998 and msm8916.

subject and commit refer to SM4125/SM6115, but the diff below is about
4250/6115. I suppose it's a typo here, since 6115 is similar to 4250,
not 4125, right?

>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index f25324d03842..1a4d8cca5881 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -166,6 +166,8 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
>         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> +       { .compatible = "qcom,sm4250-apcs-hmss-global", .data = &sdm660_apcs_data },
> +       { .compatible = "qcom,sm6115-apcs-hmss-global", .data = &sdm660_apcs_data },
>         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
>         {}
> --
> 2.31.1
>
