Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BB47465DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 00:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjGCWys (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 18:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjGCWys (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 18:54:48 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69020E6B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 15:54:47 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-c5c8d00ced3so209817276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 15:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688424886; x=1691016886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn7vrbu5PqDTl7a51t/U7fc8ZrLjhxJkWnIqrCoiU4U=;
        b=JHDhTSNEp+9zhQtG4YcXd+5itchw7KMtzGCR/WqbH/Wo9oyj0oTY8/OB7a3E424ODh
         kKOFrBha6pLgOIVALJUWPSfARD/WeIFBBhRyZArS2vXBEk3WTZA3uMH5oO820xDX+PXh
         h2Z5gk3ut/1EnUagV/DSqR5/64A5hIlCkuNcuX1dJknUf/5JzR7SLgiyhSD/2fbIeBVF
         2BwhNXrqoEtVV6A8mxb/HGtPf1obvpvtLI90Ree+1NVNBl9J352ZshZxqHFjuiTxg3bJ
         Tt0uYqGBsktC9EUxRz+Wwu+gE6Te8sPujyWQFnBXgRxWsQMRiNHFEqClkEKSkVA9ja4E
         5rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688424886; x=1691016886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xn7vrbu5PqDTl7a51t/U7fc8ZrLjhxJkWnIqrCoiU4U=;
        b=QQtvJ4i/1DxlpDLHLQ7dbCVyOfghZDwmrwg/l2c88NAIzV4im77h+pzorfBSzh7gTP
         /mxc0i2w/l/Ty24EKugt/ljsUznaTYsIHKNRV/puz9qZSKoKN+TRdEC9lSPNyVqS1R2Q
         ZYoLTg/3sb6kKiptqyd67v6cFf1ImUf1zumfS8IiJ9BHAcC2Bf87G2pages0c+Z6iU55
         WU9awPV/rL3+Pi0usEbjlKz5K6KCOTlTlNcEIIu4hrP38J1OioCDxh4IYv/SZoBh3A0e
         2w1aObti7BZUD32Nv2NYeoMIEr4l5ArkZslBQpFbfeSb6WqSS86rT1IVYKrbCRrkJ7ZR
         MtqA==
X-Gm-Message-State: ABy/qLZB7nT33r2gnigLx+xPr6BdbnZstJ8BPjBY0e0AZp1HhX8eJeK4
        0UXWuq2fPA6evf15vDtA/Be2niTTP2MhlSxKzaULEg==
X-Google-Smtp-Source: APBJJlEouuF8/0ggK2G6w3HPfixNJv2NGicX8j6nANc49QLXr6neO8qeecRq3vcwS8pbfEtDLyvY14QIupaAIiJQacY=
X-Received: by 2002:a25:d0e:0:b0:c19:d3e:f629 with SMTP id 14-20020a250d0e000000b00c190d3ef629mr10625615ybn.58.1688424886624;
 Mon, 03 Jul 2023 15:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org> <20230628-topic-refgen-v3-4-9fbf0e605d23@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-4-9fbf0e605d23@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 01:54:35 +0300
Message-ID: <CAA8EJpp3TaNikf7=y1AS7vM99jHEKYS0Cmy2AbqUAx3DvYmovA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/dsi: Hook up refgen regulator
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 3 Jul 2023 at 21:16, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Consume the refgen supply on configurations that may use it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed--by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
>  1 file changed, 2 insertions(+)

-- 
With best wishes
Dmitry
