Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315323EEDE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 15:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237333AbhHQN7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 09:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbhHQN7E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 09:59:04 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A93C0613C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 06:58:31 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id f11so27736937ioj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RfYUDUzpE88BFM7U12PFd1PZxGOVQ4arJXsmSphggxs=;
        b=iQRFTvEcKZRS+I7e+8UpMTn4j0ZSz8+CSXkQ1s5dr+XPZOFVvOWfL5IMxiRY10YAKp
         Z6AsVDrZJ7IFA8nKaIPtWLJq9phbVgdJ3dx8QsCkhERsE7IiSMDjBPXGW1bvP2bNIqYW
         o+ENNXVC/au2HIiJZorwAUNQ34Wxk2JN/gFtHGx+dGHH/O7hM/nphUWSEJRRoHen+mbP
         /OxUeTwTx+Nu0WmSz40CnheNOlDash4wmpeVdCUiM4XGxMi6/YEBwabD7ySbR92liE22
         mlF2ZUgqdPsuOZw7/ZCmZMPbSMjXsHAKGXZFzXjyWloPqjbrK9qr5Hgqb75ElvZZVa1n
         SdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RfYUDUzpE88BFM7U12PFd1PZxGOVQ4arJXsmSphggxs=;
        b=F8ScgsCfZHCpI88iO2I9p8zTRmv4AOW00c9MTQqRhA1e2RvefcXbhtNwj2zptY7NI1
         LOf0J3PncbHM3ZSACX8wvzerTY1xIj/ubGnVNAEus+0b/4qReLe2U40UhHwGDKzG1Vvz
         89/zjtLryhvch12Tvw5Va3u9WpGri4s1Ldqc2LVFUDyJAXmAF9uRAFYd6wu0B3oF9a7Z
         HronKLAeD/mIPiquEwN2Njf1aEcXjPL6Yyk9S05MzH4I7+tuOxqIqFdKwrAVTHgqwhPx
         H0X3LJbAYs8/YN73uVX4ku/yaHQBxbY/C24LNpcg/BlNXoNC+JDWEgkvrqpfU49sSypy
         L6aw==
X-Gm-Message-State: AOAM532c9Z+B3F7IdZJ3TRgeCE6sElxsH7yrpfUStuVPzpxzJ0cq4X25
        4D2dz/EzhAlU448128KdB7QUyjCRYYwrh9/Fr3hwNw==
X-Google-Smtp-Source: ABdhPJy5DxApqGc5ZVwyb9Cd0z0vFRTr6eAfjR0+eKgYnhQEMzeQwy3jTzlLy/EZ69bAzZsWSGMmHxv7hV1xY9n4aBQ=
X-Received: by 2002:a5d:9eda:: with SMTP id a26mr3069220ioe.166.1629208710636;
 Tue, 17 Aug 2021 06:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <1629132650-26277-1-git-send-email-sbhanu@codeaurora.org>
In-Reply-To: <1629132650-26277-1-git-send-email-sbhanu@codeaurora.org>
From:   Doug Anderson <dianders@google.com>
Date:   Tue, 17 Aug 2021 06:58:18 -0700
Message-ID: <CAD=FV=UqFczZ6tLzVuXhgKG9teSNTGt_RdqAxP4eXBN_eDDAtQ@mail.gmail.com>
Subject: Re: [PATCH V1] arm64: dts: qcom: sc7180: Use maximum drive strength
 values for eMMC
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        sartgarg@codeaurora.org, cang@codeaurora.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Aug 16, 2021 at 9:51 AM Shaik Sajida Bhanu
<sbhanu@codeaurora.org> wrote:
>
> The current drive strength values are not sufficient on non discrete
> boards and this leads to CRC errors during switching to HS400 enhanced
> strobe mode.
>
> Hardware simulation results on non discrete boards shows up that use the
> maximum drive strength values for data and command lines could helps
> in avoiding these CRC errors.
>
> So, update data and command line drive strength values to maximum.
>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I found this CL because you created a bug for it (thanks!), but it
would have also been nice if you had CCed some folks from Google that
work on the trogdor project on your patch.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 0f2b3c0..79d7aa6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -1524,13 +1524,13 @@ ap_spi_fp: &spi10 {
>                 pinconf-cmd {
>                         pins = "sdc1_cmd";
>                         bias-pull-up;
> -                       drive-strength = <10>;
> +                       drive-strength = <16>;
>                 };
>
>                 pinconf-data {
>                         pins = "sdc1_data";
>                         bias-pull-up;
> -                       drive-strength = <10>;
> +                       drive-strength = <16>;

I could be convinced that this is the right thing to do, but I want to
really make sure that it has had sufficient testing. Specifically as
this patch is written we'll be updating the drive strength for all
boards. Increasing the drive strength can sometimes introduce new
problems (reflections, noise, ...) so we have to be confident that
we're not breaking someone that used to work by increasing the drive
strength here. How much has this been tested?

From the discussions in the bugs, it seemed like the increased drive
strength was only needed for one eMMC part and that eMMC part still
had problems even after the increased drive strength, it just had
fewer problems. It would be good to confirm that I got my data
straight, but if it's right I'd be inclined _not_ to increase the
drive strength and simply to make sure we don't use that eMMC part (or
solve the problems with it in a different way). I seem to remember
that there were other eMMC-related values that could be set. Any
chance the problems are really there? Like `fixed-emmc-driver-type`?

-Doug
