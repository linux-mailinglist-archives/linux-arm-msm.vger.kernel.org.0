Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DDC4EAAD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 11:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbiC2J5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 05:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbiC2J5g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 05:57:36 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF3E9E9E9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 02:55:53 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id v35so30624420ybi.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=seLvwV9K1rKjqDKzTYYrfJvgdmbON2mz+sCwvBatE6U=;
        b=N2aQhTcckK8j0kgax8UOJaSl9vIq+bCtr+YCmBa/K04DpCBxZF+aorgGmjF4YpYchh
         4+rumO+5Ikdk9UxTJ7NxHs37P90FMKMrXFN2m9tr3G3mfRM7DQT6bVaBHoK/Dg/i9u2e
         rI88kjDBxcJ3zzBz/0wTBCXCTu03qQi+Vvy66QR+yTjCrNk8sGCkDDrN9QBxeiCMjHBc
         nKdSF84dR0ME3QmNLzs5jvmL4Ux3JxPCXCztz9SKIxeqzdQjCa4deVYqMDJm87PJ3IDC
         Lnnf5ZPUVrVOVgGnrTUndoUfUccnJy8aOM1MX+5UBzfwQX/RzLOOrGc+q/w5vNfYMgwK
         9z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=seLvwV9K1rKjqDKzTYYrfJvgdmbON2mz+sCwvBatE6U=;
        b=1vezEFLyxhJtow7ZP9s7WGkS6PM89FttDreYgwFThhM7710pbGvrDDndJ0RcdAQlNE
         tyY7cV7Iw+OMwhklf2GIyvfSGyFfgmfaRjgrE9K/tSmMmnX429js7IyRWfN2/8noYG7m
         M0ClzCzRJte7KyZFcfy8TtgkbfvUYv6NpfLuGjd9WcCJgysv4vCutKRNL+oRgvCgBl1D
         wgQYQo+uhh6xJPm9urefCv9hVMLw+RAlAPbr3xSkWCZJLR8a/fTKkvqoSinugwfr4lba
         +hxEnrDFK/WtLGiSEgZ1W2Van2t9jxuMKn3bkZ4EMkVyGrc4wNvg6V+Od7yRI0Ob5QSY
         EPlQ==
X-Gm-Message-State: AOAM533Ixs6yO+QJW4s7lh2kqcgKb5ggSrUf/E88FdjGuz36HEUxrnNv
        IF3S8yaydlUSs73dMaY9zw0+Cl3/hDpVyiWxZWKa7jKD9Yl4PURS
X-Google-Smtp-Source: ABdhPJw3M7ngRhmwpCEwH06Bjj18TCkgEw8hISsF7Db3BTNyk7X5KvpCHeJxG5P1CohWFi4CUFMvMyOMN51uhjQj35I=
X-Received: by 2002:a5b:848:0:b0:633:716f:1fb0 with SMTP id
 v8-20020a5b0848000000b00633716f1fb0mr25313155ybq.522.1648547753072; Tue, 29
 Mar 2022 02:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <1641749107-31979-1-git-send-email-quic_mkshah@quicinc.com> <164369277345.3095904.10944386444643776011.b4-ty@linaro.org>
In-Reply-To: <164369277345.3095904.10944386444643776011.b4-ty@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Tue, 29 Mar 2022 15:25:16 +0530
Message-ID: <CAMi1Hd2Sngya_2m2odkjq4fdV8OiiXsFMEX1bb807cWMC7H-sg@mail.gmail.com>
Subject: Re: (subset) [PATCH 00/10] Add APSS RSC to Cluster power domain
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ulf.hansson@linaro.org, Maulik Shah <quic_mkshah@quicinc.com>,
        quic_rjendra@quicinc.com, daniel.lezcano@linaro.org,
        quic_lsrao@quicinc.com, rafael@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 1 Feb 2022 at 10:52, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Sun, 9 Jan 2022 22:54:57 +0530, Maulik Shah wrote:
> > This series patches 1 to 4 adds/corrects the cpuidle states/
> > apps_rsc TCS configuration to make it same as downstream kernel.
> >
> > The patches 5, 6 and 7 adds apps_rsc device to cluster power domain such
> > that when cluster is going to power down the cluster pre off notification
> > will program the 'sleep' and 'wake' votes in SLEEP TCS and WAKE TCSes.
> >
> > [...]
>
> Applied, thanks!
>
> [01/10] arm64: dts: qcom: sm8150: Correct TCS configuration for apps rsc
>         commit: 17ac8af678b6da6a8f1df7da8ebf2c5198741827
> [02/10] arm64: dts: qcom: sm8250: Add cpuidle states
>         commit: 32bc936d732171d48c9c8f96c4fa25ac3ed7e1c7

Hi, These patches landed upstream and I see a boot regression on RB5
with this sm8250 patch:

[    T1] vreg_l11c_3p3: failed to enable: -ETIMEDOUT
[    T1] qcom-rpmh-regulator 18200000.rsc:pm8150l-rpmh-regulators:
ldo11: devm_regulator_register() failed, ret=-110
[    T1] qcom-rpmh-regulator: probe of
18200000.rsc:pm8150l-rpmh-regulators failed with error -110

Doesn't regress everytime but It is fairly reproducible. RB5 fails to
boot on every alternate reboot or so. But the device boots everytime
if I revert this patch.

> [03/10] arm64: dts: qcom: sm8350: Correct TCS configuration for apps rsc
>         commit: a131255e4ad1ef8d4873ecba21561ba272b2547a
> [04/10] arm64: dts: qcom: sm8450: Update cpuidle states parameters
>         commit: 6574702b0d394d2acc9ff808c4a79df8b9999173
>
> Best regards,
> --
> Bjorn Andersson <bjorn.andersson@linaro.org>
