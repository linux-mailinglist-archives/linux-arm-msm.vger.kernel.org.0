Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015E148E155
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238331AbiAMX7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235488AbiAMX7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:59:20 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF040C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 15:59:19 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id n137so4517051iod.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 15:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=swIc/YWTqbGW2vcyyUIZkfdZFHgU9akpO8dYNy7F6xA=;
        b=EjkzCDcgo7ZyV4PO+uVAMn4JDhGaueEGmMc0OYkIWH9ILkxltTpF196jvdmKTwXb23
         zPjjQSH4wOpZI+g7y9bFKClM7qYSMvCWUjTpWBvOQC1nL1yR3g/W4TE6JfpBNqjHilgH
         /X/v4HdHgMmjH310RdfzAadJNFuKbntDv2xP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=swIc/YWTqbGW2vcyyUIZkfdZFHgU9akpO8dYNy7F6xA=;
        b=1QIf+CAAgEN5XUFaYKfmxaDPpnew4w7/mP1jYloc+5tvmx+AMmA/YHoCsrr34iwF3y
         bSw6sijUag2lfFsM/aplMK3UIfGdPwgu2WrkOzlPUFxD1G1ji3YhIjCa6g40ZGMM2sdf
         GFET0BlFpK6Dav+YBB788igrK8P7w8p5lCiVXUxDtPmUGhN6kaciuObgp0kfE88Xi0jB
         csZWHYEXpnSb6ZISD38CvyfWU51BKkfS1vm5hWV9gTtOyUOLenhmZUVyMocg7rP22/J/
         ZbSwRMWS1AUa7YN3CoTz8SQ7YSEt6zdFvRR0MYk59a9iZX8duz2ugGwizCl7nVRcCCQ1
         76Ug==
X-Gm-Message-State: AOAM531dGl3sVU7FzfFl+aV08Udn8xrdWdhBdDBqnwrZjtUsaBJ63H/r
        p720rEzDgzQtYPUxospN4iOfQYqp9+flWQ==
X-Google-Smtp-Source: ABdhPJyAwQCz31yVgKNgpa/Hfs3yZxsfLEbvA3vzD1qTsqhwfus8ye1P4TQS9iBWhURCKbRe3SGfBg==
X-Received: by 2002:a05:6602:2a49:: with SMTP id k9mr3221095iov.168.1642118359107;
        Thu, 13 Jan 2022 15:59:19 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id b4sm3399368ilc.30.2022.01.13.15.59.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 15:59:18 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id d3so7067987ilr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 15:59:17 -0800 (PST)
X-Received: by 2002:a92:c202:: with SMTP id j2mr3338009ilo.165.1642118357532;
 Thu, 13 Jan 2022 15:59:17 -0800 (PST)
MIME-Version: 1.0
References: <1639587963-22503-1-git-send-email-bgodavar@codeaurora.org> <164036941060.3935440.13095761506560620701.b4-ty@linaro.org>
In-Reply-To: <164036941060.3935440.13095761506560620701.b4-ty@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 13 Jan 2022 15:59:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vdjw-6GytO=Rpt==OYbnrNon3pYQnrZtUT4vX11S6ykw@mail.gmail.com>
Message-ID: <CAD=FV=Vdjw-6GytO=Rpt==OYbnrNon3pYQnrZtUT4vX11S6ykw@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Add bluetooth node on SC7280
 IDP boards
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>, rjliao@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        saluvala@codeaurora.org, LKML <linux-kernel@vger.kernel.org>,
        hbandi@codeaurora.org, BlueZ <linux-bluetooth@vger.kernel.org>,
        mcchou@chromium.org, hemantg@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 24, 2021 at 10:10 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed, 15 Dec 2021 22:36:03 +0530, Balakrishna Godavarthi wrote:
> > Add bluetooth SoC WCN6750 node for SC7280 IDP boards.
> >
> >
>
> Applied, thanks!
>
> [1/1] arm64: dts: qcom: sc7280: Add bluetooth node on SC7280 IDP boards
>       commit: 3a89ff3087c03c2295250c07234efa75873c7b51

Just to confirm, this later got dropped, right? I don't see it in the
Qualcomm git tree, so presumably it'll land once the merge window
closes.

-Doug
