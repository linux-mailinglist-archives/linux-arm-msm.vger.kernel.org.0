Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2881E32B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 00:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404228AbgEZWdO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 18:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404220AbgEZWdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 18:33:14 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD53AC03E96D
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 15:33:13 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id w65so12723099vsw.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q7eDCCK4vdx707QDXrWS+1CkYlUEqymIqdCtA3mJzxA=;
        b=C1icVNWRmb8X5j1ahyM4t4ZSYYBo4O04SjVYSIyUCcm+ZHuao35XwDs7rGNdezKWLs
         mohrSjpLZkSxyR8oT0MiAgsV03RqFuZZm2OSKPCKuRZo7x2uLBu8VrSuMGOPZ5Uib6Cs
         mJ5Ddreo0FAxxF2VAOqQr/bUHkPnS8nLfDgqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q7eDCCK4vdx707QDXrWS+1CkYlUEqymIqdCtA3mJzxA=;
        b=CLHE2LpgU22pvrQuScyezDss8Ak6qz/peQuPVZquyiQLrXgrenZZAtV1dp8FNtCTW7
         RCtVa+4bZuVvcLALHIUtFPOimWn+K4HeR7yT3SklCSnOIWBic3yxsz6VpsSihBcO90nO
         kG5JUSCxkamA3wbkkzK5hbj+DR/spgmVPUvchx8C39uEcy/R1aoi3Cpcs+vGI/UhAkNL
         gZO38h8+P3OdTBmRpykH+koaxvHnAoUcuWP13bOHl8g/0u57QN8TxlaCelASJ2lYiHM7
         KMek45cMSSGfgvYYW32qyXopHjbS7swJRLStQAsdTAoXKGcKakMa+nTUQUf1eQJGmUWW
         4AFg==
X-Gm-Message-State: AOAM530uNRKP8o8Am0jHq1n/sQJW0Ue43jTYpXAUHnrW5+E7s8AQQWZs
        dT16dsFfn8COINvMTQoPuAh4zsnUgK4=
X-Google-Smtp-Source: ABdhPJz4lIugFuVumprxRdxTd+LHwIkpByAos3GO5vE0Y0XDBAe0jBJfPm56P+67ePnxHbp6IZE8Gg==
X-Received: by 2002:a05:6102:2332:: with SMTP id b18mr2668219vsa.142.1590532392706;
        Tue, 26 May 2020 15:33:12 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id k68sm87110vsc.32.2020.05.26.15.33.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 15:33:12 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id m18so5432282vkk.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 15:33:12 -0700 (PDT)
X-Received: by 2002:a1f:a24e:: with SMTP id l75mr2903768vke.92.1590532391679;
 Tue, 26 May 2020 15:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200522113341.7728-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20200522113341.7728-1-srinivas.kandagatla@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 26 May 2020 15:33:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFk=itx782nmBxEdpCwFgXGjZCSfW_SgjQhEdR5G2rLg@mail.gmail.com>
Message-ID: <CAD=FV=XFk=itx782nmBxEdpCwFgXGjZCSfW_SgjQhEdR5G2rLg@mail.gmail.com>
Subject: Re: [PATCH] nvmem: qfprom: remove incorrect write support
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     srini@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 22, 2020 at 4:34 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> qfprom has different address spaces for read and write. Reads are
> always done from corrected address space, where as writes are done
> on raw address space.
> Writing to corrected address space is invalid and ignored, so it
> does not make sense to have this support in the driver which only
> supports corrected address space regions at the moment.
>
> Fixes: 4ab11996b489 ("nvmem: qfprom: Add Qualcomm QFPROM support.")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/nvmem/qfprom.c | 14 --------------
>  1 file changed, 14 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
