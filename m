Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 123BF19707C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2020 23:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgC2VRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Mar 2020 17:17:37 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:37693 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbgC2VRg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Mar 2020 17:17:36 -0400
Received: by mail-ua1-f65.google.com with SMTP id l18so5569247uak.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2020 14:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PlAsMJa4Ap4Bu6zfW50JonjjDBj+TTytLskw+4DE0eE=;
        b=kpkCaXt2+Nl7ioWQEwi3llXPbAASFJ3ojg/l8gaqgXvpXKsqMh6nONMh1Yc8z9mAal
         unFgZH2mj9DaMvoWiKmonO10acBajrv0HiRZgydY2mQgFfwqVpwBKbXUhzu3uUGvZVdB
         U42FLdYU3SOMmx4PP9bbI0aRLis9AboC1xQ6F7e8Vho7MfjbgsAEYPqG0wcFgHkXKRwl
         tZ/aFUe/KxbNJa71VocRZJu47Pl9qgMZZo0pgkzvZRqSvVN0dPl9iI+BPy02IsjrDqxc
         MemwmL1yGpBQPID0FIrKZBMNvEioEMafCud5HWUWfzLcnWvmKi+kVhQUFoHGQZsA7CUh
         hzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PlAsMJa4Ap4Bu6zfW50JonjjDBj+TTytLskw+4DE0eE=;
        b=WAV+JnhkmVN9XI/eV00RXqv60tYqnba+c78criyGaLZ7EZvWoZ2IeN4uHkSzJIPBt6
         4Paud0vqr5rBZpF/5r+W/HQhBiwit/QcMum9hnsYMCA8u7qmDhWdFvz18egNOVv4sJVt
         X6+MzqYkLBWAYxUnqtU6v8+huKieuPbqvVdzve3zgMGqCZdChAIejaCbbGfxg5ueStQ6
         z+E8Moq6QgimsJkdXuYfC8f9p8YASN2lo+dxyLCA36YNMtzWqweuH+aIiZCjr26p0Vme
         AficijzTg3syLZ2Fmd8Npkvu2PtFcGAhNEsy6d3yKUCTzqh199aLP00VU6GWR9RSwcy9
         JSZg==
X-Gm-Message-State: AGi0PuYBUZcIZpiHjTfuv8l8qkbgBz05QyjD4e8uQhksP7hCy63tTStT
        z6mguwFLFt4eDsULkDU1qGv3nPL+s/i1erZrnABkQA==
X-Google-Smtp-Source: APiQypI5UyPceZaqS4xPEyKZJ+1QsToAhF0AamS+JTJQoRAG+CuN4Z8gCIgVDlEuDjF9cmMKZjq9V//u5kOMJTG958s=
X-Received: by 2002:a9f:2a88:: with SMTP id z8mr5926056uai.17.1585516654164;
 Sun, 29 Mar 2020 14:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200106135715.1159420-1-robert.marko@sartura.hr>
 <CA+HBbNHEetusFNH-8Qmva=2-_HQRRJ33qfBRSudZBVW+vK0tnw@mail.gmail.com>
 <20200327220545.GC5063@builder> <CAK8P3a1_eyVSTgKDk+qph6CCKswWFWhPfX=yi3=jAeUf4uWC6w@mail.gmail.com>
In-Reply-To: <CAK8P3a1_eyVSTgKDk+qph6CCKswWFWhPfX=yi3=jAeUf4uWC6w@mail.gmail.com>
From:   Luka Perkov <luka.perkov@sartura.hr>
Date:   Sun, 29 Mar 2020 23:17:23 +0200
Message-ID: <CAKQ-crgF6ebubzi2Kim7fNp4BJFSjffnmMsaN6ghnfSXaXbCVQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: qcom: Add support for IPQ40xx
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Andy Gross <agross@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Arnd,

On Sat, Mar 28, 2020 at 10:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Mar 27, 2020 at 11:05 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 25 Mar 03:25 PDT 2020, Robert Marko wrote:
> >
> > > On Mon, Jan 6, 2020 at 2:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
> > > >
> > > > From: Christian Lamparter <chunkeey@gmail.com>
> > > >
> > > > Add support for the Qualcomm IPQ40xx SoC in Kconfig.
> > > > Also add its appropriate textofs.
> > > Any blockers on this patch?
> > >
> >
> > No, I must have missed it in the past. I've picked it up for 5.8.
> >
>
> If we only need these few lines, I can still squeeze it in for v5.7 last minute,
> just forward that patch to soc@kernel.org. If other things are still needed,
> let's wait until v5.8.

These few lines is all that is needed. I'd appreciate if we could land
this in v5.7 rather then wait for v5.8.

Thanks,
Luka
