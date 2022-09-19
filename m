Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29425BCCF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 15:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiISNW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 09:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiISNWW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 09:22:22 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADE4627C
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 06:22:21 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id a29so4450997pfk.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XBEHv8ghKU0ZkmO5aCePvI4i1EV0Le+oBtd2vt+taKo=;
        b=vBLtC+xCcV3zfXN2PeQHL6+pSEHW7C9jVtTYHon/W+wS7M/1zwQlZyiKlB2wyB4AV/
         BM+sH2Kbisj+Hlx+yuhsB9a0GcwKjTm1u8cyEwMYBoCzJhGoRKniGeXx4PzB9NTCOlkk
         ssSM4AwZn5iuSTBW7NplxwMyhxn69mBU2ZpBvrcZz5PBweV0qzIgt3SRloqgDClQ8C08
         +P/Itd4sjzjoKvBJ/ep4uKoeYgFF1sy7zKdwfXb8AbGD52YDWHY0Of13br7vlpnI8bFt
         9ZuqYlTtrVO1KJ3Qql+Q3GFnbGB6cWkB5/v0Q8Ps9JahGaXL089DgmB2AzCK117msMi4
         TMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XBEHv8ghKU0ZkmO5aCePvI4i1EV0Le+oBtd2vt+taKo=;
        b=1xL3kGQH5PHxPrgCXq+VeNDY/fUIS+EDCIIOwGXvyplEYt+UFutAqYwrCyjpET2XXl
         R3DSuGGRHJO2MzUJsWT2/f1vhTKKpHQe4h/XpkHywQqace2jBf+YliEo9U3xbjBc0A3l
         Po/G3z/t2iCe6HgV2I0UjcY5Ka0x+0r6oCaxXjgIBEeAscTSPvWFDinTXyDW7VWdlPj9
         yqDIiMU8AH0tQ1yqlqWfj7hN+BM3zm8gY23owCgEWzdEVkG+7eZNAWJ9MZleztu/+MSQ
         qMCIsYqT+5k3tgGFxd7CUEE2ZzBpcNbtMyM5O6dr4vKpjaWESbFz+viFzFZIkGC7IC5d
         zNIA==
X-Gm-Message-State: ACrzQf2hsCL91RJSnDUL58BbsL/fC6x7UUtaCRI4ypaHEDdBKWwD4Gif
        O3H0Y9M+r+QfPsitMJplR7d4aqLrdXyq9QqbyanejA==
X-Google-Smtp-Source: AMsMyM7VRhI9YdnRfz62PSK+fwQI96gHMYVt7kSw4Jq7YAX+9r8gA7/qgJwaA0Oh8DMDBFaKZlmma0A4PRjaKOz8uhU=
X-Received: by 2002:a63:e07:0:b0:429:8604:d9ad with SMTP id
 d7-20020a630e07000000b004298604d9admr15417800pgl.586.1663593740890; Mon, 19
 Sep 2022 06:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220916144329.243368-1-fabio.porcedda@gmail.com> <20220916144329.243368-2-fabio.porcedda@gmail.com>
In-Reply-To: <20220916144329.243368-2-fabio.porcedda@gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 19 Sep 2022 15:21:44 +0200
Message-ID: <CAMZdPi-hHph8Kuyq5Y-yAMt7BNHpLODnrEuC_zo2s64QCqrbGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: wwan: mhi_wwan_ctrl: Add DUN2 to have a
 secondary AT port
To:     Fabio Porcedda <fabio.porcedda@gmail.com>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, mani@kernel.org, ryazanov.s.a@gmail.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, dnlplm@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Sept 2022 at 16:43, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
>
> In order to have a secondary AT port add "DUN2".
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>  drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
> index e4d0f696687f..f7ca52353f40 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -258,6 +258,7 @@ static void mhi_wwan_ctrl_remove(struct mhi_device *mhi_dev)
>
>  static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
>         { .chan = "DUN", .driver_data = WWAN_PORT_AT },
> +       { .chan = "DUN2", .driver_data = WWAN_PORT_AT },
>         { .chan = "MBIM", .driver_data = WWAN_PORT_MBIM },
>         { .chan = "QMI", .driver_data = WWAN_PORT_QMI },
>         { .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
> --
> 2.37.3
>
