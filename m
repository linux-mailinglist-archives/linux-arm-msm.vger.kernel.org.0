Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318191521CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 22:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbgBDVSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 16:18:10 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42321 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbgBDVSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 16:18:09 -0500
Received: by mail-vs1-f68.google.com with SMTP id b79so12420462vsd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YV7XvdlsIH5IDESBp45bVi5suaLif02bOusLL/UcAg=;
        b=bphTE9jnt5pwshYrT5bVIe6w+pYy2uTHTOXG6zCT/v03+zOC2lc8VCPBqK8yQrSx/5
         mdNdS0Hg9A8cnU6gYq/C50cIyByUlThuUSRMW9Hn/rWs/3L7rWzw4UvULJ4VQWtnGpRg
         xa9In03NU2Po3Hd6I1ppVTeQh0gOd3walkFVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YV7XvdlsIH5IDESBp45bVi5suaLif02bOusLL/UcAg=;
        b=CFa6iYWVsWzuYvOszFLn3wbBeZVhKYf5rm53YG2/jwFQJi/B0q8BaJ8mUOnQUien6O
         qa/eE5k9+VC5R1pibuQLvMFZU9tG8eVJu4NpDKUJDFu/QNONfWA5W/yKAXgXJPaUe1vY
         yVdR12T2iX+8kj1sAs0Yp6VB2WmLXVkDhtPlOt5m+qGfCTmj+WTTFIlFd7RrQrh2TrP0
         eV7zk+kznxIDAps33fEc+CXHHNGZqHWHT3OvmAFo+jpUDF3DMspYqD/KELwcxnyAwvXd
         xtWJpIy8emVRsXkuUDeMceIyfCTcuIx453/pXb7PD59/lL0nDxiSCZ42OCRNmcUAjKQs
         8uTQ==
X-Gm-Message-State: APjAAAWAd9IiIBNA1+d8n+4dOr7xmoITRA4XYFqWOxGpsSq7jxSse6yC
        EN2brOA2IA1VecNcoZa1YnxiGkZKXAU=
X-Google-Smtp-Source: APXvYqz5t1kRNMROr2ksjJvYOY6jtGFr81mln4rFDbHlsfqs6/Qbd5+pL3/rLqNQwqV/HZFj+LGwMQ==
X-Received: by 2002:a67:ed4a:: with SMTP id m10mr19991905vsp.82.1580851086822;
        Tue, 04 Feb 2020 13:18:06 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id z17sm7729172vkb.5.2020.02.04.13.18.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 13:18:06 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id p6so12416577vsj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:18:05 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr19486104vsm.198.1580851085540;
 Tue, 04 Feb 2020 13:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-2-swboyd@chromium.org>
In-Reply-To: <20200204193152.124980-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 13:17:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wf99AkNqtJ_W92sDNGS3dKQN3FK3960-=Oq8sJf7kKVA@mail.gmail.com>
Message-ID: <CAD=FV=Wf99AkNqtJ_W92sDNGS3dKQN3FK3960-=Oq8sJf7kKVA@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Let firmware specify irq trigger flags
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:31 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
> should take care of this for us. Just use 0 instead so that we use the
> flags from the firmware. Also, remove specify dev_name() for the irq
> name so that we can get better information in /proc/interrupts about
> which device is generating interrupts.
>
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
