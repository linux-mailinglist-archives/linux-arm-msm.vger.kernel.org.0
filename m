Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3407248688
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 15:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHRN4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 09:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgHRN4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 09:56:36 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C9DC061342
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 06:56:35 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id k25so10126920vsm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SQHECpOUmUIUn/BlEGYsCVfl8NoL6sE1Zq5USMNyPsA=;
        b=GFlw44Sp9NvIROQShqLUaqn4pvZMQJmHC9t78x2jciAp3VCTruRs3JKFPbGAdavqdA
         jjRu4+46WRShUl2tgpcae4KqfCCmG8mTS2YQJgacVlzlgzqWEW+Y+2RPD4A4lrMKKttT
         yOKhXnEcWWI+FwdcvX4J7AZCbJaepBlthLTbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SQHECpOUmUIUn/BlEGYsCVfl8NoL6sE1Zq5USMNyPsA=;
        b=P5hhyVL86xYPGxGAuvKjD+sVB1YJxMqO2Piyc36+JHd2n8jU+RD4c0Z9ZPCJPZo31J
         2nFuff7uvXh5tutGSAwOTHb0cxHQl9pqeo8PrtqiNLIq9KraegrG69sDNvG1Xn6y4SaQ
         VmGv2v2ZiO9hXLPOm0mu/yd3XEVux5zg06xqNOYqN2DgLHhcjCbk3qXt5H4NrGsQFx1S
         moIBMUyDJ0q2ynntLZX51AhoHhojK8+xnvAdxhDMuEZW04kcWtoU0Bccr2Pnt73RStuF
         JCSfo7yT0fYdBlKrfLwBDBMy6g3Xjr/VzD649VLAXsO147OOEXQVsEa+MpyF3u5EEO0Q
         jFuw==
X-Gm-Message-State: AOAM533pVRgd0PS4E1TjYYLswvzEdVPHAHmV7RFtn5z4dwHO4Hg9qXZq
        DHV3FqV5x1O5heUpTu4umIPft2QjnW1L3g==
X-Google-Smtp-Source: ABdhPJzEs71flTIjv9iJ4kTOjTQ9aGfGWXMIcxskmWJVc9C0bj+/JoiBLTOBn92435ne2jsv91emSg==
X-Received: by 2002:a67:f753:: with SMTP id w19mr10783141vso.84.1597758994670;
        Tue, 18 Aug 2020 06:56:34 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id k12sm4087101vke.4.2020.08.18.06.56.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 06:56:33 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id p8so10119397vsm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 06:56:33 -0700 (PDT)
X-Received: by 2002:a05:6102:213a:: with SMTP id f26mr11637826vsg.6.1597758992748;
 Tue, 18 Aug 2020 06:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200817040417.11111-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VVeoqOsVzJiCxjYTpJc8JX4Qx3vB+0evzp8oMdYsRZvQ@mail.gmail.com> <5c8b1664adceab8c600c80058e40cc97@codeaurora.org>
In-Reply-To: <5c8b1664adceab8c600c80058e40cc97@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 18 Aug 2020 06:56:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJB=6PxaG6LZsjQdWxKbVonnm9WTHwqCeoXPMD=uWjfw@mail.gmail.com>
Message-ID: <CAD=FV=VJB=6PxaG6LZsjQdWxKbVonnm9WTHwqCeoXPMD=uWjfw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix the LLCC base register size
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 18, 2020 at 12:38 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> There is one LLCC logical bank(LLCC0) on SC7180 SoC and the size of the
> LLCC0 base
> is 0x50000(320KB) not 2MB, so correct the size and fix copy paste
> mistake
> carried over from SDM845.

Sounds fine, thanks!

-Doug
