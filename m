Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03DEB15205F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 19:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgBDSWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 13:22:10 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41633 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbgBDSWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 13:22:10 -0500
Received: by mail-lj1-f195.google.com with SMTP id h23so19661420ljc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 10:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QDmc7rJKH3PB8BRLa4LSMdik+WscauM3bJQAO66d9eA=;
        b=WeRebeBVSEUt28wl435zQEX1/6tiqV9monpU/7Ej5fqLhT4R41NF8WtVIPn3kCpd2W
         wbcN2Sjxu4ENSsuskkDYKK9U80zRpDL4LUYH/tlUOhVyLqB1KATrcbuAqPq0Al5qoWvp
         rMHMlBCss0WzMtE8Lymhfpn15/d3thD2oJEIZmNP8MDzdV8YSMDGPweIJImQWGcV8Ga/
         j/IbkkAP1Fj9pbuFBAyq/t9v6EySeBAPmFRUvTPRYghB8ovJFADomNk5+wvaaAHEWM0S
         hpqdASOKeTOzzB6JZ+53/Eq07SOogb68gbxVJW6udAD0KmS978l/cAwWllNpHbBrJLcc
         ldEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QDmc7rJKH3PB8BRLa4LSMdik+WscauM3bJQAO66d9eA=;
        b=oiZP2KXAE8fHgky4alFkU47hLK8AwbU7KOkneKxohLt414Qhm90KudlRgJOs4snfB1
         H+OhkYHjo1d7v9Z8vkWzZh47Ywh5DNJjRAndTLeXR9lw3z2qjGXCbF4UE3By2xJvJv2/
         fSP8TxoIG8Y54j244YsYH3b92im6P1HXGoccWG4/o6lmm6cqqgTtDMeoxT52Mo57VCVk
         FcIdI59MeoMUb5jBHWqZCTzmYsZcSirgicQmfrOdgrLoGkKDHVX9stdgFNjWb7jmvjjf
         Mria+DjQf0SlvWHd2jY1HRTNNS6pPx2EQh8Dan/KxFdY8oa8zWtmV6m+s3czTSpqv6t+
         cx1Q==
X-Gm-Message-State: APjAAAVnk5lK/kFryEF8Ne/XafF5xUqf1NbGjLxKYYUi3Z23O8UG0/9D
        3rLw3NHiOhcM1bt4ooo5DNg3MAs5YEDZ8s3BKWiBlw==
X-Google-Smtp-Source: APXvYqxET1q8n/qQ6aY0jYO8nGz1OvZdbUcpn8bnrFqAZJyuuJYIXotPvLB+pBHSS5AiqYMW6+TjrlGJYozegKXPWGc=
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr18353599ljg.3.1580840527698;
 Tue, 04 Feb 2020 10:22:07 -0800 (PST)
MIME-Version: 1.0
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org> <1578630784-962-6-git-send-email-daidavid1@codeaurora.org>
In-Reply-To: <1578630784-962-6-git-send-email-daidavid1@codeaurora.org>
From:   Evan Green <evgreen@google.com>
Date:   Tue, 4 Feb 2020 10:21:31 -0800
Message-ID: <CAE=gft6--=zhxfR9G=S0g-5c9YdpvaFWz9dcgV7zJQAzcreZjg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] interconnect: qcom: sdm845: Split qnodes into
 their respective NoCs
To:     David Dai <daidavid1@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, sboyd@kernel.org,
        Lina Iyer <ilina@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        Alex Elder <elder@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 9, 2020 at 8:33 PM David Dai <daidavid1@codeaurora.org> wrote:
>
> In order to better represent the hardware and its different Network-On-Chip
> devices, split the sdm845 provider driver into NoC specific providers.
> Remove duplicate functionality already provided by the icc rpmh and
> bcm voter drivers to calculate and commit bandwidth requests to hardware.
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  drivers/interconnect/qcom/sdm845.c             | 1132 ++++++++++--------------
>  include/dt-bindings/interconnect/qcom,sdm845.h |  263 +++---
>  2 files changed, 609 insertions(+), 786 deletions(-)
>
> diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
> index f078cf0..8145612 100644
> --- a/drivers/interconnect/qcom/sdm845.c
> +++ b/drivers/interconnect/qcom/sdm845.c
> @@ -5,283 +5,285 @@
>   */
>
>  #include <asm/div64.h>

You don't need this header anymore, right?

> -#include <dt-bindings/interconnect/qcom,sdm845.h>
>  #include <linux/device.h>
>  #include <linux/interconnect.h>
>  #include <linux/interconnect-provider.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> -#include <linux/of_platform.h>
> -#include <linux/platform_device.h>
>  #include <linux/sort.h>

..or this one.
