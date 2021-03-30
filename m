Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DCE34E294
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 09:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhC3Hxz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 03:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbhC3Hxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 03:53:44 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CE5C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:53:44 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o2so5726124plg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sSZY0eJ77vdtYQefXb2yo/92zDLVSNWjzbsQ6OFfRDY=;
        b=EVbwTv02+x9ZZzeuFpVvG1763ys6pi18GwTHaYzg7QhVSefOeHqlRabQ19roKqUvnc
         61Ttv9P79rA9wnYQlp+7NssWHpG3zGqm3bb2u0wyzAbIZ/B4QoMMesxBuxvA/U0r1F87
         KiT0NDeS9VkKWPopX175eLTj8oCEx0uYTU6UK8kX/O1FYbY5MguxiB3orbx0Za8hTVvM
         1PyB+l+9zJ6IiD0+Q3XyDY7o8m7AYmTlc0m/y7Myjt9CL06a3/DisR48cNlT7B+j8Ukh
         zap77UZ2CP9YEXnuxgn+FAKzZamGmnYzzHVzeFvWFJxr7RoNZAShd+75W2pMOL5VuQMd
         T5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSZY0eJ77vdtYQefXb2yo/92zDLVSNWjzbsQ6OFfRDY=;
        b=RN8mvbwe0OPD9zyNyZo012DsirB5p7moRZGaRNXE7G98Je2FDmoIzrIu5hsBvppZOZ
         ODmKU8JpziItOYdhospGt5rxt46Q7N0XJKrIRFI48IPwPMW2SRBTB/LOfgCGl2jp/NjY
         zoFwzK8Lb9PE4FfVa16q/PK5Fx42Twsgn5IWC+Id++8r3wRfBg35Lx3EP/hSDA8dBetU
         JLjkS8LbWqNan4PtbONEU/4hks+8b8d7ltFfJokaXP4rQ4X62zTV4S2j9w58YiCr3WhV
         Bvtc/oRAvK01ZQZd0QCd5C3kow1uPZw+XCsUK1BgJEnknsa/6X++u2aL+ZOYkLucBUaq
         lTOA==
X-Gm-Message-State: AOAM531wbMV9DlY/XQAgXuRLYz94HT9t2LVbwQjwXM5QWr4CdR2pDNbU
        tYI1oBuLt/Y+wjwhIvPf9DWTwpyKOX4OgJ2WoqnDwQ==
X-Google-Smtp-Source: ABdhPJzrbhDosdqkF9Wl5ayuaorrj13GIgInJxIUci8Wxhc58N/za6y1BfQDth8/QPB2EY/A+2Eiyf+Cww2UkNfo/g0=
X-Received: by 2002:a17:90b:4008:: with SMTP id ie8mr3140931pjb.231.1617090824200;
 Tue, 30 Mar 2021 00:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org> <1617067704-28850-4-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617067704-28850-4-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 30 Mar 2021 10:01:53 +0200
Message-ID: <CAMZdPi_wwBt99yGDw9AkeF0AB11_MyTr3o__srqj7QnpHzTX3w@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] bus: mhi: core: Handle EDL mode entry appropriately
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>,
        abickett@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Mar 2021 at 03:28, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Device entering EDL or Emergency Download Mode will be in a
> SYS_ERROR MHI state. This requires MHI host to proceed with the
> EDL image download over BHI before device can enter an MHI READY
> state and proceed with further bootup. Allow this to be handled
> by relying on the execution environment check after SYS_ERROR
> processing to determine whether to wait for an MHI READY or
> download the EDL image over BHI after moving MHI PM state to
> Power on Reset internally. This way handling is contained well
> within the MHI core driver and helps pave the way for Flash
> Programmer execution environment functionality.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
