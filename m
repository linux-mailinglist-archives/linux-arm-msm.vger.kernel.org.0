Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE0454FEF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234370AbiFQU5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbiFQU5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:57:05 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557705DA56
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:57:04 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id s20-20020a056830439400b0060c3e43b548so3930263otv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=vMRFR0GXyCuyzUO1zmdvO0SdG3g9jDS3szGGSmZwvdo=;
        b=EoWrsaIdWmfmOGr1BtwEg2WSZK+OU+lG3deDCXDzb74IKSuCLjUw48r/Au0ZdFbBld
         CtADV5mdsqtHPiJQnM6grFYj+RXcVZ25BiaOF+SeT3sWq4i0Z9auBAbHmX9HOV5Xn+AO
         W4/IHFd1Zk/BzdQQ1hCIwfywNaHuB2eYr/RVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=vMRFR0GXyCuyzUO1zmdvO0SdG3g9jDS3szGGSmZwvdo=;
        b=x102t30+pDo6t80l7nTr4Va9ONdrSOFQtNL4TjXLLor0n50YUKuZLnAa3IdTMSrjy7
         b2kH/rcjN53CwmNny7DFi7eLNCJVVKly4L2m+MMw25Yysj8WpW2k1BafUw9JceS8CYLD
         yZL5e5Y8HJBPZroNnVFMW3XPHUzY5EL5xahzN3R9tUy+GlV3zx6HqeghpNa3xey8luF4
         Unk5mxTTcPW4oAuVz+l3DfhmJxAaF0F1neWfGq8BFWgTg6IJY/cY/clq4bTAcvb0VSK4
         VCUGyXxqBHHIkq/JciAKntSwOB/mf6ZtmnbvRtNOQzB5BtmSTTCcbpjnILg+WT6HOCUn
         PM+Q==
X-Gm-Message-State: AJIora88INlbbwv9Yj4N/+f99AA/5tdi4U9C01UoUhMxEI25dKe6VyJb
        zTdl0nvz9KNKdJ+Gtnp8rJ76xD4sC/xonXY/9zXFUA==
X-Google-Smtp-Source: AGRyM1sfzKoW9WyzAhvY11tv9iFwse5ymjpHxzBQ0uh1UWvv6lmB401+6sUT+IuSWkFK2+PScwaSfV3+9PXqLXqk5Zw=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr4760290otl.159.1655499423686; Fri, 17
 Jun 2022 13:57:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:57:03 -0700
MIME-Version: 1.0
In-Reply-To: <20220617103608.605898-4-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org> <20220617103608.605898-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:57:03 -0700
Message-ID: <CAE-0n50=Lbrs84oivqni0oBNk0KSY9yGvkYFXggekwVDQ80fyQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8996: add #clock-cells to the
 HDMI PHY node
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        linux-phy@lists.infradead.org
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

Quoting Dmitry Baryshkov (2022-06-17 03:36:08)
> Add #clock-cells property to the HDMI PHY device node to let other nodes
> resolve the hdmipll clock.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
