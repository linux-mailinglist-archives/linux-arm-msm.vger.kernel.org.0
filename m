Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9EFB34E298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 09:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhC3Hy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 03:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhC3HyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 03:54:25 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34962C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:54:25 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id q5so11583744pfh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 00:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6xBOtMDdbxr5HDgap10cXG5BRbETw5pQ3C/OZJonZs=;
        b=Uci26Z2mtd+jak/mQGH98QD/nBDMgwpBGMutIO6S94hfdIGHR6uklHOJVkDEpDe2/J
         MaOeQyhL1b8FUnR3zzP2gcTSB8qybI2CKrI7si3nngLQvpk6pfIil23mkMLzVXEfHHOU
         blEkO9tDRjVln1OhEAGx55/1TA6eq4bcEML8zPhZsYZ5uZcPG8BQkf87klt7Km6n46k7
         wixUAq7nifFDBfbr1ntx6YaNIjo45W6hxM9BU78keHo+4bxhJlyX+GXfugVS/O2w1gm0
         RrDbKm31bQjKxWkK47z27qMgji1tYt/noQTaHyEtFpyWvXMCxH7HiGJNK5PbGZiHysNn
         7zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6xBOtMDdbxr5HDgap10cXG5BRbETw5pQ3C/OZJonZs=;
        b=lPayOXNRoIUNmNQCHNym2PvS+Ljx5aibFRR5Z6mPUmzWFzyzuyX4t063jVJvwN+Xei
         CacgiN0wDTqNF6EmV4tVrkn/rsd1MPKVZ6nLhO9FlLFeXK5bZ6WK3IhuAe2qOaNKgcMS
         AXwU54sTBDHC3bFhs9j9yA6c4/rs7w71UnlBSNp4i1x8v/4x6I4I52T8boWvE8zIhzmj
         bXCPvhRqdVdHdnij67PMxv395BQ8ItOaxTbVLrTHUnmNWKtQboej5u5EgWnKjMbdA/9e
         bBdyXgbkLcjyoaXLDiBTl9kjXIwgpEr/ckYF/AXGuSH0y1pxLjz5wuWadXA644P9OrYA
         FKIg==
X-Gm-Message-State: AOAM532zIq7RBg/M9Sv6zvOrfUNrOE62NznOq5q4mWa3l1yVUYv1QPpn
        nLSwvbRi89D6iGQYhbjAo7lun8ry2uf8jl+77e5P2j7tK8Dv6P1i
X-Google-Smtp-Source: ABdhPJyUl+8OdOBRXTgZxc82QXCZsmFz93V/gzl7p/ikgaqaD1sK13AXPEIQXIH6CVBEKd5l/9q/rbpboyAMIZQlWeE=
X-Received: by 2002:a63:f903:: with SMTP id h3mr7821483pgi.443.1617090864752;
 Tue, 30 Mar 2021 00:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org> <1617067704-28850-5-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617067704-28850-5-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 30 Mar 2021 10:02:33 +0200
Message-ID: <CAMZdPi-biACwrE=jeFXqgkCAZ3YpX8+vzqEaB9CuyepbhiKb7A@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] bus: mhi: core: Add support for Flash Programmer
 execution environment
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
> From: Carl Yin <carl.yin@quectel.com>
>
> MHI WWAN modems support downloading firmware to NAND or eMMC
> using Firehose protocol with process as follows:
> 1. Modem boots up, enters AMSS execution environment and the
> device later enters EDL (Emergency Download) mode through any
> mechanism host can use such as a diag command.
> 2. Modem enters SYS_ERROR, MHI host handles SYS_ERROR transition.
> 3. EDL image for device to enter 'Flash Programmer' execution
> environment is then flashed via BHI interface from host.
> 4. Modem enters MHI READY -> M0 and sends the Flash Programmer
> execution environment change to host.
> 5. Following that, EDL/FIREHOSE channels (34, 35) are made
> available from the host.
> 6. User space tool for downloading firmware image to modem over
> the EDL channels using Firehose protocol. Link to USB flashing
> tool: https://git.linaro.org/landing-teams/working/qualcomm/qdl.git/
>
> Make the necessary changes to allow for this sequence to occur and
> allow using the Flash Programmer execution environment.
>
> Signed-off-by: Carl Yin <carl.yin@quectel.com>
> Co-developed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
