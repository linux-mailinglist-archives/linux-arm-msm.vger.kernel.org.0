Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C42AD3FDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 14:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbfJKMpn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 08:45:43 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43963 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728094AbfJKMpn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 08:45:43 -0400
Received: by mail-ed1-f65.google.com with SMTP id r9so8543325edl.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 05:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=THhY/1EGBLynF46Z73peTNxgaGDlKI+6GP0+2FXk1Ng=;
        b=n44cT7lO4rFbJWSui7nkMhtOmcD58/YEEM6gDMqOIGKg6m4xltmk1OmrLg8Ay/C90p
         NT8AxiGcmIzLZqgiK7yhbW/lR36g5QXs9B4NvSOcgTgqcy0eo7CnGqYLCu8fYCqqNp4y
         TSQ4B18sj3LAIW9pJ4A3z4YtcOb2ZsbnmhiA/9fGuKREgPPxUXBeonRmwGjN6g8iBkFN
         rz4npojrDH1SHrDSUBLM/o/bz6usKSFcVwqIzbI51vCem+3CsnJtPoSvUiFUg+VB3vVP
         SBHQj3fnYZQZ054lbAaSb1WSoaaPvtzL6xZooechaqDCYnzOt+tKa0jUxd/7AqxPuGRo
         okmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=THhY/1EGBLynF46Z73peTNxgaGDlKI+6GP0+2FXk1Ng=;
        b=fncW9YRyiXLugbQO/tmSy6PEtKzMIGnlh8opZLofCJfUEIZbcLOPu71+jM10MfubOG
         HqoQ/9x6CGOcCU0R6Hq/5P0wzuJ3v814SyCsx7Wk9JPkougkH7mLrTU3bKR5FLy/kIE/
         YOTQAKZPvKQGVIrOuzQ0cGmK+C65irRDwOaQI/7qVqOuKtMuRsLf6hj9iBc4NnGdfBpk
         TrPWNM1nCnQL8LGQjmA+yenP4T9XLUxCx0qMFdns/HBcyOK3n8E9dOI7PuNz5cTRo5Of
         FNSwS0hiT7O75LI+Bn/gD6UuI9s132MXAt/kQLOdmWNPgqMCUV8cVby010Whq7ZNc/bN
         U0Ug==
X-Gm-Message-State: APjAAAXmEo60erR+ORilyfWjDt0N6zFCNMweTJpX2iF4+KaqnlUcczBZ
        YXK+jD1ASX7/ajAjOIenzLYdAZ18hqYuDtdYUC+qSw==
X-Google-Smtp-Source: APXvYqy3nGLibHdKisoYfTTSDKKkcwK6O7yckg02ABEzONB7OV+W/kXsaZilpbqhNZPBbZY2VH1MkCkYrA2kpd2E8t0=
X-Received: by 2002:a17:906:48d4:: with SMTP id d20mr8779018ejt.246.1570797941402;
 Fri, 11 Oct 2019 05:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191010143232.GA13560@harukaze> <20191011060130.GA12357@onstation.org>
 <20191011112245.GA10461@harukaze>
In-Reply-To: <20191011112245.GA10461@harukaze>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 11 Oct 2019 14:47:05 +0200
Message-ID: <CAMZdPi9hTQQcFHMRkj2R9t-P9AiPh01hKGPP5_F8T+MUuckVHA@mail.gmail.com>
Subject: Re: msm8996: sdhci-msm: apq8096-db820c sdhci fails to init - "Timeout
 waiting for hardware interrupt."
To:     Paolo Pisati <p.pisati@gmail.com>
Cc:     Brian Masney <masneyb@onstation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, 11 Oct 2019 at 13:22, Paolo Pisati <p.pisati@gmail.com> wrote:
>
> On Fri, Oct 11, 2019 at 02:01:30AM -0400, Brian Masney wrote:
> > I encountered that same error working on the Nexus 5 support upstream.
> > Here's the fix:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=03864e57770a9541e7ff3990bacf2d9a2fffcd5d
>
> No dice, same exact problem.
>
> But the patch is present downstream[1]:
>
> commit c26727f853308dc4a6645dad09e9565429f8604f
> Author: Loic Poulain <loic.poulain@linaro.org>
> Date:   Wed Dec 12 17:51:48 2018 +0100
>
> arm64: dts: apq8096-db820c: Increase load on l21 for SDCARD
>
> In the same way as for msm8974-hammerhead, l21 load, used for SDCARD
> VMMC, needs to be increased in order to prevent any voltage drop issues
> (due to limited current) happening with some SDCARDS or during specific
> operations (e.g. write).
>
> Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994 regulator node)
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>
>
> so it's probably worth carrying it.

I've sent it to LKML, but it has never landed (and I've never followed-up).

Regards,
Loic
