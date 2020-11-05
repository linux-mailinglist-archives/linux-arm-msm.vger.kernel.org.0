Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DE72A7B7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 11:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgKEKQc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 05:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbgKEKQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 05:16:32 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B79C0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 02:16:30 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id y16so992305ljk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 02:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XzY1VkvmYL3pvQ6ooemzXER1+NGHzQExssTtwYHfu3I=;
        b=XTFQbF5935sVeuBgqmaOO5pdnb3YL+UApn4NnnwcaWSfdg4FAy6KlYTD8nryvGlxg1
         zmPsKr1X/9039LndgggUw00Pk+GXaNGvH1pRx2VVE5oowCpSYyb2407ZeNMNTnh++S3g
         jFihuaqOm1X5T2ZVRothVsfeqaqcW1kGB4eZxaC7Sp0ydjd6NRHvC/r2L4WXFLJ9SNA7
         8Ye1SiLbKEiHIeW6QWCn5epaHTPKW+nhHBOkqUlxMQg9ke6QBQ3MuX924sxywTVuTXZP
         2V1c/2Gbcq0mBXzpawm8qxP7jzSJz5xS4QNVuQlLYTMJ+lvcxQKKkfqEQvYQ/YnHtkaD
         /aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XzY1VkvmYL3pvQ6ooemzXER1+NGHzQExssTtwYHfu3I=;
        b=cvB8QGFerTTafYdKDAr39pUT+tXGlsCrGR9L6JrBKgSfQiCpbpGkvq3sUSDw653cTF
         uzP92Zkm61h2y3DnS9tQLaqC33VgaAEbC84SMfhenRRJ/l+w9HZWNjVKropFAh95KB/S
         g2OMyQi0Sh0zqooCaMzLjoFV24fv41idf/HQavjk6jYtGHPdiL7ulIccCnUc5ZyxaXnx
         Zc2+JZ7Fy49++WH2rdY8NAP7rI2MT+4gCkeiKzUjx7wfnSNaqwINw2p29snqLKvM+YT6
         yw4HOyG0uoabjp4U3F7VhuHi9O3VVTU7nS6vPOJGfI/fkc8I8UV1g8eqaOshu4a598CZ
         iRqg==
X-Gm-Message-State: AOAM532c0uz4oZ5LRIQJJ4KZr6U+57RCVsxDiTj6oUJiPN7hx0Z42sRZ
        6uzi2jjW7yooripZmHAvkiDjLVqWvFIqL80hkmyxLP3GWwbqwVLB
X-Google-Smtp-Source: ABdhPJxaq73gcB/JxlAqEL/i+o9calac2E7MR1bcyxAJh/tpAKN316vVzkkP8N7+kPd9X5pE5hxh+OwUmsUZtVAg2Gw=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr668709ljg.286.1604571388670;
 Thu, 05 Nov 2020 02:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20180129005948.7714-1-bjorn.andersson@linaro.org> <CAKZGPAPrwXNeYk+bDiMBRczVf4PaBANnzhmenZie+V0BJ7OqBg@mail.gmail.com>
In-Reply-To: <CAKZGPAPrwXNeYk+bDiMBRczVf4PaBANnzhmenZie+V0BJ7OqBg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 11:16:17 +0100
Message-ID: <CACRpkdZ2UzA=Hyw+b20dCqzu8+L7_D1bTM44MKbbue2VFCY4UQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: msm: Use dynamic GPIO numbering
To:     Arun KS <arunks.linux@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Timur Tabi <timur@codeaurora.org>,
        Arun KS <getarunks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 4:21 PM Arun KS <arunks.linux@gmail.com> wrote:

> Im only concerned because, after this change, the use of gpio number
> from user space has become a little difficult.

This makes me a bit puzzled so I need to push back a bit
here.

What is this userspace and what interface is it using?

We recommend using the GPIO character device with
libgpiod for userspace applications:
https://www.kernel.org/doc/html/latest/driver-api/gpio/using-gpio.html

Is there any problem with this?

sysfs is deprecated for years now:
https://www.kernel.org/doc/html/latest/admin-guide/gpio/sysfs.html

Yours,
Linus Walleij
