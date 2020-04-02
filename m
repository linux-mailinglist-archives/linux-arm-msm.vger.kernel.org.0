Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB8B19CAD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 22:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389000AbgDBUON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 16:14:13 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:38702 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbgDBUON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 16:14:13 -0400
Received: by mail-vs1-f66.google.com with SMTP id x206so3426293vsx.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T2KZZSErTlqi9bcZVI97UMRwpZy818j1NzSmFXCiRoM=;
        b=WpUfI6vhm9+byBPTnviB2LfRrhJf3CrgeqRbtRVtvkct+oAdSX/g0UMVQ1LfdKfGJn
         UBkz+Sb4STInORrpcP+4kigpNzF/EBtz9K3J3VA58tw1bXwFzC/2I571PMoAN00jAFAV
         E1ocuiIC+BUv4O6SPdHywDkfCiqKOEefQp0CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T2KZZSErTlqi9bcZVI97UMRwpZy818j1NzSmFXCiRoM=;
        b=pHFi+tG9jZY+S9Y3hWJMsoVOzyQJ71flmqyd2nFkpZOTryXvvmUwk0Ox+s+/PrpCjY
         eDi6Lblz75jy6/n/Hm3HAUN38AOTFW+NcguTGB5F3QtW4+ZLRKTp7eZIz7GeZOLs1QuD
         iRQK7prOql9kixP+n2rBtsQFgZBmrmm9uxwG6Lau9qghFBOG7g8jeZOgATpNn6/gvGhz
         ajEAJTR4JGWAsQT9if3AQAd7hvNxQaoZ763g4T6o2OavSQPQnEXAyGCineCiAQFf2TsV
         0HN93GZA6nbd4VkMt04U94G4FFTZ/9j03V0WO4GYMt00CMOPm7z5MPNJ/8UKYBfwdaq1
         DxCQ==
X-Gm-Message-State: AGi0PuaNZn15JnFIPpRXafA0XbgWUDUiX7H3dYFKMbmkbW3MKxi/kB4w
        bQ8u1R+QevxL2+769PwkgrKctJ7uA4o=
X-Google-Smtp-Source: APiQypJ8f9PhxeCO5J+GUpFio+A5JecE4uLClFf4lW0YT8kUP7AL71njyTX7Jxq2j7eJmJzx7z7sng==
X-Received: by 2002:a05:6102:21a7:: with SMTP id i7mr3929049vsb.239.1585858451827;
        Thu, 02 Apr 2020 13:14:11 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id d1sm1543400vso.10.2020.04.02.13.14.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 13:14:11 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id u9so3422067vsp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:14:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3204:: with SMTP id r4mr3631989vsf.109.1585858450535;
 Thu, 02 Apr 2020 13:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org> <1585660782-23416-8-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1585660782-23416-8-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 13:13:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_JJWAb9BBkhWGZJ+jUvtO3ipf-OxFRYo38YY25cA42Q@mail.gmail.com>
Message-ID: <CAD=FV=X_JJWAb9BBkhWGZJ+jUvtO3ipf-OxFRYo38YY25cA42Q@mail.gmail.com>
Subject: Re: [PATCH v15 7/7] soc: qcom: rpmh-rsc: Allow using free WAKE TCS
 for active request
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 31, 2020 at 6:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> When there are more than one WAKE TCS available and there is no dedicated
> ACTIVE TCS available, invalidating all WAKE TCSes and waiting for current
> transfer to complete in first WAKE TCS blocks using another free WAKE TCS
> to complete current request.
>
> Remove rpmh_rsc_invalidate() to happen from tcs_write() when WAKE TCSes
> is re-purposed to be used for Active mode. Clear only currently used
> WAKE TCS's register configuration.
>
> Mark the caches as dirty so next time when rpmh_flush() is invoked it
> can invalidate and program cached sleep and wake sets again.

Comment above is no longer right now that you've removed the place
that marks caches as dirty.


> Fixes: 2de4b8d33eab (drivers: qcom: rpmh-rsc: allow active requests from wake TCS)
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)

Other than the comment nit:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
