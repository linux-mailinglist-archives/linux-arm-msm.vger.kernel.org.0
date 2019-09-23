Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7FCBB2BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 13:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393682AbfIWLU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 07:20:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:54880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393655AbfIWLU6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 07:20:58 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6857F2089F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2019 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569237657;
        bh=54KCDgkiYR/EK4knsMzq4Nad/givPEjvHxSbPFtNuE0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=f5lgC/QovE7e9oEB1QhLLVe7AIMcxYZKdlnegI/WrNpx9tT/UMDxAncpMeua8ltD7
         cQ6iEkvYZtsQ5JFKnjnyHjT1JNMFJTa9ve9mR6llz6CD0HJBCrJRMtV+KgP7FoudH7
         8tYWJRPPGHCuvME3+R57/Wyg4rBubn+9CaYIAf/Q=
Received: by mail-qk1-f171.google.com with SMTP id y144so14892252qkb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2019 04:20:57 -0700 (PDT)
X-Gm-Message-State: APjAAAUZhKBzUrges3NgyrsA7djRJwmYZ8KtGd/sSdK8t7b0GS3ukFtZ
        DeUNxrAgW4qfAuPz0x1VSzu5Zr5lgKfRFQqcr+Y=
X-Google-Smtp-Source: APXvYqyha8+ncFM7dMYuwPmOlQgA9HYT9RPM7Gbv/980R91y3afn48aNhDRnEMeVaJXits+zjZhrMI+JGsJ6J9ggJLc=
X-Received: by 2002:a05:620a:65d:: with SMTP id a29mr17324956qka.285.1569237656571;
 Mon, 23 Sep 2019 04:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjwcmNn+8t3pSSUf+SLayiH8AWcu8iZYFTrx=FVdPQB+Nw@mail.gmail.com>
 <20190910050305.GC5157@tuxbook-pro> <CAJs_Fx5PFLD+BaUMxqj9apBxg1mDWGbDUiBsgYfG7wpX6UGyKA@mail.gmail.com>
In-Reply-To: <CAJs_Fx5PFLD+BaUMxqj9apBxg1mDWGbDUiBsgYfG7wpX6UGyKA@mail.gmail.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Mon, 23 Sep 2019 07:20:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7+2Bj1PdAeWwyxG+XfudTvBJwTo16gn=4UryJ1gvR6OA@mail.gmail.com>
Message-ID: <CA+5PVA7+2Bj1PdAeWwyxG+XfudTvBJwTo16gn=4UryJ1gvR6OA@mail.gmail.com>
Subject: Re: qcom: add firmware files for Adreno a630
To:     Rob Clark <robdclark@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Linux Firmware <linux-firmware@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 10, 2019 at 1:29 AM Rob Clark <robdclark@chromium.org> wrote:
>
> On Mon, Sep 9, 2019 at 10:03 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 09 Sep 12:52 PDT 2019, Nicolas Dechesne wrote:
> >
> > > hi
> > >
> > > this pull request adds firmware for Adreno A630 GPU found on devices
> > > based on Qualcomm Snapdragon 845. The original firmware files are
> > > distributed by Thundercomm, the vendor of the SDM845 based Dragonboard
> > > 845c, using license terms defined by Qualcomm for previous
> > > generations. The original firmware files can be found here:
> > > https://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/
> > >
> > > The following changes since commit 6c6918ad8ae0dfb2cb591484eba525409980c16f:
> > >
> > >   linux-firmware: Update firmware file for Intel Bluetooth AX201
> > > (2019-09-09 04:22:42 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/ndechesne/linux-firmware.git gpu-845
> > >
> > > for you to fetch changes up to 88ea23e7eed04e78111013df9b81dd851037e4da:
> > >
> > >   qcom: add firmware files for Adreno a630 (2019-09-09 18:13:55 +0200)
> > >
> > > ----------------------------------------------------------------
> > > Nicolas Dechesne (1):
> > >       qcom: add firmware files for Adreno a630
> >
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Not sure if t-b is applicable for linux-firmare, but if it is:
>
> Tested-by: Rob Clark <robdclark@gmail.com>

Pulled and pushed out.  Thanks.

josh
