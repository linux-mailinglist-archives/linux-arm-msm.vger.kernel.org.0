Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726EC33C704
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 20:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbhCOTp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 15:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhCOTpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 15:45:19 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F40C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 12:45:19 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id p24so7530011ota.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 12:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VY11BYIgAhCdWHUv8waddSOddoxkrAGuQw5MjJrS3vE=;
        b=GDpRPRI//le1LnCEZjHY3CRsvGZn1WUwU0XqZETVFu0JTsDRUob8NaBFBE/QPkSije
         lWALMkwyNNGg0/Az5S/GYNsvSdsOM3ItFDLJORMlJZ088/Ja9Zvrbu0IQhhQGbMfAjt2
         G3C1QHIazpw562mBVqTlCFFPlIarX8xkZfckg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VY11BYIgAhCdWHUv8waddSOddoxkrAGuQw5MjJrS3vE=;
        b=M1C2CILUE/FzY/ljoboQzbSWnsD0l113GvTlP/Q0Vx/M9TKO+dQgB5+Tfe59Pa6J82
         yAaGI2AMu8l+45OLN92YHHjcKSnpSMwFVSeUZVauOLNnYe9eZdtPdtuGj+ZhqNpHDAlB
         YwK5HjBv/9ibMDQnpM55DaT5dmJAVJ3uDRT5CbD7IDEqytwhiq06qlA9KlIU36eTPAI7
         h9VJAMRFV7grZk1zkH2dsbXyGkMbzwGv8LReAr1lO2Ql9QYSxqaoA00Gg6zXLnx1dkJO
         qnogNjFZH55sc+Pknpu7TgsxKmQX5OgGMOOPHjgkjfTjJebiEYPvMoaaxyLifHhuElW8
         iJnQ==
X-Gm-Message-State: AOAM530Ej5WnY2iZXBxpfjqFW6lIyN9vMbUgeGmI8MwAYBIFfYh30M6m
        N/8yUfP4YfQAJ9AGq8bY9WwRrCn9smhJCw==
X-Google-Smtp-Source: ABdhPJx22aNZCge5n4zljOPBC6R39z1VTRFCQ9911jdcDoQv45p84reLMI6iKI5g4oSw916SUhCCeQ==
X-Received: by 2002:a9d:80e:: with SMTP id 14mr543302oty.211.1615837518251;
        Mon, 15 Mar 2021 12:45:18 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id f22sm7252462otl.10.2021.03.15.12.45.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 12:45:18 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id e45so7532965ote.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 12:45:17 -0700 (PDT)
X-Received: by 2002:a25:cf88:: with SMTP id f130mr1887543ybg.476.1615837084349;
 Mon, 15 Mar 2021 12:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210314061054.19451-1-srivasam@codeaurora.org> <20210314061054.19451-3-srivasam@codeaurora.org>
In-Reply-To: <20210314061054.19451-3-srivasam@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 Mar 2021 12:37:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VcOsSsn1MGkhd-t0dPv4cTOO2UV6+44oPrZ5iS0-f56w@mail.gmail.com>
Message-ID: <CAD=FV=VcOsSsn1MGkhd-t0dPv4cTOO2UV6+44oPrZ5iS0-f56w@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Mar 13, 2021 at 10:11 PM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> This is a trgodor variant, required to have sound node variable
> for coachz specific platform.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

With these two patches plus commit 9922f50f7178 ("ASoC: qcom:
lpass-cpu: Fix lpass dai ids parse") in the sound tree I get audio on
sc7180-trogdor-coachz! Thus:

Tested-by: Douglas Anderson <dianders@chromium.org>
