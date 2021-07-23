Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400423D4341
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 01:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhGWWZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 18:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbhGWWZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 18:25:26 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB9CC061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 16:05:58 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id k7so2918325qki.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 16:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TXXHRlqkn1UKOJrEoCU/1CKsPV1IVFDrHXzP0rexpUc=;
        b=kVhKTV2jwfU3UL2TDVAx6Od2VUtF8PD0tgQKJyramFzwij7jMAQUysiBLabG1p2Llz
         Ep8C6gJX7kRzIEA1Nu3ClCym8TQf+DSjQflhNSgcme7OBA0D1izAakUn+2PFJbgt5Q4I
         IujYcYZTx1uXzWQVUaqC5JLKexzzgMlgzil4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TXXHRlqkn1UKOJrEoCU/1CKsPV1IVFDrHXzP0rexpUc=;
        b=lSx7k8jZU7SEpRKJg55mm/osryo20zE5M/52zQfoEJYyKrEnVCtdGOHaSP6wYlcIX/
         E6I5952xuyY9ImdGjMvZzEXdVElKmhB91d5mlLnnuSKt4IdbNRG8kl2du6bLeCL1jeoE
         QbGH9YNICZ4EFOqHQoRGbaKMIDkZ/VZ56B/k7glI68wL20V3qLKgF2O+JljDjEr8ptD2
         g0svrSxfecohuC92snKGK0jNJW0LaXpANsARe3J3jqhJ6ZZDVHMZ+MoQouktSz//zRNk
         AEMDjHPLWGteTzynwLkR90AcIBDIjthg9eqEkCPNXrTjr9D0ASEPDBOKgiion3ZpyBKx
         ybuA==
X-Gm-Message-State: AOAM530tffqx12Wv5IFO8ABU7dr5m8TO3rdLgYoa1FvRxKpHsLCQVkPR
        1RnAr7EdN2GBs60Q+c45YNG+oArYCFlmSw==
X-Google-Smtp-Source: ABdhPJziXX2WqD6VoV34sfjrs1XVQMEiq4Y5J3Xbmh0R95EsMfi/xYAy6HsPYrdriyMbVZBAv0SXaQ==
X-Received: by 2002:a05:620a:4d0:: with SMTP id 16mr7029775qks.430.1627081557424;
        Fri, 23 Jul 2021 16:05:57 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id z68sm15096942qke.86.2021.07.23.16.05.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 16:05:56 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id x192so4774295ybe.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 16:05:56 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr9735827ybb.257.1627081555988;
 Fri, 23 Jul 2021 16:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210521134437.v2.1.Id1c70158722750aec0673d60c12e46a9c66bbfed@changeid>
In-Reply-To: <20210521134437.v2.1.Id1c70158722750aec0673d60c12e46a9c66bbfed@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Jul 2021 16:05:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8xgn=ueyryFZVA-VNLEU_sk8H29D08JaEpw2Qh2OFqQ@mail.gmail.com>
Message-ID: <CAD=FV=X8xgn=ueyryFZVA-VNLEU_sk8H29D08JaEpw2Qh2OFqQ@mail.gmail.com>
Subject: Re: [PATCH v2] PM: AVS: qcom-cpr: Use nvmem_cell_read_variable_le_u32()
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rafael / Bjorn,

On Fri, May 21, 2021 at 1:45 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Let's delete the private function cpr_read_efuse() since it does the
> basically the same thing as the new API call
> nvmem_cell_read_variable_le_u32().
>
> Differences between the new API call and the old private function:
> * less error printing (I assume this is OK).
> * will give an error if the value doesn't fit in 32-bits (the old code
>   would have truncated silently).
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I haven't done any more than compile-test this. Mostly I'm just
> writing this patch because it helped provide inspiration for the
> general API function.
>
> Changes in v2:
> - Resending v1 as a singleton patch; dependency is merged in mainline.
>
>  drivers/soc/qcom/cpr.c | 43 +++++-------------------------------------
>  1 file changed, 5 insertions(+), 38 deletions(-)

Are either of you interested in landing this? I guess Rafael landed
most of the recent changes to this driver, but it used to be under the
'power' directory. Now that it's under 'drivers/soc/qcom' maybe it
should go through Bjorn's tree?

-Doug
