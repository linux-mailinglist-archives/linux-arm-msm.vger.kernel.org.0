Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40CCF6FC907
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 16:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235533AbjEIObS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 10:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235392AbjEIObR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 10:31:17 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265491BF
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 07:31:16 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-61b5de68cd5so27568036d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 07:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683642675; x=1686234675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap1sxPFyCXYHlrPI9PqKEsUisI28MkyI1OG4pKfon1Y=;
        b=g0B6ip26Tg7PJH77Re2G8e8fgLkjJg/V04T5j4/kwUMdUi/QaV1YaIP/RR0xD/Tdxe
         s1DA1PXD6nkC/08mFhxi4tKFCkD4iiLF24wDulMpp3krAEDgdpWjf6gt8RRl4AOg53sI
         CvWEXrgNSBkiqt5akH3KW9b3BzSjQ7wrpZk+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642675; x=1686234675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ap1sxPFyCXYHlrPI9PqKEsUisI28MkyI1OG4pKfon1Y=;
        b=FiT944t/UFBLOjnPjB8slwkBwRi0rgnf/5/u+Cs3qr9pUTRE35qek0MafixtvXiAhW
         ipkaW1p9yOymyXcN7bgjn3Om8mXFbpjA6zsaRnHxHlwOlWEAMDICNX1KAHgDZ9FlrxHW
         oE/jDS24Pm7M/Zouf0SjFNp1nf6ipJXIncnEef3qENb1wWMEepDTB5kTE+UY4gpHh00b
         3Vxqr1lVJfOipf7GSfB5BudaHH4ou5WFWq9TWegG9BM8spI5tK0zUBnM5tnttpJ26h9q
         f+SraRriWz7/4oarjWpChl2+AvjTKtNXW07Z3qyJrDd+p2B3Uv755ek7QxmpBNI1JzaK
         VYgA==
X-Gm-Message-State: AC+VfDwWOpVnbzz8wqPOXFyRKMBFlFwzXCp55ET+WeCVTJsnHAZ+ofAe
        xaIHtHkywX+fSyIWtrm44BIsrXU8J+7UV6/PHFY=
X-Google-Smtp-Source: ACHHUZ7qtPJakauzSBlWW1AKTWIzLN11Ut0RJdskS/SGG78+AwLrT4Gy4vphuYA8PEGYWXaPE7/K2Q==
X-Received: by 2002:ad4:5f0c:0:b0:5ea:9fc5:fca2 with SMTP id fo12-20020ad45f0c000000b005ea9fc5fca2mr21075724qvb.45.1683642674778;
        Tue, 09 May 2023 07:31:14 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id mk6-20020a056214580600b006212a3d8cc1sm812571qvb.32.2023.05.09.07.31.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 07:31:14 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3ef34c49cb9so160991cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 07:31:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1890:b0:3ef:330c:8f9e with SMTP id
 v16-20020a05622a189000b003ef330c8f9emr396501qtc.10.1683642371893; Tue, 09 May
 2023 07:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <1683626496-9685-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1683626496-9685-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 9 May 2023 07:25:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UNvsSP=ELt557e5MQ_vfeFgSYahNcR8Pykw+Kxxnd97g@mail.gmail.com>
Message-ID: <CAD=FV=UNvsSP=ELt557e5MQ_vfeFgSYahNcR8Pykw+Kxxnd97g@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Select FIFO mode for chip select
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com, quic_ptalari@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 9, 2023 at 3:01=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Spi geni driver switches between FIFO and DMA modes based on xfer length.
> FIFO mode relies on M_CMD_DONE_EN interrupt for completion while DMA mode
> relies on XX_DMA_DONE.
> During dynamic switching, if FIFO mode is chosen, FIFO related interrupts
> are enabled and DMA related interrupts are disabled. And viceversa.
> Chip select shares M_CMD_DONE_EN interrupt with FIFO to check completion.
> Now, if a chip select operation is preceded by a DMA xfer, M_CMD_DONE_EN
> interrupt would have been disabled and hence it will never receive one
> resulting in timeout.
>
> For chip select, in addition to setting the xfer mode to FIFO,
> select_mode() to FIFO so that required interrupts are enabled.
>
> Fixes: e5f0dfa78ac7 ("spi: spi-geni-qcom: Add support for SE DMA mode")
> Suggested-by: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
