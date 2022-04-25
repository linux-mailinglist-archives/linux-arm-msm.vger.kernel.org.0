Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1030150E9F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 22:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbiDYUOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 16:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245140AbiDYUOb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 16:14:31 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092F3EDB55
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 13:11:23 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id e189so18389565oia.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 13:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Mjic/+zJme8zynP2sX08SrHAg/3yMfrQ4Fx00iF0fX0=;
        b=YFgrUyczjyRzM90CDf5/Q+sTl7Kk/h/LjwzwpqWYXv8MY6Ga3wHBTtJbp4NrHlrftw
         bnW+y73vDjwcQZmAoJZZRdXVMvoZOcrRQGqlI+V9gNKnqrvxEAUaR0vvfMW+3XTxIAi0
         S42sLU1a7TGGtIAvPUaN1sh2Nl4dEk/2gxGYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Mjic/+zJme8zynP2sX08SrHAg/3yMfrQ4Fx00iF0fX0=;
        b=VT+PyJeMrUmj1ujdiE95TdffjMnNZ+GnMP4DKTuQD3BwH5vj9+m0SCNymM4fPfANCy
         Mx/T28Rpe/AHkMmkBkuHId5j1ttNhoDWcNB5WPxw/cWxNNajVkXtV2XeKanwuHMlSCQS
         CP86mBk9TiMlZCeNZzSp7UZkCHhAHnuQ1Fm+l/GSMLmqR09fqhg8XejsmCZ/Extz7d74
         lr1o6/VGcMQLWMzizPLDng6FYxjeefWg0kCLdf+ByBEcPVEHVF17rPmLFrLE19ULfdwZ
         CYCEkFmKxlRYV0Qpdtl387qqvDGk1QcUYFpJR7ZQfemSLktqlmaLgAxLIagJG1WGRreT
         1xIA==
X-Gm-Message-State: AOAM531fAuOnyfdZOYg+s69FjWgTfTEOQdRgLCrzjmnjvjKYVUeXNIG6
        pdk6kjCcgIw8eiZQpsvJKo/xw7IiaC6c5ZIvl4J+3Q==
X-Google-Smtp-Source: ABdhPJxsMQaEqd9ibkQQl1fMlnDAr7kXgMYwl7tspORWVrkHPLW8+XsZ5FMAITRuX/xmgDJGyjvQ9czYe2KUg+TvZD8=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr5230521oiw.193.1650917482697; Mon, 25
 Apr 2022 13:11:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:11:22 -0700
MIME-Version: 1.0
In-Reply-To: <20220425091831.3500487-1-lv.ruyi@zte.com.cn>
References: <20220425091831.3500487-1-lv.ruyi@zte.com.cn>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 25 Apr 2022 13:11:22 -0700
Message-ID: <CAE-0n53xBM+n__eKKGaCuB+3Ea4O+rNk2PUQbD2bjW3JS7YJBA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
To:     cgel.zte@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run
Cc:     robdclark@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org,
        angelogioacchino.delregno@collabora.com,
        daniel.thompson@linaro.org, linmq006@gmail.com,
        christophe.jaillet@wanadoo.fr, lv.ruyi@zte.com.cn,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting cgel.zte@gmail.com (2022-04-25 02:18:31)
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return a negative value anyhow, so never enter this conditional branch.
>
> Fixes: f6a8eaca0ea1 ("drm/msm/mdp5: use irqdomains")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---

This one fixes a commit that moved away from platform APIs!

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
