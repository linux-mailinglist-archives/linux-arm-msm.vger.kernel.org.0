Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5CC2B7852
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 09:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgKRIUp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 03:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgKRIUp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 03:20:45 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162C5C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 00:20:45 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id 7so1540299ejm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 00:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/PzY1oSFyfx6zTf3Q4FHPCzljOw0r0biB6jIQ79ZS3Y=;
        b=P/KtOYfLJ6HhiVpxOdK2HekyMRWAsTIjOUEg225v+8pRqAxY9rDDQEVfYJAd7miZMF
         aEIO86+ic2008H78Xa2rs8YybOJKCql30FZIcWlQx2LSqHRZA9kKmcBb0BA/t7qfy+km
         CDM9F4GHxPcp/M5Zq4OKmC1+JuaWZ/redGCexAaJd90PLO0DpnvhghgIx9lsZUv7ewUG
         v8vJhOncN3PU7HQMM+hvOpqNRvY9fJwysAsJkoOWHVH8sLCP9nPkJyrJAanaITM8SwNg
         wKu4liFIGFOfX1/2jS9o/7JwbW34lPpkfZq9kHlzVljssSqpm1oAekXA6raWwHUElnYt
         +Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/PzY1oSFyfx6zTf3Q4FHPCzljOw0r0biB6jIQ79ZS3Y=;
        b=X9vEnFAh3dSzoDcszJDFgPegi1ACblu1Ur1s/V0/o/a5WEfUAWwlpyKfYAZerIt8gY
         sdeVGZVeqwNwO1+VWHsIBkzfDKwdS4OsFqsn81NlwHTIg/0z0CD5OGwgk7ruRny/Sj9C
         NW8DGq5bWdsG7r6jYfpppq/fyAHG3nmm9HBHa/0fAj+U+lSKn5849lAI9PEUTcL2t2bv
         uPDMU9ffyUAcxS5zr+cSxXS8FLoEXE849W5RYParXXjWQw7sJTRjoMl5HbulOYnJsXdQ
         vqm7S2GBwhBFqnowMrA2OdrEN/VvXLc9Z1wqh+isW2foq9KftM7+TghI1UJFDzFN0iXE
         TpGQ==
X-Gm-Message-State: AOAM530/E4Jh6oTwljZiQi8y9Zye6nh87hPufr89nNYfoh6WiZCdit8v
        QC4/tEBUysB62JN3HaZfAirqjHxbYd6E/eXrfTQO0g==
X-Google-Smtp-Source: ABdhPJzNSjc3Rejjfgke4Bfbdo3qtTUdAG8jD2Ao5fvpNzD0J8orL37AclVLX2u33a1aq3BV7rDbgTilEvG6MfY1Teo=
X-Received: by 2002:a17:906:38db:: with SMTP id r27mr23295781ejd.328.1605687643768;
 Wed, 18 Nov 2020 00:20:43 -0800 (PST)
MIME-Version: 1.0
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-2-git-send-email-loic.poulain@linaro.org> <3e72e0fa-1bba-20af-1e2a-1b7981bfd39d@codeaurora.org>
In-Reply-To: <3e72e0fa-1bba-20af-1e2a-1b7981bfd39d@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 18 Nov 2020 09:26:48 +0100
Message-ID: <CAMZdPi-BcjtF55DMJi60JsYNbOo+ypBmkqnq62NyeJ6G9X=w8w@mail.gmail.com>
Subject: Re: [PATCH 1/8] mhi: pci-generic: Increase number of hardware events
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Nov 2020 at 04:54, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 11/13/20 6:59 AM, Loic Poulain wrote:
> > If the IPA (IP hardware accelerator) is starved of event ring elements,
> > the modem is crashing (SDX55). That can be prevented by setting a
> it is because of event processing is getting starved ?

Yes, and hardware does not like that.

> Event ring elements = 2 x xfer ring is good for HW channels. Do you think NAPI
> polling would help when you start verifying higher data rates?

That's a good question, I'll certainly test that. But we still need to
ensure this will
never ever happen with this higher event count.
