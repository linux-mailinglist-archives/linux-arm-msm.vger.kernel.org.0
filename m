Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE6152C52C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 23:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242720AbiERU5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 16:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242699AbiERU5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 16:57:21 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCDD1D8102
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 13:57:19 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id n24so4133154oie.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6+Q6Ia54N+h/zYeULcAq/1r7inK8vu27VxH+3POr9pM=;
        b=FCfIeQDz7BEFc2r1x1Z4vqS879fyQaltiuhbDf7kyIEd01e9EjWvx8V2uS0KxqL2cg
         5/ooo7xWRr1jJIr5XJpmK+kAO0lupumix2aX+yD4rTulnRzInTvkOc4yJBq5JIoeAPDA
         O0GRoo1gzcQSR3ssnr/qC1+mGHSgg0b45C9bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6+Q6Ia54N+h/zYeULcAq/1r7inK8vu27VxH+3POr9pM=;
        b=KkNZ8TtDtisfiL2l0Il+DnEbb4E47xXVYyvAPHX2m2B1GVyBJ6ljAifKRD7HVvvpZG
         lbn9217XNN5zmtZrOAen2+I/mfNpWaB0O8v8JJ2FLzTkoyBnqdzTWPF43tUlWtYy39iE
         WiHwjL2DMZa0BkG3T+D/wuDMkm9F178X2O8JWhSUIxCrkOwstcU521IddQsZuACrxBpT
         q5YLynSfSCA5KMCZCHkR3H1DhAeVRP6DowgZPnCzjPKBVLTMT+QOdWvortyR5AoKDY87
         orXlMd5HYcyHiA5OYP1OamCQhtNCNjY67Pe021HGeQFlyt/HmE6r5WxaSA3HcUy7r/4c
         WHpA==
X-Gm-Message-State: AOAM531uJVVBL/MqKtDnqPoShoXVx8CZfzeHoG3uwjNlbQO1Llb8pEoJ
        IR2pO6ad7JIMJ+CvG552VUNSaj3g17I6zix0FRa2vA==
X-Google-Smtp-Source: ABdhPJwOntt7o/KNEDNeAfpwY3gBusWaODLEh84L1Zfcy+bCLj4aybWd7ofKRirQbZPT5O0ha6jImqVdDYDMAgS1OwE=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr796441oiw.193.1652907438996; Wed, 18 May
 2022 13:57:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:57:18 -0700
MIME-Version: 1.0
In-Reply-To: <1652905444-10130-4-git-send-email-quic_khsieh@quicinc.com>
References: <1652905444-10130-1-git-send-email-quic_khsieh@quicinc.com> <1652905444-10130-4-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 18 May 2022 13:57:18 -0700
Message-ID: <CAE-0n51VJZ-mq+9=YH1J-F7rv7-8eA6A3DxpSDPRvssppKPFqQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/msm/dp: delete vdda regulator related
 functions from eDP/DP controller
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-18 13:24:04)
> Vdda regulators are related to both eDP and DP phy so that it should be
> managed at eDP and DP phy driver instead of controller. This patch removes
> vdda regulators related functions out of eDP/DP controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
