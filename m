Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D2B706AED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 16:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbjEQOSm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 10:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjEQOSl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 10:18:41 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F225FDA
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 07:18:35 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-61b5a653df7so6817016d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684333113; x=1686925113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeihledOH06fF9rXlghvkbkJKeeeuSIzbFVA64CPmJo=;
        b=BJhF72OgxhA9w3gBY1guoV959YY4b6jgV78Tac/3G6eOxbRWJ7ICg7D2u+p4Yzqp9Y
         ubxGJ0Ped7udr+Dubp4BEg6gZPHQqLg17dT+HAfGhFygU+HV2PjrohHQmtBG2n5fjcDr
         59/5XG0QVYs36f7QdVwQIBWVREzsqq3Mzjx4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684333113; x=1686925113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeihledOH06fF9rXlghvkbkJKeeeuSIzbFVA64CPmJo=;
        b=JgMMu3Z2idFBsn+BUAP7y8VIrYCs+rSFeqPPuaNiE5T9u6zQlgWbOdP1QLcOvY/TA6
         ptyhGAGyI/spoT5DEnfsZ/zDjKlmVAIIWDDFwSW6S8LB1afmhq5g+Z8t1QIMZ5rMpkxY
         TQ8xezIiCohdUOj1yElrVggnjl/7VkezRvXiIGHMfLSxHmyVVEPYGaKIybrwhqsgmB8e
         4vhhDs/ORBmfoOTOCig83i/kdc8cI7Ox9OPKWeywEI7/tixybIF6h95uy6dbgUhsP9V9
         joNtW11vX2K5i0oWXt/VpZQtMp9pFktKEB3yk0sS2aTPYa12PDdNtbZWb4qZOFloM/+E
         hU2w==
X-Gm-Message-State: AC+VfDxhX3vXXPRoZoyoheRnTjbyReQLG28yvyHIMr4138Gk6C5J7wDE
        y3bwg/6LlnPvcPf4cL8rAILDWx4msqzlyqLcibk=
X-Google-Smtp-Source: ACHHUZ73vN4mRhxY4JpW8LrCok2Iwhu/YTRPcegqmxcnrdOE34HiMevl4UgeQwOnGGFqo1d94YIfZw==
X-Received: by 2002:ad4:5ecf:0:b0:61b:5c2a:f299 with SMTP id jm15-20020ad45ecf000000b0061b5c2af299mr70112417qvb.21.1684333113102;
        Wed, 17 May 2023 07:18:33 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id f3-20020a0caa83000000b0061b745ebb78sm6376191qvb.110.2023.05.17.07.18.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 07:18:31 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3f396606ab0so187131cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 07:18:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1892:b0:3ef:a55:7f39 with SMTP id
 v18-20020a05622a189200b003ef0a557f39mr358230qtc.12.1684333109945; Wed, 17 May
 2023 07:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <1684325894-30252-1-git-send-email-quic_vnivarth@quicinc.com> <1684325894-30252-2-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1684325894-30252-2-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 May 2023 07:18:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xbx9h3B1u5NcK7XeEKWC30pn=AWYToqYbAs+oNrV+7Ww@mail.gmail.com>
Message-ID: <CAD=FV=Xbx9h3B1u5NcK7XeEKWC30pn=AWYToqYbAs+oNrV+7Ww@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: geni-se: Add interfaces
 geni_se_tx_init_dma() and geni_se_rx_init_dma()
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

On Wed, May 17, 2023 at 5:18=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> The geni_se_xx_dma_prep() interfaces necessarily do DMA mapping before
> initiating DMA transfers. This is not suitable for spi where framework
> is expected to handle map/unmap.
>
> Expose new interfaces geni_se_xx_init_dma() which do only DMA transfer.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v1 -> v2:
> - interfaces to take dma address as argument instead of its pointer
> ---
>  drivers/soc/qcom/qcom-geni-se.c  | 67 +++++++++++++++++++++++++++++-----=
------
>  include/linux/soc/qcom/geni-se.h |  4 +++
>  2 files changed, 53 insertions(+), 18 deletions(-)

Mark and Bjorn will have to coordinate how they want to land this,
since normally patch #1 would go through the Qualcomm tree and patch
#2 through the SPI tree. In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
