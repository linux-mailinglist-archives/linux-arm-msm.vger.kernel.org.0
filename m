Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 680CF73008C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 15:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245161AbjFNNt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 09:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245156AbjFNNt4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 09:49:56 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD19180
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 06:49:53 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98281bed6d8so58821566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686750591; x=1689342591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FILJiyQHr5q7+MBxGqKh2YR7IQjtgWRJYztSUT5XOE4=;
        b=JKND40dTetSmvfX4bWRAib77G5F/txnMDmpCKOXxTxP7jVFpmBaS9mTJ9xpmzeBaZ2
         nfAolQOAgP79n4Q+9gDVn+CWht0W0foOB4Cfm2aTNJJiP2JEKCuMQ/FWs8oXXov+IzVu
         r5YJZoCVYRKY/CqOP9SNv+0H5NhN+f3P099HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686750591; x=1689342591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FILJiyQHr5q7+MBxGqKh2YR7IQjtgWRJYztSUT5XOE4=;
        b=e77vJyh8kE/km2khzQzgCileDvV40yXw92aSZaQRwyftrcciugwZ6USWzz70ug4epL
         Sg7YdL47IIsf/B25Nah3m5VEBRKZnu/6JmlIb1i6pyaD1eAexabZUze9/G+dNkd3qHI6
         /IdZFxKCoEmfbEC6oMO7QkbEalOvQBfpGwdLNsCbM3haF7BXnS8Px6aPbdBHX2JNgI4e
         Sr3pDpY53NLTNMO1tJWn9H74bbJwSdqSqYl8qRklw6e9Evxy4GC8mylAXAtg/+X+Eq39
         Whrrc1QxrsYsGR97bKfX+CKgow6kae+ZXbnmqABrpJpNikATvvkch20UoH2F19yem9rY
         hZtA==
X-Gm-Message-State: AC+VfDz/E8nx1ABIlEjH4I3ex01FBTmq+1Zr5Y2mNWiDaVLEFNrlWz/Y
        YZ9/4hIM4i6gAyQVjqavyZgCA9RMJp3nRdDwGAm3V8b9
X-Google-Smtp-Source: ACHHUZ5bePoE5YGu1FRCjJ1Cv7imCH2i/MMA7qEK0BaYjoQifYo/8vn2dif9ziv4LtUX2bhWjcrx+g==
X-Received: by 2002:a17:906:99c1:b0:973:ca9c:3e43 with SMTP id s1-20020a17090699c100b00973ca9c3e43mr17478112ejn.45.1686750591215;
        Wed, 14 Jun 2023 06:49:51 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a13-20020a170906684d00b0096f7500502csm8055641ejs.199.2023.06.14.06.49.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 06:49:50 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-516500163b2so8317a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 06:49:50 -0700 (PDT)
X-Received: by 2002:a50:f61e:0:b0:514:92e4:ab9f with SMTP id
 c30-20020a50f61e000000b0051492e4ab9fmr85010edn.7.1686750590163; Wed, 14 Jun
 2023 06:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <1686742087-30731-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1686742087-30731-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Jun 2023 06:49:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URVjgZtZ1Dyc521KTdAN1GJ700vAAJgUtvSA5UkhnTig@mail.gmail.com>
Message-ID: <CAD=FV=URVjgZtZ1Dyc521KTdAN1GJ700vAAJgUtvSA5UkhnTig@mail.gmail.com>
Subject: Re: [PATCH v2] soc: qcom: geni-se: Do not bother about enable/disable
 of interrupts in secondary sequencer
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 14, 2023 at 4:28=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> The select_fifo/dma_mode() functions in geni driver enable/disable
> interrupts (secondary included) conditionally for non-uart modes, while
> uart is supposed to manage this internally.
> However, only uart uses secondary IRQs while spi, i2c do not care about
> these at all making their enablement (or disablement) totally unnecessary
> for these protos.
> Similarly, select_gpi_mode() also does disable s_irq and its useless agai=
n.
>
> Drop enabling/disabling secondary IRQs.
> This doesn't solve any observed problem but only gets rid of code pieces
> that are not required.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v1 -> v2:
> - apply similar changes to select_gpi_mode()
> - modified commit message accordingly
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
