Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7962D32CE97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 09:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbhCDIhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 03:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbhCDIgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 03:36:55 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E16DC061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 00:36:14 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id y67so530857pfb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 00:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tyImSAmUouBU0h3BNJjpkZEX4MBw++5drbgZz8hDIGU=;
        b=NUQWaSsj93C5Ky69q4BObjnxtVE2K7CfrahBU5OpyXBpZGhEEZc3annbEsYt8PUuOq
         SNjF04wsEOQEoee/uZtjDXy9SSzLuQLgT1LEnmpm9RiFQ98T89VISksoM+jESqSIcaqG
         XYygQ0iPMmr0lKh8ZOdgWOBowFf42hsTt82UTZ0DHxxC8OnUNj3Ju/Xvu9NBuu8lsG7y
         IZV5Ztyjmn6pqM6N8NT45aN3Btil4faQLRcjKOA2kuiAnoQA4Zy4Cd2aW0TJlc9+mkC/
         Z6wyrI0xk+YFTKiSoFRPRyyqpDZKvXrsmtOl0bPiHTfWUDEQARg2Mbb8P1EwvBObLiWZ
         gGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tyImSAmUouBU0h3BNJjpkZEX4MBw++5drbgZz8hDIGU=;
        b=mmpdyoNCgpOCv2tbJYBJUXsCHOIzfcKEWwouJW+pf/a+Cz0+vsfUvjcLjmZhkOUwRd
         uY77opMoCKu73tEZBRxPQs0c6/IiaxwhieQvtI6c8izmoGTCStR8nAZmXVZ7npDZ8D/9
         y24x/0/iNP9gENwo3sykSyuStD4VLENQUhsf8n/xq/XPaX4Rlrzwh0p0d1Rr93YkkkVp
         LqkfKG88UG40JxmG3c2Aj58Nzvjpr5csynp/WOY+kxc91cI1CXhyyw2w2DlKMQYjCXOg
         5E0eeEy/SYT0ZCnTCytbMO2ZUd0G/Kh4oQh4uhk2LGkDE0CVXxbj8IhzCCu4UYKWJO7I
         70LQ==
X-Gm-Message-State: AOAM5339a+0J8pS8BoOKQoXwYXqhM1TI75502moSGwRfvJWGCqnjGiku
        w8R+GM1nb5Ty0MwmCmBUtM6F19pZfcv9KNXo0MaHOg==
X-Google-Smtp-Source: ABdhPJxQBtHw1i4ZPvEiZS8wmBt6nb5GXv5qS2vqBe355hz5013lm6CPp/mZXzgMk6I3KU5CiyHwJ/LJ9BgS22v8lQI=
X-Received: by 2002:aa7:9341:0:b029:1ee:ee87:643a with SMTP id
 1-20020aa793410000b02901eeee87643amr2868608pfn.55.1614846973885; Thu, 04 Mar
 2021 00:36:13 -0800 (PST)
MIME-Version: 1.0
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org> <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 4 Mar 2021 09:43:52 +0100
Message-ID: <CAMZdPi8s8Sp1eaqjTbxUtqiNgDXFa5a+GJnp-LmrDc-8ORCOtw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] bus: mhi: core: Process execution environment
 changes serially
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Feb 2021 at 00:23, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> In current design, whenever the BHI interrupt is fired, the
> execution environment is updated. This can cause race conditions
> and impede ongoing power up/down processing. For example, if a
> power down is in progress, MHI host updates to a local "disabled"
> execution environment. If a BHI interrupt fires later, that value
> gets replaced with one from the BHI EE register. This impacts the
> controller as it does not expect multiple RDDM execution
> environment change status callbacks as an example. Another issue
> would be that the device can enter mission mode and the execution
> environment is updated, while device creation for SBL channels is
> still going on due to slower PM state worker thread run, leading
> to multiple attempts at opening the same channel.
>
> Ensure that EE changes are handled only from appropriate places
> and occur one after another and handle only PBL modes or RDDM EE
> changes as critical events directly from the interrupt handler.
> Simplify handling by waiting for SYS ERROR before handling RDDM.
> This also makes sure that we use the correct execution environment
> to notify the controller driver when the device resets to one of
> the PBL execution environments.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Looking good now

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
