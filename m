Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88ECC13A65
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2019 15:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfEDNgJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 May 2019 09:36:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46462 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfEDNgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 May 2019 09:36:09 -0400
Received: by mail-wr1-f65.google.com with SMTP id r7so11246329wrr.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 May 2019 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OwPfwZcZ52bpY4HX+FooZLavaLrComJSJs44yQK5qbw=;
        b=fESV9dGYWNxFNa6dJB2+Ehn96BhGmG1wnDc5BenilN4ZVg7L8+B2WHtK4rrxlcHtXP
         UlIvr9nMCoyv/EW6caEYRdwiEqMbM1Unf220dsMKHyb63GbwUsyaol/yqbt/xq51v2u7
         SuAtAbxR07UxDUwLG3dJbX1RUYZ9HD00iZLMk/c1OumqUZCzolBX3I8T+BEq0aLLy3gl
         E4ifvYWvLCHsAIWBGXsGK+q16cjnR9zuE0ixlaaSI5LMYpScvee3HCeVo0MP4HeMJ/Ce
         sAGMfz0Ofe0YL+hr3w07ESkYuMnCmsGzOJ7dDzvls68+pLu1hzBcWbw2EQdG5UuCYuXs
         yf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OwPfwZcZ52bpY4HX+FooZLavaLrComJSJs44yQK5qbw=;
        b=dXt7QVXtFNt6fgWq7XgB71nBkXpde7iNIoI6TQV7YsWvPCmZmBRyniCJFFtQsfO92R
         9JnCyd8JdBsoLezwf01THuwy+yA2bclGiTBosVDt5jJ49OM/JriSnM35BrHYor1MHZ0+
         5KXcP5VqoedMlkJ75C8Cb3KOm07EGcRNK3Ca7FVk3lMvpzoESSN5sgST2lliuxmzJbjU
         B91XbAXZBjAYzGkQdQeBFp1CqmPfYV8WvbIGZL/jRZU+Tpi5HZxEgyDAUAiSC9Q2h3Hw
         w0hNTMKJo+2VoHchwF/rPruR6BKBVHd0dX/JXWA2P+vkokXN0rXCs6bqSVAhBZCocc5+
         Y/+w==
X-Gm-Message-State: APjAAAUSQEiuSrK2soR5qJOQlLexqSxTDTxTEe8Hdpm4lqWk5HHEtd/5
        GlIEqubNZvRNcMmeorMKdeYZcH+fMr67uaSvPHg=
X-Google-Smtp-Source: APXvYqwcWU8I2xbCxqwdC2UH740B6IsSWcaA6w+XGk8cI5AgVgHLgHGYE0gIdXNtlpvdbsx2JXyB8sGkRJ1iLBxrJJk=
X-Received: by 2002:adf:9cc8:: with SMTP id h8mr5650848wre.308.1556976967596;
 Sat, 04 May 2019 06:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <68b71c15f32341468a868f6418e4fcb375bc49ba.camel@gmail.com>
 <20190211105755.GB30880@fuggles.cambridge.arm.com> <38d8965a-cd41-17cf-1b95-8dd58c079be4@arm.com>
 <874c702b8af760aa8fae38d478c79e3ecba00515.camel@gmail.com>
 <235d20ef-3054-69d9-975d-25aebf32aad3@arm.com> <20190223181254.GC572@tuxbook-pro>
 <86zhqm8i6d.wl-marc.zyngier@arm.com> <20190224035356.GD572@tuxbook-pro>
 <33d765b5-1807-fa6c-1ceb-99f09f7c8d5a@free.fr> <8eb4f446-6152-ffb6-9529-77fb0bcc307f@arm.com>
 <7b5e8bb1-d339-07f7-66f6-7f09df2107c4@free.fr> <3757fc2d-0587-be46-8f75-6d79906be8bd@arm.com>
 <5b83a4c2-1f0e-337f-a78d-f7d84fe01ab3@free.fr> <a6f89d1a-e7bb-bae9-6666-f4d5b263b835@free.fr>
 <b7a3c9d1-6bbc-1f14-956f-ee4dd3bce175@arm.com> <bd3d23ed-1e4c-861b-35e6-08c2f7e4a47c@free.fr>
In-Reply-To: <bd3d23ed-1e4c-861b-35e6-08c2f7e4a47c@free.fr>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Sat, 4 May 2019 15:35:56 +0200
Message-ID: <CAK7fi1b5PP+ToK5fS6xEvGaNF=43=OtA8=5KhypTcFeryWSr9Q@mail.gmail.com>
Subject: Re: [PATCH] arm64/io: Don't use WZR in writel
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry, I've replied yesterday but I just realized that I did click on the wrong
button and the email got sent only to Bjorn. My bad.
Resending to all... this is the original text:

For me, the [1] solution is working fine on qcom SDM630 (Xperia XA2),
MSM8998 (Xperia XZ Premium) and MSM8996 (Xperia X Performance).
I couldn't test on others that I have for time reasons, but I think that it's
not even needed.

By the way, I suggest to clearly document the fact that (from what I
understand, at least) we can write whatever value we want to that
register, as the change as it is may confuse some developers around.

In any case... if you want, you can also include my:

Tested-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Il giorno ven 3 mag 2019 alle ore 15:07 Marc Gonzalez
<marc.w.gonzalez@free.fr> ha scritto:
>
> On 03/05/2019 14:48, Robin Murphy wrote:
>
> > Anyway, I'll clean up my patch and post it properly - thanks to you and
> > Bjorn for testing.
>
> Cool. Thanks!
>
> AngeloGioacchino, are you still monitoring this thread?
>
> On which qcom platform(s) did you run into the issue?
> (Robin's work-around has been tested on msm8996 and msm8998.)
>
> Regards.
