Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8383B381B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 22:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbhFXUsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 16:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbhFXUsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 16:48:20 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210DBC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 13:46:01 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id f10so3603738plg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8+XcAHiGiXvmgy9Rd443ncnG3LuxD3RnQCz3eit3rcE=;
        b=kzkO/OSOSBd0BOcLDPQmtDXP4xhm0WZoeR9cPfBs7ky2gmVlYJXRQP3+BuYghI2ywG
         d16Igr/yrXEi4dyXfi8DaLhYu84Z+toA+NaMA4ttYUXUrOW/VdISLoW1Ek1CYmvRfGMY
         uUHnqA+X0AQdPq7EiwyPUh3DvfZNJXv7YhQiY5jdtS7mL5yI4cDwmUj0mDTOc9r616d9
         L9xD035CELRCuEpeDSo1OPZxHHaj7769m95I4xt9WpUkoyCEdC1dXwNksKmH4a2fA47E
         0Ahz7EVrorsFwa9zeDQIlINM2hFoQ9jx5PQS63LyQNNQyEqy3Sta5BRai7Kmlp3PMbPJ
         V8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8+XcAHiGiXvmgy9Rd443ncnG3LuxD3RnQCz3eit3rcE=;
        b=s7uNTuEn1Q6rPsZGze22MY67CZ6TXQ7NbNkFaX9nrjfUIccIJv+FthQ/0WMz5qLAj9
         DIfS1KGMlTWsq2PNv9Abi9I/vl8+2L8VpjilrvZTDlohm2q0H9aN12vopgSymc4PQ/Hl
         Qhz236EuuMheT+lBGH8CC0W3+bMy2HX5FznDspSu+NBtUgGvnYTSjaRkr007RTyN9TsI
         uez4NUET5UVtsiM+DnlfubcF5WEGxJt4uy7y20ySYywV8H+jY/8U21qkCYecvBKlLL1w
         JK6ajJ5vRdZupCJUyMA6RH2pRa5ZbQSCl2Gk9PDUp8OTF3S8bn6muKz9+TsJ2YfU1b0V
         BtzQ==
X-Gm-Message-State: AOAM533qe6DEtcT13Dg/zAOcbizX+4d4NuZKSvTr1y3yL47AvSMlfM+6
        l2XAkH0JHuk9fijGhRMfQVQ945RE56wiT8Lt9wgKow==
X-Google-Smtp-Source: ABdhPJwhA8+0CusWRxsItDMcswCN1kJRVZdjJcVUerlpBcARb8uS7wYoA7elTy97tq9u/Nootold3ivHSA9OWJUL2j4=
X-Received: by 2002:a17:90a:5106:: with SMTP id t6mr17416872pjh.231.1624567560528;
 Thu, 24 Jun 2021 13:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <1624566520-20406-1-git-send-email-loic.poulain@linaro.org> <YNTrePQQ3scDzAhe@builder.lan>
In-Reply-To: <YNTrePQQ3scDzAhe@builder.lan>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 25 Jun 2021 00:45:25 +0200
Message-ID: <CAMZdPi_wKHQszTaJH8neHHGWJzRO9P7Zr3XTq0nSRku4EKnhuQ@mail.gmail.com>
Subject: Re: [PATCH v3] bus: mhi: Add inbound buffers allocation flag
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, 24 Jun 2021 at 22:30, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 24 Jun 15:28 CDT 2021, Loic Poulain wrote:
>
> > Currently, the MHI controller driver defines which channels should
> > have their inbound buffers allocated and queued. But ideally, this is
> > something that should be decided by the MHI device driver instead,
> > which actually deals with that buffers.
> >
> > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > if buffers have to be allocated and queued by the MHI stack.
> >
> > Keep auto_queue flag for now, but should be removed at some point.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Acked-by: Jakub Kicinski <kuba@kernel.org>
> > Link: https://lore.kernel.org/r/1621603519-16773-1-git-send-email-loic.poulain@linaro.org
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> What's the intention with this patch? Why is Mani the last S-o-b when
> you're the one sending it and why is it sent only to linux-arm-msm@?

Actually the previous version of that patch has already been applied
to mhi-next, but has been nacked as part of Mani's PR, so it's a quick
follow-up fix to address the issue.

> And completely separate of the practical matters, is it true that qrtr
> is the only client that use this pre-allocation feature?

yes.

> Would it be a net gain to simplify the core and add buffer allocation to qrtr instead?

Yes, I 100% agree, but I however would prefer to keep that for a
follow-up series since this patch fixes a real issue for MHI/PCI
modems (no inbound QRTR buffers allocated).

Regards,
Loic
