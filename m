Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1242F17ECC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 00:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgCIXmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 19:42:31 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:47011 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727463AbgCIXmb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 19:42:31 -0400
Received: by mail-vs1-f66.google.com with SMTP id z125so3358334vsb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 16:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HbFlXIeA0nZ82kqTFusW9Y5ddM630bUBZPbaTnSWK9Q=;
        b=EMrra8TaXWr/XpsjFWwAXJ9M92aRqXDRr5qcC8JIRzVmcEK13C29b79SejteQwZFSv
         KyRd3SxhqJinTM29vmxs9cL6TpTO+mZPsKy7TfCdcle2Ekttc3FrSeII9T2wZ6/knwXv
         3y6ciY0SDUjk+wP55PranRh+l1WBiTPSuAscc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HbFlXIeA0nZ82kqTFusW9Y5ddM630bUBZPbaTnSWK9Q=;
        b=SZuLiep7rJYI8joOsjQaqbK8XNDawQLxjDOb5W1Ls/9udzxPeA9TpXhWflyVP/UhU4
         MgUr7/mAr5FBvLw3m6M/pUpMQ6ZI8S7p9YeGMVxG2gdVql76ly5YfBp0HkNxbHQBvEkk
         CZRrf0UNoy5rY+OjYOF41BimHKUbwwPozbjcptN3HgDz1ewyGyr5Z44NsHKB7uB1n4cq
         xu70dOXoBkL84581n0UTXHP1m2XLQvCA0977B8X5VL8YKDoJivY8noX1zBc9TPA3Cm87
         mPxnsDkysVunG6Wv8sby1KElrLJ2KGNzaV7vkm29ZrVfwD93z25SlKT4eUWkDJtH+dYc
         AQmg==
X-Gm-Message-State: ANhLgQ0NxPOsy/S+7CNJtCfbYUsxuElA1q+vZvc3mFknQwuXA8eYfYLo
        +JF7S0ZdE9aT2w26WAkfQUUtJWa3pvI=
X-Google-Smtp-Source: ADFU+vurv862kekSnEWkK2RY+CzFjZE+N40n/hoD4qInbo6NuVHtULwIgvks+6jx5wICllumNKsppw==
X-Received: by 2002:a67:ebd7:: with SMTP id y23mr5683197vso.131.1583797349429;
        Mon, 09 Mar 2020 16:42:29 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id y21sm2249341vsk.30.2020.03.09.16.42.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 16:42:27 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id h32so4021518uah.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 16:42:27 -0700 (PDT)
X-Received: by 2002:a9f:2478:: with SMTP id 111mr3162014uaq.0.1583797346690;
 Mon, 09 Mar 2020 16:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org> <1583746236-13325-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1583746236-13325-3-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 9 Mar 2020 16:42:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9BFJZtgmVeDpr1mCP1C5kg9+3gQo2i5RMfBuQOVMkDg@mail.gmail.com>
Message-ID: <CAD=FV=X9BFJZtgmVeDpr1mCP1C5kg9+3gQo2i5RMfBuQOVMkDg@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] soc: qcom: rpmh: Update dirty flag only when data changes
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Currently rpmh ctrlr dirty flag is set for all cases regardless of data
> is really changed or not. Add changes to update dirty flag when data is
> changed to newer values. Update dirty flag everytime when data in batch
> cache is updated since rpmh_flush() may get invoked from any CPU instead
> of only last CPU going to low power mode.
>
> Also move dirty flag updates to happen from within cache_lock and remove
> unnecessary INIT_LIST_HEAD() call and a default case from switch.
>
> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> ---
>  drivers/soc/qcom/rpmh.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
