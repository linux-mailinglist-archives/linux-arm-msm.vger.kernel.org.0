Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A7F1538EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 20:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBETUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 14:20:37 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39313 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgBETUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 14:20:36 -0500
Received: by mail-vs1-f68.google.com with SMTP id p14so2115715vsq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 11:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5YaLuYG6Iy8QwcRaBytxQgkWb5GSrDhgxvX793l25Mo=;
        b=GuNlVw9BGjVfmhTOpV2VTeLQx5fb7PKdprf2XR10o8G5FgixUq0JmY+Z6cyD+kx95/
         5YEYPMNOQ2HaOFmXohheuf6yU7ENKL+x9hT+6uAnCPS2kPLJN5v1nYtcuPh1UbkNEo++
         J8++OrPT4HiHnTqOvvoifx1YVBfMdbqv1HAW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YaLuYG6Iy8QwcRaBytxQgkWb5GSrDhgxvX793l25Mo=;
        b=TfFt6vhtR4pCiZq0jQB8h7H8w2nI8IWC5lsg9w3Bp7goKyBqIXoSHslTjSMyAlByY9
         PTZZLqwOKkX8zlVPWWBV70atwhDlm6HB2dZcor9bstgFu3W076T1iTYiO6HPXdJtMc99
         eC099N0QaxE8nWsTQuCsY8OU9XAYkyE5xX71bT5ztZ7mP4S2siTZsv/opUEMN0CtoOlw
         VJ5mtFLMOQEjntCkBrM89LJu/IMnNuX+p5AzT43MkdNw6AfW8pepSz8qWU0l35YuxBN1
         hyNtWbbq09Lt8tZUS2faU2PI3rnW+DS+YYTWHCf47+9bAAHtf1d4+HUwmPzNWWfecWKT
         TSog==
X-Gm-Message-State: APjAAAVuSxSUt358phjuEix4AA0GcjeC88M2slqX/ySa1XTWic7dcfh9
        0AS8s+DSTsRbm4EFp2U/Hsbw+KuULls=
X-Google-Smtp-Source: APXvYqyOE0jp1CZVllCAD0s4yMq02WwzKjpdaSoDZzBVRuhxFb4Z08hE90doXjnEbG9BrC929ZiQnw==
X-Received: by 2002:a05:6102:3235:: with SMTP id x21mr21505639vsf.8.1580930434701;
        Wed, 05 Feb 2020 11:20:34 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id g22sm264131vsr.24.2020.02.05.11.20.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 11:20:33 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id h32so1298987uah.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 11:20:33 -0800 (PST)
X-Received: by 2002:ab0:2006:: with SMTP id v6mr20493719uak.22.1580930433242;
 Wed, 05 Feb 2020 11:20:33 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org> <1580886097-6312-3-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-3-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Feb 2020 11:20:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6yM7UJwu0ZLPCqmDgV9FS4=g+wcLg0TV51b72zvWT9Q@mail.gmail.com>
Message-ID: <CAD=FV=V6yM7UJwu0ZLPCqmDgV9FS4=g+wcLg0TV51b72zvWT9Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] clk: qcom: gpucc: Add support for GX GDSC for SC7180
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Taniya Das <tdas@codeaurora.org>
>
>  Most of the time the CPU should not be touching the GX domain on the
>  GPU
>  except for a very special use case when the CPU needs to force the GX

Really weird word-wrapping?  You've also indented your whole commit message?


>  headswitch off. Add a dummy enable function for the GX gdsc to simulate
>  success so that the pm_runtime reference counting is correct.

Overall the commit message sounds a lot like the message in commit
85a3d920d30a ("clk: qcom: Add a dummy enable function for GX gdsc").
That's fine for the most part, but it makes it sound like you're
_only_ adding the dummy enable.  In this case you're adding support
for the GX domain and _also_ adding a dummy enable.  Maybe try:

Most of the time the CPU should not be touching the GX domain on the
GPU except for a very special use case when the CPU needs to force the
GX headswitch off. Add the GX domain for that use case.  As part of
this add a dummy enable function for the GX gdsc to simulate success
so that the pm_runtime reference counting is correct.  This matches
what was done in sdm845 in commit 85a3d920d30a ("clk: qcom: Add a
dummy enable function for GX gdsc").


> Signed-off-by: Taniya Das <tdas@codeaurora.org>

Since you are re-posting Taniya's patch you need to add your own
Signed-off-by as per kernel policy.


> ---
>  drivers/clk/qcom/gpucc-sc7180.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
> index ec61194..3b29f19 100644
> --- a/drivers/clk/qcom/gpucc-sc7180.c
> +++ b/drivers/clk/qcom/gpucc-sc7180.c
> @@ -172,8 +172,45 @@ enum {
>         .flags = VOTABLE,
>  };
>
> +/*
> + * On SC7180 the GPU GX domain is *almost* entirely controlled by the GMU
> + * running in the CX domain so the CPU doesn't need to know anything about the
> + * GX domain EXCEPT....
> + *
> + * Hardware constraints dictate that the GX be powered down before the CX. If
> + * the GMU crashes it could leave the GX on. In order to successfully bring back
> + * the device the CPU needs to disable the GX headswitch. There being no sane
> + * way to reach in and touch that register from deep inside the GPU driver we
> + * need to set up the infrastructure to be able to ensure that the GPU can
> + * ensure that the GX is off during this super special case. We do this by
> + * defining a GX gdsc with a dummy enable function and a "default" disable
> + * function.
> + *
> + * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
> + * driver. During power up, nothing will happen from the CPU (and the GMU will
> + * power up normally but during power down this will ensure that the GX domain
> + * is *really* off - this gives us a semi standard way of doing what we need.
> + */
> +static int gx_gdsc_enable(struct generic_pm_domain *domain)
> +{
> +       /* Do nothing but give genpd the impression that we were successful */
> +       return 0;
> +}
> +
> +static struct gdsc gx_gdsc = {
> +       .gdscr = 0x100c,
> +       .clamp_io_ctrl = 0x1508,
> +       .pd = {
> +               .name = "gpu_gx_gdsc",

nit: technically name could be "gx_gdsc" to match the name of the
struct and #define.  Your name is copied from sdm845 and matches the
name of the struct and #define from there.


> +               .power_on = gx_gdsc_enable,
> +       },
> +       .pwrsts = PWRSTS_OFF_ON,
> +       .flags = CLAMP_IO,

Compared to sdm845, you have different flags.  There we have:

.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,

I'm not sure I have enough background knowledge about the hardare to
figure this out.  Can you confirm that you're different than sdm845 on
purpose?  Bonus points if you can confirm whether sdm845 is also
correct as it is today or should be changed to match what you have?


> +};
> +
>  static struct gdsc *gpu_cc_sc7180_gdscs[] = {
>         [CX_GDSC] = &cx_gdsc,
> +       [GX_GDSC] = &gx_gdsc,
>  };

Assuming that the question on flags is resolved and the commit message
updated, feel free to add my Reviewed-by tag.




-Doug
