Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9549A50679D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 11:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350332AbiDSJZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 05:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236434AbiDSJZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 05:25:24 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BF32A27C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 02:22:41 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u3so21584492wrg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 02:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p8P6IeNR1TwtrMg6RsrKfdY4Yo5Rygb5DfiPVUoKhK8=;
        b=by0FVyX6p0zMcvlQP3Y+c8K8TzgSgvcE5pyCF1vetrjvKiBQtCgOwo2ZZWote70zYk
         o9LMkdzdoRmlCNb2amRWJGhf1KdRzvw+TmHMwSj3jdMJksgGdAr/RMXpGiMyCbL3wax2
         91qaPs2u8lB9l4uXPjOarOfRvJX+DT5UFJGrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p8P6IeNR1TwtrMg6RsrKfdY4Yo5Rygb5DfiPVUoKhK8=;
        b=6LH8eyOXyehArCVvZJDvyQESYcCWVUFdyJD+WE0MOIxnnf4C+FLGRZ7Yg9pzxsthxX
         9ex6+RafBjBO+UahHScZ5Pacbfw4phzIaE080jDNiKvcesyl6kG6JwOPDsqNBjvqHvJE
         FSP9IZN6aooDSwjI7ViRkfM3ZzNfGA5nZ3+jl3y926d/XtD/hIrDP/FTQoBf+H0TC9Hq
         RDJMogvtagxFbyrwuO9XiYYzhk2cSqEiXI/boIhIm/gihxOC3ohjxneKSqlxe7zBCgL5
         jQkoDouFoZN7tvccHzU8WwZmoZRlVOyQ/rRLAwRl0/PJpYuM4xxngiOqdjkvd/D2Obmg
         O0TQ==
X-Gm-Message-State: AOAM531WR81aheTU1Xt3h2FyY51cvaZQe0CGqCldntdOPhe6+p+qknAI
        c8jYOpOy9izbizwwBuxNMyHGbUwlrUB+O1BtH763Hw==
X-Google-Smtp-Source: ABdhPJzFGn7LU0fqJ7O61lsvDaAZ/2DWIaGN8GbhlNMmxqCmPG3XLkxvdSi+ys256zE0obhK3F0PwBs+L0/P7lP7rrk=
X-Received: by 2002:a05:6000:18c1:b0:207:87dc:94b2 with SMTP id
 w1-20020a05600018c100b0020787dc94b2mr10927908wrq.437.1650360160433; Tue, 19
 Apr 2022 02:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <1649844596-5264-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1649844596-5264-1-git-send-email-quic_srivasam@quicinc.com>
From:   Judy Hsiao <judyhsiao@chromium.org>
Date:   Tue, 19 Apr 2022 17:22:29 +0800
Message-ID: <CAJXt+b9EKzJ6V2OxYwMiexw2sFhwc0U28XuerC7829ZuHAvghg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Update memremap flag to MEMREMAP_WC
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> -       buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WT);
> +       buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WC);
Should we replace the memremap() with other standard DMA buffer
allocation API like: snd_pcm_set_managed_buffer() ?
Thanks!
>
>         return 0;
>  }
> --
> 2.7.4
>
