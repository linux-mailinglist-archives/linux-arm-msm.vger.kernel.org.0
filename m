Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C204663BDBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 11:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbiK2KOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 05:14:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbiK2KO0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 05:14:26 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3A43123F
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:13:35 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id n9so1561096uao.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/QzDW2d1Cs4mC6YU3nOgkgXahHnX/LojCaovyJcwNQ=;
        b=biYhLlnFfQu5qbIvH6K6dxXUh9531anxej8Wa6rlutOAmz9PFvMAzbQJCn662NBeZ/
         Qf34dK6UJ0inR8mxfyAZKbXX2yOLX1Do2iYoCK+AozJJj75XsoNTkrrkdwGw6hqUugiz
         kc7X7SrrXxeqxCmymm7/aZe/DyG2J5xfkxBxMxcdTsUhoRRNe37KG0tJ06q3EBhp9UnR
         nHz+d4F44d9fluRwRUVQN/IDqvFfJlsnnqGU0gv5K6UsAlZou4NobkRUaNzAE5g4EUtq
         qXNTTUDFqAIN8o4WaIVz7JuBdQlkik53HgjE5Ng+nDwEDXNYyaj9gqidMEdRnexgQ7zv
         AN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/QzDW2d1Cs4mC6YU3nOgkgXahHnX/LojCaovyJcwNQ=;
        b=r02pucdKi6G84/bVPD3SqHF7zZmVTGbQxcKhuPpfmOKRgMj70hgWGMh7iuiCzklPw6
         1SYZIgBcNFF5I+1Bhe0xAeAt56Yh1BgScj+78HKtBSAihCLTgCTk+dP/lgjImeqmgUEP
         8HzCYvIk/NRnQG7z+gzHD0l/QMuOjVOhGBn217I+OiVa3K1cgs8t56e+WDJ4GbpWJRfJ
         t369+XQNW6CTLSFJtZpdaFDUzdDywkMg0/2fnfB+Fb6uZ/V0dxcHIBAqWUAqZwIKxrva
         1hJIas5G7BRmLMxdBxTrVkug2Dbg25HRR23cUMYEDgdJ1tBtpWkpTT1uYpTcoz+TCsLh
         +M5w==
X-Gm-Message-State: ANoB5pkUxJppsiZVKuzqJ4WPDmcO4I1VlbAtT2BqU0HHN8sOAFv8BmbL
        TSQFNhenNIEaksBvKjluobndaCaCkXOYsFZNPxFL+w==
X-Google-Smtp-Source: AA0mqf707P6Kmly5KCwDCM/FQLqA7B2S9xjQRRs0Dqoia9yp+q8vbzEuqLIgGiZas6uFYrbC0zJH3q5ugx2zYpdsYGE=
X-Received: by 2002:ab0:5a6e:0:b0:415:715c:1e70 with SMTP id
 m43-20020ab05a6e000000b00415715c1e70mr24352734uad.81.1669716814427; Tue, 29
 Nov 2022 02:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20221123110759.1836666-1-brgl@bgdev.pl> <20221123110759.1836666-14-brgl@bgdev.pl>
 <426d1f07-0a5d-b740-dc93-77c5a8bc6d23@linaro.org>
In-Reply-To: <426d1f07-0a5d-b740-dc93-77c5a8bc6d23@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 29 Nov 2022 11:13:23 +0100
Message-ID: <CAMRc=Mdo-a3sxaTg=AM_dMMNyV_sw9VxGF-T5RPD2Vhxe2pQOw@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] tty: serial: qcom-geni-serial: add support for
 serial engine DMA
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 25, 2022 at 3:37 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>

[snip]

> > +
> > +static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
> > +{
> > +     struct qcom_geni_serial_port *port = to_dev_port(uport);
> > +     struct circ_buf *xmit = &uport->state->xmit;
> > +     unsigned int xmit_size;
> > +     int ret;
> > +
> > +     if (port->tx_dma_addr)
> > +             return;
> Is this condition actually possible?
>

So it turns out, it's possible that the subsystem calls start_tx when
this is already set but the main engine is not yet in active state (so
we can't simply test that bit). This needs to stay then.

Bart
