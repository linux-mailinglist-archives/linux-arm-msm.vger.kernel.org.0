Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA42318CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 02:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfFAAbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 20:31:25 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43060 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfFAAbZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 20:31:25 -0400
Received: by mail-vs1-f68.google.com with SMTP id d128so7822289vsc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 17:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Kd7/+kr4jxVkBeK6chb/uAQy3afbVih/qTqLzH6YXg=;
        b=fFR8Yoeaj7rQIWQWlq5wNouI2OAxcAVIV3ViDHmGepDRlaAgLcyqpr8Iz7xvqv9yY5
         KJmkoV7EiKoPljy47wPqBEY60yV3btg78qOiRyIpUHSX0g63rNFdXWGeuMwWQMMpOOh2
         a4i5ZjgFDQtwHDCayYIL8rsqq5gfw9tPM6UkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Kd7/+kr4jxVkBeK6chb/uAQy3afbVih/qTqLzH6YXg=;
        b=MpxkeFbgrOs7QvNVxXA3kjbtpQkuzCdy9QTUrfo0dspTmJ4M8lkxqkqHb4m6Haupua
         i5YoM5anfPUl3dGDV/Ce67uFfaN5YBOvS4bnP10gA5JhgPiRlFsB6SD1nQXRe+QIsmIc
         H8Ulb7Fmz0T5I3h+FD1oidWzqZN/khyhjEF/k85qFbAvd+wMKPgYyBKw99bMmxFzbBE2
         uUAoq1w7GSW9YbKuqSjKtBOKmevmGHPsh5OLrXIJeDx/MBXOHYEWA3eJEq8Uc+Z5946L
         WUeXAkYfVxkN22UG3fqLar8LwHf/zAB9P6NDF97IeaRLkKV4QfeSXph0M/MkEJeT0nqX
         KcxQ==
X-Gm-Message-State: APjAAAU2DSrRk1ptaXWbhbsN05pOSS9g4SeLnwsVHNeTYfFLI+8zTStA
        2DxS6Iwto0P8iCsUCE85Ufq4d3YXrJ0=
X-Google-Smtp-Source: APXvYqxvmrsOT3MyWDAmC3Y5ygZXUm95fwvh6bfdegeqmokdq23EEnz3fgIpZdyMf9gk1cDdtnV7IA==
X-Received: by 2002:a67:f489:: with SMTP id o9mr6907843vsn.118.1559349083484;
        Fri, 31 May 2019 17:31:23 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id q77sm359249vke.13.2019.05.31.17.31.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 17:31:22 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id r7so4515076ual.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 17:31:22 -0700 (PDT)
X-Received: by 2002:ab0:670c:: with SMTP id q12mr6641706uam.106.1559349081772;
 Fri, 31 May 2019 17:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190531030057.18328-1-bjorn.andersson@linaro.org>
 <20190531030057.18328-3-bjorn.andersson@linaro.org> <CAD=FV=V=_ozPiTvT-Fnrc1a+qfHYi3ynNn8cbw9ibqfKk7Am_w@mail.gmail.com>
 <20190601000917.GE25597@minitux>
In-Reply-To: <20190601000917.GE25597@minitux>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 May 2019 17:31:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VDtMgEeFsG9NxzsY1tEcCOTDShMe50J=5wNWQ095uejw@mail.gmail.com>
Message-ID: <CAD=FV=VDtMgEeFsG9NxzsY1tEcCOTDShMe50J=5wNWQ095uejw@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] soc: qcom: Add AOSS QMP driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 31, 2019 at 5:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 31 May 15:24 PDT 2019, Doug Anderson wrote:
>
> > Hi,
> >
> > On Thu, May 30, 2019 at 8:01 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > +/**
> > > + * qmp_send() - send a message to the AOSS
> > > + * @qmp: qmp context
> > > + * @data: message to be sent
> > > + * @len: length of the message
> > > + *
> > > + * Transmit @data to AOSS and wait for the AOSS to acknowledge the message.
> > > + * @len must be a multiple of 4 and not longer than the mailbox size. Access is
> > > + * synchronized by this implementation.
> > > + *
> > > + * Return: 0 on success, negative errno on failure
> > > + */
> > > +static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> > > +{
> > > +       int ret;
> > > +
> > > +       if (WARN_ON(len + sizeof(u32) > qmp->size))
> > > +               return -EINVAL;
> > > +
> > > +       if (WARN_ON(len % sizeof(u32)))
> > > +               return -EINVAL;
> > > +
> > > +       mutex_lock(&qmp->tx_lock);
> > > +
> > > +       /* The message RAM only implements 32-bit accesses */
> > > +       __iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
> > > +                        data, len / sizeof(u32));
> > > +       writel(len, qmp->msgram + qmp->offset);
> > > +       qmp_kick(qmp);
> > > +
> > > +       ret = wait_event_interruptible_timeout(qmp->event,
> > > +                                              qmp_message_empty(qmp), HZ);
> > > +       if (!ret) {
> > > +               dev_err(qmp->dev, "ucore did not ack channel\n");
> > > +               ret = -ETIMEDOUT;
> > > +
> > > +               /* Clear message from buffer */
> > > +               writel(0, qmp->msgram + qmp->offset);
> > > +       } else {
> > > +               ret = 0;
> > > +       }
> >
> > Just like Vinod said in in v7, the "ret = 0" is redundant.
> >
>
> If the condition passed to wait_event_interruptible_timeout() evaluates
> true the remote side has consumed the message and ret will be 1. We end
> up in the else block (i.e. not timeout) and we want the function to
> return 0, so we set ret to 0.
>
> Please let me know if I'm reading this wrong.

Ah, it's me that's confused.  I missed the "!" on ret.  Maybe it'd be
less confusing if you did:

time_left = wait_event_interruptible_timeout(...)
if (!time_left)

Even though you _can_ use "ret", it's less confusing to use a
different variable since (often) ret is an error code.

Speaking of which: do you actually handle the case where you get an
interrupt?  Should the above just be wait_event_timeout()?
