Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E4C1811F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 08:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbgCKHaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 03:30:22 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44877 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728391AbgCKHaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 03:30:20 -0400
Received: by mail-ua1-f65.google.com with SMTP id a33so349943uad.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 00:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPmOcXQ3X99zHwJqpB3nsuNuIevnyBfADR/rHEtNRP8=;
        b=0BNBnlt0yW57VD8zwOmvzW2sMziTU7mHMcMb/HOT0kuqJeFVpOc5fUJ6z9I4fFzjcB
         HtH1k4B+xEpqyI2Q0sX9RTaK11jmWJh18wZtJamFmwhIs2JBzlf25q9B1Zq3iAO7UQaN
         2oqkIsPspe2v/YbOo80/tyqJQDagTe6a+FkRZn0R73XKkTnZaF7793JlZ85CTjMpTdPf
         1jV2RqUXIZphPLvicgDxaYlIw6wTBz7k5E533El1oCe7Owad7QXcRN+jP0Qmva8sgdXG
         YDctySDeLCpZimi6n1fsxU+B19JswHyXUTI9Q6rO2WkfHChuS0TCwoAWt2Jmsax5ukXl
         HvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPmOcXQ3X99zHwJqpB3nsuNuIevnyBfADR/rHEtNRP8=;
        b=OGs8Ne3Mns6jKkAM3p6O3sNKKAtwN8U6ZZKCAzuTN+cYuOjYxTwrlg+0f/s8bH54PZ
         rZqKi2w2ERtuMTtEeNuIfcOCpQu+/kMSA4qAntF5fsIZU59Zc3Mqvo+eSK5aHUMjI/h9
         Rf08i1HbxtzUT16sAV7XDve89eJGHltk+P4OBEdM3ZkmBSou4NcUG/2jvsKyzeOtAkrQ
         xfaX2Wy+LwB0dDM1E/9jU2iKv8a7YRpHgKC21yxXjiDOpuWb7QqnyP5Mc3SBm7SCAEyY
         YLUBhr7b8NdtICjsPqjuck6k/IK1A5IIN+2MoA+CwQo72q2sa615p2tgoD5hJw0LwcQ5
         mEsA==
X-Gm-Message-State: ANhLgQ1asHqcs++HMvAAl2dR4vkJTbGcycIDt8p+wnY4lHbl15N9IXHl
        YqNeYXTgiXNyvBXxxW3uQHt+dTctsOE3Zk089q76ow==
X-Google-Smtp-Source: ADFU+vs0Dvq9z7hlChVBga5EnnnCXMWgmos410ryGreZya3+Vz6NMZ91SWJ54I7K3Dhw1Fs8MAk1q3q7PPUo08uzlI4=
X-Received: by 2002:ab0:7518:: with SMTP id m24mr806098uap.60.1583911817488;
 Wed, 11 Mar 2020 00:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200310154358.39367-1-swboyd@chromium.org> <20200310154358.39367-2-swboyd@chromium.org>
In-Reply-To: <20200310154358.39367-2-swboyd@chromium.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 11 Mar 2020 13:00:00 +0530
Message-ID: <CAHLCerOx8-iUn0QHO4mDs2M9ncmpEvY7TyM9Tg-_wz9C0Thxug@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] i2c: qcom-geni: Let firmware specify irq trigger flags
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 9:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
> should take care of this for us. Just use 0 instead so that we use the
> flags from the firmware. Also, remove specify dev_name() for the irq
> name so that we can get better information in /proc/interrupts about
> which device is generating interrupts.
>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 17abf60c94ae..4efca130035a 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -549,8 +549,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>         init_completion(&gi2c->done);
>         spin_lock_init(&gi2c->lock);
>         platform_set_drvdata(pdev, gi2c);
> -       ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq,
> -                              IRQF_TRIGGER_HIGH, "i2c_geni", gi2c);
> +       ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq, 0,
> +                              dev_name(&pdev->dev), gi2c);
>         if (ret) {
>                 dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
>                         gi2c->irq, ret);
> --
> Sent by a computer, using git, on the internet
>
