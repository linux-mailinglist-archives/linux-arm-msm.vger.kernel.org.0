Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07A11179434
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 17:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388024AbgCDQAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 11:00:32 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:45463 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388019AbgCDQAb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 11:00:31 -0500
Received: by mail-vk1-f196.google.com with SMTP id f17so688079vkk.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 08:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SqEs55y4dEw5uRAexZmSkf/N7GxDvacFCfzXLumfPhk=;
        b=T+Yk5UsXq7hnVU0JjnMyTsBDjOuUJFVmT8YM7D0B51N0UZCTVLldZ0uTHWY2NX0wmP
         K8/nKQdhdrrW173wgG+t8GgRNOcM1LrjK22agARS/gkJaRhmZAE4xUtS3xP37JDWTITE
         OUGGD5uVCJJXMUhB+NUPrmsyBnhPeGPpopfTODebAUmbnkR2XWQAdTnTuSDQ7K9WMS8v
         I7BqvtLfMPtFfg+qcZ2gHB2RRjNmV6zG6HVqlDxQMTO61Z6oPyBJLtC08tLSUgBhzrs3
         l4iJUufZ8exJmMweJO6TKMhvJhpSvQKu/eX32eU9iXl3TDfax6nMDGSHOTdTsi3yPCMp
         Xd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SqEs55y4dEw5uRAexZmSkf/N7GxDvacFCfzXLumfPhk=;
        b=RS76NuEz/b7vLHKEw+rZXPISmeNa3p0tpl/J/7QEBP3oCy619o4dA6pX0v8W9SRulR
         thk6x8231RZoz97saJIoUJXOBA93lADtw1/agcDIYL72G/Tku9XQ/59jfnM7GaeGiX2t
         Sio57NBVQARe4pWz20ATBbQIhWBuHTGGbiiPQxVH58eAVg4+MlRqyNs5w2awipRz6p4M
         XBf4JtxY98d/E9En+t5r8Vec9bSF+UioKmO8tLzkrzG56qghevcEo3/iVmV9w7pir1kc
         C2IrkPxLC2ZEks/ShvVc6E3NjlGVm0YGxxnrr43o8dujOY66lap6VNIY2VK8zWl+nO8X
         Hrqg==
X-Gm-Message-State: ANhLgQ3Uc0mV7VFJWl91EQLF8cFzZtiUTinMOb3/vlHspCnRTABPpjar
        +Gpc8ez7pG+zBuhErIRFTARl887JhuY1RDBcZJy/8g==
X-Google-Smtp-Source: ADFU+vvDe6AUVq7FvlD0Zl/y/Oj3Ne1SZTjBontrgT4tGULO92r4fXatr48O/ebUZw7D/ayIYX1ZG9T/mmjQx4yXLIY=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr1841139vkn.0.1583337629345;
 Wed, 04 Mar 2020 08:00:29 -0800 (PST)
MIME-Version: 1.0
References: <1583323250-23596-1-git-send-email-vbadigan@codeaurora.org> <1583328320-9981-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1583328320-9981-1-git-send-email-vbadigan@codeaurora.org>
From:   Doug Anderson <dianders@google.com>
Date:   Wed, 4 Mar 2020 08:00:19 -0800
Message-ID: <CAD=FV=XKFa3vs5Fv0DUwYLF8o4s8cCAsSudYGMn3XZ73wVoOdw@mail.gmail.com>
Subject: Re: [PATCH V2] mmc: cqhci: Update cqhci memory ioresource name
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 4, 2020 at 5:25 AM Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> Update cqhci memory ioresource name from cqhci_mem to cqhci since
> suffix _mem is redundant.
>
> Only sdhci-msm driver is making use of this resource as of now.
> No other vendor's driver is using it. So this update shouldn't affect
> any other vendor's cqhci functionality.
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
> Corresponding binding change:
> https://lore.kernel.org/linux-arm-msm/1582545470-11530-1-git-send-email-vbadigan@codeaurora.org/
>
> Changes sicne V1:
>         - Updated commit text expalining this change affects *only*
>           qcom cqhci functionality.
>
> ---
>  drivers/mmc/host/cqhci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

...now I guess the last thing is the dts change...

Reviewed-by: Douglas Anderson <dianders@chromium.org>
