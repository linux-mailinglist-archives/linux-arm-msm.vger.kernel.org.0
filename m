Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7119543F08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 00:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236200AbiFHWO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 18:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236504AbiFHWO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 18:14:57 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A59B31512
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 15:14:55 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-fb6b4da1dfso11014147fac.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=4+3RQXUOPtCpLvkD/U0erPbjIdgGtkmXEv+DgUOZHBk=;
        b=kD5nxNFk80W+73EVv5maekxoUggnhB7L4tjOpUL4RRMV5c6rh/qT1Rt1SrPD6LfQi+
         Spbena1c1XCLUDtW8Sh5BOJhqkJRyiGnBFMLU3M2EgtcdLie4f4a7td17XlNsz7/RUnl
         PfqlebSOrrHdXbIIVyL4gF+Qo070/pnIZmwd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=4+3RQXUOPtCpLvkD/U0erPbjIdgGtkmXEv+DgUOZHBk=;
        b=1vBamMtSp5dWJLUrvinL9zNnxFeJxctJ9A1d8nkDALcB23+wCyGDlG1II6GG6bGq0P
         ZONaAYlgiX9GctACxVrL6dRtK6q665lE3FFSLIDTpu3QZJflAZRM6h6n5KGlmt3qfIrF
         R5mO65TGoqvqfMlr1AVkokzaPNvpLIBc6Af20aKUQDPNf+j8C9by3MhTMX+xkuLE3VzO
         MvWbg9Y8NGmnGljZdMcoJVWoRF1Vdfk5IeNKOX2FD+7HoLhU1p9NGQeK0zY1AuBLu1GT
         mtUD85kXriRUeEa/iHmwhkotfwgwyPC4c42JR8zzkVwrcDPYH/GYrivk8NE/OiqsEsmB
         sdSg==
X-Gm-Message-State: AOAM533GY28XUrf9zC/sCEjH6FtQTxpmNSVebsXBwmq+A13MzUtFLyTk
        tENH8UwuLEcv4w2Cfed2Cxke3E6VFz42AokR1WSEhg==
X-Google-Smtp-Source: ABdhPJyqsGvOKTE4uunfCR1Mb+T+23hK+RV3b+F13PhuhOCuTw0rP+YUQOmxZHfZGkHHt9+RtkGFHec2aKtLrzEwEeo=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr85785oap.63.1654726494871; Wed, 08 Jun
 2022 15:14:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 15:14:54 -0700
MIME-Version: 1.0
In-Reply-To: <20220607110841.53889-1-linmq006@gmail.com>
References: <20220607110841.53889-1-linmq006@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 15:14:54 -0700
Message-ID: <CAE-0n52aJC_LzT_cYxQXKEpcE58YqCbT7jW0iEaaxtbW9jL4jg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
        Sean Paul <sean@poorly.run>, Xu Wang <vulab@iscas.ac.cn>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Miaoqian Lin (2022-06-07 04:08:38)
> of_graph_get_remote_node() returns remote device node pointer with
> refcount incremented, we should use of_node_put() on it
> when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
