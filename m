Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8D46648E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 19:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239101AbjAJSQB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 13:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239080AbjAJSPi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 13:15:38 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73863D45
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 10:13:30 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id c34so18920188edf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 10:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E971UMGcXwgaAFeIMfskNyBawiDJacixiUkz6okj188=;
        b=n6Y61za4DxKZcQVv04jf0Kgy/LIVUVbd4dG6UI8Zy/mgSnLr8dFB94wEL3D8vJWy07
         3fYwMJAyasn8+fgepgopiyJW5gT0JlyNIYGnbYYZqaf89dLtI/Ckiz+e9CVeijhxne3B
         1CEL/s/UaNtXnjR9P/8nONCzQPlb7gMzuzSB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E971UMGcXwgaAFeIMfskNyBawiDJacixiUkz6okj188=;
        b=DdzGre6tzDUo8b7xC3k6ZSP3iL4pbrsrvqsREoU7gKEtAYGuk7r/YB+4SLb5l7w5pM
         uZX7qvOZalUg1JB++FvpWxCSI9uKW88n+5sj2Th6JqJ8hOPkZp7pzCKXAkVoX+JS+rS1
         TVSj+ZbLLFJdGfg2wSYLbs0LdpdG0fuBHcF6YYp59wFuzAroajG7wH2mi/7iPmbIC59X
         dkSWmmxKZiBv4lBZCZ9NiE/P3HL+Yf/IQqXk5acCSFimohK9biMUcDLXx+H039w0Ts1R
         6/jZpZ1tmMadmU0VpXQt4WaNLvxG/RuKO6OjYseQAKC8JHPK3PtjNmull/8h8G1db2Tb
         WQKw==
X-Gm-Message-State: AFqh2kq5rxRleLeOD69Wjb4GSqN1QaAqoPhxJd9F4JcqrFedsgGBnat5
        mM13P/kshU/ZvVH8eOUv8ozWUTlEKrgfgzNcDsQ=
X-Google-Smtp-Source: AMrXdXtixYPKJyZVVcylJlatdMZHFlgjYle/7rJxKP+e4NrDDCJz4qZsrCBYuDptNxK2ZJTEmcbVlQ==
X-Received: by 2002:aa7:c04f:0:b0:499:376e:6b31 with SMTP id k15-20020aa7c04f000000b00499376e6b31mr9559110edo.29.1673374409000;
        Tue, 10 Jan 2023 10:13:29 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id i12-20020aa7dd0c000000b0047021294426sm5132474edv.90.2023.01.10.10.13.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 10:13:27 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id co23so12692642wrb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 10:13:27 -0800 (PST)
X-Received: by 2002:a5d:6ad0:0:b0:2bc:da90:2ab8 with SMTP id
 u16-20020a5d6ad0000000b002bcda902ab8mr99344wrw.659.1673374407473; Tue, 10 Jan
 2023 10:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20230110025006.10409-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230110025006.10409-1-jiasheng@iscas.ac.cn>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Jan 2023 10:13:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V5DDNtmpLRDGgSx1YVbd8UqTpcYFmvSAxFczn_JY+VmQ@mail.gmail.com>
Message-ID: <CAD=FV=V5DDNtmpLRDGgSx1YVbd8UqTpcYFmvSAxFczn_JY+VmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Drop the redundant fail label
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     dmitry.baryshkov@linaro.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, marijn.suijten@somainline.org, vkoul@kernel.org,
        marex@denx.de, vladimir.lypak@gmail.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 9, 2023 at 6:50 PM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> @@ -1954,9 +1949,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>
>         msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>         if (msm_host->irq < 0) {
> -               ret = msm_host->irq;
>                 dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
> -               return ret;
> +               return msm_host->irq;

The dev_err() is no longer printing the right value of "ret" above.

Other than that this looks reasonable to me. Feel free to add my
Reviewed-by tag once the above bug is fixed.

-Doug
