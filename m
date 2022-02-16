Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1AE84B7D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbiBPB5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 20:57:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235112AbiBPB5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 20:57:54 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BB27F6D8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:57:43 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id x193so1046255oix.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ZTvRSyO/qxdBQNSGL9ioAIGzVWwq5zlmxJWFNV0Wr20=;
        b=HWkZ5vwx6mfNm7n1oEfjdUBxUESzSpCu2CsLux7GU2KdSWXNU0jeYezuanMY6f2y5e
         hNS9w8SCmFlzTS9/iiJ23crC0cHF4VhHNHS30ToDRmvV+RcIDsiiRzh7uMf9dZw8re9L
         3E6EtMbGrKz+ChwbcCrxsB+Hw04fAQJsbMAGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ZTvRSyO/qxdBQNSGL9ioAIGzVWwq5zlmxJWFNV0Wr20=;
        b=SBmotmGDg6Q38o7gWPL5hhXNx8njTg+Rh/eBa8y6jdY4PPp31NwNrCFx7EG9A4TqX8
         vrKiW5kIwR9WSX2NdIz6jKnuWYlHpeLZcm48uUF7s/tR3SQbZYBkgHH+ebyTrLu2UpA0
         tl94Qf89yJh2o/bcQG/Yy/O8M21xBIfULs5BR1rh9nZ8h0iioFW2+2clVfTX6omOkSlc
         1UcGwWxQNpqGCSpHvEBMHIgJfbpQo2OEJmfdH+RIWvPeoKr8nFla1Oeh4TBZXpPZJmsx
         lqtDKuG7UBr5L0155UvLAdU23tN0FO6L7tzxMbVCqS4yXMxF2NDge1XAstMDwilQpSf9
         mECw==
X-Gm-Message-State: AOAM533Bs5aF9DGBYG+O2SvQBNt1qxHDZG+au5YF+MkyvKwX+8Zsauq0
        QJe0Sel7zuDJfvNrXSSAmZMi+c2ri4AZq7pQIG7dKg==
X-Google-Smtp-Source: ABdhPJzj73iDJin5F5rq+gKYnmF1uPigCaFPDoFUn1UpFRxX1o20jaMBpJ1kNDnX+e6MAm8LSl2NEdmpMhg/9cC7XAM=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr295838oij.112.1644976663351; Tue, 15
 Feb 2022 17:57:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:57:42 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org> <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 17:57:42 -0800
Message-ID: <CAE-0n51V=dDCU8QDmLigJMOevYKO0v6JwoTEB0ghpHM7OobubA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: drop bus_scaling_client field
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 06:16:39)
> We do not use MSM bus client, so drop bus_scaling_client field from
> dpu_encoder_virt.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
