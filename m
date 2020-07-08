Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF38218F61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 19:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgGHR7i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 13:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGHR7f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 13:59:35 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53ABEC061A0B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 10:59:35 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id q15so14222392vso.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 10:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hiompu44sJmWIX0VHQ2p43N5hGspvrVdRKwV2/c7PTg=;
        b=P9+4sBCXeroD/gl9lFaX0m06xjtx10agKSYwDQ+/NbcOaSqY89NkXRbgqBPgQRcOVj
         2sE/15k5UksYrS6NLHG1qzC0R1PFVEXJFB/IoQuFPz8kRo7ozYT8rfPO1xJegBPdj20k
         dgvGQbI7VTNxqtWycqUuFvVewZCIYxRbrTVJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hiompu44sJmWIX0VHQ2p43N5hGspvrVdRKwV2/c7PTg=;
        b=A62XNV5G04JEn3s3nAzxWJGjyZAw4s7RvGmAYKp5NmZCZhg00d6jwhaYpxxaQTkjAv
         JqL9BN5IDA8WcmK2fDyFdd9HNBBJ6/3Clm2TjwwjnTd9Gm/Fw6xNmgLPHHU49fTJYaAN
         Ll1P1z0Cbhbfmjl6acJHJcoZ+l2cC9Ont3hTPaXmZLxq4Mdre/cvvVJ+njQKypRe8R/V
         R/5dWvSb3cgZW2JlUp6zzzr2wURMJ9T5mS/yAzzz3TxijXKvtvK52dMPewSOgYSeIdqX
         bDTMXnkp+JjPozEuHOSOn0rtDZDGkU1US0WD8rzae0nLPcvb4fwut9bWBUhuD5UecUgY
         c00A==
X-Gm-Message-State: AOAM530bEE3UW0TDbnLmFMxOreh5/i+lYWU+F59nhjA0ZstIwNjWPmOs
        CDQTnswYkoYjEWFcwR5FJuQqnR4I4UQ=
X-Google-Smtp-Source: ABdhPJykFfFS+/d7h7p7hMF/evp0tRVvHLLde01csn8aOxJvsudGkEH4Klev8Th4dx3vSmZaRgPEcg==
X-Received: by 2002:a05:6102:663:: with SMTP id z3mr2618916vsf.144.1594231174361;
        Wed, 08 Jul 2020 10:59:34 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id t135sm76025vkb.56.2020.07.08.10.59.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 10:59:32 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id m21so9162067vkp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 10:59:32 -0700 (PDT)
X-Received: by 2002:a1f:3f05:: with SMTP id m5mr18475983vka.92.1594231171733;
 Wed, 08 Jul 2020 10:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200630081938.8131-1-sibis@codeaurora.org>
In-Reply-To: <20200630081938.8131-1-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Jul 2020 10:59:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2JyYaNBjkFgiKEuWpvNSyt+GP_kAbAtOkNizt136EFA@mail.gmail.com>
Message-ID: <CAD=FV=V2JyYaNBjkFgiKEuWpvNSyt+GP_kAbAtOkNizt136EFA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Drop the unused non-MSA SID
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, "# 4.0+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 30, 2020 at 1:20 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Having a non-MSA (Modem Self-Authentication) SID bypassed breaks modem
> sandboxing i.e if a transaction were to originate from it, the hardware
> memory protections units (XPUs) would fail to flag them (any transaction
> originating from modem are historically termed as an MSA transaction).
> Drop the unused non-MSA modem SID on SC7180 SoCs and cheza so that SMMU
> continues to block them.
>
> Fixes: bec71ba243e95 ("arm64: dts: qcom: sc7180: Update Q6V5 MSS node")
> Fixes: 68aee4af5f620 ("arm64: dts: qcom: sdm845-cheza: Add iommus property")
> Cc: stable@vger.kernel.org
> Reported-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts    | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I'm not sure if my review is worth all that much since it's not my
area of expertise, but as far as I can tell this is good / ready to go
in.  I've confirmed that a similar on my sc7180 board doesn't seem to
break anything for me so restricting things like this seems sane.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug
