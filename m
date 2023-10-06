Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A497BBF9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 21:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbjJFTO1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 15:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbjJFTO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 15:14:27 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475D1A2
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 12:14:25 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-532c81b9adbso4455311a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696619662; x=1697224462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmhUWZX30hXfIU80TyRy7axZSi3Eoh4Vptrv5M6pTXM=;
        b=WAt53QfLhYdq5q3IXyvQFKpgMsTDLGTwRlR0hwPEN5/zAQdr6PeGW78lH1017x3hoG
         8rF6do7ptSLKNdZi6ul3t2s4eGbPXpqmILZz4AqROBsUb7ahXiy3ipdtNRnJZS5gYu6f
         drFYOIN4cKTZN91IhObQxqJBwLJ44aJyoGjAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619662; x=1697224462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmhUWZX30hXfIU80TyRy7axZSi3Eoh4Vptrv5M6pTXM=;
        b=W6aTgL5sY18lUyMuD7lZJojmIuRBZtd95dXQLplhmQleC5t8aN+Z8ae/IRUJSmc4Bx
         tNJLjVXCvV1EJF1aKkrDH1YRJdSh/7LJ5iv6scCeh/FxC/tlf1xMTKGJxOLMNSpElpgi
         4WMllhtMyfDSgY8sE5jVhK+IP3IkVLpicrSEgdVtQ13EBDeYKmSnd39GT3a8ndT7ggcc
         PltPNdGjAmwtlvxOwIRt+5wnn08dosk4EkDNnpvA97IbWwWcBmsIv+EXr5rmIxvLbcX1
         010KnZ9LcEvULgLXkxkvqzzwwimIZ37XECQde9B8td9MEKaDbT227D0IywlVGs1EmFv3
         6yiQ==
X-Gm-Message-State: AOJu0Yx6mvbtxpcxghu25U8xKw4ydPT6FXidVMM0sv7MXyjug+VCnTXX
        4uLI5775Ioc2Sb3JMYDTXOiSZFl/QlOylgndVVlsycqi
X-Google-Smtp-Source: AGHT+IFyxyLBjOHS7zVpHf6weJComB/EYhlIcRt0hR/1EZNXiRFsJy3wpQGsIWQxYx1u7ZIX1HhU5Q==
X-Received: by 2002:aa7:dad2:0:b0:533:5e56:bef2 with SMTP id x18-20020aa7dad2000000b005335e56bef2mr8292799eds.10.1696619662137;
        Fri, 06 Oct 2023 12:14:22 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id h14-20020aa7de0e000000b00532eba07773sm2989960edv.25.2023.10.06.12.14.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 12:14:21 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso2317a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 12:14:21 -0700 (PDT)
X-Received: by 2002:a50:9b1d:0:b0:525:573c:643b with SMTP id
 o29-20020a509b1d000000b00525573c643bmr232878edi.7.1696619660110; Fri, 06 Oct
 2023 12:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <1696614170-18969-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1696614170-18969-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 6 Oct 2023 12:14:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ua-bDMvSj-FRWKxCm3oS4U-rqzd--g4UX_TBDF65rb5A@mail.gmail.com>
Message-ID: <CAD=FV=Ua-bDMvSj-FRWKxCm3oS4U-rqzd--g4UX_TBDF65rb5A@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Rename the label unmap_if_dma
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 6, 2023 at 10:43=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> The code at unmap_if_dma label doesn't contain unmapping dma anymore but
> has only fsm reset.
>
> Rename it to reset_if_dma accordingly.
>
> No functional change.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I guess perhaps technically this could have:

Fixes: 3a76c7ca9e77 ("spi: spi-geni-qcom: Do not do DMA map/unmap
inside driver, use framework instead")

...since before that commit it _did_ do the unmap, right? ;-)

In any case, this seems good to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
