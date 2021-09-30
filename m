Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24D141DB30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 15:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350997AbhI3Nhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 09:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351463AbhI3Nhc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 09:37:32 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013CAC061770
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 06:35:49 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id p80so7518534iod.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQTGhwriO5YzGyzUzOATQVEjkGTb234ZmtsCzpyd/Kg=;
        b=msmbF+kJMXVaBBPIZ7DtFOLZqvpdvVOw84Np2bU0lIxPM5InUeihp3fNyY/KfN3bSk
         DlXHiG6I6F7C2Uoa1sKZVFefNbCggPcT/4IGodqER1U+0rrcmMFnyIBvvXWXlk2xTKl4
         0Bw3GGCPq7Q5ah7kNL7pURw8GEcd+qpnB/q54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQTGhwriO5YzGyzUzOATQVEjkGTb234ZmtsCzpyd/Kg=;
        b=UVdoGFoR3QSN0Gdn1aPtRdfl3Ex5JKMlY37J65uwBMKcsWxds8m7GW53zJiVm51x4z
         sZA24QAJn05E4+XYJVluByc70eByTnBED4KDA5ugKtlOANYmUU8nV4xryq+2Tn6ofJ7k
         O1Lh1QoaS9pmVboF+dXr8unDegxU6ufzaOAN/CyMghP8/RBRGq3Jidjrgc+NDQPg4hQ7
         wFjbYKDKizsJxMRpUS4zMaQxR/qfdH1KL+tFwO4ltQzRhV9ByvWcl2FHGnEmRLAmfs2I
         vewofDvPEqNmLE8CdyX0qGFjitKcAFzRdQfAx+Zdfn+8jLkVQM9N4h+nX2GbEfoFphqm
         ETpg==
X-Gm-Message-State: AOAM5308y3C4s0HiAIWCoOpx/D44kMv8HEGrkQfzINg9w6oEvqPfJ+Zq
        gXJiYV4P7n6TcWzTcVg7AMNypiYkuazz+Q==
X-Google-Smtp-Source: ABdhPJznqIiiO1ow/a2SwwNdhdVNcKxvx8SbkJtIFyU7dUWHMhxW1vhPhBhfKhtbLQuuLh/OcbrkMA==
X-Received: by 2002:a05:6638:2606:: with SMTP id m6mr4876803jat.50.1633008948360;
        Thu, 30 Sep 2021 06:35:48 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id l3sm1777172ilq.48.2021.09.30.06.35.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 06:35:46 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id n71so7628553iod.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 06:35:46 -0700 (PDT)
X-Received: by 2002:a05:6638:134f:: with SMTP id u15mr4954621jad.82.1633008946179;
 Thu, 30 Sep 2021 06:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <1632997450-32293-1-git-send-email-rajpat@codeaurora.org> <1632997450-32293-3-git-send-email-rajpat@codeaurora.org>
In-Reply-To: <1632997450-32293-3-git-send-email-rajpat@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Sep 2021 06:35:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUcP1700_cD+k_OTV=p60txTqm3av6JJiO7r9m+ZMU6Q@mail.gmail.com>
Message-ID: <CAD=FV=WUcP1700_cD+k_OTV=p60txTqm3av6JJiO7r9m+ZMU6Q@mail.gmail.com>
Subject: Re: [PATCH V1 2/2] arm64: dts: qcom: sc7180: Add qspi compatible
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 30, 2021 at 3:25 AM Rajesh Patil <rajpat@codeaurora.org> wrote:
>
> Add "qcom,sc7180-qspi" compatible in qspi node
>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
