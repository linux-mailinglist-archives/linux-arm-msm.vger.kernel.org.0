Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A0B202F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 11:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfEPJ4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 May 2019 05:56:47 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38932 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfEPJ4r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 May 2019 05:56:47 -0400
Received: by mail-lf1-f66.google.com with SMTP id f1so2135835lfl.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 May 2019 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TMDrVnTjQ1immxiYKmdnHO4lUdJFEpb4jOAuuz/w3MM=;
        b=gJWuQZybohtXg5MERpeUsZNOq4RdyG5oC2punG8BCdPmzF+h5sYNnovAC8Tv6c7l6m
         2qSLM6ZtOKMDC4hPhDjycEgDIcomZLJ8EHVQSwAFzBXz93OJ2RzIX8tM82SWkHtExoRf
         oQvvRoSnD9cOp67mw0tqCEtoQQMz0gbw8f9lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TMDrVnTjQ1immxiYKmdnHO4lUdJFEpb4jOAuuz/w3MM=;
        b=rFaHOxPrBi25x9ByAU9Dij/Kz4M1j44gxSlb/S47lQvOIGhhboq2pSe1PaA3NP/iEI
         UBjck6MBVBdwJv0jSTWbDy6ZU03KM6wTra149jruc4RmdcoNUWFAN3fWSKOgUkeTHfcd
         3lxqiqCUFA+Q9XUo8tNnS0/YXFWx6rMZR5tmQnRhVT62G83LkJ3LdjZn+IfIYV++d+fb
         nX4+ZmErcTOAzAzYn0uK/da5pKbBufxO41GtjPavEg4ILa4/FxePcu9Umna3tCAXQglj
         IVuOl6kSZcPNb1rYtaeTHHO3NLCsA8rOn5SDIUKphDgwuhi1UJoJfSsV/kLM2dZS9hzL
         m+DQ==
X-Gm-Message-State: APjAAAV5iChU0n6owSlgwtLVtdqMmash2e3ZiSw0ia1W00Zf5YssDgBq
        KFxk0tTR6SdYZVPEbD3NGxM4UkCRueHSuA==
X-Google-Smtp-Source: APXvYqxiKCXwgcKP9z5rvjsaZEXlc1QKF3K1Kh15lUU9GbwmFA6aNDzhT0NVt+3zAo4P88u5mBRr8Q==
X-Received: by 2002:a19:2312:: with SMTP id j18mr2568071lfj.79.1558000605326;
        Thu, 16 May 2019 02:56:45 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id m18sm868403lfj.91.2019.05.16.02.56.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 02:56:44 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id n134so2105970lfn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 May 2019 02:56:43 -0700 (PDT)
X-Received: by 2002:a19:cc95:: with SMTP id c143mr23074476lfg.138.1558000603275;
 Thu, 16 May 2019 02:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
 <a1807c37-99cf-d1fa-bcb9-67af2935abaf@xs4all.nl> <ca0e2c94-cca9-567f-5376-f302f79f4ba7@linaro.org>
In-Reply-To: <ca0e2c94-cca9-567f-5376-f302f79f4ba7@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 16 May 2019 18:56:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DBUUAPV0_=thmRBTFqJE+Nd4LZRzZE20rR0D8d7Cjz5g@mail.gmail.com>
Message-ID: <CAAFQd5DBUUAPV0_=thmRBTFqJE+Nd4LZRzZE20rR0D8d7Cjz5g@mail.gmail.com>
Subject: Re: [PATCH v2] media/doc: Allow sizeimage to be set by v4l clients
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 16, 2019 at 5:09 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Hans,
>
> On 5/14/19 11:54 AM, Hans Verkuil wrote:
> > Hi Stanimir,
> >
> > On 4/12/19 5:59 PM, Stanimir Varbanov wrote:
> >> This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
> >> field description to allow v4l clients to set bigger image size
> >> in case of variable length compressed data.
> >
> > I've been reconsidering this change. The sizeimage value in the format
> > is the minimum size a buffer should have in order to store the data of
> > an image of the width and height as described in the format.
> >
> > But there is nothing that prevents userspace from calling VIDIOC_CREATEBUFS
> > instead of VIDIOC_REQBUFS to allocate larger buffers.
>
> Sometimes CREATEBUFS cannot be implemented for a particular fw/hw.
>
> CC: Tomasz for his opinion.
>

Thanks Stanimir.

Actually, if called at the same point in time as REQBUFS, CREATE_BUFS
doesn't really differ to much, except that it gives more flexibility
for allocating the buffers and that shouldn't depend on any specific
features of hardware or firmware.

Actually, one could even allocate any buffers any time regardless of
hardware/firmware support, but the ability to use such buffers would
actually depend on such.

Perhaps we should just let the drivers return -EBUSY from CREATE_BUFS
if called at the wrong time?

> >
> > So do we really need this change?
> >

Yes, because this has worked like this all the time, but it was just
not documented. Disallowing this would break quite a bit of existing
userspace.

Best regards,
Tomasz

> > The more I think about this, the more uncomfortable I become with this change.
> >
> > Regards,
> >
> >       Hans
> >
>
> <cut>
>
> --
> regards,
> Stan
