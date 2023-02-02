Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97FD46879B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 11:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbjBBKDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 05:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbjBBKDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 05:03:04 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8445B3AAE
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 02:02:58 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4a263c4ddbaso20175877b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 02:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yJzW53IuloyduIjuDpeyHuvtPwbWveSeqDHuN025brk=;
        b=Vks3Bu67QVtaZjqKEf8VZXwCPQADEPehhWMW7nERW8os1q6BoKGZqlPJTx8hfSzRHU
         y0+pubSYKycw87QukXP7xxV3m88miJ+fYEibbpDN3Vg0bLUXcujLTkdtrGQ6YNAvjZQT
         xkyC+CxEm06wtkfExPFUMuDANE7A/M319en6ITK7iKrCjXwmihiwEuQ/pkczMIZlXDfc
         OT/DgiPuX7DqtAKIIiS9u6BG2mkeR0xpX3AQtoxXXY7/KL3y/nREt3Ld9Zu0x/crL+oY
         nCEmF9wduI3ahiUvWj/WVIvQ1/7Hv3IbGemo65x5RGQZ1WI9C7feMGLG1RmDpFOn0BN9
         /zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJzW53IuloyduIjuDpeyHuvtPwbWveSeqDHuN025brk=;
        b=4gn1soGMnNKQuBHQG6/V0IO0SFYDSf+zICH39LzJrZ6tLzCEi0woiT6ksYKfOC9rRH
         3tOuPJ90EMGSFnh/yPMAXqQRZvGm/h4DhYwtIYoBH/BIgJoSGMrhgF1DQ8LSZMUdMjss
         R6QBdWrtj79Wb8U7r7W/VcvvZik6QQPMumtNFAmY+6rKfw6XoZk2wdyqukeEV8KLL7sJ
         tyoApUcJsaqdlgWR5yWrOK93Obp9d+3XBcLMKklzbk4LyZF/gEtVlCvXspWkBOudAnfW
         aDd7PT3H5d4EWHQDFnyLNL12ZV/6OmvIU5eobG1BcJ7XRwj84RX6wYljj6DPx/2rM2XY
         b1MA==
X-Gm-Message-State: AO0yUKV9q7oLY2G2xQ8xred+/0Vk2vJLaiDNr0JdgiGFUt+zbGAoKCO6
        umeFoj6yBQeALSNPguIajOdRW82HAeV5FDR/n0uVe1aHfT4gZg==
X-Google-Smtp-Source: AK7set+gzkLWtXfxrJHJOEXhQHzI1CPd49w2oBTe+ZpCeOcmyFbqbUKwWlFvdxMCpYWpRAY0ZDPw6WpQPDBhtxPbgI8=
X-Received: by 2002:a0d:dfd6:0:b0:51b:1df9:ebac with SMTP id
 i205-20020a0ddfd6000000b0051b1df9ebacmr661975ywe.138.1675332177717; Thu, 02
 Feb 2023 02:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20221115121237.28361-2-quic_vboma@quicinc.com> <20230202064712.5804-1-quic_vboma@quicinc.com>
In-Reply-To: <20230202064712.5804-1-quic_vboma@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Feb 2023 12:02:46 +0200
Message-ID: <CAA8EJpomzsY+mgjVzpTG3tn+UGtUufEesM1QJcJS4ZK6thQkCQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/1] Fix for VP9 DRC and Decoder STOP issue.
To:     quic_vboma@quicinc.com
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Feb 2023 at 08:47, <quic_vboma@quicinc.com> wrote:
>
> From: Viswanath Boma <quic_vboma@quicinc.com>
>
> Tested the changes on v5.15 and v5.4 kernels .

Please test your patches properly. It is 6.2-rc already.

> For testing Chrome Utilities were used .
>
> Viswanath Boma (1):
>   venus: Enable sufficient sequence change support for sc7180 and fix
>     for Decoder STOP command issue.
>
>  drivers/media/platform/qcom/venus/core.h       | 18 ++++++++++++++++++
>  drivers/media/platform/qcom/venus/hfi_cmds.c   |  1 +
>  drivers/media/platform/qcom/venus/hfi_helper.h |  2 ++
>  drivers/media/platform/qcom/venus/hfi_msgs.c   | 11 +++++++++--
>  drivers/media/platform/qcom/venus/vdec.c       | 12 +++++++++++-
>  5 files changed, 41 insertions(+), 3 deletions(-)



-- 
With best wishes
Dmitry
