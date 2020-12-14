Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4046C2D9955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408006AbgLNOAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:00:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgLNOA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:00:28 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA122C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 05:59:47 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id qw4so22556369ejb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 05:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5H7oAxGb3iQZrCCoWQnHSim3vHHDqX492ZEX+0522JA=;
        b=E5WzSXql5xOy33DMZhQ1AtHVOA5+dQkUQbhDDMUVzDDQOBysNGn6P89KTX8Bil6ID4
         I9Zh7xSeBnewqpqXdslVIY8OqVT9+zyLW0Bi0sIlp+7hC0DLz250hU9310L4nWYwSrac
         qeiiQo+sKiyjTc9Ysn72d34ms8mVm9LmwseZROaOoCQ3KIWOLIIaFxRkBhcHOZXNXYIU
         Ar/NldL8WxnlcWfGmdvrMm454jwbb5j9V4T3VpkrWPDb2GknnKZyirnMLMoldVjwJR/x
         1jkBuqeUI+nztnkmwRVYKmKB9qKOs3qTGf3AiaAS4mHcztLiMsoDDrOLplj0KEfAtNmg
         TVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5H7oAxGb3iQZrCCoWQnHSim3vHHDqX492ZEX+0522JA=;
        b=iQWRM8gshwjPHo0L15nl00zSSIqC24pvjJ1ox9rVO1L4m88eqoEdqQ+HrqVCiFYJKb
         Yqf1oRW+7qp3LNxN0LVmjJCK/ZKKz/xqvaHtUPlAVv1yJ5hPttdlQlxEkBtw6SyPIdSx
         D/IggyUs+rr3/sxgknjvbd81oznkVmVrBOF+l/D4Ae+3OiNr3KGqtHzbTT0keg5HV1Gg
         3X+K7bJ+fm82sRkwQ2nqMCY+ZsASqBGk0w3RZT8ZbFJoCBw8nAZ+XWWu07TWtu95/Zjx
         OnW0zZKUkFunhasgW8Ce17GmZge1hgQb7POwH7CXnrXWq6V3Zg6+dqGEkRKUIIVFeEFt
         qyhw==
X-Gm-Message-State: AOAM531nMaNiU1mHI1kDbvzmEibwWzuVtzgGBx7xq4C2CjLnGy2mi7LD
        ppn7o+M+kNAsRsVSINX3Nxwh6fyM3akIFq1l8Hhixw==
X-Google-Smtp-Source: ABdhPJzjzgdUhyWig4DEp4Q/tEm6/GdGNCL6i+wnrcy/Sd5uHZxWrgLniqo3zQGYSM+7R1RYgq19GJF/S7T5NbdvTf4=
X-Received: by 2002:a17:906:2798:: with SMTP id j24mr2963366ejc.328.1607954386413;
 Mon, 14 Dec 2020 05:59:46 -0800 (PST)
MIME-Version: 1.0
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
 <1607594575-31590-7-git-send-email-loic.poulain@linaro.org> <3fd3f60c-777c-2710-92ae-1c89cda1aa38@codeaurora.org>
In-Reply-To: <3fd3f60c-777c-2710-92ae-1c89cda1aa38@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 14 Dec 2020 15:06:23 +0100
Message-ID: <CAMZdPi9_A1oJpqJ1_oO1W19jnNeES=HaqDfBXiUqnz2TWcTTYw@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] mhi: pci_generic: Add suspend/resume/recovery procedure
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Dec 2020 at 21:22, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 12/10/20 2:02 AM, Loic Poulain wrote:
> > Add support for system wide suspend/resume. During suspend, MHI
> > device controller must be put in M3 state and PCI bus in D3 state.
> >
> > Add a recovery procedure allowing to reinitialize the device in case
> > of error during resume steps, which can happen if device loses power
> > (and so its context) while system suspend.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >[..]
> > +int  __maybe_unused mhi_pci_suspend(struct device *dev)
> suspend API is not static but resume is. Any reason for that ?

No, going to fix that, thanks.
