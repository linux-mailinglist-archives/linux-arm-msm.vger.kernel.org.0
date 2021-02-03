Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9391030E29F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 19:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhBCShP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 13:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbhBCShN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 13:37:13 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5CBC061786
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 10:36:33 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id d15so410127qtw.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 10:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zRad3jf+bR+tIOugcGQc/4V8uVsUGmP5WmEHBEMRiz4=;
        b=CVVxYbxbvVsGcP5UduJ+D+yFn6wv+RLdHnjIw/RQBfSsfx6F28MXHAntqaqQVI+8xU
         DBJiHM4FLHs94ldKMgioQnK7QZVY+7BAPeJTeBstDkfkETulNH1Mg4jwfu3fdA4nnRBo
         nAumwV5nAOsbZKlI7YuRR0dbYwuFqxE8fTg+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zRad3jf+bR+tIOugcGQc/4V8uVsUGmP5WmEHBEMRiz4=;
        b=kIKHf7n59wNlqetwFLHzwN28hFuOd4TLMlf4ESFf9KvfSNFRrYX9WbC+62as4JMgf/
         pqf0FEN5DKHFxHL0Drg7wo2YqeuO/md0/kAdqg+GL8TYZKjop2JnYxAfsXvYtbuxP3Oh
         cIu1JfLFQm8oxkjU2b+bcIdvpxz18fTjS49QUDbd+4YLaeabmIJxhRgxEj3BZrToDfkc
         vzFtjdQuGVSZ+0eSpfOvOPMG4Enu0EhtYAD7EiY4CBGNjnaJgDXOBebst2e7Z/27+LPW
         3YlolthfFjpqiXDXzZ+hBnotwfOmFCEBRmKvfi3Zy5vzi7zgbqYDVcrt2tXMwS2YwaY8
         JnAg==
X-Gm-Message-State: AOAM530OWhkWhkKQCPKaIhjBLjO48rCbcubbMnHal/ycmLZL5eSPsHwR
        ERseh+mRQmNh8UlU2ajrVh9BqXbd/riTYg==
X-Google-Smtp-Source: ABdhPJxLGi9BUni3chvBG+HcdGmIcinxMqGff++HBVd2Td0Sqk1B74lwGSQ8RxI3JVeUwVElLvXL9A==
X-Received: by 2002:aed:2e42:: with SMTP id j60mr3621413qtd.7.1612377391828;
        Wed, 03 Feb 2021 10:36:31 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id c15sm2256760qkj.129.2021.02.03.10.36.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 10:36:31 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id m76so603199ybf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 10:36:30 -0800 (PST)
X-Received: by 2002:a25:c683:: with SMTP id k125mr7009841ybf.32.1612377390520;
 Wed, 03 Feb 2021 10:36:30 -0800 (PST)
MIME-Version: 1.0
References: <1611555637-7688-1-git-send-email-mkshah@codeaurora.org> <1611555637-7688-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1611555637-7688-2-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 3 Feb 2021 10:36:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vi4a-uUuEStPpOvzF+goNZ7W5zTBbMg3oqmWq9urObBg@mail.gmail.com>
Message-ID: <CAD=FV=Vi4a-uUuEStPpOvzF+goNZ7W5zTBbMg3oqmWq9urObBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: qcom: rpmh: Add rpmh_write_sleep_and_wake() function
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>, Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Jan 24, 2021 at 10:21 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Let RPMH clients call rpmh_write_sleep_and_wake() to immediately
> write cached sleep and wake data to the TCSes.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
> (no changes since v1)
> ---
>  drivers/soc/qcom/rpmh.c | 16 ++++++++++++++++
>  include/soc/qcom/rpmh.h |  5 +++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index cbe6b96..725b8f0 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -515,6 +515,22 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>  }
>
>  /**
> + * rpmh_write_sleep_and_wake() - Writes the buffered wake and sleep sets
> + * to TCSes
> + *
> + * @dev: The device making the request
> + *
> + * Return:
> + * * 0          - Success
> + * * Error code - Otherwise
> + */
> +int rpmh_write_sleep_and_wake(const struct device *dev)
> +{
> +       return rpmh_flush(get_rpmh_ctrlr(dev));
> +}

This patch doesn't hold weight on its own.  Please squash with patch
#3.  Specifically any clients actually trying to call this function
will hit the problems that patch #3 fixes.  There's no reason to add
broken code first and then fix it with a later patch in the same
series.


-Doug
