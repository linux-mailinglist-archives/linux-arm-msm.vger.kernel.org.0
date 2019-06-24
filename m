Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 669AA517B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 17:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730837AbfFXPwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 11:52:55 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33303 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbfFXPwz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 11:52:55 -0400
Received: by mail-io1-f66.google.com with SMTP id u13so1535554iop.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2019 08:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkjGLeZUAfuY8DZSj9f0m0KvGyff5YQvvo5e4Golg5M=;
        b=gYX5m4GJ4yG/mZPswVx6eRxlw7sAVUkNCN3Im8k3dSk2ZoWzwKuaMutdF4FxdpsAMl
         Zisq3TVygA6ypft7AGBN0IZUIWpMNe4a/ppsQoSLpIDVm8jjP1DM0PWWwRhJvkfe+k25
         9tWdTjW/puS4CwqKDjHjO5U5J4aCyt1HB2Myw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkjGLeZUAfuY8DZSj9f0m0KvGyff5YQvvo5e4Golg5M=;
        b=peFWk4qfZ0NYeuA8zhqtw/E9Uhuym0Xf+C9Ec6Nbpmj++ifIqBENN+zn3cjrn4jLD1
         PRn5NagDUiFvB5kbOTZ8FuonT/aR2Fi0Qn5Iwq11ijP17ltGCCuoHRRC+b95UKO51jqs
         2jUWFxlqzrezZp9QhKI/mJQEZMZioPQnmur8cC/07mLCOr+sU0xl5X4yCtSOHuWjhio6
         As/I+EpPDZj3x0wvfTRP8oEETQb6Yf6ccYX934tOYXki4gRk1mEWSXt98n8WLypsDlAM
         3Xtfpy/arOC9OC8l5rZHfZxp2X0hF2p43/1j7QQU1el7MntKwy0McnRNyTs2I45AX51Z
         coUQ==
X-Gm-Message-State: APjAAAXPzUqZDtzKVAIpWhn1/b5FxvCekJHbw+9cInuFbkKcFIXJnwRt
        yG1OvEURhDCKdK6N94kL2mNPJ3SEaeQ=
X-Google-Smtp-Source: APXvYqyAvltWuVYFmQu+Mcv2ulPvS3isxrKA5aREodAu5K66flPrLdEsZGw0gUA7evdkojN10ILeNw==
X-Received: by 2002:a6b:b804:: with SMTP id i4mr13637877iof.119.1561391574642;
        Mon, 24 Jun 2019 08:52:54 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id u187sm27167775iod.37.2019.06.24.08.52.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 08:52:53 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id k20so1858272ios.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2019 08:52:52 -0700 (PDT)
X-Received: by 2002:a5e:c241:: with SMTP id w1mr39732767iop.58.1561391572659;
 Mon, 24 Jun 2019 08:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <92d97c68-d226-6290-37d6-f46f42ea604b@free.fr>
In-Reply-To: <92d97c68-d226-6290-37d6-f46f42ea604b@free.fr>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 24 Jun 2019 08:52:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XE=rdqUhFD-5ZynhfgkDXN4HNs=JcKgLiqeN3Aapnj9w@mail.gmail.com>
Message-ID: <CAD=FV=XE=rdqUhFD-5ZynhfgkDXN4HNs=JcKgLiqeN3Aapnj9w@mail.gmail.com>
Subject: Re: [PATCH v1] phy: qcom-qmp: Raise qcom_qmp_phy_enable() polling delay
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Kishon Vijay Abraham <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 13, 2019 at 8:28 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> readl_poll_timeout() calls usleep_range() to sleep between reads.
> usleep_range() doesn't work efficiently for tiny values.
>
> Raise the polling delay in qcom_qmp_phy_enable() to bring it in line
> with the delay in qcom_qmp_phy_com_init().
>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
> Vivek, do you remember why you didn't use the same delay value in
> qcom_qmp_phy_enable) and qcom_qmp_phy_com_init() ?
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index bb522b915fa9..34ff6434da8f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1548,7 +1548,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>         status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
>         mask = cfg->mask_pcs_ready;
>
> -       ret = readl_poll_timeout(status, val, val & mask, 1,
> +       ret = readl_poll_timeout(status, val, val & mask, 10,
>                                  PHY_INIT_COMPLETE_TIMEOUT);

I would agree that the existing code is almost certainly wrong, since,
as you said, trying to sleep for 1 us is likely pointless.  I quickly
coded up a test and ran it on sdm845-cheza.  It looked like this:

--

  ktime_t a, b, c;

  a = ktime_get();
  b = ktime_get();
  usleep_range(1, 1);
  c = ktime_get();

  pr_info("DOUG: %d ns, %d ns\n", (int)ktime_to_ns(ktime_sub(b, a)),
          (int)ktime_to_ns(ktime_sub(c, b)));

--

At bootup I got:

[    4.121247] DOUG: 52 ns, 9479 ns
[    4.144990] DOUG: 52 ns, 9636 ns
[    4.328168] DOUG: 0 ns, 11667 ns
[    4.332659] DOUG: 52 ns, 7136 ns
[    4.358833] DOUG: 0 ns, 6666 ns
[    4.362095] DOUG: 52 ns, 8229 ns

So basically the existing code is already waiting 5-10 us between
polls but it's spending all of that time context switching.  Changing
the above to:

  usleep_range(5, 10);

Give me instead:

[    4.120781] DOUG: 52 ns, 16927 ns
[    4.144626] DOUG: 53 ns, 17447 ns
[    4.327932] DOUG: 52 ns, 11302 ns
[    4.332501] DOUG: 0 ns, 7395 ns
[    4.357912] DOUG: 0 ns, 6823 ns
[    4.361175] DOUG: 52 ns, 9063 ns

...and that seems fine to me.

--

Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
