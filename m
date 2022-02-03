Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7DE4A8FB6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354641AbiBCVUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbiBCVUp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:20:45 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58625C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:20:45 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id v17-20020a4ac911000000b002eac41bb3f4so2652791ooq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=y95VeXJpx3vOoeikTCD1Ve6P/I02Gee/QGrE9GHvt58=;
        b=Hwy8ON0gG1kh+ZTpl33LE55dFkF7cMNSwBU+IDKTLPfYa6tqKfxAJFe49sUn0vO69V
         JPT2hu3wAB/ef+R0ClcvvjISRSyq2uTNpGXa+bFl/FjuCt8XJjsJAxlbUoUq0mzQ4hxH
         ni2gqqiJcNw/QkcHZMICYFkXaggG4jeMSMk1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=y95VeXJpx3vOoeikTCD1Ve6P/I02Gee/QGrE9GHvt58=;
        b=A/Mw5t1eaAdxl56s8knHIMiQXWn2vjUW6CMcNQhaRnQ77Z7J5dmTBWQ5sLd9FCYkK5
         6gWZzmrt7zbn6TKsBnI9Qs3JeN6G0UlUB6mlPd8jkKua74vhS/7U9JuRRoUEhNtCqycf
         cAFgIVDqgr0UbVRyUcXnI/zRfhzF0NXTP5UymcafJIzxkEIBr0a05EmiUOfEFcMF0ZgX
         h+KaYnVTcY5mBXxHAldX6vj5Lk4B4c9wepZ5u0SjroOLz/1xqs5275vSEOBawduobhyy
         m4BOI6GE9ZgjkCg+v1EyLVW8X9aFfSOuDfi18XlUUK2wFv1tCtTgx+mE93IcdMyMaWTE
         MEPw==
X-Gm-Message-State: AOAM533TrfhA4/QFRjXee7PHVKhZ1LHJWZGMz3runHv6vWODo8oXfEzx
        n3cUBqxuVT44hALEeUjsmu7WFLtc+hYdxcJyGnEtyg==
X-Google-Smtp-Source: ABdhPJwCeGS8kNr/2zxHh1m/MtXFFZAELvD42aHlsAqE89sWlAEPmMLPDGJyD6Q/Q0dnBmicx6SdIjBi35DJeMNhhJE=
X-Received: by 2002:a05:6870:6256:: with SMTP id r22mr1865oak.8.1643923244734;
 Thu, 03 Feb 2022 13:20:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:20:44 +0000
MIME-Version: 1.0
In-Reply-To: <20220203010804.20883-4-quic_amelende@quicinc.com>
References: <20220203010804.20883-2-quic_amelende@quicinc.com> <20220203010804.20883-4-quic_amelende@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:20:44 +0000
Message-ID: <CAE-0n51WVcbvgRrbi84JWDYAciXrz0LyHHym2VLXhiz_hoX7sg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] input: misc: pm8941-pwrkey: add software key press
 debouncing support
To:     Anjelique Melendez <quic_amelende@quicinc.com>,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, collinsd@codeaurora.org,
        bjorn.andersson@linaro.org, skakit@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Anjelique Melendez (2022-02-02 17:08:07)
> From: David Collins <collinsd@codeaurora.org>
>
> On certain PMICs, an unexpected assertion of KPDPWR_DEB (the
> positive logic hardware debounced power key signal) may be seen
> during the falling edge of KPDPWR_N (i.e. a power key press) when
> it occurs close to the rising edge of SLEEP_CLK.  This then
> triggers a spurious KPDPWR interrupt.
>
> Handle this issue by adding software debouncing support to ignore
> key events that occur within the hardware debounce delay after the
> most recent key release event.
>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---

Is there a Fixes tag that should be here? Is it a new problem with newer
PMICs?
