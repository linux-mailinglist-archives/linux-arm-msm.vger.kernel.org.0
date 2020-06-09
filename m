Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1AC1F3F3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 17:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgFIP1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 11:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728944AbgFIP1M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 11:27:12 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D068DC03E97C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 08:27:12 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id cv17so10234548qvb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RvlMT/V7LdXyffx3XNyHPxoXrKOJiaM6774rBZHZc5M=;
        b=RQ75T/FBBH2SzmhTcazD+7GUT2ZOpp2wbvDJaTXomaPDcv+laZ/z4aBoF6pPnG0wfX
         /8POirPQAMawWOjzxXyFFUh9dL8IrK5SVyP6PPkckuLddw6JI72c7/6HoA3rV0ztUJwp
         BUaeWxih0rZjgX9KrZIX/oMVtjyUMDYjBTXLPEtWvQA9SskPwkzW3mmb3YgFVz3H9itv
         cL3PVLt3jD18+Ca5e9AStPHg+FIDotho19bnTZo/MiqrK/U4Q2j0EoeKqzbRv4eyBNz8
         IvcSzHy3z7lXoPvcZxXx6d0arvumrvAb05dSNa0j0iaPImnrsSYgZpkSl3y08VYltg+d
         GW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RvlMT/V7LdXyffx3XNyHPxoXrKOJiaM6774rBZHZc5M=;
        b=M80JFz4uMzB4NvePmx9UN4zuU7C8ZudAk13DAeHAUWVSCfwEZn9zu2BN/AGojstCkV
         RqXTOs0qZN2M7Sb6uUXTrBbGfKR3v4iOeLEGGTIbb3XF/iE5Nahdop130iuovwfYoq9x
         hyNtIpBqiNX3k75fj4ScrHmS1IkBfEMnl1ZvocR5NAHyUc5W1LGSkqi+7zysGgt80qfT
         PyY5slJUdLa72ep1tBkXlxzwbRvbshbcyE41VcrastrkCyKQ2mHeT1ALEb3v4LWXm2ew
         cODCopM4M2VZiJRqUAW6oXxPYLS2pR0y1VoauVd5P/qf/wDKjayM43PO20X3cPGMxuCn
         riZw==
X-Gm-Message-State: AOAM530ErPhqcGaEKVgKnX+jkXFEYf/BSepvdfztC8DV0J9LElBS79AT
        dTVZMSLC6f38TgovY1lb42heMKtOZy72G7Ul1euZ/R0w
X-Google-Smtp-Source: ABdhPJyxXqgCvFmvIhfW2kfVHAp7ILUJuPskbEjZV9ZlNXRLGLzjbSaJyRmiJWTfi9MW9GWAkQPQ7WaFX+Dv3tT/ELU=
X-Received: by 2002:a05:6214:72a:: with SMTP id c10mr4364967qvz.189.1591716431832;
 Tue, 09 Jun 2020 08:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15> <6d759cc28628ea72767c1304883630eb@codeaurora.org>
 <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
 <f0357072de96970b641bbd0da98c1d61@codeaurora.org> <CAJ9a7Vj9STJw4jBxWU_9wHftj4Q7+k8o1nTc8tr21KjYi0RkpQ@mail.gmail.com>
 <4a09cd2e054836d85f2e024ca4435e91@codeaurora.org> <CAJ9a7VgCFeHNbY_9Gwvu6uT9MFBeY=_GCaN4N1dwmm+iNpfJOw@mail.gmail.com>
 <1a5a6a6d-b86d-df45-cf91-7081e70d88a3@arm.com> <20200603174426.GA23165@xps15>
 <da1fdf765ea29cfe7a44145b17431721@codeaurora.org> <dfa6aa626f075f49d9ba1ae8ffa3d384@codeaurora.org>
In-Reply-To: <dfa6aa626f075f49d9ba1ae8ffa3d384@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 9 Jun 2020 09:27:00 -0600
Message-ID: <CANLsYkzqmMZNY=N+x7tVFppGHPp6GviQsDMLqoQ36mnL2aRBLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 8 Jun 2020 at 08:07, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mathieu, Mike
>
> On 2020-06-04 12:57, Sai Prakash Ranjan wrote:
> >
>
> [...]
>
> >>
> >> Robin has a point - user space is long gone at this time.  As such the
> >> first
> >> question to ask is what kind of CS session was running at the time the
> >> system
> >> was shutting down.  Was it a perf session of a sysfs session?
> >>
> >> I'm guessing it was a sysfs session because user space has been blown
> >> away a
> >> while back and part of that process should have killed all perf
> >> sessions.
> >
> > I was enabling trace via sysfs.
> >
> >>
> >> If I am correct then simply switching off the ETR HW in the shutdown()
> >> amba bus
> >> callback should be fine - otherwise Mike's approach is mandatory.
> >> There is
> >> also the exchange between Robin and Sai about removing the SMMU
> >> shutdown
> >> callback, but that thread is still incomplete.
> >>
> >
> > If Robin is hinting at removing SMMU shutdown callback, then I think
> > adding
> > all these shutdown callbacks to all clients of SMMU can be avoided. Git
> > blaming
> > the thing shows it was added to avoid some kexec memory corruption.
> >
>
> I think I misread the cryptic hint from Robin and it is not right to
> remove
> SMMU shutdown callback. For more details on why that was a bad idea and
> would
> break kexec, please refer to [1].
>
> As for the coresight, can I disable the ETR only in the tmc shutdown
> callback
> or are we still concerned about the userspace coming into picture?

User space isn't a concern, especially after you've confirmed the
problem occured during an ongoing sysfs session.

>
> [1] https://lore.kernel.org/patchwork/patch/1253131/
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
