Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8E6246DC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 19:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389475AbgHQRNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 13:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388645AbgHQRMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 13:12:41 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B364CC061343
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 10:12:40 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id f7so15744504wrw.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AueLUpVNwOplEaRIeklXnlMpQk/hv9PNTq+/4iLo0R0=;
        b=Gpu1742R6bQKiE7BaePK5diMLvF+iZfSSkZ0BOARPwt42lhi8nz00uW6K89/MGg4zm
         hZXZDUrk/4N+XUcR0wbbQo713rcnKWaOX9p4s60ZhAx89+KzEZhhA4saULYqOxNRGYdx
         hUyQy65h8Dy4+B9yFynN1Kh1R/12oHa6Gs3j4u3Q4o3r9uQOP6RgH+35nG01K9CZdK68
         rzoGzIXjOR9WHXTKTHVQO9vD4+jdCw3iMYQLPoCTJcpW+4tvowsYeLvIo21HjWRa2vmV
         04Cx09aiVDy2hFLu9lZ+jRZdQNHnPp6FILixg0q9oSK7M9y8md8BFE7vFrK7eGa8X8yl
         WMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AueLUpVNwOplEaRIeklXnlMpQk/hv9PNTq+/4iLo0R0=;
        b=tb4ow4/xXuq0zQv0wdQ9BUGDOjE5R+UMisc25TN24gj5KZi/kwCyKvyAwfg5SC8cL3
         GgjKdnJvFVo9coe4U9u3whlxJHlAvmpH1N7LIR1mGESn1Ig3oin54EYhQWudncYYeg28
         1tyxZEv4oRyzAW1ve/xYqg/A+VZeNyS82hieGARXTt36cdCvIrtNzutrzvAvEDS3b0nh
         I7nManNKYaozTh+HvybV7H5jDgU6bpfTRRRc17ZNcke8X1I6JROtFuTHXtsvBb2TvwuD
         4h2zphGIIOaeQZrrXSXkTqb24eWLHOscO49hI/LmwoIu557IiIy2WZX2Biw7g7pmCQ4q
         kNlA==
X-Gm-Message-State: AOAM531R9PtkA/6729QGB5fqIQ1T55p6LAQfowYLo+oJlzSFfsIRgNr+
        QK6P5MjF183utnFo/elkMud2+NZ36l0gYr7FhVFSOA==
X-Google-Smtp-Source: ABdhPJwzzJqqKP8Dz57WEH4mjrx29gWDTGQSyhqQk/3EQMn3h+P+wfHkvWUG7jnjma/rWD/FdEgspqJzfrhXMf85F+M=
X-Received: by 2002:adf:fc06:: with SMTP id i6mr16257949wrr.79.1597684357045;
 Mon, 17 Aug 2020 10:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAMi1Hd3Dv_T7kgThLTk2QLtfS7LBvhJ5R=6C3seUYK0GvNV6eA@mail.gmail.com>
 <20200806223134.42748-1-konradybcio@gmail.com> <20200813070448.GA499758@builder.lan>
In-Reply-To: <20200813070448.GA499758@builder.lan>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 17 Aug 2020 22:42:00 +0530
Message-ID: <CAMi1Hd3j-A1Se9swD0TQ9YzTBGicPDc1nFZbf4uisVk5A+u1GQ@mail.gmail.com>
Subject: Re: your mail
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        dt <devicetree@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Aug 2020 at 12:38, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 06 Aug 15:31 PDT 2020, Konrad Dybcio wrote:
>
> > Subject: Re: [PATCH v4] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
> >
> > >// This removed_region is needed to boot the device
> > >               // TODO: Find out the user of this reserved memory
> > >               removed_region: memory@88f00000 {
> >
> > This region seems to belong to the Trust Zone. When Linux tries to access it, TZ bites and shuts the device down.
> >
>
> This is in line with what the documentation indicates and then it would
> be better to just bump &tz_mem to a size of 0x4900000.

Hi, so just to be sure that I got this right, you want me to extend
&tz_mem to the size of 0x4900000 from the default size of 0x2D00000 by
including this downstream &removed_region (of size 0x1A00000) +
previously unreserved downstream memory region (of size 0x200000), to
align with the starting address of &qseecom_mem?

I just gave this &tz_mem change a spin and I do not see any obvious
regression in my limited smoke testing (Boots AOSP to UI with
v5.9-rc1. Touch/BT/WiFi works) so far, with 20+ out-of-tree patches.

Regards,
Amit Pundir

>
> Regards,
> Bjorn
