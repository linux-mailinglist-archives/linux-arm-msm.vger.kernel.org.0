Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901361A01CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 01:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgDFXsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 19:48:25 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:41978 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgDFXsV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 19:48:21 -0400
Received: by mail-vk1-f195.google.com with SMTP id i5so369527vkk.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 16:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wp76Kyvm8RQcxJEi+GNTFvD7u58xFm/eeI8yCkx9UaY=;
        b=a9DPGYBxfRaFFN12gfMUgDgWSgr5qMmjAZptWkaGgrp03DY0V2eTWC6fVwCFLzgzXJ
         cMUG6A8aWKicmrgPJSJuMNmpqDa6soOUMRpyYwMYWuolFXrl2KdF+hS7XzofYtx72G6V
         nQq10sBt14qxL361HYyCzi4akknL4vLOtOIoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wp76Kyvm8RQcxJEi+GNTFvD7u58xFm/eeI8yCkx9UaY=;
        b=UpDzKu4PBBd5Jaj4j54A5o2XDLyZyR3DJ6kjddAz6ym/gxa7mixLE2zymN3e+cL00g
         Vl+qTRPjTyVFBeosJ/dC8mJ+njP5Vvw2jGgnCIIODM/UIy7pRqGpcqzVObRXcmKnlWkj
         OAAaJfSIGWKlPXkUNOFYwNxvwwf6tkl1edh4A30KOqJOhTMZ/V/s0yTQictrNWNQFx0b
         uNBFNAYs35Y7ur7i8fiklBYAoFPHuIPJnc8nS6qjUA6RqTN+elMz7bFVCy+SDSq+ThLA
         moNbLwOmDmpI+WyPmH26XuC09rKMr44R2dsTbSSfWgxGzN/dTSYeBzxd00fpbkyQeuSd
         fGYQ==
X-Gm-Message-State: AGi0PuZ42UuzMgaWKTsB60/A4A8RHtccF4Z0zgmIl3hDC2kR4jq+XEw7
        fskciWpGBZMvjSIC+aRaYnoWtujLn1g=
X-Google-Smtp-Source: APiQypIX0kg9KXCtR8kFsTC54a7+zgoP417/BEOfAGHp3gCtXRxG1jVm9QlwnpdOd5Y9Z/65qtUQAg==
X-Received: by 2002:a1f:e004:: with SMTP id x4mr1399818vkg.79.1586216899878;
        Mon, 06 Apr 2020 16:48:19 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id e11sm2271781vsb.18.2020.04.06.16.48.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 16:48:19 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id s10so1045842vsi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 16:48:19 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr1969972vsr.169.1586216898579;
 Mon, 06 Apr 2020 16:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org> <1583747589-17267-9-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1583747589-17267-9-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Apr 2020 16:48:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNBkSOgFfZCg_jG91rBBmE+MZwsHhymOg-MD+9roqWkA@mail.gmail.com>
Message-ID: <CAD=FV=VNBkSOgFfZCg_jG91rBBmE+MZwsHhymOg-MD+9roqWkA@mail.gmail.com>
Subject: Re: [PATCH v5 8/9] arm64: dts: qcom: sdm845: Add generic QUSB2 V2 Phy compatible
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 9, 2020 at 2:54 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Use generic QUSB2 V2 Phy configuration for sdm845.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Wouldn't hurt to add:

Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")

...in case this lands before the patch John Stultz sent out and thus
makes it to stable faster.

-Doug
