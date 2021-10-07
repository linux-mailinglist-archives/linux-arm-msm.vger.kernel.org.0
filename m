Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF80425AE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 20:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243660AbhJGSi2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 14:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243685AbhJGSi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 14:38:28 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922E2C061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 11:36:34 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id o4so10224318oia.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 11:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=DPdfz9LhT10yj1lJd14D9Hv0w+VSu7/Sd0PK057Fl6c=;
        b=n6Udo2L3qo9ewMgIMq6Wrg7OauFR7+TAdle2qBkii7z5UBvbpCoYA9B5dQnhx3GIBd
         9wLuYh4nmPIVfNlB+L/C6J7vH6upTD6cMqTPd/1pT4Ha8nX+FKMMVYB575+4dtNw6ahN
         JgO8vUqKyWCgtonWsz1UR0AlRLIq/HUinMtkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=DPdfz9LhT10yj1lJd14D9Hv0w+VSu7/Sd0PK057Fl6c=;
        b=8AYaF7MUlG7AXsMIOvpBxNWpNyY5wjxVo5/waCLaQYC5FuKGtcwW9o9A+c0KztW0Ss
         8LvniKLsu+raNpfvCH4gKDhLC9liPGN0H876bRoV0jkQcBe7v9JtbPLh0AhAbxKn8CcZ
         gx3naU2JCasG+x+9JlWqjmF03PLleiP5Qj8vPdXU/yfV+6oHos2poNWkoOehyhRpQFac
         39x9psOHAkMO8apyCBxWedn1iI8pvLdy5YX6Zn7peecUFRH5/KX/AfJVG+uihkQgdErw
         qGaisA4sU0VuKOAu3iHOIGJMq2h6M+d2VlA2T8h7cCRskM4HsEWdRV3Emq6vX5UFlOK6
         mKzQ==
X-Gm-Message-State: AOAM530G8IwqACEoJEz6C1W7yaW+AGGMoydNNxmFWBd8k1rMH5kedqE2
        iaT5p0ImkBRQPZ4C+wDswrPIWvVon28fBXCxKiU2DA==
X-Google-Smtp-Source: ABdhPJxnk8wPPWLKoztpzfVpE4n3ciqpxU3bIEXabE4aZHMsOYfoUNUAEeSniGODpn7Ty3KRhEyp+3b/mIQHV2sfOdA=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr13154401oia.32.1633631794025;
 Thu, 07 Oct 2021 11:36:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:36:33 -0400
MIME-Version: 1.0
In-Reply-To: <YV5KpZJJIk46Nge4@pendragon.ideasonboard.com>
References: <20211006193819.2654854-1-swboyd@chromium.org> <20211006193819.2654854-2-swboyd@chromium.org>
 <YV5KpZJJIk46Nge4@pendragon.ideasonboard.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 14:36:33 -0400
Message-ID: <CAE-0n50nb4n4QZzKbCmKbutHWPogKrEyCvW_9M6+xHs7WFiibw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] component: Introduce struct aggregate_device
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Laurent Pinchart (2021-10-06 18:17:25)
> Hi Stephen,
>
> Thank you for the patch.
>
> On Wed, Oct 06, 2021 at 12:37:46PM -0700, Stephen Boyd wrote:
> > Replace 'struct master' with 'struct aggregate_device' and then rename
> > 'master' to 'adev' everywhere in the code. While we're here, put a
> > struct device inside the aggregate device so that we can register it
> > with a bus_type in the next patch.
>
> Not "while at it" please. The signal to noise ratio is very high here.
> Adding the struct device in the structure is the important change that
> needs to be properly reviewed and discussed, the rename is noise. You're
> even adding an IDA and an id without mentioning it at all in the commit
> message. This should be split in two patches, you can decide whether to
> perform the rename at the bottom or top of the series (it would be more
> logical to group all renames together though, there's currently one in
> 01/34 and one in 34/34, so please group them both at the top or bottom).

Got it. I will split the rename from this change and let things lie
until I change that line.
