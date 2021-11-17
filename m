Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103744550A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 23:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241351AbhKQWlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 17:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241390AbhKQWlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 17:41:22 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92577C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:38:23 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id m9so5485747iop.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++yK/fefOCnm5/0BEaS3pGjqkSD2xStfuHUGZISxXZo=;
        b=PwDl7vqqUSkJvq7T+MXFYsdBvi3ghKL9+p2yzxKB11sb3Q0OskN6YGorN6NlN4j3Vb
         /D5btlCUAkuaxJvxF/qjZwFTgpKYwm4r7W3FWOY2+Zf2cQL4YOnHIS98IIGwv5OgNm+N
         Fwu5WtCjHanUdDjGxGUbQCXXpmFGVQ6KxCBYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++yK/fefOCnm5/0BEaS3pGjqkSD2xStfuHUGZISxXZo=;
        b=ErB3pqGqRvZWfbmlh0rfCkqv3D1n6CMlcvaYfC3f6gDZPmdUk/cbPUA/5abBpmlmae
         JQCeHvtrj19jEIEfm++A4w/zsPJTFh9xIDX8yGhNpOXFUhetLNnRzuVpy2iUh9LmVN2t
         f5vvh96Gd6DpoNsR6cfSpnniXylh4cWZGglnjTePwAvo1ZjO2IrId/6fnQKJIwsrOh5G
         HLrHb5GF6orvhAHS8rQetU6GZDUgOGk60gDBhdaBJgQh39EGmJjvwJY0xM51kuGfR4rZ
         JDeI4z4wm9bJ6giiYiAXpOW1RzL/Z4OwAKe5hlLS6L125+lnJHm/0gpuE/V1TH22MoZ4
         uvhg==
X-Gm-Message-State: AOAM532B7+xwr39rMu5tDITnL0PfIRSTi/sSTgxnKSAylUSOtzneIOg7
        7p1ToL+MqJz5HQ21kvc2sd5DhLi73N+dAA==
X-Google-Smtp-Source: ABdhPJxgEJm8viBI0ho44xJA+OcwOUkdpti18V1FEpVzIHDxsPvNLYuk1y5QlHH8XCtkXrlk0NpdHA==
X-Received: by 2002:a6b:b490:: with SMTP id d138mr13969143iof.180.1637188702862;
        Wed, 17 Nov 2021 14:38:22 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id z6sm1059757ioq.35.2021.11.17.14.38.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 14:38:22 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id k21so5413923ioh.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:38:22 -0800 (PST)
X-Received: by 2002:a6b:440f:: with SMTP id r15mr13770158ioa.128.1637188701810;
 Wed, 17 Nov 2021 14:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20211117133110.2682631-1-vkoul@kernel.org>
In-Reply-To: <20211117133110.2682631-1-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Nov 2021 14:38:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQ+NteFBV0reov4nadZioBPsvuDdgd1gE0Pt+ojwevVQ@mail.gmail.com>
Message-ID: <CAD=FV=UQ+NteFBV0reov4nadZioBPsvuDdgd1gE0Pt+ojwevVQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi: qcom: geni: remove unused defines
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 17, 2021 at 5:31 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Commit b59c122484ec ("spi: spi-geni-qcom: Add support for GPI dma")
> added GPI support but also added unused defines, so remove them
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
