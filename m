Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C68C1B03AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 10:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgDTICQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 04:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDTICP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 04:02:15 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10379C061A10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 01:02:15 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id s5so3269586uad.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XGNbQJnwncFtmSfnnq7BG7mTK5kM8GPjPL8s7er/Oug=;
        b=FPbM6YGm0+2v+a7dfLD2r1xsPIdoZzsB3WLcQQpt+iiMZ0ZPr6E+Xmah4VeCnoBVwM
         1XI9tGVqd+amR+wTuvVcSje66GPeBZyjeGx2riOIZ5WnA0cCWkSXlmOFJdYy3+7LumtF
         LXINRU0UpApdf0FihchJuJxe9kxYFW70+mWB6Od3Fk7CyKmTnue8LmsJWXLJ87jKt7pH
         zhpqlZ7rQaVen8QMRXBN5XO7XD2vZOggFT3VHz80jzrnbGum40+ZXcX+aR8JsRCbvWl/
         NTVTFHylhWw+j9qoGVrOVHACsQIgRAs2mxa48rsE1VTGzlzxfi5LNYP/TNrD0oFSu+Mr
         Qqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XGNbQJnwncFtmSfnnq7BG7mTK5kM8GPjPL8s7er/Oug=;
        b=ZMBPOTFZVLUiaKcb83lnq5JMJlO11K0pOqN4zqZgrPfiBKo25L7w7RJ7x+DM4Lp6vB
         61vi1shpF5j2SBAEFSKujhZxc1ZenyQr+JVaxZbjSIwEtQIrOK8dFfozbwEYxsYr6Fgi
         BG67jDGhmvQSfsOq4MDqII64Lm9G64crSIHh30eRCPckKR8aFoVNsyqEnQnpOZLyUb7m
         R/5LlpzpSVnSnvDYbsVCFuCNXAQEVDZ/MRVKBt1oHKaOXuDSi2pXVbQP820GsHp0meha
         +Jk7JsMBqfb2j87ZUGfuHNpVOtjUtmXMy/FeiEoJgd4QsXdfxapHCIN6TQzFuvLfQpbm
         9bhw==
X-Gm-Message-State: AGi0PuaDWmCBljQnrw+Ydw6Ie/PT1mDtBIPel0F5qgF2fACmUSJm45ot
        L4eEUy+WvdJQmftvhkQ15iQXI0yg8xTSUrwD3DJ+PA==
X-Google-Smtp-Source: APiQypLaYCzytAomXpGw0KpBtvlb+IMYlHUaXnefkBr/mv0cHGOaEE/8DDORc8fTsMLcsoUj78yspHZlXLsrfKD9OfU=
X-Received: by 2002:ab0:6588:: with SMTP id v8mr6202526uam.100.1587369734116;
 Mon, 20 Apr 2020 01:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <1587363626-20413-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1587363626-20413-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 20 Apr 2020 10:01:38 +0200
Message-ID: <CAPDyKFoOq3djNJzEppPwSUUfKYh2vrkcr3LmDEbfwPRa=Asphg@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] Minor fixes to sdhci-msm
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Apr 2020 at 08:20, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> Enable a couple of CAPS that qcom sd host controller supports.
> Set a quirk for enabling support for auto cmd12.
> And enable adma length mismatch error interrupt.
>
> --
> V1: https://lore.kernel.org/linux-arm-msm/1586706808-27337-1-git-send-email-vbadigan@codeaurora.org
> Changes since V1:
>         Squashed two caps related patches and appiled stable tag.
>
> Veerabhadrarao Badiganti (3):
>   mmc: sdhci-msm: Enable host capabilities pertains to R1b response
>   mmc: sdhci-msm: Set SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12 quirk
>   mmc: sdhci-msm: Enable ADMA length mismatch error interrupt
>
>  drivers/mmc/host/sdhci-msm.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>

First patch applied for fixes, the other two for next, thanks!
Kind regards
Uffe
