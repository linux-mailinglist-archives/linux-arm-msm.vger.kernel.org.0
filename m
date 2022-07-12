Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 296C4571BFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 16:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbiGLOLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 10:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiGLOLg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 10:11:36 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37FA33E19
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:11:33 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id fd6so10266725edb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YBU84SRNLc6JB1Nu5oUhv+2JH/yb6vYKX7qMUKcEA/U=;
        b=HVDAKTb8QU6+A5APYQt524idn27AtAFUkPxSl1zqDjminGIQq8VZ28WSHeIeH1cYmp
         Zei6wL2/JJOlPrXH3YXdM3QmDxLvPhupy9vKx8veZjVLJp8/pHA6FccBbfFHGzMPlpWK
         5LoNik9uVHiE432REpBpgVr3ox45JYIthlEMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YBU84SRNLc6JB1Nu5oUhv+2JH/yb6vYKX7qMUKcEA/U=;
        b=y6/hf53i6Coyp6m4zCDi1dfCxH7tKlzVO6PcyTGiXd0mhf6gtSqezEu1g1KZ58yBzr
         dB6Gy1DK9z4Ohvo37UQYjLl1whkj9xZ91qmESgHkjahIrlSxEhT967I+uXVY8VkcF/dq
         mFXxOzf/lKQTae+ZtxELFY4dTAFubICyVYpV7oJtInJSLzufINjCd3j2v08oywr5M+It
         N2oMx4Pv3L0JTtVoXlacTCNfhx/JTZ1BCEZJy2J6NR1Z1MAe070/HAbTvvQS5uEI7ywQ
         JimTOCVNF/5Eq6AZXCdylnvoAFzqAAIslMONhr70PS8gnvfuShrjoA/OgSraZ5yVyWMx
         a8YQ==
X-Gm-Message-State: AJIora9TNFJKX9s5gClEISbz7c1GqOnSmkyHEgcjDO9Mfm+JfZ4hcPzx
        LnTwjpePgCxZ3g4uC2y7bxkgQBvrBrzGZ2i9R+8=
X-Google-Smtp-Source: AGRyM1u6eHeJeiBtt1fztFIeOq4s3+sN9pdXJy88rp8O8v/fSVlP/ETfml/WkHTMlM3o+cSZGb/BiA==
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id b10-20020a056402084a00b00426262d967emr31326823edz.286.1657635092017;
        Tue, 12 Jul 2022 07:11:32 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id b16-20020a17090630d000b0072aeaa1bb5esm3865631ejb.211.2022.07.12.07.11.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 07:11:31 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id o19-20020a05600c511300b003a2de48b4bbso5459799wms.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:11:31 -0700 (PDT)
X-Received: by 2002:a05:600c:285:b0:3a2:e5fd:84eb with SMTP id
 5-20020a05600c028500b003a2e5fd84ebmr4162603wmk.151.1657635090577; Tue, 12 Jul
 2022 07:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <1657629905-24685-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1657629905-24685-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 12 Jul 2022 07:11:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGivNzu_e5nrgOYkkqpWdXGgyG2MjB9xRbXm_V3JyPsw@mail.gmail.com>
Message-ID: <CAD=FV=XGivNzu_e5nrgOYkkqpWdXGgyG2MjB9xRbXm_V3JyPsw@mail.gmail.com>
Subject: Re: [V5] tty: serial: qcom-geni-serial: Fix get_clk_div_rate() which
 otherwise could return a sub-optimal clock rate.
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Mukesh Savaliya (QUIC)" <quic_msavaliy@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 12, 2022 at 5:45 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> In the logic around call to clk_round_rate(), for some corner conditions,
> get_clk_div_rate() could return an sub-optimal clock rate. Also, if an
> exact clock rate was not found lowest clock was being returned.
>
> Search for suitable clock rate in 2 steps
> a) exact match or within 2% tolerance
> b) within 5% tolerance
> This also takes care of corner conditions.
>
> Fixes: c2194bc999d4 ("tty: serial: qcom-geni-serial: Remove uart frequency table. Instead, find suitable frequency with call to clk_round_rate")
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v5: corrected format specifiers for logs
> v4: replaced pr_dbg calls with dev_dbg
> v3: simplified algorithm further, fixed robot compile warnings
> v2: removed minor optimisations to make more readable
> v1: intial patch contained slightly complicated logic
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 89 +++++++++++++++++++++--------------
>  1 file changed, 54 insertions(+), 35 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
