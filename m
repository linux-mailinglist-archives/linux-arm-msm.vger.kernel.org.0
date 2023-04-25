Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2EA6EE473
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Apr 2023 17:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234436AbjDYPH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 11:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234404AbjDYPH0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 11:07:26 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9053259DC
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 08:07:24 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-32ad0eb84ffso15197715ab.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 08:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682435242; x=1685027242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpYAGainFDoBezMAz2LIC0vmyd867yd+Zieo+NHOeqA=;
        b=JPHtlFSiQLQnKeb7TxFoE1q3rU7exdTzXYAXxnAA5b6Tm6o4O7aPZlFiOlSxwoviHY
         zhPWugfMD0te18c5UWjN2JVJEl2CfHMiPHna2z6ohig0evNHnA/dyT007/ICHbPdPU9m
         27QdZ5nByZnOWSob8NxsCwxafN5A/VKmdkVHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682435242; x=1685027242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpYAGainFDoBezMAz2LIC0vmyd867yd+Zieo+NHOeqA=;
        b=lwuzXNlYS5uIl1scyPxS4cHBbV6JRyfQ4F3ug6u8ooFMa3cehiCAT5C8/57YUmM0cR
         SpAWb0RUnNh/zVa/zltLmqlOiI3MRRh72zswLWpXmK7XCrQtdJG22VeXzn8rGzi2CuSK
         WiGpbnW6DvQ8daS42vd8p94xF4lZSqJz3zYgkFenmkXCS98soC8l/u9JA5SFdbkB+6Gp
         y6MGly0eHmgcs4fALAx5uqC6bpaLctjW9ufPLgbkkZktLAa0HKJTl6JFTk9jtxl8CCUX
         B2olynFYL1U/2588e5ToaUxrQzEqYDtvDUABsH+Hy9VBn5siV9MOkseOD1jWe5a+ewKR
         PQ0g==
X-Gm-Message-State: AAQBX9cOBi3VnogwvBos8pD5JwzolIajEtTaT9lhtpXFhMD4Wc+Px028
        wOPlNlhEvWQe1Ji1mzVs90kszslCY7hYxDjV+uc=
X-Google-Smtp-Source: AKy350Y62YCC73TRNmCWt/d2PwTzpziKMfR5HnjvthrCbKWE2Ref0kYXNKEo1qRmlN+I+nCZqcpjXQ==
X-Received: by 2002:a05:6e02:152:b0:32b:4cdc:d0cf with SMTP id j18-20020a056e02015200b0032b4cdcd0cfmr6964136ilr.3.1682435242334;
        Tue, 25 Apr 2023 08:07:22 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id cx27-20020a056638491b00b0040fa19472bcsm4130361jab.92.2023.04.25.08.07.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 08:07:19 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-329577952c5so88445ab.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 08:07:18 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d96:b0:32a:dc6a:3b97 with SMTP id
 h22-20020a056e021d9600b0032adc6a3b97mr320927ila.0.1682435237664; Tue, 25 Apr
 2023 08:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <1682412128-1913-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1682412128-1913-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Apr 2023 08:07:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UKpe2rixisrp213w57dF6zgFK909v1-inTNXiu=FVLjA@mail.gmail.com>
Message-ID: <CAD=FV=UKpe2rixisrp213w57dF6zgFK909v1-inTNXiu=FVLjA@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Correct CS_TOGGLE bit in SPI_TRANS_CFG
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 25, 2023 at 1:42=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> The CS_TOGGLE bit when set is supposed to instruct FW to
> toggle CS line between words. The driver with intent of
> disabling this behaviour has been unsetting BIT(0). This has
> not caused any trouble so far because the original BIT(1)
> is untouched and BIT(0) likely wasn't being used.
>
> Correct this to prevent a potential future bug.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index ba7be50..8a7d1c2 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -35,7 +35,7 @@
>  #define CS_DEMUX_OUTPUT_SEL    GENMASK(3, 0)
>
>  #define SE_SPI_TRANS_CFG       0x25c
> -#define CS_TOGGLE              BIT(0)
> +#define CS_TOGGLE              BIT(1)

Looks right to me from the datasheet I have access to. It's definitely
specified in an odd way on the datasheet, which lists bit 1 as this,
bit 2 and 3 as reserved, but bit 0 is absent. ...but seems like this
is really supposed to be 1.

I guess this never mattered because all we ever did was clear the bit
at init time and it must have already been cleared? ...and, of course,
on many Chromebooks we moved to just using a GPIO...

Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for
GENI based QUP")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
