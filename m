Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6156F8CE5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 01:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjEEXvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 19:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjEEXvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 19:51:17 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20DD59E8
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 16:51:15 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f0108a7d20so2685041e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 16:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683330674; x=1685922674;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjqVzDbSdokuJC6mTOMnxxsNtmjmsehygGNPxKGCXGY=;
        b=hN2qCvmtLCe7wGeckPEGJDHXA6eSq/MigjzbBVVTNQzecbygZIBAGRj7TPE8Fan0xx
         Y3bUbJQn06wuCVpLSMTx89mJtF7bBAYOGz9SyjR17XmoWaiHJs2EKe+M8F+SNVY8p2sb
         R7GnNkkvfA51svet8Q+HqsRO1ldkLp9jAwTP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683330674; x=1685922674;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjqVzDbSdokuJC6mTOMnxxsNtmjmsehygGNPxKGCXGY=;
        b=aqAisEw+BGq697hHplPLtUfxGOXqNnNpNctx6iGxNenvWQgMbp6wWBVWD6FaoYVQgi
         M/Jky7NljosGKgVwSGP2rVz8JV4fVIw0ctSnWl1ajHPULxdxyzehxVORkuYZMIh6qyYj
         llXFk9CjDY2lJ0tFGimKpgejFjqPI666jTqYsA7b2YlB7EZX238feAg4Q80C/4l/0QP0
         R+e86qeLrLL1X8zJYUdi8/9Vls5sImW+aErfWxWDawgFivUPRpGa6yscvXl+3CAtnNtf
         4bRvPskr+OA1MbmV8Cu1ONHlPmw4YQ5M5qs8hrSXpEDg0C93vk9vb4mNEv7s6bJiLmIC
         QwOA==
X-Gm-Message-State: AC+VfDx+3EpX/eEwRBij8Y1/dx/16vaQVt8BTTdjWD+7E8qAz6J7Ziku
        zSRDJEQW6n4xS5Yi94yEOMHm/FobaRfIwnXPhIC4gQ==
X-Google-Smtp-Source: ACHHUZ5NZfYKYWBQrU0BEtZE7GYJKOY2rbcfUoPtPN7I+zGCcJekGogEeUwQD9Vt9dV7O7vzpBFyhQ+Drw3YQZHK5RY=
X-Received: by 2002:ac2:51b1:0:b0:4f1:4996:7e84 with SMTP id
 f17-20020ac251b1000000b004f149967e84mr839109lfk.34.1683330673904; Fri, 05 May
 2023 16:51:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 May 2023 18:51:13 -0500
MIME-Version: 1.0
In-Reply-To: <20230505152301.2181270-1-krzysztof.kozlowski@linaro.org>
References: <20230505152301.2181270-1-krzysztof.kozlowski@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 5 May 2023 18:51:13 -0500
Message-ID: <CAE-0n50jZ=EG29Gmr9zvjq0_qEXXSUBA+w65uE-P--+rxYGNiQ@mail.gmail.com>
Subject: Re: [PATCH] serial: qcom-geni: fix enabling deactivated interrupt
To:     Akash Asthana <akashast@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krzysztof Kozlowski (2023-05-05 08:23:01)
> The driver have a race, experienced only with PREEMPT_RT patchset:
>
> CPU0                         | CPU1
> ==================================================================
> qcom_geni_serial_probe       |
>   uart_add_one_port          |
>                              | serdev_drv_probe
>                              |   qca_serdev_probe
>                              |     serdev_device_open
>                              |       uart_open
>                              |         uart_startup
>                              |           qcom_geni_serial_startup
>                              |             enable_irq
>                              |               __irq_startup
>                              |                 WARN_ON()
>                              |                 IRQ not activated
>   request_threaded_irq       |
>     irq_domain_activate_irq  |
>
> The warning:
>
>   894000.serial: ttyHS1 at MMIO 0x894000 (irq = 144, base_baud = 0) is a MSM
>   serial serial0: tty port ttyHS1 registered
>   WARNING: CPU: 7 PID: 107 at kernel/irq/chip.c:241 __irq_startup+0x78/0xd8
>   ...
>   qcom_geni_serial 894000.serial: serial engine reports 0 RX bytes in!
>
> Adding UART port triggers probe of child serial devices - serdev and
> eventually Qualcomm Bluetooth hci_qca driver.  This opens UART port
> which enables the interrupt before it got activated in
> request_threaded_irq().  The issue originates in commit f3974413cf02
> ("tty: serial: qcom_geni_serial: Wakeup IRQ cleanup") and discussion on
> mailing list [1].  However the above commit does not explain why the
> uart_add_one_port() is moved above requesting interrupt.
>
> [1] https://lore.kernel.org/all/5d9f3dfa.1c69fb81.84c4b.30bf@mx.google.com/
>
> Fixes: f3974413cf02 ("tty: serial: qcom_geni_serial: Wakeup IRQ cleanup")
> Cc: <stable@vger.kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
