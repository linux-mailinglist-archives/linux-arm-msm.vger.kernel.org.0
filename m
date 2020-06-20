Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80842202696
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 23:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgFTVET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 17:04:19 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43519 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgFTVES (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 17:04:18 -0400
Received: by mail-lj1-f193.google.com with SMTP id n24so15216243lji.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2020 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uMfSif8lYt33+r64QbIMr/6xvgq88zcecC3Y2xRHieQ=;
        b=jffKj9+P2dPJBSyOULJuAU6eBWKCl+2gQgwHtfsz6jmfHRR3WF40mhzxBPXFR+c3j1
         WE/4fe7XbkzFwaLQNUN0FbFefWCE6THJpVVFMNdhcYMiwViokPGEMmID+bZikNxuHXfy
         +FrnK1/DCpoDSqn+e0cr4SlLZE5JfYqb2yt4GxQoWoUbpMxbJ9EYEPouYmIhFEdxWLGr
         QtTEoyudLU2HEq0axhatbGdFhwPmk8e8NND7hb2DldelRIjj0fcsJGsrRPMH85DaNjnq
         66NAjB0c7ggwbnzd++elcTCWFgqTcsmzKaytPVhCfhST2MlsbPqCIngKn0hlvWeW60fG
         /Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uMfSif8lYt33+r64QbIMr/6xvgq88zcecC3Y2xRHieQ=;
        b=tlwWCfJkP7MidgYOpuMzxDLWrso5mbv4GVeRxyuyeY1NKIoJtPn2T2dzYmTnaVquEt
         ts9YkiAX+LQSKIJ7JP4t06K/sQYPycIs1EmmejOtoIctafMwkwgkuLgd3dpMTeQXpJqb
         pBYOAMkzNqtJueYgmCs0TY6zIYxRQHDRDFov1eq47DYAEe8p2CpHX3Mk5qcnvpRnnJ7s
         DL+FJt6jOrEg7clxk4hNI4bNcon1PzVjpkHWtt+Mgqjj6RP+NRGfy3BxzxTEaa9Qe+B3
         04j2o3pS9rjrgEYRKZXucjnaT+of+d50UBEQJf6574C6YF7Ua47sSYNECh9ToZkdNLtF
         XIzA==
X-Gm-Message-State: AOAM532xeTWqZ5qKo1dCEPsE3WU31oTbFkzMbpT7fG56U3myAy5WGOzQ
        jRxMvDJGSbSof0Khxq/usjwnVeRmnhjOZ9dRxBJwwYvhnPDh2g==
X-Google-Smtp-Source: ABdhPJw5SuKxJji2VfElAtYt42a0GP5lNrUCmrE3LEQtLbJKkZXvQKMkGNPhUVtMQZEJummq20kBonA8zp4n1tWKaUE=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr5259398ljn.286.1592686995948;
 Sat, 20 Jun 2020 14:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <1592224927-28576-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1592224927-28576-1-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:03:05 +0200
Message-ID: <CACRpkdaNSw3jfYFY21LcrnV+40=VBSiaCsZeHDmscb0pkRuybg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 15, 2020 at 2:42 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> It would have been nice to be able to do this only for the particular
> board with this design, however this change of removing gpio28 from the
> pinctrl SoC file means we end up with one less wakeup capable gpio for
> the entire SoC.

Yeah but what about only removing it for this board in the driver then?

> @@ -1122,7 +1122,7 @@ static const struct msm_pingroup sc7180_groups[] = {
>  static const struct msm_gpio_wakeirq_map sc7180_pdc_map[] = {
>         {0, 40}, {3, 50}, {4, 42}, {5, 70}, {6, 41}, {9, 35},
>         {10, 80}, {11, 51}, {16, 20}, {21, 55}, {22, 90}, {23, 21},
> -       {24, 61}, {26, 52}, {28, 36}, {30, 100}, {31, 33}, {32, 81},
> +       {24, 61}, {26, 52}, {30, 100}, {31, 33}, {32, 81},
>         {33, 62}, {34, 43}, {36, 91}, {37, 53}, {38, 63}, {39, 72},
>         {41, 101}, {42, 7}, {43, 34}, {45, 73}, {47, 82}, {49, 17},
>         {52, 109}, {53, 102}, {55, 92}, {56, 56}, {57, 57}, {58, 83},

Make a copy of this tuple-array and in sc7180_pinctrl_probe()
set sc7180_pinctrl.wakeirq_map and .nwakeirq_map to something
board specific like that:

if (of_machine_is_compatible("my,board")) {
    sc7180_pinctrl..wakeirq_map = ... ;
}

Yours,
Linus Walleij
