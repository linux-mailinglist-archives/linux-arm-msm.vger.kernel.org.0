Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C581C190E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 17:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729429AbgEAPKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 11:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729340AbgEAPKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 11:10:50 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E11C061A0E
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2020 08:10:50 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id g35so3855649uad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knTG2gmvtoT22+XOsX7dmFpVAGO3ao9zwsfFiTXURTg=;
        b=i5JF31iiDLo6z171lTJxhjapmVJS9gqP3xgHzEmURWBZ9ZrO+wXla6ynAK3ki/7XPX
         sRwv80rlH6ndWj4Gju7PPJfTN9R8SjAgNB8Ev4Z37QlaoWQGa2up1QK2IwuGgWTxfCp1
         86gjvyWw9Ih0xsuuDS86kOVoOpHcVaXBZSNjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knTG2gmvtoT22+XOsX7dmFpVAGO3ao9zwsfFiTXURTg=;
        b=osdpPal+Kou8ETFNOUgzFMyWQqM0ALPovPwA6PZTe0h+Hogr2CwI62SPz/2WYGRXu8
         v7o+HnSLKfjV/RpZ2dYtVMDhBrwEoJ63sOgYa04jHs9Lq/ErTa4NP4ZTKVZyTBJcowVo
         lZ/1YPoYOBShKyoVVWGD9CVuApSSa4aIpGXbFjKda3a1CM9JqcImqA3ZtNh/XEq1TvDa
         BQBHMGjkj3TbOu3crFArRPFaEKzuAEnXN3SXcLpXMm9p+h9kiFBCbaVZUSWpWlfgOpfy
         CrvWGRNbU/3JC91CgiAdlnz8Icp3exfPN24nV8uixgeux34SFlBpiJod7pXOcq8V3tuI
         No/Q==
X-Gm-Message-State: AGi0Pua7wqul+1OctFoi9iDPPnUxHibBBKdF5V9T8yi1iUd2cwz69SW5
        +ZybnGRwjD/nSDr1XUjwCAkvN/OE4fc=
X-Google-Smtp-Source: APiQypK0WiWX10AtA2ztbblT2ZO8xhT13X166kdCUpy0PSuUqjL7fdHW5E0dQ5Spsb/Bn4xpdlUzYw==
X-Received: by 2002:a9f:304a:: with SMTP id i10mr3225904uab.26.1588345849129;
        Fri, 01 May 2020 08:10:49 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id u13sm759998vsg.12.2020.05.01.08.10.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 08:10:48 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id b5so6447853vsb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 08:10:48 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr3622452vsq.109.1588345847717;
 Fri, 01 May 2020 08:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 1 May 2020 08:10:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8phQsc5SSUdqw-HRPYzW5QoEc8NoVJ+ZXQz72FgEPug@mail.gmail.com>
Message-ID: <CAD=FV=V8phQsc5SSUdqw-HRPYzW5QoEc8NoVJ+ZXQz72FgEPug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add affinity callbacks to msmgpio IRQ chip
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 30, 2020 at 11:31 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
>
> Wakeup capable GPIO IRQs routed via PDC are not being migrated when a CPU
> is hotplugged. Add affinity callbacks to msmgpio IRQ chip to update the
> affinity of wakeup capable IRQs.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> [mkshah: updated commit text and minor code fixes]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Tested-by: Douglas Anderson <dianders@chromium.org>
