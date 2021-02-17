Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE9731DBBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 15:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbhBQOzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 09:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233563AbhBQOzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 09:55:13 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490E5C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 06:54:33 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id t11so2449248ejx.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 06:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9eW3LA1cMGZsWxGBTyavm4NRE0/iFEXmezUgPd8JDrw=;
        b=uzRl5FUfskRu8WBAvZjyt8A7P+d4ve/tU0wc6QWHJH/S+68vsn7KeGCY3YCkEv9WDU
         cK9/Q3LYnFUYkeYIk2y2c/kqwzXSzGqLtM4B6xOoGrY52obwH6r4LbAY/43QwZCxDqo3
         dvA9cfbquRhsB6ssjmAPFq6LSLhyLlyV+cn50ZkwRwcVRrDgyS2jb2alg5+Em99L1tEe
         sxAAUc70n6DNWl1cduaVBYOWktxYnJWBwOBTCQdJW1GEcdYacQS976HB6QXZO/DGjwEQ
         Y7ZtOiw2Y504CJ26alsOiakX8diuzGD2xnBy2U1ICT1XnaZ7pcGEWTHu0g25B/JIsBgf
         0snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9eW3LA1cMGZsWxGBTyavm4NRE0/iFEXmezUgPd8JDrw=;
        b=OuQkyocw+oLFucHHGh8KQeZzTik+FT3cESFWoVtU+KZZ9UIm+4lfQh7uO7bySYjEUL
         LHloU9ztYQbs7boMGgXz6OdZWeBF6s3BCz2IP1bKILLrrd4aJG7GNSylP5kLIA1+jnGN
         g/rm8H+Y34zAbLMxSbp4PFnfqdK3JWR69+01lajIOtIn38RwqwEeE+UmHVb6mmtNZ5lz
         j7jD/NJ2fQ6VvnIXRhFx56BPvJy0Co+i+L3H3yqQWDl/r1XmY/XaL4efmFCdCMFG6EDv
         BOtuizi/e5C6Zi6NGzx5qz6I/n/JkUwBweRUQYe3UYVVcr3hNmihZ59Z2K0oIiXbYiL9
         LMTw==
X-Gm-Message-State: AOAM533njbEI5WmOVCyDmjjbvtWh281FUYR4qXSj+5OdMqMWY5OljZRD
        pbzHDi2l0oqJREgs/9H0s26hgINaFYKRzWANHlxg3Q==
X-Google-Smtp-Source: ABdhPJw4kb9KSeUbijA4QgzZlMVsQril4Khu0lYfNxhBSf2zC/5Q2rhbObi2fEGOqL/tHHl+GZc0X53A0dP0sNwftvw=
X-Received: by 2002:a17:906:9452:: with SMTP id z18mr24058492ejx.466.1613573671755;
 Wed, 17 Feb 2021 06:54:31 -0800 (PST)
MIME-Version: 1.0
References: <1613501314-2392-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1613501314-2392-1-git-send-email-jhugo@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 17 Feb 2021 16:02:03 +0100
Message-ID: <CAMZdPi9S5OnWs_QFnf+xVM+jLve6cpdvi_vpC_KdEbUUaqoFYg@mail.gmail.com>
Subject: Re: [PATCH] mhi_bus: core: Return EBUSY if MHI ring is full
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Fan Wu <wufan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 Feb 2021 at 19:50, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> From: Fan Wu <wufan@codeaurora.org>
>
> Currently ENOMEM is returned when MHI ring is full. This error code is
> very misleading. Change to EBUSY instead.

Well, there is no space left in the ring, so it's no so misleading.

Regards,
Loic
