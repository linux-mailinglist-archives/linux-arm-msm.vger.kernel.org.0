Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFAD4A4C5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 17:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbiAaQou (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 11:44:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245025AbiAaQou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 11:44:50 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CB5C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:44:50 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id p63so16807143iod.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mgLpP7PiSd9QSKRkACEhaQ8hoJlE5c/JQduVWQ3N4EQ=;
        b=ZZCEeJ83lIWaTi7vyY7RMrRYRHc6XEtd3z+RGmifK7cxhRYsQybZlXCvYt0nOedqXL
         BMEUdyuuiiMJCVFdzgfZSdiDE3zdDHD5t9bJGztWqG61MDlmZHqDU+CVQNUeIUPuER2Z
         jULFeYpkhPOf0YmBvs2bsZEIJ+vVID1zFyNPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mgLpP7PiSd9QSKRkACEhaQ8hoJlE5c/JQduVWQ3N4EQ=;
        b=sAu7ObCWthVjFTtiUMas1toxB5vlPel+REBmsiTqzxDhhw9lvVNHOxzMD3SfhejzkI
         weFM+GEYtTmX4Z9bZKCkV7VSXkAFBbZf+e1Y23FN4gqpwtcsYwJ2Lrl53ibPItZ1lQPw
         e281WdX82A19U4abH7RknBJ1VDmymsrwEp+vA8iIGRgYAPt7L9Y3PHtMniclwmYTGJd1
         YWIc/0ZJushKTXjZtc3FFxFFyOT5HaNE2pjpHXJdXjiHxQgzjGfGs4bN8UapyRGgYJgO
         bCIq33Wm6tVRyombS75o+TyISzbz8xTI2fstyylCNIiE26OyvXwYMrv22MNGyQTznkN7
         Z54g==
X-Gm-Message-State: AOAM5331C4dA+wF3zrUIbhv2WyN22bBygTnjsSHXr/TwuGqkLFmLKHBR
        CCfd7mX+QgsA/N7j8V55QGX9HFn4Gp6aUQ==
X-Google-Smtp-Source: ABdhPJx6UiW9KUpxXYkBcobR9m7LmfMX2qEOIR85XJOusZ6tHkLeTrXxBUXRQrKOxGVbJKIkCGSaBg==
X-Received: by 2002:a02:6f48:: with SMTP id b8mr11415964jae.9.1643647489812;
        Mon, 31 Jan 2022 08:44:49 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id r9sm8545062iov.26.2022.01.31.08.44.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 08:44:48 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id n17so17675856iod.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:44:48 -0800 (PST)
X-Received: by 2002:a05:6638:168d:: with SMTP id f13mr8000061jat.44.1643647487838;
 Mon, 31 Jan 2022 08:44:47 -0800 (PST)
MIME-Version: 1.0
References: <20220125224422.544381-1-dianders@chromium.org>
 <20220125144316.v2.5.I5604b7af908e8bbe709ac037a6a8a6ba8a2bfa94@changeid>
 <CAE-0n528Bxdj+DKhi2Lan4qR_=4KHD7A1Zkr15tmu+MchryJ1A@mail.gmail.com>
 <CAD=FV=UcpKaLQ31CGKUnaNnZcYnM4N_t8VC43FPGktoYDiMfsw@mail.gmail.com>
 <YfC5i2jR5N+pmHoZ@ripper> <CAE-0n50sX9-0MxcpF+3Rwqm75jSw5=aNwdsitLwE2sEA69jLJw@mail.gmail.com>
In-Reply-To: <CAE-0n50sX9-0MxcpF+3Rwqm75jSw5=aNwdsitLwE2sEA69jLJw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 31 Jan 2022 08:44:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W2zsd+jTFyPO_UxS=UxPvB1=iaMbDQY8X2p8tJgL685g@mail.gmail.com>
Message-ID: <CAD=FV=W2zsd+jTFyPO_UxS=UxPvB1=iaMbDQY8X2p8tJgL685g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sc7280: Add herobrine-r1
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kgodara@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        quic_rjendra@quicinc.com, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jan 27, 2022 at 1:16 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> ----8<-----
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c
> b/drivers/cpufreq/cpufreq-dt-platdev.c
> index ca1d103ec449..32bfe453f8b4 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -179,25 +179,29 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
>  static int __init cpufreq_dt_platdev_init(void)
>  {
>         struct device_node *np = of_find_node_by_path("/");
> +       struct device_node *soc_np = of_find_node_by_path("/soc");

Seems that some device trees have "/soc" and others "/soc@0". For at
least a little context, see commit a1875bf98290 ("arm64: dts: qcom:
sdm845: Add unit name to soc node"). Since (presumably) this would
only be for newer SoCs then I guess you should search for "/soc@0"?
...and then if we ever have a SoC that's not @0 then we would have to
iterate through all SoCs

-Doug
