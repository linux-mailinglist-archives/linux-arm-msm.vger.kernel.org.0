Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67239430FAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 07:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhJRFQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 01:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhJRFQW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 01:16:22 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C971C06161C
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 22:14:12 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 62-20020a9d0a44000000b00552a6f8b804so1137320otg.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 22:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=itxP+MITBQYLv6IpaiEtXRD3Z1f5f4njE+wwLqkCTAY=;
        b=xF/Lpd9eUk7JR44iFuKVSHz48WCRWecyaF/koTl7TNt2g3+g7uRGnYNJwtu8Lxpzl/
         Eftn4pMsE45y5AduBDJNiYIwBqMbD17CTV/RtQLK4ZRzavmIkL6eKBHRiqLSYEbYmkLJ
         VnZ74VZXQdx7/UsK8Hgfp9jezp0hIVe+gG87WXV20Brg+0SWMYWKU57zZ8eBJweo5qNE
         XBWU4W53Xfz2Dsve2QS47JjCtH5WPTXadLWDDTQHEol+8Kn+eA+LdHN6iHAwzCga59g4
         2u0idzRXC0N7/U1SifyUC1gG0E+sHOTU/XMpYdageWWpjrBwjiLDHSLYu0h68Uid391S
         4+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=itxP+MITBQYLv6IpaiEtXRD3Z1f5f4njE+wwLqkCTAY=;
        b=onTIuDuOjmc8LIRuca9Kdt//LUOh3opYAw+WJrSHk5+4/NE0wg18iWvCMqL0RZPEk1
         DsqO5/ijoxbXInoCJrqgRfnZjJSDgCJbRCTtzkRuKh1PzdlvPss3Pax6UX1Afhep/Y0t
         zpt2tSMKzQ72QwSgdpAl/x1q0d0ER7ZDVvKx3SyKvcB1TqTAuuM8OvkHFfjF3HFRQ8Wf
         gAs8CtE/HzXe5mEJaDEnRJp4hmQ1AEG2Ya6GFioOTSvPQVvkwaY2fM3AUJKxH/+YrNBr
         u7qHWmg7VYS7tCVpclzuFDXDb0mMeJXxKQ+YurXFig9woNnEllULF1eT/2u6BkKGp04J
         cMZw==
X-Gm-Message-State: AOAM532a26eztrP/DashadKJTep+D+PC0H1qohCwRi5QTNiGJadGgUKP
        yTeR3WXMhPekRIKvOxCfNeXednQTynYozgPumurP0g==
X-Google-Smtp-Source: ABdhPJwRa1Ny5xG04rVXxLa5jSQc+H/uM1FxpilcDlfsieb4KLEKd+5SWCvqtao0fRu0+t+ItEc7f23kucCRxU0yc3I=
X-Received: by 2002:a05:6830:2b28:: with SMTP id l40mr9876399otv.162.1634534051227;
 Sun, 17 Oct 2021 22:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211005024025.2037810-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211005024025.2037810-1-bjorn.andersson@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 18 Oct 2021 10:44:00 +0530
Message-ID: <CAH=2NtxnX0eAFSRseviTm8G3=VQiYWRDsA5ZuY-_h77R9Kk7-w@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Add PM8150C and SMB2351 models
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, 5 Oct 2021 at 08:08, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> Add PM8150C and SMB2351 to the list of known PMIC models.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 47e9ed03882a..bd80db3181df 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -102,6 +102,8 @@ static const char *const pmic_models[] = {
>         [32] = "PM8150B",
>         [33] = "PMK8002",
>         [36] = "PM8009",
> +       [38] = "PM8150C",
> +       [41] = "SMB2351",
>  };
>  #endif /* CONFIG_DEBUG_FS */

LGTM, so:
Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Regards
