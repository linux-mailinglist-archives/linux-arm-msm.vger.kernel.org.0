Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702B9BF90C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 20:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfIZSSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 14:18:22 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33431 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfIZSSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 14:18:22 -0400
Received: by mail-io1-f68.google.com with SMTP id z19so9155686ior.0;
        Thu, 26 Sep 2019 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=caQQyk5Nth7oWQS7p+KzbKUxKlbGvdkOvbZrIWu+D1g=;
        b=kCMurnVuQgPabhvBFbb0cwBdjq7tvZe01oZL+AK8c8ka20Qn5hLBg2eyWjGaud3nOp
         NlFQfEanoYPaMD4GkWj/kMssNrA01cjsQgxDSnTL/ybzFyYIggZzCmjwo1/GuU9adoPk
         d4YIcbC0hITemwVFh4UhCkUug+6pdv0B9Y83YaVfqdd2YYM/X91DsbHxLMgrMohK34DL
         cO/oOPUEBENc1Ir3bcM+uz+x/pb/F+e8ndq2LBy5PZnbkrYTHVi7GkDDKayT8q98zDBz
         5oL5Xq941joK5FkRuOIgvJCC2fEOaaxyt+wfrlRKbf/YfLslmkgpV4MM4DJQVQ+4S4Vr
         EE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=caQQyk5Nth7oWQS7p+KzbKUxKlbGvdkOvbZrIWu+D1g=;
        b=TLjw0uicnAYyveA7CrpEWBO1+ki8XCvnG/k0bavsSEUBjCbljtAgcWk9cCQRljEAMW
         b0tVtR4Q5ovKW2R9GiR8qbqa5X6lZqiQvEjrYTl4dLKb+UBbeHrqJ529WiQtCXf9kvK3
         plV1+34WbK1zgQnmOuaQxJ0Qqd9J+1EH4S+7EfRwSHCVSZr7WLSJclwtrXUi5pYBJJGk
         0JTL8MZA9DY8QvtxCC9SGCgsLCcMhwWQrkehjXsXBMSDzsmuzUxJ7YYwBWNfE6AyWBOy
         MaUzPXq0SSSwFEvO226Kaq3wMXRZd6rRV8qI3kQZvveoUGjGVi8iFXFuU8oFhJayMphT
         9zjg==
X-Gm-Message-State: APjAAAWTlhtHgCf1W2AO0wp27GP/STVhihSiAMgfZsjgYCAwIK5aPDF8
        GyNU6Z4UaBw3btk5O3oaZmaKDf+w0TuehTg7XS0=
X-Google-Smtp-Source: APXvYqwc0+MhoO9yDmk0carpuCXEWo9qT6lmamCGwfymR3NJQrEpbBS4fos0r6gj8M+8TerYJzNd2maCddE0Yi18FBs=
X-Received: by 2002:a02:cd2d:: with SMTP id h13mr4469381jaq.19.1569521901051;
 Thu, 26 Sep 2019 11:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190912091019.5334-1-srinivas.kandagatla@linaro.org>
 <5d7fe5d1.1c69fb81.eca3b.1121@mx.google.com> <CAOCk7NoNX7+fxCYNOCMVCv1_-X3ZbaHwFjzWjMp6VKL6ZoroLA@mail.gmail.com>
 <5d8cfc13.1c69fb81.73236.ab28@mx.google.com>
In-Reply-To: <5d8cfc13.1c69fb81.73236.ab28@mx.google.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 26 Sep 2019 12:18:10 -0600
Message-ID: <CAOCk7NrK1XKC=TW8H1QWyiAP86dueZB4gK5S-eg4pifr6vfxXQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: add missing soc_id sysfs entry
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 26, 2019 at 11:57 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Jeffrey Hugo (2019-09-24 20:54:41)
> > On Mon, Sep 16, 2019 at 3:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Srinivas Kandagatla (2019-09-12 02:10:19)
> > > > looks like SoC ID is not exported to sysfs for some reason.
> > > > This patch adds it!
> > > >
> > > > This is mostly used by userspace libraries like SNPE.
> > >
> > > What is SNPE?
> >
> > Snapdragon Neural Processing Engine.  Pronounced "snap-e".  Its
> > basically the framework someone goes through to run a neural network
> > on a Qualcomm mobile SoC.  SNPE can utilize various hardware resources
> > such as the applications CPU, GPU, and dedicated compute resources
> > such as a NSP, if available.  Its been around for over a year, and
> > much more information can be found by just doing a simple search since
> > SNPE is pretty much a unique search term currently.
>
> I wouldn't mind if it was still spelled out instead of just as an
> acronym. Who knows, a few years from now it may not be a unique acronym
> and then taking the extra few seconds to write it out once would have
> saved future effort.
>

Fair point.
