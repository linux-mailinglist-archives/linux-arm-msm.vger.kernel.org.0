Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FDE543796
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 17:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244450AbiFHPjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 11:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244248AbiFHPjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 11:39:12 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412CA1B3191
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 08:39:11 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id fu3so40743445ejc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pwvu2vstIFuDbmoLlIWPg/mZg51nUvruTLPNLTKmJS4=;
        b=UE8t6cShY61wMWjfBUo2llFLOvRxnFzadwxYtpIfrsJBoaeB9l44NeHhs3KGGNHo/V
         NWF7NiBYCPVw2/PpbZ8LkvHOEUfJZPmQTy1hgG1LbGzz5brEVJcZHXK1B26P3BFbeGn8
         OUNdwu0Np6qZ68dvFX1cQQT8CmhFPQLtBFJqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pwvu2vstIFuDbmoLlIWPg/mZg51nUvruTLPNLTKmJS4=;
        b=dCkVQ+2mOu94ALsXD1ITpwKiuDF0aXd8EMyfs6/zQEeVljSvXNNB1qhgx+0uM54a5q
         7doTOU7CYQ5oZ8A07S7SmaJ3LY7hj84H3X3KZuFCVYnhewEKSrtGrzW2LajD8JAxsWLt
         JiYgCgFYc25IgqmfSJwdFIH5T0keBQRJ6n4a4RIsjc0lWLlYjGhHb1hWsC//PnIuqZRl
         qm3Twxc99lR+gAeZTtGEj/JTZ8Jkcvh3FwYixpQhEpvwW0aK7eGBQSBFqY1BeXMu+Ay+
         nVIfNoBFc+VhArJmHYZ2TFmgzEARIcSUQL5ZVewrq6XA0GxyVm2tg5ARBEKj3oKXQ71Q
         ku+A==
X-Gm-Message-State: AOAM533YdMoVF5jfO2t+JEy+LpIl9ouMPWLvAeXokAb7nP6rqbsr1Uxb
        iLpkjRixU8ZNNYA+uYdU03nBksJ7PWkrWKy4Bqg=
X-Google-Smtp-Source: ABdhPJxbnxhK4e6E9cOOhtNXu5h9gtjdNAWWWNfjd6xxKG094TaehjdaF7rzJQeGkbwqna5lyB5zWA==
X-Received: by 2002:a17:907:948a:b0:6ff:14dc:2fe7 with SMTP id dm10-20020a170907948a00b006ff14dc2fe7mr32771684ejc.299.1654702749508;
        Wed, 08 Jun 2022 08:39:09 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id k26-20020a17090632da00b006fec3b2e4f3sm9165898ejk.205.2022.06.08.08.39.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 08:39:08 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id s1so5778852wra.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 08:39:08 -0700 (PDT)
X-Received: by 2002:a5d:6483:0:b0:20f:d046:6382 with SMTP id
 o3-20020a5d6483000000b0020fd0466382mr33588969wri.342.1654702748098; Wed, 08
 Jun 2022 08:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <1654627965-1461-1-git-send-email-quic_vnivarth@quicinc.com> <1654627965-1461-2-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1654627965-1461-2-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Jun 2022 08:38:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UD-ruxBK3TarJCSP8zkCQ37kCO5=cbYBJzou5GSqN63Q@mail.gmail.com>
Message-ID: <CAD=FV=UD-ruxBK3TarJCSP8zkCQ37kCO5=cbYBJzou5GSqN63Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: core: Introduce callback for start_rx and do
 stop_rx in suspend only if this callback implementation is present.
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com, Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 7, 2022 at 11:53 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> In suspend sequence there is a need to perform stop_rx during suspend
> sequence to prevent any asynchronous data over rx line. However this
> can cause problem to drivers which dont do re-start_rx during set_termios.
>
> Add new callback start_rx and perform stop_rx only when implementation of
> start_rx is present. Also add call to start_rx in resume sequence so that
> drivers who come across this problem can make use of this framework.
>
> Fixes: c9d2325cdb92 ("serial: core: Do stop_rx in suspend path for console if console_suspend is disabled")
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/tty/serial/serial_core.c | 9 ++++++---
>  include/linux/serial_core.h      | 1 +
>  2 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
